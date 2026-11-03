
unit FMXBridge.GlassRectangle;

interface

uses
  System.Classes, System.UITypes, System.Math.Vectors,
  Winapi.Windows,
  FMX.Types, FMX.Objects, FMX.Forms,
  FMX.Graphics, FMX.Filter, FMX.Filter.Effects;

// =============================================================================
// FGlassRectangle
// =============================================================================
type
  FGlassRectangle = interface(IUnknown)
    ['{CCF880AD-FEE6-470E-955F-7CABA8BDDB0C}']
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
    procedure GlassAmount(FValue: Single); stdcall;
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

// -----------------------------------------------------------------------------
// TGlassMaterialFilter
// -----------------------------------------------------------------------------
  TGlassMaterialFilter = class(TFilter)
  private
    FGlassAmount: Single;
    FTintColor: TAlphaColor;
    FBackgroundRect: TVector3D;
    FOutputSize: TVector3D;
    FCornerRadius: TVector3D;
  protected
    procedure LoadShaders; override;
  public
    constructor Create; override;
    class function FilterAttr: TFilterRec; override;
    property GlassAmount: Single read FGlassAmount write FGlassAmount;
    property TintColor: TAlphaColor read FTintColor write FTintColor;
    property BackgroundRect: TVector3D read FBackgroundRect
      write FBackgroundRect;
    property OutputSize: TVector3D read FOutputSize write FOutputSize;
    property CornerRadius: TVector3D read FCornerRadius write FCornerRadius;
  end;

// -----------------------------------------------------------------------------
// TFMXGlassRectangle
// -----------------------------------------------------------------------------
  TFMXGlassRectangle = class(TRectangle)
  private
    FBitmapOfHost: TBitmap;
    FBitmapBlurred: TBitmap;
    FBitmapGlass: TBitmap;
    FGaussianBlurEffect: TGaussianBlurEffect;
    FGlassFilter: TGlassMaterialFilter;
    FGlassAmount: Single;
    FBlurAmount: Single;
    FTintColor: TAlphaColor;
    FTintAlpha: Byte;
    FIsPainting: Boolean;
    procedure SetGlassAmount(const AValue: Single);
    procedure SetBlurAmount(const AValue: Single);
    procedure SetTintColor(const AValue: TAlphaColor);
    function FindRootForm: TCustomForm;
    function GetHostSize(out AWidth, AHeight: Single): Boolean;
    function CanCapture: Boolean;
    procedure UpdateBitmapOfHost;
    procedure UpdateBitmapBlurred;
    procedure UpdateBitmapGlass;
    procedure DrawGlass;
  protected
    procedure Paint; override;
    procedure ParentChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property GlassAmount: Single read FGlassAmount write SetGlassAmount;
    property BlurAmount: Single read FBlurAmount write SetBlurAmount;
    property TintColor: TAlphaColor read FTintColor write SetTintColor;
  end;

// =============================================================================
// TFGlassRectangle
// =============================================================================
  TFGlassRectangle = class(TInterfacedObject, FGlassRectangle)
  private
    ControlGlassRectangle: TFMXGlassRectangle;
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
    procedure GlassAmount(FValue: Single); stdcall;
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

// ==================================================
// Exports
// ==================================================
function InitGlassRectangleHandle: FGlassRectangle; stdcall;

implementation

uses
  System.SysUtils, System.Types, System.Math,
  FMX.Controls, FMX.Types3D;

{$I GlassMaterial_DX11.inc}

const
  CDefaultTintAlpha = 32;

type
  TCustomFormAccess = class(TCustomForm);

// -----------------------------------------------------------------------------
// TGlassMaterialFilter
// -----------------------------------------------------------------------------
constructor TGlassMaterialFilter.Create;
var
  ShaderData: TBytes;
  ShaderVariables: TArray<TContextShaderVariable>;
begin
  inherited Create;

  FGlassAmount := 0.5;
  FTintColor := TAlphaColorRec.White;

  SetLength(ShaderData, Length(GlassShaderData));

  Move(GlassShaderData[0], ShaderData[0], Length(GlassShaderData));

  ShaderVariables := [
  { t0 }
    TContextShaderVariable.Create('Input',
    TContextShaderVariableKind.Texture, 0, 0),

  { t1 }
  TContextShaderVariable.Create('Background',
    TContextShaderVariableKind.Texture, 1, 0),

  { c0 }
  TContextShaderVariable.Create('GlassAmount',
    TContextShaderVariableKind.Vector, 0, 16),

  { c1 }
  TContextShaderVariable.Create('TintColor',
    TContextShaderVariableKind.Vector, 16, 16),

  { c2 }
  TContextShaderVariable.Create('BackgroundRect',
    TContextShaderVariableKind.Vector, 32, 16),

  { c3 }
  TContextShaderVariable.Create('OutputSize',
    TContextShaderVariableKind.Vector, 48, 16),

  { c4 }
  TContextShaderVariable.Create('CornerRadius',
    TContextShaderVariableKind.Vector, 64, 16)];

  FShaders[0] := TShaderManager.RegisterShaderFromData(
    'FMXBridge.GlassMaterial.DX11', TContextShaderKind.PixelShader, '',
      [TContextShaderSource.Create(TContextShaderArch.DX11, GlassShaderData,
        ShaderVariables)]);
end;

procedure TGlassMaterialFilter.LoadShaders;
begin
  FilterContext.SetShaders(FVertexShader, FShaders[0]);

  FilterContext.SetShaderVariable('GlassAmount',
    [TVector3D.Create(FGlassAmount, 0, 0, 0)]);

  FilterContext.SetShaderVariable('TintColor', FTintColor);
  FilterContext.SetShaderVariable('BackgroundRect', [FBackgroundRect]);
  FilterContext.SetShaderVariable('OutputSize', [FOutputSize]);
  FilterContext.SetShaderVariable('CornerRadius', [FCornerRadius]);
end;

class function TGlassMaterialFilter.FilterAttr: TFilterRec;
begin
  Result := TFilterRec.Create('FMXBridgeGlassMaterial',
    'FMXBridge glass material', [TFilterValueRec.Create('Background',
    'Original backdrop', TFilterValueType.Bitmap)]);
end;

// -----------------------------------------------------------------------------
// TFMXGlassRectangle
// -----------------------------------------------------------------------------
constructor TFMXGlassRectangle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Fill.Kind := TBrushKind.None;

  FBitmapOfHost := TBitmap.Create;
  FBitmapBlurred := TBitmap.Create;
  FBitmapGlass := TBitmap.Create;

  FGaussianBlurEffect := TGaussianBlurEffect.Create(Self);

  FGlassFilter := TGlassMaterialFilter.Create;

  FGlassAmount := 50;

  FBlurAmount := 10;

  FTintColor := TAlphaColorRec.White;

  FTintAlpha := CDefaultTintAlpha;

  FIsPainting := False;
end;

destructor TFMXGlassRectangle.Destroy;
begin
  FGlassFilter.Free;
  FGaussianBlurEffect.Free;

  FBitmapGlass.Free;
  FBitmapBlurred.Free;
  FBitmapOfHost.Free;

  inherited;
end;

function TFMXGlassRectangle.FindRootForm: TCustomForm;
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

function TFMXGlassRectangle.GetHostSize(out AWidth, AHeight: Single): Boolean;
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

function TFMXGlassRectangle.CanCapture:
  Boolean;
var
  W, H: Single;
begin
  Result :=
    not (csLoading in ComponentState) and not (csReading in ComponentState) and
    not (csDestroying in ComponentState) and (Parent <> nil) and (Width > 0) and
    (Height > 0) and GetHostSize(W, H) and (W > 0) and (H > 0);
end;

procedure TFMXGlassRectangle.SetGlassAmount(const AValue: Single);
var
  NewValue: Single;
begin
  NewValue := EnsureRange(AValue, 0, 100);

  if SameValue(FGlassAmount, NewValue) then
    Exit;

  FGlassAmount := NewValue;

  Repaint;
end;

procedure TFMXGlassRectangle.SetBlurAmount(const AValue: Single);
var
  NewValue: Single;
begin
  NewValue := EnsureRange(AValue, 0, 100);

  if SameValue(FBlurAmount, NewValue) then
    Exit;

  FBlurAmount := NewValue;

  Repaint;
end;

procedure TFMXGlassRectangle.SetTintColor(const AValue: TAlphaColor);
begin
  FTintColor := (AValue and $00FFFFFF) or (TAlphaColor(FTintAlpha) shl 24);

  Repaint;
end;

procedure TFMXGlassRectangle.ParentChanged;
begin
  inherited;

  Repaint;
end;

procedure TFMXGlassRectangle.UpdateBitmapOfHost;
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
      CanvasBehind.FillRect(RectF(0, 0, TargetWidth, TargetHeight), 0, 0, [], 1,
        Form.Fill);
    end;

    ResourceLink := TCustomFormAccess(Form).ResourceLink;

    FDisablePaint := True;

    try
      for Child in Form.Children do
      begin
        if not(Child is TControl) then
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

procedure TFMXGlassRectangle.UpdateBitmapBlurred;
var
  TargetWidth: Integer;
  TargetHeight: Integer;
  AreaOfInterest: TRect;
  AbsPos: TPointF;
  Amount: Single;
  Blur1: Single;
  Blur2: Single;
begin
  TargetWidth := Max(1, Round(Width));

  TargetHeight := Max(1, Round(Height));

  FBitmapBlurred.SetSize(TargetWidth, TargetHeight);

  AbsPos := LocalToAbsolute(PointF(0, 0));

  AreaOfInterest.Left := Max(0, Min(Trunc(AbsPos.X), FBitmapOfHost.Width - 1));
  AreaOfInterest.Top := Max(0, Min(Trunc(AbsPos.Y), FBitmapOfHost.Height - 1));
  AreaOfInterest.Width := Min(TargetWidth, FBitmapOfHost.Width -
    AreaOfInterest.Left);
  AreaOfInterest.Height := Min(TargetHeight, FBitmapOfHost.Height -
    AreaOfInterest.Top);

  if AreaOfInterest.Width <= 0 then
    AreaOfInterest.Width := 1;

  if AreaOfInterest.Height <= 0 then
    AreaOfInterest.Height := 1;

  if FBitmapBlurred.Canvas.BeginScene then
    try
      FBitmapBlurred.Canvas.Clear(TAlphaColorRec.Null);

      FBitmapBlurred.Canvas.DrawBitmap(FBitmapOfHost, AreaOfInterest,
        RectF(0, 0, AreaOfInterest.Width, AreaOfInterest.Height),
          AbsoluteOpacity, True);

    finally
      FBitmapBlurred.Canvas.EndScene;
    end;

  Amount := EnsureRange(FBlurAmount / 100, 0, 1);

  Blur1 := 0.3 + 2.4 * Amount;
  Blur2 := 0.08 + 0.85 * Amount;

  FGaussianBlurEffect.BlurAmount := Blur1;
  FGaussianBlurEffect.ProcessEffect(nil, FBitmapBlurred, 0);
  FGaussianBlurEffect.BlurAmount := Blur2;
  FGaussianBlurEffect.ProcessEffect(nil, FBitmapBlurred, 0);
end;

procedure TFMXGlassRectangle.UpdateBitmapGlass;
var
  Form: TCustomForm;
  FormWidth: Single;
  FormHeight: Single;
  AbsPos: TPointF;
begin
  if FBitmapBlurred.IsEmpty then
    Exit;

  Form := FindRootForm;

  if Form = nil then
    Exit;

  FormWidth := Max(1, Form.ClientWidth);
  FormHeight := Max(1, Form.ClientHeight);

  AbsPos := LocalToAbsolute(PointF(0, 0));

  FGlassFilter.ValuesAsBitmap['Input'] := FBitmapBlurred;
  FGlassFilter.ValuesAsBitmap['Background'] := FBitmapOfHost;
  FGlassFilter.GlassAmount := EnsureRange(FGlassAmount / 100, 0, 1);
  FGlassFilter.TintColor := FTintColor;
  FGlassFilter.BackgroundRect := TVector3D.Create(AbsPos.X / FormWidth,
    AbsPos.Y / FormHeight, Width / FormWidth, Height / FormHeight);
  FGlassFilter.OutputSize := TVector3D.Create(FBitmapBlurred.Width,
    FBitmapBlurred.Height, 0, 0);
  FGlassFilter.CornerRadius := TVector3D.Create(Max(XRadius, YRadius), 0, 0, 0);
  FGlassFilter.ApplyWithoutCopyToOutput;

  FBitmapGlass.SetSize(FBitmapBlurred.Width, FBitmapBlurred.Height);

  FGlassFilter.FilterContext.CopyToBitmap(FBitmapGlass, FBitmapGlass.Bounds);
end;

procedure TFMXGlassRectangle.DrawGlass;
begin
  Canvas.Fill.Kind := TBrushKind.Bitmap;
  Canvas.Fill.Bitmap.Bitmap := FBitmapGlass;
  Canvas.Fill.Bitmap.WrapMode := TWrapMode.TileOriginal;
  Canvas.FillRect(LocalRect, XRadius, YRadius, Corners, AbsoluteOpacity,
    Canvas.Fill, CornerType);
end;

procedure TFMXGlassRectangle.Paint;
begin
  if FIsPainting then
    Exit;

  if not CanCapture then
    Exit;

  FIsPainting := True;

  try
    UpdateBitmapOfHost;
    UpdateBitmapBlurred;
    UpdateBitmapGlass;

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
// TFGlassRectangle
// =============================================================================
procedure TFGlassRectangle.FCreate(FParent: TFmxObject; FDark: Boolean);
begin
  ControlGlassRectangle := TFMXGlassRectangle.Create(nil);
  ControlGlassRectangle.Parent := TFmxObject(FParent);
  ControlGlassRectangle.Stroke.Kind := TBrushKind.Solid;
  ControlGlassRectangle.Stroke.Thickness := 1;

  if FDark then
  begin
    ControlGlassRectangle.TintColor := TAlphaColorRec.Black;
    ControlGlassRectangle.Stroke.Color :=
      TAlphaColor((TAlphaColorRec.Black and $00FFFFFF) or
      (CDefaultTintAlpha shl 24));
  end
  else
  begin
    ControlGlassRectangle.TintColor := TAlphaColorRec.White;
    ControlGlassRectangle.Stroke.Color :=
      TAlphaColor((TAlphaColorRec.White and $00FFFFFF) or
      (CDefaultTintAlpha shl 24));
  end;
end;

procedure TFGlassRectangle.Cursor(FCursor: TCursor);
begin
  ControlGlassRectangle.Cursor := TCursor(FCursor);
end;

procedure TFGlassRectangle.Left(FLeft: Single);
begin
  ControlGlassRectangle.Position.X := FLeft;
end;

procedure TFGlassRectangle.Top(FTop: Single);
begin
  ControlGlassRectangle.Position.Y := FTop;
end;

procedure TFGlassRectangle.Height(FHeight: Single);
begin
  ControlGlassRectangle.Size.Height := FHeight;
end;

procedure TFGlassRectangle.Width(FWidth: Single);
begin
  ControlGlassRectangle.Size.Width := FWidth;
end;

procedure TFGlassRectangle.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlGlassRectangle.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFGlassRectangle.Position(X, Y: Single);
begin
  ControlGlassRectangle.Position.X := X;
  ControlGlassRectangle.Position.Y := Y;
end;

procedure TFGlassRectangle.Align(Al: TAlignLayout);
begin
  ControlGlassRectangle.Align := TAlignLayout(Al);
end;

procedure TFGlassRectangle.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGlassRectangle.Margins.Left := FLeft;
  ControlGlassRectangle.Margins.Top := FTop;
  ControlGlassRectangle.Margins.Right := FRight;
  ControlGlassRectangle.Margins.Bottom := FBottom;
end;

procedure TFGlassRectangle.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGlassRectangle.Padding.Left := FLeft;
  ControlGlassRectangle.Padding.Top := FTop;
  ControlGlassRectangle.Padding.Right := FRight;
  ControlGlassRectangle.Padding.Bottom := FBottom;
end;

procedure TFGlassRectangle.SetHint(const FText: WideString);
begin
  ControlGlassRectangle.ShowHint := True;
  ControlGlassRectangle.Hint := string(FText);
end;

procedure TFGlassRectangle.SetClipChildren(FValue: Boolean);
begin
  ControlGlassRectangle.ClipChildren := FValue;
end;

procedure TFGlassRectangle.SetClipParent(FValue: Boolean);
begin
  ControlGlassRectangle.ClipParent := FValue;
end;

procedure TFGlassRectangle.BringToFront;
begin
  ControlGlassRectangle.BringToFront;
end;

procedure TFGlassRectangle.SendToBack;
begin
  ControlGlassRectangle.SendToBack;
end;

procedure TFGlassRectangle.SetTag(FTag: Integer);
begin
  ControlGlassRectangle.Tag := FTag;
end;

procedure TFGlassRectangle.TintColor(FColor: TAlphaColor);
begin
  ControlGlassRectangle.TintColor := TAlphaColor((FColor and $00FFFFFF) or
    (CDefaultTintAlpha shl 24));
end;

procedure TFGlassRectangle.StrokeColor(FColor: TAlphaColor);
begin
  ControlGlassRectangle.Stroke.Kind := TBrushKind.Solid;
  ControlGlassRectangle.Stroke.Color :=
    TAlphaColor((FColor and $00FFFFFF) or (CDefaultTintAlpha shl 24));
end;

procedure TFGlassRectangle.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlGlassRectangle.Stroke.Kind := TBrushKind.Solid;
  ControlGlassRectangle.Stroke.Thickness := FThickness;
  ControlGlassRectangle.Stroke.Cap := TStrokeCap(CapStyle);
  ControlGlassRectangle.Stroke.Dash := TStrokeDash(Dash);
  ControlGlassRectangle.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFGlassRectangle.CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
  FCornerType: TCornerType);
begin
  ControlGlassRectangle.CornerType := TCornerType(FCornerType);
  ControlGlassRectangle.Corners := TCorners(FCorners);
  ControlGlassRectangle.XRadius := XRadi;
  ControlGlassRectangle.YRadius := YRadi;
end;

procedure TFGlassRectangle.Sides(FSides: TSides);
begin
  ControlGlassRectangle.Sides := TSides(FSides);
end;

procedure TFGlassRectangle.GlassAmount(FValue: Single);
begin
  ControlGlassRectangle.GlassAmount := FValue;
end;

procedure TFGlassRectangle.BlurAmount(FValue: Single);
begin
  ControlGlassRectangle.BlurAmount := FValue;
end;

procedure TFGlassRectangle.Opacity(FOpacity: Single);
begin
  ControlGlassRectangle.Opacity := FOpacity;
end;

procedure TFGlassRectangle.RotationAngle(FValue: Single);
begin
  ControlGlassRectangle.RotationAngle := FValue;
end;

procedure TFGlassRectangle.RotationCenter(X, Y: Single);
begin
  ControlGlassRectangle.RotationCenter.X := X;
  ControlGlassRectangle.RotationCenter.Y := Y;
end;

procedure TFGlassRectangle.Enabled(FEnabled: Boolean);
begin
  ControlGlassRectangle.Enabled := FEnabled;
end;

procedure TFGlassRectangle.Visible(FVisible: Boolean);
begin
  ControlGlassRectangle.Visible := FVisible;
end;

procedure TFGlassRectangle.HitTest(FEnabled: Boolean);
begin
  ControlGlassRectangle.HitTest := FEnabled;
end;

function TFGlassRectangle.IsVisible: Boolean;
begin
  Result := ControlGlassRectangle.Visible;
end;

function TFGlassRectangle.GetTag: Integer;
begin
  Result := ControlGlassRectangle.Tag;
end;

function TFGlassRectangle.GetLeft: Single;
begin
  Result := ControlGlassRectangle.Position.X;
end;

function TFGlassRectangle.GetTop: Single;
begin
  Result := ControlGlassRectangle.Position.Y;
end;

function TFGlassRectangle.GetHeight: Single;
begin
  Result := ControlGlassRectangle.Size.Height;
end;

function TFGlassRectangle.GetWidth: Single;
begin
  Result := ControlGlassRectangle.Size.Width;
end;

function TFGlassRectangle.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlGlassRectangle);
end;

procedure TFGlassRectangle.OnClick(Event: TNotifyEvent);
begin
  ControlGlassRectangle.OnClick := TNotifyEvent(Event);
end;

procedure TFGlassRectangle.OnMouseDown(Event: TMouseEvent);
begin
  ControlGlassRectangle.OnMouseDown := TMouseEvent(Event);
end;

procedure TFGlassRectangle.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlGlassRectangle.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFGlassRectangle.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlGlassRectangle.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFGlassRectangle.OnMouseUp(Event: TMouseEvent);
begin
  ControlGlassRectangle.OnMouseUp := TMouseEvent(Event);
end;

procedure TFGlassRectangle.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlGlassRectangle.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFGlassRectangle.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlGlassRectangle);
end;

// =============================================================================
// Exports
// =============================================================================
function InitGlassRectangleHandle: FGlassRectangle;
begin
  Result := TFGlassRectangle.Create;
end;

exports InitGlassRectangleHandle;

end.
