
unit FMXBridge.RadiantShapes;

interface

uses
  System.Classes, System.UITypes,
  FMX.Graphics, FMX.Types,
  Radiant.Shapes;

// =============================================================================
// FRadiantAlertTriangle
// =============================================================================
type
  FRadiantAlertTriangle = interface(IUnknown)
    ['{343ABC1A-C999-4DDA-A007-C43832C5CDF7}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure Radius(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantAlertTriangle = class(TInterfacedObject, FRadiantAlertTriangle)
  private
    ControlRadAlertTriangle: TRadiantAlertTriangle;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure Radius(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantArc
// =============================================================================
type
  FRadiantArc = interface(IUnknown)
    ['{4FA10670-62F1-4450-A421-C87FFCB04A29}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CentralAngle(FValue: Single); stdcall;
    procedure StartAngle(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantArc = class(TInterfacedObject, FRadiantArc)
  private
    ControlRadArc: TRadiantArc;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CentralAngle(FValue: Single); stdcall;
    procedure StartAngle(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantArrow
// =============================================================================
type
  FRadiantArrow = interface(IUnknown)
    ['{BE09EC27-4E2D-4B91-A1C9-26CC89556C45}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure TailLength(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure TailWidth(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantArrow = class(TInterfacedObject, FRadiantArrow)
  private
    ControlRadArrow: TRadiantArrow;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure TailLength(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure TailWidth(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantBanner
// =============================================================================
type
  FRadiantBanner = interface(IUnknown)
    ['{498E1D2D-1F39-418B-9754-94385A348F27}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure Angle(FValue: Single); stdcall;
    procedure EndStyle(FValue: TRadiantBannerEndStyle); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantBanner = class(TInterfacedObject, FRadiantBanner)
  private
    ControlRadBanner: TRadiantBanner;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure Angle(FValue: Single); stdcall;
    procedure EndStyle(FValue: TRadiantBannerEndStyle); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantCallout
// =============================================================================
type
  FRadiantCallout = interface(IUnknown)
    ['{8C83E99A-8563-4D79-8596-14F6284EB771}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CalloutAlignment(FValue: TRadiantCalloutAlignment); stdcall;
    procedure CalloutOffset(FValue: Single); stdcall;
    procedure CalloutSide(FValue: TSide); stdcall;
    procedure CalloutSize(FValue: Single); stdcall;
    procedure CornerRadius(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantCallout = class(TInterfacedObject, FRadiantCallout)
  private
    ControlRadCallout: TRadiantCallout;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CalloutAlignment(FValue: TRadiantCalloutAlignment); stdcall;
    procedure CalloutOffset(FValue: Single); stdcall;
    procedure CalloutSide(FValue: TSide); stdcall;
    procedure CalloutSize(FValue: Single); stdcall;
    procedure CornerRadius(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantCapsule
// =============================================================================
type
  FRadiantCapsule = interface(IUnknown)
    ['{1045F59D-FF57-4D2D-8378-D890B517E347}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CornerStyle(FCorners: TCorners); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantCapsule = class(TInterfacedObject, FRadiantCapsule)
  private
    ControlRadCapsule: TRadiantCapsule;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CornerStyle(FCorners: TCorners); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantCheck
// =============================================================================
type
  FRadiantCheck = interface(IUnknown)
    ['{7E38D8EE-DDD3-49F8-A17C-5266519D2377}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantCheck = class(TInterfacedObject, FRadiantCheck)
  private
    ControlRadCheck: TRadiantCheck;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantChevron
// =============================================================================
type
  FRadiantChevron = interface(IUnknown)
    ['{E9A7A9CD-6D83-4CAA-AC11-019329A9B676}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure Angle(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantChevron = class(TInterfacedObject, FRadiantChevron)
  private
    ControlRadChevron: TRadiantChevron;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure Angle(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantChevronArrow
// =============================================================================
type
  FRadiantChevronArrow = interface(IUnknown)
    ['{8DEA3EA8-EF43-42E1-A3C5-8CFE1281A9F0}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure Angle(FValue: Single); stdcall;
    procedure TailWidth(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantChevronArrow = class(TInterfacedObject, FRadiantChevronArrow)
  private
    ControlRadChevronArrow: TRadiantChevronArrow;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure Angle(FValue: Single); stdcall;
    procedure TailWidth(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantCircle
// =============================================================================
type
  FRadiantCircle = interface(IUnknown)
    ['{24D2AEC3-0713-46D8-9746-348123312472}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantCircle = class(TInterfacedObject, FRadiantCircle)
  private
    ControlRadCircle: TRadiantCircle;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantDiamond
// =============================================================================
type
  FRadiantDiamond = interface(IUnknown)
    ['{AE72EE72-999D-4FD9-87D6-77B7545F39C0}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantDiamond = class(TInterfacedObject, FRadiantDiamond)
  private
    ControlRadDiamond: TRadiantDiamond;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantEllipse
// =============================================================================
type
  FRadiantEllipse = interface(IUnknown)
    ['{714DD26E-0E0A-4030-844D-EBB473D525CC}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantEllipse = class(TInterfacedObject, FRadiantEllipse)
  private
    ControlRadEllipse: TRadiantEllipse;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantFrame
// =============================================================================
type
  FRadiantFrame = interface(IUnknown)
    ['{0ECDAAD5-DBEA-451D-AF8B-6B19FC5DDB30}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure FrameSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantFrame = class(TInterfacedObject, FRadiantFrame)
  private
    ControlRadFrame: TRadiantFrame;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure FrameSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantGear
// =============================================================================
type
  FRadiantGear = interface(IUnknown)
    ['{6452214A-03FB-468B-B66C-C31CE79E6BBB}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure HoleSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure CogsSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure Cogs(FValue: Integer); stdcall;
    procedure ShowHole(FValue: Boolean); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantGear = class(TInterfacedObject, FRadiantGear)
  private
    ControlRadGear: TRadiantGear;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure HoleSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure CogsSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure Cogs(FValue: Integer); stdcall;
    procedure ShowHole(FValue: Boolean); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantHexagon
// =============================================================================
type
  FRadiantHexagon = interface(IUnknown)
    ['{5A3B73F8-8990-4EFC-ACB1-15F735066FD6}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantHexagon = class(TInterfacedObject, FRadiantHexagon)
  private
    ControlRadHexagon: TRadiantHexagon;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantLine
// =============================================================================
type
  FRadiantLine = interface(IUnknown)
    ['{2E1E31A0-ED92-41A6-B888-3786599B6ECE}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ArrowLength(FValue: Single); stdcall;
    procedure ArrowWidth(FValue: TRadiantArrowWidth); stdcall;
    procedure LineSlope(FValue: TRadiantLineSlope); stdcall;
    procedure ShowArrows(FValue: TRadiantShowArrows); stdcall;
    procedure StyleName(FValue: WideString); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantLine = class(TInterfacedObject, FRadiantLine)
  private
    ControlRadLine: TRadiantLine;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ArrowLength(FValue: Single); stdcall;
    procedure ArrowWidth(FValue: TRadiantArrowWidth); stdcall;
    procedure LineSlope(FValue: TRadiantLineSlope); stdcall;
    procedure ShowArrows(FValue: TRadiantShowArrows); stdcall;
    procedure StyleName(FValue: WideString); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantMarker
// =============================================================================
type
  FRadiantMarker = interface(IUnknown)
    ['{1333D0CE-BCFF-4620-BAAB-9854540DA731}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure HoleSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure ShowHole(FValue: Boolean); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantMarker = class(TInterfacedObject, FRadiantMarker)
  private
    ControlRadMarker: TRadiantMarker;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure HoleSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure ShowHole(FValue: Boolean); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantMinus
// =============================================================================
type
  FRadiantMinus = interface(IUnknown)
    ['{36878B60-F18C-41F4-9FA6-1D1C255A6ED2}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantMinus = class(TInterfacedObject, FRadiantMinus)
  private
    ControlRadMinus: TRadiantMinus;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantNoRing
// =============================================================================
type
  FRadiantNoRing = interface(IUnknown)
    ['{61C634D3-7DD2-4CD6-B5CB-D5DB27E3F2D1}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure RingSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantNoRing = class(TInterfacedObject, FRadiantNoRing)
  private
    ControlRadNoRing: TRadiantNoRing;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure RingSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantOctagon
// =============================================================================
type
  FRadiantOctagon = interface(IUnknown)
    ['{129B581A-BF53-4177-B71B-678CF2FF647E}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantOctagon = class(TInterfacedObject, FRadiantOctagon)
  private
    ControlRadOctagon: TRadiantOctagon;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantParallelogram
// =============================================================================
type
  FRadiantParallelogram = interface(IUnknown)
    ['{CC933357-34CD-4B35-ACC4-27D4ED860A1E}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure SlantAngle(FValue: Single); stdcall;
    procedure SlantDirection(FValue: TRadiantDirection); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantParallelogram = class(TInterfacedObject, FRadiantParallelogram)
  private
    ControlRadParallelogram: TRadiantParallelogram;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure SlantAngle(FValue: Single); stdcall;
    procedure SlantDirection(FValue: TRadiantDirection); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantPentagon
// =============================================================================
type
  FRadiantPentagon = interface(IUnknown)
    ['{83748DDC-F2BB-49C7-8448-7A38745DAE9A}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantPentagon = class(TInterfacedObject, FRadiantPentagon)
  private
    ControlRadPentagon: TRadiantPentagon;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantPlus
// =============================================================================
type
  FRadiantPlus = interface(IUnknown)
    ['{4C5FC500-18D0-49CA-BB81-4369370D6D7C}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantPlus = class(TInterfacedObject, FRadiantPlus)
  private
    ControlRadPlus: TRadiantPlus;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantPointer
// =============================================================================
type
  FRadiantPointer = interface(IUnknown)
    ['{9869CEA2-AABE-4557-97BC-E2A989B737B2}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure PointerInset(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantPointer = class(TInterfacedObject, FRadiantPointer)
  private
    ControlRadPointer: TRadiantPointer;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure PointerInset(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantRectangle
// =============================================================================
type
  FRadiantRectangle = interface(IUnknown)
    ['{C8A842FA-71CC-4D8C-AF75-0A3A916530FF}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure Sides(FSides: TSides); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantRectangle = class(TInterfacedObject, FRadiantRectangle)
  private
    ControlRadRectangle: TRadiantRectangle;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure Sides(FSides: TSides); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantRing
// =============================================================================
type
  FRadiantRing = interface(IUnknown)
    ['{4039A429-3379-421A-94D8-5459D2A66D37}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Stretch(FValue: Boolean); stdcall;
    procedure RingSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantRing = class(TInterfacedObject, FRadiantRing)
  private
    ControlRadRing: TRadiantRing;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Stretch(FValue: Boolean); stdcall;
    procedure RingSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantSector
// =============================================================================
type
  FRadiantSector = interface(IUnknown)
    ['{FAA4AB49-CB16-46DA-B80C-C7165506D0CA}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CentralAngle(FValue: Single); stdcall;
    procedure StartAngle(FValue: Single); stdcall;
    procedure Stretch(FValue: Boolean); stdcall;
    procedure UseRingSize(FValue: Boolean); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantSector = class(TInterfacedObject, FRadiantSector)
  private
    ControlRadSector: TRadiantSector;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CentralAngle(FValue: Single); stdcall;
    procedure StartAngle(FValue: Single); stdcall;
    procedure Stretch(FValue: Boolean); stdcall;
    procedure UseRingSize(FValue: Boolean); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantSectorRing
// =============================================================================
type
  FRadiantSectorRing = interface(IUnknown)
    ['{DA4505C0-D64D-48E6-8770-E880F9E1EB8E}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CentralAngle(FValue: Single); stdcall;
    procedure StartAngle(FValue: Single); stdcall;
    procedure RingSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantSectorRing = class(TInterfacedObject, FRadiantSectorRing)
  private
    ControlRadSectorRing: TRadiantSectorRing;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure CentralAngle(FValue: Single); stdcall;
    procedure StartAngle(FValue: Single); stdcall;
    procedure RingSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantShield
// =============================================================================
type
  FRadiantShield = interface(IUnknown)
    ['{7B5EF359-4780-4E9D-8C3A-307559B44C9D}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ShieldStyle(FValue: TRadiantShieldStyle); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantShield = class(TInterfacedObject, FRadiantShield)
  private
    ControlRadShield: TRadiantShield;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ShieldStyle(FValue: TRadiantShieldStyle); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantSquare
// =============================================================================
type
  FRadiantSquare = interface(IUnknown)
    ['{9C018E4D-55E5-4F69-AE74-136BAE77F39C}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantSquare = class(TInterfacedObject, FRadiantSquare)
  private
    ControlRadSquare: TRadiantSquare;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantStar
// =============================================================================
type
  FRadiantStar = interface(IUnknown)
    ['{F0E9E6DD-CC98-4957-A1DA-B71F48C4303C}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure InnerRadiusScaleFactor(FValue: Single); stdcall;
    procedure Points(FValue: Integer); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantStar = class(TInterfacedObject, FRadiantStar)
  private
    ControlRadStar: TRadiantStar;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure InnerRadiusScaleFactor(FValue: Single); stdcall;
    procedure Points(FValue: Integer); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantTag
// =============================================================================
type
  FRadiantTag = interface(IUnknown)
    ['{AE67627C-EE1B-4594-B97B-AC3B10F844CB}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure HoleSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure ShowHole(FValue: Boolean); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantTag = class(TInterfacedObject, FRadiantTag)
  private
    ControlRadTag: TRadiantTag;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure HoleSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure ShowHole(FValue: Boolean); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantTrapezoid
// =============================================================================
type
  FRadiantTrapezoid = interface(IUnknown)
    ['{4A7A766C-22DF-4F75-A64A-E8611311B4C4}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure AcuteAngle(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantTrapezoid = class(TInterfacedObject, FRadiantTrapezoid)
  private
    ControlRadTrapezoid: TRadiantTrapezoid;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure AcuteAngle(FValue: Single); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantTriangle
// =============================================================================
type
  FRadiantTriangle = interface(IUnknown)
    ['{BE43B512-CCCB-4EB2-B192-4C8A412F4BA4}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure RightAngleCorner(FValue: TCorner); stdcall;
    procedure TriangleType(FValue: TRadiantTriangleType); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantTriangle = class(TInterfacedObject, FRadiantTriangle)
  private
    ControlRadTriangle: TRadiantTriangle;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Direction(FValue: TRadiantDirection); stdcall;
    procedure RightAngleCorner(FValue: TCorner); stdcall;
    procedure TriangleType(FValue: TRadiantTriangleType); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
// FRadiantX
// =============================================================================
type
  FRadiantX = interface(IUnknown)
    ['{FEE7E5F6-AD69-408C-AD58-1493B30ED872}']
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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

  TFRadiantX = class(TInterfacedObject, FRadiantX)
  private
    ControlRadX: TRadiantX;
  public
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
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure StrokeGradientLinearAngle(FAngle: Single); stdcall;
    procedure StrokeGradientRadialAngle(FAngle: Single); stdcall;
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits); stdcall;
    procedure ScaleStrokeThickness(FValue: Boolean); stdcall;
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
function InitRadiantAlertTriangleHandle: FRadiantAlertTriangle; stdcall;
function InitRadiantArcHandle: FRadiantArc; stdcall;
function InitRadiantArrowHandle: FRadiantArrow; stdcall;
function InitRadiantBannerHandle: FRadiantBanner; stdcall;
function InitRadiantCalloutHandle: FRadiantCallout; stdcall;
function InitRadiantCapsuleHandle: FRadiantCapsule; stdcall;
function InitRadiantCheckHandle: FRadiantCheck; stdcall;
function InitRadiantChevronHandle: FRadiantChevron; stdcall;
function InitRadiantChevronArrowHandle: FRadiantChevronArrow; stdcall;
function InitRadiantCircleHandle: FRadiantCircle; stdcall;
function InitRadiantDiamondHandle: FRadiantDiamond; stdcall;
function InitRadiantEllipseHandle: FRadiantEllipse; stdcall;
function InitRadiantFrameHandle: FRadiantFrame; stdcall;
function InitRadiantGearHandle: FRadiantGear; stdcall;
function InitRadiantHexagonHandle: FRadiantHexagon; stdcall;
function InitRadiantLineHandle: FRadiantLine; stdcall;
function InitRadiantMarkerHandle: FRadiantMarker; stdcall;
function InitRadiantMinusHandle: FRadiantMinus; stdcall;
function InitRadiantNoRingHandle: FRadiantNoRing; stdcall;
function InitRadiantOctagonHandle: FRadiantOctagon; stdcall;
function InitRadiantParallelogramHandle: FRadiantParallelogram; stdcall;
function InitRadiantPentagonHandle: FRadiantPentagon; stdcall;
function InitRadiantPlusHandle: FRadiantPlus; stdcall;
function InitRadiantPointerHandle: FRadiantPointer; stdcall;
function InitRadiantRectangleHandle: FRadiantRectangle; stdcall;
function InitRadiantRingHandle: FRadiantRing; stdcall;
function InitRadiantSectorHandle: FRadiantSector; stdcall;
function InitRadiantSectorRingHandle: FRadiantSectorRing; stdcall;
function InitRadiantShieldHandle: FRadiantShield; stdcall;
function InitRadiantSquareHandle: FRadiantSquare; stdcall;
function InitRadiantStarHandle: FRadiantStar; stdcall;
function InitRadiantTagHandle: FRadiantTag; stdcall;
function InitRadiantTrapezoidHandle: FRadiantTrapezoid; stdcall;
function InitRadiantTriangleHandle: FRadiantTriangle; stdcall;
function InitRadiantXHandle: FRadiantX; stdcall;

implementation

uses
  FMXBridge.BrushHelpers;

// >>>>>> TFRadiantAlertTriangle <<<<<< \\
procedure TFRadiantAlertTriangle.FCreate(FParent: TFmxObject);
begin
  ControlRadAlertTriangle := TRadiantAlertTriangle.Create(nil);
  ControlRadAlertTriangle.Parent := FParent;
end;

procedure TFRadiantAlertTriangle.Cursor(FCursor: TCursor);
begin
  ControlRadAlertTriangle.Cursor := FCursor;
end;

procedure TFRadiantAlertTriangle.Left(FLeft: Single);
begin
  ControlRadAlertTriangle.Position.X := FLeft;
end;

procedure TFRadiantAlertTriangle.Top(FTop: Single);
begin
  ControlRadAlertTriangle.Position.Y := FTop;
end;

procedure TFRadiantAlertTriangle.Height(FHeight: Single);
begin
  ControlRadAlertTriangle.Height := FHeight;
end;

procedure TFRadiantAlertTriangle.Width(FWidth: Single);
begin
  ControlRadAlertTriangle.Width := FWidth;
end;

procedure TFRadiantAlertTriangle.SetBounds(FLeft, FTop, FWidth,
  FHeight: Single);
begin
  ControlRadAlertTriangle.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantAlertTriangle.Position(X, Y: Single);
begin
  ControlRadAlertTriangle.Position.X := X;
  ControlRadAlertTriangle.Position.Y := Y;
end;

procedure TFRadiantAlertTriangle.Align(Al: TAlignLayout);
begin
  ControlRadAlertTriangle.Align := Al;
end;

procedure TFRadiantAlertTriangle.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadAlertTriangle.Margins.Left := FLeft;
  ControlRadAlertTriangle.Margins.Top := FTop;
  ControlRadAlertTriangle.Margins.Right := FRight;
  ControlRadAlertTriangle.Margins.Bottom := FBottom;
end;

procedure TFRadiantAlertTriangle.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadAlertTriangle.Padding.Left := FLeft;
  ControlRadAlertTriangle.Padding.Top := FTop;
  ControlRadAlertTriangle.Padding.Right := FRight;
  ControlRadAlertTriangle.Padding.Bottom := FBottom;
end;

procedure TFRadiantAlertTriangle.SetHint(const FText: WideString);
begin
  ControlRadAlertTriangle.ShowHint := True;
  ControlRadAlertTriangle.Hint := FText;
end;

procedure TFRadiantAlertTriangle.SetClipChildren(FValue: Boolean);
begin
  ControlRadAlertTriangle.ClipChildren := FValue;
end;

procedure TFRadiantAlertTriangle.SetClipParent(FValue: Boolean);
begin
  ControlRadAlertTriangle.ClipParent := FValue;
end;

procedure TFRadiantAlertTriangle.BringToFront;
begin
  ControlRadAlertTriangle.BringToFront;
end;

procedure TFRadiantAlertTriangle.SendToBack;
begin
  ControlRadAlertTriangle.SendToBack;
end;

procedure TFRadiantAlertTriangle.SetTag(FTag: Integer);
begin
  ControlRadAlertTriangle.Tag := FTag;
end;

procedure TFRadiantAlertTriangle.FillColor(FColor: TAlphaColor);
begin
  ControlRadAlertTriangle.Fill.Kind := TBrushKind.Solid;
  ControlRadAlertTriangle.Fill.Color := FColor;
end;

procedure TFRadiantAlertTriangle.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadAlertTriangle.Fill.Kind := TBrushKind.Bitmap;
  ControlRadAlertTriangle.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadAlertTriangle.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantAlertTriangle.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadAlertTriangle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadAlertTriangle.Fill, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantAlertTriangle.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadAlertTriangle.Fill.Kind := TBrushKind.Gradient;
  ControlRadAlertTriangle.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadAlertTriangle.Fill, FAngle);
end;

procedure TFRadiantAlertTriangle.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadAlertTriangle.Fill.Kind := TBrushKind.Gradient;
  ControlRadAlertTriangle.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadAlertTriangle.Fill, FAngle);
end;

procedure TFRadiantAlertTriangle.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadAlertTriangle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadAlertTriangle.Fill, X1,
    Y1, X2, Y2);
end;

procedure TFRadiantAlertTriangle.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadAlertTriangle.Stroke.Kind := TBrushKind.Solid;
  ControlRadAlertTriangle.Stroke.Color := FColor;
end;

procedure TFRadiantAlertTriangle.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadAlertTriangle.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadAlertTriangle.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadAlertTriangle.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantAlertTriangle.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadAlertTriangle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadAlertTriangle.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantAlertTriangle.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadAlertTriangle.Stroke.Kind := TBrushKind.Gradient;
  ControlRadAlertTriangle.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadAlertTriangle.Stroke, FAngle);
end;

procedure TFRadiantAlertTriangle.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadAlertTriangle.Stroke.Kind := TBrushKind.Gradient;
  ControlRadAlertTriangle.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadAlertTriangle.Stroke, FAngle);
end;

procedure TFRadiantAlertTriangle.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadAlertTriangle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadAlertTriangle.Stroke, X1,
    Y1, X2, Y2);
end;

procedure TFRadiantAlertTriangle.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadAlertTriangle.Stroke.Kind := TBrushKind.Solid;
  ControlRadAlertTriangle.Stroke.Thickness := FThickness;
  ControlRadAlertTriangle.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadAlertTriangle.Stroke.Dash := TStrokeDash(Dash);
  ControlRadAlertTriangle.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantAlertTriangle.Direction(FValue: TRadiantDirection);
begin
  ControlRadAlertTriangle.Direction := FValue;
end;

procedure TFRadiantAlertTriangle.Radius(FValue: Single);
begin
  ControlRadAlertTriangle.Radius := FValue;
end;

procedure TFRadiantAlertTriangle.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadAlertTriangle.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantAlertTriangle.Opacity(FOpacity: Single);
begin
  ControlRadAlertTriangle.Opacity := FOpacity;
end;

procedure TFRadiantAlertTriangle.RotationAngle(FValue: Single);
begin
  ControlRadAlertTriangle.RotationAngle := FValue;
end;

procedure TFRadiantAlertTriangle.RotationCenter(X, Y: Single);
begin
  ControlRadAlertTriangle.RotationCenter.X := X;
  ControlRadAlertTriangle.RotationCenter.Y := Y;
end;

procedure TFRadiantAlertTriangle.Enabled(FEnabled: Boolean);
begin
  ControlRadAlertTriangle.Enabled := FEnabled;
end;

procedure TFRadiantAlertTriangle.Visible(FVisible: Boolean);
begin
  ControlRadAlertTriangle.Visible := FVisible;
end;

procedure TFRadiantAlertTriangle.HitTest(FEnabled: Boolean);
begin
  ControlRadAlertTriangle.HitTest := FEnabled;
end;

function TFRadiantAlertTriangle.IsVisible: Boolean;
begin
  Result := ControlRadAlertTriangle.Visible;
end;

function TFRadiantAlertTriangle.GetTag: Integer;
begin
  Result := ControlRadAlertTriangle.Tag;
end;

function TFRadiantAlertTriangle.GetLeft: Single;
begin
  Result := ControlRadAlertTriangle.Position.X;
end;

function TFRadiantAlertTriangle.GetTop: Single;
begin
  Result := ControlRadAlertTriangle.Position.Y;
end;

function TFRadiantAlertTriangle.GetHeight: Single;
begin
  Result := ControlRadAlertTriangle.Height;
end;

function TFRadiantAlertTriangle.GetWidth: Single;
begin
  Result := ControlRadAlertTriangle.Width;
end;

function TFRadiantAlertTriangle.GetObject: TFmxObject;
begin
  Result := ControlRadAlertTriangle;
end;

procedure TFRadiantAlertTriangle.OnClick(Event: TNotifyEvent);
begin
  ControlRadAlertTriangle.OnClick := Event;
end;

procedure TFRadiantAlertTriangle.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadAlertTriangle.OnMouseDown := Event;
end;

procedure TFRadiantAlertTriangle.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadAlertTriangle.OnMouseEnter := Event;
end;

procedure TFRadiantAlertTriangle.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadAlertTriangle.OnMouseLeave := Event;
end;

procedure TFRadiantAlertTriangle.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadAlertTriangle.OnMouseUp := Event;
end;

function TFRadiantAlertTriangle.Handle: TFmxObject;
begin
  Result := ControlRadAlertTriangle;
end;

// >>>>>> TFRadiantArc <<<<<< \\
procedure TFRadiantArc.FCreate(FParent: TFmxObject);
begin
  ControlRadArc := TRadiantArc.Create(nil);
  ControlRadArc.Parent := FParent;
end;

procedure TFRadiantArc.Cursor(FCursor: TCursor);
begin
  ControlRadArc.Cursor := FCursor;
end;

procedure TFRadiantArc.Left(FLeft: Single);
begin
  ControlRadArc.Position.X := FLeft;
end;

procedure TFRadiantArc.Top(FTop: Single);
begin
  ControlRadArc.Position.Y := FTop;
end;

procedure TFRadiantArc.Height(FHeight: Single);
begin
  ControlRadArc.Height := FHeight;
end;

procedure TFRadiantArc.Width(FWidth: Single);
begin
  ControlRadArc.Width := FWidth;
end;

procedure TFRadiantArc.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadArc.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantArc.Position(X, Y: Single);
begin
  ControlRadArc.Position.X := X;
  ControlRadArc.Position.Y := Y;
end;

procedure TFRadiantArc.Align(Al: TAlignLayout);
begin
  ControlRadArc.Align := Al;
end;

procedure TFRadiantArc.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadArc.Margins.Left := FLeft;
  ControlRadArc.Margins.Top := FTop;
  ControlRadArc.Margins.Right := FRight;
  ControlRadArc.Margins.Bottom := FBottom;
end;

procedure TFRadiantArc.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadArc.Padding.Left := FLeft;
  ControlRadArc.Padding.Top := FTop;
  ControlRadArc.Padding.Right := FRight;
  ControlRadArc.Padding.Bottom := FBottom;
end;

procedure TFRadiantArc.SetHint(const FText: WideString);
begin
  ControlRadArc.ShowHint := True;
  ControlRadArc.Hint := FText;
end;

procedure TFRadiantArc.SetClipChildren(FValue: Boolean);
begin
  ControlRadArc.ClipChildren := FValue;
end;

procedure TFRadiantArc.SetClipParent(FValue: Boolean);
begin
  ControlRadArc.ClipParent := FValue;
end;

procedure TFRadiantArc.BringToFront;
begin
  ControlRadArc.BringToFront;
end;

procedure TFRadiantArc.SendToBack;
begin
  ControlRadArc.SendToBack;
end;

procedure TFRadiantArc.SetTag(FTag: Integer);
begin
  ControlRadArc.Tag := FTag;
end;

procedure TFRadiantArc.FillColor(FColor: TAlphaColor);
begin
  ControlRadArc.Fill.Kind := TBrushKind.Solid;
  ControlRadArc.Fill.Color := FColor;
end;

procedure TFRadiantArc.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadArc.Fill.Kind := TBrushKind.Bitmap;
  ControlRadArc.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadArc.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantArc.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadArc.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadArc.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantArc.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadArc.Fill.Kind := TBrushKind.Gradient;
  ControlRadArc.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadArc.Fill, FAngle);
end;

procedure TFRadiantArc.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadArc.Fill.Kind := TBrushKind.Gradient;
  ControlRadArc.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadArc.Fill, FAngle);
end;

procedure TFRadiantArc.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadArc.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadArc.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantArc.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadArc.Stroke.Kind := TBrushKind.Solid;
  ControlRadArc.Stroke.Color := FColor;
end;

procedure TFRadiantArc.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadArc.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadArc.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadArc.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantArc.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadArc.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadArc.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantArc.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadArc.Stroke.Kind := TBrushKind.Gradient;
  ControlRadArc.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadArc.Stroke, FAngle);
end;

procedure TFRadiantArc.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadArc.Stroke.Kind := TBrushKind.Gradient;
  ControlRadArc.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadArc.Stroke, FAngle);
end;

procedure TFRadiantArc.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadArc.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadArc.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantArc.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadArc.Stroke.Kind := TBrushKind.Solid;
  ControlRadArc.Stroke.Thickness := FThickness;
  ControlRadArc.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadArc.Stroke.Dash := TStrokeDash(Dash);
  ControlRadArc.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantArc.CentralAngle(FValue: Single);
begin
  ControlRadArc.CentralAngle := FValue;
end;

procedure TFRadiantArc.StartAngle(FValue: Single);
begin
  ControlRadArc.StartAngle := FValue;
end;

procedure TFRadiantArc.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadArc.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantArc.Opacity(FOpacity: Single);
begin
  ControlRadArc.Opacity := FOpacity;
end;

procedure TFRadiantArc.RotationAngle(FValue: Single);
begin
  ControlRadArc.RotationAngle := FValue;
end;

procedure TFRadiantArc.RotationCenter(X, Y: Single);
begin
  ControlRadArc.RotationCenter.X := X;
  ControlRadArc.RotationCenter.Y := Y;
end;

procedure TFRadiantArc.Enabled(FEnabled: Boolean);
begin
  ControlRadArc.Enabled := FEnabled;
end;

procedure TFRadiantArc.Visible(FVisible: Boolean);
begin
  ControlRadArc.Visible := FVisible;
end;

procedure TFRadiantArc.HitTest(FEnabled: Boolean);
begin
  ControlRadArc.HitTest := FEnabled;
end;

function TFRadiantArc.IsVisible: Boolean;
begin
  Result := ControlRadArc.Visible;
end;

function TFRadiantArc.GetTag: Integer;
begin
  Result := ControlRadArc.Tag;
end;

function TFRadiantArc.GetLeft: Single;
begin
  Result := ControlRadArc.Position.X;
end;

function TFRadiantArc.GetTop: Single;
begin
  Result := ControlRadArc.Position.Y;
end;

function TFRadiantArc.GetHeight: Single;
begin
  Result := ControlRadArc.Height;
end;

function TFRadiantArc.GetWidth: Single;
begin
  Result := ControlRadArc.Width;
end;

function TFRadiantArc.GetObject: TFmxObject;
begin
  Result := ControlRadArc;
end;

procedure TFRadiantArc.OnClick(Event: TNotifyEvent);
begin
  ControlRadArc.OnClick := Event;
end;

procedure TFRadiantArc.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadArc.OnMouseDown := Event;
end;

procedure TFRadiantArc.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadArc.OnMouseEnter := Event;
end;

procedure TFRadiantArc.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadArc.OnMouseLeave := Event;
end;

procedure TFRadiantArc.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadArc.OnMouseUp := Event;
end;

function TFRadiantArc.Handle: TFmxObject;
begin
  Result := ControlRadArc;
end;

// >>>>>> TFRadiantArrow <<<<<< \\
procedure TFRadiantArrow.FCreate(FParent: TFmxObject);
begin
  ControlRadArrow := TRadiantArrow.Create(nil);
  ControlRadArrow.Parent := FParent;
end;

procedure TFRadiantArrow.Cursor(FCursor: TCursor);
begin
  ControlRadArrow.Cursor := FCursor;
end;

procedure TFRadiantArrow.Left(FLeft: Single);
begin
  ControlRadArrow.Position.X := FLeft;
end;

procedure TFRadiantArrow.Top(FTop: Single);
begin
  ControlRadArrow.Position.Y := FTop;
end;

procedure TFRadiantArrow.Height(FHeight: Single);
begin
  ControlRadArrow.Height := FHeight;
end;

procedure TFRadiantArrow.Width(FWidth: Single);
begin
  ControlRadArrow.Width := FWidth;
end;

procedure TFRadiantArrow.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadArrow.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantArrow.Position(X, Y: Single);
begin
  ControlRadArrow.Position.X := X;
  ControlRadArrow.Position.Y := Y;
end;

procedure TFRadiantArrow.Align(Al: TAlignLayout);
begin
  ControlRadArrow.Align := Al;
end;

procedure TFRadiantArrow.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadArrow.Margins.Left := FLeft;
  ControlRadArrow.Margins.Top := FTop;
  ControlRadArrow.Margins.Right := FRight;
  ControlRadArrow.Margins.Bottom := FBottom;
end;

procedure TFRadiantArrow.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadArrow.Padding.Left := FLeft;
  ControlRadArrow.Padding.Top := FTop;
  ControlRadArrow.Padding.Right := FRight;
  ControlRadArrow.Padding.Bottom := FBottom;
end;

procedure TFRadiantArrow.SetHint(const FText: WideString);
begin
  ControlRadArrow.ShowHint := True;
  ControlRadArrow.Hint := FText;
end;

procedure TFRadiantArrow.SetClipChildren(FValue: Boolean);
begin
  ControlRadArrow.ClipChildren := FValue;
end;

procedure TFRadiantArrow.SetClipParent(FValue: Boolean);
begin
  ControlRadArrow.ClipParent := FValue;
end;

procedure TFRadiantArrow.BringToFront;
begin
  ControlRadArrow.BringToFront;
end;

procedure TFRadiantArrow.SendToBack;
begin
  ControlRadArrow.SendToBack;
end;

procedure TFRadiantArrow.SetTag(FTag: Integer);
begin
  ControlRadArrow.Tag := FTag;
end;

procedure TFRadiantArrow.FillColor(FColor: TAlphaColor);
begin
  ControlRadArrow.Fill.Kind := TBrushKind.Solid;
  ControlRadArrow.Fill.Color := FColor;
end;

procedure TFRadiantArrow.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadArrow.Fill.Kind := TBrushKind.Bitmap;
  ControlRadArrow.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadArrow.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantArrow.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadArrow.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadArrow.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantArrow.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadArrow.Fill.Kind := TBrushKind.Gradient;
  ControlRadArrow.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadArrow.Fill, FAngle);
end;

procedure TFRadiantArrow.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadArrow.Fill.Kind := TBrushKind.Gradient;
  ControlRadArrow.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadArrow.Fill, FAngle);
end;

procedure TFRadiantArrow.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadArrow.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadArrow.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantArrow.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadArrow.Stroke.Kind := TBrushKind.Solid;
  ControlRadArrow.Stroke.Color := FColor;
end;

procedure TFRadiantArrow.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadArrow.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadArrow.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadArrow.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantArrow.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadArrow.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadArrow.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantArrow.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadArrow.Stroke.Kind := TBrushKind.Gradient;
  ControlRadArrow.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadArrow.Stroke, FAngle);
end;

procedure TFRadiantArrow.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadArrow.Stroke.Kind := TBrushKind.Gradient;
  ControlRadArrow.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadArrow.Stroke, FAngle);
end;

procedure TFRadiantArrow.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadArrow.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadArrow.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantArrow.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadArrow.Stroke.Kind := TBrushKind.Solid;
  ControlRadArrow.Stroke.Thickness := FThickness;
  ControlRadArrow.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadArrow.Stroke.Dash := TStrokeDash(Dash);
  ControlRadArrow.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantArrow.Direction(FValue: TRadiantDirection);
begin
  ControlRadArrow.Direction := FValue;
end;

procedure TFRadiantArrow.TailLength(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadArrow.TailLength.Pixels := FPixels;
  ControlRadArrow.TailLength.ScaleFactor := FScaleFactor;
  ControlRadArrow.TailLength.Units := Units;
end;

procedure TFRadiantArrow.TailWidth(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadArrow.TailWidth.Pixels := FPixels;
  ControlRadArrow.TailWidth.ScaleFactor := FScaleFactor;
  ControlRadArrow.TailWidth.Units := Units;
end;

procedure TFRadiantArrow.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadArrow.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantArrow.Opacity(FOpacity: Single);
begin
  ControlRadArrow.Opacity := FOpacity;
end;

procedure TFRadiantArrow.RotationAngle(FValue: Single);
begin
  ControlRadArrow.RotationAngle := FValue;
end;

procedure TFRadiantArrow.RotationCenter(X, Y: Single);
begin
  ControlRadArrow.RotationCenter.X := X;
  ControlRadArrow.RotationCenter.Y := Y;
end;

procedure TFRadiantArrow.Enabled(FEnabled: Boolean);
begin
  ControlRadArrow.Enabled := FEnabled;
end;

procedure TFRadiantArrow.Visible(FVisible: Boolean);
begin
  ControlRadArrow.Visible := FVisible;
end;

procedure TFRadiantArrow.HitTest(FEnabled: Boolean);
begin
  ControlRadArrow.HitTest := FEnabled;
end;

function TFRadiantArrow.IsVisible: Boolean;
begin
  Result := ControlRadArrow.Visible;
end;

function TFRadiantArrow.GetTag: Integer;
begin
  Result := ControlRadArrow.Tag;
end;

function TFRadiantArrow.GetLeft: Single;
begin
  Result := ControlRadArrow.Position.X;
end;

function TFRadiantArrow.GetTop: Single;
begin
  Result := ControlRadArrow.Position.Y;
end;

function TFRadiantArrow.GetHeight: Single;
begin
  Result := ControlRadArrow.Height;
end;

function TFRadiantArrow.GetWidth: Single;
begin
  Result := ControlRadArrow.Width;
end;

function TFRadiantArrow.GetObject: TFmxObject;
begin
  Result := ControlRadArrow;
end;

procedure TFRadiantArrow.OnClick(Event: TNotifyEvent);
begin
  ControlRadArrow.OnClick := Event;
end;

procedure TFRadiantArrow.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadArrow.OnMouseDown := Event;
end;

procedure TFRadiantArrow.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadArrow.OnMouseEnter := Event;
end;

procedure TFRadiantArrow.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadArrow.OnMouseLeave := Event;
end;

procedure TFRadiantArrow.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadArrow.OnMouseUp := Event;
end;

function TFRadiantArrow.Handle: TFmxObject;
begin
  Result := ControlRadArrow;
end;

// >>>>>> TFRadiantBanner <<<<<< \\
procedure TFRadiantBanner.FCreate(FParent: TFmxObject);
begin
  ControlRadBanner := TRadiantBanner.Create(nil);
  ControlRadBanner.Parent := FParent;
end;

procedure TFRadiantBanner.Cursor(FCursor: TCursor);
begin
  ControlRadBanner.Cursor := FCursor;
end;

procedure TFRadiantBanner.Left(FLeft: Single);
begin
  ControlRadBanner.Position.X := FLeft;
end;

procedure TFRadiantBanner.Top(FTop: Single);
begin
  ControlRadBanner.Position.Y := FTop;
end;

procedure TFRadiantBanner.Height(FHeight: Single);
begin
  ControlRadBanner.Height := FHeight;
end;

procedure TFRadiantBanner.Width(FWidth: Single);
begin
  ControlRadBanner.Width := FWidth;
end;

procedure TFRadiantBanner.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadBanner.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantBanner.Position(X, Y: Single);
begin
  ControlRadBanner.Position.X := X;
  ControlRadBanner.Position.Y := Y;
end;

procedure TFRadiantBanner.Align(Al: TAlignLayout);
begin
  ControlRadBanner.Align := Al;
end;

procedure TFRadiantBanner.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadBanner.Margins.Left := FLeft;
  ControlRadBanner.Margins.Top := FTop;
  ControlRadBanner.Margins.Right := FRight;
  ControlRadBanner.Margins.Bottom := FBottom;
end;

procedure TFRadiantBanner.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadBanner.Padding.Left := FLeft;
  ControlRadBanner.Padding.Top := FTop;
  ControlRadBanner.Padding.Right := FRight;
  ControlRadBanner.Padding.Bottom := FBottom;
end;

procedure TFRadiantBanner.SetHint(const FText: WideString);
begin
  ControlRadBanner.ShowHint := True;
  ControlRadBanner.Hint := FText;
end;

procedure TFRadiantBanner.SetClipChildren(FValue: Boolean);
begin
  ControlRadBanner.ClipChildren := FValue;
end;

procedure TFRadiantBanner.SetClipParent(FValue: Boolean);
begin
  ControlRadBanner.ClipParent := FValue;
end;

procedure TFRadiantBanner.BringToFront;
begin
  ControlRadBanner.BringToFront;
end;

procedure TFRadiantBanner.SendToBack;
begin
  ControlRadBanner.SendToBack;
end;

procedure TFRadiantBanner.SetTag(FTag: Integer);
begin
  ControlRadBanner.Tag := FTag;
end;

procedure TFRadiantBanner.FillColor(FColor: TAlphaColor);
begin
  ControlRadBanner.Fill.Kind := TBrushKind.Solid;
  ControlRadBanner.Fill.Color := FColor;
end;

procedure TFRadiantBanner.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadBanner.Fill.Kind := TBrushKind.Bitmap;
  ControlRadBanner.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadBanner.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantBanner.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadBanner.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadBanner.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantBanner.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadBanner.Fill.Kind := TBrushKind.Gradient;
  ControlRadBanner.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadBanner.Fill, FAngle);
end;

procedure TFRadiantBanner.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadBanner.Fill.Kind := TBrushKind.Gradient;
  ControlRadBanner.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadBanner.Fill, FAngle);
end;

procedure TFRadiantBanner.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadBanner.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadBanner.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantBanner.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadBanner.Stroke.Kind := TBrushKind.Solid;
  ControlRadBanner.Stroke.Color := FColor;
end;

procedure TFRadiantBanner.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadBanner.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadBanner.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadBanner.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantBanner.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadBanner.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadBanner.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantBanner.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadBanner.Stroke.Kind := TBrushKind.Gradient;
  ControlRadBanner.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadBanner.Stroke, FAngle);
end;

procedure TFRadiantBanner.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadBanner.Stroke.Kind := TBrushKind.Gradient;
  ControlRadBanner.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadBanner.Stroke, FAngle);
end;

procedure TFRadiantBanner.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadBanner.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadBanner.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantBanner.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadBanner.Stroke.Kind := TBrushKind.Solid;
  ControlRadBanner.Stroke.Thickness := FThickness;
  ControlRadBanner.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadBanner.Stroke.Dash := TStrokeDash(Dash);
  ControlRadBanner.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantBanner.Direction(FValue: TRadiantDirection);
begin
  ControlRadBanner.Direction := FValue;
end;

procedure TFRadiantBanner.Angle(FValue: Single);
begin
  ControlRadBanner.Angle := FValue;
end;

procedure TFRadiantBanner.EndStyle(FValue: TRadiantBannerEndStyle);
begin
  ControlRadBanner.EndStyle := FValue;
end;

procedure TFRadiantBanner.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadBanner.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantBanner.Opacity(FOpacity: Single);
begin
  ControlRadBanner.Opacity := FOpacity;
end;

procedure TFRadiantBanner.RotationAngle(FValue: Single);
begin
  ControlRadBanner.RotationAngle := FValue;
end;

procedure TFRadiantBanner.RotationCenter(X, Y: Single);
begin
  ControlRadBanner.RotationCenter.X := X;
  ControlRadBanner.RotationCenter.Y := Y;
end;

procedure TFRadiantBanner.Enabled(FEnabled: Boolean);
begin
  ControlRadBanner.Enabled := FEnabled;
end;

procedure TFRadiantBanner.Visible(FVisible: Boolean);
begin
  ControlRadBanner.Visible := FVisible;
end;

procedure TFRadiantBanner.HitTest(FEnabled: Boolean);
begin
  ControlRadBanner.HitTest := FEnabled;
end;

function TFRadiantBanner.IsVisible: Boolean;
begin
  Result := ControlRadBanner.Visible;
end;

function TFRadiantBanner.GetTag: Integer;
begin
  Result := ControlRadBanner.Tag;
end;

function TFRadiantBanner.GetLeft: Single;
begin
  Result := ControlRadBanner.Position.X;
end;

function TFRadiantBanner.GetTop: Single;
begin
  Result := ControlRadBanner.Position.Y;
end;

function TFRadiantBanner.GetHeight: Single;
begin
  Result := ControlRadBanner.Height;
end;

function TFRadiantBanner.GetWidth: Single;
begin
  Result := ControlRadBanner.Width;
end;

function TFRadiantBanner.GetObject: TFmxObject;
begin
  Result := ControlRadBanner;
end;

procedure TFRadiantBanner.OnClick(Event: TNotifyEvent);
begin
  ControlRadBanner.OnClick := Event;
end;

procedure TFRadiantBanner.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadBanner.OnMouseDown := Event;
end;

procedure TFRadiantBanner.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadBanner.OnMouseEnter := Event;
end;

procedure TFRadiantBanner.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadBanner.OnMouseLeave := Event;
end;

procedure TFRadiantBanner.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadBanner.OnMouseUp := Event;
end;

function TFRadiantBanner.Handle: TFmxObject;
begin
  Result := ControlRadBanner;
end;

// >>>>>> TFRadiantCallout <<<<<< \\
procedure TFRadiantCallout.FCreate(FParent: TFmxObject);
begin
  ControlRadCallout := TRadiantCallout.Create(nil);
  ControlRadCallout.Parent := FParent;
end;

procedure TFRadiantCallout.Cursor(FCursor: TCursor);
begin
  ControlRadCallout.Cursor := FCursor;
end;

procedure TFRadiantCallout.Left(FLeft: Single);
begin
  ControlRadCallout.Position.X := FLeft;
end;

procedure TFRadiantCallout.Top(FTop: Single);
begin
  ControlRadCallout.Position.Y := FTop;
end;

procedure TFRadiantCallout.Height(FHeight: Single);
begin
  ControlRadCallout.Height := FHeight;
end;

procedure TFRadiantCallout.Width(FWidth: Single);
begin
  ControlRadCallout.Width := FWidth;
end;

procedure TFRadiantCallout.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadCallout.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantCallout.Position(X, Y: Single);
begin
  ControlRadCallout.Position.X := X;
  ControlRadCallout.Position.Y := Y;
end;

procedure TFRadiantCallout.Align(Al: TAlignLayout);
begin
  ControlRadCallout.Align := Al;
end;

procedure TFRadiantCallout.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadCallout.Margins.Left := FLeft;
  ControlRadCallout.Margins.Top := FTop;
  ControlRadCallout.Margins.Right := FRight;
  ControlRadCallout.Margins.Bottom := FBottom;
end;

procedure TFRadiantCallout.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadCallout.Padding.Left := FLeft;
  ControlRadCallout.Padding.Top := FTop;
  ControlRadCallout.Padding.Right := FRight;
  ControlRadCallout.Padding.Bottom := FBottom;
end;

procedure TFRadiantCallout.SetHint(const FText: WideString);
begin
  ControlRadCallout.ShowHint := True;
  ControlRadCallout.Hint := FText;
end;

procedure TFRadiantCallout.SetClipChildren(FValue: Boolean);
begin
  ControlRadCallout.ClipChildren := FValue;
end;

procedure TFRadiantCallout.SetClipParent(FValue: Boolean);
begin
  ControlRadCallout.ClipParent := FValue;
end;

procedure TFRadiantCallout.BringToFront;
begin
  ControlRadCallout.BringToFront;
end;

procedure TFRadiantCallout.SendToBack;
begin
  ControlRadCallout.SendToBack;
end;

procedure TFRadiantCallout.SetTag(FTag: Integer);
begin
  ControlRadCallout.Tag := FTag;
end;

procedure TFRadiantCallout.FillColor(FColor: TAlphaColor);
begin
  ControlRadCallout.Fill.Kind := TBrushKind.Solid;
  ControlRadCallout.Fill.Color := FColor;
end;

procedure TFRadiantCallout.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadCallout.Fill.Kind := TBrushKind.Bitmap;
  ControlRadCallout.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadCallout.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantCallout.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadCallout.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadCallout.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantCallout.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadCallout.Fill.Kind := TBrushKind.Gradient;
  ControlRadCallout.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadCallout.Fill, FAngle);
end;

procedure TFRadiantCallout.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadCallout.Fill.Kind := TBrushKind.Gradient;
  ControlRadCallout.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadCallout.Fill, FAngle);
end;

procedure TFRadiantCallout.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadCallout.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadCallout.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantCallout.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadCallout.Stroke.Kind := TBrushKind.Solid;
  ControlRadCallout.Stroke.Color := FColor;
end;

procedure TFRadiantCallout.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadCallout.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadCallout.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadCallout.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantCallout.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadCallout.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadCallout.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantCallout.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadCallout.Stroke.Kind := TBrushKind.Gradient;
  ControlRadCallout.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadCallout.Stroke, FAngle);
end;

procedure TFRadiantCallout.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadCallout.Stroke.Kind := TBrushKind.Gradient;
  ControlRadCallout.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadCallout.Stroke, FAngle);
end;

procedure TFRadiantCallout.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadCallout.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadCallout.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantCallout.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadCallout.Stroke.Kind := TBrushKind.Solid;
  ControlRadCallout.Stroke.Thickness := FThickness;
  ControlRadCallout.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadCallout.Stroke.Dash := TStrokeDash(Dash);
  ControlRadCallout.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantCallout.CalloutAlignment(FValue: TRadiantCalloutAlignment);
begin
  ControlRadCallout.CalloutAlignment := FValue;
end;

procedure TFRadiantCallout.CalloutOffset(FValue: Single);
begin
  ControlRadCallout.CalloutOffset := FValue;
end;

procedure TFRadiantCallout.CalloutSide(FValue: TSide);
begin
  ControlRadCallout.CalloutSide := FValue;
end;

procedure TFRadiantCallout.CalloutSize(FValue: Single);
begin
  ControlRadCallout.CalloutSize := FValue;
end;

procedure TFRadiantCallout.CornerRadius(FValue: Single);
begin
  ControlRadCallout.CornerRadius := FValue;
end;

procedure TFRadiantCallout.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadCallout.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantCallout.Opacity(FOpacity: Single);
begin
  ControlRadCallout.Opacity := FOpacity;
end;

procedure TFRadiantCallout.RotationAngle(FValue: Single);
begin
  ControlRadCallout.RotationAngle := FValue;
end;

procedure TFRadiantCallout.RotationCenter(X, Y: Single);
begin
  ControlRadCallout.RotationCenter.X := X;
  ControlRadCallout.RotationCenter.Y := Y;
end;

procedure TFRadiantCallout.Enabled(FEnabled: Boolean);
begin
  ControlRadCallout.Enabled := FEnabled;
end;

procedure TFRadiantCallout.Visible(FVisible: Boolean);
begin
  ControlRadCallout.Visible := FVisible;
end;

procedure TFRadiantCallout.HitTest(FEnabled: Boolean);
begin
  ControlRadCallout.HitTest := FEnabled;
end;

function TFRadiantCallout.IsVisible: Boolean;
begin
  Result := ControlRadCallout.Visible;
end;

function TFRadiantCallout.GetTag: Integer;
begin
  Result := ControlRadCallout.Tag;
end;

function TFRadiantCallout.GetLeft: Single;
begin
  Result := ControlRadCallout.Position.X;
end;

function TFRadiantCallout.GetTop: Single;
begin
  Result := ControlRadCallout.Position.Y;
end;

function TFRadiantCallout.GetHeight: Single;
begin
  Result := ControlRadCallout.Height;
end;

function TFRadiantCallout.GetWidth: Single;
begin
  Result := ControlRadCallout.Width;
end;

function TFRadiantCallout.GetObject: TFmxObject;
begin
  Result := ControlRadCallout;
end;

procedure TFRadiantCallout.OnClick(Event: TNotifyEvent);
begin
  ControlRadCallout.OnClick := Event;
end;

procedure TFRadiantCallout.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadCallout.OnMouseDown := Event;
end;

procedure TFRadiantCallout.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadCallout.OnMouseEnter := Event;
end;

procedure TFRadiantCallout.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadCallout.OnMouseLeave := Event;
end;

procedure TFRadiantCallout.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadCallout.OnMouseUp := Event;
end;

function TFRadiantCallout.Handle: TFmxObject;
begin
  Result := ControlRadCallout;
end;

// >>>>>> TFRadiantCapsule <<<<<< \\
procedure TFRadiantCapsule.FCreate(FParent: TFmxObject);
begin
  ControlRadCapsule := TRadiantCapsule.Create(nil);
  ControlRadCapsule.Parent := FParent;
end;

procedure TFRadiantCapsule.Cursor(FCursor: TCursor);
begin
  ControlRadCapsule.Cursor := FCursor;
end;

procedure TFRadiantCapsule.Left(FLeft: Single);
begin
  ControlRadCapsule.Position.X := FLeft;
end;

procedure TFRadiantCapsule.Top(FTop: Single);
begin
  ControlRadCapsule.Position.Y := FTop;
end;

procedure TFRadiantCapsule.Height(FHeight: Single);
begin
  ControlRadCapsule.Height := FHeight;
end;

procedure TFRadiantCapsule.Width(FWidth: Single);
begin
  ControlRadCapsule.Width := FWidth;
end;

procedure TFRadiantCapsule.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadCapsule.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantCapsule.Position(X, Y: Single);
begin
  ControlRadCapsule.Position.X := X;
  ControlRadCapsule.Position.Y := Y;
end;

procedure TFRadiantCapsule.Align(Al: TAlignLayout);
begin
  ControlRadCapsule.Align := Al;
end;

procedure TFRadiantCapsule.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadCapsule.Margins.Left := FLeft;
  ControlRadCapsule.Margins.Top := FTop;
  ControlRadCapsule.Margins.Right := FRight;
  ControlRadCapsule.Margins.Bottom := FBottom;
end;

procedure TFRadiantCapsule.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadCapsule.Padding.Left := FLeft;
  ControlRadCapsule.Padding.Top := FTop;
  ControlRadCapsule.Padding.Right := FRight;
  ControlRadCapsule.Padding.Bottom := FBottom;
end;

procedure TFRadiantCapsule.SetHint(const FText: WideString);
begin
  ControlRadCapsule.ShowHint := True;
  ControlRadCapsule.Hint := FText;
end;

procedure TFRadiantCapsule.SetClipChildren(FValue: Boolean);
begin
  ControlRadCapsule.ClipChildren := FValue;
end;

procedure TFRadiantCapsule.SetClipParent(FValue: Boolean);
begin
  ControlRadCapsule.ClipParent := FValue;
end;

procedure TFRadiantCapsule.BringToFront;
begin
  ControlRadCapsule.BringToFront;
end;

procedure TFRadiantCapsule.SendToBack;
begin
  ControlRadCapsule.SendToBack;
end;

procedure TFRadiantCapsule.SetTag(FTag: Integer);
begin
  ControlRadCapsule.Tag := FTag;
end;

procedure TFRadiantCapsule.FillColor(FColor: TAlphaColor);
begin
  ControlRadCapsule.Fill.Kind := TBrushKind.Solid;
  ControlRadCapsule.Fill.Color := FColor;
end;

procedure TFRadiantCapsule.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadCapsule.Fill.Kind := TBrushKind.Bitmap;
  ControlRadCapsule.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadCapsule.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantCapsule.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadCapsule.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadCapsule.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantCapsule.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadCapsule.Fill.Kind := TBrushKind.Gradient;
  ControlRadCapsule.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadCapsule.Fill, FAngle);
end;

procedure TFRadiantCapsule.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadCapsule.Fill.Kind := TBrushKind.Gradient;
  ControlRadCapsule.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadCapsule.Fill, FAngle);
end;

procedure TFRadiantCapsule.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadCapsule.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadCapsule.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantCapsule.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadCapsule.Stroke.Kind := TBrushKind.Solid;
  ControlRadCapsule.Stroke.Color := FColor;
end;

procedure TFRadiantCapsule.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadCapsule.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadCapsule.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadCapsule.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantCapsule.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadCapsule.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadCapsule.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantCapsule.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadCapsule.Stroke.Kind := TBrushKind.Gradient;
  ControlRadCapsule.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadCapsule.Stroke, FAngle);
end;

procedure TFRadiantCapsule.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadCapsule.Stroke.Kind := TBrushKind.Gradient;
  ControlRadCapsule.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadCapsule.Stroke, FAngle);
end;

procedure TFRadiantCapsule.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadCapsule.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadCapsule.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantCapsule.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadCapsule.Stroke.Kind := TBrushKind.Solid;
  ControlRadCapsule.Stroke.Thickness := FThickness;
  ControlRadCapsule.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadCapsule.Stroke.Dash := TStrokeDash(Dash);
  ControlRadCapsule.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantCapsule.CornerStyle(FCorners: TCorners);
begin
  ControlRadCapsule.Corners := FCorners;
end;

procedure TFRadiantCapsule.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadCapsule.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantCapsule.Opacity(FOpacity: Single);
begin
  ControlRadCapsule.Opacity := FOpacity;
end;

procedure TFRadiantCapsule.RotationAngle(FValue: Single);
begin
  ControlRadCapsule.RotationAngle := FValue;
end;

procedure TFRadiantCapsule.RotationCenter(X, Y: Single);
begin
  ControlRadCapsule.RotationCenter.X := X;
  ControlRadCapsule.RotationCenter.Y := Y;
end;

procedure TFRadiantCapsule.Enabled(FEnabled: Boolean);
begin
  ControlRadCapsule.Enabled := FEnabled;
end;

procedure TFRadiantCapsule.Visible(FVisible: Boolean);
begin
  ControlRadCapsule.Visible := FVisible;
end;

procedure TFRadiantCapsule.HitTest(FEnabled: Boolean);
begin
  ControlRadCapsule.HitTest := FEnabled;
end;

function TFRadiantCapsule.IsVisible: Boolean;
begin
  Result := ControlRadCapsule.Visible;
end;

function TFRadiantCapsule.GetTag: Integer;
begin
  Result := ControlRadCapsule.Tag;
end;

function TFRadiantCapsule.GetLeft: Single;
begin
  Result := ControlRadCapsule.Position.X;
end;

function TFRadiantCapsule.GetTop: Single;
begin
  Result := ControlRadCapsule.Position.Y;
end;

function TFRadiantCapsule.GetHeight: Single;
begin
  Result := ControlRadCapsule.Height;
end;

function TFRadiantCapsule.GetWidth: Single;
begin
  Result := ControlRadCapsule.Width;
end;

function TFRadiantCapsule.GetObject: TFmxObject;
begin
  Result := ControlRadCapsule;
end;

procedure TFRadiantCapsule.OnClick(Event: TNotifyEvent);
begin
  ControlRadCapsule.OnClick := Event;
end;

procedure TFRadiantCapsule.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadCapsule.OnMouseDown := Event;
end;

procedure TFRadiantCapsule.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadCapsule.OnMouseEnter := Event;
end;

procedure TFRadiantCapsule.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadCapsule.OnMouseLeave := Event;
end;

procedure TFRadiantCapsule.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadCapsule.OnMouseUp := Event;
end;

function TFRadiantCapsule.Handle: TFmxObject;
begin
  Result := ControlRadCapsule;
end;

// >>>>>> TFRadiantCheck <<<<<< \\
procedure TFRadiantCheck.FCreate(FParent: TFmxObject);
begin
  ControlRadCheck := TRadiantCheck.Create(nil);
  ControlRadCheck.Parent := FParent;
end;

procedure TFRadiantCheck.Cursor(FCursor: TCursor);
begin
  ControlRadCheck.Cursor := FCursor;
end;

procedure TFRadiantCheck.Left(FLeft: Single);
begin
  ControlRadCheck.Position.X := FLeft;
end;

procedure TFRadiantCheck.Top(FTop: Single);
begin
  ControlRadCheck.Position.Y := FTop;
end;

procedure TFRadiantCheck.Height(FHeight: Single);
begin
  ControlRadCheck.Height := FHeight;
end;

procedure TFRadiantCheck.Width(FWidth: Single);
begin
  ControlRadCheck.Width := FWidth;
end;

procedure TFRadiantCheck.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadCheck.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantCheck.Position(X, Y: Single);
begin
  ControlRadCheck.Position.X := X;
  ControlRadCheck.Position.Y := Y;
end;

procedure TFRadiantCheck.Align(Al: TAlignLayout);
begin
  ControlRadCheck.Align := Al;
end;

procedure TFRadiantCheck.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadCheck.Margins.Left := FLeft;
  ControlRadCheck.Margins.Top := FTop;
  ControlRadCheck.Margins.Right := FRight;
  ControlRadCheck.Margins.Bottom := FBottom;
end;

procedure TFRadiantCheck.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadCheck.Padding.Left := FLeft;
  ControlRadCheck.Padding.Top := FTop;
  ControlRadCheck.Padding.Right := FRight;
  ControlRadCheck.Padding.Bottom := FBottom;
end;

procedure TFRadiantCheck.SetHint(const FText: WideString);
begin
  ControlRadCheck.ShowHint := True;
  ControlRadCheck.Hint := FText;
end;

procedure TFRadiantCheck.SetClipChildren(FValue: Boolean);
begin
  ControlRadCheck.ClipChildren := FValue;
end;

procedure TFRadiantCheck.SetClipParent(FValue: Boolean);
begin
  ControlRadCheck.ClipParent := FValue;
end;

procedure TFRadiantCheck.BringToFront;
begin
  ControlRadCheck.BringToFront;
end;

procedure TFRadiantCheck.SendToBack;
begin
  ControlRadCheck.SendToBack;
end;

procedure TFRadiantCheck.SetTag(FTag: Integer);
begin
  ControlRadCheck.Tag := FTag;
end;

procedure TFRadiantCheck.FillColor(FColor: TAlphaColor);
begin
  ControlRadCheck.Fill.Kind := TBrushKind.Solid;
  ControlRadCheck.Fill.Color := FColor;
end;

procedure TFRadiantCheck.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadCheck.Fill.Kind := TBrushKind.Bitmap;
  ControlRadCheck.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadCheck.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantCheck.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadCheck.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadCheck.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantCheck.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadCheck.Fill.Kind := TBrushKind.Gradient;
  ControlRadCheck.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadCheck.Fill, FAngle);
end;

procedure TFRadiantCheck.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadCheck.Fill.Kind := TBrushKind.Gradient;
  ControlRadCheck.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadCheck.Fill, FAngle);
end;

procedure TFRadiantCheck.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadCheck.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadCheck.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantCheck.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadCheck.Stroke.Kind := TBrushKind.Solid;
  ControlRadCheck.Stroke.Color := FColor;
end;

procedure TFRadiantCheck.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadCheck.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadCheck.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadCheck.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantCheck.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadCheck.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadCheck.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantCheck.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadCheck.Stroke.Kind := TBrushKind.Gradient;
  ControlRadCheck.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadCheck.Stroke, FAngle);
end;

procedure TFRadiantCheck.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadCheck.Stroke.Kind := TBrushKind.Gradient;
  ControlRadCheck.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadCheck.Stroke, FAngle);
end;

procedure TFRadiantCheck.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadCheck.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadCheck.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantCheck.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadCheck.Stroke.Kind := TBrushKind.Solid;
  ControlRadCheck.Stroke.Thickness := FThickness;
  ControlRadCheck.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadCheck.Stroke.Dash := TStrokeDash(Dash);
  ControlRadCheck.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantCheck.BarSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadCheck.BarSize.Pixels := FPixels;
  ControlRadCheck.BarSize.ScaleFactor := FScaleFactor;
  ControlRadCheck.BarSize.Units := Units;
end;

procedure TFRadiantCheck.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadCheck.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantCheck.Opacity(FOpacity: Single);
begin
  ControlRadCheck.Opacity := FOpacity;
end;

procedure TFRadiantCheck.RotationAngle(FValue: Single);
begin
  ControlRadCheck.RotationAngle := FValue;
end;

procedure TFRadiantCheck.RotationCenter(X, Y: Single);
begin
  ControlRadCheck.RotationCenter.X := X;
  ControlRadCheck.RotationCenter.Y := Y;
end;

procedure TFRadiantCheck.Enabled(FEnabled: Boolean);
begin
  ControlRadCheck.Enabled := FEnabled;
end;

procedure TFRadiantCheck.Visible(FVisible: Boolean);
begin
  ControlRadCheck.Visible := FVisible;
end;

procedure TFRadiantCheck.HitTest(FEnabled: Boolean);
begin
  ControlRadCheck.HitTest := FEnabled;
end;

function TFRadiantCheck.IsVisible: Boolean;
begin
  Result := ControlRadCheck.Visible;
end;

function TFRadiantCheck.GetTag: Integer;
begin
  Result := ControlRadCheck.Tag;
end;

function TFRadiantCheck.GetLeft: Single;
begin
  Result := ControlRadCheck.Position.X;
end;

function TFRadiantCheck.GetTop: Single;
begin
  Result := ControlRadCheck.Position.Y;
end;

function TFRadiantCheck.GetHeight: Single;
begin
  Result := ControlRadCheck.Height;
end;

function TFRadiantCheck.GetWidth: Single;
begin
  Result := ControlRadCheck.Width;
end;

function TFRadiantCheck.GetObject: TFmxObject;
begin
  Result := ControlRadCheck;
end;

procedure TFRadiantCheck.OnClick(Event: TNotifyEvent);
begin
  ControlRadCheck.OnClick := Event;
end;

procedure TFRadiantCheck.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadCheck.OnMouseDown := Event;
end;

procedure TFRadiantCheck.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadCheck.OnMouseEnter := Event;
end;

procedure TFRadiantCheck.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadCheck.OnMouseLeave := Event;
end;

procedure TFRadiantCheck.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadCheck.OnMouseUp := Event;
end;

function TFRadiantCheck.Handle: TFmxObject;
begin
  Result := ControlRadCheck;
end;

// >>>>>> TFRadiantChevron <<<<<< \\
procedure TFRadiantChevron.FCreate(FParent: TFmxObject);
begin
  ControlRadChevron := TRadiantChevron.Create(nil);
  ControlRadChevron.Parent := FParent;
end;

procedure TFRadiantChevron.Cursor(FCursor: TCursor);
begin
  ControlRadChevron.Cursor := FCursor;
end;

procedure TFRadiantChevron.Left(FLeft: Single);
begin
  ControlRadChevron.Position.X := FLeft;
end;

procedure TFRadiantChevron.Top(FTop: Single);
begin
  ControlRadChevron.Position.Y := FTop;
end;

procedure TFRadiantChevron.Height(FHeight: Single);
begin
  ControlRadChevron.Height := FHeight;
end;

procedure TFRadiantChevron.Width(FWidth: Single);
begin
  ControlRadChevron.Width := FWidth;
end;

procedure TFRadiantChevron.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadChevron.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantChevron.Position(X, Y: Single);
begin
  ControlRadChevron.Position.X := X;
  ControlRadChevron.Position.Y := Y;
end;

procedure TFRadiantChevron.Align(Al: TAlignLayout);
begin
  ControlRadChevron.Align := Al;
end;

procedure TFRadiantChevron.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadChevron.Margins.Left := FLeft;
  ControlRadChevron.Margins.Top := FTop;
  ControlRadChevron.Margins.Right := FRight;
  ControlRadChevron.Margins.Bottom := FBottom;
end;

procedure TFRadiantChevron.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadChevron.Padding.Left := FLeft;
  ControlRadChevron.Padding.Top := FTop;
  ControlRadChevron.Padding.Right := FRight;
  ControlRadChevron.Padding.Bottom := FBottom;
end;

procedure TFRadiantChevron.SetHint(const FText: WideString);
begin
  ControlRadChevron.ShowHint := True;
  ControlRadChevron.Hint := FText;
end;

procedure TFRadiantChevron.SetClipChildren(FValue: Boolean);
begin
  ControlRadChevron.ClipChildren := FValue;
end;

procedure TFRadiantChevron.SetClipParent(FValue: Boolean);
begin
  ControlRadChevron.ClipParent := FValue;
end;

procedure TFRadiantChevron.BringToFront;
begin
  ControlRadChevron.BringToFront;
end;

procedure TFRadiantChevron.SendToBack;
begin
  ControlRadChevron.SendToBack;
end;

procedure TFRadiantChevron.SetTag(FTag: Integer);
begin
  ControlRadChevron.Tag := FTag;
end;

procedure TFRadiantChevron.FillColor(FColor: TAlphaColor);
begin
  ControlRadChevron.Fill.Kind := TBrushKind.Solid;
  ControlRadChevron.Fill.Color := FColor;
end;

procedure TFRadiantChevron.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadChevron.Fill.Kind := TBrushKind.Bitmap;
  ControlRadChevron.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadChevron.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantChevron.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadChevron.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadChevron.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantChevron.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadChevron.Fill.Kind := TBrushKind.Gradient;
  ControlRadChevron.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadChevron.Fill, FAngle);
end;

procedure TFRadiantChevron.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadChevron.Fill.Kind := TBrushKind.Gradient;
  ControlRadChevron.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadChevron.Fill, FAngle);
end;

procedure TFRadiantChevron.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadChevron.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadChevron.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantChevron.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadChevron.Stroke.Kind := TBrushKind.Solid;
  ControlRadChevron.Stroke.Color := FColor;
end;

procedure TFRadiantChevron.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadChevron.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadChevron.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadChevron.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantChevron.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadChevron.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadChevron.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantChevron.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadChevron.Stroke.Kind := TBrushKind.Gradient;
  ControlRadChevron.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadChevron.Stroke, FAngle);
end;

procedure TFRadiantChevron.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadChevron.Stroke.Kind := TBrushKind.Gradient;
  ControlRadChevron.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadChevron.Stroke, FAngle);
end;

procedure TFRadiantChevron.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadChevron.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadChevron.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantChevron.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadChevron.Stroke.Kind := TBrushKind.Solid;
  ControlRadChevron.Stroke.Thickness := FThickness;
  ControlRadChevron.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadChevron.Stroke.Dash := TStrokeDash(Dash);
  ControlRadChevron.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantChevron.Direction(FValue: TRadiantDirection);
begin
  ControlRadChevron.Direction := FValue;
end;

procedure TFRadiantChevron.Angle(FValue: Single);
begin
  ControlRadChevron.Angle := FValue;
end;

procedure TFRadiantChevron.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadChevron.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantChevron.Opacity(FOpacity: Single);
begin
  ControlRadChevron.Opacity := FOpacity;
end;

procedure TFRadiantChevron.RotationAngle(FValue: Single);
begin
  ControlRadChevron.RotationAngle := FValue;
end;

procedure TFRadiantChevron.RotationCenter(X, Y: Single);
begin
  ControlRadChevron.RotationCenter.X := X;
  ControlRadChevron.RotationCenter.Y := Y;
end;

procedure TFRadiantChevron.Enabled(FEnabled: Boolean);
begin
  ControlRadChevron.Enabled := FEnabled;
end;

procedure TFRadiantChevron.Visible(FVisible: Boolean);
begin
  ControlRadChevron.Visible := FVisible;
end;

procedure TFRadiantChevron.HitTest(FEnabled: Boolean);
begin
  ControlRadChevron.HitTest := FEnabled;
end;

function TFRadiantChevron.IsVisible: Boolean;
begin
  Result := ControlRadChevron.Visible;
end;

function TFRadiantChevron.GetTag: Integer;
begin
  Result := ControlRadChevron.Tag;
end;

function TFRadiantChevron.GetLeft: Single;
begin
  Result := ControlRadChevron.Position.X;
end;

function TFRadiantChevron.GetTop: Single;
begin
  Result := ControlRadChevron.Position.Y;
end;

function TFRadiantChevron.GetHeight: Single;
begin
  Result := ControlRadChevron.Height;
end;

function TFRadiantChevron.GetWidth: Single;
begin
  Result := ControlRadChevron.Width;
end;

function TFRadiantChevron.GetObject: TFmxObject;
begin
  Result := ControlRadChevron;
end;

procedure TFRadiantChevron.OnClick(Event: TNotifyEvent);
begin
  ControlRadChevron.OnClick := Event;
end;

procedure TFRadiantChevron.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadChevron.OnMouseDown := Event;
end;

procedure TFRadiantChevron.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadChevron.OnMouseEnter := Event;
end;

procedure TFRadiantChevron.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadChevron.OnMouseLeave := Event;
end;

procedure TFRadiantChevron.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadChevron.OnMouseUp := Event;
end;

function TFRadiantChevron.Handle: TFmxObject;
begin
  Result := ControlRadChevron;
end;

// >>>>>> TFRadiantChevronArrow <<<<<< \\
procedure TFRadiantChevronArrow.FCreate(FParent: TFmxObject);
begin
  ControlRadChevronArrow := TRadiantChevronArrow.Create(nil);
  ControlRadChevronArrow.Parent := FParent;
end;

procedure TFRadiantChevronArrow.Cursor(FCursor: TCursor);
begin
  ControlRadChevronArrow.Cursor := FCursor;
end;

procedure TFRadiantChevronArrow.Left(FLeft: Single);
begin
  ControlRadChevronArrow.Position.X := FLeft;
end;

procedure TFRadiantChevronArrow.Top(FTop: Single);
begin
  ControlRadChevronArrow.Position.Y := FTop;
end;

procedure TFRadiantChevronArrow.Height(FHeight: Single);
begin
  ControlRadChevronArrow.Height := FHeight;
end;

procedure TFRadiantChevronArrow.Width(FWidth: Single);
begin
  ControlRadChevronArrow.Width := FWidth;
end;

procedure TFRadiantChevronArrow.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadChevronArrow.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantChevronArrow.Position(X, Y: Single);
begin
  ControlRadChevronArrow.Position.X := X;
  ControlRadChevronArrow.Position.Y := Y;
end;

procedure TFRadiantChevronArrow.Align(Al: TAlignLayout);
begin
  ControlRadChevronArrow.Align := Al;
end;

procedure TFRadiantChevronArrow.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadChevronArrow.Margins.Left := FLeft;
  ControlRadChevronArrow.Margins.Top := FTop;
  ControlRadChevronArrow.Margins.Right := FRight;
  ControlRadChevronArrow.Margins.Bottom := FBottom;
end;

procedure TFRadiantChevronArrow.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadChevronArrow.Padding.Left := FLeft;
  ControlRadChevronArrow.Padding.Top := FTop;
  ControlRadChevronArrow.Padding.Right := FRight;
  ControlRadChevronArrow.Padding.Bottom := FBottom;
end;

procedure TFRadiantChevronArrow.SetHint(const FText: WideString);
begin
  ControlRadChevronArrow.ShowHint := True;
  ControlRadChevronArrow.Hint := FText;
end;

procedure TFRadiantChevronArrow.SetClipChildren(FValue: Boolean);
begin
  ControlRadChevronArrow.ClipChildren := FValue;
end;

procedure TFRadiantChevronArrow.SetClipParent(FValue: Boolean);
begin
  ControlRadChevronArrow.ClipParent := FValue;
end;

procedure TFRadiantChevronArrow.BringToFront;
begin
  ControlRadChevronArrow.BringToFront;
end;

procedure TFRadiantChevronArrow.SendToBack;
begin
  ControlRadChevronArrow.SendToBack;
end;

procedure TFRadiantChevronArrow.SetTag(FTag: Integer);
begin
  ControlRadChevronArrow.Tag := FTag;
end;

procedure TFRadiantChevronArrow.FillColor(FColor: TAlphaColor);
begin
  ControlRadChevronArrow.Fill.Kind := TBrushKind.Solid;
  ControlRadChevronArrow.Fill.Color := FColor;
end;

procedure TFRadiantChevronArrow.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadChevronArrow.Fill.Kind := TBrushKind.Bitmap;
  ControlRadChevronArrow.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadChevronArrow.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantChevronArrow.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadChevronArrow.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadChevronArrow.Fill, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantChevronArrow.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadChevronArrow.Fill.Kind := TBrushKind.Gradient;
  ControlRadChevronArrow.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadChevronArrow.Fill, FAngle);
end;

procedure TFRadiantChevronArrow.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadChevronArrow.Fill.Kind := TBrushKind.Gradient;
  ControlRadChevronArrow.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadChevronArrow.Fill, FAngle);
end;

procedure TFRadiantChevronArrow.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadChevronArrow.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadChevronArrow.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantChevronArrow.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadChevronArrow.Stroke.Kind := TBrushKind.Solid;
  ControlRadChevronArrow.Stroke.Color := FColor;
end;

procedure TFRadiantChevronArrow.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadChevronArrow.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadChevronArrow.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadChevronArrow.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantChevronArrow.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadChevronArrow.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadChevronArrow.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantChevronArrow.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadChevronArrow.Stroke.Kind := TBrushKind.Gradient;
  ControlRadChevronArrow.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadChevronArrow.Stroke, FAngle);
end;

procedure TFRadiantChevronArrow.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadChevronArrow.Stroke.Kind := TBrushKind.Gradient;
  ControlRadChevronArrow.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadChevronArrow.Stroke, FAngle);
end;

procedure TFRadiantChevronArrow.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadChevronArrow.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadChevronArrow.Stroke, X1,
    Y1, X2, Y2);
end;

procedure TFRadiantChevronArrow.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadChevronArrow.Stroke.Kind := TBrushKind.Solid;
  ControlRadChevronArrow.Stroke.Thickness := FThickness;
  ControlRadChevronArrow.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadChevronArrow.Stroke.Dash := TStrokeDash(Dash);
  ControlRadChevronArrow.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantChevronArrow.Direction(FValue: TRadiantDirection);
begin
  ControlRadChevronArrow.Direction := FValue;
end;

procedure TFRadiantChevronArrow.Angle(FValue: Single);
begin
  ControlRadChevronArrow.Angle := FValue;
end;

procedure TFRadiantChevronArrow.TailWidth(FValue: Single);
begin
  ControlRadChevronArrow.TailWidth := FValue;
end;

procedure TFRadiantChevronArrow.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadChevronArrow.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantChevronArrow.Opacity(FOpacity: Single);
begin
  ControlRadChevronArrow.Opacity := FOpacity;
end;

procedure TFRadiantChevronArrow.RotationAngle(FValue: Single);
begin
  ControlRadChevronArrow.RotationAngle := FValue;
end;

procedure TFRadiantChevronArrow.RotationCenter(X, Y: Single);
begin
  ControlRadChevronArrow.RotationCenter.X := X;
  ControlRadChevronArrow.RotationCenter.Y := Y;
end;

procedure TFRadiantChevronArrow.Enabled(FEnabled: Boolean);
begin
  ControlRadChevronArrow.Enabled := FEnabled;
end;

procedure TFRadiantChevronArrow.Visible(FVisible: Boolean);
begin
  ControlRadChevronArrow.Visible := FVisible;
end;

procedure TFRadiantChevronArrow.HitTest(FEnabled: Boolean);
begin
  ControlRadChevronArrow.HitTest := FEnabled;
end;

function TFRadiantChevronArrow.IsVisible: Boolean;
begin
  Result := ControlRadChevronArrow.Visible;
end;

function TFRadiantChevronArrow.GetTag: Integer;
begin
  Result := ControlRadChevronArrow.Tag;
end;

function TFRadiantChevronArrow.GetLeft: Single;
begin
  Result := ControlRadChevronArrow.Position.X;
end;

function TFRadiantChevronArrow.GetTop: Single;
begin
  Result := ControlRadChevronArrow.Position.Y;
end;

function TFRadiantChevronArrow.GetHeight: Single;
begin
  Result := ControlRadChevronArrow.Height;
end;

function TFRadiantChevronArrow.GetWidth: Single;
begin
  Result := ControlRadChevronArrow.Width;
end;

function TFRadiantChevronArrow.GetObject: TFmxObject;
begin
  Result := ControlRadChevronArrow;
end;

procedure TFRadiantChevronArrow.OnClick(Event: TNotifyEvent);
begin
  ControlRadChevronArrow.OnClick := Event;
end;

procedure TFRadiantChevronArrow.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadChevronArrow.OnMouseDown := Event;
end;

procedure TFRadiantChevronArrow.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadChevronArrow.OnMouseEnter := Event;
end;

procedure TFRadiantChevronArrow.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadChevronArrow.OnMouseLeave := Event;
end;

procedure TFRadiantChevronArrow.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadChevronArrow.OnMouseUp := Event;
end;

function TFRadiantChevronArrow.Handle: TFmxObject;
begin
  Result := ControlRadChevronArrow;
end;

// >>>>>> TFRadiantCircle <<<<<< \\
procedure TFRadiantCircle.FCreate(FParent: TFmxObject);
begin
  ControlRadCircle := TRadiantCircle.Create(nil);
  ControlRadCircle.Parent := FParent;
end;

procedure TFRadiantCircle.Cursor(FCursor: TCursor);
begin
  ControlRadCircle.Cursor := FCursor;
end;

procedure TFRadiantCircle.Left(FLeft: Single);
begin
  ControlRadCircle.Position.X := FLeft;
end;

procedure TFRadiantCircle.Top(FTop: Single);
begin
  ControlRadCircle.Position.Y := FTop;
end;

procedure TFRadiantCircle.Height(FHeight: Single);
begin
  ControlRadCircle.Height := FHeight;
end;

procedure TFRadiantCircle.Width(FWidth: Single);
begin
  ControlRadCircle.Width := FWidth;
end;

procedure TFRadiantCircle.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadCircle.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantCircle.Position(X, Y: Single);
begin
  ControlRadCircle.Position.X := X;
  ControlRadCircle.Position.Y := Y;
end;

procedure TFRadiantCircle.Align(Al: TAlignLayout);
begin
  ControlRadCircle.Align := Al;
end;

procedure TFRadiantCircle.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadCircle.Margins.Left := FLeft;
  ControlRadCircle.Margins.Top := FTop;
  ControlRadCircle.Margins.Right := FRight;
  ControlRadCircle.Margins.Bottom := FBottom;
end;

procedure TFRadiantCircle.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadCircle.Padding.Left := FLeft;
  ControlRadCircle.Padding.Top := FTop;
  ControlRadCircle.Padding.Right := FRight;
  ControlRadCircle.Padding.Bottom := FBottom;
end;

procedure TFRadiantCircle.SetHint(const FText: WideString);
begin
  ControlRadCircle.ShowHint := True;
  ControlRadCircle.Hint := FText;
end;

procedure TFRadiantCircle.SetClipChildren(FValue: Boolean);
begin
  ControlRadCircle.ClipChildren := FValue;
end;

procedure TFRadiantCircle.SetClipParent(FValue: Boolean);
begin
  ControlRadCircle.ClipParent := FValue;
end;

procedure TFRadiantCircle.BringToFront;
begin
  ControlRadCircle.BringToFront;
end;

procedure TFRadiantCircle.SendToBack;
begin
  ControlRadCircle.SendToBack;
end;

procedure TFRadiantCircle.SetTag(FTag: Integer);
begin
  ControlRadCircle.Tag := FTag;
end;

procedure TFRadiantCircle.FillColor(FColor: TAlphaColor);
begin
  ControlRadCircle.Fill.Kind := TBrushKind.Solid;
  ControlRadCircle.Fill.Color := FColor;
end;

procedure TFRadiantCircle.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadCircle.Fill.Kind := TBrushKind.Bitmap;
  ControlRadCircle.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadCircle.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantCircle.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadCircle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadCircle.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantCircle.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadCircle.Fill.Kind := TBrushKind.Gradient;
  ControlRadCircle.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadCircle.Fill, FAngle);
end;

procedure TFRadiantCircle.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadCircle.Fill.Kind := TBrushKind.Gradient;
  ControlRadCircle.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadCircle.Fill, FAngle);
end;

procedure TFRadiantCircle.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadCircle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadCircle.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantCircle.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadCircle.Stroke.Kind := TBrushKind.Solid;
  ControlRadCircle.Stroke.Color := FColor;
end;

procedure TFRadiantCircle.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadCircle.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadCircle.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadCircle.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantCircle.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadCircle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadCircle.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantCircle.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadCircle.Stroke.Kind := TBrushKind.Gradient;
  ControlRadCircle.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadCircle.Stroke, FAngle);
end;

procedure TFRadiantCircle.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadCircle.Stroke.Kind := TBrushKind.Gradient;
  ControlRadCircle.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadCircle.Stroke, FAngle);
end;

procedure TFRadiantCircle.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadCircle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadCircle.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantCircle.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadCircle.Stroke.Kind := TBrushKind.Solid;
  ControlRadCircle.Stroke.Thickness := FThickness;
  ControlRadCircle.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadCircle.Stroke.Dash := TStrokeDash(Dash);
  ControlRadCircle.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantCircle.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadCircle.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantCircle.Opacity(FOpacity: Single);
begin
  ControlRadCircle.Opacity := FOpacity;
end;

procedure TFRadiantCircle.RotationAngle(FValue: Single);
begin
  ControlRadCircle.RotationAngle := FValue;
end;

procedure TFRadiantCircle.RotationCenter(X, Y: Single);
begin
  ControlRadCircle.RotationCenter.X := X;
  ControlRadCircle.RotationCenter.Y := Y;
end;

procedure TFRadiantCircle.Enabled(FEnabled: Boolean);
begin
  ControlRadCircle.Enabled := FEnabled;
end;

procedure TFRadiantCircle.Visible(FVisible: Boolean);
begin
  ControlRadCircle.Visible := FVisible;
end;

procedure TFRadiantCircle.HitTest(FEnabled: Boolean);
begin
  ControlRadCircle.HitTest := FEnabled;
end;

function TFRadiantCircle.IsVisible: Boolean;
begin
  Result := ControlRadCircle.Visible;
end;

function TFRadiantCircle.GetTag: Integer;
begin
  Result := ControlRadCircle.Tag;
end;

function TFRadiantCircle.GetLeft: Single;
begin
  Result := ControlRadCircle.Position.X;
end;

function TFRadiantCircle.GetTop: Single;
begin
  Result := ControlRadCircle.Position.Y;
end;

function TFRadiantCircle.GetHeight: Single;
begin
  Result := ControlRadCircle.Height;
end;

function TFRadiantCircle.GetWidth: Single;
begin
  Result := ControlRadCircle.Width;
end;

function TFRadiantCircle.GetObject: TFmxObject;
begin
  Result := ControlRadCircle;
end;

procedure TFRadiantCircle.OnClick(Event: TNotifyEvent);
begin
  ControlRadCircle.OnClick := Event;
end;

procedure TFRadiantCircle.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadCircle.OnMouseDown := Event;
end;

procedure TFRadiantCircle.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadCircle.OnMouseEnter := Event;
end;

procedure TFRadiantCircle.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadCircle.OnMouseLeave := Event;
end;

procedure TFRadiantCircle.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadCircle.OnMouseUp := Event;
end;

function TFRadiantCircle.Handle: TFmxObject;
begin
  Result := ControlRadCircle;
end;

// >>>>>> TFRadiantDiamond <<<<<< \\
procedure TFRadiantDiamond.FCreate(FParent: TFmxObject);
begin
  ControlRadDiamond := TRadiantDiamond.Create(nil);
  ControlRadDiamond.Parent := FParent;
end;

procedure TFRadiantDiamond.Cursor(FCursor: TCursor);
begin
  ControlRadDiamond.Cursor := FCursor;
end;

procedure TFRadiantDiamond.Left(FLeft: Single);
begin
  ControlRadDiamond.Position.X := FLeft;
end;

procedure TFRadiantDiamond.Top(FTop: Single);
begin
  ControlRadDiamond.Position.Y := FTop;
end;

procedure TFRadiantDiamond.Height(FHeight: Single);
begin
  ControlRadDiamond.Height := FHeight;
end;

procedure TFRadiantDiamond.Width(FWidth: Single);
begin
  ControlRadDiamond.Width := FWidth;
end;

procedure TFRadiantDiamond.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadDiamond.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantDiamond.Position(X, Y: Single);
begin
  ControlRadDiamond.Position.X := X;
  ControlRadDiamond.Position.Y := Y;
end;

procedure TFRadiantDiamond.Align(Al: TAlignLayout);
begin
  ControlRadDiamond.Align := Al;
end;

procedure TFRadiantDiamond.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadDiamond.Margins.Left := FLeft;
  ControlRadDiamond.Margins.Top := FTop;
  ControlRadDiamond.Margins.Right := FRight;
  ControlRadDiamond.Margins.Bottom := FBottom;
end;

procedure TFRadiantDiamond.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadDiamond.Padding.Left := FLeft;
  ControlRadDiamond.Padding.Top := FTop;
  ControlRadDiamond.Padding.Right := FRight;
  ControlRadDiamond.Padding.Bottom := FBottom;
end;

procedure TFRadiantDiamond.SetHint(const FText: WideString);
begin
  ControlRadDiamond.ShowHint := True;
  ControlRadDiamond.Hint := FText;
end;

procedure TFRadiantDiamond.SetClipChildren(FValue: Boolean);
begin
  ControlRadDiamond.ClipChildren := FValue;
end;

procedure TFRadiantDiamond.SetClipParent(FValue: Boolean);
begin
  ControlRadDiamond.ClipParent := FValue;
end;

procedure TFRadiantDiamond.BringToFront;
begin
  ControlRadDiamond.BringToFront;
end;

procedure TFRadiantDiamond.SendToBack;
begin
  ControlRadDiamond.SendToBack;
end;

procedure TFRadiantDiamond.SetTag(FTag: Integer);
begin
  ControlRadDiamond.Tag := FTag;
end;

procedure TFRadiantDiamond.FillColor(FColor: TAlphaColor);
begin
  ControlRadDiamond.Fill.Kind := TBrushKind.Solid;
  ControlRadDiamond.Fill.Color := FColor;
end;

procedure TFRadiantDiamond.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadDiamond.Fill.Kind := TBrushKind.Bitmap;
  ControlRadDiamond.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadDiamond.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantDiamond.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadDiamond.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadDiamond.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantDiamond.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadDiamond.Fill.Kind := TBrushKind.Gradient;
  ControlRadDiamond.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadDiamond.Fill, FAngle);
end;

procedure TFRadiantDiamond.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadDiamond.Fill.Kind := TBrushKind.Gradient;
  ControlRadDiamond.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadDiamond.Fill, FAngle);
end;

procedure TFRadiantDiamond.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadDiamond.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadDiamond.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantDiamond.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadDiamond.Stroke.Kind := TBrushKind.Solid;
  ControlRadDiamond.Stroke.Color := FColor;
end;

procedure TFRadiantDiamond.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadDiamond.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadDiamond.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadDiamond.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantDiamond.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadDiamond.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadDiamond.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantDiamond.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadDiamond.Stroke.Kind := TBrushKind.Gradient;
  ControlRadDiamond.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadDiamond.Stroke, FAngle);
end;

procedure TFRadiantDiamond.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadDiamond.Stroke.Kind := TBrushKind.Gradient;
  ControlRadDiamond.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadDiamond.Stroke, FAngle);
end;

procedure TFRadiantDiamond.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadDiamond.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadDiamond.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantDiamond.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadDiamond.Stroke.Kind := TBrushKind.Solid;
  ControlRadDiamond.Stroke.Thickness := FThickness;
  ControlRadDiamond.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadDiamond.Stroke.Dash := TStrokeDash(Dash);
  ControlRadDiamond.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantDiamond.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadDiamond.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantDiamond.Opacity(FOpacity: Single);
begin
  ControlRadDiamond.Opacity := FOpacity;
end;

procedure TFRadiantDiamond.RotationAngle(FValue: Single);
begin
  ControlRadDiamond.RotationAngle := FValue;
end;

procedure TFRadiantDiamond.RotationCenter(X, Y: Single);
begin
  ControlRadDiamond.RotationCenter.X := X;
  ControlRadDiamond.RotationCenter.Y := Y;
end;

procedure TFRadiantDiamond.Enabled(FEnabled: Boolean);
begin
  ControlRadDiamond.Enabled := FEnabled;
end;

procedure TFRadiantDiamond.Visible(FVisible: Boolean);
begin
  ControlRadDiamond.Visible := FVisible;
end;

procedure TFRadiantDiamond.HitTest(FEnabled: Boolean);
begin
  ControlRadDiamond.HitTest := FEnabled;
end;

function TFRadiantDiamond.IsVisible: Boolean;
begin
  Result := ControlRadDiamond.Visible;
end;

function TFRadiantDiamond.GetTag: Integer;
begin
  Result := ControlRadDiamond.Tag;
end;

function TFRadiantDiamond.GetLeft: Single;
begin
  Result := ControlRadDiamond.Position.X;
end;

function TFRadiantDiamond.GetTop: Single;
begin
  Result := ControlRadDiamond.Position.Y;
end;

function TFRadiantDiamond.GetHeight: Single;
begin
  Result := ControlRadDiamond.Height;
end;

function TFRadiantDiamond.GetWidth: Single;
begin
  Result := ControlRadDiamond.Width;
end;

function TFRadiantDiamond.GetObject: TFmxObject;
begin
  Result := ControlRadDiamond;
end;

procedure TFRadiantDiamond.OnClick(Event: TNotifyEvent);
begin
  ControlRadDiamond.OnClick := Event;
end;

procedure TFRadiantDiamond.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadDiamond.OnMouseDown := Event;
end;

procedure TFRadiantDiamond.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadDiamond.OnMouseEnter := Event;
end;

procedure TFRadiantDiamond.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadDiamond.OnMouseLeave := Event;
end;

procedure TFRadiantDiamond.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadDiamond.OnMouseUp := Event;
end;

function TFRadiantDiamond.Handle: TFmxObject;
begin
  Result := ControlRadDiamond;
end;

// >>>>>> TFRadiantEllipse <<<<<< \\
procedure TFRadiantEllipse.FCreate(FParent: TFmxObject);
begin
  ControlRadEllipse := TRadiantEllipse.Create(nil);
  ControlRadEllipse.Parent := FParent;
end;

procedure TFRadiantEllipse.Cursor(FCursor: TCursor);
begin
  ControlRadEllipse.Cursor := FCursor;
end;

procedure TFRadiantEllipse.Left(FLeft: Single);
begin
  ControlRadEllipse.Position.X := FLeft;
end;

procedure TFRadiantEllipse.Top(FTop: Single);
begin
  ControlRadEllipse.Position.Y := FTop;
end;

procedure TFRadiantEllipse.Height(FHeight: Single);
begin
  ControlRadEllipse.Height := FHeight;
end;

procedure TFRadiantEllipse.Width(FWidth: Single);
begin
  ControlRadEllipse.Width := FWidth;
end;

procedure TFRadiantEllipse.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadEllipse.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantEllipse.Position(X, Y: Single);
begin
  ControlRadEllipse.Position.X := X;
  ControlRadEllipse.Position.Y := Y;
end;

procedure TFRadiantEllipse.Align(Al: TAlignLayout);
begin
  ControlRadEllipse.Align := Al;
end;

procedure TFRadiantEllipse.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadEllipse.Margins.Left := FLeft;
  ControlRadEllipse.Margins.Top := FTop;
  ControlRadEllipse.Margins.Right := FRight;
  ControlRadEllipse.Margins.Bottom := FBottom;
end;

procedure TFRadiantEllipse.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadEllipse.Padding.Left := FLeft;
  ControlRadEllipse.Padding.Top := FTop;
  ControlRadEllipse.Padding.Right := FRight;
  ControlRadEllipse.Padding.Bottom := FBottom;
end;

procedure TFRadiantEllipse.SetHint(const FText: WideString);
begin
  ControlRadEllipse.ShowHint := True;
  ControlRadEllipse.Hint := FText;
end;

procedure TFRadiantEllipse.SetClipChildren(FValue: Boolean);
begin
  ControlRadEllipse.ClipChildren := FValue;
end;

procedure TFRadiantEllipse.SetClipParent(FValue: Boolean);
begin
  ControlRadEllipse.ClipParent := FValue;
end;

procedure TFRadiantEllipse.BringToFront;
begin
  ControlRadEllipse.BringToFront;
end;

procedure TFRadiantEllipse.SendToBack;
begin
  ControlRadEllipse.SendToBack;
end;

procedure TFRadiantEllipse.SetTag(FTag: Integer);
begin
  ControlRadEllipse.Tag := FTag;
end;

procedure TFRadiantEllipse.FillColor(FColor: TAlphaColor);
begin
  ControlRadEllipse.Fill.Kind := TBrushKind.Solid;
  ControlRadEllipse.Fill.Color := FColor;
end;

procedure TFRadiantEllipse.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadEllipse.Fill.Kind := TBrushKind.Bitmap;
  ControlRadEllipse.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadEllipse.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantEllipse.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadEllipse.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadEllipse.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantEllipse.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadEllipse.Fill.Kind := TBrushKind.Gradient;
  ControlRadEllipse.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadEllipse.Fill, FAngle);
end;

procedure TFRadiantEllipse.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadEllipse.Fill.Kind := TBrushKind.Gradient;
  ControlRadEllipse.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadEllipse.Fill, FAngle);
end;

procedure TFRadiantEllipse.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadEllipse.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadEllipse.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantEllipse.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadEllipse.Stroke.Kind := TBrushKind.Solid;
  ControlRadEllipse.Stroke.Color := FColor;
end;

procedure TFRadiantEllipse.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadEllipse.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadEllipse.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadEllipse.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantEllipse.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadEllipse.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadEllipse.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantEllipse.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadEllipse.Stroke.Kind := TBrushKind.Gradient;
  ControlRadEllipse.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadEllipse.Stroke, FAngle);
end;

procedure TFRadiantEllipse.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadEllipse.Stroke.Kind := TBrushKind.Gradient;
  ControlRadEllipse.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadEllipse.Stroke, FAngle);
end;

procedure TFRadiantEllipse.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadEllipse.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadEllipse.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantEllipse.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadEllipse.Stroke.Kind := TBrushKind.Solid;
  ControlRadEllipse.Stroke.Thickness := FThickness;
  ControlRadEllipse.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadEllipse.Stroke.Dash := TStrokeDash(Dash);
  ControlRadEllipse.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantEllipse.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadEllipse.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantEllipse.Opacity(FOpacity: Single);
begin
  ControlRadEllipse.Opacity := FOpacity;
end;

procedure TFRadiantEllipse.RotationAngle(FValue: Single);
begin
  ControlRadEllipse.RotationAngle := FValue;
end;

procedure TFRadiantEllipse.RotationCenter(X, Y: Single);
begin
  ControlRadEllipse.RotationCenter.X := X;
  ControlRadEllipse.RotationCenter.Y := Y;
end;

procedure TFRadiantEllipse.Enabled(FEnabled: Boolean);
begin
  ControlRadEllipse.Enabled := FEnabled;
end;

procedure TFRadiantEllipse.Visible(FVisible: Boolean);
begin
  ControlRadEllipse.Visible := FVisible;
end;

procedure TFRadiantEllipse.HitTest(FEnabled: Boolean);
begin
  ControlRadEllipse.HitTest := FEnabled;
end;

function TFRadiantEllipse.IsVisible: Boolean;
begin
  Result := ControlRadEllipse.Visible;
end;

function TFRadiantEllipse.GetTag: Integer;
begin
  Result := ControlRadEllipse.Tag;
end;

function TFRadiantEllipse.GetLeft: Single;
begin
  Result := ControlRadEllipse.Position.X;
end;

function TFRadiantEllipse.GetTop: Single;
begin
  Result := ControlRadEllipse.Position.Y;
end;

function TFRadiantEllipse.GetHeight: Single;
begin
  Result := ControlRadEllipse.Height;
end;

function TFRadiantEllipse.GetWidth: Single;
begin
  Result := ControlRadEllipse.Width;
end;

function TFRadiantEllipse.GetObject: TFmxObject;
begin
  Result := ControlRadEllipse;
end;

procedure TFRadiantEllipse.OnClick(Event: TNotifyEvent);
begin
  ControlRadEllipse.OnClick := Event;
end;

procedure TFRadiantEllipse.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadEllipse.OnMouseDown := Event;
end;

procedure TFRadiantEllipse.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadEllipse.OnMouseEnter := Event;
end;

procedure TFRadiantEllipse.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadEllipse.OnMouseLeave := Event;
end;

procedure TFRadiantEllipse.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadEllipse.OnMouseUp := Event;
end;

function TFRadiantEllipse.Handle: TFmxObject;
begin
  Result := ControlRadEllipse;
end;

// >>>>>> TFRadiantFrame <<<<<< \\
procedure TFRadiantFrame.FCreate(FParent: TFmxObject);
begin
  ControlRadFrame := TRadiantFrame.Create(nil);
  ControlRadFrame.Parent := FParent;
end;

procedure TFRadiantFrame.Cursor(FCursor: TCursor);
begin
  ControlRadFrame.Cursor := FCursor;
end;

procedure TFRadiantFrame.Left(FLeft: Single);
begin
  ControlRadFrame.Position.X := FLeft;
end;

procedure TFRadiantFrame.Top(FTop: Single);
begin
  ControlRadFrame.Position.Y := FTop;
end;

procedure TFRadiantFrame.Height(FHeight: Single);
begin
  ControlRadFrame.Height := FHeight;
end;

procedure TFRadiantFrame.Width(FWidth: Single);
begin
  ControlRadFrame.Width := FWidth;
end;

procedure TFRadiantFrame.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadFrame.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantFrame.Position(X, Y: Single);
begin
  ControlRadFrame.Position.X := X;
  ControlRadFrame.Position.Y := Y;
end;

procedure TFRadiantFrame.Align(Al: TAlignLayout);
begin
  ControlRadFrame.Align := Al;
end;

procedure TFRadiantFrame.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadFrame.Margins.Left := FLeft;
  ControlRadFrame.Margins.Top := FTop;
  ControlRadFrame.Margins.Right := FRight;
  ControlRadFrame.Margins.Bottom := FBottom;
end;

procedure TFRadiantFrame.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadFrame.Padding.Left := FLeft;
  ControlRadFrame.Padding.Top := FTop;
  ControlRadFrame.Padding.Right := FRight;
  ControlRadFrame.Padding.Bottom := FBottom;
end;

procedure TFRadiantFrame.SetHint(const FText: WideString);
begin
  ControlRadFrame.ShowHint := True;
  ControlRadFrame.Hint := FText;
end;

procedure TFRadiantFrame.SetClipChildren(FValue: Boolean);
begin
  ControlRadFrame.ClipChildren := FValue;
end;

procedure TFRadiantFrame.SetClipParent(FValue: Boolean);
begin
  ControlRadFrame.ClipParent := FValue;
end;

procedure TFRadiantFrame.BringToFront;
begin
  ControlRadFrame.BringToFront;
end;

procedure TFRadiantFrame.SendToBack;
begin
  ControlRadFrame.SendToBack;
end;

procedure TFRadiantFrame.SetTag(FTag: Integer);
begin
  ControlRadFrame.Tag := FTag;
end;

procedure TFRadiantFrame.FillColor(FColor: TAlphaColor);
begin
  ControlRadFrame.Fill.Kind := TBrushKind.Solid;
  ControlRadFrame.Fill.Color := FColor;
end;

procedure TFRadiantFrame.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadFrame.Fill.Kind := TBrushKind.Bitmap;
  ControlRadFrame.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadFrame.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantFrame.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadFrame.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadFrame.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantFrame.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadFrame.Fill.Kind := TBrushKind.Gradient;
  ControlRadFrame.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadFrame.Fill, FAngle);
end;

procedure TFRadiantFrame.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadFrame.Fill.Kind := TBrushKind.Gradient;
  ControlRadFrame.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadFrame.Fill, FAngle);
end;

procedure TFRadiantFrame.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadFrame.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadFrame.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantFrame.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadFrame.Stroke.Kind := TBrushKind.Solid;
  ControlRadFrame.Stroke.Color := FColor;
end;

procedure TFRadiantFrame.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadFrame.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadFrame.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadFrame.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantFrame.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadFrame.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadFrame.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantFrame.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadFrame.Stroke.Kind := TBrushKind.Gradient;
  ControlRadFrame.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadFrame.Stroke, FAngle);
end;

procedure TFRadiantFrame.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadFrame.Stroke.Kind := TBrushKind.Gradient;
  ControlRadFrame.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadFrame.Stroke, FAngle);
end;

procedure TFRadiantFrame.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadFrame.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadFrame.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantFrame.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadFrame.Stroke.Kind := TBrushKind.Solid;
  ControlRadFrame.Stroke.Thickness := FThickness;
  ControlRadFrame.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadFrame.Stroke.Dash := TStrokeDash(Dash);
  ControlRadFrame.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantFrame.FrameSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadFrame.FrameSize.Pixels := FPixels;
  ControlRadFrame.FrameSize.ScaleFactor := FScaleFactor;
  ControlRadFrame.FrameSize.Units := Units;
end;

procedure TFRadiantFrame.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadFrame.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantFrame.Opacity(FOpacity: Single);
begin
  ControlRadFrame.Opacity := FOpacity;
end;

procedure TFRadiantFrame.RotationAngle(FValue: Single);
begin
  ControlRadFrame.RotationAngle := FValue;
end;

procedure TFRadiantFrame.RotationCenter(X, Y: Single);
begin
  ControlRadFrame.RotationCenter.X := X;
  ControlRadFrame.RotationCenter.Y := Y;
end;

procedure TFRadiantFrame.Enabled(FEnabled: Boolean);
begin
  ControlRadFrame.Enabled := FEnabled;
end;

procedure TFRadiantFrame.Visible(FVisible: Boolean);
begin
  ControlRadFrame.Visible := FVisible;
end;

procedure TFRadiantFrame.HitTest(FEnabled: Boolean);
begin
  ControlRadFrame.HitTest := FEnabled;
end;

function TFRadiantFrame.IsVisible: Boolean;
begin
  Result := ControlRadFrame.Visible;
end;

function TFRadiantFrame.GetTag: Integer;
begin
  Result := ControlRadFrame.Tag;
end;

function TFRadiantFrame.GetLeft: Single;
begin
  Result := ControlRadFrame.Position.X;
end;

function TFRadiantFrame.GetTop: Single;
begin
  Result := ControlRadFrame.Position.Y;
end;

function TFRadiantFrame.GetHeight: Single;
begin
  Result := ControlRadFrame.Height;
end;

function TFRadiantFrame.GetWidth: Single;
begin
  Result := ControlRadFrame.Width;
end;

function TFRadiantFrame.GetObject: TFmxObject;
begin
  Result := ControlRadFrame;
end;

procedure TFRadiantFrame.OnClick(Event: TNotifyEvent);
begin
  ControlRadFrame.OnClick := Event;
end;

procedure TFRadiantFrame.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadFrame.OnMouseDown := Event;
end;

procedure TFRadiantFrame.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadFrame.OnMouseEnter := Event;
end;

procedure TFRadiantFrame.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadFrame.OnMouseLeave := Event;
end;

procedure TFRadiantFrame.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadFrame.OnMouseUp := Event;
end;

function TFRadiantFrame.Handle: TFmxObject;
begin
  Result := ControlRadFrame;
end;

// >>>>>> TFRadiantGear <<<<<< \\
procedure TFRadiantGear.FCreate(FParent: TFmxObject);
begin
  ControlRadGear := TRadiantGear.Create(nil);
  ControlRadGear.Parent := FParent;
end;

procedure TFRadiantGear.Cursor(FCursor: TCursor);
begin
  ControlRadGear.Cursor := FCursor;
end;

procedure TFRadiantGear.Left(FLeft: Single);
begin
  ControlRadGear.Position.X := FLeft;
end;

procedure TFRadiantGear.Top(FTop: Single);
begin
  ControlRadGear.Position.Y := FTop;
end;

procedure TFRadiantGear.Height(FHeight: Single);
begin
  ControlRadGear.Height := FHeight;
end;

procedure TFRadiantGear.Width(FWidth: Single);
begin
  ControlRadGear.Width := FWidth;
end;

procedure TFRadiantGear.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadGear.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantGear.Position(X, Y: Single);
begin
  ControlRadGear.Position.X := X;
  ControlRadGear.Position.Y := Y;
end;

procedure TFRadiantGear.Align(Al: TAlignLayout);
begin
  ControlRadGear.Align := Al;
end;

procedure TFRadiantGear.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadGear.Margins.Left := FLeft;
  ControlRadGear.Margins.Top := FTop;
  ControlRadGear.Margins.Right := FRight;
  ControlRadGear.Margins.Bottom := FBottom;
end;

procedure TFRadiantGear.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadGear.Padding.Left := FLeft;
  ControlRadGear.Padding.Top := FTop;
  ControlRadGear.Padding.Right := FRight;
  ControlRadGear.Padding.Bottom := FBottom;
end;

procedure TFRadiantGear.SetHint(const FText: WideString);
begin
  ControlRadGear.ShowHint := True;
  ControlRadGear.Hint := FText;
end;

procedure TFRadiantGear.SetClipChildren(FValue: Boolean);
begin
  ControlRadGear.ClipChildren := FValue;
end;

procedure TFRadiantGear.SetClipParent(FValue: Boolean);
begin
  ControlRadGear.ClipParent := FValue;
end;

procedure TFRadiantGear.BringToFront;
begin
  ControlRadGear.BringToFront;
end;

procedure TFRadiantGear.SendToBack;
begin
  ControlRadGear.SendToBack;
end;

procedure TFRadiantGear.SetTag(FTag: Integer);
begin
  ControlRadGear.Tag := FTag;
end;

procedure TFRadiantGear.FillColor(FColor: TAlphaColor);
begin
  ControlRadGear.Fill.Kind := TBrushKind.Solid;
  ControlRadGear.Fill.Color := FColor;
end;

procedure TFRadiantGear.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadGear.Fill.Kind := TBrushKind.Bitmap;
  ControlRadGear.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadGear.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantGear.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadGear.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadGear.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantGear.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadGear.Fill.Kind := TBrushKind.Gradient;
  ControlRadGear.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadGear.Fill, FAngle);
end;

procedure TFRadiantGear.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadGear.Fill.Kind := TBrushKind.Gradient;
  ControlRadGear.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadGear.Fill, FAngle);
end;

procedure TFRadiantGear.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadGear.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadGear.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantGear.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadGear.Stroke.Kind := TBrushKind.Solid;
  ControlRadGear.Stroke.Color := FColor;
end;

procedure TFRadiantGear.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadGear.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadGear.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadGear.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantGear.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadGear.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadGear.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantGear.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadGear.Stroke.Kind := TBrushKind.Gradient;
  ControlRadGear.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadGear.Stroke, FAngle);
end;

procedure TFRadiantGear.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadGear.Stroke.Kind := TBrushKind.Gradient;
  ControlRadGear.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadGear.Stroke, FAngle);
end;

procedure TFRadiantGear.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadGear.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadGear.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantGear.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadGear.Stroke.Kind := TBrushKind.Solid;
  ControlRadGear.Stroke.Thickness := FThickness;
  ControlRadGear.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadGear.Stroke.Dash := TStrokeDash(Dash);
  ControlRadGear.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantGear.HoleSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadGear.HoleSize.Pixels := FPixels;
  ControlRadGear.HoleSize.ScaleFactor := FScaleFactor;
  ControlRadGear.HoleSize.Units := Units;
end;

procedure TFRadiantGear.CogsSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadGear.HoleSize.Pixels := FPixels;
  ControlRadGear.HoleSize.ScaleFactor := FScaleFactor;
  ControlRadGear.HoleSize.Units := Units;
end;

procedure TFRadiantGear.Cogs(FValue: Integer);
begin
  ControlRadGear.Cogs := FValue;
end;

procedure TFRadiantGear.ShowHole(FValue: Boolean);
begin
  ControlRadGear.ShowHole := FValue;
end;

procedure TFRadiantGear.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadGear.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantGear.Opacity(FOpacity: Single);
begin
  ControlRadGear.Opacity := FOpacity;
end;

procedure TFRadiantGear.RotationAngle(FValue: Single);
begin
  ControlRadGear.RotationAngle := FValue;
end;

procedure TFRadiantGear.RotationCenter(X, Y: Single);
begin
  ControlRadGear.RotationCenter.X := X;
  ControlRadGear.RotationCenter.Y := Y;
end;

procedure TFRadiantGear.Enabled(FEnabled: Boolean);
begin
  ControlRadGear.Enabled := FEnabled;
end;

procedure TFRadiantGear.Visible(FVisible: Boolean);
begin
  ControlRadGear.Visible := FVisible;
end;

procedure TFRadiantGear.HitTest(FEnabled: Boolean);
begin
  ControlRadGear.HitTest := FEnabled;
end;

function TFRadiantGear.IsVisible: Boolean;
begin
  Result := ControlRadGear.Visible;
end;

function TFRadiantGear.GetTag: Integer;
begin
  Result := ControlRadGear.Tag;
end;

function TFRadiantGear.GetLeft: Single;
begin
  Result := ControlRadGear.Position.X;
end;

function TFRadiantGear.GetTop: Single;
begin
  Result := ControlRadGear.Position.Y;
end;

function TFRadiantGear.GetHeight: Single;
begin
  Result := ControlRadGear.Height;
end;

function TFRadiantGear.GetWidth: Single;
begin
  Result := ControlRadGear.Width;
end;

function TFRadiantGear.GetObject: TFmxObject;
begin
  Result := ControlRadGear;
end;

procedure TFRadiantGear.OnClick(Event: TNotifyEvent);
begin
  ControlRadGear.OnClick := Event;
end;

procedure TFRadiantGear.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadGear.OnMouseDown := Event;
end;

procedure TFRadiantGear.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadGear.OnMouseEnter := Event;
end;

procedure TFRadiantGear.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadGear.OnMouseLeave := Event;
end;

procedure TFRadiantGear.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadGear.OnMouseUp := Event;
end;

function TFRadiantGear.Handle: TFmxObject;
begin
  Result := ControlRadGear;
end;

// >>>>>> TFRadiantHexagon <<<<<< \\
procedure TFRadiantHexagon.FCreate(FParent: TFmxObject);
begin
  ControlRadHexagon := TRadiantHexagon.Create(nil);
  ControlRadHexagon.Parent := FParent;
end;

procedure TFRadiantHexagon.Cursor(FCursor: TCursor);
begin
  ControlRadHexagon.Cursor := FCursor;
end;

procedure TFRadiantHexagon.Left(FLeft: Single);
begin
  ControlRadHexagon.Position.X := FLeft;
end;

procedure TFRadiantHexagon.Top(FTop: Single);
begin
  ControlRadHexagon.Position.Y := FTop;
end;

procedure TFRadiantHexagon.Height(FHeight: Single);
begin
  ControlRadHexagon.Height := FHeight;
end;

procedure TFRadiantHexagon.Width(FWidth: Single);
begin
  ControlRadHexagon.Width := FWidth;
end;

procedure TFRadiantHexagon.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadHexagon.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantHexagon.Position(X, Y: Single);
begin
  ControlRadHexagon.Position.X := X;
  ControlRadHexagon.Position.Y := Y;
end;

procedure TFRadiantHexagon.Align(Al: TAlignLayout);
begin
  ControlRadHexagon.Align := Al;
end;

procedure TFRadiantHexagon.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadHexagon.Margins.Left := FLeft;
  ControlRadHexagon.Margins.Top := FTop;
  ControlRadHexagon.Margins.Right := FRight;
  ControlRadHexagon.Margins.Bottom := FBottom;
end;

procedure TFRadiantHexagon.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadHexagon.Padding.Left := FLeft;
  ControlRadHexagon.Padding.Top := FTop;
  ControlRadHexagon.Padding.Right := FRight;
  ControlRadHexagon.Padding.Bottom := FBottom;
end;

procedure TFRadiantHexagon.SetHint(const FText: WideString);
begin
  ControlRadHexagon.ShowHint := True;
  ControlRadHexagon.Hint := FText;
end;

procedure TFRadiantHexagon.SetClipChildren(FValue: Boolean);
begin
  ControlRadHexagon.ClipChildren := FValue;
end;

procedure TFRadiantHexagon.SetClipParent(FValue: Boolean);
begin
  ControlRadHexagon.ClipParent := FValue;
end;

procedure TFRadiantHexagon.BringToFront;
begin
  ControlRadHexagon.BringToFront;
end;

procedure TFRadiantHexagon.SendToBack;
begin
  ControlRadHexagon.SendToBack;
end;

procedure TFRadiantHexagon.SetTag(FTag: Integer);
begin
  ControlRadHexagon.Tag := FTag;
end;

procedure TFRadiantHexagon.FillColor(FColor: TAlphaColor);
begin
  ControlRadHexagon.Fill.Kind := TBrushKind.Solid;
  ControlRadHexagon.Fill.Color := FColor;
end;

procedure TFRadiantHexagon.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadHexagon.Fill.Kind := TBrushKind.Bitmap;
  ControlRadHexagon.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadHexagon.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantHexagon.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadHexagon.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadHexagon.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantHexagon.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadHexagon.Fill.Kind := TBrushKind.Gradient;
  ControlRadHexagon.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadHexagon.Fill, FAngle);
end;

procedure TFRadiantHexagon.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadHexagon.Fill.Kind := TBrushKind.Gradient;
  ControlRadHexagon.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadHexagon.Fill, FAngle);
end;

procedure TFRadiantHexagon.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadHexagon.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadHexagon.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantHexagon.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadHexagon.Stroke.Kind := TBrushKind.Solid;
  ControlRadHexagon.Stroke.Color := FColor;
end;

procedure TFRadiantHexagon.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadHexagon.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadHexagon.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadHexagon.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantHexagon.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadHexagon.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadHexagon.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantHexagon.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadHexagon.Stroke.Kind := TBrushKind.Gradient;
  ControlRadHexagon.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadHexagon.Stroke, FAngle);
end;

procedure TFRadiantHexagon.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadHexagon.Stroke.Kind := TBrushKind.Gradient;
  ControlRadHexagon.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadHexagon.Stroke, FAngle);
end;

procedure TFRadiantHexagon.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadHexagon.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadHexagon.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantHexagon.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadHexagon.Stroke.Kind := TBrushKind.Solid;
  ControlRadHexagon.Stroke.Thickness := FThickness;
  ControlRadHexagon.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadHexagon.Stroke.Dash := TStrokeDash(Dash);
  ControlRadHexagon.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantHexagon.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadHexagon.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantHexagon.Opacity(FOpacity: Single);
begin
  ControlRadHexagon.Opacity := FOpacity;
end;

procedure TFRadiantHexagon.RotationAngle(FValue: Single);
begin
  ControlRadHexagon.RotationAngle := FValue;
end;

procedure TFRadiantHexagon.RotationCenter(X, Y: Single);
begin
  ControlRadHexagon.RotationCenter.X := X;
  ControlRadHexagon.RotationCenter.Y := Y;
end;

procedure TFRadiantHexagon.Enabled(FEnabled: Boolean);
begin
  ControlRadHexagon.Enabled := FEnabled;
end;

procedure TFRadiantHexagon.Visible(FVisible: Boolean);
begin
  ControlRadHexagon.Visible := FVisible;
end;

procedure TFRadiantHexagon.HitTest(FEnabled: Boolean);
begin
  ControlRadHexagon.HitTest := FEnabled;
end;

function TFRadiantHexagon.IsVisible: Boolean;
begin
  Result := ControlRadHexagon.Visible;
end;

function TFRadiantHexagon.GetTag: Integer;
begin
  Result := ControlRadHexagon.Tag;
end;

function TFRadiantHexagon.GetLeft: Single;
begin
  Result := ControlRadHexagon.Position.X;
end;

function TFRadiantHexagon.GetTop: Single;
begin
  Result := ControlRadHexagon.Position.Y;
end;

function TFRadiantHexagon.GetHeight: Single;
begin
  Result := ControlRadHexagon.Height;
end;

function TFRadiantHexagon.GetWidth: Single;
begin
  Result := ControlRadHexagon.Width;
end;

function TFRadiantHexagon.GetObject: TFmxObject;
begin
  Result := ControlRadHexagon;
end;

procedure TFRadiantHexagon.OnClick(Event: TNotifyEvent);
begin
  ControlRadHexagon.OnClick := Event;
end;

procedure TFRadiantHexagon.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadHexagon.OnMouseDown := Event;
end;

procedure TFRadiantHexagon.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadHexagon.OnMouseEnter := Event;
end;

procedure TFRadiantHexagon.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadHexagon.OnMouseLeave := Event;
end;

procedure TFRadiantHexagon.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadHexagon.OnMouseUp := Event;
end;

function TFRadiantHexagon.Handle: TFmxObject;
begin
  Result := ControlRadHexagon;
end;

// >>>>>> TFRadiantLine <<<<<< \\
procedure TFRadiantLine.FCreate(FParent: TFmxObject);
begin
  ControlRadLine := TRadiantLine.Create(nil);
  ControlRadLine.Parent := FParent;
end;

procedure TFRadiantLine.Cursor(FCursor: TCursor);
begin
  ControlRadLine.Cursor := FCursor;
end;

procedure TFRadiantLine.Left(FLeft: Single);
begin
  ControlRadLine.Position.X := FLeft;
end;

procedure TFRadiantLine.Top(FTop: Single);
begin
  ControlRadLine.Position.Y := FTop;
end;

procedure TFRadiantLine.Height(FHeight: Single);
begin
  ControlRadLine.Height := FHeight;
end;

procedure TFRadiantLine.Width(FWidth: Single);
begin
  ControlRadLine.Width := FWidth;
end;

procedure TFRadiantLine.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadLine.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantLine.Position(X, Y: Single);
begin
  ControlRadLine.Position.X := X;
  ControlRadLine.Position.Y := Y;
end;

procedure TFRadiantLine.Align(Al: TAlignLayout);
begin
  ControlRadLine.Align := Al;
end;

procedure TFRadiantLine.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadLine.Margins.Left := FLeft;
  ControlRadLine.Margins.Top := FTop;
  ControlRadLine.Margins.Right := FRight;
  ControlRadLine.Margins.Bottom := FBottom;
end;

procedure TFRadiantLine.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadLine.Padding.Left := FLeft;
  ControlRadLine.Padding.Top := FTop;
  ControlRadLine.Padding.Right := FRight;
  ControlRadLine.Padding.Bottom := FBottom;
end;

procedure TFRadiantLine.SetHint(const FText: WideString);
begin
  ControlRadLine.ShowHint := True;
  ControlRadLine.Hint := FText;
end;

procedure TFRadiantLine.SetClipChildren(FValue: Boolean);
begin
  ControlRadLine.ClipChildren := FValue;
end;

procedure TFRadiantLine.SetClipParent(FValue: Boolean);
begin
  ControlRadLine.ClipParent := FValue;
end;

procedure TFRadiantLine.BringToFront;
begin
  ControlRadLine.BringToFront;
end;

procedure TFRadiantLine.SendToBack;
begin
  ControlRadLine.SendToBack;
end;

procedure TFRadiantLine.SetTag(FTag: Integer);
begin
  ControlRadLine.Tag := FTag;
end;

procedure TFRadiantLine.FillColor(FColor: TAlphaColor);
begin
  ControlRadLine.Fill.Kind := TBrushKind.Solid;
  ControlRadLine.Fill.Color := FColor;
end;

procedure TFRadiantLine.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadLine.Fill.Kind := TBrushKind.Bitmap;
  ControlRadLine.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadLine.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantLine.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadLine.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadLine.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantLine.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadLine.Fill.Kind := TBrushKind.Gradient;
  ControlRadLine.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadLine.Fill, FAngle);
end;

procedure TFRadiantLine.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadLine.Fill.Kind := TBrushKind.Gradient;
  ControlRadLine.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadLine.Fill, FAngle);
end;

procedure TFRadiantLine.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadLine.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadLine.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantLine.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadLine.Stroke.Kind := TBrushKind.Solid;
  ControlRadLine.Stroke.Color := FColor;
end;

procedure TFRadiantLine.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadLine.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadLine.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadLine.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantLine.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadLine.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadLine.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantLine.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadLine.Stroke.Kind := TBrushKind.Gradient;
  ControlRadLine.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadLine.Stroke, FAngle);
end;

procedure TFRadiantLine.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadLine.Stroke.Kind := TBrushKind.Gradient;
  ControlRadLine.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadLine.Stroke, FAngle);
end;

procedure TFRadiantLine.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadLine.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadLine.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantLine.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadLine.Stroke.Kind := TBrushKind.Solid;
  ControlRadLine.Stroke.Thickness := FThickness;
  ControlRadLine.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadLine.Stroke.Dash := TStrokeDash(Dash);
  ControlRadLine.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantLine.ArrowLength(FValue: Single);
begin
  ControlRadLine.ArrowLength := FValue;
end;

procedure TFRadiantLine.ArrowWidth(FValue: TRadiantArrowWidth);
begin
  ControlRadLine.ArrowWidth := FValue;
end;

procedure TFRadiantLine.LineSlope(FValue: TRadiantLineSlope);
begin
  ControlRadLine.LineSlope := FValue;
end;

procedure TFRadiantLine.ShowArrows(FValue: TRadiantShowArrows);
begin
  ControlRadLine.ShowArrows := FValue;
end;

procedure TFRadiantLine.StyleName(FValue: WideString);
begin
  ControlRadLine.StyleName := FValue;
end;

procedure TFRadiantLine.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadLine.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantLine.Opacity(FOpacity: Single);
begin
  ControlRadLine.Opacity := FOpacity;
end;

procedure TFRadiantLine.RotationAngle(FValue: Single);
begin
  ControlRadLine.RotationAngle := FValue;
end;

procedure TFRadiantLine.RotationCenter(X, Y: Single);
begin
  ControlRadLine.RotationCenter.X := X;
  ControlRadLine.RotationCenter.Y := Y;
end;

procedure TFRadiantLine.Enabled(FEnabled: Boolean);
begin
  ControlRadLine.Enabled := FEnabled;
end;

procedure TFRadiantLine.Visible(FVisible: Boolean);
begin
  ControlRadLine.Visible := FVisible;
end;

procedure TFRadiantLine.HitTest(FEnabled: Boolean);
begin
  ControlRadLine.HitTest := FEnabled;
end;

function TFRadiantLine.IsVisible: Boolean;
begin
  Result := ControlRadLine.Visible;
end;

function TFRadiantLine.GetTag: Integer;
begin
  Result := ControlRadLine.Tag;
end;

function TFRadiantLine.GetLeft: Single;
begin
  Result := ControlRadLine.Position.X;
end;

function TFRadiantLine.GetTop: Single;
begin
  Result := ControlRadLine.Position.Y;
end;

function TFRadiantLine.GetHeight: Single;
begin
  Result := ControlRadLine.Height;
end;

function TFRadiantLine.GetWidth: Single;
begin
  Result := ControlRadLine.Width;
end;

function TFRadiantLine.GetObject: TFmxObject;
begin
  Result := ControlRadLine;
end;

procedure TFRadiantLine.OnClick(Event: TNotifyEvent);
begin
  ControlRadLine.OnClick := Event;
end;

procedure TFRadiantLine.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadLine.OnMouseDown := Event;
end;

procedure TFRadiantLine.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadLine.OnMouseEnter := Event;
end;

procedure TFRadiantLine.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadLine.OnMouseLeave := Event;
end;

procedure TFRadiantLine.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadLine.OnMouseUp := Event;
end;

function TFRadiantLine.Handle: TFmxObject;
begin
  Result := ControlRadLine;
end;

// >>>>>> TFRadiantMarker <<<<<< \\
procedure TFRadiantMarker.FCreate(FParent: TFmxObject);
begin
  ControlRadMarker := TRadiantMarker.Create(nil);
  ControlRadMarker.Parent := FParent;
end;

procedure TFRadiantMarker.Cursor(FCursor: TCursor);
begin
  ControlRadMarker.Cursor := FCursor;
end;

procedure TFRadiantMarker.Left(FLeft: Single);
begin
  ControlRadMarker.Position.X := FLeft;
end;

procedure TFRadiantMarker.Top(FTop: Single);
begin
  ControlRadMarker.Position.Y := FTop;
end;

procedure TFRadiantMarker.Height(FHeight: Single);
begin
  ControlRadMarker.Height := FHeight;
end;

procedure TFRadiantMarker.Width(FWidth: Single);
begin
  ControlRadMarker.Width := FWidth;
end;

procedure TFRadiantMarker.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadMarker.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantMarker.Position(X, Y: Single);
begin
  ControlRadMarker.Position.X := X;
  ControlRadMarker.Position.Y := Y;
end;

procedure TFRadiantMarker.Align(Al: TAlignLayout);
begin
  ControlRadMarker.Align := Al;
end;

procedure TFRadiantMarker.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadMarker.Margins.Left := FLeft;
  ControlRadMarker.Margins.Top := FTop;
  ControlRadMarker.Margins.Right := FRight;
  ControlRadMarker.Margins.Bottom := FBottom;
end;

procedure TFRadiantMarker.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadMarker.Padding.Left := FLeft;
  ControlRadMarker.Padding.Top := FTop;
  ControlRadMarker.Padding.Right := FRight;
  ControlRadMarker.Padding.Bottom := FBottom;
end;

procedure TFRadiantMarker.SetHint(const FText: WideString);
begin
  ControlRadMarker.ShowHint := True;
  ControlRadMarker.Hint := FText;
end;

procedure TFRadiantMarker.SetClipChildren(FValue: Boolean);
begin
  ControlRadMarker.ClipChildren := FValue;
end;

procedure TFRadiantMarker.SetClipParent(FValue: Boolean);
begin
  ControlRadMarker.ClipParent := FValue;
end;

procedure TFRadiantMarker.BringToFront;
begin
  ControlRadMarker.BringToFront;
end;

procedure TFRadiantMarker.SendToBack;
begin
  ControlRadMarker.SendToBack;
end;

procedure TFRadiantMarker.SetTag(FTag: Integer);
begin
  ControlRadMarker.Tag := FTag;
end;

procedure TFRadiantMarker.FillColor(FColor: TAlphaColor);
begin
  ControlRadMarker.Fill.Kind := TBrushKind.Solid;
  ControlRadMarker.Fill.Color := FColor;
end;

procedure TFRadiantMarker.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadMarker.Fill.Kind := TBrushKind.Bitmap;
  ControlRadMarker.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadMarker.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantMarker.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadMarker.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadMarker.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantMarker.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadMarker.Fill.Kind := TBrushKind.Gradient;
  ControlRadMarker.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadMarker.Fill, FAngle);
end;

procedure TFRadiantMarker.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadMarker.Fill.Kind := TBrushKind.Gradient;
  ControlRadMarker.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadMarker.Fill, FAngle);
end;

procedure TFRadiantMarker.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadMarker.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadMarker.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantMarker.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadMarker.Stroke.Kind := TBrushKind.Solid;
  ControlRadMarker.Stroke.Color := FColor;
end;

procedure TFRadiantMarker.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadMarker.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadMarker.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadMarker.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantMarker.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadMarker.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadMarker.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantMarker.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadMarker.Stroke.Kind := TBrushKind.Gradient;
  ControlRadMarker.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadMarker.Stroke, FAngle);
end;

procedure TFRadiantMarker.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadMarker.Stroke.Kind := TBrushKind.Gradient;
  ControlRadMarker.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadMarker.Stroke, FAngle);
end;

procedure TFRadiantMarker.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadMarker.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadMarker.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantMarker.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadMarker.Stroke.Kind := TBrushKind.Solid;
  ControlRadMarker.Stroke.Thickness := FThickness;
  ControlRadMarker.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadMarker.Stroke.Dash := TStrokeDash(Dash);
  ControlRadMarker.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantMarker.HoleSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadMarker.HoleSize.Pixels := FPixels;
  ControlRadMarker.HoleSize.ScaleFactor := FScaleFactor;
  ControlRadMarker.HoleSize.Units := Units;
end;

procedure TFRadiantMarker.Direction(FValue: TRadiantDirection);
begin
  ControlRadMarker.Direction := FValue;
end;

procedure TFRadiantMarker.ShowHole(FValue: Boolean);
begin
  ControlRadMarker.ShowHole := FValue;
end;

procedure TFRadiantMarker.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadMarker.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantMarker.Opacity(FOpacity: Single);
begin
  ControlRadMarker.Opacity := FOpacity;
end;

procedure TFRadiantMarker.RotationAngle(FValue: Single);
begin
  ControlRadMarker.RotationAngle := FValue;
end;

procedure TFRadiantMarker.RotationCenter(X, Y: Single);
begin
  ControlRadMarker.RotationCenter.X := X;
  ControlRadMarker.RotationCenter.Y := Y;
end;

procedure TFRadiantMarker.Enabled(FEnabled: Boolean);
begin
  ControlRadMarker.Enabled := FEnabled;
end;

procedure TFRadiantMarker.Visible(FVisible: Boolean);
begin
  ControlRadMarker.Visible := FVisible;
end;

procedure TFRadiantMarker.HitTest(FEnabled: Boolean);
begin
  ControlRadMarker.HitTest := FEnabled;
end;

function TFRadiantMarker.IsVisible: Boolean;
begin
  Result := ControlRadMarker.Visible;
end;

function TFRadiantMarker.GetTag: Integer;
begin
  Result := ControlRadMarker.Tag;
end;

function TFRadiantMarker.GetLeft: Single;
begin
  Result := ControlRadMarker.Position.X;
end;

function TFRadiantMarker.GetTop: Single;
begin
  Result := ControlRadMarker.Position.Y;
end;

function TFRadiantMarker.GetHeight: Single;
begin
  Result := ControlRadMarker.Height;
end;

function TFRadiantMarker.GetWidth: Single;
begin
  Result := ControlRadMarker.Width;
end;

function TFRadiantMarker.GetObject: TFmxObject;
begin
  Result := ControlRadMarker;
end;

procedure TFRadiantMarker.OnClick(Event: TNotifyEvent);
begin
  ControlRadMarker.OnClick := Event;
end;

procedure TFRadiantMarker.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadMarker.OnMouseDown := Event;
end;

procedure TFRadiantMarker.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadMarker.OnMouseEnter := Event;
end;

procedure TFRadiantMarker.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadMarker.OnMouseLeave := Event;
end;

procedure TFRadiantMarker.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadMarker.OnMouseUp := Event;
end;

function TFRadiantMarker.Handle: TFmxObject;
begin
  Result := ControlRadMarker;
end;

// >>>>>> TFRadiantMinus <<<<<< \\
procedure TFRadiantMinus.FCreate(FParent: TFmxObject);
begin
  ControlRadMinus := TRadiantMinus.Create(nil);
  ControlRadMinus.Parent := FParent;
end;

procedure TFRadiantMinus.Cursor(FCursor: TCursor);
begin
  ControlRadMinus.Cursor := FCursor;
end;

procedure TFRadiantMinus.Left(FLeft: Single);
begin
  ControlRadMinus.Position.X := FLeft;
end;

procedure TFRadiantMinus.Top(FTop: Single);
begin
  ControlRadMinus.Position.Y := FTop;
end;

procedure TFRadiantMinus.Height(FHeight: Single);
begin
  ControlRadMinus.Height := FHeight;
end;

procedure TFRadiantMinus.Width(FWidth: Single);
begin
  ControlRadMinus.Width := FWidth;
end;

procedure TFRadiantMinus.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadMinus.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantMinus.Position(X, Y: Single);
begin
  ControlRadMinus.Position.X := X;
  ControlRadMinus.Position.Y := Y;
end;

procedure TFRadiantMinus.Align(Al: TAlignLayout);
begin
  ControlRadMinus.Align := Al;
end;

procedure TFRadiantMinus.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadMinus.Margins.Left := FLeft;
  ControlRadMinus.Margins.Top := FTop;
  ControlRadMinus.Margins.Right := FRight;
  ControlRadMinus.Margins.Bottom := FBottom;
end;

procedure TFRadiantMinus.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadMinus.Padding.Left := FLeft;
  ControlRadMinus.Padding.Top := FTop;
  ControlRadMinus.Padding.Right := FRight;
  ControlRadMinus.Padding.Bottom := FBottom;
end;

procedure TFRadiantMinus.SetHint(const FText: WideString);
begin
  ControlRadMinus.ShowHint := True;
  ControlRadMinus.Hint := FText;
end;

procedure TFRadiantMinus.SetClipChildren(FValue: Boolean);
begin
  ControlRadMinus.ClipChildren := FValue;
end;

procedure TFRadiantMinus.SetClipParent(FValue: Boolean);
begin
  ControlRadMinus.ClipParent := FValue;
end;

procedure TFRadiantMinus.BringToFront;
begin
  ControlRadMinus.BringToFront;
end;

procedure TFRadiantMinus.SendToBack;
begin
  ControlRadMinus.SendToBack;
end;

procedure TFRadiantMinus.SetTag(FTag: Integer);
begin
  ControlRadMinus.Tag := FTag;
end;

procedure TFRadiantMinus.FillColor(FColor: TAlphaColor);
begin
  ControlRadMinus.Fill.Kind := TBrushKind.Solid;
  ControlRadMinus.Fill.Color := FColor;
end;

procedure TFRadiantMinus.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadMinus.Fill.Kind := TBrushKind.Bitmap;
  ControlRadMinus.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadMinus.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantMinus.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadMinus.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadMinus.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantMinus.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadMinus.Fill.Kind := TBrushKind.Gradient;
  ControlRadMinus.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadMinus.Fill, FAngle);
end;

procedure TFRadiantMinus.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadMinus.Fill.Kind := TBrushKind.Gradient;
  ControlRadMinus.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadMinus.Fill, FAngle);
end;

procedure TFRadiantMinus.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadMinus.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadMinus.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantMinus.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadMinus.Stroke.Kind := TBrushKind.Solid;
  ControlRadMinus.Stroke.Color := FColor;
end;

procedure TFRadiantMinus.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadMinus.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadMinus.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadMinus.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantMinus.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadMinus.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadMinus.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantMinus.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadMinus.Stroke.Kind := TBrushKind.Gradient;
  ControlRadMinus.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadMinus.Stroke, FAngle);
end;

procedure TFRadiantMinus.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadMinus.Stroke.Kind := TBrushKind.Gradient;
  ControlRadMinus.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadMinus.Stroke, FAngle);
end;

procedure TFRadiantMinus.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadMinus.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadMinus.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantMinus.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadMinus.Stroke.Kind := TBrushKind.Solid;
  ControlRadMinus.Stroke.Thickness := FThickness;
  ControlRadMinus.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadMinus.Stroke.Dash := TStrokeDash(Dash);
  ControlRadMinus.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantMinus.BarSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadMinus.BarSize.Pixels := FPixels;
  ControlRadMinus.BarSize.ScaleFactor := FScaleFactor;
  ControlRadMinus.BarSize.Units := Units;
end;

procedure TFRadiantMinus.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadMinus.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantMinus.Opacity(FOpacity: Single);
begin
  ControlRadMinus.Opacity := FOpacity;
end;

procedure TFRadiantMinus.RotationAngle(FValue: Single);
begin
  ControlRadMinus.RotationAngle := FValue;
end;

procedure TFRadiantMinus.RotationCenter(X, Y: Single);
begin
  ControlRadMinus.RotationCenter.X := X;
  ControlRadMinus.RotationCenter.Y := Y;
end;

procedure TFRadiantMinus.Enabled(FEnabled: Boolean);
begin
  ControlRadMinus.Enabled := FEnabled;
end;

procedure TFRadiantMinus.Visible(FVisible: Boolean);
begin
  ControlRadMinus.Visible := FVisible;
end;

procedure TFRadiantMinus.HitTest(FEnabled: Boolean);
begin
  ControlRadMinus.HitTest := FEnabled;
end;

function TFRadiantMinus.IsVisible: Boolean;
begin
  Result := ControlRadMinus.Visible;
end;

function TFRadiantMinus.GetTag: Integer;
begin
  Result := ControlRadMinus.Tag;
end;

function TFRadiantMinus.GetLeft: Single;
begin
  Result := ControlRadMinus.Position.X;
end;

function TFRadiantMinus.GetTop: Single;
begin
  Result := ControlRadMinus.Position.Y;
end;

function TFRadiantMinus.GetHeight: Single;
begin
  Result := ControlRadMinus.Height;
end;

function TFRadiantMinus.GetWidth: Single;
begin
  Result := ControlRadMinus.Width;
end;

function TFRadiantMinus.GetObject: TFmxObject;
begin
  Result := ControlRadMinus;
end;

procedure TFRadiantMinus.OnClick(Event: TNotifyEvent);
begin
  ControlRadMinus.OnClick := Event;
end;

procedure TFRadiantMinus.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadMinus.OnMouseDown := Event;
end;

procedure TFRadiantMinus.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadMinus.OnMouseEnter := Event;
end;

procedure TFRadiantMinus.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadMinus.OnMouseLeave := Event;
end;

procedure TFRadiantMinus.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadMinus.OnMouseUp := Event;
end;

function TFRadiantMinus.Handle: TFmxObject;
begin
  Result := ControlRadMinus;
end;

// >>>>>> TFRadiantNoRing <<<<<< \\
procedure TFRadiantNoRing.FCreate(FParent: TFmxObject);
begin
  ControlRadNoRing := TRadiantNoRing.Create(nil);
  ControlRadNoRing.Parent := FParent;
end;

procedure TFRadiantNoRing.Cursor(FCursor: TCursor);
begin
  ControlRadNoRing.Cursor := FCursor;
end;

procedure TFRadiantNoRing.Left(FLeft: Single);
begin
  ControlRadNoRing.Position.X := FLeft;
end;

procedure TFRadiantNoRing.Top(FTop: Single);
begin
  ControlRadNoRing.Position.Y := FTop;
end;

procedure TFRadiantNoRing.Height(FHeight: Single);
begin
  ControlRadNoRing.Height := FHeight;
end;

procedure TFRadiantNoRing.Width(FWidth: Single);
begin
  ControlRadNoRing.Width := FWidth;
end;

procedure TFRadiantNoRing.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadNoRing.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantNoRing.Position(X, Y: Single);
begin
  ControlRadNoRing.Position.X := X;
  ControlRadNoRing.Position.Y := Y;
end;

procedure TFRadiantNoRing.Align(Al: TAlignLayout);
begin
  ControlRadNoRing.Align := Al;
end;

procedure TFRadiantNoRing.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadNoRing.Margins.Left := FLeft;
  ControlRadNoRing.Margins.Top := FTop;
  ControlRadNoRing.Margins.Right := FRight;
  ControlRadNoRing.Margins.Bottom := FBottom;
end;

procedure TFRadiantNoRing.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadNoRing.Padding.Left := FLeft;
  ControlRadNoRing.Padding.Top := FTop;
  ControlRadNoRing.Padding.Right := FRight;
  ControlRadNoRing.Padding.Bottom := FBottom;
end;

procedure TFRadiantNoRing.SetHint(const FText: WideString);
begin
  ControlRadNoRing.ShowHint := True;
  ControlRadNoRing.Hint := FText;
end;

procedure TFRadiantNoRing.SetClipChildren(FValue: Boolean);
begin
  ControlRadNoRing.ClipChildren := FValue;
end;

procedure TFRadiantNoRing.SetClipParent(FValue: Boolean);
begin
  ControlRadNoRing.ClipParent := FValue;
end;

procedure TFRadiantNoRing.BringToFront;
begin
  ControlRadNoRing.BringToFront;
end;

procedure TFRadiantNoRing.SendToBack;
begin
  ControlRadNoRing.SendToBack;
end;

procedure TFRadiantNoRing.SetTag(FTag: Integer);
begin
  ControlRadNoRing.Tag := FTag;
end;

procedure TFRadiantNoRing.FillColor(FColor: TAlphaColor);
begin
  ControlRadNoRing.Fill.Kind := TBrushKind.Solid;
  ControlRadNoRing.Fill.Color := FColor;
end;

procedure TFRadiantNoRing.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadNoRing.Fill.Kind := TBrushKind.Bitmap;
  ControlRadNoRing.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadNoRing.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantNoRing.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadNoRing.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadNoRing.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantNoRing.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadNoRing.Fill.Kind := TBrushKind.Gradient;
  ControlRadNoRing.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadNoRing.Fill, FAngle);
end;

procedure TFRadiantNoRing.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadNoRing.Fill.Kind := TBrushKind.Gradient;
  ControlRadNoRing.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadNoRing.Fill, FAngle);
end;

procedure TFRadiantNoRing.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadNoRing.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadNoRing.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantNoRing.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadNoRing.Stroke.Kind := TBrushKind.Solid;
  ControlRadNoRing.Stroke.Color := FColor;
end;

procedure TFRadiantNoRing.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadNoRing.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadNoRing.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadNoRing.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantNoRing.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadNoRing.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadNoRing.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantNoRing.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadNoRing.Stroke.Kind := TBrushKind.Gradient;
  ControlRadNoRing.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadNoRing.Stroke, FAngle);
end;

procedure TFRadiantNoRing.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadNoRing.Stroke.Kind := TBrushKind.Gradient;
  ControlRadNoRing.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadNoRing.Stroke, FAngle);
end;

procedure TFRadiantNoRing.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadNoRing.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadNoRing.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantNoRing.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadNoRing.Stroke.Kind := TBrushKind.Solid;
  ControlRadNoRing.Stroke.Thickness := FThickness;
  ControlRadNoRing.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadNoRing.Stroke.Dash := TStrokeDash(Dash);
  ControlRadNoRing.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantNoRing.RingSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadNoRing.RingSize.Pixels := FPixels;
  ControlRadNoRing.RingSize.ScaleFactor := FScaleFactor;
  ControlRadNoRing.RingSize.Units := Units;
end;

procedure TFRadiantNoRing.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadNoRing.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantNoRing.Opacity(FOpacity: Single);
begin
  ControlRadNoRing.Opacity := FOpacity;
end;

procedure TFRadiantNoRing.RotationAngle(FValue: Single);
begin
  ControlRadNoRing.RotationAngle := FValue;
end;

procedure TFRadiantNoRing.RotationCenter(X, Y: Single);
begin
  ControlRadNoRing.RotationCenter.X := X;
  ControlRadNoRing.RotationCenter.Y := Y;
end;

procedure TFRadiantNoRing.Enabled(FEnabled: Boolean);
begin
  ControlRadNoRing.Enabled := FEnabled;
end;

procedure TFRadiantNoRing.Visible(FVisible: Boolean);
begin
  ControlRadNoRing.Visible := FVisible;
end;

procedure TFRadiantNoRing.HitTest(FEnabled: Boolean);
begin
  ControlRadNoRing.HitTest := FEnabled;
end;

function TFRadiantNoRing.IsVisible: Boolean;
begin
  Result := ControlRadNoRing.Visible;
end;

function TFRadiantNoRing.GetTag: Integer;
begin
  Result := ControlRadNoRing.Tag;
end;

function TFRadiantNoRing.GetLeft: Single;
begin
  Result := ControlRadNoRing.Position.X;
end;

function TFRadiantNoRing.GetTop: Single;
begin
  Result := ControlRadNoRing.Position.Y;
end;

function TFRadiantNoRing.GetHeight: Single;
begin
  Result := ControlRadNoRing.Height;
end;

function TFRadiantNoRing.GetWidth: Single;
begin
  Result := ControlRadNoRing.Width;
end;

function TFRadiantNoRing.GetObject: TFmxObject;
begin
  Result := ControlRadNoRing;
end;

procedure TFRadiantNoRing.OnClick(Event: TNotifyEvent);
begin
  ControlRadNoRing.OnClick := Event;
end;

procedure TFRadiantNoRing.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadNoRing.OnMouseDown := Event;
end;

procedure TFRadiantNoRing.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadNoRing.OnMouseEnter := Event;
end;

procedure TFRadiantNoRing.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadNoRing.OnMouseLeave := Event;
end;

procedure TFRadiantNoRing.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadNoRing.OnMouseUp := Event;
end;

function TFRadiantNoRing.Handle: TFmxObject;
begin
  Result := ControlRadNoRing;
end;

// >>>>>> TFRadiantOctagon <<<<<< \\
procedure TFRadiantOctagon.FCreate(FParent: TFmxObject);
begin
  ControlRadOctagon := TRadiantOctagon.Create(nil);
  ControlRadOctagon.Parent := FParent;
end;

procedure TFRadiantOctagon.Cursor(FCursor: TCursor);
begin
  ControlRadOctagon.Cursor := FCursor;
end;

procedure TFRadiantOctagon.Left(FLeft: Single);
begin
  ControlRadOctagon.Position.X := FLeft;
end;

procedure TFRadiantOctagon.Top(FTop: Single);
begin
  ControlRadOctagon.Position.Y := FTop;
end;

procedure TFRadiantOctagon.Height(FHeight: Single);
begin
  ControlRadOctagon.Height := FHeight;
end;

procedure TFRadiantOctagon.Width(FWidth: Single);
begin
  ControlRadOctagon.Width := FWidth;
end;

procedure TFRadiantOctagon.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadOctagon.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantOctagon.Position(X, Y: Single);
begin
  ControlRadOctagon.Position.X := X;
  ControlRadOctagon.Position.Y := Y;
end;

procedure TFRadiantOctagon.Align(Al: TAlignLayout);
begin
  ControlRadOctagon.Align := Al;
end;

procedure TFRadiantOctagon.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadOctagon.Margins.Left := FLeft;
  ControlRadOctagon.Margins.Top := FTop;
  ControlRadOctagon.Margins.Right := FRight;
  ControlRadOctagon.Margins.Bottom := FBottom;
end;

procedure TFRadiantOctagon.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadOctagon.Padding.Left := FLeft;
  ControlRadOctagon.Padding.Top := FTop;
  ControlRadOctagon.Padding.Right := FRight;
  ControlRadOctagon.Padding.Bottom := FBottom;
end;

procedure TFRadiantOctagon.SetHint(const FText: WideString);
begin
  ControlRadOctagon.ShowHint := True;
  ControlRadOctagon.Hint := FText;
end;

procedure TFRadiantOctagon.SetClipChildren(FValue: Boolean);
begin
  ControlRadOctagon.ClipChildren := FValue;
end;

procedure TFRadiantOctagon.SetClipParent(FValue: Boolean);
begin
  ControlRadOctagon.ClipParent := FValue;
end;

procedure TFRadiantOctagon.BringToFront;
begin
  ControlRadOctagon.BringToFront;
end;

procedure TFRadiantOctagon.SendToBack;
begin
  ControlRadOctagon.SendToBack;
end;

procedure TFRadiantOctagon.SetTag(FTag: Integer);
begin
  ControlRadOctagon.Tag := FTag;
end;

procedure TFRadiantOctagon.FillColor(FColor: TAlphaColor);
begin
  ControlRadOctagon.Fill.Kind := TBrushKind.Solid;
  ControlRadOctagon.Fill.Color := FColor;
end;

procedure TFRadiantOctagon.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadOctagon.Fill.Kind := TBrushKind.Bitmap;
  ControlRadOctagon.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadOctagon.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantOctagon.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadOctagon.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadOctagon.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantOctagon.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadOctagon.Fill.Kind := TBrushKind.Gradient;
  ControlRadOctagon.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadOctagon.Fill, FAngle);
end;

procedure TFRadiantOctagon.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadOctagon.Fill.Kind := TBrushKind.Gradient;
  ControlRadOctagon.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadOctagon.Fill, FAngle);
end;

procedure TFRadiantOctagon.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadOctagon.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadOctagon.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantOctagon.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadOctagon.Stroke.Kind := TBrushKind.Solid;
  ControlRadOctagon.Stroke.Color := FColor;
end;

procedure TFRadiantOctagon.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadOctagon.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadOctagon.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadOctagon.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantOctagon.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadOctagon.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadOctagon.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantOctagon.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadOctagon.Stroke.Kind := TBrushKind.Gradient;
  ControlRadOctagon.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadOctagon.Stroke, FAngle);
end;

procedure TFRadiantOctagon.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadOctagon.Stroke.Kind := TBrushKind.Gradient;
  ControlRadOctagon.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadOctagon.Stroke, FAngle);
end;

procedure TFRadiantOctagon.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadOctagon.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadOctagon.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantOctagon.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadOctagon.Stroke.Kind := TBrushKind.Solid;
  ControlRadOctagon.Stroke.Thickness := FThickness;
  ControlRadOctagon.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadOctagon.Stroke.Dash := TStrokeDash(Dash);
  ControlRadOctagon.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantOctagon.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadOctagon.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantOctagon.Opacity(FOpacity: Single);
begin
  ControlRadOctagon.Opacity := FOpacity;
end;

procedure TFRadiantOctagon.RotationAngle(FValue: Single);
begin
  ControlRadOctagon.RotationAngle := FValue;
end;

procedure TFRadiantOctagon.RotationCenter(X, Y: Single);
begin
  ControlRadOctagon.RotationCenter.X := X;
  ControlRadOctagon.RotationCenter.Y := Y;
end;

procedure TFRadiantOctagon.Enabled(FEnabled: Boolean);
begin
  ControlRadOctagon.Enabled := FEnabled;
end;

procedure TFRadiantOctagon.Visible(FVisible: Boolean);
begin
  ControlRadOctagon.Visible := FVisible;
end;

procedure TFRadiantOctagon.HitTest(FEnabled: Boolean);
begin
  ControlRadOctagon.HitTest := FEnabled;
end;

function TFRadiantOctagon.IsVisible: Boolean;
begin
  Result := ControlRadOctagon.Visible;
end;

function TFRadiantOctagon.GetTag: Integer;
begin
  Result := ControlRadOctagon.Tag;
end;

function TFRadiantOctagon.GetLeft: Single;
begin
  Result := ControlRadOctagon.Position.X;
end;

function TFRadiantOctagon.GetTop: Single;
begin
  Result := ControlRadOctagon.Position.Y;
end;

function TFRadiantOctagon.GetHeight: Single;
begin
  Result := ControlRadOctagon.Height;
end;

function TFRadiantOctagon.GetWidth: Single;
begin
  Result := ControlRadOctagon.Width;
end;

function TFRadiantOctagon.GetObject: TFmxObject;
begin
  Result := ControlRadOctagon;
end;

procedure TFRadiantOctagon.OnClick(Event: TNotifyEvent);
begin
  ControlRadOctagon.OnClick := Event;
end;

procedure TFRadiantOctagon.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadOctagon.OnMouseDown := Event;
end;

procedure TFRadiantOctagon.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadOctagon.OnMouseEnter := Event;
end;

procedure TFRadiantOctagon.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadOctagon.OnMouseLeave := Event;
end;

procedure TFRadiantOctagon.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadOctagon.OnMouseUp := Event;
end;

function TFRadiantOctagon.Handle: TFmxObject;
begin
  Result := ControlRadOctagon;
end;

// >>>>>> TFRadiantParallelogram <<<<<< \\
procedure TFRadiantParallelogram.FCreate(FParent: TFmxObject);
begin
  ControlRadParallelogram := TRadiantParallelogram.Create(nil);
  ControlRadParallelogram.Parent := FParent;
end;

procedure TFRadiantParallelogram.Cursor(FCursor: TCursor);
begin
  ControlRadParallelogram.Cursor := FCursor;
end;

procedure TFRadiantParallelogram.Left(FLeft: Single);
begin
  ControlRadParallelogram.Position.X := FLeft;
end;

procedure TFRadiantParallelogram.Top(FTop: Single);
begin
  ControlRadParallelogram.Position.Y := FTop;
end;

procedure TFRadiantParallelogram.Height(FHeight: Single);
begin
  ControlRadParallelogram.Height := FHeight;
end;

procedure TFRadiantParallelogram.Width(FWidth: Single);
begin
  ControlRadParallelogram.Width := FWidth;
end;

procedure TFRadiantParallelogram.SetBounds(FLeft, FTop, FWidth,
  FHeight: Single);
begin
  ControlRadParallelogram.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantParallelogram.Position(X, Y: Single);
begin
  ControlRadParallelogram.Position.X := X;
  ControlRadParallelogram.Position.Y := Y;
end;

procedure TFRadiantParallelogram.Align(Al: TAlignLayout);
begin
  ControlRadParallelogram.Align := Al;
end;

procedure TFRadiantParallelogram.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadParallelogram.Margins.Left := FLeft;
  ControlRadParallelogram.Margins.Top := FTop;
  ControlRadParallelogram.Margins.Right := FRight;
  ControlRadParallelogram.Margins.Bottom := FBottom;
end;

procedure TFRadiantParallelogram.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadParallelogram.Padding.Left := FLeft;
  ControlRadParallelogram.Padding.Top := FTop;
  ControlRadParallelogram.Padding.Right := FRight;
  ControlRadParallelogram.Padding.Bottom := FBottom;
end;

procedure TFRadiantParallelogram.SetHint(const FText: WideString);
begin
  ControlRadParallelogram.ShowHint := True;
  ControlRadParallelogram.Hint := FText;
end;

procedure TFRadiantParallelogram.SetClipChildren(FValue: Boolean);
begin
  ControlRadParallelogram.ClipChildren := FValue;
end;

procedure TFRadiantParallelogram.SetClipParent(FValue: Boolean);
begin
  ControlRadParallelogram.ClipParent := FValue;
end;

procedure TFRadiantParallelogram.BringToFront;
begin
  ControlRadParallelogram.BringToFront;
end;

procedure TFRadiantParallelogram.SendToBack;
begin
  ControlRadParallelogram.SendToBack;
end;

procedure TFRadiantParallelogram.SetTag(FTag: Integer);
begin
  ControlRadParallelogram.Tag := FTag;
end;

procedure TFRadiantParallelogram.FillColor(FColor: TAlphaColor);
begin
  ControlRadParallelogram.Fill.Kind := TBrushKind.Solid;
  ControlRadParallelogram.Fill.Color := FColor;
end;

procedure TFRadiantParallelogram.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadParallelogram.Fill.Kind := TBrushKind.Bitmap;
  ControlRadParallelogram.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadParallelogram.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantParallelogram.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadParallelogram.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadParallelogram.Fill, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantParallelogram.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadParallelogram.Fill.Kind := TBrushKind.Gradient;
  ControlRadParallelogram.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadParallelogram.Fill, FAngle);
end;

procedure TFRadiantParallelogram.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadParallelogram.Fill.Kind := TBrushKind.Gradient;
  ControlRadParallelogram.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadParallelogram.Fill, FAngle);
end;

procedure TFRadiantParallelogram.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadParallelogram.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadParallelogram.Fill, X1,
    Y1, X2, Y2);
end;

procedure TFRadiantParallelogram.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadParallelogram.Stroke.Kind := TBrushKind.Solid;
  ControlRadParallelogram.Stroke.Color := FColor;
end;

procedure TFRadiantParallelogram.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadParallelogram.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadParallelogram.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadParallelogram.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantParallelogram.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadParallelogram.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadParallelogram.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantParallelogram.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadParallelogram.Stroke.Kind := TBrushKind.Gradient;
  ControlRadParallelogram.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadParallelogram.Stroke, FAngle);
end;

procedure TFRadiantParallelogram.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadParallelogram.Stroke.Kind := TBrushKind.Gradient;
  ControlRadParallelogram.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadParallelogram.Stroke, FAngle);
end;

procedure TFRadiantParallelogram.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadParallelogram.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadParallelogram.Stroke, X1,
    Y1, X2, Y2);
end;

procedure TFRadiantParallelogram.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadParallelogram.Stroke.Kind := TBrushKind.Solid;
  ControlRadParallelogram.Stroke.Thickness := FThickness;
  ControlRadParallelogram.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadParallelogram.Stroke.Dash := TStrokeDash(Dash);
  ControlRadParallelogram.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantParallelogram.SlantAngle(FValue: Single);
begin
  ControlRadParallelogram.SlantAngle := FValue;
end;

procedure TFRadiantParallelogram.SlantDirection(FValue: TRadiantDirection);
begin
  ControlRadParallelogram.SlantDirection := FValue;
end;

procedure TFRadiantParallelogram.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadParallelogram.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantParallelogram.Opacity(FOpacity: Single);
begin
  ControlRadParallelogram.Opacity := FOpacity;
end;

procedure TFRadiantParallelogram.RotationAngle(FValue: Single);
begin
  ControlRadParallelogram.RotationAngle := FValue;
end;

procedure TFRadiantParallelogram.RotationCenter(X, Y: Single);
begin
  ControlRadParallelogram.RotationCenter.X := X;
  ControlRadParallelogram.RotationCenter.Y := Y;
end;

procedure TFRadiantParallelogram.Enabled(FEnabled: Boolean);
begin
  ControlRadParallelogram.Enabled := FEnabled;
end;

procedure TFRadiantParallelogram.Visible(FVisible: Boolean);
begin
  ControlRadParallelogram.Visible := FVisible;
end;

procedure TFRadiantParallelogram.HitTest(FEnabled: Boolean);
begin
  ControlRadParallelogram.HitTest := FEnabled;
end;

function TFRadiantParallelogram.IsVisible: Boolean;
begin
  Result := ControlRadParallelogram.Visible;
end;

function TFRadiantParallelogram.GetTag: Integer;
begin
  Result := ControlRadParallelogram.Tag;
end;

function TFRadiantParallelogram.GetLeft: Single;
begin
  Result := ControlRadParallelogram.Position.X;
end;

function TFRadiantParallelogram.GetTop: Single;
begin
  Result := ControlRadParallelogram.Position.Y;
end;

function TFRadiantParallelogram.GetHeight: Single;
begin
  Result := ControlRadParallelogram.Height;
end;

function TFRadiantParallelogram.GetWidth: Single;
begin
  Result := ControlRadParallelogram.Width;
end;

function TFRadiantParallelogram.GetObject: TFmxObject;
begin
  Result := ControlRadParallelogram;
end;

procedure TFRadiantParallelogram.OnClick(Event: TNotifyEvent);
begin
  ControlRadParallelogram.OnClick := Event;
end;

procedure TFRadiantParallelogram.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadParallelogram.OnMouseDown := Event;
end;

procedure TFRadiantParallelogram.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadParallelogram.OnMouseEnter := Event;
end;

procedure TFRadiantParallelogram.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadParallelogram.OnMouseLeave := Event;
end;

procedure TFRadiantParallelogram.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadParallelogram.OnMouseUp := Event;
end;

function TFRadiantParallelogram.Handle: TFmxObject;
begin
  Result := ControlRadParallelogram;
end;

// >>>>>> TFRadiantPentagon <<<<<< \\
procedure TFRadiantPentagon.FCreate(FParent: TFmxObject);
begin
  ControlRadPentagon := TRadiantPentagon.Create(nil);
  ControlRadPentagon.Parent := FParent;
end;

procedure TFRadiantPentagon.Cursor(FCursor: TCursor);
begin
  ControlRadPentagon.Cursor := FCursor;
end;

procedure TFRadiantPentagon.Left(FLeft: Single);
begin
  ControlRadPentagon.Position.X := FLeft;
end;

procedure TFRadiantPentagon.Top(FTop: Single);
begin
  ControlRadPentagon.Position.Y := FTop;
end;

procedure TFRadiantPentagon.Height(FHeight: Single);
begin
  ControlRadPentagon.Height := FHeight;
end;

procedure TFRadiantPentagon.Width(FWidth: Single);
begin
  ControlRadPentagon.Width := FWidth;
end;

procedure TFRadiantPentagon.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadPentagon.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantPentagon.Position(X, Y: Single);
begin
  ControlRadPentagon.Position.X := X;
  ControlRadPentagon.Position.Y := Y;
end;

procedure TFRadiantPentagon.Align(Al: TAlignLayout);
begin
  ControlRadPentagon.Align := Al;
end;

procedure TFRadiantPentagon.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadPentagon.Margins.Left := FLeft;
  ControlRadPentagon.Margins.Top := FTop;
  ControlRadPentagon.Margins.Right := FRight;
  ControlRadPentagon.Margins.Bottom := FBottom;
end;

procedure TFRadiantPentagon.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadPentagon.Padding.Left := FLeft;
  ControlRadPentagon.Padding.Top := FTop;
  ControlRadPentagon.Padding.Right := FRight;
  ControlRadPentagon.Padding.Bottom := FBottom;
end;

procedure TFRadiantPentagon.SetHint(const FText: WideString);
begin
  ControlRadPentagon.ShowHint := True;
  ControlRadPentagon.Hint := FText;
end;

procedure TFRadiantPentagon.SetClipChildren(FValue: Boolean);
begin
  ControlRadPentagon.ClipChildren := FValue;
end;

procedure TFRadiantPentagon.SetClipParent(FValue: Boolean);
begin
  ControlRadPentagon.ClipParent := FValue;
end;

procedure TFRadiantPentagon.BringToFront;
begin
  ControlRadPentagon.BringToFront;
end;

procedure TFRadiantPentagon.SendToBack;
begin
  ControlRadPentagon.SendToBack;
end;

procedure TFRadiantPentagon.SetTag(FTag: Integer);
begin
  ControlRadPentagon.Tag := FTag;
end;

procedure TFRadiantPentagon.FillColor(FColor: TAlphaColor);
begin
  ControlRadPentagon.Fill.Kind := TBrushKind.Solid;
  ControlRadPentagon.Fill.Color := FColor;
end;

procedure TFRadiantPentagon.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadPentagon.Fill.Kind := TBrushKind.Bitmap;
  ControlRadPentagon.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadPentagon.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantPentagon.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadPentagon.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadPentagon.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantPentagon.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadPentagon.Fill.Kind := TBrushKind.Gradient;
  ControlRadPentagon.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadPentagon.Fill, FAngle);
end;

procedure TFRadiantPentagon.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadPentagon.Fill.Kind := TBrushKind.Gradient;
  ControlRadPentagon.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadPentagon.Fill, FAngle);
end;

procedure TFRadiantPentagon.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadPentagon.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadPentagon.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantPentagon.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadPentagon.Stroke.Kind := TBrushKind.Solid;
  ControlRadPentagon.Stroke.Color := FColor;
end;

procedure TFRadiantPentagon.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadPentagon.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadPentagon.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadPentagon.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantPentagon.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadPentagon.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadPentagon.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantPentagon.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadPentagon.Stroke.Kind := TBrushKind.Gradient;
  ControlRadPentagon.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadPentagon.Stroke, FAngle);
end;

procedure TFRadiantPentagon.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadPentagon.Stroke.Kind := TBrushKind.Gradient;
  ControlRadPentagon.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadPentagon.Stroke, FAngle);
end;

procedure TFRadiantPentagon.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadPentagon.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadPentagon.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantPentagon.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadPentagon.Stroke.Kind := TBrushKind.Solid;
  ControlRadPentagon.Stroke.Thickness := FThickness;
  ControlRadPentagon.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadPentagon.Stroke.Dash := TStrokeDash(Dash);
  ControlRadPentagon.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantPentagon.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadPentagon.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantPentagon.Opacity(FOpacity: Single);
begin
  ControlRadPentagon.Opacity := FOpacity;
end;

procedure TFRadiantPentagon.RotationAngle(FValue: Single);
begin
  ControlRadPentagon.RotationAngle := FValue;
end;

procedure TFRadiantPentagon.RotationCenter(X, Y: Single);
begin
  ControlRadPentagon.RotationCenter.X := X;
  ControlRadPentagon.RotationCenter.Y := Y;
end;

procedure TFRadiantPentagon.Enabled(FEnabled: Boolean);
begin
  ControlRadPentagon.Enabled := FEnabled;
end;

procedure TFRadiantPentagon.Visible(FVisible: Boolean);
begin
  ControlRadPentagon.Visible := FVisible;
end;

procedure TFRadiantPentagon.HitTest(FEnabled: Boolean);
begin
  ControlRadPentagon.HitTest := FEnabled;
end;

function TFRadiantPentagon.IsVisible: Boolean;
begin
  Result := ControlRadPentagon.Visible;
end;

function TFRadiantPentagon.GetTag: Integer;
begin
  Result := ControlRadPentagon.Tag;
end;

function TFRadiantPentagon.GetLeft: Single;
begin
  Result := ControlRadPentagon.Position.X;
end;

function TFRadiantPentagon.GetTop: Single;
begin
  Result := ControlRadPentagon.Position.Y;
end;

function TFRadiantPentagon.GetHeight: Single;
begin
  Result := ControlRadPentagon.Height;
end;

function TFRadiantPentagon.GetWidth: Single;
begin
  Result := ControlRadPentagon.Width;
end;

function TFRadiantPentagon.GetObject: TFmxObject;
begin
  Result := ControlRadPentagon;
end;

procedure TFRadiantPentagon.OnClick(Event: TNotifyEvent);
begin
  ControlRadPentagon.OnClick := Event;
end;

procedure TFRadiantPentagon.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadPentagon.OnMouseDown := Event;
end;

procedure TFRadiantPentagon.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadPentagon.OnMouseEnter := Event;
end;

procedure TFRadiantPentagon.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadPentagon.OnMouseLeave := Event;
end;

procedure TFRadiantPentagon.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadPentagon.OnMouseUp := Event;
end;

function TFRadiantPentagon.Handle: TFmxObject;
begin
  Result := ControlRadPentagon;
end;

// >>>>>> TFRadiantPlus <<<<<< \\
procedure TFRadiantPlus.FCreate(FParent: TFmxObject);
begin
  ControlRadPlus := TRadiantPlus.Create(nil);
  ControlRadPlus.Parent := FParent;
end;

procedure TFRadiantPlus.Cursor(FCursor: TCursor);
begin
  ControlRadPlus.Cursor := FCursor;
end;

procedure TFRadiantPlus.Left(FLeft: Single);
begin
  ControlRadPlus.Position.X := FLeft;
end;

procedure TFRadiantPlus.Top(FTop: Single);
begin
  ControlRadPlus.Position.Y := FTop;
end;

procedure TFRadiantPlus.Height(FHeight: Single);
begin
  ControlRadPlus.Height := FHeight;
end;

procedure TFRadiantPlus.Width(FWidth: Single);
begin
  ControlRadPlus.Width := FWidth;
end;

procedure TFRadiantPlus.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadPlus.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantPlus.Position(X, Y: Single);
begin
  ControlRadPlus.Position.X := X;
  ControlRadPlus.Position.Y := Y;
end;

procedure TFRadiantPlus.Align(Al: TAlignLayout);
begin
  ControlRadPlus.Align := Al;
end;

procedure TFRadiantPlus.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadPlus.Margins.Left := FLeft;
  ControlRadPlus.Margins.Top := FTop;
  ControlRadPlus.Margins.Right := FRight;
  ControlRadPlus.Margins.Bottom := FBottom;
end;

procedure TFRadiantPlus.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadPlus.Padding.Left := FLeft;
  ControlRadPlus.Padding.Top := FTop;
  ControlRadPlus.Padding.Right := FRight;
  ControlRadPlus.Padding.Bottom := FBottom;
end;

procedure TFRadiantPlus.SetHint(const FText: WideString);
begin
  ControlRadPlus.ShowHint := True;
  ControlRadPlus.Hint := FText;
end;

procedure TFRadiantPlus.SetClipChildren(FValue: Boolean);
begin
  ControlRadPlus.ClipChildren := FValue;
end;

procedure TFRadiantPlus.SetClipParent(FValue: Boolean);
begin
  ControlRadPlus.ClipParent := FValue;
end;

procedure TFRadiantPlus.BringToFront;
begin
  ControlRadPlus.BringToFront;
end;

procedure TFRadiantPlus.SendToBack;
begin
  ControlRadPlus.SendToBack;
end;

procedure TFRadiantPlus.SetTag(FTag: Integer);
begin
  ControlRadPlus.Tag := FTag;
end;

procedure TFRadiantPlus.FillColor(FColor: TAlphaColor);
begin
  ControlRadPlus.Fill.Kind := TBrushKind.Solid;
  ControlRadPlus.Fill.Color := FColor;
end;

procedure TFRadiantPlus.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadPlus.Fill.Kind := TBrushKind.Bitmap;
  ControlRadPlus.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadPlus.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantPlus.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadPlus.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadPlus.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantPlus.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadPlus.Fill.Kind := TBrushKind.Gradient;
  ControlRadPlus.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadPlus.Fill, FAngle);
end;

procedure TFRadiantPlus.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadPlus.Fill.Kind := TBrushKind.Gradient;
  ControlRadPlus.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadPlus.Fill, FAngle);
end;

procedure TFRadiantPlus.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadPlus.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadPlus.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantPlus.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadPlus.Stroke.Kind := TBrushKind.Solid;
  ControlRadPlus.Stroke.Color := FColor;
end;

procedure TFRadiantPlus.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadPlus.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadPlus.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadPlus.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantPlus.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadPlus.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadPlus.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantPlus.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadPlus.Stroke.Kind := TBrushKind.Gradient;
  ControlRadPlus.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadPlus.Stroke, FAngle);
end;

procedure TFRadiantPlus.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadPlus.Stroke.Kind := TBrushKind.Gradient;
  ControlRadPlus.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadPlus.Stroke, FAngle);
end;

procedure TFRadiantPlus.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadPlus.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadPlus.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantPlus.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadPlus.Stroke.Kind := TBrushKind.Solid;
  ControlRadPlus.Stroke.Thickness := FThickness;
  ControlRadPlus.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadPlus.Stroke.Dash := TStrokeDash(Dash);
  ControlRadPlus.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantPlus.BarSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadPlus.BarSize.Pixels := FPixels;
  ControlRadPlus.BarSize.ScaleFactor := FScaleFactor;
  ControlRadPlus.BarSize.Units := Units;
end;

procedure TFRadiantPlus.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadPlus.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantPlus.Opacity(FOpacity: Single);
begin
  ControlRadPlus.Opacity := FOpacity;
end;

procedure TFRadiantPlus.RotationAngle(FValue: Single);
begin
  ControlRadPlus.RotationAngle := FValue;
end;

procedure TFRadiantPlus.RotationCenter(X, Y: Single);
begin
  ControlRadPlus.RotationCenter.X := X;
  ControlRadPlus.RotationCenter.Y := Y;
end;

procedure TFRadiantPlus.Enabled(FEnabled: Boolean);
begin
  ControlRadPlus.Enabled := FEnabled;
end;

procedure TFRadiantPlus.Visible(FVisible: Boolean);
begin
  ControlRadPlus.Visible := FVisible;
end;

procedure TFRadiantPlus.HitTest(FEnabled: Boolean);
begin
  ControlRadPlus.HitTest := FEnabled;
end;

function TFRadiantPlus.IsVisible: Boolean;
begin
  Result := ControlRadPlus.Visible;
end;

function TFRadiantPlus.GetTag: Integer;
begin
  Result := ControlRadPlus.Tag;
end;

function TFRadiantPlus.GetLeft: Single;
begin
  Result := ControlRadPlus.Position.X;
end;

function TFRadiantPlus.GetTop: Single;
begin
  Result := ControlRadPlus.Position.Y;
end;

function TFRadiantPlus.GetHeight: Single;
begin
  Result := ControlRadPlus.Height;
end;

function TFRadiantPlus.GetWidth: Single;
begin
  Result := ControlRadPlus.Width;
end;

function TFRadiantPlus.GetObject: TFmxObject;
begin
  Result := ControlRadPlus;
end;

procedure TFRadiantPlus.OnClick(Event: TNotifyEvent);
begin
  ControlRadPlus.OnClick := Event;
end;

procedure TFRadiantPlus.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadPlus.OnMouseDown := Event;
end;

procedure TFRadiantPlus.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadPlus.OnMouseEnter := Event;
end;

procedure TFRadiantPlus.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadPlus.OnMouseLeave := Event;
end;

procedure TFRadiantPlus.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadPlus.OnMouseUp := Event;
end;

function TFRadiantPlus.Handle: TFmxObject;
begin
  Result := ControlRadPlus;
end;

// >>>>>> TFRadiantPointer <<<<<< \\
procedure TFRadiantPointer.FCreate(FParent: TFmxObject);
begin
  ControlRadPointer := TRadiantPointer.Create(nil);
  ControlRadPointer.Parent := FParent;
end;

procedure TFRadiantPointer.Cursor(FCursor: TCursor);
begin
  ControlRadPointer.Cursor := FCursor;
end;

procedure TFRadiantPointer.Left(FLeft: Single);
begin
  ControlRadPointer.Position.X := FLeft;
end;

procedure TFRadiantPointer.Top(FTop: Single);
begin
  ControlRadPointer.Position.Y := FTop;
end;

procedure TFRadiantPointer.Height(FHeight: Single);
begin
  ControlRadPointer.Height := FHeight;
end;

procedure TFRadiantPointer.Width(FWidth: Single);
begin
  ControlRadPointer.Width := FWidth;
end;

procedure TFRadiantPointer.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadPointer.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantPointer.Position(X, Y: Single);
begin
  ControlRadPointer.Position.X := X;
  ControlRadPointer.Position.Y := Y;
end;

procedure TFRadiantPointer.Align(Al: TAlignLayout);
begin
  ControlRadPointer.Align := Al;
end;

procedure TFRadiantPointer.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadPointer.Margins.Left := FLeft;
  ControlRadPointer.Margins.Top := FTop;
  ControlRadPointer.Margins.Right := FRight;
  ControlRadPointer.Margins.Bottom := FBottom;
end;

procedure TFRadiantPointer.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadPointer.Padding.Left := FLeft;
  ControlRadPointer.Padding.Top := FTop;
  ControlRadPointer.Padding.Right := FRight;
  ControlRadPointer.Padding.Bottom := FBottom;
end;

procedure TFRadiantPointer.SetHint(const FText: WideString);
begin
  ControlRadPointer.ShowHint := True;
  ControlRadPointer.Hint := FText;
end;

procedure TFRadiantPointer.SetClipChildren(FValue: Boolean);
begin
  ControlRadPointer.ClipChildren := FValue;
end;

procedure TFRadiantPointer.SetClipParent(FValue: Boolean);
begin
  ControlRadPointer.ClipParent := FValue;
end;

procedure TFRadiantPointer.BringToFront;
begin
  ControlRadPointer.BringToFront;
end;

procedure TFRadiantPointer.SendToBack;
begin
  ControlRadPointer.SendToBack;
end;

procedure TFRadiantPointer.SetTag(FTag: Integer);
begin
  ControlRadPointer.Tag := FTag;
end;

procedure TFRadiantPointer.FillColor(FColor: TAlphaColor);
begin
  ControlRadPointer.Fill.Kind := TBrushKind.Solid;
  ControlRadPointer.Fill.Color := FColor;
end;

procedure TFRadiantPointer.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadPointer.Fill.Kind := TBrushKind.Bitmap;
  ControlRadPointer.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadPointer.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantPointer.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadPointer.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadPointer.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantPointer.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadPointer.Fill.Kind := TBrushKind.Gradient;
  ControlRadPointer.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadPointer.Fill, FAngle);
end;

procedure TFRadiantPointer.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadPointer.Fill.Kind := TBrushKind.Gradient;
  ControlRadPointer.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadPointer.Fill, FAngle);
end;

procedure TFRadiantPointer.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadPointer.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadPointer.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantPointer.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadPointer.Stroke.Kind := TBrushKind.Solid;
  ControlRadPointer.Stroke.Color := FColor;
end;

procedure TFRadiantPointer.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadPointer.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadPointer.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadPointer.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantPointer.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadPointer.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadPointer.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantPointer.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadPointer.Stroke.Kind := TBrushKind.Gradient;
  ControlRadPointer.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadPointer.Stroke, FAngle);
end;

procedure TFRadiantPointer.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadPointer.Stroke.Kind := TBrushKind.Gradient;
  ControlRadPointer.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadPointer.Stroke, FAngle);
end;

procedure TFRadiantPointer.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadPointer.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadPointer.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantPointer.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadPointer.Stroke.Kind := TBrushKind.Solid;
  ControlRadPointer.Stroke.Thickness := FThickness;
  ControlRadPointer.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadPointer.Stroke.Dash := TStrokeDash(Dash);
  ControlRadPointer.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantPointer.Direction(FValue: TRadiantDirection);
begin
  ControlRadPointer.Direction := FValue;
end;

procedure TFRadiantPointer.PointerInset(FValue: Single);
begin
  ControlRadPointer.PointerInset := FValue;
end;

procedure TFRadiantPointer.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadPointer.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantPointer.Opacity(FOpacity: Single);
begin
  ControlRadPointer.Opacity := FOpacity;
end;

procedure TFRadiantPointer.RotationAngle(FValue: Single);
begin
  ControlRadPointer.RotationAngle := FValue;
end;

procedure TFRadiantPointer.RotationCenter(X, Y: Single);
begin
  ControlRadPointer.RotationCenter.X := X;
  ControlRadPointer.RotationCenter.Y := Y;
end;

procedure TFRadiantPointer.Enabled(FEnabled: Boolean);
begin
  ControlRadPointer.Enabled := FEnabled;
end;

procedure TFRadiantPointer.Visible(FVisible: Boolean);
begin
  ControlRadPointer.Visible := FVisible;
end;

procedure TFRadiantPointer.HitTest(FEnabled: Boolean);
begin
  ControlRadPointer.HitTest := FEnabled;
end;

function TFRadiantPointer.IsVisible: Boolean;
begin
  Result := ControlRadPointer.Visible;
end;

function TFRadiantPointer.GetTag: Integer;
begin
  Result := ControlRadPointer.Tag;
end;

function TFRadiantPointer.GetLeft: Single;
begin
  Result := ControlRadPointer.Position.X;
end;

function TFRadiantPointer.GetTop: Single;
begin
  Result := ControlRadPointer.Position.Y;
end;

function TFRadiantPointer.GetHeight: Single;
begin
  Result := ControlRadPointer.Height;
end;

function TFRadiantPointer.GetWidth: Single;
begin
  Result := ControlRadPointer.Width;
end;

function TFRadiantPointer.GetObject: TFmxObject;
begin
  Result := ControlRadPointer;
end;

procedure TFRadiantPointer.OnClick(Event: TNotifyEvent);
begin
  ControlRadPointer.OnClick := Event;
end;

procedure TFRadiantPointer.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadPointer.OnMouseDown := Event;
end;

procedure TFRadiantPointer.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadPointer.OnMouseEnter := Event;
end;

procedure TFRadiantPointer.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadPointer.OnMouseLeave := Event;
end;

procedure TFRadiantPointer.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadPointer.OnMouseUp := Event;
end;

function TFRadiantPointer.Handle: TFmxObject;
begin
  Result := ControlRadPointer;
end;

// >>>>>> TFRadiantRectangle <<<<<< \\
procedure TFRadiantRectangle.FCreate(FParent: TFmxObject);
begin
  ControlRadRectangle := TRadiantRectangle.Create(nil);
  ControlRadRectangle.Parent := FParent;
end;

procedure TFRadiantRectangle.Cursor(FCursor: TCursor);
begin
  ControlRadRectangle.Cursor := FCursor;
end;

procedure TFRadiantRectangle.Left(FLeft: Single);
begin
  ControlRadRectangle.Position.X := FLeft;
end;

procedure TFRadiantRectangle.Top(FTop: Single);
begin
  ControlRadRectangle.Position.Y := FTop;
end;

procedure TFRadiantRectangle.Height(FHeight: Single);
begin
  ControlRadRectangle.Height := FHeight;
end;

procedure TFRadiantRectangle.Width(FWidth: Single);
begin
  ControlRadRectangle.Width := FWidth;
end;

procedure TFRadiantRectangle.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadRectangle.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantRectangle.Position(X, Y: Single);
begin
  ControlRadRectangle.Position.X := X;
  ControlRadRectangle.Position.Y := Y;
end;

procedure TFRadiantRectangle.Align(Al: TAlignLayout);
begin
  ControlRadRectangle.Align := Al;
end;

procedure TFRadiantRectangle.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadRectangle.Margins.Left := FLeft;
  ControlRadRectangle.Margins.Top := FTop;
  ControlRadRectangle.Margins.Right := FRight;
  ControlRadRectangle.Margins.Bottom := FBottom;
end;

procedure TFRadiantRectangle.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadRectangle.Padding.Left := FLeft;
  ControlRadRectangle.Padding.Top := FTop;
  ControlRadRectangle.Padding.Right := FRight;
  ControlRadRectangle.Padding.Bottom := FBottom;
end;

procedure TFRadiantRectangle.SetHint(const FText: WideString);
begin
  ControlRadRectangle.ShowHint := True;
  ControlRadRectangle.Hint := FText;
end;

procedure TFRadiantRectangle.SetClipChildren(FValue: Boolean);
begin
  ControlRadRectangle.ClipChildren := FValue;
end;

procedure TFRadiantRectangle.SetClipParent(FValue: Boolean);
begin
  ControlRadRectangle.ClipParent := FValue;
end;

procedure TFRadiantRectangle.BringToFront;
begin
  ControlRadRectangle.BringToFront;
end;

procedure TFRadiantRectangle.SendToBack;
begin
  ControlRadRectangle.SendToBack;
end;

procedure TFRadiantRectangle.SetTag(FTag: Integer);
begin
  ControlRadRectangle.Tag := FTag;
end;

procedure TFRadiantRectangle.FillColor(FColor: TAlphaColor);
begin
  ControlRadRectangle.Fill.Kind := TBrushKind.Solid;
  ControlRadRectangle.Fill.Color := FColor;
end;

procedure TFRadiantRectangle.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadRectangle.Fill.Kind := TBrushKind.Bitmap;
  ControlRadRectangle.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadRectangle.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantRectangle.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadRectangle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadRectangle.Fill, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantRectangle.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadRectangle.Fill.Kind := TBrushKind.Gradient;
  ControlRadRectangle.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadRectangle.Fill, FAngle);
end;

procedure TFRadiantRectangle.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadRectangle.Fill.Kind := TBrushKind.Gradient;
  ControlRadRectangle.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadRectangle.Fill, FAngle);
end;

procedure TFRadiantRectangle.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadRectangle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadRectangle.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantRectangle.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadRectangle.Stroke.Kind := TBrushKind.Solid;
  ControlRadRectangle.Stroke.Color := FColor;
end;

procedure TFRadiantRectangle.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadRectangle.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadRectangle.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadRectangle.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantRectangle.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadRectangle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadRectangle.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantRectangle.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadRectangle.Stroke.Kind := TBrushKind.Gradient;
  ControlRadRectangle.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadRectangle.Stroke, FAngle);
end;

procedure TFRadiantRectangle.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadRectangle.Stroke.Kind := TBrushKind.Gradient;
  ControlRadRectangle.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadRectangle.Stroke, FAngle);
end;

procedure TFRadiantRectangle.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadRectangle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadRectangle.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantRectangle.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadRectangle.Stroke.Kind := TBrushKind.Solid;
  ControlRadRectangle.Stroke.Thickness := FThickness;
  ControlRadRectangle.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadRectangle.Stroke.Dash := TStrokeDash(Dash);
  ControlRadRectangle.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantRectangle.CornerStyle(XRadi, YRadi: Single;
  FCorners: TCorners; FCornerType: TCornerType);
begin
  ControlRadRectangle.CornerType := FCornerType;
  ControlRadRectangle.Corners := FCorners;
  ControlRadRectangle.XRadius := XRadi;
  ControlRadRectangle.YRadius := YRadi;
end;

procedure TFRadiantRectangle.Sides(FSides: TSides);
begin
  ControlRadRectangle.Sides := FSides;
end;

procedure TFRadiantRectangle.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadRectangle.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantRectangle.Opacity(FOpacity: Single);
begin
  ControlRadRectangle.Opacity := FOpacity;
end;

procedure TFRadiantRectangle.RotationAngle(FValue: Single);
begin
  ControlRadRectangle.RotationAngle := FValue;
end;

procedure TFRadiantRectangle.RotationCenter(X, Y: Single);
begin
  ControlRadRectangle.RotationCenter.X := X;
  ControlRadRectangle.RotationCenter.Y := Y;
end;

procedure TFRadiantRectangle.Enabled(FEnabled: Boolean);
begin
  ControlRadRectangle.Enabled := FEnabled;
end;

procedure TFRadiantRectangle.Visible(FVisible: Boolean);
begin
  ControlRadRectangle.Visible := FVisible;
end;

procedure TFRadiantRectangle.HitTest(FEnabled: Boolean);
begin
  ControlRadRectangle.HitTest := FEnabled;
end;

function TFRadiantRectangle.IsVisible: Boolean;
begin
  Result := ControlRadRectangle.Visible;
end;

function TFRadiantRectangle.GetTag: Integer;
begin
  Result := ControlRadRectangle.Tag;
end;

function TFRadiantRectangle.GetLeft: Single;
begin
  Result := ControlRadRectangle.Position.X;
end;

function TFRadiantRectangle.GetTop: Single;
begin
  Result := ControlRadRectangle.Position.Y;
end;

function TFRadiantRectangle.GetHeight: Single;
begin
  Result := ControlRadRectangle.Height;
end;

function TFRadiantRectangle.GetWidth: Single;
begin
  Result := ControlRadRectangle.Width;
end;

function TFRadiantRectangle.GetObject: TFmxObject;
begin
  Result := ControlRadRectangle;
end;

procedure TFRadiantRectangle.OnClick(Event: TNotifyEvent);
begin
  ControlRadRectangle.OnClick := Event;
end;

procedure TFRadiantRectangle.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadRectangle.OnMouseDown := Event;
end;

procedure TFRadiantRectangle.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadRectangle.OnMouseEnter := Event;
end;

procedure TFRadiantRectangle.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadRectangle.OnMouseLeave := Event;
end;

procedure TFRadiantRectangle.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadRectangle.OnMouseUp := Event;
end;

function TFRadiantRectangle.Handle: TFmxObject;
begin
  Result := ControlRadRectangle;
end;

// >>>>>> TFRadiantRing <<<<<< \\
procedure TFRadiantRing.FCreate(FParent: TFmxObject);
begin
  ControlRadRing := TRadiantRing.Create(nil);
  ControlRadRing.Parent := FParent;
end;

procedure TFRadiantRing.Cursor(FCursor: TCursor);
begin
  ControlRadRing.Cursor := FCursor;
end;

procedure TFRadiantRing.Left(FLeft: Single);
begin
  ControlRadRing.Position.X := FLeft;
end;

procedure TFRadiantRing.Top(FTop: Single);
begin
  ControlRadRing.Position.Y := FTop;
end;

procedure TFRadiantRing.Height(FHeight: Single);
begin
  ControlRadRing.Height := FHeight;
end;

procedure TFRadiantRing.Width(FWidth: Single);
begin
  ControlRadRing.Width := FWidth;
end;

procedure TFRadiantRing.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadRing.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantRing.Position(X, Y: Single);
begin
  ControlRadRing.Position.X := X;
  ControlRadRing.Position.Y := Y;
end;

procedure TFRadiantRing.Align(Al: TAlignLayout);
begin
  ControlRadRing.Align := Al;
end;

procedure TFRadiantRing.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadRing.Margins.Left := FLeft;
  ControlRadRing.Margins.Top := FTop;
  ControlRadRing.Margins.Right := FRight;
  ControlRadRing.Margins.Bottom := FBottom;
end;

procedure TFRadiantRing.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadRing.Padding.Left := FLeft;
  ControlRadRing.Padding.Top := FTop;
  ControlRadRing.Padding.Right := FRight;
  ControlRadRing.Padding.Bottom := FBottom;
end;

procedure TFRadiantRing.SetHint(const FText: WideString);
begin
  ControlRadRing.ShowHint := True;
  ControlRadRing.Hint := FText;
end;

procedure TFRadiantRing.SetClipChildren(FValue: Boolean);
begin
  ControlRadRing.ClipChildren := FValue;
end;

procedure TFRadiantRing.SetClipParent(FValue: Boolean);
begin
  ControlRadRing.ClipParent := FValue;
end;

procedure TFRadiantRing.BringToFront;
begin
  ControlRadRing.BringToFront;
end;

procedure TFRadiantRing.SendToBack;
begin
  ControlRadRing.SendToBack;
end;

procedure TFRadiantRing.SetTag(FTag: Integer);
begin
  ControlRadRing.Tag := FTag;
end;

procedure TFRadiantRing.FillColor(FColor: TAlphaColor);
begin
  ControlRadRing.Fill.Kind := TBrushKind.Solid;
  ControlRadRing.Fill.Color := FColor;
end;

procedure TFRadiantRing.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadRing.Fill.Kind := TBrushKind.Bitmap;
  ControlRadRing.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadRing.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantRing.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadRing.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadRing.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantRing.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadRing.Fill.Kind := TBrushKind.Gradient;
  ControlRadRing.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadRing.Fill, FAngle);
end;

procedure TFRadiantRing.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadRing.Fill.Kind := TBrushKind.Gradient;
  ControlRadRing.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadRing.Fill, FAngle);
end;

procedure TFRadiantRing.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadRing.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadRing.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantRing.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadRing.Stroke.Kind := TBrushKind.Solid;
  ControlRadRing.Stroke.Color := FColor;
end;

procedure TFRadiantRing.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadRing.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadRing.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadRing.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantRing.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadRing.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadRing.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantRing.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadRing.Stroke.Kind := TBrushKind.Gradient;
  ControlRadRing.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadRing.Stroke, FAngle);
end;

procedure TFRadiantRing.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadRing.Stroke.Kind := TBrushKind.Gradient;
  ControlRadRing.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadRing.Stroke, FAngle);
end;

procedure TFRadiantRing.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadRing.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadRing.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantRing.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadRing.Stroke.Kind := TBrushKind.Solid;
  ControlRadRing.Stroke.Thickness := FThickness;
  ControlRadRing.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadRing.Stroke.Dash := TStrokeDash(Dash);
  ControlRadRing.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantRing.Stretch(FValue: Boolean);
begin
  ControlRadRing.Stretch := FValue;
end;

procedure TFRadiantRing.RingSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadRing.RingSize.Pixels := FPixels;
  ControlRadRing.RingSize.ScaleFactor := FScaleFactor;
  ControlRadRing.RingSize.Units := Units;
end;

procedure TFRadiantRing.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadRing.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantRing.Opacity(FOpacity: Single);
begin
  ControlRadRing.Opacity := FOpacity;
end;

procedure TFRadiantRing.RotationAngle(FValue: Single);
begin
  ControlRadRing.RotationAngle := FValue;
end;

procedure TFRadiantRing.RotationCenter(X, Y: Single);
begin
  ControlRadRing.RotationCenter.X := X;
  ControlRadRing.RotationCenter.Y := Y;
end;

procedure TFRadiantRing.Enabled(FEnabled: Boolean);
begin
  ControlRadRing.Enabled := FEnabled;
end;

procedure TFRadiantRing.Visible(FVisible: Boolean);
begin
  ControlRadRing.Visible := FVisible;
end;

procedure TFRadiantRing.HitTest(FEnabled: Boolean);
begin
  ControlRadRing.HitTest := FEnabled;
end;

function TFRadiantRing.IsVisible: Boolean;
begin
  Result := ControlRadRing.Visible;
end;

function TFRadiantRing.GetTag: Integer;
begin
  Result := ControlRadRing.Tag;
end;

function TFRadiantRing.GetLeft: Single;
begin
  Result := ControlRadRing.Position.X;
end;

function TFRadiantRing.GetTop: Single;
begin
  Result := ControlRadRing.Position.Y;
end;

function TFRadiantRing.GetHeight: Single;
begin
  Result := ControlRadRing.Height;
end;

function TFRadiantRing.GetWidth: Single;
begin
  Result := ControlRadRing.Width;
end;

function TFRadiantRing.GetObject: TFmxObject;
begin
  Result := ControlRadRing;
end;

procedure TFRadiantRing.OnClick(Event: TNotifyEvent);
begin
  ControlRadRing.OnClick := Event;
end;

procedure TFRadiantRing.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadRing.OnMouseDown := Event;
end;

procedure TFRadiantRing.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadRing.OnMouseEnter := Event;
end;

procedure TFRadiantRing.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadRing.OnMouseLeave := Event;
end;

procedure TFRadiantRing.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadRing.OnMouseUp := Event;
end;

function TFRadiantRing.Handle: TFmxObject;
begin
  Result := ControlRadRing;
end;

// >>>>>> TFRadiantSector <<<<<< \\
procedure TFRadiantSector.FCreate(FParent: TFmxObject);
begin
  ControlRadSector := TRadiantSector.Create(nil);
  ControlRadSector.Parent := FParent;
end;

procedure TFRadiantSector.Cursor(FCursor: TCursor);
begin
  ControlRadSector.Cursor := FCursor;
end;

procedure TFRadiantSector.Left(FLeft: Single);
begin
  ControlRadSector.Position.X := FLeft;
end;

procedure TFRadiantSector.Top(FTop: Single);
begin
  ControlRadSector.Position.Y := FTop;
end;

procedure TFRadiantSector.Height(FHeight: Single);
begin
  ControlRadSector.Height := FHeight;
end;

procedure TFRadiantSector.Width(FWidth: Single);
begin
  ControlRadSector.Width := FWidth;
end;

procedure TFRadiantSector.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadSector.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantSector.Position(X, Y: Single);
begin
  ControlRadSector.Position.X := X;
  ControlRadSector.Position.Y := Y;
end;

procedure TFRadiantSector.Align(Al: TAlignLayout);
begin
  ControlRadSector.Align := Al;
end;

procedure TFRadiantSector.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadSector.Margins.Left := FLeft;
  ControlRadSector.Margins.Top := FTop;
  ControlRadSector.Margins.Right := FRight;
  ControlRadSector.Margins.Bottom := FBottom;
end;

procedure TFRadiantSector.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadSector.Padding.Left := FLeft;
  ControlRadSector.Padding.Top := FTop;
  ControlRadSector.Padding.Right := FRight;
  ControlRadSector.Padding.Bottom := FBottom;
end;

procedure TFRadiantSector.SetHint(const FText: WideString);
begin
  ControlRadSector.ShowHint := True;
  ControlRadSector.Hint := FText;
end;

procedure TFRadiantSector.SetClipChildren(FValue: Boolean);
begin
  ControlRadSector.ClipChildren := FValue;
end;

procedure TFRadiantSector.SetClipParent(FValue: Boolean);
begin
  ControlRadSector.ClipParent := FValue;
end;

procedure TFRadiantSector.BringToFront;
begin
  ControlRadSector.BringToFront;
end;

procedure TFRadiantSector.SendToBack;
begin
  ControlRadSector.SendToBack;
end;

procedure TFRadiantSector.SetTag(FTag: Integer);
begin
  ControlRadSector.Tag := FTag;
end;

procedure TFRadiantSector.FillColor(FColor: TAlphaColor);
begin
  ControlRadSector.Fill.Kind := TBrushKind.Solid;
  ControlRadSector.Fill.Color := FColor;
end;

procedure TFRadiantSector.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadSector.Fill.Kind := TBrushKind.Bitmap;
  ControlRadSector.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadSector.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantSector.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadSector.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadSector.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantSector.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadSector.Fill.Kind := TBrushKind.Gradient;
  ControlRadSector.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadSector.Fill, FAngle);
end;

procedure TFRadiantSector.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadSector.Fill.Kind := TBrushKind.Gradient;
  ControlRadSector.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadSector.Fill, FAngle);
end;

procedure TFRadiantSector.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadSector.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadSector.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantSector.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadSector.Stroke.Kind := TBrushKind.Solid;
  ControlRadSector.Stroke.Color := FColor;
end;

procedure TFRadiantSector.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadSector.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadSector.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadSector.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantSector.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadSector.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadSector.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantSector.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadSector.Stroke.Kind := TBrushKind.Gradient;
  ControlRadSector.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadSector.Stroke, FAngle);
end;

procedure TFRadiantSector.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadSector.Stroke.Kind := TBrushKind.Gradient;
  ControlRadSector.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadSector.Stroke, FAngle);
end;

procedure TFRadiantSector.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadSector.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadSector.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantSector.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadSector.Stroke.Kind := TBrushKind.Solid;
  ControlRadSector.Stroke.Thickness := FThickness;
  ControlRadSector.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadSector.Stroke.Dash := TStrokeDash(Dash);
  ControlRadSector.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantSector.CentralAngle(FValue: Single);
begin
  ControlRadSector.CentralAngle := FValue;
end;

procedure TFRadiantSector.StartAngle(FValue: Single);
begin
  ControlRadSector.StartAngle := FValue;
end;

procedure TFRadiantSector.Stretch(FValue: Boolean);
begin
  ControlRadSector.Stretch := FValue;
end;

procedure TFRadiantSector.UseRingSize(FValue: Boolean);
begin
  ControlRadSector.UseRingSize := FValue;
end;

procedure TFRadiantSector.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadSector.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantSector.Opacity(FOpacity: Single);
begin
  ControlRadSector.Opacity := FOpacity;
end;

procedure TFRadiantSector.RotationAngle(FValue: Single);
begin
  ControlRadSector.RotationAngle := FValue;
end;

procedure TFRadiantSector.RotationCenter(X, Y: Single);
begin
  ControlRadSector.RotationCenter.X := X;
  ControlRadSector.RotationCenter.Y := Y;
end;

procedure TFRadiantSector.Enabled(FEnabled: Boolean);
begin
  ControlRadSector.Enabled := FEnabled;
end;

procedure TFRadiantSector.Visible(FVisible: Boolean);
begin
  ControlRadSector.Visible := FVisible;
end;

procedure TFRadiantSector.HitTest(FEnabled: Boolean);
begin
  ControlRadSector.HitTest := FEnabled;
end;

function TFRadiantSector.IsVisible: Boolean;
begin
  Result := ControlRadSector.Visible;
end;

function TFRadiantSector.GetTag: Integer;
begin
  Result := ControlRadSector.Tag;
end;

function TFRadiantSector.GetLeft: Single;
begin
  Result := ControlRadSector.Position.X;
end;

function TFRadiantSector.GetTop: Single;
begin
  Result := ControlRadSector.Position.Y;
end;

function TFRadiantSector.GetHeight: Single;
begin
  Result := ControlRadSector.Height;
end;

function TFRadiantSector.GetWidth: Single;
begin
  Result := ControlRadSector.Width;
end;

function TFRadiantSector.GetObject: TFmxObject;
begin
  Result := ControlRadSector;
end;

procedure TFRadiantSector.OnClick(Event: TNotifyEvent);
begin
  ControlRadSector.OnClick := Event;
end;

procedure TFRadiantSector.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadSector.OnMouseDown := Event;
end;

procedure TFRadiantSector.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadSector.OnMouseEnter := Event;
end;

procedure TFRadiantSector.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadSector.OnMouseLeave := Event;
end;

procedure TFRadiantSector.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadSector.OnMouseUp := Event;
end;

function TFRadiantSector.Handle: TFmxObject;
begin
  Result := ControlRadSector;
end;

// >>>>>> TFRadiantSectorRing <<<<<< \\
procedure TFRadiantSectorRing.FCreate(FParent: TFmxObject);
begin
  ControlRadSectorRing := TRadiantSectorRing.Create(nil);
  ControlRadSectorRing.Parent := FParent;
end;

procedure TFRadiantSectorRing.Cursor(FCursor: TCursor);
begin
  ControlRadSectorRing.Cursor := FCursor;
end;

procedure TFRadiantSectorRing.Left(FLeft: Single);
begin
  ControlRadSectorRing.Position.X := FLeft;
end;

procedure TFRadiantSectorRing.Top(FTop: Single);
begin
  ControlRadSectorRing.Position.Y := FTop;
end;

procedure TFRadiantSectorRing.Height(FHeight: Single);
begin
  ControlRadSectorRing.Height := FHeight;
end;

procedure TFRadiantSectorRing.Width(FWidth: Single);
begin
  ControlRadSectorRing.Width := FWidth;
end;

procedure TFRadiantSectorRing.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadSectorRing.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantSectorRing.Position(X, Y: Single);
begin
  ControlRadSectorRing.Position.X := X;
  ControlRadSectorRing.Position.Y := Y;
end;

procedure TFRadiantSectorRing.Align(Al: TAlignLayout);
begin
  ControlRadSectorRing.Align := Al;
end;

procedure TFRadiantSectorRing.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadSectorRing.Margins.Left := FLeft;
  ControlRadSectorRing.Margins.Top := FTop;
  ControlRadSectorRing.Margins.Right := FRight;
  ControlRadSectorRing.Margins.Bottom := FBottom;
end;

procedure TFRadiantSectorRing.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadSectorRing.Padding.Left := FLeft;
  ControlRadSectorRing.Padding.Top := FTop;
  ControlRadSectorRing.Padding.Right := FRight;
  ControlRadSectorRing.Padding.Bottom := FBottom;
end;

procedure TFRadiantSectorRing.SetHint(const FText: WideString);
begin
  ControlRadSectorRing.ShowHint := True;
  ControlRadSectorRing.Hint := FText;
end;

procedure TFRadiantSectorRing.SetClipChildren(FValue: Boolean);
begin
  ControlRadSectorRing.ClipChildren := FValue;
end;

procedure TFRadiantSectorRing.SetClipParent(FValue: Boolean);
begin
  ControlRadSectorRing.ClipParent := FValue;
end;

procedure TFRadiantSectorRing.BringToFront;
begin
  ControlRadSectorRing.BringToFront;
end;

procedure TFRadiantSectorRing.SendToBack;
begin
  ControlRadSectorRing.SendToBack;
end;

procedure TFRadiantSectorRing.SetTag(FTag: Integer);
begin
  ControlRadSectorRing.Tag := FTag;
end;

procedure TFRadiantSectorRing.FillColor(FColor: TAlphaColor);
begin
  ControlRadSectorRing.Fill.Kind := TBrushKind.Solid;
  ControlRadSectorRing.Fill.Color := FColor;
end;

procedure TFRadiantSectorRing.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadSectorRing.Fill.Kind := TBrushKind.Bitmap;
  ControlRadSectorRing.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadSectorRing.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantSectorRing.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadSectorRing.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadSectorRing.Fill, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantSectorRing.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadSectorRing.Fill.Kind := TBrushKind.Gradient;
  ControlRadSectorRing.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadSectorRing.Fill, FAngle);
end;

procedure TFRadiantSectorRing.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadSectorRing.Fill.Kind := TBrushKind.Gradient;
  ControlRadSectorRing.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadSectorRing.Fill, FAngle);
end;

procedure TFRadiantSectorRing.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadSectorRing.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadSectorRing.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantSectorRing.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadSectorRing.Stroke.Kind := TBrushKind.Solid;
  ControlRadSectorRing.Stroke.Color := FColor;
end;

procedure TFRadiantSectorRing.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadSectorRing.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadSectorRing.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadSectorRing.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantSectorRing.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadSectorRing.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadSectorRing.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantSectorRing.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadSectorRing.Stroke.Kind := TBrushKind.Gradient;
  ControlRadSectorRing.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadSectorRing.Stroke, FAngle);
end;

procedure TFRadiantSectorRing.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadSectorRing.Stroke.Kind := TBrushKind.Gradient;
  ControlRadSectorRing.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadSectorRing.Stroke, FAngle);
end;

procedure TFRadiantSectorRing.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadSectorRing.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadSectorRing.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantSectorRing.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadSectorRing.Stroke.Kind := TBrushKind.Solid;
  ControlRadSectorRing.Stroke.Thickness := FThickness;
  ControlRadSectorRing.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadSectorRing.Stroke.Dash := TStrokeDash(Dash);
  ControlRadSectorRing.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantSectorRing.CentralAngle(FValue: Single);
begin
  ControlRadSectorRing.CentralAngle := FValue;
end;

procedure TFRadiantSectorRing.StartAngle(FValue: Single);
begin
  ControlRadSectorRing.StartAngle := FValue;
end;

procedure TFRadiantSectorRing.RingSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadSectorRing.RingSize.Pixels := FPixels;
  ControlRadSectorRing.RingSize.ScaleFactor := FScaleFactor;
  ControlRadSectorRing.RingSize.Units := Units;
end;

procedure TFRadiantSectorRing.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadSectorRing.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantSectorRing.Opacity(FOpacity: Single);
begin
  ControlRadSectorRing.Opacity := FOpacity;
end;

procedure TFRadiantSectorRing.RotationAngle(FValue: Single);
begin
  ControlRadSectorRing.RotationAngle := FValue;
end;

procedure TFRadiantSectorRing.RotationCenter(X, Y: Single);
begin
  ControlRadSectorRing.RotationCenter.X := X;
  ControlRadSectorRing.RotationCenter.Y := Y;
end;

procedure TFRadiantSectorRing.Enabled(FEnabled: Boolean);
begin
  ControlRadSectorRing.Enabled := FEnabled;
end;

procedure TFRadiantSectorRing.Visible(FVisible: Boolean);
begin
  ControlRadSectorRing.Visible := FVisible;
end;

procedure TFRadiantSectorRing.HitTest(FEnabled: Boolean);
begin
  ControlRadSectorRing.HitTest := FEnabled;
end;

function TFRadiantSectorRing.IsVisible: Boolean;
begin
  Result := ControlRadSectorRing.Visible;
end;

function TFRadiantSectorRing.GetTag: Integer;
begin
  Result := ControlRadSectorRing.Tag;
end;

function TFRadiantSectorRing.GetLeft: Single;
begin
  Result := ControlRadSectorRing.Position.X;
end;

function TFRadiantSectorRing.GetTop: Single;
begin
  Result := ControlRadSectorRing.Position.Y;
end;

function TFRadiantSectorRing.GetHeight: Single;
begin
  Result := ControlRadSectorRing.Height;
end;

function TFRadiantSectorRing.GetWidth: Single;
begin
  Result := ControlRadSectorRing.Width;
end;

function TFRadiantSectorRing.GetObject: TFmxObject;
begin
  Result := ControlRadSectorRing;
end;

procedure TFRadiantSectorRing.OnClick(Event: TNotifyEvent);
begin
  ControlRadSectorRing.OnClick := Event;
end;

procedure TFRadiantSectorRing.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadSectorRing.OnMouseDown := Event;
end;

procedure TFRadiantSectorRing.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadSectorRing.OnMouseEnter := Event;
end;

procedure TFRadiantSectorRing.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadSectorRing.OnMouseLeave := Event;
end;

procedure TFRadiantSectorRing.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadSectorRing.OnMouseUp := Event;
end;

function TFRadiantSectorRing.Handle: TFmxObject;
begin
  Result := ControlRadSectorRing;
end;

// >>>>>> TFRadiantShield <<<<<< \\
procedure TFRadiantShield.FCreate(FParent: TFmxObject);
begin
  ControlRadShield := TRadiantShield.Create(nil);
  ControlRadShield.Parent := FParent;
end;

procedure TFRadiantShield.Cursor(FCursor: TCursor);
begin
  ControlRadShield.Cursor := FCursor;
end;

procedure TFRadiantShield.Left(FLeft: Single);
begin
  ControlRadShield.Position.X := FLeft;
end;

procedure TFRadiantShield.Top(FTop: Single);
begin
  ControlRadShield.Position.Y := FTop;
end;

procedure TFRadiantShield.Height(FHeight: Single);
begin
  ControlRadShield.Height := FHeight;
end;

procedure TFRadiantShield.Width(FWidth: Single);
begin
  ControlRadShield.Width := FWidth;
end;

procedure TFRadiantShield.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadShield.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantShield.Position(X, Y: Single);
begin
  ControlRadShield.Position.X := X;
  ControlRadShield.Position.Y := Y;
end;

procedure TFRadiantShield.Align(Al: TAlignLayout);
begin
  ControlRadShield.Align := Al;
end;

procedure TFRadiantShield.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadShield.Margins.Left := FLeft;
  ControlRadShield.Margins.Top := FTop;
  ControlRadShield.Margins.Right := FRight;
  ControlRadShield.Margins.Bottom := FBottom;
end;

procedure TFRadiantShield.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadShield.Padding.Left := FLeft;
  ControlRadShield.Padding.Top := FTop;
  ControlRadShield.Padding.Right := FRight;
  ControlRadShield.Padding.Bottom := FBottom;
end;

procedure TFRadiantShield.SetHint(const FText: WideString);
begin
  ControlRadShield.ShowHint := True;
  ControlRadShield.Hint := FText;
end;

procedure TFRadiantShield.SetClipChildren(FValue: Boolean);
begin
  ControlRadShield.ClipChildren := FValue;
end;

procedure TFRadiantShield.SetClipParent(FValue: Boolean);
begin
  ControlRadShield.ClipParent := FValue;
end;

procedure TFRadiantShield.BringToFront;
begin
  ControlRadShield.BringToFront;
end;

procedure TFRadiantShield.SendToBack;
begin
  ControlRadShield.SendToBack;
end;

procedure TFRadiantShield.SetTag(FTag: Integer);
begin
  ControlRadShield.Tag := FTag;
end;

procedure TFRadiantShield.FillColor(FColor: TAlphaColor);
begin
  ControlRadShield.Fill.Kind := TBrushKind.Solid;
  ControlRadShield.Fill.Color := FColor;
end;

procedure TFRadiantShield.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadShield.Fill.Kind := TBrushKind.Bitmap;
  ControlRadShield.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadShield.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantShield.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadShield.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadShield.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantShield.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadShield.Fill.Kind := TBrushKind.Gradient;
  ControlRadShield.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadShield.Fill, FAngle);
end;

procedure TFRadiantShield.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadShield.Fill.Kind := TBrushKind.Gradient;
  ControlRadShield.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadShield.Fill, FAngle);
end;

procedure TFRadiantShield.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadShield.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadShield.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantShield.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadShield.Stroke.Kind := TBrushKind.Solid;
  ControlRadShield.Stroke.Color := FColor;
end;

procedure TFRadiantShield.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadShield.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadShield.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadShield.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantShield.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadShield.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadShield.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantShield.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadShield.Stroke.Kind := TBrushKind.Gradient;
  ControlRadShield.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadShield.Stroke, FAngle);
end;

procedure TFRadiantShield.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadShield.Stroke.Kind := TBrushKind.Gradient;
  ControlRadShield.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadShield.Stroke, FAngle);
end;

procedure TFRadiantShield.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadShield.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadShield.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantShield.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadShield.Stroke.Kind := TBrushKind.Solid;
  ControlRadShield.Stroke.Thickness := FThickness;
  ControlRadShield.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadShield.Stroke.Dash := TStrokeDash(Dash);
  ControlRadShield.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantShield.ShieldStyle(FValue: TRadiantShieldStyle);
begin
  ControlRadShield.ShieldStyle := FValue;
end;

procedure TFRadiantShield.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadShield.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantShield.Opacity(FOpacity: Single);
begin
  ControlRadShield.Opacity := FOpacity;
end;

procedure TFRadiantShield.RotationAngle(FValue: Single);
begin
  ControlRadShield.RotationAngle := FValue;
end;

procedure TFRadiantShield.RotationCenter(X, Y: Single);
begin
  ControlRadShield.RotationCenter.X := X;
  ControlRadShield.RotationCenter.Y := Y;
end;

procedure TFRadiantShield.Enabled(FEnabled: Boolean);
begin
  ControlRadShield.Enabled := FEnabled;
end;

procedure TFRadiantShield.Visible(FVisible: Boolean);
begin
  ControlRadShield.Visible := FVisible;
end;

procedure TFRadiantShield.HitTest(FEnabled: Boolean);
begin
  ControlRadShield.HitTest := FEnabled;
end;

function TFRadiantShield.IsVisible: Boolean;
begin
  Result := ControlRadShield.Visible;
end;

function TFRadiantShield.GetTag: Integer;
begin
  Result := ControlRadShield.Tag;
end;

function TFRadiantShield.GetLeft: Single;
begin
  Result := ControlRadShield.Position.X;
end;

function TFRadiantShield.GetTop: Single;
begin
  Result := ControlRadShield.Position.Y;
end;

function TFRadiantShield.GetHeight: Single;
begin
  Result := ControlRadShield.Height;
end;

function TFRadiantShield.GetWidth: Single;
begin
  Result := ControlRadShield.Width;
end;

function TFRadiantShield.GetObject: TFmxObject;
begin
  Result := ControlRadShield;
end;

procedure TFRadiantShield.OnClick(Event: TNotifyEvent);
begin
  ControlRadShield.OnClick := Event;
end;

procedure TFRadiantShield.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadShield.OnMouseDown := Event;
end;

procedure TFRadiantShield.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadShield.OnMouseEnter := Event;
end;

procedure TFRadiantShield.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadShield.OnMouseLeave := Event;
end;

procedure TFRadiantShield.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadShield.OnMouseUp := Event;
end;

function TFRadiantShield.Handle: TFmxObject;
begin
  Result := ControlRadShield;
end;

// >>>>>> TFRadiantSquare <<<<<< \\
procedure TFRadiantSquare.FCreate(FParent: TFmxObject);
begin
  ControlRadSquare := TRadiantSquare.Create(nil);
  ControlRadSquare.Parent := FParent;
end;

procedure TFRadiantSquare.Cursor(FCursor: TCursor);
begin
  ControlRadSquare.Cursor := FCursor;
end;

procedure TFRadiantSquare.Left(FLeft: Single);
begin
  ControlRadSquare.Position.X := FLeft;
end;

procedure TFRadiantSquare.Top(FTop: Single);
begin
  ControlRadSquare.Position.Y := FTop;
end;

procedure TFRadiantSquare.Height(FHeight: Single);
begin
  ControlRadSquare.Height := FHeight;
end;

procedure TFRadiantSquare.Width(FWidth: Single);
begin
  ControlRadSquare.Width := FWidth;
end;

procedure TFRadiantSquare.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadSquare.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantSquare.Position(X, Y: Single);
begin
  ControlRadSquare.Position.X := X;
  ControlRadSquare.Position.Y := Y;
end;

procedure TFRadiantSquare.Align(Al: TAlignLayout);
begin
  ControlRadSquare.Align := Al;
end;

procedure TFRadiantSquare.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadSquare.Margins.Left := FLeft;
  ControlRadSquare.Margins.Top := FTop;
  ControlRadSquare.Margins.Right := FRight;
  ControlRadSquare.Margins.Bottom := FBottom;
end;

procedure TFRadiantSquare.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadSquare.Padding.Left := FLeft;
  ControlRadSquare.Padding.Top := FTop;
  ControlRadSquare.Padding.Right := FRight;
  ControlRadSquare.Padding.Bottom := FBottom;
end;

procedure TFRadiantSquare.SetHint(const FText: WideString);
begin
  ControlRadSquare.ShowHint := True;
  ControlRadSquare.Hint := FText;
end;

procedure TFRadiantSquare.SetClipChildren(FValue: Boolean);
begin
  ControlRadSquare.ClipChildren := FValue;
end;

procedure TFRadiantSquare.SetClipParent(FValue: Boolean);
begin
  ControlRadSquare.ClipParent := FValue;
end;

procedure TFRadiantSquare.BringToFront;
begin
  ControlRadSquare.BringToFront;
end;

procedure TFRadiantSquare.SendToBack;
begin
  ControlRadSquare.SendToBack;
end;

procedure TFRadiantSquare.SetTag(FTag: Integer);
begin
  ControlRadSquare.Tag := FTag;
end;

procedure TFRadiantSquare.FillColor(FColor: TAlphaColor);
begin
  ControlRadSquare.Fill.Kind := TBrushKind.Solid;
  ControlRadSquare.Fill.Color := FColor;
end;

procedure TFRadiantSquare.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadSquare.Fill.Kind := TBrushKind.Bitmap;
  ControlRadSquare.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadSquare.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantSquare.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadSquare.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadSquare.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantSquare.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadSquare.Fill.Kind := TBrushKind.Gradient;
  ControlRadSquare.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadSquare.Fill, FAngle);
end;

procedure TFRadiantSquare.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadSquare.Fill.Kind := TBrushKind.Gradient;
  ControlRadSquare.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadSquare.Fill, FAngle);
end;

procedure TFRadiantSquare.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadSquare.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadSquare.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantSquare.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadSquare.Stroke.Kind := TBrushKind.Solid;
  ControlRadSquare.Stroke.Color := FColor;
end;

procedure TFRadiantSquare.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadSquare.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadSquare.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadSquare.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantSquare.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadSquare.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadSquare.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantSquare.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadSquare.Stroke.Kind := TBrushKind.Gradient;
  ControlRadSquare.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadSquare.Stroke, FAngle);
end;

procedure TFRadiantSquare.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadSquare.Stroke.Kind := TBrushKind.Gradient;
  ControlRadSquare.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadSquare.Stroke, FAngle);
end;

procedure TFRadiantSquare.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadSquare.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadSquare.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantSquare.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadSquare.Stroke.Kind := TBrushKind.Solid;
  ControlRadSquare.Stroke.Thickness := FThickness;
  ControlRadSquare.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadSquare.Stroke.Dash := TStrokeDash(Dash);
  ControlRadSquare.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantSquare.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadSquare.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantSquare.Opacity(FOpacity: Single);
begin
  ControlRadSquare.Opacity := FOpacity;
end;

procedure TFRadiantSquare.RotationAngle(FValue: Single);
begin
  ControlRadSquare.RotationAngle := FValue;
end;

procedure TFRadiantSquare.RotationCenter(X, Y: Single);
begin
  ControlRadSquare.RotationCenter.X := X;
  ControlRadSquare.RotationCenter.Y := Y;
end;

procedure TFRadiantSquare.Enabled(FEnabled: Boolean);
begin
  ControlRadSquare.Enabled := FEnabled;
end;

procedure TFRadiantSquare.Visible(FVisible: Boolean);
begin
  ControlRadSquare.Visible := FVisible;
end;

procedure TFRadiantSquare.HitTest(FEnabled: Boolean);
begin
  ControlRadSquare.HitTest := FEnabled;
end;

function TFRadiantSquare.IsVisible: Boolean;
begin
  Result := ControlRadSquare.Visible;
end;

function TFRadiantSquare.GetTag: Integer;
begin
  Result := ControlRadSquare.Tag;
end;

function TFRadiantSquare.GetLeft: Single;
begin
  Result := ControlRadSquare.Position.X;
end;

function TFRadiantSquare.GetTop: Single;
begin
  Result := ControlRadSquare.Position.Y;
end;

function TFRadiantSquare.GetHeight: Single;
begin
  Result := ControlRadSquare.Height;
end;

function TFRadiantSquare.GetWidth: Single;
begin
  Result := ControlRadSquare.Width;
end;

function TFRadiantSquare.GetObject: TFmxObject;
begin
  Result := ControlRadSquare;
end;

procedure TFRadiantSquare.OnClick(Event: TNotifyEvent);
begin
  ControlRadSquare.OnClick := Event;
end;

procedure TFRadiantSquare.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadSquare.OnMouseDown := Event;
end;

procedure TFRadiantSquare.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadSquare.OnMouseEnter := Event;
end;

procedure TFRadiantSquare.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadSquare.OnMouseLeave := Event;
end;

procedure TFRadiantSquare.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadSquare.OnMouseUp := Event;
end;

function TFRadiantSquare.Handle: TFmxObject;
begin
  Result := ControlRadSquare;
end;

// >>>>>> TFRadiantStar <<<<<< \\
procedure TFRadiantStar.FCreate(FParent: TFmxObject);
begin
  ControlRadStar := TRadiantStar.Create(nil);
  ControlRadStar.Parent := FParent;
end;

procedure TFRadiantStar.Cursor(FCursor: TCursor);
begin
  ControlRadStar.Cursor := FCursor;
end;

procedure TFRadiantStar.Left(FLeft: Single);
begin
  ControlRadStar.Position.X := FLeft;
end;

procedure TFRadiantStar.Top(FTop: Single);
begin
  ControlRadStar.Position.Y := FTop;
end;

procedure TFRadiantStar.Height(FHeight: Single);
begin
  ControlRadStar.Height := FHeight;
end;

procedure TFRadiantStar.Width(FWidth: Single);
begin
  ControlRadStar.Width := FWidth;
end;

procedure TFRadiantStar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadStar.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantStar.Position(X, Y: Single);
begin
  ControlRadStar.Position.X := X;
  ControlRadStar.Position.Y := Y;
end;

procedure TFRadiantStar.Align(Al: TAlignLayout);
begin
  ControlRadStar.Align := Al;
end;

procedure TFRadiantStar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadStar.Margins.Left := FLeft;
  ControlRadStar.Margins.Top := FTop;
  ControlRadStar.Margins.Right := FRight;
  ControlRadStar.Margins.Bottom := FBottom;
end;

procedure TFRadiantStar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadStar.Padding.Left := FLeft;
  ControlRadStar.Padding.Top := FTop;
  ControlRadStar.Padding.Right := FRight;
  ControlRadStar.Padding.Bottom := FBottom;
end;

procedure TFRadiantStar.SetHint(const FText: WideString);
begin
  ControlRadStar.ShowHint := True;
  ControlRadStar.Hint := FText;
end;

procedure TFRadiantStar.SetClipChildren(FValue: Boolean);
begin
  ControlRadStar.ClipChildren := FValue;
end;

procedure TFRadiantStar.SetClipParent(FValue: Boolean);
begin
  ControlRadStar.ClipParent := FValue;
end;

procedure TFRadiantStar.BringToFront;
begin
  ControlRadStar.BringToFront;
end;

procedure TFRadiantStar.SendToBack;
begin
  ControlRadStar.SendToBack;
end;

procedure TFRadiantStar.SetTag(FTag: Integer);
begin
  ControlRadStar.Tag := FTag;
end;

procedure TFRadiantStar.FillColor(FColor: TAlphaColor);
begin
  ControlRadStar.Fill.Kind := TBrushKind.Solid;
  ControlRadStar.Fill.Color := FColor;
end;

procedure TFRadiantStar.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadStar.Fill.Kind := TBrushKind.Bitmap;
  ControlRadStar.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadStar.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantStar.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadStar.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadStar.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantStar.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadStar.Fill.Kind := TBrushKind.Gradient;
  ControlRadStar.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadStar.Fill, FAngle);
end;

procedure TFRadiantStar.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadStar.Fill.Kind := TBrushKind.Gradient;
  ControlRadStar.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadStar.Fill, FAngle);
end;

procedure TFRadiantStar.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadStar.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadStar.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantStar.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadStar.Stroke.Kind := TBrushKind.Solid;
  ControlRadStar.Stroke.Color := FColor;
end;

procedure TFRadiantStar.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadStar.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadStar.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadStar.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantStar.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadStar.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadStar.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantStar.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadStar.Stroke.Kind := TBrushKind.Gradient;
  ControlRadStar.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadStar.Stroke, FAngle);
end;

procedure TFRadiantStar.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadStar.Stroke.Kind := TBrushKind.Gradient;
  ControlRadStar.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadStar.Stroke, FAngle);
end;

procedure TFRadiantStar.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadStar.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadStar.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantStar.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadStar.Stroke.Kind := TBrushKind.Solid;
  ControlRadStar.Stroke.Thickness := FThickness;
  ControlRadStar.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadStar.Stroke.Dash := TStrokeDash(Dash);
  ControlRadStar.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantStar.InnerRadiusScaleFactor(FValue: Single);
begin
  ControlRadStar.InnerRadiusScaleFactor := FValue;
end;

procedure TFRadiantStar.Points(FValue: Integer);
begin
  ControlRadStar.Points := FValue;
end;

procedure TFRadiantStar.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadStar.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantStar.Opacity(FOpacity: Single);
begin
  ControlRadStar.Opacity := FOpacity;
end;

procedure TFRadiantStar.RotationAngle(FValue: Single);
begin
  ControlRadStar.RotationAngle := FValue;
end;

procedure TFRadiantStar.RotationCenter(X, Y: Single);
begin
  ControlRadStar.RotationCenter.X := X;
  ControlRadStar.RotationCenter.Y := Y;
end;

procedure TFRadiantStar.Enabled(FEnabled: Boolean);
begin
  ControlRadStar.Enabled := FEnabled;
end;

procedure TFRadiantStar.Visible(FVisible: Boolean);
begin
  ControlRadStar.Visible := FVisible;
end;

procedure TFRadiantStar.HitTest(FEnabled: Boolean);
begin
  ControlRadStar.HitTest := FEnabled;
end;

function TFRadiantStar.IsVisible: Boolean;
begin
  Result := ControlRadStar.Visible;
end;

function TFRadiantStar.GetTag: Integer;
begin
  Result := ControlRadStar.Tag;
end;

function TFRadiantStar.GetLeft: Single;
begin
  Result := ControlRadStar.Position.X;
end;

function TFRadiantStar.GetTop: Single;
begin
  Result := ControlRadStar.Position.Y;
end;

function TFRadiantStar.GetHeight: Single;
begin
  Result := ControlRadStar.Height;
end;

function TFRadiantStar.GetWidth: Single;
begin
  Result := ControlRadStar.Width;
end;

function TFRadiantStar.GetObject: TFmxObject;
begin
  Result := ControlRadStar;
end;

procedure TFRadiantStar.OnClick(Event: TNotifyEvent);
begin
  ControlRadStar.OnClick := Event;
end;

procedure TFRadiantStar.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadStar.OnMouseDown := Event;
end;

procedure TFRadiantStar.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadStar.OnMouseEnter := Event;
end;

procedure TFRadiantStar.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadStar.OnMouseLeave := Event;
end;

procedure TFRadiantStar.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadStar.OnMouseUp := Event;
end;

function TFRadiantStar.Handle: TFmxObject;
begin
  Result := ControlRadStar;
end;

// >>>>>> TFRadiantTag <<<<<< \\
procedure TFRadiantTag.FCreate(FParent: TFmxObject);
begin
  ControlRadTag := TRadiantTag.Create(nil);
  ControlRadTag.Parent := FParent;
end;

procedure TFRadiantTag.Cursor(FCursor: TCursor);
begin
  ControlRadTag.Cursor := FCursor;
end;

procedure TFRadiantTag.Left(FLeft: Single);
begin
  ControlRadTag.Position.X := FLeft;
end;

procedure TFRadiantTag.Top(FTop: Single);
begin
  ControlRadTag.Position.Y := FTop;
end;

procedure TFRadiantTag.Height(FHeight: Single);
begin
  ControlRadTag.Height := FHeight;
end;

procedure TFRadiantTag.Width(FWidth: Single);
begin
  ControlRadTag.Width := FWidth;
end;

procedure TFRadiantTag.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadTag.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantTag.Position(X, Y: Single);
begin
  ControlRadTag.Position.X := X;
  ControlRadTag.Position.Y := Y;
end;

procedure TFRadiantTag.Align(Al: TAlignLayout);
begin
  ControlRadTag.Align := Al;
end;

procedure TFRadiantTag.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadTag.Margins.Left := FLeft;
  ControlRadTag.Margins.Top := FTop;
  ControlRadTag.Margins.Right := FRight;
  ControlRadTag.Margins.Bottom := FBottom;
end;

procedure TFRadiantTag.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadTag.Padding.Left := FLeft;
  ControlRadTag.Padding.Top := FTop;
  ControlRadTag.Padding.Right := FRight;
  ControlRadTag.Padding.Bottom := FBottom;
end;

procedure TFRadiantTag.SetHint(const FText: WideString);
begin
  ControlRadTag.ShowHint := True;
  ControlRadTag.Hint := FText;
end;

procedure TFRadiantTag.SetClipChildren(FValue: Boolean);
begin
  ControlRadTag.ClipChildren := FValue;
end;

procedure TFRadiantTag.SetClipParent(FValue: Boolean);
begin
  ControlRadTag.ClipParent := FValue;
end;

procedure TFRadiantTag.BringToFront;
begin
  ControlRadTag.BringToFront;
end;

procedure TFRadiantTag.SendToBack;
begin
  ControlRadTag.SendToBack;
end;

procedure TFRadiantTag.SetTag(FTag: Integer);
begin
  ControlRadTag.Tag := FTag;
end;

procedure TFRadiantTag.FillColor(FColor: TAlphaColor);
begin
  ControlRadTag.Fill.Kind := TBrushKind.Solid;
  ControlRadTag.Fill.Color := FColor;
end;

procedure TFRadiantTag.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadTag.Fill.Kind := TBrushKind.Bitmap;
  ControlRadTag.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadTag.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantTag.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadTag.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadTag.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantTag.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadTag.Fill.Kind := TBrushKind.Gradient;
  ControlRadTag.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadTag.Fill, FAngle);
end;

procedure TFRadiantTag.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadTag.Fill.Kind := TBrushKind.Gradient;
  ControlRadTag.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadTag.Fill, FAngle);
end;

procedure TFRadiantTag.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadTag.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadTag.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantTag.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadTag.Stroke.Kind := TBrushKind.Solid;
  ControlRadTag.Stroke.Color := FColor;
end;

procedure TFRadiantTag.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadTag.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadTag.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadTag.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantTag.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadTag.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadTag.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantTag.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadTag.Stroke.Kind := TBrushKind.Gradient;
  ControlRadTag.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadTag.Stroke, FAngle);
end;

procedure TFRadiantTag.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadTag.Stroke.Kind := TBrushKind.Gradient;
  ControlRadTag.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadTag.Stroke, FAngle);
end;

procedure TFRadiantTag.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadTag.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadTag.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantTag.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadTag.Stroke.Kind := TBrushKind.Solid;
  ControlRadTag.Stroke.Thickness := FThickness;
  ControlRadTag.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadTag.Stroke.Dash := TStrokeDash(Dash);
  ControlRadTag.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantTag.HoleSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadTag.HoleSize.Pixels := FPixels;
  ControlRadTag.HoleSize.ScaleFactor := FScaleFactor;
  ControlRadTag.HoleSize.Units := Units;
end;

procedure TFRadiantTag.Direction(FValue: TRadiantDirection);
begin
  ControlRadTag.Direction := FValue;
end;

procedure TFRadiantTag.ShowHole(FValue: Boolean);
begin
  ControlRadTag.ShowHole := FValue;
end;

procedure TFRadiantTag.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadTag.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantTag.Opacity(FOpacity: Single);
begin
  ControlRadTag.Opacity := FOpacity;
end;

procedure TFRadiantTag.RotationAngle(FValue: Single);
begin
  ControlRadTag.RotationAngle := FValue;
end;

procedure TFRadiantTag.RotationCenter(X, Y: Single);
begin
  ControlRadTag.RotationCenter.X := X;
  ControlRadTag.RotationCenter.Y := Y;
end;

procedure TFRadiantTag.Enabled(FEnabled: Boolean);
begin
  ControlRadTag.Enabled := FEnabled;
end;

procedure TFRadiantTag.Visible(FVisible: Boolean);
begin
  ControlRadTag.Visible := FVisible;
end;

procedure TFRadiantTag.HitTest(FEnabled: Boolean);
begin
  ControlRadTag.HitTest := FEnabled;
end;

function TFRadiantTag.IsVisible: Boolean;
begin
  Result := ControlRadTag.Visible;
end;

function TFRadiantTag.GetTag: Integer;
begin
  Result := ControlRadTag.Tag;
end;

function TFRadiantTag.GetLeft: Single;
begin
  Result := ControlRadTag.Position.X;
end;

function TFRadiantTag.GetTop: Single;
begin
  Result := ControlRadTag.Position.Y;
end;

function TFRadiantTag.GetHeight: Single;
begin
  Result := ControlRadTag.Height;
end;

function TFRadiantTag.GetWidth: Single;
begin
  Result := ControlRadTag.Width;
end;

function TFRadiantTag.GetObject: TFmxObject;
begin
  Result := ControlRadTag;
end;

procedure TFRadiantTag.OnClick(Event: TNotifyEvent);
begin
  ControlRadTag.OnClick := Event;
end;

procedure TFRadiantTag.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadTag.OnMouseDown := Event;
end;

procedure TFRadiantTag.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadTag.OnMouseEnter := Event;
end;

procedure TFRadiantTag.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadTag.OnMouseLeave := Event;
end;

procedure TFRadiantTag.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadTag.OnMouseUp := Event;
end;

function TFRadiantTag.Handle: TFmxObject;
begin
  Result := ControlRadTag;
end;

// >>>>>> TFRadiantTrapezoid <<<<<< \\
procedure TFRadiantTrapezoid.FCreate(FParent: TFmxObject);
begin
  ControlRadTrapezoid := TRadiantTrapezoid.Create(nil);
  ControlRadTrapezoid.Parent := FParent;
end;

procedure TFRadiantTrapezoid.Cursor(FCursor: TCursor);
begin
  ControlRadTrapezoid.Cursor := FCursor;
end;

procedure TFRadiantTrapezoid.Left(FLeft: Single);
begin
  ControlRadTrapezoid.Position.X := FLeft;
end;

procedure TFRadiantTrapezoid.Top(FTop: Single);
begin
  ControlRadTrapezoid.Position.Y := FTop;
end;

procedure TFRadiantTrapezoid.Height(FHeight: Single);
begin
  ControlRadTrapezoid.Height := FHeight;
end;

procedure TFRadiantTrapezoid.Width(FWidth: Single);
begin
  ControlRadTrapezoid.Width := FWidth;
end;

procedure TFRadiantTrapezoid.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadTrapezoid.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantTrapezoid.Position(X, Y: Single);
begin
  ControlRadTrapezoid.Position.X := X;
  ControlRadTrapezoid.Position.Y := Y;
end;

procedure TFRadiantTrapezoid.Align(Al: TAlignLayout);
begin
  ControlRadTrapezoid.Align := Al;
end;

procedure TFRadiantTrapezoid.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadTrapezoid.Margins.Left := FLeft;
  ControlRadTrapezoid.Margins.Top := FTop;
  ControlRadTrapezoid.Margins.Right := FRight;
  ControlRadTrapezoid.Margins.Bottom := FBottom;
end;

procedure TFRadiantTrapezoid.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadTrapezoid.Padding.Left := FLeft;
  ControlRadTrapezoid.Padding.Top := FTop;
  ControlRadTrapezoid.Padding.Right := FRight;
  ControlRadTrapezoid.Padding.Bottom := FBottom;
end;

procedure TFRadiantTrapezoid.SetHint(const FText: WideString);
begin
  ControlRadTrapezoid.ShowHint := True;
  ControlRadTrapezoid.Hint := FText;
end;

procedure TFRadiantTrapezoid.SetClipChildren(FValue: Boolean);
begin
  ControlRadTrapezoid.ClipChildren := FValue;
end;

procedure TFRadiantTrapezoid.SetClipParent(FValue: Boolean);
begin
  ControlRadTrapezoid.ClipParent := FValue;
end;

procedure TFRadiantTrapezoid.BringToFront;
begin
  ControlRadTrapezoid.BringToFront;
end;

procedure TFRadiantTrapezoid.SendToBack;
begin
  ControlRadTrapezoid.SendToBack;
end;

procedure TFRadiantTrapezoid.SetTag(FTag: Integer);
begin
  ControlRadTrapezoid.Tag := FTag;
end;

procedure TFRadiantTrapezoid.FillColor(FColor: TAlphaColor);
begin
  ControlRadTrapezoid.Fill.Kind := TBrushKind.Solid;
  ControlRadTrapezoid.Fill.Color := FColor;
end;

procedure TFRadiantTrapezoid.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadTrapezoid.Fill.Kind := TBrushKind.Bitmap;
  ControlRadTrapezoid.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadTrapezoid.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantTrapezoid.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadTrapezoid.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadTrapezoid.Fill, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantTrapezoid.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadTrapezoid.Fill.Kind := TBrushKind.Gradient;
  ControlRadTrapezoid.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadTrapezoid.Fill, FAngle);
end;

procedure TFRadiantTrapezoid.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadTrapezoid.Fill.Kind := TBrushKind.Gradient;
  ControlRadTrapezoid.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadTrapezoid.Fill, FAngle);
end;

procedure TFRadiantTrapezoid.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadTrapezoid.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadTrapezoid.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantTrapezoid.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadTrapezoid.Stroke.Kind := TBrushKind.Solid;
  ControlRadTrapezoid.Stroke.Color := FColor;
end;

procedure TFRadiantTrapezoid.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadTrapezoid.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadTrapezoid.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadTrapezoid.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantTrapezoid.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadTrapezoid.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadTrapezoid.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantTrapezoid.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadTrapezoid.Stroke.Kind := TBrushKind.Gradient;
  ControlRadTrapezoid.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadTrapezoid.Stroke, FAngle);
end;

procedure TFRadiantTrapezoid.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadTrapezoid.Stroke.Kind := TBrushKind.Gradient;
  ControlRadTrapezoid.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadTrapezoid.Stroke, FAngle);
end;

procedure TFRadiantTrapezoid.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadTrapezoid.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadTrapezoid.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantTrapezoid.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadTrapezoid.Stroke.Kind := TBrushKind.Solid;
  ControlRadTrapezoid.Stroke.Thickness := FThickness;
  ControlRadTrapezoid.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadTrapezoid.Stroke.Dash := TStrokeDash(Dash);
  ControlRadTrapezoid.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantTrapezoid.AcuteAngle(FValue: Single);
begin
  ControlRadTrapezoid.AcuteAngle := FValue;
end;

procedure TFRadiantTrapezoid.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadTrapezoid.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantTrapezoid.Opacity(FOpacity: Single);
begin
  ControlRadTrapezoid.Opacity := FOpacity;
end;

procedure TFRadiantTrapezoid.RotationAngle(FValue: Single);
begin
  ControlRadTrapezoid.RotationAngle := FValue;
end;

procedure TFRadiantTrapezoid.RotationCenter(X, Y: Single);
begin
  ControlRadTrapezoid.RotationCenter.X := X;
  ControlRadTrapezoid.RotationCenter.Y := Y;
end;

procedure TFRadiantTrapezoid.Enabled(FEnabled: Boolean);
begin
  ControlRadTrapezoid.Enabled := FEnabled;
end;

procedure TFRadiantTrapezoid.Visible(FVisible: Boolean);
begin
  ControlRadTrapezoid.Visible := FVisible;
end;

procedure TFRadiantTrapezoid.HitTest(FEnabled: Boolean);
begin
  ControlRadTrapezoid.HitTest := FEnabled;
end;

function TFRadiantTrapezoid.IsVisible: Boolean;
begin
  Result := ControlRadTrapezoid.Visible;
end;

function TFRadiantTrapezoid.GetTag: Integer;
begin
  Result := ControlRadTrapezoid.Tag;
end;

function TFRadiantTrapezoid.GetLeft: Single;
begin
  Result := ControlRadTrapezoid.Position.X;
end;

function TFRadiantTrapezoid.GetTop: Single;
begin
  Result := ControlRadTrapezoid.Position.Y;
end;

function TFRadiantTrapezoid.GetHeight: Single;
begin
  Result := ControlRadTrapezoid.Height;
end;

function TFRadiantTrapezoid.GetWidth: Single;
begin
  Result := ControlRadTrapezoid.Width;
end;

function TFRadiantTrapezoid.GetObject: TFmxObject;
begin
  Result := ControlRadTrapezoid;
end;

procedure TFRadiantTrapezoid.OnClick(Event: TNotifyEvent);
begin
  ControlRadTrapezoid.OnClick := Event;
end;

procedure TFRadiantTrapezoid.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadTrapezoid.OnMouseDown := Event;
end;

procedure TFRadiantTrapezoid.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadTrapezoid.OnMouseEnter := Event;
end;

procedure TFRadiantTrapezoid.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadTrapezoid.OnMouseLeave := Event;
end;

procedure TFRadiantTrapezoid.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadTrapezoid.OnMouseUp := Event;
end;

function TFRadiantTrapezoid.Handle: TFmxObject;
begin
  Result := ControlRadTrapezoid;
end;

// >>>>>> TFRadiantTriangle <<<<<< \\
procedure TFRadiantTriangle.FCreate(FParent: TFmxObject);
begin
  ControlRadTriangle := TRadiantTriangle.Create(nil);
  ControlRadTriangle.Parent := FParent;
end;

procedure TFRadiantTriangle.Cursor(FCursor: TCursor);
begin
  ControlRadTriangle.Cursor := FCursor;
end;

procedure TFRadiantTriangle.Left(FLeft: Single);
begin
  ControlRadTriangle.Position.X := FLeft;
end;

procedure TFRadiantTriangle.Top(FTop: Single);
begin
  ControlRadTriangle.Position.Y := FTop;
end;

procedure TFRadiantTriangle.Height(FHeight: Single);
begin
  ControlRadTriangle.Height := FHeight;
end;

procedure TFRadiantTriangle.Width(FWidth: Single);
begin
  ControlRadTriangle.Width := FWidth;
end;

procedure TFRadiantTriangle.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadTriangle.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantTriangle.Position(X, Y: Single);
begin
  ControlRadTriangle.Position.X := X;
  ControlRadTriangle.Position.Y := Y;
end;

procedure TFRadiantTriangle.Align(Al: TAlignLayout);
begin
  ControlRadTriangle.Align := Al;
end;

procedure TFRadiantTriangle.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadTriangle.Margins.Left := FLeft;
  ControlRadTriangle.Margins.Top := FTop;
  ControlRadTriangle.Margins.Right := FRight;
  ControlRadTriangle.Margins.Bottom := FBottom;
end;

procedure TFRadiantTriangle.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadTriangle.Padding.Left := FLeft;
  ControlRadTriangle.Padding.Top := FTop;
  ControlRadTriangle.Padding.Right := FRight;
  ControlRadTriangle.Padding.Bottom := FBottom;
end;

procedure TFRadiantTriangle.SetHint(const FText: WideString);
begin
  ControlRadTriangle.ShowHint := True;
  ControlRadTriangle.Hint := FText;
end;

procedure TFRadiantTriangle.SetClipChildren(FValue: Boolean);
begin
  ControlRadTriangle.ClipChildren := FValue;
end;

procedure TFRadiantTriangle.SetClipParent(FValue: Boolean);
begin
  ControlRadTriangle.ClipParent := FValue;
end;

procedure TFRadiantTriangle.BringToFront;
begin
  ControlRadTriangle.BringToFront;
end;

procedure TFRadiantTriangle.SendToBack;
begin
  ControlRadTriangle.SendToBack;
end;

procedure TFRadiantTriangle.SetTag(FTag: Integer);
begin
  ControlRadTriangle.Tag := FTag;
end;

procedure TFRadiantTriangle.FillColor(FColor: TAlphaColor);
begin
  ControlRadTriangle.Fill.Kind := TBrushKind.Solid;
  ControlRadTriangle.Fill.Color := FColor;
end;

procedure TFRadiantTriangle.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadTriangle.Fill.Kind := TBrushKind.Bitmap;
  ControlRadTriangle.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadTriangle.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantTriangle.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadTriangle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadTriangle.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantTriangle.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadTriangle.Fill.Kind := TBrushKind.Gradient;
  ControlRadTriangle.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadTriangle.Fill, FAngle);
end;

procedure TFRadiantTriangle.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadTriangle.Fill.Kind := TBrushKind.Gradient;
  ControlRadTriangle.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadTriangle.Fill, FAngle);
end;

procedure TFRadiantTriangle.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadTriangle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadTriangle.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantTriangle.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadTriangle.Stroke.Kind := TBrushKind.Solid;
  ControlRadTriangle.Stroke.Color := FColor;
end;

procedure TFRadiantTriangle.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadTriangle.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadTriangle.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadTriangle.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantTriangle.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadTriangle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadTriangle.Stroke, FColor1,
    FColor2, FStyle);
end;

procedure TFRadiantTriangle.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadTriangle.Stroke.Kind := TBrushKind.Gradient;
  ControlRadTriangle.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadTriangle.Stroke, FAngle);
end;

procedure TFRadiantTriangle.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadTriangle.Stroke.Kind := TBrushKind.Gradient;
  ControlRadTriangle.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadTriangle.Stroke, FAngle);
end;

procedure TFRadiantTriangle.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadTriangle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadTriangle.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantTriangle.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadTriangle.Stroke.Kind := TBrushKind.Solid;
  ControlRadTriangle.Stroke.Thickness := FThickness;
  ControlRadTriangle.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadTriangle.Stroke.Dash := TStrokeDash(Dash);
  ControlRadTriangle.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantTriangle.Direction(FValue: TRadiantDirection);
begin
  ControlRadTriangle.Direction := FValue;
end;

procedure TFRadiantTriangle.RightAngleCorner(FValue: TCorner);
begin
  ControlRadTriangle.RightAngleCorner := FValue;
end;

procedure TFRadiantTriangle.TriangleType(FValue: TRadiantTriangleType);
begin
  ControlRadTriangle.TriangleType := FValue;
end;

procedure TFRadiantTriangle.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadTriangle.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantTriangle.Opacity(FOpacity: Single);
begin
  ControlRadTriangle.Opacity := FOpacity;
end;

procedure TFRadiantTriangle.RotationAngle(FValue: Single);
begin
  ControlRadTriangle.RotationAngle := FValue;
end;

procedure TFRadiantTriangle.RotationCenter(X, Y: Single);
begin
  ControlRadTriangle.RotationCenter.X := X;
  ControlRadTriangle.RotationCenter.Y := Y;
end;

procedure TFRadiantTriangle.Enabled(FEnabled: Boolean);
begin
  ControlRadTriangle.Enabled := FEnabled;
end;

procedure TFRadiantTriangle.Visible(FVisible: Boolean);
begin
  ControlRadTriangle.Visible := FVisible;
end;

procedure TFRadiantTriangle.HitTest(FEnabled: Boolean);
begin
  ControlRadTriangle.HitTest := FEnabled;
end;

function TFRadiantTriangle.IsVisible: Boolean;
begin
  Result := ControlRadTriangle.Visible;
end;

function TFRadiantTriangle.GetTag: Integer;
begin
  Result := ControlRadTriangle.Tag;
end;

function TFRadiantTriangle.GetLeft: Single;
begin
  Result := ControlRadTriangle.Position.X;
end;

function TFRadiantTriangle.GetTop: Single;
begin
  Result := ControlRadTriangle.Position.Y;
end;

function TFRadiantTriangle.GetHeight: Single;
begin
  Result := ControlRadTriangle.Height;
end;

function TFRadiantTriangle.GetWidth: Single;
begin
  Result := ControlRadTriangle.Width;
end;

function TFRadiantTriangle.GetObject: TFmxObject;
begin
  Result := ControlRadTriangle;
end;

procedure TFRadiantTriangle.OnClick(Event: TNotifyEvent);
begin
  ControlRadTriangle.OnClick := Event;
end;

procedure TFRadiantTriangle.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadTriangle.OnMouseDown := Event;
end;

procedure TFRadiantTriangle.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadTriangle.OnMouseEnter := Event;
end;

procedure TFRadiantTriangle.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadTriangle.OnMouseLeave := Event;
end;

procedure TFRadiantTriangle.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadTriangle.OnMouseUp := Event;
end;

function TFRadiantTriangle.Handle: TFmxObject;
begin
  Result := ControlRadTriangle;
end;

// >>>>>> TFRadiantX <<<<<< \\
procedure TFRadiantX.FCreate(FParent: TFmxObject);
begin
  ControlRadX := TRadiantX.Create(nil);
  ControlRadX.Parent := FParent;
end;

procedure TFRadiantX.Cursor(FCursor: TCursor);
begin
  ControlRadX.Cursor := FCursor;
end;

procedure TFRadiantX.Left(FLeft: Single);
begin
  ControlRadX.Position.X := FLeft;
end;

procedure TFRadiantX.Top(FTop: Single);
begin
  ControlRadX.Position.Y := FTop;
end;

procedure TFRadiantX.Height(FHeight: Single);
begin
  ControlRadX.Height := FHeight;
end;

procedure TFRadiantX.Width(FWidth: Single);
begin
  ControlRadX.Width := FWidth;
end;

procedure TFRadiantX.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadX.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadiantX.Position(X, Y: Single);
begin
  ControlRadX.Position.X := X;
  ControlRadX.Position.Y := Y;
end;

procedure TFRadiantX.Align(Al: TAlignLayout);
begin
  ControlRadX.Align := Al;
end;

procedure TFRadiantX.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadX.Margins.Left := FLeft;
  ControlRadX.Margins.Top := FTop;
  ControlRadX.Margins.Right := FRight;
  ControlRadX.Margins.Bottom := FBottom;
end;

procedure TFRadiantX.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadX.Padding.Left := FLeft;
  ControlRadX.Padding.Top := FTop;
  ControlRadX.Padding.Right := FRight;
  ControlRadX.Padding.Bottom := FBottom;
end;

procedure TFRadiantX.SetHint(const FText: WideString);
begin
  ControlRadX.ShowHint := True;
  ControlRadX.Hint := FText;
end;

procedure TFRadiantX.SetClipChildren(FValue: Boolean);
begin
  ControlRadX.ClipChildren := FValue;
end;

procedure TFRadiantX.SetClipParent(FValue: Boolean);
begin
  ControlRadX.ClipParent := FValue;
end;

procedure TFRadiantX.BringToFront;
begin
  ControlRadX.BringToFront;
end;

procedure TFRadiantX.SendToBack;
begin
  ControlRadX.SendToBack;
end;

procedure TFRadiantX.SetTag(FTag: Integer);
begin
  ControlRadX.Tag := FTag;
end;

procedure TFRadiantX.FillColor(FColor: TAlphaColor);
begin
  ControlRadX.Fill.Kind := TBrushKind.Solid;
  ControlRadX.Fill.Color := FColor;
end;

procedure TFRadiantX.FillPicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlRadX.Fill.Kind := TBrushKind.Bitmap;
  ControlRadX.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadX.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantX.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadX.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadX.Fill, FColor1, FColor2, FStyle);
end;

procedure TFRadiantX.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRadX.Fill.Kind := TBrushKind.Gradient;
  ControlRadX.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadX.Fill, FAngle);
end;

procedure TFRadiantX.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRadX.Fill.Kind := TBrushKind.Gradient;
  ControlRadX.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadX.Fill, FAngle);
end;

procedure TFRadiantX.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadX.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadX.Fill, X1, Y1, X2, Y2);
end;

procedure TFRadiantX.StrokeColor(FColor: TAlphaColor);
begin
  ControlRadX.Stroke.Kind := TBrushKind.Solid;
  ControlRadX.Stroke.Color := FColor;
end;

procedure TFRadiantX.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRadX.Stroke.Kind := TBrushKind.Bitmap;
  ControlRadX.Stroke.Bitmap.Bitmap.LoadFromfile(FImage);
  ControlRadX.Stroke.Bitmap.WrapMode := WrapMode;
end;

procedure TFRadiantX.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRadX.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRadX.Stroke, FColor1, FColor2, FStyle);
end;

procedure TFRadiantX.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRadX.Stroke.Kind := TBrushKind.Gradient;
  ControlRadX.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRadX.Stroke, FAngle);
end;

procedure TFRadiantX.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRadX.Stroke.Kind := TBrushKind.Gradient;
  ControlRadX.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRadX.Stroke, FAngle);
end;

procedure TFRadiantX.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRadX.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRadX.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRadiantX.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRadX.Stroke.Kind := TBrushKind.Solid;
  ControlRadX.Stroke.Thickness := FThickness;
  ControlRadX.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRadX.Stroke.Dash := TStrokeDash(Dash);
  ControlRadX.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRadiantX.BarSize(FPixels, FScaleFactor: Single;
  Units: TRadiantDimensionUnits);
begin
  ControlRadX.BarSize.Pixels := FPixels;
  ControlRadX.BarSize.ScaleFactor := FScaleFactor;
  ControlRadX.BarSize.Units := Units;
end;

procedure TFRadiantX.ScaleStrokeThickness(FValue: Boolean);
begin
  ControlRadX.ScaleStrokeThickness := FValue;
end;

procedure TFRadiantX.Opacity(FOpacity: Single);
begin
  ControlRadX.Opacity := FOpacity;
end;

procedure TFRadiantX.RotationAngle(FValue: Single);
begin
  ControlRadX.RotationAngle := FValue;
end;

procedure TFRadiantX.RotationCenter(X, Y: Single);
begin
  ControlRadX.RotationCenter.X := X;
  ControlRadX.RotationCenter.Y := Y;
end;

procedure TFRadiantX.Enabled(FEnabled: Boolean);
begin
  ControlRadX.Enabled := FEnabled;
end;

procedure TFRadiantX.Visible(FVisible: Boolean);
begin
  ControlRadX.Visible := FVisible;
end;

procedure TFRadiantX.HitTest(FEnabled: Boolean);
begin
  ControlRadX.HitTest := FEnabled;
end;

function TFRadiantX.IsVisible: Boolean;
begin
  Result := ControlRadX.Visible;
end;

function TFRadiantX.GetTag: Integer;
begin
  Result := ControlRadX.Tag;
end;

function TFRadiantX.GetLeft: Single;
begin
  Result := ControlRadX.Position.X;
end;

function TFRadiantX.GetTop: Single;
begin
  Result := ControlRadX.Position.Y;
end;

function TFRadiantX.GetHeight: Single;
begin
  Result := ControlRadX.Height;
end;

function TFRadiantX.GetWidth: Single;
begin
  Result := ControlRadX.Width;
end;

function TFRadiantX.GetObject: TFmxObject;
begin
  Result := ControlRadX;
end;

procedure TFRadiantX.OnClick(Event: TNotifyEvent);
begin
  ControlRadX.OnClick := Event;
end;

procedure TFRadiantX.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadX.OnMouseDown := Event;
end;

procedure TFRadiantX.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadX.OnMouseEnter := Event;
end;

procedure TFRadiantX.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadX.OnMouseLeave := Event;
end;

procedure TFRadiantX.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadX.OnMouseUp := Event;
end;

function TFRadiantX.Handle: TFmxObject;
begin
  Result := ControlRadX;
end;

// ===== Exports =====
function InitRadiantAlertTriangleHandle: FRadiantAlertTriangle;
begin
  Result := TFRadiantAlertTriangle.Create;
end;

function InitRadiantArcHandle: FRadiantArc;
begin
  Result := TFRadiantArc.Create;
end;

function InitRadiantArrowHandle: FRadiantArrow;
begin
  Result := TFRadiantArrow.Create;
end;

function InitRadiantBannerHandle: FRadiantBanner;
begin
  Result := TFRadiantBanner.Create;
end;

function InitRadiantCalloutHandle: FRadiantCallout;
begin
  Result := TFRadiantCallout.Create;
end;

function InitRadiantCapsuleHandle: FRadiantCapsule;
begin
  Result := TFRadiantCapsule.Create;
end;

function InitRadiantCheckHandle: FRadiantCheck;
begin
  Result := TFRadiantCheck.Create;
end;

function InitRadiantChevronHandle: FRadiantChevron;
begin
  Result := TFRadiantChevron.Create;
end;

function InitRadiantChevronArrowHandle: FRadiantChevronArrow;
begin
  Result := TFRadiantChevronArrow.Create;
end;

function InitRadiantCircleHandle: FRadiantCircle;
begin
  Result := TFRadiantCircle.Create;
end;

function InitRadiantDiamondHandle: FRadiantDiamond;
begin
  Result := TFRadiantDiamond.Create;
end;

function InitRadiantEllipseHandle: FRadiantEllipse;
begin
  Result := TFRadiantEllipse.Create;
end;

function InitRadiantFrameHandle: FRadiantFrame;
begin
  Result := TFRadiantFrame.Create;
end;

function InitRadiantGearHandle: FRadiantGear;
begin
  Result := TFRadiantGear.Create;
end;

function InitRadiantHexagonHandle: FRadiantHexagon;
begin
  Result := TFRadiantHexagon.Create;
end;

function InitRadiantLineHandle: FRadiantLine;
begin
  Result := TFRadiantLine.Create;
end;

function InitRadiantMarkerHandle: FRadiantMarker;
begin
  Result := TFRadiantMarker.Create;
end;

function InitRadiantMinusHandle: FRadiantMinus;
begin
  Result := TFRadiantMinus.Create;
end;

function InitRadiantNoRingHandle: FRadiantNoRing;
begin
  Result := TFRadiantNoRing.Create;
end;

function InitRadiantOctagonHandle: FRadiantOctagon;
begin
  Result := TFRadiantOctagon.Create;
end;

function InitRadiantParallelogramHandle: FRadiantParallelogram;
begin
  Result := TFRadiantParallelogram.Create;
end;

function InitRadiantPentagonHandle: FRadiantPentagon;
begin
  Result := TFRadiantPentagon.Create;
end;

function InitRadiantPlusHandle: FRadiantPlus;
begin
  Result := TFRadiantPlus.Create;
end;

function InitRadiantPointerHandle: FRadiantPointer;
begin
  Result := TFRadiantPointer.Create;
end;

function InitRadiantRectangleHandle: FRadiantRectangle;
begin
  Result := TFRadiantRectangle.Create;
end;

function InitRadiantRingHandle: FRadiantRing;
begin
  Result := TFRadiantRing.Create;
end;

function InitRadiantSectorHandle: FRadiantSector;
begin
  Result := TFRadiantSector.Create;
end;

function InitRadiantSectorRingHandle: FRadiantSectorRing;
begin
  Result := TFRadiantSectorRing.Create;
end;

function InitRadiantShieldHandle: FRadiantShield;
begin
  Result := TFRadiantShield.Create;
end;

function InitRadiantSquareHandle: FRadiantSquare;
begin
  Result := TFRadiantSquare.Create;
end;

function InitRadiantStarHandle: FRadiantStar;
begin
  Result := TFRadiantStar.Create;
end;

function InitRadiantTagHandle: FRadiantTag;
begin
  Result := TFRadiantTag.Create;
end;

function InitRadiantTrapezoidHandle: FRadiantTrapezoid;
begin
  Result := TFRadiantTrapezoid.Create;
end;

function InitRadiantTriangleHandle: FRadiantTriangle;
begin
  Result := TFRadiantTriangle.Create;
end;

function InitRadiantXHandle: FRadiantX;
begin
  Result := TFRadiantX.Create;
end;

exports
  InitRadiantAlertTriangleHandle,
  InitRadiantArcHandle,
  InitRadiantArrowHandle,
  InitRadiantBannerHandle,
  InitRadiantCalloutHandle,
  InitRadiantCapsuleHandle,
  InitRadiantCheckHandle,
  InitRadiantChevronHandle,
  InitRadiantChevronArrowHandle,
  InitRadiantCircleHandle,
  InitRadiantDiamondHandle,
  InitRadiantEllipseHandle,
  InitRadiantFrameHandle,
  InitRadiantGearHandle,
  InitRadiantHexagonHandle,
  InitRadiantLineHandle,
  InitRadiantMarkerHandle,
  InitRadiantMinusHandle,
  InitRadiantNoRingHandle,
  InitRadiantOctagonHandle,
  InitRadiantParallelogramHandle,
  InitRadiantPentagonHandle,
  InitRadiantPlusHandle,
  InitRadiantPointerHandle,
  InitRadiantRectangleHandle,
  InitRadiantRingHandle,
  InitRadiantSectorHandle,
  InitRadiantSectorRingHandle,
  InitRadiantShieldHandle,
  InitRadiantSquareHandle,
  InitRadiantStarHandle,
  InitRadiantTagHandle,
  InitRadiantTrapezoidHandle,
  InitRadiantTriangleHandle,
  InitRadiantXHandle;

end.
