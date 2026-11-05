
unit WebPCodec;

interface

uses
  System.Classes, System.Types,
  FMX.Graphics, FMX.Surfaces,
  WebPDec;

type
  TWebPBitmapCodec = class(TCustomBitmapCodec)
  public
    class function GetImageSize(const AFileName: string): TPointF; override;
    class function IsValid(const AStream: TStream): Boolean; override;
    function LoadFromFile(const AFileName: string;
      const ABitmap: TBitmapSurface; const AMaxSizeLimit: Cardinal = 0)
      : Boolean; override;
    function LoadThumbnailFromFile(const AFileName: string;
      const AFitWidth, AFitHeight: Single; const UseEmbedded: Boolean;
      const ABitmap: TBitmapSurface): Boolean; override;
    function LoadFromStream(const AStream: TStream;
      const ABitmap: TBitmapSurface; const AMaxSizeLimit: Cardinal = 0)
      : Boolean; override;
    function SaveToFile(const AFileName: string; const ABitmap: TBitmapSurface;
      const ASaveParams: PBitmapCodecSaveParams = nil): Boolean; override;
    function SaveToStream(const AStream: TStream; const ABitmap: TBitmapSurface;
      const AExtension: string; const ASaveParams: PBitmapCodecSaveParams = nil)
      : Boolean; override;
  end;

implementation

uses
  System.SysUtils,
  FMX.Types,
  WebPEnc;

class function TWebPBitmapCodec.GetImageSize(const AFileName: string): TPointF;
var
  Stream: TFileStream;
  Data: TBytes;
  DataSize: NativeUInt;
  W, H: Integer;
begin
  Result := TPointF.Zero;

  Stream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  try
    DataSize := NativeUInt(Stream.Size - Stream.Position);

    if DataSize = 0 then
      Exit;

    SetLength(Data, DataSize);

    Stream.ReadBuffer(Data[0], DataSize);

    if WebPGetInfo(@Data[0], DataSize, W, H) then
      Result := PointF(W, H);

  finally
    Stream.Free;
  end;
end;

class function TWebPBitmapCodec.IsValid(const AStream: TStream): Boolean;
var
  OldPosition: Int64;
  Data: TBytes;
  DataSize: NativeUInt;
  W, H: Integer;
begin
  Result := False;

  if AStream = nil then
    Exit;

  OldPosition := AStream.Position;

  try
    DataSize := NativeUInt(AStream.Size - AStream.Position);

    if DataSize = 0 then
      Exit;

    SetLength(Data, DataSize);

    AStream.ReadBuffer(Data[0], DataSize);

    Result := WebPGetInfo(@Data[0], DataSize, W, H);

  finally
    AStream.Position := OldPosition;
  end;
end;

function TWebPBitmapCodec.LoadFromFile(const AFileName: string;
  const ABitmap: TBitmapSurface; const AMaxSizeLimit: Cardinal): Boolean;
var
  Stream: TFileStream;
begin
  Result := False;

  if ABitmap = nil then
    Exit;

  Stream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  try
    Result := LoadFromStream(Stream, ABitmap, AMaxSizeLimit);
  finally
    Stream.Free;
  end;
end;

function TWebPBitmapCodec.LoadFromStream(const AStream: TStream;
  const ABitmap: TBitmapSurface; const AMaxSizeLimit: Cardinal): Boolean;
var
  Data: TBytes;
  DataSize: NativeUInt;
  Pixels: PByte;
  W, H: Integer;
  Y: Integer;
  Src: PByte;
  Dst: PByte;
begin
  Result := False;

  if (AStream = nil) or (ABitmap = nil) then
    Exit;

  DataSize := NativeUInt(AStream.Size - AStream.Position);

  if DataSize = 0 then
    Exit;

  SetLength(Data, DataSize);

  AStream.ReadBuffer(Data[0], DataSize);

  Pixels := WebPDecodeBGRA(@Data[0], DataSize, W, H);

  if Pixels = nil then
    Exit;

  try
    if (AMaxSizeLimit <> 0) and ((W > Integer(AMaxSizeLimit)) or
      (H > Integer(AMaxSizeLimit))) then
      Exit;

    ABitmap.SetSize(W, H, TPixelFormat.BGRA);

    Src := Pixels;

    for Y := 0 to H - 1 do
    begin
      Dst := ABitmap.Scanline[Y];

      Move(Src^, Dst^, W * 4);

      Inc(Src, W * 4);
    end;

    Result := True;

  finally
    WebPFree(Pixels);
  end;
end;

function TWebPBitmapCodec.LoadThumbnailFromFile(const AFileName: string;
  const AFitWidth, AFitHeight: Single; const UseEmbedded: Boolean;
  const ABitmap: TBitmapSurface): Boolean;
begin

  Result := False;
end;

function TWebPBitmapCodec.SaveToFile(const AFileName: string;
  const ABitmap: TBitmapSurface;
  const ASaveParams: PBitmapCodecSaveParams): Boolean;
var
  Stream: TFileStream;
begin
  Result := False;

  if ABitmap = nil then
    Exit;

  Stream := TFileStream.Create(AFileName, fmCreate);
  try
    Result := SaveToStream(Stream, ABitmap, '.webp', ASaveParams);
  finally
    Stream.Free;
  end;
end;

function TWebPBitmapCodec.SaveToStream(const AStream: TStream;
  const ABitmap: TBitmapSurface; const AExtension: string;
  const ASaveParams: PBitmapCodecSaveParams): Boolean;
var
  W, H: Integer;
  Y: Integer;
  Quality: Integer;
  Buffer: PByte;
  Src: PByte;
  OutData: PByte;
  OutSize: Integer;
  Ok: Boolean;
begin
  Result := False;

  if (AStream = nil) or (ABitmap = nil) then
    Exit;

  W := ABitmap.Width;
  H := ABitmap.Height;

  if (W <= 0) or (H <= 0) then
    Exit;

  if ASaveParams <> nil then
    Quality := ASaveParams.Quality
  else
    Quality := 75;

  if Quality < 0 then
    Quality := 0
  else if Quality > 100 then
    Quality := 100;

  GetMem(Buffer, NativeInt(W) * H * 4);

  try
    for Y := 0 to H - 1 do
    begin
      Src := ABitmap.Scanline[Y];

      Move(Src^, (Buffer + NativeInt(Y) * W * 4)^, W * 4);
    end;

    OutData := nil;
    OutSize := 0;

    Ok := WebPEncodeBGRA(Buffer, W, H, W * 4, Quality, OutData, OutSize);

    if not Ok then
      Exit;

    if (OutData = nil) or (OutSize <= 0) then
      Exit;

    try
      AStream.WriteBuffer(OutData^, OutSize);
    finally
      FreeMem(OutData);
    end;

    Result := True;

  finally
    FreeMem(Buffer);
  end;
end;
{$IFNDEF SKIA}
initialization

TBitmapCodecManager.RegisterBitmapCodecClass('.webp', 'WebP Image', True,
  TWebPBitmapCodec);

finalization

TBitmapCodecManager.UnregisterBitmapCodecClass('.webp');
{$ENDIF}
end.
