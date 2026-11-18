unit FMXBridge.GIF.Decoder;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Types,
  System.Generics.Collections,
  System.UITypes,
  FMX.Graphics;

type
  EFMXBridgeGIFError = class(Exception);

  TGIFColorTable = array[0..255] of TAlphaColor;

  TGIFFrameData = record
    Left: Integer;
    Top: Integer;
    Width: Integer;
    Height: Integer;
    DelayMS: Cardinal;
    Disposal: Byte;
    TransparentIndex: Integer;
    HasTransparency: Boolean;
    PaletteCount: Integer;
    Palette: TGIFColorTable;
    Pixels: TBytes;
  end;

  TGIFDecoder = class
  private
    FWidth: Integer;
    FHeight: Integer;
    FBackgroundColor: TAlphaColor;
    FFrames: TArray<TGIFFrameData>;
    FLoopCount: Integer;
    procedure DecodeBytes(const AData: TBytes);
    function GetFrameCount: Integer;
    function GetFrameDelay(AIndex: Integer): Cardinal;
  public
    procedure LoadFromFile(const AFileName: string);
    procedure LoadFromStream(AStream: TStream);
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    property FrameCount: Integer read GetFrameCount;
    property LoopCount: Integer read FLoopCount;
    property BackgroundColor: TAlphaColor read FBackgroundColor;
    property FrameDelay[AIndex: Integer]: Cardinal read GetFrameDelay;
  end;

  TGIFCompositor = class
  private
    FDecoder: TGIFDecoder;
    FFrameIndex: Integer;
    FRestorePixels: TBytes;
    FRestoreBytesPerPixel: Integer;
    FRestoreRect: TRect;
    procedure IncludeDirtyRect(var ADirtyRect: TRect; const ARect: TRect);
    procedure ApplyPreviousDisposal(var ADirtyRect: TRect;
      var ABitmapData: TBitmapData);
    procedure SaveRestorePrevious(const AFrame: TGIFFrameData;
      var ABitmapData: TBitmapData);
    procedure DrawFrame(const AFrame: TGIFFrameData; var ADirtyRect: TRect;
      var ABitmapData: TBitmapData);
    procedure FillRect(const ARect: TRect; const AColor: TAlphaColor;
      var ABitmapData: TBitmapData);
  public
    constructor Create(ADecoder: TGIFDecoder);
    function RenderFrame(const AIndex: Integer; ABitmap: TBitmap;
      out ADirtyRect: TRect): Boolean;
    property FrameIndex: Integer read FFrameIndex;
  end;

implementation

uses
  System.Math;

const
  GIF_EXTENSION_INTRODUCER = $21;
  GIF_IMAGE_SEPARATOR = $2C;
  GIF_TRAILER = $3B;

  GIF_EXTENSION_GRAPHIC_CONTROL = $F9;
  GIF_EXTENSION_COMMENT = $FE;
  GIF_EXTENSION_APPLICATION = $FF;
  GIF_EXTENSION_PLAIN_TEXT = $01;

  GIF_DEFAULT_DELAY_MS = 65;

type
  TGIFByteReader = record
    Data: TBytes;
    Position: Integer;
    function ReadByte: Byte;
    function ReadWord: Word;
    function ReadBytes(const ACount: Integer): TBytes;
    function ReadSubBlocks: TBytes;
    procedure SkipSubBlocks;
    function EndOfData: Boolean;
  end;

  TGIFGraphicControl = record
    Disposal: Byte;
    DelayMS: Cardinal;
    TransparentIndex: Integer;
    HasTransparency: Boolean;
  end;

function TGIFByteReader.ReadByte: Byte;
begin
  if (Position < 0) or (Position >= Length(Data)) then
    raise EFMXBridgeGIFError.Create('Unexpected end of GIF data');

  Result := Data[Position];
  Inc(Position);
end;

function TGIFByteReader.ReadWord: Word;
var
  LLow, LHigh: Byte;
begin
  LLow := ReadByte;
  LHigh := ReadByte;
  Result := Word(LLow) or (Word(LHigh) shl 8);
end;

function TGIFByteReader.ReadBytes(const ACount: Integer): TBytes;
begin
  if ACount < 0 then
    raise EFMXBridgeGIFError.Create('Invalid GIF block size');

  if (Position < 0) or (Int64(Position) + ACount > Length(Data)) then
    raise EFMXBridgeGIFError.Create('Truncated GIF data');

  SetLength(Result, ACount);
  if ACount > 0 then
    Move(Data[Position], Result[0], ACount);
  Inc(Position, ACount);
end;

function TGIFByteReader.ReadSubBlocks: TBytes;
var
  LScanPosition: Integer;
  LTotalSize: Int64;
  LBlockSize: Integer;
  LOutputPosition: Integer;
begin
  LScanPosition := Position;
  LTotalSize := 0;

  // First pass: validate the sub-block chain and calculate the total size.
  while True do
  begin
    if LScanPosition >= Length(Data) then
      raise EFMXBridgeGIFError.Create('Truncated GIF data');

    LBlockSize := Data[LScanPosition];
    Inc(LScanPosition);

    if LBlockSize = 0 then
      Break;

    if Int64(LScanPosition) + LBlockSize > Length(Data) then
      raise EFMXBridgeGIFError.Create('Truncated GIF data');

    Inc(LTotalSize, LBlockSize);
    if LTotalSize > High(Integer) then
      raise EFMXBridgeGIFError.Create('GIF data block is too large');

    Inc(LScanPosition, LBlockSize);
  end;

  // Second pass: allocate once and concatenate all data blocks.
  SetLength(Result, Integer(LTotalSize));
  LScanPosition := Position;
  LOutputPosition := 0;

  while True do
  begin
    LBlockSize := Data[LScanPosition];
    Inc(LScanPosition);

    if LBlockSize = 0 then
      Break;

    Move(Data[LScanPosition], Result[LOutputPosition], LBlockSize);
    Inc(LScanPosition, LBlockSize);
    Inc(LOutputPosition, LBlockSize);
  end;

  Position := LScanPosition;
end;

procedure TGIFByteReader.SkipSubBlocks;
var
  LBlockSize: Integer;
begin
  repeat
    LBlockSize := ReadByte;
    if LBlockSize = 0 then
      Break;

    if (Position < 0) or (Int64(Position) + LBlockSize > Length(Data)) then
      raise EFMXBridgeGIFError.Create('Truncated GIF data');

    Inc(Position, LBlockSize);
  until False;
end;

function TGIFByteReader.EndOfData: Boolean;
begin
  Result := Position >= Length(Data);
end;

function ReadColorTable(var AReader: TGIFByteReader;
  const AEntryCount: Integer): TGIFColorTable;
var
  I: Integer;
  R, G, B: Byte;
begin
  FillChar(Result, SizeOf(Result), 0);

  if (AEntryCount < 2) or (AEntryCount > 256) then
    raise EFMXBridgeGIFError.Create('Invalid GIF color table size');

  for I := 0 to AEntryCount - 1 do
  begin
    R := AReader.ReadByte;
    G := AReader.ReadByte;
    B := AReader.ReadByte;
    Result[I] := TAlphaColor($FF000000) or
      (TAlphaColor(R) shl 16) or
      (TAlphaColor(G) shl 8) or
      TAlphaColor(B);
  end;
end;

function DecodeLZW(const ACompressed: TBytes; const AMinCodeSize,
  AWidth, AHeight: Integer; const AInterlaced: Boolean): TBytes;
var
  LPrefix: array[0..4095] of SmallInt;
  LSuffix: array[0..4095] of Byte;
  LStack: array[0..4095] of Byte;
  LRowOrder: TArray<Integer>;
  LExpectedPixels: Int64;
  LOutputCount: Integer;
  LBitPosition: Int64;
  LCodeSize: Integer;
  LClearCode, LEndCode, LNextCode: Integer;
  LOldCode, LCode, LInCode: Integer;
  LStackCount: Integer;
  LFirstChar: Byte;
  LByteIndex, LShift: Integer;
  LBits: Cardinal;
  LValue: Integer;
  LRow, LColumn, I, Y: Integer;

  function ReadCode: Integer;
  var
    LRemaining: Integer;
    LByteCount: Integer;
    J: Integer;
  begin
    if LBitPosition + LCodeSize > Int64(Length(ACompressed)) * 8 then
      Exit(-1);

    LByteIndex := LBitPosition shr 3;
    LShift := LBitPosition and 7;
    LRemaining := Length(ACompressed) - LByteIndex;
    LByteCount := Min(3, LRemaining);
    LBits := 0;

    for J := 0 to LByteCount - 1 do
      LBits := LBits or (Cardinal(ACompressed[LByteIndex + J]) shl (J * 8));

    Result := Integer((LBits shr LShift) and Cardinal((1 shl LCodeSize) - 1));
    Inc(LBitPosition, LCodeSize);
  end;

  procedure Emit(const AValue: Byte);
  begin
    if LOutputCount >= LExpectedPixels then
      raise EFMXBridgeGIFError.Create('GIF image data contains too many pixels');

    if AInterlaced then
    begin
      LRow := LOutputCount div AWidth;
      LColumn := LOutputCount mod AWidth;
      Y := LRowOrder[LRow];
      Result[Y * AWidth + LColumn] := AValue;
    end
    else
      Result[LOutputCount] := AValue;

    Inc(LOutputCount);
  end;

  procedure ResetDictionary;
  var
    J: Integer;
  begin
    LCodeSize := AMinCodeSize + 1;
    LNextCode := LEndCode + 1;
    for J := 0 to LClearCode - 1 do
      LPrefix[J] := -1;
  end;

begin
  if (AMinCodeSize < 2) or (AMinCodeSize > 8) then
    raise EFMXBridgeGIFError.Create('Invalid GIF LZW minimum code size');

  if (AWidth <= 0) or (AHeight <= 0) then
    raise EFMXBridgeGIFError.Create('Invalid GIF frame dimensions');

  LExpectedPixels := Int64(AWidth) * AHeight;
  if LExpectedPixels > High(Integer) then
    raise EFMXBridgeGIFError.Create('GIF frame dimensions are too large');

  SetLength(Result, Integer(LExpectedPixels));

  if AInterlaced then
  begin
    SetLength(LRowOrder, AHeight);
    LRow := 0;
    for I := 0 to 3 do
    begin
      case I of
        0: Y := 0;
        1: Y := 4;
        2: Y := 2;
      else
        Y := 1;
      end;

      case I of
        0, 1: LValue := 8;
        2: LValue := 4;
      else
        LValue := 2;
      end;

      while Y < AHeight do
      begin
        LRowOrder[LRow] := Y;
        Inc(LRow);
        Inc(Y, LValue);
      end;
    end;
  end;

  LClearCode := 1 shl AMinCodeSize;
  LEndCode := LClearCode + 1;
  LBitPosition := 0;
  LOutputCount := 0;
  LOldCode := -1;
  LFirstChar := 0;
  ResetDictionary;

  while True do
  begin
    LCode := ReadCode;
    if LCode < 0 then
      Break;

    if LCode = LClearCode then
    begin
      ResetDictionary;
      LOldCode := -1;
      Continue;
    end;

    if LCode = LEndCode then
      Break;

    if LOldCode < 0 then
    begin
      if LCode >= LClearCode then
        raise EFMXBridgeGIFError.Create('Invalid first GIF LZW code');

      LFirstChar := Byte(LCode);
      Emit(LFirstChar);
      LOldCode := LCode;
      Continue;
    end;

    LInCode := LCode;
    LStackCount := 0;

    if LCode = LNextCode then
    begin
      LStack[LStackCount] := LFirstChar;
      Inc(LStackCount);
      LCode := LOldCode;
    end
    else if LCode > LNextCode then
      raise EFMXBridgeGIFError.Create('Invalid GIF LZW dictionary reference');

    while LCode >= LClearCode + 2 do
    begin
      if (LCode >= LNextCode) or (LStackCount >= Length(LStack)) then
        raise EFMXBridgeGIFError.Create('Invalid GIF LZW dictionary chain');

      LStack[LStackCount] := LSuffix[LCode];
      Inc(LStackCount);
      LCode := LPrefix[LCode];
      if LCode < 0 then
        raise EFMXBridgeGIFError.Create('Invalid GIF LZW prefix');
    end;

    if LCode >= LClearCode then
      raise EFMXBridgeGIFError.Create('Invalid GIF LZW literal');

    LFirstChar := Byte(LCode);
    if LStackCount >= Length(LStack) then
      raise EFMXBridgeGIFError.Create('GIF LZW stack overflow');
    LStack[LStackCount] := LFirstChar;
    Inc(LStackCount);

    for I := LStackCount - 1 downto 0 do
      Emit(LStack[I]);

    if LNextCode < 4096 then
    begin
      LPrefix[LNextCode] := SmallInt(LOldCode);
      LSuffix[LNextCode] := LFirstChar;
      Inc(LNextCode);

      if (LNextCode = (1 shl LCodeSize)) and (LCodeSize < 12) then
      begin
        Inc(LCodeSize);
      end;
    end;

    LOldCode := LInCode;
  end;

  if LOutputCount <> LExpectedPixels then
    raise EFMXBridgeGIFError.CreateFmt(
      'Incomplete GIF frame: decoded %d of %d pixels',
      [LOutputCount, LExpectedPixels]);
end;

procedure TGIFDecoder.LoadFromFile(const AFileName: string);
var
  LStream: TFileStream;
begin
  LStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  try
    LoadFromStream(LStream);
  finally
    LStream.Free;
  end;
end;

procedure TGIFDecoder.LoadFromStream(AStream: TStream);
var
  LData: TBytes;
  LOldPosition: Int64;
  LSize: Int64;
  LReadPosition: Integer;
  LReadCount: Integer;
begin
  if AStream = nil then
    raise EArgumentNilException.Create('AStream');

  LOldPosition := AStream.Position;
  try
    AStream.Position := 0;
    LSize := AStream.Size;

    if (LSize <= 0) or (LSize > High(Integer)) then
      raise EFMXBridgeGIFError.Create('GIF file size is outside the supported limit');

    SetLength(LData, Integer(LSize));
    LReadPosition := 0;
    while LReadPosition < Length(LData) do
    begin
      LReadCount := Min(65536, Length(LData) - LReadPosition);
      LReadCount := AStream.Read(LData[LReadPosition], LReadCount);
      if LReadCount <= 0 then
        raise EFMXBridgeGIFError.Create('Unable to read complete GIF data');
      Inc(LReadPosition, LReadCount);
    end;
    DecodeBytes(LData);
  finally
    AStream.Position := LOldPosition;
  end;
end;

procedure TGIFDecoder.DecodeBytes(const AData: TBytes);
var
  LReader: TGIFByteReader;
  LFrames: TList<TGIFFrameData>;
  LSignature: array[0..5] of Byte;
  LScreenPacked: Byte;
  LBackgroundIndex: Byte;
  LColorTableSize: Integer;
  LGlobalColorCount: Integer;
  LHasGlobalColorTable: Boolean;
  LGlobalPalette: TGIFColorTable;
  LGraphicControl: TGIFGraphicControl;
  LMarker: Byte;
  LExtensionType: Byte;
  LBlockSize: Integer;
  LExtensionHeader: TBytes;
  LExtensionData: TBytes;
  LApplicationId: AnsiString;
  LApplicationAuth: AnsiString;
  LLoopValue: Word;
  LTerminator: Byte;
  LFrame: TGIFFrameData;
  LImagePacked: Byte;
  LHasLocalColorTable: Boolean;
  LInterlaced: Boolean;
  LMinCodeSize: Byte;
  LFramePixels: Int64;
  I: Integer;
begin
  FWidth := 0;
  FHeight := 0;
  FBackgroundColor := 0;
  FFrames := nil;
  FLoopCount := -1;

  LReader.Data := AData;
  LReader.Position := 0;

  for I := 0 to High(LSignature) do
    LSignature[I] := LReader.ReadByte;

  if not ((LSignature[0] = Ord('G')) and
    (LSignature[1] = Ord('I')) and
    (LSignature[2] = Ord('F')) and
    (LSignature[3] = Ord('8')) and
    ((LSignature[4] = Ord('7')) or (LSignature[4] = Ord('9'))) and
    (LSignature[5] = Ord('a'))) then
    raise EFMXBridgeGIFError.Create('Invalid GIF signature');

  FWidth := LReader.ReadWord;
  FHeight := LReader.ReadWord;

  if (FWidth <= 0) or (FHeight <= 0) or
    (Int64(FWidth) * FHeight > High(Integer)) then
    raise EFMXBridgeGIFError.Create('GIF logical screen dimensions are too large');

  LScreenPacked := LReader.ReadByte;
  LBackgroundIndex := LReader.ReadByte;
  LReader.ReadByte; // Pixel aspect ratio.

  LHasGlobalColorTable := (LScreenPacked and $80) <> 0;
  LGlobalColorCount := 0;
  LGlobalPalette := Default(TGIFColorTable);

  if LHasGlobalColorTable then
  begin
    LColorTableSize := 1 shl ((LScreenPacked and $07) + 1);
    LGlobalColorCount := LColorTableSize;
    LGlobalPalette := ReadColorTable(LReader, LColorTableSize);

    if LBackgroundIndex < LColorTableSize then
      FBackgroundColor := LGlobalPalette[LBackgroundIndex];
  end;

  LFrames := TList<TGIFFrameData>.Create;
  try
    LGraphicControl := Default(TGIFGraphicControl);
    LGraphicControl.DelayMS := GIF_DEFAULT_DELAY_MS;
    LGraphicControl.TransparentIndex := -1;

    while not LReader.EndOfData do
    begin
      LMarker := LReader.ReadByte;

      case LMarker of
        GIF_TRAILER:
          Break;

        GIF_EXTENSION_INTRODUCER:
          begin
            LExtensionType := LReader.ReadByte;

            case LExtensionType of
              GIF_EXTENSION_GRAPHIC_CONTROL:
                begin
                  LBlockSize := LReader.ReadByte;
                  if LBlockSize <> 4 then
                    raise EFMXBridgeGIFError.Create('Invalid GIF graphic control extension size');

                  LExtensionHeader := LReader.ReadBytes(LBlockSize);
                  LTerminator := LReader.ReadByte;
                  if LTerminator <> 0 then
                    raise EFMXBridgeGIFError.Create('Invalid GIF graphic control terminator');

                  LGraphicControl.Disposal := (LExtensionHeader[0] shr 2) and $07;
                  LGraphicControl.DelayMS :=
                    Cardinal(LExtensionHeader[1] or (Word(LExtensionHeader[2]) shl 8)) * 10;
                  if LGraphicControl.DelayMS = 0 then
                    LGraphicControl.DelayMS := GIF_DEFAULT_DELAY_MS;

                  LGraphicControl.HasTransparency :=
                    (LExtensionHeader[0] and $01) <> 0;

                  if LGraphicControl.HasTransparency then
                    LGraphicControl.TransparentIndex := LExtensionHeader[3]
                  else
                    LGraphicControl.TransparentIndex := -1;

                end;

              GIF_EXTENSION_APPLICATION:
                begin
                  LBlockSize := LReader.ReadByte;
                  LExtensionHeader := LReader.ReadBytes(LBlockSize);
                  LExtensionData := LReader.ReadSubBlocks;

                  if LBlockSize >= 11 then
                  begin
                    SetString(LApplicationId,
                      PAnsiChar(@LExtensionHeader[0]), 8);
                    SetString(LApplicationAuth,
                      PAnsiChar(@LExtensionHeader[8]), 3);

                    if (((LApplicationId = 'NETSCAPE') and
                      (LApplicationAuth = '2.0')) or
                      ((LApplicationId = 'ANIMEXTS') and
                      (LApplicationAuth = '1.0'))) and
                      (Length(LExtensionData) >= 3) and
                      (LExtensionData[0] = 1) then
                    begin
                      LLoopValue := Word(LExtensionData[1]) or
                        (Word(LExtensionData[2]) shl 8);
                      FLoopCount := LLoopValue;
                    end;
                  end;
                end;

              GIF_EXTENSION_COMMENT:
                LReader.SkipSubBlocks;

              GIF_EXTENSION_PLAIN_TEXT:
                begin
                  LBlockSize := LReader.ReadByte;
                  LReader.ReadBytes(LBlockSize);
                  LReader.SkipSubBlocks;

                  // The graphic control extension also applies to plain text.
                  LGraphicControl := Default(TGIFGraphicControl);
                  LGraphicControl.DelayMS := GIF_DEFAULT_DELAY_MS;
                  LGraphicControl.TransparentIndex := -1;
                end;
            else
              LReader.SkipSubBlocks;
            end;
          end;

        GIF_IMAGE_SEPARATOR:
          begin
            LFrame := Default(TGIFFrameData);

            LFrame.Left := LReader.ReadWord;
            LFrame.Top := LReader.ReadWord;
            LFrame.Width := LReader.ReadWord;
            LFrame.Height := LReader.ReadWord;
            LImagePacked := LReader.ReadByte;

            if (LFrame.Width <= 0) or (LFrame.Height <= 0) then
              raise EFMXBridgeGIFError.Create('Invalid GIF image dimensions');

            LFramePixels := Int64(LFrame.Width) * LFrame.Height;
            if LFramePixels > High(Integer) then
              raise EFMXBridgeGIFError.Create('GIF image frame is too large');

            LHasLocalColorTable := (LImagePacked and $80) <> 0;
            LInterlaced := (LImagePacked and $40) <> 0;

            if LHasLocalColorTable then
            begin
              LColorTableSize := 1 shl ((LImagePacked and $07) + 1);
              LFrame.Palette := ReadColorTable(LReader, LColorTableSize);
              LFrame.PaletteCount := LColorTableSize;
            end
            else
            begin
              if not LHasGlobalColorTable then
                raise EFMXBridgeGIFError.Create('GIF frame has no color table');
              LFrame.Palette := LGlobalPalette;
              LFrame.PaletteCount := LGlobalColorCount;
            end;

            LFrame.Disposal := LGraphicControl.Disposal;
            LFrame.DelayMS := LGraphicControl.DelayMS;
            LFrame.HasTransparency := LGraphicControl.HasTransparency;
            LFrame.TransparentIndex := LGraphicControl.TransparentIndex;

            if LFrame.PaletteCount <= 0 then
              raise EFMXBridgeGIFError.Create('GIF frame has an empty color table');

            if LFrame.HasTransparency and
              (LFrame.TransparentIndex >= LFrame.PaletteCount) then
              raise EFMXBridgeGIFError.Create('GIF transparent color index is outside the palette');

            LMinCodeSize := LReader.ReadByte;
            LExtensionData := LReader.ReadSubBlocks;
            LFrame.Pixels := DecodeLZW(LExtensionData, LMinCodeSize,
              LFrame.Width, LFrame.Height, LInterlaced);

            for I := 0 to High(LFrame.Pixels) do
              if LFrame.Pixels[I] >= LFrame.PaletteCount then
                raise EFMXBridgeGIFError.Create('GIF pixel index is outside the color table');

            LFrames.Add(LFrame);

            LGraphicControl := Default(TGIFGraphicControl);
            LGraphicControl.DelayMS := GIF_DEFAULT_DELAY_MS;
            LGraphicControl.TransparentIndex := -1;
          end;
      else
        raise EFMXBridgeGIFError.CreateFmt(
          'Unexpected GIF block marker $%.2x', [LMarker]);
      end;
    end;

    if LFrames.Count = 0 then
      raise EFMXBridgeGIFError.Create('GIF contains no image frames');

    SetLength(FFrames, LFrames.Count);
    for I := 0 to LFrames.Count - 1 do
    begin
      FFrames[I] := LFrames[I];
    end;
  finally
    LFrames.Free;
  end;
end;

function TGIFDecoder.GetFrameCount: Integer;
begin
  Result := Length(FFrames);
end;

function TGIFDecoder.GetFrameDelay(AIndex: Integer): Cardinal;
begin
  if (AIndex < 0) or (AIndex >= Length(FFrames)) then
    Exit(GIF_DEFAULT_DELAY_MS);
  Result := FFrames[AIndex].DelayMS;
end;

constructor TGIFCompositor.Create(ADecoder: TGIFDecoder);
begin
  inherited Create;

  if ADecoder = nil then
    raise EArgumentNilException.Create('ADecoder');

  FDecoder := ADecoder;
  FFrameIndex := -1;
  FRestoreRect := Rect(0, 0, 0, 0);
end;

procedure TGIFCompositor.FillRect(const ARect: TRect;
  const AColor: TAlphaColor; var ABitmapData: TBitmapData);
var
  LLeft, LTop, LRight, LBottom: Integer;
  X, Y: Integer;
  LScanLine: PAlphaColor;
begin
  LLeft := EnsureRange(ARect.Left, 0, FDecoder.Width);
  LTop := EnsureRange(ARect.Top, 0, FDecoder.Height);
  LRight := EnsureRange(ARect.Right, 0, FDecoder.Width);
  LBottom := EnsureRange(ARect.Bottom, 0, FDecoder.Height);

  if (LRight <= LLeft) or (LBottom <= LTop) then
    Exit;

  for Y := LTop to LBottom - 1 do
  begin
    LScanLine := PAlphaColor(ABitmapData.GetScanLine(Y));
    Inc(LScanLine, LLeft);

    for X := LLeft to LRight - 1 do
    begin
      AlphaColorToPixel(AColor, LScanLine, ABitmapData.PixelFormat);
      Inc(LScanLine);
    end;
  end;
end;

procedure TGIFCompositor.IncludeDirtyRect(var ADirtyRect: TRect;
  const ARect: TRect);
var
  LRect: TRect;
begin
  LRect.Left := EnsureRange(ARect.Left, 0, FDecoder.Width);
  LRect.Top := EnsureRange(ARect.Top, 0, FDecoder.Height);
  LRect.Right := EnsureRange(ARect.Right, 0, FDecoder.Width);
  LRect.Bottom := EnsureRange(ARect.Bottom, 0, FDecoder.Height);

  if (LRect.Right <= LRect.Left) or (LRect.Bottom <= LRect.Top) then
    Exit;

  if (ADirtyRect.Right <= ADirtyRect.Left) or
    (ADirtyRect.Bottom <= ADirtyRect.Top) then
  begin
    ADirtyRect := LRect;
    Exit;
  end;

  if LRect.Left < ADirtyRect.Left then
    ADirtyRect.Left := LRect.Left;
  if LRect.Top < ADirtyRect.Top then
    ADirtyRect.Top := LRect.Top;
  if LRect.Right > ADirtyRect.Right then
    ADirtyRect.Right := LRect.Right;
  if LRect.Bottom > ADirtyRect.Bottom then
    ADirtyRect.Bottom := LRect.Bottom;
end;

procedure TGIFCompositor.ApplyPreviousDisposal(var ADirtyRect: TRect;
  var ABitmapData: TBitmapData);
var
  LPrevious: TGIFFrameData;
  LColor: TAlphaColor;
  LRect: TRect;
  Y: Integer;
  LBytesPerPixel: Integer;
  LRowBytes: Integer;
  LSourceOffset: Integer;
  LSource: PByte;
  LDest: PByte;
begin
  if (FFrameIndex < 0) or (FFrameIndex >= FDecoder.FrameCount) then
    Exit;

  LPrevious := FDecoder.FFrames[FFrameIndex];

  case LPrevious.Disposal of
    2:
      begin
        if LPrevious.HasTransparency then
          LColor := 0
        else
          LColor := FDecoder.BackgroundColor;

        LRect := Rect(LPrevious.Left, LPrevious.Top,
          LPrevious.Left + LPrevious.Width,
          LPrevious.Top + LPrevious.Height);
        IncludeDirtyRect(ADirtyRect, LRect);
        FillRect(LRect, LColor, ABitmapData);
      end;

    3:
      begin
        if Length(FRestorePixels) > 0 then
        begin
          IncludeDirtyRect(ADirtyRect, FRestoreRect);
          LBytesPerPixel := ABitmapData.BytesPerPixel;

          if LBytesPerPixel = FRestoreBytesPerPixel then
          begin
            LRowBytes := FRestoreRect.Width * LBytesPerPixel;

            for Y := 0 to FRestoreRect.Height - 1 do
            begin
              LSourceOffset := Y * LRowBytes;
              LSource := @FRestorePixels[LSourceOffset];
              LDest := PByte(ABitmapData.GetScanLine(FRestoreRect.Top + Y));
              Inc(LDest, FRestoreRect.Left * LBytesPerPixel);
              Move(LSource^, LDest^, LRowBytes);
            end;
          end;
        end;

        FRestorePixels := nil;
        FRestoreBytesPerPixel := 0;
      end;
  end;
end;

procedure TGIFCompositor.SaveRestorePrevious(const AFrame: TGIFFrameData;
  var ABitmapData: TBitmapData);
var
  LLeft, LTop, LRight, LBottom: Integer;
  Y: Integer;
  LBytesPerPixel: Integer;
  LRowBytes: Integer;
  LDestOffset: Integer;
  LSource: PByte;
  LDest: PByte;
  LTotalBytes: Int64;
begin
  FRestorePixels := nil;
  FRestoreBytesPerPixel := 0;
  FRestoreRect := Rect(0, 0, 0, 0);

  if AFrame.Disposal <> 3 then
    Exit;

  LLeft := EnsureRange(AFrame.Left, 0, FDecoder.Width);
  LTop := EnsureRange(AFrame.Top, 0, FDecoder.Height);
  LRight := EnsureRange(AFrame.Left + AFrame.Width, 0, FDecoder.Width);
  LBottom := EnsureRange(AFrame.Top + AFrame.Height, 0, FDecoder.Height);

  if (LRight <= LLeft) or (LBottom <= LTop) then
    Exit;

  FRestoreRect := Rect(LLeft, LTop, LRight, LBottom);
  LBytesPerPixel := ABitmapData.BytesPerPixel;
  LRowBytes := FRestoreRect.Width * LBytesPerPixel;
  LTotalBytes := Int64(LRowBytes) * FRestoreRect.Height;

  if (LBytesPerPixel <= 0) or (LTotalBytes > High(Integer)) then
  begin
    FRestoreRect := Rect(0, 0, 0, 0);
    Exit;
  end;

  SetLength(FRestorePixels, Integer(LTotalBytes));
  FRestoreBytesPerPixel := LBytesPerPixel;

  for Y := 0 to FRestoreRect.Height - 1 do
  begin
    LSource := PByte(ABitmapData.GetScanLine(FRestoreRect.Top + Y));
    Inc(LSource, FRestoreRect.Left * LBytesPerPixel);
    LDestOffset := Y * LRowBytes;
    LDest := @FRestorePixels[LDestOffset];
    Move(LSource^, LDest^, LRowBytes);
  end;
end;

procedure TGIFCompositor.DrawFrame(const AFrame: TGIFFrameData;
  var ADirtyRect: TRect; var ABitmapData: TBitmapData);
var
  LLeft, LTop, LRight, LBottom: Integer;
  X, Y: Integer;
  LSourceIndex: Integer;
  LColorIndex: Byte;
  LScanLine: PAlphaColor;
begin
  LLeft := EnsureRange(AFrame.Left, 0, FDecoder.Width);
  LTop := EnsureRange(AFrame.Top, 0, FDecoder.Height);
  LRight := EnsureRange(AFrame.Left + AFrame.Width, 0, FDecoder.Width);
  LBottom := EnsureRange(AFrame.Top + AFrame.Height, 0, FDecoder.Height);

  if (LRight <= LLeft) or (LBottom <= LTop) then
    Exit;

  IncludeDirtyRect(ADirtyRect, Rect(LLeft, LTop, LRight, LBottom));

  for Y := LTop to LBottom - 1 do
  begin
    LSourceIndex := (Y - AFrame.Top) * AFrame.Width +
      (LLeft - AFrame.Left);
    LScanLine := PAlphaColor(ABitmapData.GetScanLine(Y));
    Inc(LScanLine, LLeft);

    for X := LLeft to LRight - 1 do
    begin
      LColorIndex := AFrame.Pixels[LSourceIndex];

      if not (AFrame.HasTransparency and
        (LColorIndex = AFrame.TransparentIndex)) then
        AlphaColorToPixel(AFrame.Palette[LColorIndex], LScanLine,
          ABitmapData.PixelFormat);

      Inc(LScanLine);
      Inc(LSourceIndex);
    end;
  end;
end;

function TGIFCompositor.RenderFrame(const AIndex: Integer; ABitmap: TBitmap;
  out ADirtyRect: TRect): Boolean;
var
  LStartIndex: Integer;
  I: Integer;
  LFrame: TGIFFrameData;
  LBackground: TAlphaColor;
  LBitmapData: TBitmapData;
begin
  Result := False;

  if (AIndex < 0) or (AIndex >= FDecoder.FrameCount) then
    raise EArgumentOutOfRangeException.Create('AIndex');

  if ABitmap = nil then
    raise EArgumentNilException.Create('ABitmap');

  if (ABitmap.Width <> FDecoder.Width) or
    (ABitmap.Height <> FDecoder.Height) then
  begin
    ABitmap.SetSize(FDecoder.Width, FDecoder.Height);
    FFrameIndex := -1;
  end;

  if (FFrameIndex < 0) or (AIndex <= FFrameIndex) then
  begin
    if (FDecoder.FrameCount > 0) and
      FDecoder.FFrames[0].HasTransparency then
      LBackground := 0
    else
      LBackground := FDecoder.BackgroundColor;

    ABitmap.Clear(LBackground);

    FRestorePixels := nil;
    FRestoreBytesPerPixel := 0;
    FRestoreRect := Rect(0, 0, 0, 0);
    FFrameIndex := -1;

    ADirtyRect := Rect(0, 0, FDecoder.Width, FDecoder.Height);
    LStartIndex := 0;
  end
  else
  begin
    ADirtyRect := Rect(0, 0, 0, 0);
    LStartIndex := FFrameIndex + 1;
  end;

  if not ABitmap.Map(TMapAccess.ReadWrite, LBitmapData) then
    Exit;

  try
    for I := LStartIndex to AIndex do
    begin
      if I > 0 then
        ApplyPreviousDisposal(ADirtyRect, LBitmapData);

      LFrame := FDecoder.FFrames[I];
      SaveRestorePrevious(LFrame, LBitmapData);
      DrawFrame(LFrame, ADirtyRect, LBitmapData);
      FFrameIndex := I;
    end;
  finally
    ABitmap.Unmap(LBitmapData);
  end;

  Result := True;
end;

end.
