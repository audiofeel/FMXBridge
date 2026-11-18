unit FMXBridge.GIF.Compositor;

interface

uses
  System.SysUtils,
  System.Math,
  FMXBridge.GIF.Types;

type
  TGIFCompositor = class
  private
    FCanvasWidth: Integer;
    FCanvasHeight: Integer;
    FCanvas: TBytes;
    FRestoreCanvas: TBytes;
    FPreviousInfo: TGIFFrameInfo;
    FHasPrevious: Boolean;
    FHasRestoreCanvas: Boolean;
    FBackgroundBGRA: Cardinal;
    FBackgroundColorIndex: Integer;
    procedure ClearRect(const ARect: TGIFFrameInfo; AColor: Cardinal);
    procedure ApplyPreviousDisposal;
    procedure BlendFrame(const AFrame: TGIFRawFrame);
    procedure SetPixel(X, Y: Integer; const Source: PByte);
    procedure GetBackgroundPixel(out AColor: Cardinal);
  public
    constructor Create(ACanvasWidth, ACanvasHeight: Integer;
      ABackgroundColor: Cardinal; ABackgroundColorIndex: Integer;
      AHasGlobalPalette: Boolean);
    procedure Reset;
    procedure Compose(const AFrame: TGIFRawFrame; AIndex: Integer;
      out AComposed: TGIFComposedFrame);
    property CanvasWidth: Integer read FCanvasWidth;
    property CanvasHeight: Integer read FCanvasHeight;
  end;

implementation

const
  // Prevent corrupted GIFs from requesting unbounded logical-screen buffers.
  CMaxCanvasBytes = UInt64(128) * 1024 * 1024;

function PremultiplyChannel(AValue, AAlpha: Cardinal): Byte; inline;
begin
  Result := Byte((AValue * AAlpha + 127) div 255);
end;

constructor TGIFCompositor.Create(ACanvasWidth, ACanvasHeight: Integer;
  ABackgroundColor: Cardinal; ABackgroundColorIndex: Integer;
  AHasGlobalPalette: Boolean);
var
  BufferSize: UInt64;
  A, R, G, B: Cardinal;
begin
  inherited Create;

  if (ACanvasWidth <= 0) or (ACanvasHeight <= 0) then
    raise EGIFDecodeError.Create('GIF canvas has invalid dimensions');

  BufferSize := UInt64(ACanvasWidth) * UInt64(ACanvasHeight) * 4;

  if (BufferSize > CMaxCanvasBytes) or (BufferSize > UInt64(MaxInt)) then
    raise EGIFDecodeError.Create('GIF canvas exceeds the configured memory limit');

  FCanvasWidth := ACanvasWidth;
  FCanvasHeight := ACanvasHeight;
  FBackgroundColorIndex := -1;

  if AHasGlobalPalette then
  begin
    A := (ABackgroundColor shr 24) and $FF;
    R := (ABackgroundColor shr 16) and $FF;
    G := (ABackgroundColor shr 8) and $FF;
    B := ABackgroundColor and $FF;

    FBackgroundBGRA :=
      Cardinal(PremultiplyChannel(B, A)) or
      (Cardinal(PremultiplyChannel(G, A)) shl 8) or
      (Cardinal(PremultiplyChannel(R, A)) shl 16) or
      (A shl 24);

    FBackgroundColorIndex := ABackgroundColorIndex;
  end
  else
    FBackgroundBGRA := 0;

  SetLength(FCanvas, Integer(BufferSize));
  Reset;
end;

procedure TGIFCompositor.Reset;
begin
  FHasPrevious := False;
  FHasRestoreCanvas := False;
  SetLength(FRestoreCanvas, 0);
  if Length(FCanvas) > 0 then
    ClearRect(Default(TGIFFrameInfo), FBackgroundBGRA);
end;

procedure TGIFCompositor.GetBackgroundPixel(out AColor: Cardinal);
begin
  AColor := FBackgroundBGRA;

  // GIF disposal method 2 restores the logical background. If the previous
  // frame marks that same global background index as transparent, restore
  // transparent pixels instead of painting an opaque palette color.
  if FHasPrevious and FPreviousInfo.HasTransparency and
     (FBackgroundColorIndex >= 0) and
     (Integer(FPreviousInfo.TransparentIndex) = FBackgroundColorIndex) then
    AColor := 0;
end;

procedure TGIFCompositor.ClearRect(const ARect: TGIFFrameInfo;
  AColor: Cardinal);
var
  L, T, R, B: Integer;
  X, Y: Integer;
  P: PCardinal;
begin
  if ARect.Width <= 0 then
  begin
    L := 0;
    R := FCanvasWidth;
  end
  else
  begin
    L := ARect.Left;
    R := ARect.Left + ARect.Width;
  end;

  if ARect.Height <= 0 then
  begin
    T := 0;
    B := FCanvasHeight;
  end
  else
  begin
    T := ARect.Top;
    B := ARect.Top + ARect.Height;
  end;

  if L < 0 then L := 0;
  if T < 0 then T := 0;
  if R > FCanvasWidth then R := FCanvasWidth;
  if B > FCanvasHeight then B := FCanvasHeight;

  if (L >= R) or (T >= B) then
    Exit;

  for Y := T to B - 1 do
  begin
    P := @FCanvas[(Y * FCanvasWidth + L) * 4];
    for X := L to R - 1 do
    begin
      P^ := AColor;
      Inc(P);
    end;
  end;
end;

procedure TGIFCompositor.ApplyPreviousDisposal;
var
  BackgroundPixel: Cardinal;
begin
  if not FHasPrevious then
    Exit;

  case FPreviousInfo.Disposal of
    gdmRestoreBackground:
      begin
        GetBackgroundPixel(BackgroundPixel);
        ClearRect(FPreviousInfo, BackgroundPixel);
      end;

    gdmRestorePrevious:
      begin
        if FHasRestoreCanvas and
           (Length(FRestoreCanvas) = Length(FCanvas)) then
          Move(FRestoreCanvas[0], FCanvas[0], Length(FCanvas));
      end;
  end;

  FHasRestoreCanvas := False;
  SetLength(FRestoreCanvas, 0);
end;

procedure TGIFCompositor.SetPixel(X, Y: Integer; const Source: PByte);
var
  Dest: PByte;
  SourceAlpha, InverseAlpha: Cardinal;
  Value: Cardinal;
begin
  Dest := @FCanvas[(Y * FCanvasWidth + X) * 4];
  SourceAlpha := Source[3];

  if SourceAlpha = 0 then
    Exit;

  if SourceAlpha = 255 then
  begin
    Move(Source^, Dest^, 4);
    Exit;
  end;

  InverseAlpha := 255 - SourceAlpha;

  // Both buffers are premultiplied BGRA.
  Dest[0] := Byte(Min(255, Cardinal(Source[0]) +
    (Cardinal(Dest[0]) * InverseAlpha + 127) div 255));
  Dest[1] := Byte(Min(255, Cardinal(Source[1]) +
    (Cardinal(Dest[1]) * InverseAlpha + 127) div 255));
  Dest[2] := Byte(Min(255, Cardinal(Source[2]) +
    (Cardinal(Dest[2]) * InverseAlpha + 127) div 255));

  Value := SourceAlpha + (Cardinal(Dest[3]) * InverseAlpha + 127) div 255;
  Dest[3] := Byte(Min(255, Value));
end;

procedure TGIFCompositor.BlendFrame(const AFrame: TGIFRawFrame);
var
  ExpectedBytes: UInt64;
  SourceX, SourceY: Integer;
  DestX, DestY: Integer;
  X, Y: Integer;
  Source: PByte;
begin
  if (AFrame.Info.Width <= 0) or (AFrame.Info.Height <= 0) then
    raise EGIFDecodeError.Create('GIF frame has invalid dimensions');

  ExpectedBytes := UInt64(AFrame.Info.Width) * UInt64(AFrame.Info.Height) * 4;

  if ExpectedBytes <> UInt64(Length(AFrame.Pixels)) then
    raise EGIFDecodeError.Create('GIF frame pixel buffer has an invalid size');

  for SourceY := 0 to AFrame.Info.Height - 1 do
  begin
    DestY := AFrame.Info.Top + SourceY;

    if (DestY < 0) or (DestY >= FCanvasHeight) then
      Continue;

    for SourceX := 0 to AFrame.Info.Width - 1 do
    begin
      DestX := AFrame.Info.Left + SourceX;

      if (DestX < 0) or (DestX >= FCanvasWidth) then
        Continue;

      X := SourceX;
      Y := SourceY;
      Source := @AFrame.Pixels[(Y * AFrame.Info.Width + X) * 4];
      SetPixel(DestX, DestY, Source);
    end;
  end;
end;

procedure TGIFCompositor.Compose(const AFrame: TGIFRawFrame; AIndex: Integer;
  out AComposed: TGIFComposedFrame);
begin
  AComposed := Default(TGIFComposedFrame);

  if AIndex < 0 then
    raise EArgumentOutOfRangeException.Create('GIF frame index cannot be negative');

  ApplyPreviousDisposal;

  // Disposal 3 means that the canvas must be restored to the state that
  // existed immediately before drawing this frame.
  if AFrame.Info.Disposal = gdmRestorePrevious then
  begin
    FRestoreCanvas := Copy(FCanvas);
    FHasRestoreCanvas := True;
  end;

  BlendFrame(AFrame);

  AComposed.Index := AIndex;
  AComposed.DelayMS := AFrame.Info.DelayMS;
  AComposed.Pixels := Copy(FCanvas);

  FPreviousInfo := AFrame.Info;
  FHasPrevious := True;
end;

end.
