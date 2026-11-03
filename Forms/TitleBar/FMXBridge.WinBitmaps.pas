
unit FMXBridge.WinBitmaps;

interface

uses
  System.UITypes,
  Winapi.Windows,
  FMX.Graphics;

function HIconToFMXBitmap(Icon: HICON; Dest: FMX.Graphics.TBitmap): Boolean;
procedure LoadIconToFMX(const FileName: WideString;
  Dest: FMX.Graphics.TBitmap); overload;

procedure LoadIconToFMX(const FileName: WideString; Dest: FMX.Graphics.TBitmap;
  Size: Integer); overload;

implementation

uses
  System.SysUtils,
  System.Types,
  System.UIConsts,
  FMX.Types;

function GetBitmapBits32(DC: HDC; Bitmap: HBITMAP; Width, Height: Integer;
  out Bits: TBytes): Boolean;
var
  FBitmapInfo: BITMAPINFO;
begin
  Result := False;

  if (Bitmap = 0) or (Width <= 0) or (Height <= 0) then
    Exit;

  FillChar(FBitmapInfo, SizeOf(BITMAPINFO), 0);

  FBitmapInfo.bmiHeader.biSize := SizeOf(BITMAPINFOHEADER);
  FBitmapInfo.bmiHeader.biWidth := Width;
  FBitmapInfo.bmiHeader.biHeight := -Height;
  FBitmapInfo.bmiHeader.biPlanes := 1;
  FBitmapInfo.bmiHeader.biBitCount := 32;
  FBitmapInfo.bmiHeader.biCompression := BI_RGB;

  SetLength(Bits, Width * Height * 4);

  Result := GetDIBits(DC, Bitmap, 0, Height, @Bits[0], FBitmapInfo,
    DIB_RGB_COLORS) = Height;
end;

function GetBitmapMaskBits(DC: HDC; Bitmap: HBITMAP; Width, Height: Integer;
  out Bits: TBytes; out Pitch: Integer): Boolean;
var
  FBitmapInfo: BITMAPINFO;
begin
  Result := False;
  Pitch := 0;

  if (Bitmap = 0) or (Width <= 0) or (Height <= 0) then
    Exit;

  Pitch := ((Width + 31) div 32) * 4;

  FillChar(FBitmapInfo, SizeOf(BITMAPINFO), 0);

  FBitmapInfo.bmiHeader.biSize := SizeOf(BITMAPINFOHEADER);
  FBitmapInfo.bmiHeader.biWidth := Width;
  FBitmapInfo.bmiHeader.biHeight := -Height;
  FBitmapInfo.bmiHeader.biPlanes := 1;
  FBitmapInfo.bmiHeader.biBitCount := 1;
  FBitmapInfo.bmiHeader.biCompression := BI_RGB;
  FBitmapInfo.bmiHeader.biClrUsed := 2;

  SetLength(Bits, Pitch * Height);

  Result := GetDIBits(DC, Bitmap, 0, Height, @Bits[0], FBitmapInfo,
    DIB_RGB_COLORS) = Height;
end;

function GetMaskBit(const Bits: TBytes; Pitch, X, Y: Integer): Boolean;
var
  ByteIndex: Integer;
  BitIndex: Integer;
begin
  ByteIndex := Y * Pitch + (X shr 3);
  BitIndex := 7 - (X and 7);

  Result := (Bits[ByteIndex] and (1 shl BitIndex)) <> 0;
end;

function HIconToFMXBitmap(Icon: HICON; Dest: FMX.Graphics.TBitmap): Boolean;
var
  FIconInfo: ICONINFO;
  Bitmap: Winapi.Windows.Bitmap;
  DC: HDC;

  ColorBits: TBytes;
  MaskBits: TBytes;

  Width: Integer;
  Height: Integer;
  MaskHeight: Integer;
  MaskPitch: Integer;

  HasAlpha: Boolean;

  X, Y: Integer;
  I: Integer;

  A, R, G, B: Byte;
  AlphaColor: TAlphaColor;

  Data: TBitmapData;
  DstLine: PByte;
  DstPixel: Pointer;
begin
  Result := False;
  HasAlpha := False;

  if (Icon = 0) or (Dest = nil) then
    Exit;

  FillChar(FIconInfo, SizeOf(ICONINFO), 0);

  if not GetIconInfo(Icon, FIconInfo) then
    Exit;

  DC := GetDC(0);

  try
    if DC = 0 then
      Exit;

    if FIconInfo.hbmColor <> 0 then
    begin
      FillChar(Bitmap, SizeOf(Bitmap), 0);

      if GetObject(FIconInfo.hbmColor, SizeOf(Bitmap), @Bitmap) = 0 then
        Exit;

      Width := Bitmap.bmWidth;
      Height := Abs(Bitmap.bmHeight);

      if (Width <= 0) or (Height <= 0) then
        Exit;

      if not GetBitmapBits32(DC, FIconInfo.hbmColor, Width, Height, ColorBits)
      then
        Exit;

      HasAlpha := False;

      I := 3;
      while I < Length(ColorBits) do
      begin
        if ColorBits[I] <> 0 then
        begin
          HasAlpha := True;
          Break;
        end;

        Inc(I, 4);
      end;

      if not HasAlpha and (FIconInfo.hbmMask <> 0) then
      begin
        if not GetBitmapMaskBits(DC, FIconInfo.hbmMask, Width, Height, MaskBits,
          MaskPitch) then
          MaskBits := nil;
      end;
    end
    else
    begin
      if FIconInfo.hbmMask = 0 then
        Exit;

      FillChar(Bitmap, SizeOf(Bitmap), 0);

      if GetObject(FIconInfo.hbmMask, SizeOf(Bitmap), @Bitmap) = 0 then
        Exit;

      Width := Bitmap.bmWidth;
      MaskHeight := Abs(Bitmap.bmHeight);

      if (Width <= 0) or (MaskHeight <= 0) then
        Exit;

      if (MaskHeight mod 2) <> 0 then
        Exit;

      Height := MaskHeight div 2;

      if not GetBitmapMaskBits(DC, FIconInfo.hbmMask, Width, MaskHeight,
        MaskBits, MaskPitch) then
        Exit;
    end;

  finally
    ReleaseDC(0, DC);

    if FIconInfo.hbmMask <> 0 then
      DeleteObject(FIconInfo.hbmMask);

    if FIconInfo.hbmColor <> 0 then
      DeleteObject(FIconInfo.hbmColor);
  end;

  Dest.SetSize(Width, Height);

  if not Dest.Map(TMapAccess.Write, Data) then
    Exit;

  try
    for Y := 0 to Height - 1 do
    begin
      DstLine := PByte(NativeInt(Data.Data) + NativeInt(Y) * Data.Pitch);

      for X := 0 to Width - 1 do
      begin
        if Length(ColorBits) <> 0 then
        begin
          I := (Y * Width + X) * 4;

          B := ColorBits[I + 0];
          G := ColorBits[I + 1];
          R := ColorBits[I + 2];
          A := ColorBits[I + 3];

          if not HasAlpha then
          begin
            if Length(MaskBits) <> 0 then
            begin
              if GetMaskBit(MaskBits, MaskPitch, X, Y) then
                A := 0
              else
                A := 255;
            end
            else
              A := 255;
          end;
        end
        else
        begin
          if GetMaskBit(MaskBits, MaskPitch, X, Y) then
          begin
            A := 0;
            R := 0;
            G := 0;
            B := 0;
          end
          else
          begin
            A := 255;

            if GetMaskBit(MaskBits, MaskPitch, X, Y + Height) then
            begin
              R := 255;
              G := 255;
              B := 255;
            end
            else
            begin
              R := 0;
              G := 0;
              B := 0;
            end;
          end;
        end;

        AlphaColor := (Cardinal(A) shl 24) or (Cardinal(R) shl 16) or
          (Cardinal(G) shl 8) or Cardinal(B);

        AlphaColor := PremultiplyAlpha(AlphaColor);

        DstPixel := Pointer(NativeInt(DstLine) + NativeInt(X) * 4);

        AlphaColorToPixel(AlphaColor, DstPixel, Dest.PixelFormat);
      end;
    end;

    Result := not Dest.IsEmpty;
  finally
    Dest.Unmap(Data);
  end;
end;

procedure LoadIconToFMX(const FileName: WideString; Dest: FMX.Graphics.TBitmap);
begin
  LoadIconToFMX(FileName, Dest, 0);
end;

procedure LoadIconToFMX(const FileName: WideString; Dest: FMX.Graphics.TBitmap;
  Size: Integer);
var
  Icon: HICON;
  Flags: UINT;
begin
  if (FileName = '') or (Dest = nil) then
    Exit;

  Flags := LR_LOADFROMFILE;

  if Size <= 0 then
    Flags := Flags or LR_DEFAULTSIZE;

  Icon := LoadImage(0, PWideChar(FileName), IMAGE_ICON, Size, Size, Flags);

  if Icon = 0 then
    Exit;

  try
    HIconToFMXBitmap(Icon, Dest);
  finally
    DestroyIcon(Icon);
  end;
end;

end.
