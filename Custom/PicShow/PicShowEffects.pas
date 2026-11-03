{*******************************************************}
{                                                       }
{                     PicShowEffects                    }
{                                                       }
{           Copyright(c) 2025-2026 Audiofeel            }
{                  All rights reserved                  }
{                                                       }
{*******************************************************}

unit PicShowEffects;

interface

uses
  System.Types,
  FMX.Graphics,
  FMXBridge.PicShow;

procedure EffectFade(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectBuildRight(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectBuildLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectQuartersRevealMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectQuartersExpandMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectQuartersSlideMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectBarsInRight(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectBarsInLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectBarsLeftRight(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectBarsRightLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectBarsFromSides(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectUnevenShredRight(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectUnevenShredLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectUnevenShredOutMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectUnevenShredInMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectCrissCrossBottomRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectCrissCrossTopRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectCrissCrossBottomLeft(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectCrissCrossTopLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectStarburstCenterClockwise(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectStarburstCenterAntiClockwise(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectSpeckleAppearRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectSpeckleAppearLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectSpeckleAppearBottom(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectSpeckleAppearTop(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectDiagonalTopLeftBottomRightAnticlockwise(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectDiagonalTopLeftBottomRightClockwise(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectRevealDiagonalTopLeft(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectRevealDiagonalTopRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectRevealDiagonalBottomLeft(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectRevealDiagonalBottomRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);

procedure EffectRandomSquares(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectBlindVert(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectBlindHorz(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure EffectDissolve(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);

procedure RegisterAllEffects;

implementation

uses
  System.UITypes,
  System.Math;

// -----------------------------------------------------------------------------
// Fade
// -----------------------------------------------------------------------------
procedure EffectFade(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
var
  AlphaOld: Single;
  AlphaNew: Single;
begin
  AlphaOld := 1 - Progress;
  AlphaNew := Progress;

  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, AlphaOld, False);

  if Assigned(Destination) then
    Canvas.DrawBitmap(Destination, Destination.BoundsF, Bounds,
      AlphaNew, False);
end;

// -----------------------------------------------------------------------------
// Common Build up from
// -----------------------------------------------------------------------------
type
  TBuildDirection = (bdRight, bdLeft);

procedure DrawBuild(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF; Direction: TBuildDirection);
var
  X: Single;
  N: Single;
  SrcRect, DstRect: TRectF;
begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  X := Round(Bounds.Width * Progress);

  case Direction of
    bdRight:
      begin
        SrcRect := RectF(0, 0, Destination.Width * (X / Bounds.Width),
          Destination.Height);
        DstRect := RectF(Bounds.Left, Bounds.Top, Bounds.Left + X,
          Bounds.Bottom);
        Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);

        N := Min(Bounds.Width - X, Bounds.Width / 10);

        if N > 0 then
        begin
          SrcRect := RectF(Destination.Width * (X / Bounds.Width), 0,
            Destination.Width * ((X + N) / Bounds.Width), Destination.Height);
          DstRect := RectF(Bounds.Left + X, Bounds.Top, Bounds.Right,
            Bounds.Bottom);
          Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
        end;
      end;

    bdLeft:
      begin
        SrcRect := RectF(Destination.Width *
          ((Bounds.Width - X) / Bounds.Width), 0, Destination.Width,
          Destination.Height);
        DstRect := RectF(Bounds.Right - X, Bounds.Top, Bounds.Right,
          Bounds.Bottom);
        Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);

        N := Max((Bounds.Width - X) - Bounds.Width / 10, 0);

        if Bounds.Width - X > 0 then
        begin
          SrcRect := RectF(Destination.Width * (N / Bounds.Width), 0,
            Destination.Width * ((Bounds.Width - X) / Bounds.Width),
            Destination.Height);
          DstRect := RectF(Bounds.Left, Bounds.Top, Bounds.Right - X,
            Bounds.Bottom);
          Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
        end;
      end;
  end;
end;

// -----------------------------------------------------------------------------
// Build up from right
// -----------------------------------------------------------------------------
procedure EffectBuildRight(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
begin
  DrawBuild(Canvas, Source, Destination, Progress, Bounds, bdRight);
end;

// -----------------------------------------------------------------------------
// Build up from left
// -----------------------------------------------------------------------------
procedure EffectBuildLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
begin
  DrawBuild(Canvas, Source, Destination, Progress, Bounds, bdLeft);
end;

// -----------------------------------------------------------------------------
// Quarters Reveal in to middle
// -----------------------------------------------------------------------------
procedure EffectQuartersRevealMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  MX, MY: Single;
  SX, SY: Single;
begin
  if not Assigned(Destination) then
    Exit;

  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  MX := Bounds.Width * Progress / 2;
  MY := Bounds.Height * Progress / 2;

  SX := Destination.Width / Bounds.Width;
  SY := Destination.Height / Bounds.Height;

  Canvas.DrawBitmap(Destination, RectF(0, 0, MX * SX, MY * SY),
    RectF(Bounds.Left, Bounds.Top, Bounds.Left + MX, Bounds.Top + MY),
    1, False);

  Canvas.DrawBitmap(Destination, RectF(0, Destination.Height - MY * SY, MX * SX,
    Destination.Height), RectF(Bounds.Left, Bounds.Bottom - MY,
    Bounds.Left + MX, Bounds.Bottom), 1, False);

  Canvas.DrawBitmap(Destination, RectF(Destination.Width - MX * SX,
    Destination.Height - MY * SY, Destination.Width, Destination.Height),
    RectF(Bounds.Right - MX, Bounds.Bottom - MY, Bounds.Right, Bounds.Bottom),
    1, False);

  Canvas.DrawBitmap(Destination, RectF(Destination.Width - MX * SX, 0,
    Destination.Width, MY * SY), RectF(Bounds.Right - MX, Bounds.Top,
    Bounds.Right, Bounds.Top + MY), 1, False);
end;

// -----------------------------------------------------------------------------
// Quarters Expand to middle
// -----------------------------------------------------------------------------
procedure EffectQuartersExpandMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  MX, MY: Single;
  MW, MH: Single;
begin
  if not Assigned(Destination) then
    Exit;

  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  MX := Bounds.Width * Progress / 2;
  MY := Bounds.Height * Progress / 2;

  MW := Destination.Width / 2;
  MH := Destination.Height / 2;

  Canvas.DrawBitmap(Destination, RectF(0, 0, MW, MH),
    RectF(Bounds.Left, Bounds.Top, Bounds.Left + MX, Bounds.Top + MY),
    1, False);

  Canvas.DrawBitmap(Destination, RectF(0, MH, MW, Destination.Height),
    RectF(Bounds.Left, Bounds.Bottom - MY, Bounds.Left + MX, Bounds.Bottom),
    1, False);

  Canvas.DrawBitmap(Destination, RectF(MW, MH, Destination.Width,
    Destination.Height), RectF(Bounds.Right - MX, Bounds.Bottom - MY,
    Bounds.Right, Bounds.Bottom), 1, False);

  Canvas.DrawBitmap(Destination, RectF(MW, 0, Destination.Width, MH),
    RectF(Bounds.Right - MX, Bounds.Top, Bounds.Right, Bounds.Top + MY),
    1, False);
end;

// -----------------------------------------------------------------------------
// Quarters Slide in to middle
// -----------------------------------------------------------------------------
procedure EffectQuartersSlideMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  MX, MY: Single;
  MW, MH: Single;
  State: TCanvasSaveState;
begin
  if not Assigned(Destination) then
    Exit;

  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  MX := Bounds.Width * (1 - Progress) / 2;
  MY := Bounds.Height * (1 - Progress) / 2;

  MW := Bounds.Width / 2;
  MH := Bounds.Height / 2;

  State := Canvas.SaveState;
  try
    Canvas.IntersectClipRect(Bounds);
    Canvas.DrawBitmap(Destination, RectF(0, 0, Destination.Width / 2,
      Destination.Height / 2), RectF(Bounds.Left - MX, Bounds.Top,
      Bounds.Left + MW - MX, Bounds.Top + MH), 1, False);

    Canvas.DrawBitmap(Destination, RectF(Destination.Width / 2, 0,
      Destination.Width, Destination.Height / 2),
      RectF(Bounds.Left + MW, Bounds.Top - MY, Bounds.Right,
      Bounds.Top + MH - MY), 1, False);

    Canvas.DrawBitmap(Destination, RectF(Destination.Width / 2,
      Destination.Height / 2, Destination.Width, Destination.Height),
      RectF(Bounds.Left + MW + MX, Bounds.Top + MH, Bounds.Right + MX,
      Bounds.Bottom), 1, False);

    Canvas.DrawBitmap(Destination, RectF(0, Destination.Height / 2,
      Destination.Width / 2, Destination.Height),
      RectF(Bounds.Left, Bounds.Top + MH + MY, Bounds.Left + MW,
      Bounds.Bottom + MY), 1, False);
  finally
    Canvas.RestoreState(State);
  end;
end;

// -----------------------------------------------------------------------------
// Bars in from right
// -----------------------------------------------------------------------------
procedure EffectBarsInRight(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
var
  D: Integer;
  XPos: Integer;
  Y: Integer;

  procedure DrawBar(ALeft, ATop, ARight, ABottom: Integer);
  var
    SrcRect: TRectF;
    DstRect: TRectF;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    SrcRect := RectF(ALeft, ATop, ARight, ABottom);

    DstRect := RectF(Bounds.Left + ALeft / Destination.Width * Bounds.Width,
      Bounds.Top + ATop / Destination.Height * Bounds.Height,
      Bounds.Left + ARight / Destination.Width * Bounds.Width,
      Bounds.Top + ABottom / Destination.Height * Bounds.Height);

    Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  if (Destination.Width <= 0) or (Destination.Height <= 0) or
    (Bounds.Width <= 0) or (Bounds.Height <= 0) then
    Exit;

  D := (Min(Destination.Width, Destination.Height) div 50) + 1;

  XPos := Round(Destination.Width * 2 * Progress);

  if XPos <= Destination.Width then
    Y := 0
  else
    Y := D;

  while Y < Destination.Height + D do
  begin
    if XPos <= Destination.Width then
    begin
      DrawBar(Destination.Width - XPos, Y, Destination.Width, Y + D);
    end
    else
    begin
      DrawBar(2 * Destination.Width - XPos, Y, Destination.Width, Y + D);
      DrawBar(0, Y - D, Destination.Width, Y);
    end;

    Inc(Y, D * 2);
  end;
end;

// -----------------------------------------------------------------------------
// Bars in from left
// -----------------------------------------------------------------------------
procedure EffectBarsInLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
var
  D: Integer;
  XPos: Integer;
  Y: Integer;

  procedure DrawBar(ALeft, ATop, ARight, ABottom: Integer);
  var
    SrcRect: TRectF;
    DstRect: TRectF;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    SrcRect := RectF(ALeft, ATop, ARight, ABottom);

    DstRect := RectF(Bounds.Left + ALeft / Destination.Width * Bounds.Width,
      Bounds.Top + ATop / Destination.Height * Bounds.Height,
      Bounds.Left + ARight / Destination.Width * Bounds.Width,
      Bounds.Top + ABottom / Destination.Height * Bounds.Height);

    Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  if (Destination.Width <= 0) or (Destination.Height <= 0) or
    (Bounds.Width <= 0) or (Bounds.Height <= 0) then
    Exit;

  D := (Min(Destination.Width, Destination.Height) div 50) + 1;

  XPos := Round(Destination.Width * 2 * Progress);

  if XPos <= Destination.Width then
    Y := 0
  else
    Y := D;

  while Y < Destination.Height + D do
  begin
    if XPos <= Destination.Width then
    begin
      DrawBar(0, Y, XPos, Y + D);
    end
    else
    begin
      DrawBar(0, Y, XPos - Destination.Width, Y + D);
      DrawBar(0, Y - D, Destination.Width, Y);
    end;

    Inc(Y, D * 2);
  end;
end;

// -----------------------------------------------------------------------------
// Bars left then right
// -----------------------------------------------------------------------------
procedure EffectBarsLeftRight(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
var
  D: Integer;
  XPos: Integer;
  Y: Integer;

  procedure DrawBar(ALeft, ATop, ARight, ABottom: Integer);
  var
    SrcRect: TRectF;
    DstRect: TRectF;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    SrcRect := RectF(ALeft, ATop, ARight, ABottom);

    DstRect := RectF(Bounds.Left + ALeft / Destination.Width * Bounds.Width,
      Bounds.Top + ATop / Destination.Height * Bounds.Height,
      Bounds.Left + ARight / Destination.Width * Bounds.Width,
      Bounds.Top + ABottom / Destination.Height * Bounds.Height);

    Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  if (Destination.Width <= 0) or (Destination.Height <= 0) or
    (Bounds.Width <= 0) or (Bounds.Height <= 0) then
    Exit;

  D := (Min(Destination.Width, Destination.Height) div 50) + 1;

  XPos := Round(Destination.Width * 2 * Progress);

  Y := 0;

  if XPos > Destination.Width then
    Y := D;

  while Y < Destination.Height + D do
  begin
    if XPos <= Destination.Width then
    begin
      DrawBar(0, Y, XPos, Y + D);
    end
    else
    begin
      DrawBar(2 * Destination.Width - XPos, Y, Destination.Width, Y + D);
      DrawBar(0, Y - D, Destination.Width, Y);
    end;

    Inc(Y, D * 2);
  end;
end;

// -----------------------------------------------------------------------------
// Bars right then left
// -----------------------------------------------------------------------------
procedure EffectBarsRightLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
var
  D: Integer;
  XPos: Integer;
  Y: Integer;

  procedure DrawBar(ALeft, ATop, ARight, ABottom: Integer);
  var
    SrcRect: TRectF;
    DstRect: TRectF;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    SrcRect := RectF(ALeft, ATop, ARight, ABottom);

    DstRect := RectF(Bounds.Left + ALeft / Destination.Width * Bounds.Width,
      Bounds.Top + ATop / Destination.Height * Bounds.Height,
      Bounds.Left + ARight / Destination.Width * Bounds.Width,
      Bounds.Top + ABottom / Destination.Height * Bounds.Height);

    Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  if (Destination.Width <= 0) or (Destination.Height <= 0) or
    (Bounds.Width <= 0) or (Bounds.Height <= 0) then
    Exit;

  D := (Min(Destination.Width, Destination.Height) div 50) + 1;

  XPos := Round(Destination.Width * 2 * Progress);

  Y := 0;

  if XPos > Destination.Width then
    Y := D;

  while Y < Destination.Height + D do
  begin
    if XPos <= Destination.Width then
    begin
      DrawBar(Destination.Width - XPos, Y, Destination.Width, Y + D);
    end
    else
    begin
      DrawBar(0, Y, XPos - Destination.Width, Y + D);
      DrawBar(0, Y - D, Destination.Width, Y);
    end;

    Inc(Y, D * 2);
  end;
end;

// -----------------------------------------------------------------------------
// Bars from both sides
// -----------------------------------------------------------------------------
procedure EffectBarsFromSides(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
var
  D: Integer;
  XPos: Integer;
  Y: Integer;

  procedure DrawBar(ALeft, ATop, ARight, ABottom: Integer);
  var
    SrcRect: TRectF;
    DstRect: TRectF;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    SrcRect := RectF(ALeft, ATop, ARight, ABottom);

    DstRect := RectF(Bounds.Left + ALeft / Destination.Width * Bounds.Width,
      Bounds.Top + ATop / Destination.Height * Bounds.Height,
      Bounds.Left + ARight / Destination.Width * Bounds.Width,
      Bounds.Top + ABottom / Destination.Height * Bounds.Height);

    Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  if (Destination.Width <= 0) or (Destination.Height <= 0) or
    (Bounds.Width <= 0) or (Bounds.Height <= 0) then
    Exit;

  XPos := Round(Destination.Width * Progress);

  D := (Min(Destination.Width, Destination.Height) div 50) + 1;

  Y := 0;

  while Y < Destination.Height + D do
  begin
    DrawBar(Destination.Width - XPos, Y, Destination.Width, Y + D);
    DrawBar(0, Y + D, XPos, Y + D + D);

    Inc(Y, D * 2);
  end;
end;

// -----------------------------------------------------------------------------
// Common Uneven shred
// -----------------------------------------------------------------------------
type
  TUnevenShredDirection = (usdRight, usdLeft, usdOutMiddle, usdInMiddle);

function NoiseHash(Value: Integer): Integer;
begin
  Value := (Value shl 13) xor Value;
  Result := Abs((Value * (Value * Value * 15731 + 789221) + 1376312589));
end;

procedure DrawUnevenShred(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF; Direction: TUnevenShredDirection);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  D, HD, N: Integer;
  Y, X: Integer;
  R: Integer;
  L: Integer;
  MW, MR: Integer;

  procedure DrawMaskRect(ALeft, ATop, ARight, ABottom: Integer);
  var
    RY: Integer;
    SrcPtr: PByte;
    DstPtr: PByte;
    Bytes: NativeInt;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    Bytes := (ARight - ALeft) * SizeOf(TAlphaColor);

    for RY := ATop to ABottom - 1 do
    begin
      SrcPtr := PByte(SrcData.Data) + RY * SrcData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      DstPtr := PByte(DstData.Data) + RY * DstData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      Move(SrcPtr^, DstPtr^, Bytes);
    end;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    D := (Min(Destination.Width, Destination.Height) div 200) + 1;
    HD := Destination.Height mod D;

    X := Round(Destination.Width * Progress);

    if X < Destination.Width then
      N := Destination.Width div 10
    else
      N := 0;

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        Y := 0;

        while Y < Destination.Height do
        begin
          R := X;

          if N > 0 then
            R := R + NoiseHash(Y div D + Round(Progress * 1000))
              mod (2 * N) - N;

          case Direction of
            usdRight:
              begin
                L := Destination.Width - R;
                DrawMaskRect(L, Y, Destination.Width, Y + D + HD);
              end;

            usdLeft:
              begin
                DrawMaskRect(0, Y, R, Y + D + HD);
              end;

            usdOutMiddle:
              begin
                MW := Destination.Width div 2;
                MR := R div 2;
                DrawMaskRect(MW - MR, Y, MW, Y + D + HD);
                DrawMaskRect(MW, Y, MW + MR, Y + D + HD);
              end;

            usdInMiddle:
              begin
                MR := R div 2;
                DrawMaskRect(Destination.Width - MR, Y, Destination.Width,
                  Y + D + HD);
                DrawMaskRect(0, Y, MR, Y + D + HD);
              end;
          end;
          Inc(Y, D);
        end;
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;
    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Uneven shred from right
// -----------------------------------------------------------------------------
procedure EffectUnevenShredRight(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
begin
  DrawUnevenShred(Canvas, Source, Destination, Progress, Bounds, usdRight);
end;

// -----------------------------------------------------------------------------
// Uneven shred from left
// -----------------------------------------------------------------------------
procedure EffectUnevenShredLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
begin
  DrawUnevenShred(Canvas, Source, Destination, Progress, Bounds, usdLeft);
end;

// -----------------------------------------------------------------------------
// Uneven shred out from middle (horizontal)
// -----------------------------------------------------------------------------
procedure EffectUnevenShredOutMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
begin
  DrawUnevenShred(Canvas, Source, Destination, Progress, Bounds, usdOutMiddle);
end;

// -----------------------------------------------------------------------------
// Uneven shred in to middle (horizontal)
// -----------------------------------------------------------------------------
procedure EffectUnevenShredInMiddle(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
begin
  DrawUnevenShred(Canvas, Source, Destination, Progress, Bounds, usdInMiddle);
end;

// -----------------------------------------------------------------------------
// Criss Cross reveal from bottom right
// -----------------------------------------------------------------------------
procedure EffectCrissCrossBottomRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  D: Integer;
  XPos, YPos: Integer;
  X, Y: Integer;
  procedure DrawMaskRect(ALeft, ATop, ARight, ABottom: Integer);
  var
    RY: Integer;
    SrcPtr: PByte;
    DstPtr: PByte;
    Bytes: NativeInt;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    Bytes := (ARight - ALeft) * SizeOf(TAlphaColor);

    for RY := ATop to ABottom - 1 do
    begin
      SrcPtr := PByte(SrcData.Data) + RY * SrcData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      DstPtr := PByte(DstData.Data) + RY * DstData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      Move(SrcPtr^, DstPtr^, Bytes);
    end;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    D := (Min(Destination.Width, Destination.Height) div 50) + 1;

    XPos := Round(Destination.Width * 2 * Progress);
    YPos := Round(Destination.Height * 2 * Progress);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        if XPos <= Destination.Width then
          Y := 0
        else
          Y := D;

        while Y < Destination.Height + D do
        begin
          if XPos <= Destination.Width then
          begin
            DrawMaskRect(Destination.Width - XPos, Y, Destination.Width, Y + D);
          end
          else
          begin
            DrawMaskRect(2 * Destination.Width - XPos, Y,
              Destination.Width, Y + D);
            DrawMaskRect(0, Y - D, Destination.Width, Y);
          end;
          Inc(Y, D * 2);
        end;

        if YPos <= Destination.Height then
          X := 0
        else
          X := D;

        while X < Destination.Width + D do
        begin
          if YPos <= Destination.Height then
          begin
            DrawMaskRect(X, Destination.Height - YPos, X + D,
              Destination.Height);
          end
          else
          begin
            DrawMaskRect(X, 2 * Destination.Height - YPos, X + D,
              Destination.Height);
            DrawMaskRect(X - D, 0, X, Destination.Height);
          end;
          Inc(X, D * 2);
        end;
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;
    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Criss Cross reveal from bottom right
// -----------------------------------------------------------------------------
procedure EffectCrissCrossTopRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  D: Integer;
  XPos, YPos: Integer;
  X, Y: Integer;
  procedure DrawMaskRect(ALeft, ATop, ARight, ABottom: Integer);
  var
    RY: Integer;
    SrcPtr: PByte;
    DstPtr: PByte;
    Bytes: NativeInt;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    Bytes := (ARight - ALeft) * SizeOf(TAlphaColor);

    for RY := ATop to ABottom - 1 do
    begin
      SrcPtr := PByte(SrcData.Data) + RY * SrcData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      DstPtr := PByte(DstData.Data) + RY * DstData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      Move(SrcPtr^, DstPtr^, Bytes);
    end;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    D := (Min(Destination.Width, Destination.Height) div 50) + 1;

    XPos := Round(Destination.Width * 2 * Progress);
    YPos := Round(Destination.Height * 2 * Progress);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        if XPos <= Destination.Width then
          Y := 0
        else
          Y := D;

        while Y < Destination.Height + D do
        begin
          if XPos <= Destination.Width then
            DrawMaskRect(Destination.Width - XPos, Y, Destination.Width, Y + D)
          else
          begin
            DrawMaskRect(2 * Destination.Width - XPos, Y,
              Destination.Width, Y + D);
            DrawMaskRect(0, Y - D, Destination.Width, Y);
          end;
          Inc(Y, D * 2);
        end;

        if YPos <= Destination.Height then
          X := 0
        else
          X := D;

        while X < Destination.Width + D do
        begin
          if YPos <= Destination.Height then
          begin
            DrawMaskRect(X, 0, X + D, YPos);
          end
          else
          begin
            DrawMaskRect(X, 0, X + D, YPos - Destination.Height);
            DrawMaskRect(X - D, 0, X, Destination.Height);
          end;
          Inc(X, D * 2);
        end;
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;
    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Criss Cross reveal from bottom left
// -----------------------------------------------------------------------------
procedure EffectCrissCrossBottomLeft(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  D: Integer;
  XPos, YPos: Integer;
  X, Y: Integer;
  procedure DrawMaskRect(ALeft, ATop, ARight, ABottom: Integer);
  var
    RY: Integer;
    SrcPtr: PByte;
    DstPtr: PByte;
    Bytes: NativeInt;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    Bytes := (ARight - ALeft) * SizeOf(TAlphaColor);

    for RY := ATop to ABottom - 1 do
    begin
      SrcPtr := PByte(SrcData.Data) + RY * SrcData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      DstPtr := PByte(DstData.Data) + RY * DstData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      Move(SrcPtr^, DstPtr^, Bytes);
    end;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    D := (Min(Destination.Width, Destination.Height) div 50) + 1;

    XPos := Round(Destination.Width * 2 * Progress);
    YPos := Round(Destination.Height * 2 * Progress);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        if XPos <= Destination.Width then
          Y := 0
        else
          Y := D;

        while Y < Destination.Height + D do
        begin
          if XPos <= Destination.Width then
          begin
            DrawMaskRect(0, Y, XPos, Y + D);
          end
          else
          begin
            DrawMaskRect(0, Y, XPos - Destination.Width, Y + D);
            DrawMaskRect(0, Y - D, Destination.Width, Y);
          end;
          Inc(Y, D * 2);
        end;

        if YPos <= Destination.Height then
          X := 0
        else
          X := D;

        while X < Destination.Width + D do
        begin
          if YPos <= Destination.Height then
          begin
            DrawMaskRect(X, Destination.Height - YPos, X + D,
              Destination.Height);
          end
          else
          begin
            DrawMaskRect(X, 2 * Destination.Height - YPos, X + D,
              Destination.Height);
            DrawMaskRect(X - D, 0, X, Destination.Height);
          end;
          Inc(X, D * 2);
        end;
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;
    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Criss Cross reveal from top left
// -----------------------------------------------------------------------------
procedure EffectCrissCrossTopLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  D: Integer;
  XPos, YPos: Integer;
  X, Y: Integer;
  procedure DrawMaskRect(ALeft, ATop, ARight, ABottom: Integer);
  var
    RY: Integer;
    SrcPtr: PByte;
    DstPtr: PByte;
    Bytes: NativeInt;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > Destination.Width then
      ARight := Destination.Width;

    if ATop < 0 then
      ATop := 0;

    if ABottom > Destination.Height then
      ABottom := Destination.Height;

    if (ALeft >= ARight) or (ATop >= ABottom) then
      Exit;

    Bytes := (ARight - ALeft) * SizeOf(TAlphaColor);

    for RY := ATop to ABottom - 1 do
    begin
      SrcPtr := PByte(SrcData.Data) + RY * SrcData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      DstPtr := PByte(DstData.Data) + RY * DstData.Pitch + ALeft *
        SizeOf(TAlphaColor);

      Move(SrcPtr^, DstPtr^, Bytes);
    end;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    D := (Min(Destination.Width, Destination.Height) div 50) + 1;

    XPos := Round(Destination.Width * 2 * Progress);
    YPos := Round(Destination.Height * 2 * Progress);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        if XPos <= Destination.Width then
          Y := 0
        else
          Y := D;

        while Y < Destination.Height + D do
        begin
          if XPos <= Destination.Width then
            DrawMaskRect(0, Y, XPos, Y + D)
          else
          begin
            DrawMaskRect(0, Y, XPos - Destination.Width, Y + D);
            DrawMaskRect(0, Y - D, Destination.Width, Y);
          end;
          Inc(Y, D * 2);
        end;
        if YPos <= Destination.Height then
          X := 0
        else
          X := D;

        while X < Destination.Width + D do
        begin
          if YPos <= Destination.Height then
            DrawMaskRect(X, 0, X + D, YPos)
          else
          begin
            DrawMaskRect(X, 0, X + D, YPos - Destination.Height);
            DrawMaskRect(X - D, 0, X, Destination.Height);
          end;
          Inc(X, D * 2);
        end;
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;
    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Starburst clockwise from center
// -----------------------------------------------------------------------------
procedure EffectStarburstCenterClockwise(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  W, H: Integer;
  CX, CY: Single;
  X, Y: Single;

  procedure CopySpan(AY, ALeft, ARight: Integer);
  var
    SrcPtr: PByte;
    DstPtr: PByte;
    Bytes: NativeInt;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > W then
      ARight := W;

    if (ALeft >= ARight) or (AY < 0) or (AY >= H) then
      Exit;

    Bytes := (ARight - ALeft) * SizeOf(TAlphaColor);

    SrcPtr := PByte(SrcData.Data) + AY * SrcData.Pitch + ALeft *
      SizeOf(TAlphaColor);

    DstPtr := PByte(DstData.Data) + AY * DstData.Pitch + ALeft *
      SizeOf(TAlphaColor);

    Move(SrcPtr^, DstPtr^, Bytes);
  end;

  procedure CopyTriangle(const P1, P2, P3: TPointF);
  var
    AY: Integer;
    ScanY: Single;
    IX1, IX2: Single;
    MinX, MaxX: Single;
    LeftX, RightX: Integer;
    Count: Integer;

    procedure AddEdge(const A, B: TPointF);
    var
      IX: Single;
    begin
      if ((A.Y <= ScanY) and (B.Y > ScanY)) or ((B.Y <= ScanY) and (A.Y > ScanY))
      then
      begin
        IX := A.X + (ScanY - A.Y) * (B.X - A.X) / (B.Y - A.Y);

        if Count = 0 then
          IX1 := IX
        else
          IX2 := IX;

        Inc(Count);
      end;
    end;

  begin
    for AY := 0 to H - 1 do
    begin
      ScanY := AY + 0.5;
      Count := 0;

      AddEdge(P1, P2);
      AddEdge(P2, P3);
      AddEdge(P3, P1);

      if Count <> 2 then
        Continue;

      MinX := Min(IX1, IX2);
      MaxX := Max(IX1, IX2);

      LeftX := Ceil(MinX - 0.5);
      RightX := Floor(MaxX - 0.5);

      if LeftX <= RightX then
        CopySpan(AY, LeftX, RightX + 1);
    end;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  W := Destination.Width;
  H := Destination.Height;

  if (W <= 0) or (H <= 0) then
    Exit;

  CX := W / 2;
  CY := H / 2;

  X := W * Progress;
  Y := H * Progress;

  Temp := TBitmap.Create;
  try
    Temp.SetSize(W, H);
    Temp.Clear(TAlphaColorRec.Null);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        CopyTriangle(PointF(CX, CY), PointF(0, 0), PointF(X, 0));
        CopyTriangle(PointF(CX, CY), PointF(0, H), PointF(0, H - Y));
        CopyTriangle(PointF(CX, CY), PointF(W, H), PointF(W - X, H));
        CopyTriangle(PointF(CX, CY), PointF(W, 0), PointF(W, Y));
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;

    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Starburst anticlockwise from center
// -----------------------------------------------------------------------------
procedure EffectStarburstCenterAntiClockwise(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  W, H: Integer;
  CX, CY: Single;
  X, Y: Single;

  procedure CopySpan(AY, ALeft, ARight: Integer);
  var
    SrcPtr: PByte;
    DstPtr: PByte;
    Bytes: NativeInt;
  begin
    if ALeft < 0 then
      ALeft := 0;

    if ARight > W then
      ARight := W;

    if (ALeft >= ARight) or (AY < 0) or (AY >= H) then
      Exit;

    Bytes := (ARight - ALeft) * SizeOf(TAlphaColor);

    SrcPtr := PByte(SrcData.Data) + AY * SrcData.Pitch + ALeft *
      SizeOf(TAlphaColor);

    DstPtr := PByte(DstData.Data) + AY * DstData.Pitch + ALeft *
      SizeOf(TAlphaColor);

    Move(SrcPtr^, DstPtr^, Bytes);
  end;

  procedure CopyTriangle(const P1, P2, P3: TPointF);
  var
    AY: Integer;
    ScanY: Single;
    IX1, IX2: Single;
    MinX, MaxX: Single;
    LeftX, RightX: Integer;
    Count: Integer;

    procedure AddEdge(const A, B: TPointF);
    var
      IX: Single;
    begin
      if ((A.Y <= ScanY) and (B.Y > ScanY)) or ((B.Y <= ScanY) and (A.Y > ScanY))
      then
      begin
        IX := A.X + (ScanY - A.Y) * (B.X - A.X) / (B.Y - A.Y);

        if Count = 0 then
          IX1 := IX
        else
          IX2 := IX;

        Inc(Count);
      end;
    end;

  begin
    for AY := 0 to H - 1 do
    begin
      ScanY := AY + 0.5;
      Count := 0;

      AddEdge(P1, P2);
      AddEdge(P2, P3);
      AddEdge(P3, P1);

      if Count <> 2 then
        Continue;

      MinX := Min(IX1, IX2);
      MaxX := Max(IX1, IX2);

      LeftX := Ceil(MinX - 0.5);
      RightX := Floor(MaxX - 0.5);

      if LeftX <= RightX then
        CopySpan(AY, LeftX, RightX + 1);
    end;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  W := Destination.Width;
  H := Destination.Height;

  if (W <= 0) or (H <= 0) then
    Exit;

  CX := W / 2;
  CY := H / 2;

  X := W * Progress;
  Y := H * Progress;

  Temp := TBitmap.Create;
  try
    Temp.SetSize(W, H);
    Temp.Clear(TAlphaColorRec.Null);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        CopyTriangle(PointF(CX, CY), PointF(0, 0), PointF(0, Y));
        CopyTriangle(PointF(CX, CY), PointF(0, H), PointF(X, H));
        CopyTriangle(PointF(CX, CY), PointF(W, H), PointF(W, H - Y));
        CopyTriangle(PointF(CX, CY), PointF(W, 0), PointF(W - X, 0));
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;

    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Common Speckle appear from
// -----------------------------------------------------------------------------
type
  TSpeckleDirection = (sdRight, sdLeft, sdBottom, sdTop);

procedure DrawSpeckle(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF; Direction: TSpeckleDirection);
const
  CellSize = 6;
  MaxOffset = 120;
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  X, Y: Integer;
  Front: Integer;
  Offset: Integer;

  function Hash(AX, AY: Integer): Cardinal;
  begin
    Result := Cardinal(AX * 73856093) xor Cardinal(AY * 19349663);
    Result := Result xor (Result shr 13);
    Result := Result * 1274126177;
  end;

  procedure CopyCell(AX, AY: Integer);
  var
    YY: Integer;
    RightX, BottomY: Integer;
    Bytes: NativeInt;
    SrcPtr, DstPtr: PByte;
  begin
    RightX := Min(AX + CellSize, Destination.Width);
    BottomY := Min(AY + CellSize, Destination.Height);

    if (AX >= RightX) or (AY >= BottomY) then
      Exit;

    Bytes := (RightX - AX) * SizeOf(TAlphaColor);

    for YY := AY to BottomY - 1 do
    begin
      SrcPtr := PByte(SrcData.Data) + YY * SrcData.Pitch + AX *
        SizeOf(TAlphaColor);

      DstPtr := PByte(DstData.Data) + YY * DstData.Pitch + AX *
        SizeOf(TAlphaColor);

      Move(SrcPtr^, DstPtr^, Bytes);
    end;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        case Direction of
          sdRight:
            Front := Round((1 - Progress) * Destination.Width - MaxOffset *
              Progress);

          sdLeft:
            Front := Round(Progress * Destination.Width + MaxOffset * Progress);

          sdBottom:
            Front := Round((1 - Progress) * Destination.Height - MaxOffset *
              Progress);

          sdTop:
            Front := Round(Progress * Destination.Height + MaxOffset *
              Progress);
        else
          Front := 0;
        end;

        Y := 0;
        while Y < Destination.Height do
        begin
          X := 0;

          while X < Destination.Width do
          begin
            Offset := Integer(Hash(X div CellSize, Y div CellSize)
              mod MaxOffset);

            case Direction of
              sdRight:
                if X >= Front + Offset then
                  CopyCell(X, Y);

              sdLeft:
                if X <= Front - Offset then
                  CopyCell(X, Y);

              sdBottom:
                if Y >= Front + Offset then
                  CopyCell(X, Y);

              sdTop:
                if Y <= Front - Offset then
                  CopyCell(X, Y);
            end;
            Inc(X, CellSize);
          end;
          Inc(Y, CellSize);
        end;
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;
    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Speckle appear from right
// -----------------------------------------------------------------------------
procedure EffectSpeckleAppearRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
begin
  DrawSpeckle(Canvas, Source, Destination, Progress, Bounds, sdRight);
end;

// -----------------------------------------------------------------------------
// Speckle appear from left
// -----------------------------------------------------------------------------
procedure EffectSpeckleAppearLeft(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
begin
  DrawSpeckle(Canvas, Source, Destination, Progress, Bounds, sdLeft);
end;

// -----------------------------------------------------------------------------
// Speckle appear from bottom
// -----------------------------------------------------------------------------
procedure EffectSpeckleAppearBottom(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
begin
  DrawSpeckle(Canvas, Source, Destination, Progress, Bounds, sdBottom);
end;

// -----------------------------------------------------------------------------
// Speckle appear from top
// -----------------------------------------------------------------------------
procedure EffectSpeckleAppearTop(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
begin
  DrawSpeckle(Canvas, Source, Destination, Progress, Bounds, sdTop);
end;

// -----------------------------------------------------------------------------
// Diagonal sweep from top left bottom right anticlockwise
// -----------------------------------------------------------------------------
procedure EffectDiagonalTopLeftBottomRightAnticlockwise(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  Y: Integer;
  Pos: Integer;
  LeftRight: Integer;
  RightLeft: Integer;
  Bytes: NativeInt;
  SrcPtr, DstPtr: PByte;
begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    Pos := Round(Destination.Width * Progress);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        for Y := 0 to Destination.Height - 1 do
        begin
          LeftRight := (Pos * Y) div Destination.Height;
          RightLeft := Destination.Width -
            (Pos * (Destination.Height - Y) div Destination.Height);

          if LeftRight >= 0 then
          begin
            if LeftRight >= Destination.Width then
              LeftRight := Destination.Width - 1;

            Bytes := (LeftRight + 1) * SizeOf(TAlphaColor);

            SrcPtr := PByte(SrcData.Data) + Y * SrcData.Pitch;
            DstPtr := PByte(DstData.Data) + Y * DstData.Pitch;

            Move(SrcPtr^, DstPtr^, Bytes);
          end;

          if RightLeft < Destination.Width then
          begin
            if RightLeft < 0 then
              RightLeft := 0;

            Bytes := (Destination.Width - RightLeft) * SizeOf(TAlphaColor);

            SrcPtr := PByte(SrcData.Data) + Y * SrcData.Pitch + RightLeft *
              SizeOf(TAlphaColor);

            DstPtr := PByte(DstData.Data) + Y * DstData.Pitch + RightLeft *
              SizeOf(TAlphaColor);

            Move(SrcPtr^, DstPtr^, Bytes);
          end;
        end;
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;

    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Diagonal sweep from top left bottom right clockwise
// -----------------------------------------------------------------------------
procedure EffectDiagonalTopLeftBottomRightClockwise(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  Y: Integer;
  Pos: Integer;
  TopStart: Integer;
  BottomRight: Integer;
  Bytes: NativeInt;
  SrcPtr, DstPtr: PByte;

  function CeilDiv(A, B: Int64): Int64;
  begin
    Result := (A + B - 1) div B;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    Pos := Round(Destination.Height * Progress);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.Write, DstData) then
      try
        if Pos = 0 then
        begin
          Bytes := Destination.Width * SizeOf(TAlphaColor);

          SrcPtr := PByte(SrcData.Data);
          DstPtr := PByte(DstData.Data);

          Move(SrcPtr^, DstPtr^, Bytes);
        end
        else
        begin
          for Y := 0 to Destination.Height - 1 do
          begin
            TopStart := CeilDiv(Int64(Y) * Destination.Width, Pos);

            if TopStart < Destination.Width then
            begin
              if TopStart < 0 then
                TopStart := 0;

              Bytes := (Destination.Width - TopStart) * SizeOf(TAlphaColor);

              SrcPtr := PByte(SrcData.Data) + Y * SrcData.Pitch + TopStart *
                SizeOf(TAlphaColor);

              DstPtr := PByte(DstData.Data) + Y * DstData.Pitch + TopStart *
                SizeOf(TAlphaColor);

              Move(SrcPtr^, DstPtr^, Bytes);
            end;

            BottomRight := Destination.Width -
              CeilDiv(Int64(Destination.Height - Y) *
              Destination.Width, Pos) + 1;

            if BottomRight > 0 then
            begin
              if BottomRight > Destination.Width then
                BottomRight := Destination.Width;

              Bytes := BottomRight * SizeOf(TAlphaColor);

              SrcPtr := PByte(SrcData.Data) + Y * SrcData.Pitch;
              DstPtr := PByte(DstData.Data) + Y * DstData.Pitch;

              Move(SrcPtr^, DstPtr^, Bytes);
            end;
          end;
        end;
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(DstData);
      end;

    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Reveal diagonal from top left
// -----------------------------------------------------------------------------
procedure EffectRevealDiagonalTopLeft(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  Y: Integer;
  MaxX, MaxY: Integer;
  RightX: Integer;
  Bytes: NativeInt;
  SrcPtr, DstPtr: PByte;
begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    MaxX := Round(Destination.Width * 2 * Progress);
    MaxY := Round(Destination.Height * 2 * Progress);

    if (MaxX > 0) and (MaxY > 0) then
    begin
      if Destination.Map(TMapAccess.Read, SrcData) and
        Temp.Map(TMapAccess.Write, DstData) then
        try
          for Y := 0 to Destination.Height - 1 do
          begin
            if Y >= MaxY then
              Continue;

            RightX := Integer((Int64(MaxX) * (MaxY - Y)) div MaxY);

            if RightX < 0 then
              Continue;

            if RightX >= Destination.Width then
              RightX := Destination.Width - 1;

            Bytes := (RightX + 1) * SizeOf(TAlphaColor);

            SrcPtr := PByte(SrcData.Data) + Y * SrcData.Pitch;
            DstPtr := PByte(DstData.Data) + Y * DstData.Pitch;

            Move(SrcPtr^, DstPtr^, Bytes);
          end;
        finally
          Destination.Unmap(SrcData);
          Temp.Unmap(DstData);
        end;
    end;

    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Reveal diagonal from top right
// -----------------------------------------------------------------------------
procedure EffectRevealDiagonalTopRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  Y: Integer;
  MaxX, MaxY: Integer;
  LeftX: Integer;
  Numerator: Int64;
  Bytes: NativeInt;
  SrcPtr, DstPtr: PByte;

  function CeilDiv(A, B: Int64): Int64;
  begin
    if A >= 0 then
      Result := (A + B - 1) div B
    else
      Result := A div B;
  end;

begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    MaxX := Round(Destination.Width * 2 * Progress);
    MaxY := Round(Destination.Height * 2 * Progress);

    if (MaxX > 0) and (MaxY > 0) then
    begin
      if Destination.Map(TMapAccess.Read, SrcData) and
        Temp.Map(TMapAccess.Write, DstData) then
        try
          for Y := 0 to Destination.Height - 1 do
          begin
            Numerator := Int64(Destination.Width) * MaxY - Int64(MaxX) *
              (MaxY - Y);

            LeftX := Integer(CeilDiv(Numerator, MaxY));

            if LeftX < 0 then
              LeftX := 0;

            if LeftX >= Destination.Width then
              Continue;

            Bytes := (Destination.Width - LeftX) * SizeOf(TAlphaColor);

            SrcPtr := PByte(SrcData.Data) + Y * SrcData.Pitch + LeftX *
              SizeOf(TAlphaColor);

            DstPtr := PByte(DstData.Data) + Y * DstData.Pitch + LeftX *
              SizeOf(TAlphaColor);

            Move(SrcPtr^, DstPtr^, Bytes);
          end;
        finally
          Destination.Unmap(SrcData);
          Temp.Unmap(DstData);
        end;
    end;

    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Reveal diagonal from bottom left
// -----------------------------------------------------------------------------
procedure EffectRevealDiagonalBottomLeft(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  Y: Integer;
  MaxX, MaxY: Integer;
  RightX: Integer;
  Numerator: Int64;
  Bytes: NativeInt;
  SrcPtr, DstPtr: PByte;
begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    MaxX := Round(Destination.Width * 2 * Progress);
    MaxY := Round(Destination.Height * 2 * Progress);

    if (MaxX > 0) and (MaxY > 0) then
    begin
      if Destination.Map(TMapAccess.Read, SrcData) and
        Temp.Map(TMapAccess.Write, DstData) then
        try
          for Y := 0 to Destination.Height - 1 do
          begin
            Numerator := Int64(MaxX) * (Int64(MaxY) - Destination.Height + Y);

            if Numerator < 0 then
              Continue;

            RightX := Integer(Numerator div MaxY);

            if RightX < 0 then
              Continue;

            if RightX >= Destination.Width then
              RightX := Destination.Width - 1;

            Bytes := (RightX + 1) * SizeOf(TAlphaColor);

            SrcPtr := PByte(SrcData.Data) + Y * SrcData.Pitch;
            DstPtr := PByte(DstData.Data) + Y * DstData.Pitch;

            Move(SrcPtr^, DstPtr^, Bytes);
          end;
        finally
          Destination.Unmap(SrcData);
          Temp.Unmap(DstData);
        end;
    end;

    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Reveal diagonal from bottom right
// -----------------------------------------------------------------------------
procedure EffectRevealDiagonalBottomRight(Canvas: TCanvas;
  Source, Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, DstData: TBitmapData;
  Y: Integer;
  MaxX, MaxY: Integer;
  LeftX: Integer;
  Numerator: Int64;
  Bytes: NativeInt;
  SrcPtr, DstPtr: PByte;
begin
  if Assigned(Source) then
    Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if not Assigned(Destination) then
    Exit;

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Clear(TAlphaColorRec.Null);

    MaxX := Round(Destination.Width * 2 * Progress);
    MaxY := Round(Destination.Height * 2 * Progress);

    if (MaxX > 0) and (MaxY > 0) then
    begin
      if Destination.Map(TMapAccess.Read, SrcData) and
        Temp.Map(TMapAccess.Write, DstData) then
        try
          for Y := 0 to Destination.Height - 1 do
          begin
            Numerator := Int64(MaxX) * (Int64(MaxY) - Destination.Height + Y);

            if Numerator < 0 then
              Continue;

            LeftX := Destination.Width - Integer(Numerator div MaxY);

            if LeftX < 0 then
              LeftX := 0;

            if LeftX >= Destination.Width then
              Continue;

            Bytes := (Destination.Width - LeftX) * SizeOf(TAlphaColor);

            SrcPtr := PByte(SrcData.Data) + Y * SrcData.Pitch + LeftX *
              SizeOf(TAlphaColor);

            DstPtr := PByte(DstData.Data) + Y * DstData.Pitch + LeftX *
              SizeOf(TAlphaColor);

            Move(SrcPtr^, DstPtr^, Bytes);
          end;
        finally
          Destination.Unmap(SrcData);
          Temp.Unmap(DstData);
        end;
    end;

    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Random squares appear
// -----------------------------------------------------------------------------
procedure EffectRandomSquares(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
const
  CellSize = 6;
var
  W, H, S, X, Y: Integer;
  SavedRandSeed: Integer;
  SrcRect, DstRect: TRectF;
  ScaleX, ScaleY: Single;
  State: TCanvasSaveState;
begin
  if not Assigned(Destination) then
    Exit;

  W := Round(Bounds.Width);
  H := Round(Bounds.Height);

  if (W <= 0) or (H <= 0) then
    Exit;

  ScaleX := Destination.Width / W;
  ScaleY := Destination.Height / H;

  S := (Min(W, H) div 50) + 1;

  State := Canvas.SaveState;
  try
    Canvas.IntersectClipRect(Bounds);

    if Assigned(Source) then
      Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

    if Progress <= 0 then
      Exit;

    if Progress >= 1 then
    begin
      Canvas.DrawBitmap(Destination, Destination.BoundsF, Bounds, 1, False);
      Exit;
    end;

    SavedRandSeed := RandSeed;
    RandSeed := 0;
    try
      X := 0;

      while X < W do
      begin
        Inc(X, S);

        Y := 0;

        while Y < H do
        begin
          Inc(Y, S);

          if Random(100) < Round(Progress * 100) then
          begin
            SrcRect := RectF((X - S) * ScaleX, (Y - S) * ScaleY,
              (X + S) * ScaleX, (Y + S) * ScaleY);

            DstRect := RectF(Bounds.Left + (X - S) / W * Bounds.Width,
              Bounds.Top + (Y - S) / H * Bounds.Height, Bounds.Left + (X + S) /
              W * Bounds.Width, Bounds.Top + (Y + S) / H * Bounds.Height);

            Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
          end;

          Inc(Y, S);
        end;

        Inc(X, S);
      end;
    finally
      RandSeed := SavedRandSeed;
    end;
  finally
    Canvas.RestoreState(State);
  end;
end;

// -----------------------------------------------------------------------------
// Blind vertically
// -----------------------------------------------------------------------------
procedure EffectBlindVert(Canvas: TCanvas; Source: TBitmap;
  Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  W, D, X: Single;
  S: Integer;
  L, R: Single;
  SrcRect, DstRect: TRectF;
begin
  if (Source = nil) or (Destination = nil) then
    Exit;

  W := Bounds.Width;

  if (W <= 0) or (Bounds.Height <= 0) then
    Exit;

  Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if Progress >= 1 then
  begin
    Canvas.DrawBitmap(Destination, Destination.BoundsF, Bounds, 1, False);
    Exit;
  end;

  if Progress <= 0 then
    Exit;

  S := EnsureRange(Round(W / 35) + 1, 10, 60);
  D := S * Progress;

  X := 0;

  while X < W do
  begin
    X := X + S;

    L := Bounds.Left + X - D;
    R := Bounds.Left + X + D;

    if L < Bounds.Left then
      L := Bounds.Left;

    if R > Bounds.Right then
      R := Bounds.Right;

    if L < R then
    begin
      SrcRect := RectF((L - Bounds.Left) / W * Destination.Width, 0,
        (R - Bounds.Left) / W * Destination.Width, Destination.Height);

      DstRect := RectF(L, Bounds.Top, R, Bounds.Bottom);

      Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
    end;

    X := X + S;
  end;
end;

// -----------------------------------------------------------------------------
// Blind horizontally
// -----------------------------------------------------------------------------
procedure EffectBlindHorz(Canvas: TCanvas; Source: TBitmap;
  Destination: TBitmap; Progress: Single; const Bounds: TRectF);
var
  H, D, Y: Single;
  S: Integer;
  T, B: Single;
  SrcRect, DstRect: TRectF;
begin
  if (Source = nil) or (Destination = nil) then
    Exit;

  H := Bounds.Height;

  if (Bounds.Width <= 0) or (H <= 0) then
    Exit;

  Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  if Progress >= 1 then
  begin
    Canvas.DrawBitmap(Destination, Destination.BoundsF, Bounds, 1, False);
    Exit;
  end;

  if Progress <= 0 then
    Exit;

  S := EnsureRange(Round(H / 20) + 1, 10, 60);
  D := S * Progress;

  Y := 0;

  while Y < H do
  begin
    Y := Y + S;

    T := Bounds.Top + Y - D;
    B := Bounds.Top + Y + D;

    if T < Bounds.Top then
      T := Bounds.Top;

    if B > Bounds.Bottom then
      B := Bounds.Bottom;

    if T < B then
    begin
      SrcRect := RectF(0, (T - Bounds.Top) / H * Destination.Height,
        Destination.Width, (B - Bounds.Top) / H * Destination.Height);

      DstRect := RectF(Bounds.Left, T, Bounds.Right, B);

      Canvas.DrawBitmap(Destination, SrcRect, DstRect, 1, False);
    end;

    Y := Y + S;
  end;
end;

// -----------------------------------------------------------------------------
// Dissolve
// -----------------------------------------------------------------------------
procedure EffectDissolve(Canvas: TCanvas; Source, Destination: TBitmap;
  Progress: Single; const Bounds: TRectF);
var
  Temp: TBitmap;
  SrcData, TmpData: TBitmapData;
  X, Y: Integer;
  Threshold: Integer;
  SavedRandSeed: Integer;
  SrcPixel, TmpPixel: PAlphaColor;
begin
  if (Source = nil) or (Destination = nil) then
    Exit;

  Canvas.DrawBitmap(Source, Source.BoundsF, Bounds, 1, False);

  Temp := TBitmap.Create;
  try
    Temp.SetSize(Destination.Width, Destination.Height);
    Temp.Assign(Source);

    SavedRandSeed := RandSeed;
    RandSeed := Integer(Destination);

    if Destination.Map(TMapAccess.Read, SrcData) and
      Temp.Map(TMapAccess.ReadWrite, TmpData) then
      try
        Threshold := Round(Progress * 100);

        for Y := 0 to Destination.Height - 1 do
        begin
          SrcPixel := PAlphaColor(PByte(SrcData.Data) + Y * SrcData.Pitch);
          TmpPixel := PAlphaColor(PByte(TmpData.Data) + Y * TmpData.Pitch);

          for X := 0 to Destination.Width - 1 do
          begin
            if Random(100) < Threshold then
              TmpPixel^ := SrcPixel^;

            Inc(SrcPixel);
            Inc(TmpPixel);
          end;
        end;
      finally
        Destination.Unmap(SrcData);
        Temp.Unmap(TmpData);
      end;

    RandSeed := SavedRandSeed;

    Canvas.DrawBitmap(Temp, Temp.BoundsF, Bounds, 1, False);
  finally
    Temp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Register Effects
// -----------------------------------------------------------------------------
procedure RegisterAllEffects;
begin
  RegisterEffect('Fade', EffectFade);
  RegisterEffect('Build up from right', EffectBuildRight);
  RegisterEffect('Build up from left', EffectBuildLeft);
  RegisterEffect('Quarters Reveal in to middle', EffectQuartersRevealMiddle);
  RegisterEffect('Quarters Expand to middle', EffectQuartersExpandMiddle);
  RegisterEffect('Quarters Slide in to middle', EffectQuartersSlideMiddle);
  RegisterEffect('Bars in from right', EffectBarsInRight);
  RegisterEffect('Bars in from left', EffectBarsInLeft);
  RegisterEffect('Bars left then right', EffectBarsLeftRight);
  RegisterEffect('Bars right then left', EffectBarsRightLeft);
  RegisterEffect('Bars from both sides', EffectBarsFromSides);
  RegisterEffect('Uneven shred from right', EffectUnevenShredRight);
  RegisterEffect('Uneven shred from left', EffectUnevenShredLeft);
  RegisterEffect('Uneven shred out from middle (horizontal)',
    EffectUnevenShredOutMiddle);
  RegisterEffect('Uneven shred in to middle (horizontal)',
    EffectUnevenShredInMiddle);
  RegisterEffect('Criss Cross reveal from bottom right',
    EffectCrissCrossBottomRight);
  RegisterEffect('Criss Cross reveal from top right', EffectCrissCrossTopRight);
  RegisterEffect('Criss Cross reveal from bottom left',
    EffectCrissCrossBottomLeft);
  RegisterEffect('Criss Cross reveal from top left', EffectCrissCrossTopLeft);
  RegisterEffect('Starburst clockwise from center',
    EffectStarburstCenterClockwise);
  RegisterEffect('Starburst anticlockwise from center',
    EffectStarburstCenterAntiClockwise);
  RegisterEffect('Speckle appear from right', EffectSpeckleAppearRight);
  RegisterEffect('Speckle appear from left', EffectSpeckleAppearLeft);
  RegisterEffect('Speckle appear from bottom', EffectSpeckleAppearBottom);
  RegisterEffect('Speckle appear from top', EffectSpeckleAppearTop);
  RegisterEffect('Diagonal sweep from top left bottom right anticlockwise',
    EffectDiagonalTopLeftBottomRightAnticlockwise);
  RegisterEffect('Diagonal sweep from top left bottom right clockwise',
    EffectDiagonalTopLeftBottomRightClockwise);
  RegisterEffect('Reveal diagonal from top left', EffectRevealDiagonalTopLeft);
  RegisterEffect('Reveal diagonal from top right',
    EffectRevealDiagonalTopRight);
  RegisterEffect('Reveal diagonal from bottom left',
    EffectRevealDiagonalBottomLeft);
  RegisterEffect('Reveal diagonal from bottom right',
    EffectRevealDiagonalBottomRight);
  RegisterEffect('Random squares appear', EffectRandomSquares);
  RegisterEffect('Blind vertically', EffectBlindVert);
  RegisterEffect('Blind horizontally', EffectBlindHorz);
  RegisterEffect('Dissolve', EffectDissolve);
end;

end.
