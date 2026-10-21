
unit FMXBridge.BrushHelpers;

interface

uses
  System.UITypes, FMX.Graphics, FMX.Controls;

type
  TBrushHelper = class
  public
    class procedure ApplyGradient(FBrush: TBrush; FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); static;
    class procedure ApplyLinearAngle(FBrush: TBrush; FAngle: Single); static;
    class procedure ApplyRadialAngle(FBrush: TBrush; FAngle: Single); static;
    class procedure SetGradientPosition(FBrush: TBrush;
      X1, Y1, X2, Y2: Single); static;
  end;

procedure SetAccentColorStyle(AStyleBook: TStyleBook; FColor: TAlphaColor);

implementation

uses
  System.Types, System.Math, System.Classes,
  FMX.Styles.Switch, FMX.Types, FMX.Filter.Effects,
  FMX.Objects, FMX.Ani, FMX.StdCtrls, FMX.Styles.Objects;

// =============================================================================
// Gradient Utilities
// =============================================================================
class procedure TBrushHelper.ApplyGradient(FBrush: TBrush;
  FColor1, FColor2: TAlphaColor; FStyle: TGradientStyle);
begin
  FBrush.Kind := TBrushKind.Gradient;
  FBrush.Gradient.Style := FStyle;
  FBrush.Gradient.Points.Clear;

  with TGradientPoint(FBrush.Gradient.Points.Add) do
  begin
    Offset := 0.0;
    Color := FColor1;
  end;

  with TGradientPoint(FBrush.Gradient.Points.Add) do
  begin
    Offset := 1.0;
    Color := FColor2;
  end;
end;

class procedure TBrushHelper.ApplyLinearAngle(FBrush: TBrush; FAngle: Single);
var
  dx, dy: Single;
begin
  dx := Cos(DegToRad(FAngle));
  dy := Sin(DegToRad(FAngle));

  FBrush.Gradient.StartPosition.Point :=
    TPointF.Create(0.5 - dx * 0.5, 0.5 - dy * 0.5);
  FBrush.Gradient.StopPosition.Point :=
    TPointF.Create(0.5 + dx * 0.5, 0.5 + dy * 0.5);
end;

class procedure TBrushHelper.ApplyRadialAngle(FBrush: TBrush; FAngle: Single);
var
  cx, cy, dx, dy: Single;
begin
  cx := 0.5;
  cy := 0.5;

  dx := Cos(DegToRad(FAngle)) * 0.5;
  dy := Sin(DegToRad(FAngle)) * 0.5;

  FBrush.Gradient.StartPosition.Point := TPointF.Create(cx, cy);
  FBrush.Gradient.StopPosition.Point := TPointF.Create(cx + dx, cy + dy);
end;

class procedure TBrushHelper.SetGradientPosition(FBrush: TBrush;
  X1, Y1, X2, Y2: Single);
begin
  FBrush.Gradient.StartPosition.Point := TPointF.Create(X1, Y1);
  FBrush.Gradient.StopPosition.Point := TPointF.Create(X2, Y2);
end;

// =============================================================================
// SetAccentColorStyle
// =============================================================================
procedure SetAccentColorStyle(AStyleBook: TStyleBook; FColor: TAlphaColor);
var
  Res: TBrushObject;
  OldColor: TAlphaColor;

  function NewColor(C: TAlphaColor): TAlphaColor;
  begin
    if (C and $00FFFFFF) = (OldColor and $00FFFFFF) then
      Result := (C and $FF000000) or (FColor and $00FFFFFF)
    else
      Result := C;
  end;

  procedure UpdateBrush(ABrush: TBrush);
  var
    k: Integer;
  begin
    if not Assigned(ABrush) then
      Exit;

    if ABrush.Kind = TBrushKind.Gradient then
    begin
      if Assigned(ABrush.Gradient) then
        for k := 0 to ABrush.Gradient.Points.Count - 1 do
          ABrush.Gradient.Points[k].Color :=
            NewColor(ABrush.Gradient.Points[k].Color);
    end
    else
      ABrush.Color := NewColor(ABrush.Color);
  end;

  procedure ProcessObject(Obj: TFMXObject);
  var
    idx: Integer;
  begin
    if Obj = nil then
      Exit;

    if Obj is TShape then
    begin
      UpdateBrush(TShape(Obj).Fill);
      UpdateBrush(TShape(Obj).Stroke);
    end
    else if Obj is TColorObject then
      TColorObject(Obj).Color := NewColor(TColorObject(Obj).Color)
    else if Obj is TBrushObject then
      UpdateBrush(TBrushObject(Obj).Brush)
    else if Obj is TColorAnimation then
      with TColorAnimation(Obj) do
      begin
        StartValue := NewColor(StartValue);
        StopValue := NewColor(StopValue);
      end
    else if Obj is TLabel then
      TLabel(Obj).TextSettings.FontColor :=
        NewColor(TLabel(Obj).TextSettings.FontColor)
    else if Obj is TText then
    begin
      if Obj is TTabStyleTextObject then
        with TTabStyleTextObject(Obj) do
        begin
          HotColor := NewColor(HotColor);
          ActiveColor := NewColor(ActiveColor);
          Color := NewColor(Color);
        end
      else if Obj is TActiveStyleTextObject then
        with TActiveStyleTextObject(Obj) do
        begin
          ActiveColor := NewColor(ActiveColor);
          Color := NewColor(Color);
        end
      else if Obj is TButtonStyleTextObject then
        with TButtonStyleTextObject(Obj) do
        begin
          HotColor := NewColor(HotColor);
          FocusedColor := NewColor(FocusedColor);
          NormalColor := NewColor(NormalColor);
          PressedColor := NewColor(PressedColor);
        end
      else
        TText(Obj).TextSettings.FontColor :=
          NewColor(TText(Obj).TextSettings.FontColor);
    end
    else if Obj is TSwitchObject then
      with TSwitchObject(Obj) do
      begin
        UpdateBrush(Fill);
        UpdateBrush(FillOn);
        UpdateBrush(Stroke);
        UpdateBrush(Thumb);
      end
    else if Obj is TFillRGBEffect then
      TFillRGBEffect(Obj).Color := NewColor(TFillRGBEffect(Obj).Color);

    Obj.TagString := '';

    if Assigned(Obj.Children) then
      for idx := 0 to Obj.Children.Count - 1 do
        ProcessObject(Obj.Children[idx]);
  end;

begin
  if (AStyleBook = nil) or (FColor = 0) then
    Exit;

  Res := AStyleBook.Style.FindStyleResource('color_accent') as TBrushObject;

  if not Assigned(Res) then
    Exit;

  OldColor := Res.Brush.Color;

  ProcessObject(AStyleBook.Style);
end;

end.
