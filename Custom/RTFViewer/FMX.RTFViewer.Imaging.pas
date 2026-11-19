
unit FMX.RTFViewer.Imaging;

interface

uses
  System.SysUtils,
  FMX.Graphics;

function RTFLoadEMF(const ABytes: TBytes; AWidth, AHeight: Integer)
  : FMX.Graphics.TBitmap;
function RTFLoadWMF(const ABytes: TBytes; AMapMode, APictureWidth,
  APictureHeight, AOutputWidth, AOutputHeight: Integer): FMX.Graphics.TBitmap;
function RTFLoadDIB(const ABytes: TBytes): FMX.Graphics.TBitmap;

implementation

uses
  System.Classes, System.Math, System.Types, System.UITypes,
  Winapi.Windows;

type
  TRTFBitmapFileHeader = packed record
    BfType: Word;
    BfSize: Cardinal;
    BfReserved1: Word;
    BfReserved2: Word;
    BfOffBits: Cardinal;
  end;

  TRTFDIBInfoHeader = packed record
    BiSize: Cardinal;
    BiWidth: LongInt;
    BiHeight: LongInt;
    BiPlanes: Word;
    BiBitCount: Word;
    BiCompression: Cardinal;
    BiSizeImage: Cardinal;
    BiXPelsPerMeter: LongInt;
    BiYPelsPerMeter: LongInt;
    BiClrUsed: Cardinal;
    BiClrImportant: Cardinal;
  end;

  TRTFDIBCoreHeader = packed record
    BcSize: Cardinal;
    BcWidth: Word;
    BcHeight: Word;
    BcPlanes: Word;
    BcBitCount: Word;
  end;

  TRTFDIBSectionInfo = packed record
    Header: TRTFDIBInfoHeader;
    Colors: array [0 .. 0] of Cardinal;
  end;

  TRTFEnhMetaHeader = packed record
    IType: Cardinal;
    NSize: Cardinal;
    Bounds: TRect;
    Frame: TRect;
    Signature: Cardinal;
    Version: Cardinal;
    Bytes: Cardinal;
    Records: Cardinal;
    Handles: Word;
    Reserved: Word;
    DescriptionCount: Cardinal;
    DescriptionOffset: Cardinal;
    PaletteEntries: Cardinal;
    DeviceCX: LongInt;
    DeviceCY: LongInt;
    MillimetersCX: LongInt;
    MillimetersCY: LongInt;
    PixelFormatSize: Cardinal;
    PixelFormatOffset: Cardinal;
    OpenGL: Cardinal;
    MicrometersCX: LongInt;
    MicrometersCY: LongInt;
  end;

  TRTFPlaceableWMFHeader = packed record
    Key: Cardinal;
    Hmf: Word;
    Left: SmallInt;
    Top: SmallInt;
    Right: SmallInt;
    Bottom: SmallInt;
    Inch: Word;
    Reserved: Cardinal;
    Checksum: Word;
  end;

  TRTFMetaFilePict = record
    MM: LongInt;
    XExt: LongInt;
    YExt: LongInt;
    Hmf: THandle;
  end;

function RTFSetEnhMetaFileBits(ASize: Cardinal; AData: PByte): THandle; stdcall;
  external 'gdi32.dll' name 'SetEnhMetaFileBits';
function RTFGetEnhMetaFileHeader(AMetafile: THandle; ASize: Cardinal;
  AHeader: Pointer): Cardinal; stdcall;
  external 'gdi32.dll' name 'GetEnhMetaFileHeader';
function RTFDeleteEnhMetaFile(AMetafile: THandle): LongBool; stdcall;
  external 'gdi32.dll' name 'DeleteEnhMetaFile';
function RTFPlayEnhMetaFile(ADC: HDC; AMetafile: THandle; ARect: Pointer)
  : LongBool; stdcall; external 'gdi32.dll' name 'PlayEnhMetaFile';
function RTFSetWinMetaFileBits(ASize: Cardinal; AData: PByte; AReferenceDC: HDC;
  AMetaFilePict: Pointer): THandle; stdcall;
  external 'gdi32.dll' name 'SetWinMetaFileBits';
function RTFCreateDIBSection(ADC: HDC; AInfo: Pointer; AUsage: Cardinal;
  var ABits: Pointer; ASection: THandle; AOffset: Cardinal): HBITMAP; stdcall;
  external 'gdi32.dll' name 'CreateDIBSection';

const
  RTF_DIB_RGB_COLORS = 0;
  RTF_BI_RGB = 0;
  RTF_BI_BITFIELDS = 3;
  RTF_BI_ALPHABITFIELDS = 6;
  RTF_MM_HIMETRIC = 3;
  RTF_MM_ANISOTROPIC = 8;
  RTF_WMF_PLACEABLE_KEY = $9AC6CDD7;
  RTF_MAX_METAFILE_DIMENSION = 4096;
  RTF_MAX_METAFILE_PIXELS = 16777216;

function RTFClampRasterSize(var AWidth, AHeight: Integer): Boolean;
var
  LScale: Double;
  LPixelCount: Int64;
begin
  Result := False;
  if (AWidth <= 0) or (AHeight <= 0) then
    Exit;

  LScale := 1.0;
  if (AWidth > RTF_MAX_METAFILE_DIMENSION) or
    (AHeight > RTF_MAX_METAFILE_DIMENSION) then
    LScale := Min(LScale, Min(RTF_MAX_METAFILE_DIMENSION / AWidth,
      RTF_MAX_METAFILE_DIMENSION / AHeight));

  LPixelCount := Int64(AWidth) * Int64(AHeight);
  if LPixelCount > RTF_MAX_METAFILE_PIXELS then
    LScale := Min(LScale, Sqrt(RTF_MAX_METAFILE_PIXELS / Double(LPixelCount)));

  if LScale < 1.0 then
  begin
    AWidth := Max(1, Round(AWidth * LScale));
    AHeight := Max(1, Round(AHeight * LScale));
  end;
  Result := True;
end;

function RTFRasterizeEnhMetafile(AMetafile: THandle; AWidth, AHeight: Integer)
  : FMX.Graphics.TBitmap;
var
  LHeader: TRTFEnhMetaHeader;
  LFrameWidth, LFrameHeight: Int64;
  LDC: HDC;
  LBitmapHandle, LOldBitmap: HBITMAP;
  LBitmapInfo: TRTFDIBSectionInfo;
  LBits: Pointer;
  LRect: TRect;
  LBitmapData: FMX.Graphics.TBitmapData;
  LSource: PByte;
  LX, LY: Integer;
  LPixel: TAlphaColor;
begin
  Result := nil;
  if AMetafile = 0 then
    Exit;

  if RTFGetEnhMetaFileHeader(AMetafile, SizeOf(LHeader), @LHeader) = 0 then
    FillChar(LHeader, SizeOf(LHeader), 0);

  if AWidth <= 0 then
  begin
    LFrameWidth := Int64(LHeader.Frame.Right) - LHeader.Frame.Left;
    if LFrameWidth > 0 then
      AWidth := Round(LFrameWidth * 96.0 / 2540.0)
    else
      AWidth := Abs(LHeader.Bounds.Right - LHeader.Bounds.Left);
  end;
  if AHeight <= 0 then
  begin
    LFrameHeight := Int64(LHeader.Frame.Bottom) - LHeader.Frame.Top;
    if LFrameHeight > 0 then
      AHeight := Round(LFrameHeight * 96.0 / 2540.0)
    else
      AHeight := Abs(LHeader.Bounds.Bottom - LHeader.Bounds.Top);
  end;
  if (AWidth <= 0) or (AHeight <= 0) then
    Exit;
  if not RTFClampRasterSize(AWidth, AHeight) then
    Exit;

  LDC := CreateCompatibleDC(0);
  if LDC = 0 then
    Exit;
  LBitmapHandle := 0;
  LOldBitmap := 0;
  LBits := nil;
  try
    FillChar(LBitmapInfo, SizeOf(LBitmapInfo), 0);
    LBitmapInfo.Header.BiSize := SizeOf(TRTFDIBInfoHeader);
    LBitmapInfo.Header.BiWidth := AWidth;
    LBitmapInfo.Header.BiHeight := -AHeight; // top-down DIB
    LBitmapInfo.Header.BiPlanes := 1;
    LBitmapInfo.Header.BiBitCount := 32;
    LBitmapInfo.Header.BiCompression := RTF_BI_RGB;
    LBitmapInfo.Header.BiSizeImage := Cardinal(Int64(AWidth) * AHeight * 4);

    LBitmapHandle := RTFCreateDIBSection(LDC, @LBitmapInfo, RTF_DIB_RGB_COLORS,
      LBits, 0, 0);
    if (LBitmapHandle = 0) or (LBits = nil) then
      Exit;

    LOldBitmap := HBITMAP(SelectObject(LDC, LBitmapHandle));
    // GDI metafiles do not consistently write alpha. Render on opaque white.
    FillChar(LBits^, Integer(Int64(AWidth) * AHeight * 4), $FF);
    LRect := Rect(0, 0, AWidth, AHeight);
    if not RTFPlayEnhMetaFile(LDC, AMetafile, @LRect) then
      Exit;

    Result := FMX.Graphics.TBitmap.Create;
    try
      Result.SetSize(AWidth, AHeight);
      if not Result.Map(FMX.Graphics.TMapAccess.Write, LBitmapData) then
        raise Exception.Create
          ('Unable to map FMX bitmap for metafile rendering');
      try
        for LY := 0 to AHeight - 1 do
        begin
          LSource := PByte(NativeUInt(LBits) + NativeUInt(LY) *
            NativeUInt(AWidth) * NativeUInt(4));
          for LX := 0 to AWidth - 1 do
          begin
            // DIB memory is BGRA; TAlphaColor is $AARRGGBB.
            LPixel := $FF000000 or (Cardinal(LSource[2]) shl 16) or
              (Cardinal(LSource[1]) shl 8) or Cardinal(LSource[0]);
            LBitmapData.SetPixel(LX, LY, LPixel);
            Inc(LSource, 4);
          end;
        end;
      finally
        Result.Unmap(LBitmapData);
      end;
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    if LOldBitmap <> 0 then
      SelectObject(LDC, LOldBitmap);
    if LBitmapHandle <> 0 then
      DeleteObject(LBitmapHandle);
    DeleteDC(LDC);
  end;
end;

function RTFLoadEMF(const ABytes: TBytes; AWidth, AHeight: Integer)
  : FMX.Graphics.TBitmap;
var
  LMetafile: THandle;
begin
  Result := nil;
  if Length(ABytes) < 88 then
    Exit;
  LMetafile := RTFSetEnhMetaFileBits(Cardinal(Length(ABytes)), @ABytes[0]);
  if LMetafile = 0 then
    Exit;
  try
    Result := RTFRasterizeEnhMetafile(LMetafile, AWidth, AHeight);
  finally
    RTFDeleteEnhMetaFile(LMetafile);
  end;
end;

function RTFLoadWMF(const ABytes: TBytes; AMapMode, APictureWidth,
  APictureHeight, AOutputWidth, AOutputHeight: Integer): FMX.Graphics.TBitmap;
var
  LOffset: Integer;
  LHeader: TRTFPlaceableWMFHeader;
  LMetaFilePict: TRTFMetaFilePict;
  LReferenceDC: HDC;
  LMetafile: THandle;
  LLogicalWidth, LLogicalHeight: Integer;
begin
  Result := nil;
  if Length(ABytes) < 18 then
    Exit;

  LOffset := 0;
  LLogicalWidth := 0;
  LLogicalHeight := 0;
  FillChar(LHeader, SizeOf(LHeader), 0);
  if Length(ABytes) >= SizeOf(LHeader) then
  begin
    Move(ABytes[0], LHeader, SizeOf(LHeader));
    if LHeader.Key = RTF_WMF_PLACEABLE_KEY then
    begin
      LOffset := SizeOf(LHeader);
      if (LHeader.Inch = 0) or (LHeader.Right <= LHeader.Left) or
        (LHeader.Bottom <= LHeader.Top) then
        Exit;
      LLogicalWidth := LHeader.Right - LHeader.Left;
      LLogicalHeight := LHeader.Bottom - LHeader.Top;
    end;
  end;

  if LOffset = 0 then
  begin
    LLogicalWidth := APictureWidth;
    LLogicalHeight := APictureHeight;
  end;
  if LLogicalWidth <= 0 then
    LLogicalWidth := AOutputWidth;
  if LLogicalHeight <= 0 then
    LLogicalHeight := AOutputHeight;
  if (LLogicalWidth <= 0) or (LLogicalHeight <= 0) then
    Exit;

  FillChar(LMetaFilePict, SizeOf(LMetaFilePict), 0);
  if LOffset <> 0 then
  begin
    // The Aldus header gives logical units per inch. Convert its bounding
    // extent to HIMETRIC so SetWinMetaFileBits can preserve physical size.
    LMetaFilePict.MM := RTF_MM_HIMETRIC;
    LMetaFilePict.XExt := Round(Int64(LLogicalWidth) * 2540 / LHeader.Inch);
    LMetaFilePict.YExt := Round(Int64(LLogicalHeight) * 2540 / LHeader.Inch);
  end
  else
  begin
    if (AMapMode >= 1) and (AMapMode <= 8) then
      LMetaFilePict.MM := AMapMode
    else
      LMetaFilePict.MM := RTF_MM_ANISOTROPIC;
    LMetaFilePict.XExt := LLogicalWidth;
    LMetaFilePict.YExt := LLogicalHeight;
  end;

  LReferenceDC := CreateCompatibleDC(0);
  if LReferenceDC = 0 then
    Exit;
  try
    LMetafile := RTFSetWinMetaFileBits(Cardinal(Length(ABytes) - LOffset),
      @ABytes[LOffset], LReferenceDC, @LMetaFilePict);
  finally
    DeleteDC(LReferenceDC);
  end;
  if LMetafile = 0 then
    Exit;
  try
    Result := RTFRasterizeEnhMetafile(LMetafile, AOutputWidth, AOutputHeight);
  finally
    RTFDeleteEnhMetaFile(LMetafile);
  end;
end;

function RTFLoadDIB(const ABytes: TBytes): FMX.Graphics.TBitmap;
var
  LHeader: TRTFDIBInfoHeader;
  LCoreHeader: TRTFDIBCoreHeader;
  LFileHeader: TRTFBitmapFileHeader;
  LHeaderSize, LMaskBytes, LColorCount, LColorBytes: UInt64;
  LBitsOffset: UInt64;
  LBitCount: Word;
  LCompression: Cardinal;
  LStream: TMemoryStream;
begin
  Result := nil;
  if Length(ABytes) < 12 then
    Exit;

  // Some producers include a complete BMP file header despite \dibitmap.
  if (ABytes[0] = Ord('B')) and (ABytes[1] = Ord('M')) then
  begin
    LStream := TMemoryStream.Create;
    try
      LStream.WriteBuffer(ABytes[0], Length(ABytes));
      LStream.Position := 0;
      Result := FMX.Graphics.TBitmap.Create;
      try
        Result.LoadFromStream(LStream);
      except
        FreeAndNil(Result);
      end;
    finally
      LStream.Free;
    end;
    Exit;
  end;

  LHeaderSize := 0;
  Move(ABytes[0], LHeaderSize, SizeOf(Cardinal));
  if LHeaderSize = 12 then
  begin
    Move(ABytes[0], LCoreHeader, SizeOf(LCoreHeader));
    LBitCount := LCoreHeader.BcBitCount;
    LMaskBytes := 0;
    LColorCount := 0;
    if LBitCount <= 8 then
      LColorCount := UInt64(1) shl LBitCount;
    LColorBytes := LColorCount * 3;
  end
  else
  begin
    if (LHeaderSize < SizeOf(LHeader)) or
      (LHeaderSize > Cardinal(Length(ABytes))) then
      Exit;
    Move(ABytes[0], LHeader, SizeOf(LHeader));
    LBitCount := LHeader.BiBitCount;
    LCompression := LHeader.BiCompression;
    LMaskBytes := 0;
    if (LHeader.BiSize = 40) and (LCompression = RTF_BI_BITFIELDS) then
      LMaskBytes := 12
    else if (LHeader.BiSize = 40) and (LCompression = RTF_BI_ALPHABITFIELDS)
    then
      LMaskBytes := 16;
    LColorCount := LHeader.BiClrUsed;
    if (LColorCount = 0) and (LBitCount <= 8) then
      LColorCount := UInt64(1) shl LBitCount;
    LColorBytes := LColorCount * 4;
    if (LHeader.BiWidth <= 0) or (LHeader.BiHeight = 0) or
      (LHeader.BiHeight = Low(LongInt)) or
      (Int64(LHeader.BiWidth) * Abs(Int64(LHeader.BiHeight)) >
      RTF_MAX_METAFILE_PIXELS) then
      Exit;
  end;

  if (LHeaderSize = 12) and ((LCoreHeader.BcWidth = 0) or
    (LCoreHeader.BcHeight = 0) or (Int64(LCoreHeader.BcWidth) *
    LCoreHeader.BcHeight > RTF_MAX_METAFILE_PIXELS)) then
    Exit;

  LBitsOffset := LHeaderSize + LMaskBytes + LColorBytes;
  if (LBitsOffset > UInt64(Length(ABytes))) or (LBitsOffset > High(Cardinal)) or
    (UInt64(Length(ABytes)) + SizeOf(LFileHeader) > High(Cardinal)) then
    Exit;

  FillChar(LFileHeader, SizeOf(LFileHeader), 0);
  LFileHeader.BfType := $4D42; // 'BM'
  LFileHeader.BfSize := Cardinal(Length(ABytes) + SizeOf(LFileHeader));
  LFileHeader.BfOffBits := Cardinal(SizeOf(LFileHeader) + LBitsOffset);

  LStream := TMemoryStream.Create;
  try
    LStream.WriteBuffer(LFileHeader, SizeOf(LFileHeader));
    LStream.WriteBuffer(ABytes[0], Length(ABytes));
    LStream.Position := 0;
    Result := FMX.Graphics.TBitmap.Create;
    try
      Result.LoadFromStream(LStream);
    except
      FreeAndNil(Result);
    end;
  finally
    LStream.Free;
  end;
end;

end.
