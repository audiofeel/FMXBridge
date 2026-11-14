
unit FMXBridge.RatingBar;

interface

uses
  System.Classes, System.UITypes, System.Types,
  FMX.Layouts, FMX.Graphics, FMX.Types, FMX.Objects;

// =============================================================================
// FRatingBar
// =============================================================================
type
  TRatingBarShape = (rbsStar, rbsHeart, rbsDiamond);

  FRatingBar = interface(IUnknown)
    ['{0B4CCA3E-506B-4F0D-87D6-2D84D7C6FFA3}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Shape(AShape: TRatingBarShape); stdcall;
    procedure ActiveColor(FColor: TAlphaColor); stdcall;
    procedure InActiveColor(FColor: TAlphaColor); stdcall;
    procedure Count(ACount: Integer); stdcall;
    procedure Maximum(FMax: Single); stdcall;
    procedure Space(ASpace: Single); stdcall;
    procedure Value(AValue: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFRatingBar = class(TInterfacedObject, FRatingBar)
  private
    FLayer: TLayout;
    FControl: TShape;
    FShape: TRatingBarShape;
    FCount: Integer;
    FMaximum: Single;
    FValue: Single;
    FSpace: Single;
    FActiveColor: TAlphaColor;
    FInActiveColor: TAlphaColor;
    FPath: TPathData;
    FActiveBrush: TBrush;
    FInActiveBrush: TBrush;
    procedure CreateBrush;
    procedure FreeBrush;
    procedure UpdateShapePath;
    procedure DoPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure DrawShape(Canvas: TCanvas; const R: TRectF; AValue: Single;
      APath: TPathData);
  public
    constructor Create;
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Shape(AShape: TRatingBarShape); stdcall;
    procedure ActiveColor(FColor: TAlphaColor); stdcall;
    procedure InActiveColor(FColor: TAlphaColor); stdcall;
    procedure Count(ACount: Integer); stdcall;
    procedure Maximum(FMax: Single); stdcall;
    procedure Space(ASpace: Single); stdcall;
    procedure Value(AValue: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitRatingBar: FRatingBar; stdcall;

implementation

uses
  System.SysUtils;

// =============================================================================
// FRatingBar
// =============================================================================
constructor TFRatingBar.Create;
begin
  inherited;

  FPath := TPathData.Create;

  FCount := 5;
  FMaximum := 5;
  FValue := 0;
  FSpace := 6;
  FShape := rbsStar;
  UpdateShapePath;

  FActiveColor := $FF1E90FF;
  FInActiveColor := $30000000;
end;

destructor TFRatingBar.Destroy;
begin
  FreeBrush;
  FPath.Free;

  inherited;
end;

procedure TFRatingBar.FCreate(FParent: TFmxObject);
begin
  FLayer := TLayout.Create(nil);
  FLayer.Parent := FParent;

  FControl := TShape.Create(nil);
  FControl.Parent := FLayer;
  FControl.Align := TAlignLayout.Client;
  FControl.HitTest := False;

  FControl.OnPaint := DoPaint;
end;

procedure TFRatingBar.CreateBrush;
begin
  if not Assigned(FActiveBrush) then
    FActiveBrush := TBrush.Create(TBrushKind.Solid, FActiveColor);

  if not Assigned(FInActiveBrush) then
    FInActiveBrush := TBrush.Create(TBrushKind.Solid, FInActiveColor);
end;

procedure TFRatingBar.FreeBrush;
begin
  FreeAndNil(FActiveBrush);
  FreeAndNil(FInActiveBrush);
end;

procedure TFRatingBar.UpdateShapePath;
begin
  case FShape of
    rbsStar:
      FPath.Data :=
        'm 4677,2657 -1004,727 385,1179 -1002,-731 -1002,731 386,-1179 -1005,-727 1240,3 381,-1181 381,1181 z';

    rbsHeart:
      FPath.Data :=
        'M 23.252905,18.859647 A 30,30 0 0 1 65.679312,61.286053 L 23.252905,103.71246 -19.173502,61.286053 A 30,30 0 0 1 23.252905,18.859647 z';

    rbsDiamond:
      FPath.Data :=
        'm 102.49805,188.72848 13.22984,-13.43029 53.15322,0.0668 12.99598,13.22984 -39.65611,39.75635 z';
  end;

  if Assigned(FControl) then
    FControl.Repaint;
end;

procedure TFRatingBar.DoPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  i: Integer;
  w, X, Step, StrokeR, Inset: Single;
  R: TRectF;
  dv, v: Single;
  P: TPathData;
begin
  if (FCount <= 0) or (FMaximum <= 0) then
    Exit;

  CreateBrush;

  P := TPathData.Create;
  try
    w := ARect.Height;
    StrokeR := FControl.Stroke.Thickness * 0.5;
    Inset := StrokeR;

    Step := w + FSpace + StrokeR * 2;

    dv := (FValue / FMaximum) * FCount;

    for i := 0 to FCount - 1 do
    begin
      X := i * Step;

      R := RectF(X + Inset, Inset, X + w - Inset, w - Inset);

      if dv - i >= 1 then
        v := 1
      else if dv <= i then
        v := 0
      else
        v := dv - i;

      DrawShape(Canvas, R, v, P);
    end;
  finally
    P.Free;
  end;
end;

procedure TFRatingBar.DrawShape(Canvas: TCanvas; const R: TRectF;
  AValue: Single; APath: TPathData);
var
  State: TCanvasSaveState;
  ClipR: TRectF;
  StrokeOffset: Single;
  R2: TRectF;
begin
  StrokeOffset := FControl.Stroke.Thickness * 0.5;

  R2 := RectF(R.Left + StrokeOffset, R.Top + StrokeOffset,
    R.Right - StrokeOffset, R.Bottom - StrokeOffset);

  APath.Assign(FPath);
  APath.FitToRect(R2);

  Canvas.FillPath(APath, FControl.AbsoluteOpacity, FInActiveBrush);

  if AValue > 0 then
  begin
    State := Canvas.SaveState;
    try
      ClipR := RectF(R.Left, R.Top, R.Left + R.Width * AValue, R.Bottom);
      Canvas.IntersectClipRect(ClipR);

      Canvas.FillPath(APath, FControl.AbsoluteOpacity, FActiveBrush);
    finally
      Canvas.RestoreState(State);
    end;
  end;

  Canvas.DrawPath(APath, FControl.AbsoluteOpacity, FControl.Stroke);
end;

procedure TFRatingBar.Cursor(FCursor: TCursor);
begin
  FLayer.Cursor := FCursor;
end;

procedure TFRatingBar.Left(FLeft: Single);
begin
  FLayer.Position.X := FLeft;
end;

procedure TFRatingBar.Top(FTop: Single);
begin
  FLayer.Position.Y := FTop;
end;

procedure TFRatingBar.Height(FHeight: Single);
begin
  FLayer.Height := FHeight;
end;

procedure TFRatingBar.Width(FWidth: Single);
begin
  FLayer.Width := FWidth;
end;

procedure TFRatingBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  FLayer.Position.X := FLeft;
  FLayer.Position.Y := FTop;
  FLayer.Width := FWidth;
  FLayer.Height := FHeight;
end;

procedure TFRatingBar.Position(X, Y: Single);
begin
  FLayer.Position.X := X;
  FLayer.Position.Y := Y;
end;

procedure TFRatingBar.Align(Al: TAlignLayout);
begin
  FLayer.Align := Al;
end;

procedure TFRatingBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FLayer.Margins.Left := FLeft;
  FLayer.Margins.Top := FTop;
  FLayer.Margins.Right := FRight;
  FLayer.Margins.Bottom := FBottom;
end;

procedure TFRatingBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FLayer.Padding.Left := FLeft;
  FLayer.Padding.Top := FTop;
  FLayer.Padding.Right := FRight;
  FLayer.Padding.Bottom := FBottom;
end;

procedure TFRatingBar.SetHint(const FText: WideString);
begin
  FLayer.ShowHint := True;
  FLayer.Hint := FText;
end;

procedure TFRatingBar.SetClipChildren(FValue: Boolean);
begin
  FLayer.ClipChildren := FValue;
end;

procedure TFRatingBar.SetClipParent(FValue: Boolean);
begin
  FLayer.ClipParent := FValue;
end;

procedure TFRatingBar.BringToFront;
begin
  FLayer.BringToFront;
end;

procedure TFRatingBar.SendToBack;
begin
  FLayer.SendToBack;
end;

procedure TFRatingBar.SetTag(FTag: Integer);
begin
  FLayer.Tag := FTag;
end;

procedure TFRatingBar.Shape(AShape: TRatingBarShape);
begin
  if FShape = AShape then
    Exit;

  FShape := AShape;
  UpdateShapePath;
end;

procedure TFRatingBar.ActiveColor(FColor: TAlphaColor);
begin
  FActiveColor := FColor;
  FreeAndNil(FActiveBrush);
  FControl.Repaint;
end;

procedure TFRatingBar.InActiveColor(FColor: TAlphaColor);
begin
  FInActiveColor := FColor;
  FreeAndNil(FInActiveBrush);
  FControl.Repaint;
end;

procedure TFRatingBar.Count(ACount: Integer);
begin
  FCount := ACount;
  FControl.Repaint;
end;

procedure TFRatingBar.Maximum(FMax: Single);
begin
  FMaximum := FMax;
  FControl.Repaint;
end;

procedure TFRatingBar.Space(ASpace: Single);
begin
  FSpace := ASpace;
  FControl.Repaint;
end;

procedure TFRatingBar.Value(AValue: Single);
begin
  FValue := AValue;
  FControl.Repaint;
end;

procedure TFRatingBar.StrokeColor(FColor: TAlphaColor);
begin
  FControl.Stroke.Color := FColor;
  FControl.Repaint;
end;

procedure TFRatingBar.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  FControl.Stroke.Kind := TBrushKind.Solid;
  FControl.Stroke.Thickness := FThickness;
  FControl.Stroke.Cap := TStrokeCap(CapStyle);
  FControl.Stroke.Dash := TStrokeDash(Dash);
  FControl.Stroke.Join := TStrokeJoin(Join);
  FControl.Repaint;
end;

procedure TFRatingBar.Opacity(FOpacity: Single);
begin
  FLayer.Opacity := FOpacity;
end;

procedure TFRatingBar.RotationAngle(FValue: Single);
begin
  FLayer.RotationAngle := FValue;
end;

procedure TFRatingBar.RotationCenter(X, Y: Single);
begin
  FLayer.RotationCenter.X := X;
  FLayer.RotationCenter.Y := Y;
end;

procedure TFRatingBar.Enabled(FEnabled: Boolean);
begin
  FLayer.Enabled := FEnabled;
end;

procedure TFRatingBar.Visible(FVisible: Boolean);
begin
  FLayer.Visible := FVisible;
end;

procedure TFRatingBar.HitTest(FEnabled: Boolean);
begin
  FLayer.HitTest := FEnabled;
end;

function TFRatingBar.IsVisible: Boolean;
begin
  Result := FLayer.Visible;
end;

function TFRatingBar.GetTag: Integer;
begin
  Result := FLayer.Tag;
end;

function TFRatingBar.GetLeft: Single;
begin
  Result := FLayer.Position.X;
end;

function TFRatingBar.GetTop: Single;
begin
  Result := FLayer.Position.Y;
end;

function TFRatingBar.GetHeight: Single;
begin
  Result := FLayer.Height;
end;

function TFRatingBar.GetWidth: Single;
begin
  Result := FLayer.Width;
end;

function TFRatingBar.GetObject: TFmxObject;
begin
  Result := FLayer;
end;

procedure TFRatingBar.OnClick(Event: TNotifyEvent);
begin
  FLayer.OnClick := Event;
end;

procedure TFRatingBar.OnMouseDown(Event: TMouseEvent);
begin
  FLayer.OnMouseDown := Event;
end;

procedure TFRatingBar.OnMouseEnter(Event: TNotifyEvent);
begin
  FLayer.OnMouseEnter := Event;
end;

procedure TFRatingBar.OnMouseLeave(Event: TNotifyEvent);
begin
  FLayer.OnMouseLeave := Event;
end;

procedure TFRatingBar.OnMouseUp(Event: TMouseEvent);
begin
  FLayer.OnMouseUp := Event;
end;

function TFRatingBar.Handle: TFmxObject;
begin
  Result := FLayer;
end;

// =============================================================================
// Exports
// =============================================================================
function InitRatingBar: FRatingBar;
begin
  Result := TFRatingBar.Create;
end;

exports
  InitRatingBar;

end.
