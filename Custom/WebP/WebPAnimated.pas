
unit WebPAnimated;

interface

uses
  System.Classes,
  FMX.Graphics,
  WebPDec;

type
  TWebPAnimationFrame = record
    Bitmap: TBitmap;
    Duration: Integer;
  end;

  TFMXWebPAnimation = class
  private
    FFrames: array of TWebPAnimationFrame;
    FWidth: Integer;
    FHeight: Integer;
    FLoopCount: Integer;
    FBgColor: Cardinal;
    procedure ClearFrames;
    function GetFrameCount: Integer;
    function GetFrame(Index: Integer): TBitmap;
    function GetDuration(Index: Integer): Integer;
    procedure DecodeAnimation(Data: PByte; Size: NativeUInt);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadFromFile(const AFileName: string);
    procedure LoadFromStream(AStream: TStream);
    function TotalDuration: Integer;
    function FrameAtTime(ATime: Integer): Integer;
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    property LoopCount: Integer read FLoopCount;
    property FrameCount: Integer read GetFrameCount;
    property Frames[Index: Integer]: TBitmap read GetFrame;
    property Durations[Index: Integer]: Integer read GetDuration;
  end;

implementation

uses
  System.SysUtils,
  FMX.Types;

function ReadLE16(P: PByte): Cardinal; inline;
begin
  Result := P[0] or (Cardinal(P[1]) shl 8);
end;

function ReadLE24(P: PByte): Cardinal; inline;
begin
  Result := P[0] or (Cardinal(P[1]) shl 8) or (Cardinal(P[2]) shl 16);
end;

function ReadLE32(P: PByte): Cardinal; inline;
begin
  Result := P[0] or (Cardinal(P[1]) shl 8) or (Cardinal(P[2]) shl 16) or
    (Cardinal(P[3]) shl 24);
end;

function FourCC(const S: AnsiString): Cardinal; inline;
begin
  Result := Cardinal(Byte(S[1])) or (Cardinal(Byte(S[2])) shl 8) or
    (Cardinal(Byte(S[3])) shl 16) or (Cardinal(Byte(S[4])) shl 24);
end;

procedure BlendOver(Dst, Src: PByte); inline;
var
  SA, DA, SA1, OA255: Integer;
  C: Integer;
begin
  SA := Src[3];

  if SA = 255 then
  begin
    Dst[0] := Src[0];
    Dst[1] := Src[1];
    Dst[2] := Src[2];
    Dst[3] := 255;
    Exit;
  end;

  if SA = 0 then
    Exit;

  DA := Dst[3];
  SA1 := 255 - SA;

  OA255 := SA * 255 + DA * SA1;

  if OA255 = 0 then
  begin
    Dst[0] := 0;
    Dst[1] := 0;
    Dst[2] := 0;
    Dst[3] := 0;
    Exit;
  end;

  for C := 0 to 2 do
    Dst[C] := Byte((Src[C] * SA * 255 + Dst[C] * DA * SA1 + OA255 div 2)
      div OA255);

  Dst[3] := Byte((OA255 + 127) div 255);
end;

function HasAlphaChunk(Sub: PByte; SubSize: NativeUInt): Boolean;
var
  P: PByte;
  Left: NativeUInt;
  ChunkSize: Cardinal;
begin
  Result := False;

  P := Sub;
  Left := SubSize;

  while Left >= 8 do
  begin
    ChunkSize := ReadLE32(P + 4);

    if ReadLE32(P) = FourCC('ALPH') then
      Exit(True);

    ChunkSize := (ChunkSize + 1) and not Cardinal(1);

    if NativeUInt(8) + ChunkSize > Left then
      Break;

    Inc(P, 8 + ChunkSize);
    Dec(Left, 8 + ChunkSize);
  end;
end;

procedure PutLE32(var Buffer: TBytes; Offset: Integer; Value: Cardinal);
begin
  Buffer[Offset] := Byte(Value);
  Buffer[Offset + 1] := Byte(Value shr 8);
  Buffer[Offset + 2] := Byte(Value shr 16);
  Buffer[Offset + 3] := Byte(Value shr 24);
end;

function BuildFrameContainer(Sub: PByte; SubSize: NativeUInt;
  FrameW, FrameH: Integer; out Container: TBytes): NativeUInt;
var
  NeedVP8X: Boolean;
  HeaderLength: NativeUInt;
  Total: NativeUInt;
  Offset: Integer;
begin
  NeedVP8X := HasAlphaChunk(Sub, SubSize);

  HeaderLength := 4;

  if NeedVP8X then
    Inc(HeaderLength, 18);

  Total := 8 + HeaderLength + SubSize;

  SetLength(Container, Total);

  PutLE32(Container, 0, FourCC('RIFF'));
  PutLE32(Container, 4, Cardinal(HeaderLength + SubSize));
  PutLE32(Container, 8, FourCC('WEBP'));

  Offset := 12;

  if NeedVP8X then
  begin
    PutLE32(Container, Offset, FourCC('VP8X'));
    Inc(Offset, 4);

    PutLE32(Container, Offset, 10);
    Inc(Offset, 4);

    Container[Offset] := $10;
    Container[Offset + 1] := 0;
    Container[Offset + 2] := 0;
    Container[Offset + 3] := 0;
    Container[Offset + 4] := Byte(FrameW - 1);
    Container[Offset + 5] := Byte((FrameW - 1) shr 8);
    Container[Offset + 6] := Byte((FrameW - 1) shr 16);
    Container[Offset + 7] := Byte(FrameH - 1);
    Container[Offset + 8] := Byte((FrameH - 1) shr 8);
    Container[Offset + 9] := Byte((FrameH - 1) shr 16);

    Inc(Offset, 10);
  end;

  if SubSize > 0 then
    Move(Sub^, Container[Offset], SubSize);

  Result := Total;
end;

function DecodeFrame(Sub: PByte; SubSize: NativeUInt;
  FrameW, FrameH: Integer): PByte;
var
  Container: TBytes;
  Total: NativeUInt;
  W, H: Integer;
begin
  Result := nil;

  Total := BuildFrameContainer(Sub, SubSize, FrameW, FrameH, Container);

  if Total = 0 then
    Exit;

  Result := WebPDecodeBGRA(@Container[0], Total, W, H);

  if (Result <> nil) and ((W <> FrameW) or (H <> FrameH)) then
  begin
    WebPFree(Result);
    Result := nil;
  end;
end;

function BitmapFromBGRA(Pixels: PByte; Width, Height: Integer): TBitmap;
var
  Data: TBitmapData;
  Src: PByte;
  Dst: PByte;
  Y, X: Integer;
  B, G, R, A: Integer;
begin
  Result := TBitmap.Create(Width, Height);

  try
    if not Result.Map(TMapAccess.Write, Data) then
      raise Exception.Create('WebP animation: cannot map TBitmap');

    try
      if Data.PixelFormat <> TPixelFormat.BGRA then
        raise Exception.Create('WebP animation: unsupported FMX pixel format');

      Src := Pixels;

      for Y := 0 to Height - 1 do
      begin
        Dst := PByte(Data.Data) + Y * Data.Pitch;

        for X := 0 to Width - 1 do
        begin
          B := Src[0];
          G := Src[1];
          R := Src[2];
          A := Src[3];

          Dst[0] := Byte((B * A + 127) div 255);
          Dst[1] := Byte((G * A + 127) div 255);
          Dst[2] := Byte((R * A + 127) div 255);
          Dst[3] := Byte(A);

          Inc(Src, 4);
          Inc(Dst, 4);
        end;
      end;

    finally
      Result.Unmap(Data);
    end;

  except
    Result.Free;
    raise;
  end;
end;

constructor TFMXWebPAnimation.Create;
begin
  inherited Create;

  FWidth := 0;
  FHeight := 0;
  FLoopCount := 0;
  FBgColor := 0;
end;

destructor TFMXWebPAnimation.Destroy;
begin
  ClearFrames;
  inherited;
end;

procedure TFMXWebPAnimation.ClearFrames;
var
  I: Integer;
begin
  for I := 0 to High(FFrames) do
    FFrames[I].Bitmap.Free;

  SetLength(FFrames, 0);
end;

function TFMXWebPAnimation.GetFrameCount: Integer;
begin
  Result := Length(FFrames);
end;

function TFMXWebPAnimation.GetFrame(Index: Integer): TBitmap;
begin
  if (Index < 0) or (Index >= Length(FFrames)) then
    raise EListError.CreateFmt('WebP frame index %d out of range', [Index]);

  Result := FFrames[Index].Bitmap;
end;

function TFMXWebPAnimation.GetDuration(Index: Integer): Integer;
begin
  if (Index < 0) or (Index >= Length(FFrames)) then
    raise EListError.CreateFmt('WebP frame index %d out of range', [Index]);

  Result := FFrames[Index].Duration;
end;

function TFMXWebPAnimation.TotalDuration: Integer;
var
  I: Integer;
begin
  Result := 0;

  for I := 0 to High(FFrames) do
    Inc(Result, FFrames[I].Duration);
end;

function TFMXWebPAnimation.FrameAtTime(ATime: Integer): Integer;
var
  I: Integer;
  Accum: Integer;
begin
  Result := -1;

  if FrameCount = 0 then
    Exit;

  if ATime <= 0 then
    Exit(0);

  Accum := 0;

  for I := 0 to FrameCount - 1 do
  begin
    Inc(Accum, Durations[I]);

    if ATime < Accum then
      Exit(I);
  end;

  Result := FrameCount - 1;
end;

procedure TFMXWebPAnimation.LoadFromFile(const AFileName: string);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TFMXWebPAnimation.LoadFromStream(AStream: TStream);
var
  Data: TBytes;
  Size: NativeUInt;
begin
  if AStream = nil then
    raise EArgumentNilException.Create('WebP animation: stream is nil');

  Size := NativeUInt(AStream.Size - AStream.Position);

  if Size < 12 then
    raise Exception.Create('WebP animation: invalid file');

  SetLength(Data, Size);

  AStream.ReadBuffer(Data[0], Size);

  DecodeAnimation(@Data[0], Size);
end;

procedure TFMXWebPAnimation.DecodeAnimation(Data: PByte; Size: NativeUInt);
var
  P: PByte;
  Inner: PByte;
  Sub: PByte;
  FramePixels: PByte;
  Left: NativeUInt;
  ChunkCode: Cardinal;
  ChunkSize: Cardinal;
  VP8XFlags: Cardinal;
  HasAnimation: Boolean;
  FrameBase: PByte;
  FX, FY: Integer;
  FW, FH: Integer;
  FDuration: Integer;
  FrameFlags: Cardinal;
  DoNotBlend: Boolean;
  DisposeBackground: Boolean;
  Canvas: PByte;
  CanvasBytes: NativeUInt;
  Row, Col: Integer;
  CX, CY: Integer;
  Dst, Src: PByte;
  FrameBitmap: TBitmap;
  N: Integer;
  SinglePixels: PByte;
  SW, SH: Integer;
begin
  ClearFrames;

  FWidth := 0;
  FHeight := 0;
  FLoopCount := 0;
  FBgColor := 0;

  if Size < 12 then
    raise Exception.Create('WebP animation: data too small');

  if (ReadLE32(Data) <> FourCC('RIFF')) or (ReadLE32(Data + 8) <> FourCC('WEBP'))
  then
    raise Exception.Create('WebP animation: invalid RIFF/WEBP');

  Inner := Data + 12;
  Left := Size - 12;

  HasAnimation := False;

  P := Inner;

  while Left >= 8 do
  begin
    ChunkCode := ReadLE32(P);
    ChunkSize := ReadLE32(P + 4);

    if (ChunkCode = FourCC('VP8X')) and (ChunkSize >= 10) then
    begin
      VP8XFlags := ReadLE32(P + 8);

      HasAnimation := (VP8XFlags and 2) <> 0;

      FWidth := Integer(ReadLE24(P + 12)) + 1;
      FHeight := Integer(ReadLE24(P + 15)) + 1;
    end
    else if (ChunkCode = FourCC('ANIM')) and (ChunkSize >= 6) then
    begin
      FBgColor := ReadLE32(P + 8);
      FLoopCount := Integer(ReadLE16(P + 12));
    end;

    ChunkSize := (ChunkSize + 1) and not Cardinal(1);

    if NativeUInt(8) + ChunkSize > Left then
      Break;

    Inc(P, 8 + ChunkSize);

    Dec(Left, 8 + ChunkSize);
  end;

  if not HasAnimation then
  begin
    SinglePixels := WebPDecodeBGRA(Data, Size, SW, SH);

    if SinglePixels = nil then
      raise Exception.Create('WebP animation: decode failed');

    try
      FrameBitmap := BitmapFromBGRA(SinglePixels, SW, SH);
    finally
      WebPFree(SinglePixels);
    end;

    SetLength(FFrames, 1);

    FFrames[0].Bitmap := FrameBitmap;
    FFrames[0].Duration := 0;

    FWidth := SW;
    FHeight := SH;

    Exit;
  end;

  if (FWidth <= 0) or (FHeight <= 0) then
    raise Exception.Create('WebP animation: invalid canvas');

  CanvasBytes := NativeUInt(FWidth) * NativeUInt(FHeight) * 4;

  GetMem(Canvas, CanvasBytes);

  try
    FillChar(Canvas^, CanvasBytes, 0);

    P := Inner;
    Left := Size - 12;

    while Left >= 8 do
    begin
      ChunkCode := ReadLE32(P);
      ChunkSize := ReadLE32(P + 4);

      if (ChunkCode = FourCC('ANMF')) and (ChunkSize >= 16) then
      begin
        FrameBase := P + 8;

        FX := Integer(ReadLE24(FrameBase + 0)) * 2;
        FY := Integer(ReadLE24(FrameBase + 3)) * 2;
        FW := Integer(ReadLE24(FrameBase + 6)) + 1;
        FH := Integer(ReadLE24(FrameBase + 9)) + 1;

        FDuration := Integer(ReadLE24(FrameBase + 12));

        FrameFlags := FrameBase[15];

        DoNotBlend := (FrameFlags and 2) <> 0;

        DisposeBackground := (FrameFlags and 1) <> 0;

        Sub := FrameBase + 16;

        FramePixels := DecodeFrame(Sub, NativeUInt(ChunkSize) - 16, FW, FH);

        if FramePixels <> nil then
        begin
          try
            for Row := 0 to FH - 1 do
            begin
              CY := FY + Row;

              if (CY < 0) or (CY >= FHeight) then
                Continue;

              for Col := 0 to FW - 1 do
              begin
                CX := FX + Col;

                if (CX < 0) or (CX >= FWidth) then
                  Continue;

                Src := FramePixels + (Row * FW + Col) * 4;

                Dst := Canvas + (CY * FWidth + CX) * 4;

                if DoNotBlend then
                begin
                  Dst[0] := Src[0];
                  Dst[1] := Src[1];
                  Dst[2] := Src[2];
                  Dst[3] := Src[3];
                end
                else
                  BlendOver(Dst, Src);
              end;
            end;

          finally
            WebPFree(FramePixels);
          end;

          FrameBitmap := BitmapFromBGRA(Canvas, FWidth, FHeight);

          N := Length(FFrames);

          SetLength(FFrames, N + 1);

          FFrames[N].Bitmap := FrameBitmap;
          FFrames[N].Duration := FDuration;

          if DisposeBackground then
          begin
            for Row := 0 to FH - 1 do
            begin
              CY := FY + Row;

              if (CY < 0) or (CY >= FHeight) then
                Continue;

              for Col := 0 to FW - 1 do
              begin
                CX := FX + Col;

                if (CX < 0) or (CX >= FWidth) then
                  Continue;

                Dst := Canvas + (CY * FWidth + CX) * 4;

                Dst[0] := 0;
                Dst[1] := 0;
                Dst[2] := 0;
                Dst[3] := 0;
              end;
            end;
          end;
        end;
      end;

      ChunkSize := (ChunkSize + 1) and not Cardinal(1);

      if NativeUInt(8) + ChunkSize > Left then
        Break;

      Inc(P, 8 + ChunkSize);

      Dec(Left, 8 + ChunkSize);
    end;

  finally
    FreeMem(Canvas);
  end;

  if Length(FFrames) = 0 then
    raise Exception.Create('WebP animation: no frames decoded');
end;

end.
