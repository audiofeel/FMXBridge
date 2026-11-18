unit FMXBridge.GIF.WIC;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.ActiveX,
  Winapi.Wincodec,
  FMXBridge.GIF.Types;

type
  TGIFWICDecoder = class
  private
    FFactory: IWICImagingFactory;
    FDecoder: IWICBitmapDecoder;
    FCanvasWidth: Integer;
    FCanvasHeight: Integer;
    FFrameCount: Integer;
    FBackgroundColor: Cardinal; // ARGB WICColor
    FBackgroundColorIndex: Integer;
    FHasGlobalPalette: Boolean;
    function TryGetMetadata(const AReader: IWICMetadataQueryReader;
      const AName: string; out AValue: TPropVariant): Boolean;
    function TryGetUInt16(const AReader: IWICMetadataQueryReader;
      const AName: string; out AValue: Word): Boolean;
    function TryGetUInt8(const AReader: IWICMetadataQueryReader;
      const AName: string; out AValue: Byte): Boolean;
    function TryGetBoolean(const AReader: IWICMetadataQueryReader;
      const AName: string; out AValue: Boolean): Boolean;
    procedure ReadGlobalMetadata;
    procedure ReadBackgroundColor(const AReader: IWICMetadataQueryReader);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Open(const AFileName: string);
    procedure Close;
    procedure DecodeFrame(const AIndex: Integer; out AFrame: TGIFRawFrame);
    property CanvasWidth: Integer read FCanvasWidth;
    property CanvasHeight: Integer read FCanvasHeight;
    property FrameCount: Integer read FFrameCount;
    property BackgroundColor: Cardinal read FBackgroundColor;
    property BackgroundColorIndex: Integer read FBackgroundColorIndex;
    property HasGlobalPalette: Boolean read FHasGlobalPalette;
  end;

implementation

constructor TGIFWICDecoder.Create;
begin
  inherited Create;
  FBackgroundColorIndex := -1;
end;

destructor TGIFWICDecoder.Destroy;
begin
  Close;
  inherited;
end;

procedure TGIFWICDecoder.Close;
begin
  FDecoder := nil;
  FFactory := nil;
  FCanvasWidth := 0;
  FCanvasHeight := 0;
  FFrameCount := 0;
  FBackgroundColor := 0;
  FBackgroundColorIndex := -1;
  FHasGlobalPalette := False;
end;

function TGIFWICDecoder.TryGetMetadata(
  const AReader: IWICMetadataQueryReader; const AName: string;
  out AValue: TPropVariant): Boolean;
begin
  FillChar(AValue, SizeOf(AValue), 0);
  Result := False;

  if AReader = nil then
    Exit;

  Result := AReader.GetMetadataByName(PWideChar(AName), AValue) >= 0;
end;

function TGIFWICDecoder.TryGetUInt16(
  const AReader: IWICMetadataQueryReader; const AName: string;
  out AValue: Word): Boolean;
var
  V: TPropVariant;
begin
  AValue := 0;
  Result := TryGetMetadata(AReader, AName, V) and (V.vt = VT_UI2);
  if Result then
    AValue := V.uiVal;
end;

function TGIFWICDecoder.TryGetUInt8(
  const AReader: IWICMetadataQueryReader; const AName: string;
  out AValue: Byte): Boolean;
var
  V: TPropVariant;
begin
  AValue := 0;
  Result := TryGetMetadata(AReader, AName, V) and (V.vt = VT_UI1);
  if Result then
    AValue := V.bVal;
end;

function TGIFWICDecoder.TryGetBoolean(
  const AReader: IWICMetadataQueryReader; const AName: string;
  out AValue: Boolean): Boolean;
var
  V: TPropVariant;
begin
  AValue := False;
  Result := TryGetMetadata(AReader, AName, V) and (V.vt = VT_BOOL);
  if Result then
    AValue := V.boolVal <> 0;
end;

procedure TGIFWICDecoder.ReadBackgroundColor(
  const AReader: IWICMetadataQueryReader);
var
  Palette: IWICPalette;
  Colors: array[0..255] of WICColor;
  ColorCount: UINT;
  BackgroundIndex: Byte;
begin
  FBackgroundColor := 0;
  FBackgroundColorIndex := -1;
  FHasGlobalPalette := False;

  if not TryGetBoolean(AReader, '/logscrdesc/GlobalColorTableFlag',
    FHasGlobalPalette) then
    FHasGlobalPalette := False;

  if not FHasGlobalPalette then
    Exit;

  if not TryGetUInt8(AReader, '/logscrdesc/BackgroundColorIndex',
    BackgroundIndex) then
    Exit;

  FBackgroundColorIndex := BackgroundIndex;

  OleCheck(FFactory.CreatePalette(Palette));
  OleCheck(FDecoder.CopyPalette(Palette));

  ColorCount := 0;
  OleCheck(Palette.GetColors(Length(Colors), @Colors[0], ColorCount));

  if BackgroundIndex < ColorCount then
    FBackgroundColor := Colors[BackgroundIndex];
end;

procedure TGIFWICDecoder.ReadGlobalMetadata;
var
  Reader: IWICMetadataQueryReader;
  W, H: Word;
  FrameCountValue: UINT;
begin
  Reader := nil;
  OleCheck(FDecoder.GetMetadataQueryReader(Reader));

  if not TryGetUInt16(Reader, '/logscrdesc/Width', W) then
    raise EGIFDecodeError.Create('GIF logical screen width is missing');

  if not TryGetUInt16(Reader, '/logscrdesc/Height', H) then
    raise EGIFDecodeError.Create('GIF logical screen height is missing');

  if (W = 0) or (H = 0) then
    raise EGIFDecodeError.Create('GIF logical screen has invalid dimensions');

  FCanvasWidth := W;
  FCanvasHeight := H;

  OleCheck(FDecoder.GetFrameCount(FrameCountValue));
  if FrameCountValue = 0 then
    raise EGIFDecodeError.Create('GIF contains no frames');

  if FrameCountValue > Cardinal(MaxInt) then
    raise EGIFDecodeError.Create('GIF contains too many frames');

  FFrameCount := Integer(FrameCountValue);
  ReadBackgroundColor(Reader);
end;

procedure TGIFWICDecoder.Open(const AFileName: string);
var
  FileName: string;
begin
  Close;

  FileName := ExpandFileName(AFileName);
  if not FileExists(FileName) then
    raise EFOpenError.CreateFmt('GIF file not found: %s',
      [FileName]);

  // This class is intended to be created and used entirely on the worker
  // thread. That thread must call CoInitializeEx before Open.
  OleCheck(CoCreateInstance(
    CLSID_WICImagingFactory,
    nil,
    CLSCTX_INPROC_SERVER,
    IID_IWICImagingFactory,
    FFactory
  ));

  try
    OleCheck(FFactory.CreateDecoderFromFilename(
      PWideChar(FileName),
      GUID_NULL,
      GENERIC_READ,
      WICDecodeMetadataCacheOnLoad,
      FDecoder
    ));

    ReadGlobalMetadata;
  except
    Close;
    raise;
  end;
end;

procedure TGIFWICDecoder.DecodeFrame(const AIndex: Integer;
  out AFrame: TGIFRawFrame);
var
  Frame: IWICBitmapFrameDecode;
  Source: IWICBitmapSource;
  Converter: IWICFormatConverter;
  Reader: IWICMetadataQueryReader;
  FrameWidth, FrameHeight: UINT;
  LeftValue, TopValue: Word;
  DelayValue: Word;
  DisposalValue, TransparentIndex: Byte;
  Stride: UINT;
  BufferSize: UInt64;
begin
  AFrame := Default(TGIFRawFrame);

  if FDecoder = nil then
    raise EGIFDecodeError.Create('GIF decoder is not open');

  if (AIndex < 0) or (AIndex >= FFrameCount) then
    raise EArgumentOutOfRangeException.CreateFmt(
      'GIF frame index %d is out of range', [AIndex]);

  Frame := nil;
  Converter := nil;
  Reader := nil;

  OleCheck(FDecoder.GetFrame(AIndex, Frame));
  OleCheck(Frame.GetSize(FrameWidth, FrameHeight));

  if (FrameWidth = 0) or (FrameHeight = 0) then
    raise EGIFDecodeError.CreateFmt('GIF frame %d has invalid dimensions',
      [AIndex]);

  if (FrameWidth > Cardinal(MaxInt div 4)) or
     (FrameHeight > Cardinal(MaxInt div 4)) then
    raise EOutOfMemory.Create('GIF frame is too large');

  AFrame.Info.Left := 0;
  AFrame.Info.Top := 0;
  AFrame.Info.Width := Integer(FrameWidth);
  AFrame.Info.Height := Integer(FrameHeight);
  AFrame.Info.DelayMS := 0;
  AFrame.Info.Disposal := gdmUnspecified;
  AFrame.Info.HasTransparency := False;
  AFrame.Info.HasLocalPalette := False;
  AFrame.Info.TransparentIndex := 0;

  OleCheck(Frame.GetMetadataQueryReader(Reader));

  if TryGetUInt16(Reader, '/imgdesc/Left', LeftValue) then
    AFrame.Info.Left := LeftValue;

  if TryGetUInt16(Reader, '/imgdesc/Top', TopValue) then
    AFrame.Info.Top := TopValue;

  // Frame.GetSize is authoritative for the decoded raw frame rectangle.
  // GIF descriptor width/height are not used to size the output buffer.

  TryGetBoolean(Reader, '/imgdesc/LocalColorTableFlag',
    AFrame.Info.HasLocalPalette);

  if TryGetUInt16(Reader, '/grctlext/Delay', DelayValue) then
    AFrame.Info.DelayMS := Cardinal(DelayValue) * 10;

  if TryGetUInt8(Reader, '/grctlext/Disposal', DisposalValue) then
  begin
    case DisposalValue of
      1: AFrame.Info.Disposal := gdmDoNotDispose;
      2: AFrame.Info.Disposal := gdmRestoreBackground;
      3: AFrame.Info.Disposal := gdmRestorePrevious;
    else
      AFrame.Info.Disposal := gdmUnspecified;
    end;
  end;

  if TryGetBoolean(Reader, '/grctlext/TransparencyFlag',
    AFrame.Info.HasTransparency) and AFrame.Info.HasTransparency then
  begin
    if TryGetUInt8(Reader, '/grctlext/TransparentColorIndex',
      TransparentIndex) then
      AFrame.Info.TransparentIndex := TransparentIndex;
  end;

  Source := Frame as IWICBitmapSource;
  OleCheck(FFactory.CreateFormatConverter(Converter));
  OleCheck(Converter.Initialize(
    Source,
    GUID_WICPixelFormat32bppPBGRA,
    WICBitmapDitherTypeNone,
    nil,
    0,
    WICBitmapPaletteTypeCustom
  ));

  Stride := FrameWidth * 4;
  BufferSize := UInt64(Stride) * FrameHeight;

  if BufferSize > UInt64(MaxInt) then
    raise EOutOfMemory.Create('Decoded GIF frame exceeds the supported buffer size');

  SetLength(AFrame.Pixels, Integer(BufferSize));

  if BufferSize > 0 then
    OleCheck(Converter.CopyPixels(
      nil,
      Stride,
      UINT(BufferSize),
      @AFrame.Pixels[0]
    ));
end;

end.
