
unit FMXBridge.BlurRectangle;

interface

uses
  System.Classes, System.UITypes,
  FMX.Types, FMX.Objects, FMX.Forms, FMX.Graphics, FMX.Filter.Effects;

// =============================================================================
// FBlurRectangle
// =============================================================================
type
  FBlurRectangle = interface(IUnknown)
    ['{EBA9AE42-E4BB-4886-996A-2FECCFF9B6F0}']
    procedure FCreate(FParent: TFmxObject; FDark: Boolean); stdcall;
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
    procedure TintColor(FColor: TAlphaColor); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure Sides(FSides: TSides); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
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
    procedure OnMouseMove(Event: TMouseMoveEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFMXBlurRectangle = class(TRectangle)
  private
    FBitmapOfHost: TBitmap;
    FBitmapBlurred: TBitmap;
    FGaussianBlurEffect: TGaussianBlurEffect;
    FBlurAmount: Single;
    FTintColor: TAlphaColor;
    FTintAlpha: Byte;
    FIsPainting: Boolean;
    procedure SetBlurAmount(const AValue: Single);
    procedure SetTintColor(const AValue: TAlphaColor);
    function FindRootForm: TCustomForm;
    function GetHostSize(out AWidth, AHeight: Single): Boolean;
    function CanCapture: Boolean;
    procedure UpdateBitmapOfHost;
    procedure UpdateBitmapBlurred;
    procedure DrawGlass;
  protected
    procedure Paint; override;
    procedure ParentChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property BlurAmount: Single read FBlurAmount write SetBlurAmount;
    property TintColor: TAlphaColor read FTintColor write SetTintColor;
  end;

// =============================================================================
// TFBlurRectangle
// =============================================================================
  TFBlurRectangle = class(TInterfacedObject, FBlurRectangle)
  private
    ControlBlurRectangle: TFMXBlurRectangle;
  public
    procedure FCreate(FParent: TFmxObject; FDark: Boolean); stdcall;
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
    procedure TintColor(FColor: TAlphaColor); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure Sides(FSides: TSides); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
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
    procedure OnMouseMove(Event: TMouseMoveEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitBlurRectangleHandle: FBlurRectangle; stdcall;

implementation

uses
  System.Types, System.Math, FMX.Controls;

const
  CDefaultTintAlpha = 32;

type
  TCustomFormAccess = class(TCustomForm);

// -----------------------------------------------------------------------------
// TFMXBlurRectangle
// -----------------------------------------------------------------------------
constructor TFMXBlurRectangle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Fill.Kind := TBrushKind.None;

  FBitmapOfHost := TBitmap.Create;
  FBitmapBlurred := TBitmap.Create;

  FGaussianBlurEffect := TGaussianBlurEffect.Create(Self);

  FBlurAmount := 5;

  FTintColor := TAlphaColorRec.White;

  FTintAlpha := CDefaultTintAlpha;

  FIsPainting := False;
end;

destructor TFMXBlurRectangle.Destroy;
begin
  FGaussianBlurEffect.Free;
  FBitmapBlurred.Free;
  FBitmapOfHost.Free;

  inherited;
end;

function TFMXBlurRectangle.FindRootForm: TCustomForm;
var
  P: TFmxObject;
begin
  Result := nil;

  P := Parent;

  while P <> nil do
  begin
    if P is TCustomForm then
    begin
      Result := TCustomForm(P);
      Exit;
    end;

    P := P.Parent;
  end;
end;

function TFMXBlurRectangle.GetHostSize(out AWidth, AHeight: Single): Boolean;
var
  Form: TCustomForm;
begin
  Form := FindRootForm;

  Result := Form <> nil;

  if not Result then
  begin
    AWidth := 0;
    AHeight := 0;
    Exit;
  end;

  AWidth := Form.ClientWidth;
  AHeight := Form.ClientHeight;
end;

function TFMXBlurRectangle.CanCapture: Boolean;
var
  W, H: Single;
begin
  Result :=
    not (csLoading in ComponentState) and not (csReading in ComponentState) and
    not (csDestroying in ComponentState) and (Parent <> nil) and
    (Width > 0) and (Height > 0) and GetHostSize(W, H) and (W > 0) and
    (H > 0);
end;

procedure TFMXBlurRectangle.SetBlurAmount(const AValue: Single);
begin
  if SameValue(FBlurAmount, AValue) then
    Exit;

  FBlurAmount := Max(0, AValue);

  Repaint;
end;

procedure TFMXBlurRectangle.SetTintColor(const AValue: TAlphaColor);
begin
  FTintColor := (AValue and $00FFFFFF) or (TAlphaColor(FTintAlpha) shl 24);

  Repaint;
end;

procedure TFMXBlurRectangle.ParentChanged;
begin
  inherited;

  Repaint;
end;

procedure TFMXBlurRectangle.UpdateBitmapOfHost;
var
  Form: TCustomForm;
  TargetWidth: Integer;
  TargetHeight: Integer;
  CanvasBehind: TCanvas;
  Child: TFmxObject;
  ChildControl: TControl;
  ResourceLink: TFmxObject;
begin
  Form := FindRootForm;

  if Form = nil then
    Exit;

  TargetWidth := Max(1, Round(Form.ClientWidth));
  TargetHeight := Max(1, Round(Form.ClientHeight));

  FBitmapOfHost.SetSize(TargetWidth, TargetHeight);

  CanvasBehind := FBitmapOfHost.Canvas;

  if not CanvasBehind.BeginScene then
    Exit;

  try
    CanvasBehind.Clear(TAlphaColorRec.Null);

    if Form.Fill.Kind <> TBrushKind.None then
    begin
      CanvasBehind.FillRect(RectF(0, 0, TargetWidth, TargetHeight),
        0, 0, [], 1, Form.Fill);
    end;

    ResourceLink := TCustomFormAccess(Form).ResourceLink;

    FDisablePaint := True;

    try
      for Child in Form.Children do
      begin
        if not (Child is TControl) then
          Continue;

        ChildControl := TControl(Child);

        if ChildControl = Self then
          Continue;

        if not ChildControl.Visible then
          Continue;

        if Child = ResourceLink then
        begin
          if Form.Transparency then
            Continue;

          if Form.Fill.Kind <> TBrushKind.None then
            Continue;

          if (Form.Fill.Kind = TBrushKind.Solid) and
             (Form.Fill.Color <> Form.Fill.DefaultColor) then
            Continue;
        end;

        ChildControl.PaintTo(CanvasBehind, ChildControl.BoundsRect);
      end;
    finally
      FDisablePaint := False;
    end;
  finally
    CanvasBehind.EndScene;
  end;
end;

procedure TFMXBlurRectangle.UpdateBitmapBlurred;
var
  TargetWidth: Integer;
  TargetHeight: Integer;
  AreaOfInterest: TRect;
  AbsPos: TPointF;
begin
  TargetWidth := Max(1, Round(Width));
  TargetHeight := Max(1, Round(Height));

  FBitmapBlurred.SetSize(TargetWidth, TargetHeight);

  AbsPos := LocalToAbsolute(PointF(0, 0));

  AreaOfInterest.Left := Max(0, Min(Trunc(AbsPos.X), FBitmapOfHost.Width - 1));
  AreaOfInterest.Top := Max(0, Min(Trunc(AbsPos.Y), FBitmapOfHost.Height - 1));

  AreaOfInterest.Width := Min(TargetWidth,
    FBitmapOfHost.Width - AreaOfInterest.Left);

  AreaOfInterest.Height := Min(TargetHeight,
      FBitmapOfHost.Height - AreaOfInterest.Top);

  if AreaOfInterest.Width <= 0 then
    AreaOfInterest.Width := 1;

  if AreaOfInterest.Height <= 0 then
    AreaOfInterest.Height := 1;

  if FBitmapBlurred.Canvas.BeginScene then
  try
    FBitmapBlurred.Canvas.Clear(TAlphaColorRec.Null);

    FBitmapBlurred.Canvas.DrawBitmap(FBitmapOfHost, AreaOfInterest,
      RectF(0, 0, AreaOfInterest.Width, AreaOfInterest.Height), 1, True);
  finally
    FBitmapBlurred.Canvas.EndScene;
  end;

  FGaussianBlurEffect.BlurAmount := FBlurAmount;
  FGaussianBlurEffect.ProcessEffect(nil, FBitmapBlurred, 0);
  FGaussianBlurEffect.BlurAmount := FBlurAmount * 0.4;
  FGaussianBlurEffect.ProcessEffect(nil, FBitmapBlurred, 0);
end;

procedure TFMXBlurRectangle.DrawGlass;
begin
  Canvas.Fill.Kind := TBrushKind.Bitmap;
  Canvas.Fill.Bitmap.Bitmap := FBitmapBlurred;
  Canvas.Fill.Bitmap.WrapMode := TWrapMode.TileOriginal;

  Canvas.FillRect(LocalRect, XRadius, YRadius, Corners,
    AbsoluteOpacity, Canvas.Fill, CornerType);

  if FTintAlpha > 0 then
  begin
    Canvas.Fill.Kind := TBrushKind.Solid;
    Canvas.Fill.Color := FTintColor;

    Canvas.FillRect(LocalRect, XRadius, YRadius, Corners,
      AbsoluteOpacity, Canvas.Fill, CornerType);
  end;
end;

procedure TFMXBlurRectangle.Paint;
begin
  if FIsPainting then
    Exit;

  if not CanCapture then
    Exit;

  FIsPainting := True;
  try
    UpdateBitmapOfHost;
    UpdateBitmapBlurred;

    Canvas.BeginScene;
    try
      DrawGlass;
    finally
      Canvas.EndScene;
    end;

    inherited;
  finally
    FIsPainting := False;
  end;
end;

// =============================================================================
// FBlurRectangle
// =============================================================================
procedure TFBlurRectangle.FCreate(FParent: TFmxObject; FDark: Boolean);
begin
  ControlBlurRectangle := TFMXBlurRectangle.Create(nil);
  ControlBlurRectangle.Parent := TFmxObject(FParent);

  ControlBlurRectangle.Stroke.Kind := TBrushKind.Solid;
  ControlBlurRectangle.Stroke.Thickness := 1;

  if FDark then
  begin
    ControlBlurRectangle.TintColor := TAlphaColorRec.Black;

    ControlBlurRectangle.Stroke.Color :=
      TAlphaColor((TAlphaColorRec.Black and $00FFFFFF) or
        (CDefaultTintAlpha shl 24));
  end
  else
  begin
    ControlBlurRectangle.TintColor := TAlphaColorRec.White;

    ControlBlurRectangle.Stroke.Color :=
      TAlphaColor((TAlphaColorRec.White and $00FFFFFF) or
        (CDefaultTintAlpha shl 24));
  end;
end;

procedure TFBlurRectangle.Cursor(FCursor: TCursor);
begin
  ControlBlurRectangle.Cursor := TCursor(FCursor);
end;

procedure TFBlurRectangle.Left(FLeft: Single);
begin
  ControlBlurRectangle.Position.X := FLeft;
end;

procedure TFBlurRectangle.Top(FTop: Single);
begin
  ControlBlurRectangle.Position.Y := FTop;
end;

procedure TFBlurRectangle.Height(FHeight: Single);
begin
  ControlBlurRectangle.Size.Height := FHeight;
end;

procedure TFBlurRectangle.Width(FWidth: Single);
begin
  ControlBlurRectangle.Size.Width := FWidth;
end;

procedure TFBlurRectangle.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlBlurRectangle.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFBlurRectangle.Position(X, Y: Single);
begin
  ControlBlurRectangle.Position.X := X;
  ControlBlurRectangle.Position.Y := Y;
end;

procedure TFBlurRectangle.Align(Al: TAlignLayout);
begin
  ControlBlurRectangle.Align := TAlignLayout(Al);
end;

procedure TFBlurRectangle.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlBlurRectangle.Margins.Left := FLeft;
  ControlBlurRectangle.Margins.Top := FTop;
  ControlBlurRectangle.Margins.Right := FRight;
  ControlBlurRectangle.Margins.Bottom := FBottom;
end;

procedure TFBlurRectangle.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlBlurRectangle.Padding.Left := FLeft;
  ControlBlurRectangle.Padding.Top := FTop;
  ControlBlurRectangle.Padding.Right := FRight;
  ControlBlurRectangle.Padding.Bottom := FBottom;
end;

procedure TFBlurRectangle.SetHint(const FText: WideString);
begin
  ControlBlurRectangle.ShowHint := True;
  ControlBlurRectangle.Hint := string(FText);
end;

procedure TFBlurRectangle.SetClipChildren(FValue: Boolean);
begin
  ControlBlurRectangle.ClipChildren := FValue;
end;

procedure TFBlurRectangle.SetClipParent(FValue: Boolean);
begin
  ControlBlurRectangle.ClipParent := FValue;
end;

procedure TFBlurRectangle.BringToFront;
begin
  ControlBlurRectangle.BringToFront;
end;

procedure TFBlurRectangle.SendToBack;
begin
  ControlBlurRectangle.SendToBack;
end;

procedure TFBlurRectangle.SetTag(FTag: Integer);
begin
  ControlBlurRectangle.Tag := FTag;
end;

procedure TFBlurRectangle.TintColor(FColor: TAlphaColor);
begin
  ControlBlurRectangle.TintColor := TAlphaColor((FColor and $00FFFFFF) or
    (CDefaultTintAlpha shl 24));
end;

procedure TFBlurRectangle.StrokeColor(FColor: TAlphaColor);
begin
  ControlBlurRectangle.Stroke.Kind := TBrushKind.Solid;

  ControlBlurRectangle.Stroke.Color := TAlphaColor((FColor and $00FFFFFF) or
    (CDefaultTintAlpha shl 24));
end;

procedure TFBlurRectangle.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlBlurRectangle.Stroke.Kind := TBrushKind.Solid;
  ControlBlurRectangle.Stroke.Thickness := FThickness;
  ControlBlurRectangle.Stroke.Cap := TStrokeCap(CapStyle);
  ControlBlurRectangle.Stroke.Dash := TStrokeDash(Dash);
  ControlBlurRectangle.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFBlurRectangle.CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
  FCornerType: TCornerType);
begin
  ControlBlurRectangle.CornerType := TCornerType(FCornerType);
  ControlBlurRectangle.Corners := TCorners(FCorners);
  ControlBlurRectangle.XRadius := XRadi;
  ControlBlurRectangle.YRadius := YRadi;
end;

procedure TFBlurRectangle.Sides(FSides: TSides);
begin
  ControlBlurRectangle.Sides := TSides(FSides);
end;

procedure TFBlurRectangle.BlurAmount(FValue: Single);
begin
  ControlBlurRectangle.BlurAmount := FValue;
end;

procedure TFBlurRectangle.Opacity(FOpacity: Single);
begin
  ControlBlurRectangle.Opacity := FOpacity;
end;

procedure TFBlurRectangle.RotationAngle(FValue: Single);
begin
  ControlBlurRectangle.RotationAngle := FValue;
end;

procedure TFBlurRectangle.RotationCenter(X, Y: Single);
begin
  ControlBlurRectangle.RotationCenter.X := X;
  ControlBlurRectangle.RotationCenter.Y := Y;
end;

procedure TFBlurRectangle.Enabled(FEnabled: Boolean);
begin
  ControlBlurRectangle.Enabled := FEnabled;
end;

procedure TFBlurRectangle.Visible(FVisible: Boolean);
begin
  ControlBlurRectangle.Visible := FVisible;
end;

procedure TFBlurRectangle.HitTest(FEnabled: Boolean);
begin
  ControlBlurRectangle.HitTest := FEnabled;
end;

function TFBlurRectangle.IsVisible: Boolean;
begin
  Result := ControlBlurRectangle.Visible;
end;

function TFBlurRectangle.GetTag: Integer;
begin
  Result := ControlBlurRectangle.Tag;
end;

function TFBlurRectangle.GetLeft: Single;
begin
  Result := ControlBlurRectangle.Position.X;
end;

function TFBlurRectangle.GetTop: Single;
begin
  Result := ControlBlurRectangle.Position.Y;
end;

function TFBlurRectangle.GetHeight: Single;
begin
  Result := ControlBlurRectangle.Size.Height;
end;

function TFBlurRectangle.GetWidth: Single;
begin
  Result := ControlBlurRectangle.Size.Width;
end;

function TFBlurRectangle.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlBlurRectangle);
end;

procedure TFBlurRectangle.OnClick(Event: TNotifyEvent);
begin
  ControlBlurRectangle.OnClick := TNotifyEvent(Event);
end;

procedure TFBlurRectangle.OnMouseDown(Event: TMouseEvent);
begin
  ControlBlurRectangle.OnMouseDown := TMouseEvent(Event);
end;

procedure TFBlurRectangle.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlBlurRectangle.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFBlurRectangle.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlBlurRectangle.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFBlurRectangle.OnMouseUp(Event: TMouseEvent);
begin
  ControlBlurRectangle.OnMouseUp := TMouseEvent(Event);
end;

procedure TFBlurRectangle.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlBlurRectangle.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFBlurRectangle.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlBlurRectangle);
end;

// =============================================================================
// Exports
// =============================================================================
function InitBlurRectangleHandle: FBlurRectangle;
begin
  Result := TFBlurRectangle.Create;
end;

exports
  InitBlurRectangleHandle;

end.
