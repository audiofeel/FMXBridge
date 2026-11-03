
unit FMXBridge.Shapes;

interface

uses
  System.Classes, System.UITypes,
  FMX.Graphics, FMX.Types, FMX.Objects, FMX.Text, FMX.ImgList;

// =============================================================================
// FLine
// =============================================================================
type
  FLine = interface(IUnknown)
    ['{469891B1-1A0F-48CE-9CCF-48EF59BD1995}']
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
    procedure LineStyle(FLineLocation: TLineLocation;
      FLineType: TLineType); stdcall;
    procedure ShortenLine(FShortenLine: Boolean); stdcall;
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

  TFLine = class(TInterfacedObject, FLine)
  private
    ControlLine: TLine;
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
    procedure LineStyle(FLineLocation: TLineLocation;
      FLineType: TLineType); stdcall;
    procedure ShortenLine(FShortenLine: Boolean); stdcall;
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
// FRectangle
// =============================================================================
type
  FRectangle = interface(IUnknown)
    ['{D9A61F9F-A211-46BF-8A60-E5E6D5A14B65}']
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

  TFRectangle = class(TInterfacedObject, FRectangle)
  private
    ControlRectangle: TRectangle;
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
// FRoundRect
// =============================================================================
type
  FRoundRect = interface(IUnknown)
    ['{3F67560B-72D7-4911-8019-E6D2C488C304}']
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

  TFRoundRect = class(TInterfacedObject, FRoundRect)
  private
    ControlRoundRect: TRoundRect;
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
// FEllipse
// =============================================================================
type
  FEllipse = interface(IUnknown)
    ['{54F6B7F9-B25A-4480-BC5E-FA24F1862A3F}']
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

  TFEllipse = class(TInterfacedObject, FEllipse)
  private
    ControlEllipse: TEllipse;
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
// FCircle
// =============================================================================
type
  FCircle = interface(IUnknown)
    ['{C7A9F447-AB31-4BFE-865F-9E9FE467C54C}']
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

  TFCircle = class(TInterfacedObject, FCircle)
  private
    ControlCircle: TCircle;
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
// FArc
// =============================================================================
type
  FArc = interface(IUnknown)
    ['{CFB8067F-C61A-4724-ACC7-5B3C6537D84B}']
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
    procedure Angle(Current, Max: Single); stdcall;
    procedure StartAngle(FStart: Single); stdcall;
    procedure EndAngle(FEnd: Single); stdcall;
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

  TFArc = class(TInterfacedObject, FArc)
  private
    ControlArc: TArc;
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
    procedure Angle(Current, Max: Single); stdcall;
    procedure StartAngle(FStart: Single); stdcall;
    procedure EndAngle(FEnd: Single); stdcall;
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
// FPie
// =============================================================================
type
  FPie = interface(IUnknown)
    ['{937EE567-35B6-434E-A552-8B53FADEFCB0}']
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
    procedure Angle(Current, Max: Single); stdcall;
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

  TFPie = class(TInterfacedObject, FPie)
  private
    ControlPie: TPie;
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
    procedure Angle(Current, Max: Single); stdcall;
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
// FText
// =============================================================================
type
  FText = interface(IUnknown)
    ['{597C342F-7EFD-4B6C-80BB-49BE4AD9FBF0}']
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
    procedure AutoSize(FAutoSize: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure Stretch(FStretch: Boolean); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
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

  TFText = class(TInterfacedObject, FText)
  private
    ControlText: TText;
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
    procedure AutoSize(FAutoSize: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure Stretch(FStretch: Boolean); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
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
// FPath
// =============================================================================
type
  FPath = interface(IUnknown)
    ['{7FA760E5-6521-4C75-B420-130B7DFBF766}']
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
    procedure DataStr(const DataStr: WideString); stdcall;
    procedure DataWrapMode(FPathWrapMode: TPathWrapMode); stdcall;
    procedure DataBoundsMode(FBoundsMode: TBoundsMode); stdcall;
    procedure DataStyleLookup(FStyle: WideString); stdcall;
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

  TFPath = class(TInterfacedObject, FPath)
  private
    ControlPath: TPath;
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
    procedure DataStr(const DataStr: WideString); stdcall;
    procedure DataWrapMode(FPathWrapMode: TPathWrapMode); stdcall;
    procedure DataBoundsMode(FBoundsMode: TBoundsMode); stdcall;
    procedure DataStyleLookup(FStyle: WideString); stdcall;
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
// FImage
// =============================================================================
type
  FImage = interface(IUnknown)
    ['{9D1ECB65-2EAC-43D6-AC7D-2EE941E33D54}']
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
    procedure LoadPicture(const FImage: WideString;
      WrapMode: TImageWrapMode); stdcall;
    procedure SavePicture(const FImage: WideString); stdcall;
    procedure LoadPictureFromImgList(const FIndex: Integer;
      FImgList: TImageList); stdcall;
    procedure BitmapMargins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure MarginWrapMode(WrapMode: TImageWrapMode); stdcall;
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

  TFImage = class(TInterfacedObject, FImage)
  private
    ControlImage: TImage;
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
    procedure LoadPicture(const FImage: WideString;
      WrapMode: TImageWrapMode); stdcall;
    procedure SavePicture(const FImage: WideString); stdcall;
    procedure LoadPictureFromImgList(const FIndex: Integer;
      FImgList: TImageList); stdcall;
    procedure BitmapMargins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure MarginWrapMode(WrapMode: TImageWrapMode); stdcall;
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
// FCalloutRectangle
// =============================================================================
type
  FCalloutRectangle = interface(IUnknown)
    ['{2EA28A0A-5836-4E58-818F-49D1A7B80398}']
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
    procedure CalloutWidth(FWidth: Single); stdcall;
    procedure CalloutLength(FLength: Single); stdcall;
    procedure CalloutOffset(FOffset: Single); stdcall;
    procedure CalloutPosition(FPosition: TCalloutPosition); stdcall;
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

  TFCalloutRectangle = class(TInterfacedObject, FCalloutRectangle)
  private
    ControlCalloutRect: TCalloutRectangle;
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
    procedure CalloutWidth(FWidth: Single); stdcall;
    procedure CalloutLength(FLength: Single); stdcall;
    procedure CalloutOffset(FOffset: Single); stdcall;
    procedure CalloutPosition(FPosition: TCalloutPosition); stdcall;
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
function InitLineHandle: FLine; stdcall;
function InitRectangleHandle: FRectangle; stdcall;
function InitRoundRectHandle: FRoundRect; stdcall;
function InitEllipseHandle: FEllipse; stdcall;
function InitCircleHandle: FCircle; stdcall;
function InitArcHandle: FArc; stdcall;
function InitPieHandle: FPie; stdcall;
function InitTextHandle: FText; stdcall;
function InitPathHandle: FPath; stdcall;
function InitImageHandle: FImage; stdcall;
function InitCalloutRectangleHandle: FCalloutRectangle; stdcall;

implementation

uses
  FMXBridge.BrushHelpers;

// =============================================================================
// FLine
// =============================================================================
procedure TFLine.FCreate(FParent: TFmxObject);
begin
  ControlLine := TLine.Create(nil);
  ControlLine.Parent := FParent;
end;

procedure TFLine.Cursor(FCursor: TCursor);
begin
  ControlLine.Cursor := TCursor(FCursor);
end;

procedure TFLine.Left(FLeft: Single);
begin
  ControlLine.Position.X := FLeft;
end;

procedure TFLine.Top(FTop: Single);
begin
  ControlLine.Position.Y := FTop;
end;

procedure TFLine.Height(FHeight: Single);
begin
  ControlLine.Size.Height := FHeight;
end;

procedure TFLine.Width(FWidth: Single);
begin
  ControlLine.Size.Width := FWidth;
end;

procedure TFLine.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlLine.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFLine.Position(X, Y: Single);
begin
  ControlLine.Position.X := X;
  ControlLine.Position.Y := Y;
end;

procedure TFLine.Align(Al: TAlignLayout);
begin
  ControlLine.Align := TAlignLayout(Al);
end;

procedure TFLine.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLine.Margins.Left := FLeft;
  ControlLine.Margins.Top := FTop;
  ControlLine.Margins.Right := FRight;
  ControlLine.Margins.Bottom := FBottom;
end;

procedure TFLine.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLine.Padding.Left := FLeft;
  ControlLine.Padding.Top := FTop;
  ControlLine.Padding.Right := FRight;
  ControlLine.Padding.Bottom := FBottom;
end;

procedure TFLine.SetHint(const FText: WideString);
begin
  ControlLine.ShowHint := True;
  ControlLine.Hint := string(FText);
end;

procedure TFLine.SetClipChildren(FValue: Boolean);
begin
  ControlLine.ClipChildren := FValue;
end;

procedure TFLine.SetClipParent(FValue: Boolean);
begin
  ControlLine.ClipParent := FValue;
end;

procedure TFLine.BringToFront;
begin
  ControlLine.BringToFront;
end;

procedure TFLine.SendToBack;
begin
  ControlLine.SendToBack;
end;

procedure TFLine.SetTag(FTag: Integer);
begin
  ControlLine.Tag := FTag;
end;

procedure TFLine.StrokeColor(FColor: TAlphaColor);
begin
  ControlLine.Stroke.Kind := TBrushKind.Solid;
  ControlLine.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFLine.StrokePicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlLine.Stroke.Kind := TBrushKind.Bitmap;
  ControlLine.Stroke.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlLine.Stroke.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFLine.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlLine.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlLine.Stroke, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFLine.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlLine.Stroke.Kind := TBrushKind.Gradient;
  ControlLine.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlLine.Stroke, FAngle);
end;

procedure TFLine.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlLine.Stroke.Kind := TBrushKind.Gradient;
  ControlLine.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlLine.Stroke, FAngle);
end;

procedure TFLine.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlLine.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlLine.Stroke, X1, Y1, X2, Y2);
end;

procedure TFLine.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlLine.Stroke.Kind := TBrushKind.Solid;
  ControlLine.Stroke.Thickness := FThickness;
  ControlLine.Stroke.Cap := TStrokeCap(CapStyle);
  ControlLine.Stroke.Dash := TStrokeDash(Dash);
  ControlLine.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFLine.LineStyle(FLineLocation: TLineLocation; FLineType: TLineType);
begin
  ControlLine.LineType := TLineType(FLineType);
  ControlLine.LineLocation := TLineLocation(FLineLocation);
end;

procedure TFLine.ShortenLine(FShortenLine: Boolean);
begin
  ControlLine.ShortenLine := FShortenLine;
end;

procedure TFLine.Opacity(FOpacity: Single);
begin
  ControlLine.Opacity := FOpacity;
end;

procedure TFLine.RotationAngle(FValue: Single);
begin
  ControlLine.RotationAngle := FValue;
end;

procedure TFLine.RotationCenter(X, Y: Single);
begin
  ControlLine.RotationCenter.X := X;
  ControlLine.RotationCenter.Y := Y;
end;

procedure TFLine.Enabled(FEnabled: Boolean);
begin
  ControlLine.Enabled := FEnabled;
end;

procedure TFLine.Visible(FVisible: Boolean);
begin
  ControlLine.Visible := FVisible;
end;

procedure TFLine.HitTest(FEnabled: Boolean);
begin
  ControlLine.HitTest := FEnabled;
end;

function TFLine.IsVisible: Boolean;
begin
  Result := ControlLine.Visible;
end;

function TFLine.GetTag: Integer;
begin
  Result := ControlLine.Tag;
end;

function TFLine.GetLeft: Single;
begin
  Result := ControlLine.Position.X;
end;

function TFLine.GetTop: Single;
begin
  Result := ControlLine.Position.Y;
end;

function TFLine.GetHeight: Single;
begin
  Result := ControlLine.Size.Height;
end;

function TFLine.GetWidth: Single;
begin
  Result := ControlLine.Size.Width;
end;

function TFLine.GetObject: TFmxObject;
begin
  Result := ControlLine;
end;

procedure TFLine.OnClick(Event: TNotifyEvent);
begin
  ControlLine.OnClick := TNotifyEvent(Event);
end;

procedure TFLine.OnMouseDown(Event: TMouseEvent);
begin
  ControlLine.OnMouseDown := TMouseEvent(Event);
end;

procedure TFLine.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlLine.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFLine.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlLine.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFLine.OnMouseUp(Event: TMouseEvent);
begin
  ControlLine.OnMouseUp := TMouseEvent(Event);
end;

procedure TFLine.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlLine.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFLine.Handle: TFmxObject;
begin
  Result := ControlLine;
end;

// =============================================================================
// FRectangle
// =============================================================================
procedure TFRectangle.FCreate(FParent: TFmxObject);
begin
  ControlRectangle := TRectangle.Create(nil);
  ControlRectangle.Parent := FParent;
  ControlRectangle.Stroke.Thickness := 0;
end;

procedure TFRectangle.Cursor(FCursor: TCursor);
begin
  ControlRectangle.Cursor := TCursor(FCursor);
end;

procedure TFRectangle.Left(FLeft: Single);
begin
  ControlRectangle.Position.X := FLeft;
end;

procedure TFRectangle.Top(FTop: Single);
begin
  ControlRectangle.Position.Y := FTop;
end;

procedure TFRectangle.Height(FHeight: Single);
begin
  ControlRectangle.Size.Height := FHeight;
end;

procedure TFRectangle.Width(FWidth: Single);
begin
  ControlRectangle.Size.Width := FWidth;
end;

procedure TFRectangle.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRectangle.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRectangle.Position(X, Y: Single);
begin
  ControlRectangle.Position.X := X;
  ControlRectangle.Position.Y := Y;
end;

procedure TFRectangle.Align(Al: TAlignLayout);
begin
  ControlRectangle.Align := TAlignLayout(Al);
end;

procedure TFRectangle.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRectangle.Margins.Left := FLeft;
  ControlRectangle.Margins.Top := FTop;
  ControlRectangle.Margins.Right := FRight;
  ControlRectangle.Margins.Bottom := FBottom;
end;

procedure TFRectangle.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRectangle.Padding.Left := FLeft;
  ControlRectangle.Padding.Top := FTop;
  ControlRectangle.Padding.Right := FRight;
  ControlRectangle.Padding.Bottom := FBottom;
end;

procedure TFRectangle.SetHint(const FText: WideString);
begin
  ControlRectangle.ShowHint := True;
  ControlRectangle.Hint := string(FText);
end;

procedure TFRectangle.SetClipChildren(FValue: Boolean);
begin
  ControlRectangle.ClipChildren := FValue;
end;

procedure TFRectangle.SetClipParent(FValue: Boolean);
begin
  ControlRectangle.ClipParent := FValue;
end;

procedure TFRectangle.BringToFront;
begin
  ControlRectangle.BringToFront;
end;

procedure TFRectangle.SendToBack;
begin
  ControlRectangle.SendToBack;
end;

procedure TFRectangle.SetTag(FTag: Integer);
begin
  ControlRectangle.Tag := FTag;
end;

procedure TFRectangle.FillColor(FColor: TAlphaColor);
begin
  ControlRectangle.Fill.Kind := TBrushKind.Solid;
  ControlRectangle.Fill.Color := TAlphaColor(FColor);
end;

procedure TFRectangle.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRectangle.Fill.Kind := TBrushKind.Bitmap;
  ControlRectangle.Fill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlRectangle.Fill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFRectangle.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRectangle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRectangle.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFRectangle.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRectangle.Fill.Kind := TBrushKind.Gradient;
  ControlRectangle.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRectangle.Fill, FAngle);
end;

procedure TFRectangle.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRectangle.Fill.Kind := TBrushKind.Gradient;
  ControlRectangle.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRectangle.Fill, FAngle);
end;

procedure TFRectangle.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRectangle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRectangle.Fill, X1, Y1, X2, Y2);
end;

procedure TFRectangle.StrokeColor(FColor: TAlphaColor);
begin
  ControlRectangle.Stroke.Kind := TBrushKind.Solid;
  ControlRectangle.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFRectangle.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRectangle.Stroke.Kind := TBrushKind.Bitmap;
  ControlRectangle.Stroke.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlRectangle.Stroke.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFRectangle.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRectangle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRectangle.Stroke, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFRectangle.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRectangle.Stroke.Kind := TBrushKind.Gradient;
  ControlRectangle.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRectangle.Stroke, FAngle);
end;

procedure TFRectangle.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRectangle.Stroke.Kind := TBrushKind.Gradient;
  ControlRectangle.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRectangle.Stroke, FAngle);
end;

procedure TFRectangle.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRectangle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRectangle.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRectangle.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRectangle.Stroke.Kind := TBrushKind.Solid;
  ControlRectangle.Stroke.Thickness := FThickness;
  ControlRectangle.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRectangle.Stroke.Dash := TStrokeDash(Dash);
  ControlRectangle.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRectangle.CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
  FCornerType: TCornerType);
begin
  ControlRectangle.CornerType := TCornerType(FCornerType);
  ControlRectangle.Corners := TCorners(FCorners);
  ControlRectangle.XRadius := XRadi;
  ControlRectangle.YRadius := YRadi;
end;

procedure TFRectangle.Sides(FSides: TSides);
begin
  ControlRectangle.Sides := TSides(FSides);
end;

procedure TFRectangle.Opacity(FOpacity: Single);
begin
  ControlRectangle.Opacity := FOpacity;
end;

procedure TFRectangle.RotationAngle(FValue: Single);
begin
  ControlRectangle.RotationAngle := FValue;
end;

procedure TFRectangle.RotationCenter(X, Y: Single);
begin
  ControlRectangle.RotationCenter.X := X;
  ControlRectangle.RotationCenter.Y := Y;
end;

procedure TFRectangle.Enabled(FEnabled: Boolean);
begin
  ControlRectangle.Enabled := FEnabled;
end;

procedure TFRectangle.Visible(FVisible: Boolean);
begin
  ControlRectangle.Visible := FVisible;
end;

procedure TFRectangle.HitTest(FEnabled: Boolean);
begin
  ControlRectangle.HitTest := FEnabled;
end;

function TFRectangle.IsVisible: Boolean;
begin
  Result := ControlRectangle.Visible;
end;

function TFRectangle.GetTag: Integer;
begin
  Result := ControlRectangle.Tag;
end;

function TFRectangle.GetLeft: Single;
begin
  Result := ControlRectangle.Position.X;
end;

function TFRectangle.GetTop: Single;
begin
  Result := ControlRectangle.Position.Y;
end;

function TFRectangle.GetHeight: Single;
begin
  Result := ControlRectangle.Size.Height;
end;

function TFRectangle.GetWidth: Single;
begin
  Result := ControlRectangle.Size.Width;
end;

function TFRectangle.GetObject: TFmxObject;
begin
  Result := ControlRectangle;
end;

procedure TFRectangle.OnClick(Event: TNotifyEvent);
begin
  ControlRectangle.OnClick := TNotifyEvent(Event);
end;

procedure TFRectangle.OnMouseDown(Event: TMouseEvent);
begin
  ControlRectangle.OnMouseDown := TMouseEvent(Event);
end;

procedure TFRectangle.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRectangle.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFRectangle.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRectangle.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFRectangle.OnMouseUp(Event: TMouseEvent);
begin
  ControlRectangle.OnMouseUp := TMouseEvent(Event);
end;

procedure TFRectangle.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlRectangle.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFRectangle.Handle: TFmxObject;
begin
  Result := ControlRectangle;
end;

// =============================================================================
// FRoundRect
// =============================================================================
procedure TFRoundRect.FCreate(FParent: TFmxObject);
begin
  ControlRoundRect := TRoundRect.Create(nil);
  ControlRoundRect.Parent := FParent;
  ControlRoundRect.Stroke.Thickness := 0;
end;

procedure TFRoundRect.Cursor(FCursor: TCursor);
begin
  ControlRoundRect.Cursor := TCursor(FCursor);
end;

procedure TFRoundRect.Left(FLeft: Single);
begin
  ControlRoundRect.Position.X := FLeft;
end;

procedure TFRoundRect.Top(FTop: Single);
begin
  ControlRoundRect.Position.Y := FTop;
end;

procedure TFRoundRect.Height(FHeight: Single);
begin
  ControlRoundRect.Size.Height := FHeight;
end;

procedure TFRoundRect.Width(FWidth: Single);
begin
  ControlRoundRect.Size.Width := FWidth;
end;

procedure TFRoundRect.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRoundRect.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRoundRect.Position(X, Y: Single);
begin
  ControlRoundRect.Position.X := X;
  ControlRoundRect.Position.Y := Y;
end;

procedure TFRoundRect.Align(Al: TAlignLayout);
begin
  ControlRoundRect.Align := TAlignLayout(Al);
end;

procedure TFRoundRect.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRoundRect.Margins.Left := FLeft;
  ControlRoundRect.Margins.Top := FTop;
  ControlRoundRect.Margins.Right := FRight;
  ControlRoundRect.Margins.Bottom := FBottom;
end;

procedure TFRoundRect.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRoundRect.Padding.Left := FLeft;
  ControlRoundRect.Padding.Top := FTop;
  ControlRoundRect.Padding.Right := FRight;
  ControlRoundRect.Padding.Bottom := FBottom;
end;

procedure TFRoundRect.SetHint(const FText: WideString);
begin
  ControlRoundRect.ShowHint := True;
  ControlRoundRect.Hint := string(FText);
end;

procedure TFRoundRect.SetClipChildren(FValue: Boolean);
begin
  ControlRoundRect.ClipChildren := FValue;
end;

procedure TFRoundRect.SetClipParent(FValue: Boolean);
begin
  ControlRoundRect.ClipParent := FValue;
end;

procedure TFRoundRect.BringToFront;
begin
  ControlRoundRect.BringToFront;
end;

procedure TFRoundRect.SendToBack;
begin
  ControlRoundRect.SendToBack;
end;

procedure TFRoundRect.SetTag(FTag: Integer);
begin
  ControlRoundRect.Tag := FTag;
end;

procedure TFRoundRect.FillColor(FColor: TAlphaColor);
begin
  ControlRoundRect.Fill.Kind := TBrushKind.Solid;
  ControlRoundRect.Fill.Color := TAlphaColor(FColor);
end;

procedure TFRoundRect.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRoundRect.Fill.Kind := TBrushKind.Bitmap;
  ControlRoundRect.Fill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlRoundRect.Fill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFRoundRect.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRoundRect.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRoundRect.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFRoundRect.FillGradientLinearAngle(FAngle: Single);
begin
  ControlRoundRect.Fill.Kind := TBrushKind.Gradient;
  ControlRoundRect.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRoundRect.Fill, FAngle);
end;

procedure TFRoundRect.FillGradientRadialAngle(FAngle: Single);
begin
  ControlRoundRect.Fill.Kind := TBrushKind.Gradient;
  ControlRoundRect.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRoundRect.Fill, FAngle);
end;

procedure TFRoundRect.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRoundRect.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRoundRect.Fill, X1, Y1, X2, Y2);
end;

procedure TFRoundRect.StrokeColor(FColor: TAlphaColor);
begin
  ControlRoundRect.Stroke.Kind := TBrushKind.Solid;
  ControlRoundRect.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFRoundRect.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlRoundRect.Stroke.Kind := TBrushKind.Bitmap;
  ControlRoundRect.Stroke.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlRoundRect.Stroke.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFRoundRect.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlRoundRect.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlRoundRect.Stroke, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFRoundRect.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlRoundRect.Stroke.Kind := TBrushKind.Gradient;
  ControlRoundRect.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlRoundRect.Stroke, FAngle);
end;

procedure TFRoundRect.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlRoundRect.Stroke.Kind := TBrushKind.Gradient;
  ControlRoundRect.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlRoundRect.Stroke, FAngle);
end;

procedure TFRoundRect.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlRoundRect.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlRoundRect.Stroke, X1, Y1, X2, Y2);
end;

procedure TFRoundRect.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlRoundRect.Stroke.Kind := TBrushKind.Solid;
  ControlRoundRect.Stroke.Thickness := FThickness;
  ControlRoundRect.Stroke.Cap := TStrokeCap(CapStyle);
  ControlRoundRect.Stroke.Dash := TStrokeDash(Dash);
  ControlRoundRect.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFRoundRect.CornerStyle(FCorners: TCorners);
begin
  ControlRoundRect.Corners := TCorners(FCorners);
end;

procedure TFRoundRect.Opacity(FOpacity: Single);
begin
  ControlRoundRect.Opacity := FOpacity;
end;

procedure TFRoundRect.RotationAngle(FValue: Single);
begin
  ControlRoundRect.RotationAngle := FValue;
end;

procedure TFRoundRect.RotationCenter(X, Y: Single);
begin
  ControlRoundRect.RotationCenter.X := X;
  ControlRoundRect.RotationCenter.Y := Y;
end;

procedure TFRoundRect.Enabled(FEnabled: Boolean);
begin
  ControlRoundRect.Enabled := FEnabled;
end;

procedure TFRoundRect.Visible(FVisible: Boolean);
begin
  ControlRoundRect.Visible := FVisible;
end;

procedure TFRoundRect.HitTest(FEnabled: Boolean);
begin
  ControlRoundRect.HitTest := FEnabled;
end;

function TFRoundRect.IsVisible: Boolean;
begin
  Result := ControlRoundRect.Visible;
end;

function TFRoundRect.GetTag: Integer;
begin
  Result := ControlRoundRect.Tag;
end;

function TFRoundRect.GetLeft: Single;
begin
  Result := ControlRoundRect.Position.X;
end;

function TFRoundRect.GetTop: Single;
begin
  Result := ControlRoundRect.Position.Y;
end;

function TFRoundRect.GetHeight: Single;
begin
  Result := ControlRoundRect.Size.Height;
end;

function TFRoundRect.GetWidth: Single;
begin
  Result := ControlRoundRect.Size.Width;
end;

function TFRoundRect.GetObject: TFmxObject;
begin
  Result := ControlRoundRect;
end;

procedure TFRoundRect.OnClick(Event: TNotifyEvent);
begin
  ControlRoundRect.OnClick := TNotifyEvent(Event);
end;

procedure TFRoundRect.OnMouseDown(Event: TMouseEvent);
begin
  ControlRoundRect.OnMouseDown := TMouseEvent(Event);
end;

procedure TFRoundRect.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRoundRect.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFRoundRect.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRoundRect.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFRoundRect.OnMouseUp(Event: TMouseEvent);
begin
  ControlRoundRect.OnMouseUp := TMouseEvent(Event);
end;

procedure TFRoundRect.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlRoundRect.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFRoundRect.Handle: TFmxObject;
begin
  Result := ControlRoundRect;
end;

// =============================================================================
// FEllipse
// =============================================================================
procedure TFEllipse.FCreate(FParent: TFmxObject);
begin
  ControlEllipse := TEllipse.Create(nil);
  ControlEllipse.Parent := FParent;
end;

procedure TFEllipse.Cursor(FCursor: TCursor);
begin
  ControlEllipse.Cursor := TCursor(FCursor);
end;

procedure TFEllipse.Left(FLeft: Single);
begin
  ControlEllipse.Position.X := FLeft;
end;

procedure TFEllipse.Top(FTop: Single);
begin
  ControlEllipse.Position.Y := FTop;
end;

procedure TFEllipse.Height(FHeight: Single);
begin
  ControlEllipse.Size.Height := FHeight;
end;

procedure TFEllipse.Width(FWidth: Single);
begin
  ControlEllipse.Size.Width := FWidth;
end;

procedure TFEllipse.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlEllipse.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFEllipse.Position(X, Y: Single);
begin
  ControlEllipse.Position.X := X;
  ControlEllipse.Position.Y := Y;
end;

procedure TFEllipse.Align(Al: TAlignLayout);
begin
  ControlEllipse.Align := TAlignLayout(Al);
end;

procedure TFEllipse.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlEllipse.Margins.Left := FLeft;
  ControlEllipse.Margins.Top := FTop;
  ControlEllipse.Margins.Right := FRight;
  ControlEllipse.Margins.Bottom := FBottom;
end;

procedure TFEllipse.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlEllipse.Padding.Left := FLeft;
  ControlEllipse.Padding.Top := FTop;
  ControlEllipse.Padding.Right := FRight;
  ControlEllipse.Padding.Bottom := FBottom;
end;

procedure TFEllipse.SetHint(const FText: WideString);
begin
  ControlEllipse.ShowHint := True;
  ControlEllipse.Hint := string(FText);
end;

procedure TFEllipse.SetClipChildren(FValue: Boolean);
begin
  ControlEllipse.ClipChildren := FValue;
end;

procedure TFEllipse.SetClipParent(FValue: Boolean);
begin
  ControlEllipse.ClipParent := FValue;
end;

procedure TFEllipse.BringToFront;
begin
  ControlEllipse.BringToFront;
end;

procedure TFEllipse.SendToBack;
begin
  ControlEllipse.SendToBack;
end;

procedure TFEllipse.SetTag(FTag: Integer);
begin
  ControlEllipse.Tag := FTag;
end;

procedure TFEllipse.FillColor(FColor: TAlphaColor);
begin
  ControlEllipse.Fill.Kind := TBrushKind.Solid;
  ControlEllipse.Fill.Color := TAlphaColor(FColor);
end;

procedure TFEllipse.FillPicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlEllipse.Fill.Kind := TBrushKind.Bitmap;
  ControlEllipse.Fill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlEllipse.Fill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFEllipse.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlEllipse.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlEllipse.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFEllipse.FillGradientLinearAngle(FAngle: Single);
begin
  ControlEllipse.Fill.Kind := TBrushKind.Gradient;
  ControlEllipse.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlEllipse.Fill, FAngle);
end;

procedure TFEllipse.FillGradientRadialAngle(FAngle: Single);
begin
  ControlEllipse.Fill.Kind := TBrushKind.Gradient;
  ControlEllipse.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlEllipse.Fill, FAngle);
end;

procedure TFEllipse.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlEllipse.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlEllipse.Fill, X1, Y1, X2, Y2);
end;

procedure TFEllipse.StrokeColor(FColor: TAlphaColor);
begin
  ControlEllipse.Stroke.Kind := TBrushKind.Solid;
  ControlEllipse.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFEllipse.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlEllipse.Stroke.Kind := TBrushKind.Bitmap;
  ControlEllipse.Stroke.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlEllipse.Stroke.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFEllipse.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlEllipse.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlEllipse.Stroke, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFEllipse.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlEllipse.Stroke.Kind := TBrushKind.Gradient;
  ControlEllipse.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlEllipse.Stroke, FAngle);
end;

procedure TFEllipse.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlEllipse.Stroke.Kind := TBrushKind.Gradient;
  ControlEllipse.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlEllipse.Stroke, FAngle);
end;

procedure TFEllipse.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlEllipse.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlEllipse.Stroke, X1, Y1, X2, Y2);
end;

procedure TFEllipse.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlEllipse.Stroke.Kind := TBrushKind.Solid;
  ControlEllipse.Stroke.Thickness := FThickness;
  ControlEllipse.Stroke.Cap := TStrokeCap(CapStyle);
  ControlEllipse.Stroke.Dash := TStrokeDash(Dash);
  ControlEllipse.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFEllipse.Opacity(FOpacity: Single);
begin
  ControlEllipse.Opacity := FOpacity;
end;

procedure TFEllipse.RotationAngle(FValue: Single);
begin
  ControlEllipse.RotationAngle := FValue;
end;

procedure TFEllipse.RotationCenter(X, Y: Single);
begin
  ControlEllipse.RotationCenter.X := X;
  ControlEllipse.RotationCenter.Y := Y;
end;

procedure TFEllipse.Enabled(FEnabled: Boolean);
begin
  ControlEllipse.Enabled := FEnabled;
end;

procedure TFEllipse.Visible(FVisible: Boolean);
begin
  ControlEllipse.Visible := FVisible;
end;

procedure TFEllipse.HitTest(FEnabled: Boolean);
begin
  ControlEllipse.HitTest := FEnabled;
end;

function TFEllipse.IsVisible: Boolean;
begin
  Result := ControlEllipse.Visible;
end;

function TFEllipse.GetTag: Integer;
begin
  Result := ControlEllipse.Tag;
end;

function TFEllipse.GetLeft: Single;
begin
  Result := ControlEllipse.Position.X;
end;

function TFEllipse.GetTop: Single;
begin
  Result := ControlEllipse.Position.Y;
end;

function TFEllipse.GetHeight: Single;
begin
  Result := ControlEllipse.Size.Height;
end;

function TFEllipse.GetWidth: Single;
begin
  Result := ControlEllipse.Size.Width;
end;

function TFEllipse.GetObject: TFmxObject;
begin
  Result := ControlEllipse;
end;

procedure TFEllipse.OnClick(Event: TNotifyEvent);
begin
  ControlEllipse.OnClick := TNotifyEvent(Event);
end;

procedure TFEllipse.OnMouseDown(Event: TMouseEvent);
begin
  ControlEllipse.OnMouseDown := TMouseEvent(Event);
end;

procedure TFEllipse.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlEllipse.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFEllipse.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlEllipse.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFEllipse.OnMouseUp(Event: TMouseEvent);
begin
  ControlEllipse.OnMouseUp := TMouseEvent(Event);
end;

procedure TFEllipse.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlEllipse.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFEllipse.Handle: TFmxObject;
begin
  Result := ControlEllipse;
end;

// =============================================================================
// FCircle
// =============================================================================
procedure TFCircle.FCreate(FParent: TFmxObject);
begin
  ControlCircle := TCircle.Create(nil);
  ControlCircle.Parent := FParent;
  ControlCircle.Stroke.Thickness := 0;
end;

procedure TFCircle.Cursor(FCursor: TCursor);
begin
  ControlCircle.Cursor := TCursor(FCursor);
end;

procedure TFCircle.Left(FLeft: Single);
begin
  ControlCircle.Position.X := FLeft;
end;

procedure TFCircle.Top(FTop: Single);
begin
  ControlCircle.Position.Y := FTop;
end;

procedure TFCircle.Height(FHeight: Single);
begin
  ControlCircle.Size.Height := FHeight;
end;

procedure TFCircle.Width(FWidth: Single);
begin
  ControlCircle.Size.Width := FWidth;
end;

procedure TFCircle.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlCircle.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFCircle.Position(X, Y: Single);
begin
  ControlCircle.Position.X := X;
  ControlCircle.Position.Y := Y;
end;

procedure TFCircle.Align(Al: TAlignLayout);
begin
  ControlCircle.Align := TAlignLayout(Al);
end;

procedure TFCircle.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCircle.Margins.Left := FLeft;
  ControlCircle.Margins.Top := FTop;
  ControlCircle.Margins.Right := FRight;
  ControlCircle.Margins.Bottom := FBottom;
end;

procedure TFCircle.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCircle.Padding.Left := FLeft;
  ControlCircle.Padding.Top := FTop;
  ControlCircle.Padding.Right := FRight;
  ControlCircle.Padding.Bottom := FBottom;
end;

procedure TFCircle.SetHint(const FText: WideString);
begin
  ControlCircle.ShowHint := True;
  ControlCircle.Hint := string(FText);
end;

procedure TFCircle.SetClipChildren(FValue: Boolean);
begin
  ControlCircle.ClipChildren := FValue;
end;

procedure TFCircle.SetClipParent(FValue: Boolean);
begin
  ControlCircle.ClipParent := FValue;
end;

procedure TFCircle.BringToFront;
begin
  ControlCircle.BringToFront;
end;

procedure TFCircle.SendToBack;
begin
  ControlCircle.SendToBack;
end;

procedure TFCircle.SetTag(FTag: Integer);
begin
  ControlCircle.Tag := FTag;
end;

procedure TFCircle.FillColor(FColor: TAlphaColor);
begin
  ControlCircle.Fill.Kind := TBrushKind.Solid;
  ControlCircle.Fill.Color := TAlphaColor(FColor);
end;

procedure TFCircle.FillPicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlCircle.Fill.Kind := TBrushKind.Bitmap;
  ControlCircle.Fill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlCircle.Fill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFCircle.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlCircle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlCircle.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFCircle.FillGradientLinearAngle(FAngle: Single);
begin
  ControlCircle.Fill.Kind := TBrushKind.Gradient;
  ControlCircle.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlCircle.Fill, FAngle);
end;

procedure TFCircle.FillGradientRadialAngle(FAngle: Single);
begin
  ControlCircle.Fill.Kind := TBrushKind.Gradient;
  ControlCircle.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlCircle.Fill, FAngle);
end;

procedure TFCircle.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlCircle.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlCircle.Fill, X1, Y1, X2, Y2);
end;

procedure TFCircle.StrokeColor(FColor: TAlphaColor);
begin
  ControlCircle.Stroke.Kind := TBrushKind.Solid;
  ControlCircle.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFCircle.StrokePicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlCircle.Stroke.Kind := TBrushKind.Bitmap;
  ControlCircle.Stroke.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlCircle.Stroke.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFCircle.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlCircle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlCircle.Stroke, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFCircle.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlCircle.Stroke.Kind := TBrushKind.Gradient;
  ControlCircle.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlCircle.Stroke, FAngle);
end;

procedure TFCircle.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlCircle.Stroke.Kind := TBrushKind.Gradient;
  ControlCircle.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlCircle.Stroke, FAngle);
end;

procedure TFCircle.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlCircle.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlCircle.Stroke, X1, Y1, X2, Y2);
end;

procedure TFCircle.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlCircle.Stroke.Kind := TBrushKind.Solid;
  ControlCircle.Stroke.Thickness := FThickness;
  ControlCircle.Stroke.Cap := TStrokeCap(CapStyle);
  ControlCircle.Stroke.Dash := TStrokeDash(Dash);
  ControlCircle.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFCircle.Opacity(FOpacity: Single);
begin
  ControlCircle.Opacity := FOpacity;
end;

procedure TFCircle.RotationAngle(FValue: Single);
begin
  ControlCircle.RotationAngle := FValue;
end;

procedure TFCircle.RotationCenter(X, Y: Single);
begin
  ControlCircle.RotationCenter.X := X;
  ControlCircle.RotationCenter.Y := Y;
end;

procedure TFCircle.Enabled(FEnabled: Boolean);
begin
  ControlCircle.Enabled := FEnabled;
end;

procedure TFCircle.Visible(FVisible: Boolean);
begin
  ControlCircle.Visible := FVisible;
end;

procedure TFCircle.HitTest(FEnabled: Boolean);
begin
  ControlCircle.HitTest := FEnabled;
end;

function TFCircle.IsVisible: Boolean;
begin
  Result := ControlCircle.Visible;
end;

function TFCircle.GetTag: Integer;
begin
  Result := ControlCircle.Tag;
end;

function TFCircle.GetLeft: Single;
begin
  Result := ControlCircle.Position.X;
end;

function TFCircle.GetTop: Single;
begin
  Result := ControlCircle.Position.Y;
end;

function TFCircle.GetHeight: Single;
begin
  Result := ControlCircle.Size.Height;
end;

function TFCircle.GetWidth: Single;
begin
  Result := ControlCircle.Size.Width;
end;

function TFCircle.GetObject: TFmxObject;
begin
  Result := ControlCircle;
end;

procedure TFCircle.OnClick(Event: TNotifyEvent);
begin
  ControlCircle.OnClick := TNotifyEvent(Event);
end;

procedure TFCircle.OnMouseDown(Event: TMouseEvent);
begin
  ControlCircle.OnMouseDown := TMouseEvent(Event);
end;

procedure TFCircle.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlCircle.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFCircle.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlCircle.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFCircle.OnMouseUp(Event: TMouseEvent);
begin
  ControlCircle.OnMouseUp := TMouseEvent(Event);
end;

procedure TFCircle.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlCircle.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFCircle.Handle: TFmxObject;
begin
  Result := ControlCircle;
end;

// =============================================================================
// FArc
// =============================================================================
procedure TFArc.FCreate(FParent: TFmxObject);
begin
  ControlArc := TArc.Create(nil);
  ControlArc.Parent := FParent;
  ControlArc.Stroke.Thickness := 0;
end;

procedure TFArc.Cursor(FCursor: TCursor);
begin
  ControlArc.Cursor := TCursor(FCursor);
end;

procedure TFArc.Left(FLeft: Single);
begin
  ControlArc.Position.X := FLeft;
end;

procedure TFArc.Top(FTop: Single);
begin
  ControlArc.Position.Y := FTop;
end;

procedure TFArc.Height(FHeight: Single);
begin
  ControlArc.Size.Height := FHeight;
end;

procedure TFArc.Width(FWidth: Single);
begin
  ControlArc.Size.Width := FWidth;
end;

procedure TFArc.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlArc.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFArc.Position(X, Y: Single);
begin
  ControlArc.Position.X := X;
  ControlArc.Position.Y := Y;
end;

procedure TFArc.Align(Al: TAlignLayout);
begin
  ControlArc.Align := TAlignLayout(Al);
end;

procedure TFArc.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlArc.Margins.Left := FLeft;
  ControlArc.Margins.Top := FTop;
  ControlArc.Margins.Right := FRight;
  ControlArc.Margins.Bottom := FBottom;
end;

procedure TFArc.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlArc.Padding.Left := FLeft;
  ControlArc.Padding.Top := FTop;
  ControlArc.Padding.Right := FRight;
  ControlArc.Padding.Bottom := FBottom;
end;

procedure TFArc.SetHint(const FText: WideString);
begin
  ControlArc.ShowHint := True;
  ControlArc.Hint := string(FText);
end;

procedure TFArc.SetClipChildren(FValue: Boolean);
begin
  ControlArc.ClipChildren := FValue;
end;

procedure TFArc.SetClipParent(FValue: Boolean);
begin
  ControlArc.ClipParent := FValue;
end;

procedure TFArc.BringToFront;
begin
  ControlArc.BringToFront;
end;

procedure TFArc.SendToBack;
begin
  ControlArc.SendToBack;
end;

procedure TFArc.SetTag(FTag: Integer);
begin
  ControlArc.Tag := FTag;
end;

procedure TFArc.FillColor(FColor: TAlphaColor);
begin
  ControlArc.Fill.Kind := TBrushKind.Solid;
  ControlArc.Fill.Color := TAlphaColor(FColor);
end;

procedure TFArc.FillPicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlArc.Fill.Kind := TBrushKind.Bitmap;
  ControlArc.Fill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlArc.Fill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFArc.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlArc.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlArc.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFArc.FillGradientLinearAngle(FAngle: Single);
begin
  ControlArc.Fill.Kind := TBrushKind.Gradient;
  ControlArc.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlArc.Fill, FAngle);
end;

procedure TFArc.FillGradientRadialAngle(FAngle: Single);
begin
  ControlArc.Fill.Kind := TBrushKind.Gradient;
  ControlArc.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlArc.Fill, FAngle);
end;

procedure TFArc.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlArc.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlArc.Fill, X1, Y1, X2, Y2);
end;

procedure TFArc.StrokeColor(FColor: TAlphaColor);
begin
  ControlArc.Stroke.Kind := TBrushKind.Solid;
  ControlArc.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFArc.StrokePicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlArc.Stroke.Kind := TBrushKind.Bitmap;
  ControlArc.Stroke.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlArc.Stroke.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFArc.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlArc.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlArc.Stroke, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFArc.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlArc.Stroke.Kind := TBrushKind.Gradient;
  ControlArc.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlArc.Stroke, FAngle);
end;

procedure TFArc.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlArc.Stroke.Kind := TBrushKind.Gradient;
  ControlArc.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlArc.Stroke, FAngle);
end;

procedure TFArc.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlArc.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlArc.Stroke, X1, Y1, X2, Y2);
end;

procedure TFArc.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlArc.Stroke.Kind := TBrushKind.Solid;
  ControlArc.Stroke.Thickness := FThickness;
  ControlArc.Stroke.Cap := TStrokeCap(CapStyle);
  ControlArc.Stroke.Dash := TStrokeDash(Dash);
  ControlArc.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFArc.Angle(Current, Max: Single);
begin
  if Max = 0 then
    ControlArc.EndAngle := 0
  else
    ControlArc.EndAngle := 360 * (Current / Max);
end;

procedure TFArc.StartAngle(FStart: Single);
begin
  ControlArc.StartAngle := FStart;
end;

procedure TFArc.EndAngle(FEnd: Single);
begin
  ControlArc.EndAngle := FEnd;
end;

procedure TFArc.Opacity(FOpacity: Single);
begin
  ControlArc.Opacity := FOpacity;
end;

procedure TFArc.RotationAngle(FValue: Single);
begin
  ControlArc.RotationAngle := FValue;
end;

procedure TFArc.RotationCenter(X, Y: Single);
begin
  ControlArc.RotationCenter.X := X;
  ControlArc.RotationCenter.Y := Y;
end;

procedure TFArc.Enabled(FEnabled: Boolean);
begin
  ControlArc.Enabled := FEnabled;
end;

procedure TFArc.Visible(FVisible: Boolean);
begin
  ControlArc.Visible := FVisible
end;

procedure TFArc.HitTest(FEnabled: Boolean);
begin
  ControlArc.HitTest := FEnabled;
end;

function TFArc.IsVisible: Boolean;
begin
  Result := ControlArc.Visible;
end;

function TFArc.GetTag: Integer;
begin
  Result := ControlArc.Tag;
end;

function TFArc.GetLeft: Single;
begin
  Result := ControlArc.Position.X;
end;

function TFArc.GetTop: Single;
begin
  Result := ControlArc.Position.Y;
end;

function TFArc.GetHeight: Single;
begin
  Result := ControlArc.Size.Height;
end;

function TFArc.GetWidth: Single;
begin
  Result := ControlArc.Size.Width;
end;

function TFArc.GetObject: TFmxObject;
begin
  Result := ControlArc;
end;

procedure TFArc.OnClick(Event: TNotifyEvent);
begin
  ControlArc.OnClick := TNotifyEvent(Event);
end;

procedure TFArc.OnMouseDown(Event: TMouseEvent);
begin
  ControlArc.OnMouseDown := TMouseEvent(Event);
end;

procedure TFArc.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlArc.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFArc.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlArc.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFArc.OnMouseUp(Event: TMouseEvent);
begin
  ControlArc.OnMouseUp := TMouseEvent(Event);
end;

procedure TFArc.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlArc.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFArc.Handle: TFmxObject;
begin
  Result := ControlArc;
end;

// =============================================================================
// FPie
// =============================================================================
procedure TFPie.FCreate(FParent: TFmxObject);
begin
  ControlPie := TPie.Create(nil);
  ControlPie.Parent := FParent;
  ControlPie.Stroke.Thickness := 0;
end;

procedure TFPie.Cursor(FCursor: TCursor);
begin
  ControlPie.Cursor := TCursor(FCursor);
end;

procedure TFPie.Left(FLeft: Single);
begin
  ControlPie.Position.X := FLeft;
end;

procedure TFPie.Top(FTop: Single);
begin
  ControlPie.Position.Y := FTop;
end;

procedure TFPie.Height(FHeight: Single);
begin
  ControlPie.Size.Height := FHeight;
end;

procedure TFPie.Width(FWidth: Single);
begin
  ControlPie.Size.Width := FWidth;
end;

procedure TFPie.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlPie.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFPie.Position(X, Y: Single);
begin
  ControlPie.Position.X := X;
  ControlPie.Position.Y := Y;
end;

procedure TFPie.Align(Al: TAlignLayout);
begin
  ControlPie.Align := TAlignLayout(Al);
end;

procedure TFPie.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPie.Margins.Left := FLeft;
  ControlPie.Margins.Top := FTop;
  ControlPie.Margins.Right := FRight;
  ControlPie.Margins.Bottom := FBottom;
end;

procedure TFPie.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPie.Padding.Left := FLeft;
  ControlPie.Padding.Top := FTop;
  ControlPie.Padding.Right := FRight;
  ControlPie.Padding.Bottom := FBottom;
end;

procedure TFPie.SetHint(const FText: WideString);
begin
  ControlPie.ShowHint := True;
  ControlPie.Hint := string(FText);
end;

procedure TFPie.SetClipChildren(FValue: Boolean);
begin
  ControlPie.ClipChildren := FValue;
end;

procedure TFPie.SetClipParent(FValue: Boolean);
begin
  ControlPie.ClipParent := FValue;
end;

procedure TFPie.BringToFront;
begin
  ControlPie.BringToFront;
end;

procedure TFPie.SendToBack;
begin
  ControlPie.SendToBack;
end;

procedure TFPie.SetTag(FTag: Integer);
begin
  ControlPie.Tag := FTag;
end;

procedure TFPie.FillColor(FColor: TAlphaColor);
begin
  ControlPie.Fill.Kind := TBrushKind.Solid;
  ControlPie.Fill.Color := TAlphaColor(FColor);
end;

procedure TFPie.FillPicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlPie.Fill.Kind := TBrushKind.Bitmap;
  ControlPie.Fill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlPie.Fill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFPie.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlPie.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlPie.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFPie.FillGradientLinearAngle(FAngle: Single);
begin
  ControlPie.Fill.Kind := TBrushKind.Gradient;
  ControlPie.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlPie.Fill, FAngle);
end;

procedure TFPie.FillGradientRadialAngle(FAngle: Single);
begin
  ControlPie.Fill.Kind := TBrushKind.Gradient;
  ControlPie.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlPie.Fill, FAngle);
end;

procedure TFPie.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlPie.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlPie.Fill, X1, Y1, X2, Y2);
end;

procedure TFPie.StrokeColor(FColor: TAlphaColor);
begin
  ControlPie.Stroke.Kind := TBrushKind.Solid;
  ControlPie.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFPie.StrokePicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlPie.Stroke.Kind := TBrushKind.Bitmap;
  ControlPie.Stroke.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlPie.Stroke.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFPie.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlPie.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlPie.Stroke, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFPie.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlPie.Stroke.Kind := TBrushKind.Gradient;
  ControlPie.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlPie.Stroke, FAngle);
end;

procedure TFPie.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlPie.Stroke.Kind := TBrushKind.Gradient;
  ControlPie.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlPie.Stroke, FAngle);
end;

procedure TFPie.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlPie.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlPie.Stroke, X1, Y1, X2, Y2);
end;

procedure TFPie.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlPie.Stroke.Kind := TBrushKind.Solid;
  ControlPie.Stroke.Thickness := FThickness;
  ControlPie.Stroke.Cap := TStrokeCap(CapStyle);
  ControlPie.Stroke.Dash := TStrokeDash(Dash);
  ControlPie.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFPie.Angle(Current, Max: Single);
begin
  if Max = 0 then
  begin
    ControlPie.EndAngle := 0;
    Exit;
  end;

  ControlPie.EndAngle := 360 * (Current / Max);
end;

procedure TFPie.Opacity(FOpacity: Single);
begin
  ControlPie.Opacity := FOpacity;
end;

procedure TFPie.RotationAngle(FValue: Single);
begin
  ControlPie.RotationAngle := FValue;
end;

procedure TFPie.RotationCenter(X, Y: Single);
begin
  ControlPie.RotationCenter.X := X;
  ControlPie.RotationCenter.Y := Y;
end;

procedure TFPie.Enabled(FEnabled: Boolean);
begin
  ControlPie.Enabled := FEnabled;
end;

procedure TFPie.Visible(FVisible: Boolean);
begin
  ControlPie.Visible := FVisible
end;

procedure TFPie.HitTest(FEnabled: Boolean);
begin
  ControlPie.HitTest := FEnabled;
end;

function TFPie.IsVisible: Boolean;
begin
  Result := ControlPie.Visible;
end;

function TFPie.GetTag: Integer;
begin
  Result := ControlPie.Tag;
end;

function TFPie.GetLeft: Single;
begin
  Result := ControlPie.Position.X;
end;

function TFPie.GetTop: Single;
begin
  Result := ControlPie.Position.Y;
end;

function TFPie.GetHeight: Single;
begin
  Result := ControlPie.Size.Height;
end;

function TFPie.GetWidth: Single;
begin
  Result := ControlPie.Size.Width;
end;

function TFPie.GetObject: TFmxObject;
begin
  Result := ControlPie;
end;

procedure TFPie.OnClick(Event: TNotifyEvent);
begin
  ControlPie.OnClick := TNotifyEvent(Event);
end;

procedure TFPie.OnMouseDown(Event: TMouseEvent);
begin
  ControlPie.OnMouseDown := TMouseEvent(Event);
end;

procedure TFPie.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlPie.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFPie.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlPie.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFPie.OnMouseUp(Event: TMouseEvent);
begin
  ControlPie.OnMouseUp := TMouseEvent(Event);
end;

procedure TFPie.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlPie.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFPie.Handle: TFmxObject;
begin
  Result := ControlPie;
end;

// =============================================================================
// FText
// =============================================================================
procedure TFText.FCreate(FParent: TFmxObject);
begin
  ControlText := TText.Create(nil);
  ControlText.Parent := FParent;
  ControlText.Text := 'Text1';
end;

procedure TFText.Cursor(FCursor: TCursor);
begin
  ControlText.Cursor := TCursor(FCursor);
end;

procedure TFText.Left(FLeft: Single);
begin
  ControlText.Position.X := FLeft;
end;

procedure TFText.Top(FTop: Single);
begin
  ControlText.Position.Y := FTop;
end;

procedure TFText.Height(FHeight: Single);
begin
  ControlText.Size.Height := FHeight;
end;

procedure TFText.Width(FWidth: Single);
begin
  ControlText.Size.Width := FWidth;
end;

procedure TFText.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlText.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFText.Position(X, Y: Single);
begin
  ControlText.Position.X := X;
  ControlText.Position.Y := Y;
end;

procedure TFText.Align(Al: TAlignLayout);
begin
  ControlText.Align := TAlignLayout(Al);
end;

procedure TFText.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlText.Margins.Left := FLeft;
  ControlText.Margins.Top := FTop;
  ControlText.Margins.Right := FRight;
  ControlText.Margins.Bottom := FBottom;
end;

procedure TFText.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlText.Padding.Left := FLeft;
  ControlText.Padding.Top := FTop;
  ControlText.Padding.Right := FRight;
  ControlText.Padding.Bottom := FBottom;
end;

procedure TFText.SetHint(const FText: WideString);
begin
  ControlText.ShowHint := True;
  ControlText.Hint := string(FText);
end;

procedure TFText.SetClipChildren(FValue: Boolean);
begin
  ControlText.ClipChildren := FValue;
end;

procedure TFText.SetClipParent(FValue: Boolean);
begin
  ControlText.ClipParent := FValue;
end;

procedure TFText.BringToFront;
begin
  ControlText.BringToFront;
end;

procedure TFText.SendToBack;
begin
  ControlText.SendToBack;
end;

procedure TFText.SetTag(FTag: Integer);
begin
  ControlText.Tag := FTag;
end;

procedure TFText.AutoSize(FAutoSize: Boolean);
begin
  ControlText.AutoSize := FAutoSize;
end;

procedure TFText.Text(const FText: WideString);
begin
  ControlText.Text := string(FText);
end;

procedure TFText.Stretch(FStretch: Boolean);
begin
  ControlText.Stretch := FStretch;
end;

procedure TFText.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlText.TextSettings.Font.Family := string(FontName);
  ControlText.TextSettings.Font.Size := FontSize;
  ControlText.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFText.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlText.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlText.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlText.TextSettings.WordWrap := FWordWrap;
end;

procedure TFText.Color(FontColor: TAlphaColor);
begin
  ControlText.Color := TAlphaColor(FontColor);
end;

procedure TFText.Opacity(FOpacity: Single);
begin
  ControlText.Opacity := FOpacity;
end;

procedure TFText.RotationAngle(FValue: Single);
begin
  ControlText.RotationAngle := FValue;
end;

procedure TFText.RotationCenter(X, Y: Single);
begin
  ControlText.RotationCenter.X := X;
  ControlText.RotationCenter.Y := Y;
end;

procedure TFText.Enabled(FEnabled: Boolean);
begin
  ControlText.Enabled := FEnabled;
end;

procedure TFText.Visible(FVisible: Boolean);
begin
  ControlText.Visible := FVisible;
end;

procedure TFText.HitTest(FEnabled: Boolean);
begin
  ControlText.HitTest := FEnabled;
end;

function TFText.IsVisible: Boolean;
begin
  Result := ControlText.Visible;
end;

function TFText.GetText: WideString;
begin
  Result := ControlText.Text;
end;

function TFText.GetTag: Integer;
begin
  Result := ControlText.Tag;
end;

function TFText.GetLeft: Single;
begin
  Result := ControlText.Position.X;
end;

function TFText.GetTop: Single;
begin
  Result := ControlText.Position.Y;
end;

function TFText.GetHeight: Single;
begin
  Result := ControlText.Size.Height;
end;

function TFText.GetWidth: Single;
begin
  Result := ControlText.Size.Width;
end;

function TFText.GetObject: TFmxObject;
begin
  Result := ControlText;
end;

procedure TFText.OnClick(Event: TNotifyEvent);
begin
  ControlText.OnClick := TNotifyEvent(Event);
end;

procedure TFText.OnMouseDown(Event: TMouseEvent);
begin
  ControlText.OnMouseDown := TMouseEvent(Event);
end;

procedure TFText.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlText.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFText.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlText.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFText.OnMouseUp(Event: TMouseEvent);
begin
  ControlText.OnMouseUp := TMouseEvent(Event);
end;

procedure TFText.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlText.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFText.Handle: TFmxObject;
begin
  Result := ControlText;
end;

// =============================================================================
// FPath
// =============================================================================
procedure TFPath.FCreate(FParent: TFmxObject);
begin
  ControlPath := TPath.Create(nil);
  ControlPath.Parent := FParent;
  ControlPath.Stroke.Thickness := 0;
end;

procedure TFPath.Cursor(FCursor: TCursor);
begin
  ControlPath.Cursor := TCursor(FCursor);
end;

procedure TFPath.Left(FLeft: Single);
begin
  ControlPath.Position.X := FLeft;
end;

procedure TFPath.Top(FTop: Single);
begin
  ControlPath.Position.Y := FTop;
end;

procedure TFPath.Height(FHeight: Single);
begin
  ControlPath.Size.Height := FHeight;
end;

procedure TFPath.Width(FWidth: Single);
begin
  ControlPath.Size.Width := FWidth;
end;

procedure TFPath.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlPath.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFPath.Position(X, Y: Single);
begin
  ControlPath.Position.X := X;
  ControlPath.Position.Y := Y;
end;

procedure TFPath.Align(Al: TAlignLayout);
begin
  ControlPath.Align := TAlignLayout(Al);
end;

procedure TFPath.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPath.Margins.Left := FLeft;
  ControlPath.Margins.Top := FTop;
  ControlPath.Margins.Right := FRight;
  ControlPath.Margins.Bottom := FBottom;
end;

procedure TFPath.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPath.Padding.Left := FLeft;
  ControlPath.Padding.Top := FTop;
  ControlPath.Padding.Right := FRight;
  ControlPath.Padding.Bottom := FBottom;
end;

procedure TFPath.SetHint(const FText: WideString);
begin
  ControlPath.ShowHint := True;
  ControlPath.Hint := string(FText);
end;

procedure TFPath.SetClipChildren(FValue: Boolean);
begin
  ControlPath.ClipChildren := FValue;
end;

procedure TFPath.SetClipParent(FValue: Boolean);
begin
  ControlPath.ClipParent := FValue;
end;

procedure TFPath.BringToFront;
begin
  ControlPath.BringToFront;
end;

procedure TFPath.SendToBack;
begin
  ControlPath.SendToBack;
end;

procedure TFPath.SetTag(FTag: Integer);
begin
  ControlPath.Tag := FTag;
end;

procedure TFPath.DataStr(const DataStr: WideString);
begin
  ControlPath.Data.Data := string(DataStr);
end;

procedure TFPath.DataWrapMode(FPathWrapMode: TPathWrapMode);
begin
  ControlPath.WrapMode := TPathWrapMode(FPathWrapMode);
end;

procedure TFPath.DataBoundsMode(FBoundsMode: TBoundsMode);
begin
  ControlPath.Data.BoundsMode := TBoundsMode(FBoundsMode);
end;

procedure TFPath.DataStyleLookup(FStyle: WideString);
begin
  ControlPath.Data.StyleLookUp := string(FStyle);
end;

procedure TFPath.FillColor(FColor: TAlphaColor);
begin
  ControlPath.Fill.Kind := TBrushKind.Solid;
  ControlPath.Fill.Color := TAlphaColor(FColor);
end;

procedure TFPath.FillPicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlPath.Fill.Kind := TBrushKind.Bitmap;
  ControlPath.Fill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlPath.Fill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFPath.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlPath.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlPath.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFPath.FillGradientLinearAngle(FAngle: Single);
begin
  ControlPath.Fill.Kind := TBrushKind.Gradient;
  ControlPath.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlPath.Fill, FAngle);
end;

procedure TFPath.FillGradientRadialAngle(FAngle: Single);
begin
  ControlPath.Fill.Kind := TBrushKind.Gradient;
  ControlPath.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlPath.Fill, FAngle);
end;

procedure TFPath.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlPath.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlPath.Fill, X1, Y1, X2, Y2);
end;

procedure TFPath.StrokeColor(FColor: TAlphaColor);
begin
  ControlPath.Stroke.Kind := TBrushKind.Solid;
  ControlPath.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFPath.StrokePicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlPath.Stroke.Kind := TBrushKind.Bitmap;
  ControlPath.Stroke.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlPath.Stroke.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFPath.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlPath.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlPath.Stroke, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFPath.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlPath.Stroke.Kind := TBrushKind.Gradient;
  ControlPath.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlPath.Stroke, FAngle);
end;

procedure TFPath.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlPath.Stroke.Kind := TBrushKind.Gradient;
  ControlPath.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlPath.Stroke, FAngle);
end;

procedure TFPath.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlPath.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlPath.Stroke, X1, Y1, X2, Y2);
end;

procedure TFPath.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlPath.Stroke.Kind := TBrushKind.Solid;
  ControlPath.Stroke.Thickness := FThickness;
  ControlPath.Stroke.Cap := TStrokeCap(CapStyle);
  ControlPath.Stroke.Dash := TStrokeDash(Dash);
  ControlPath.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFPath.Opacity(FOpacity: Single);
begin
  ControlPath.Opacity := FOpacity;
end;

procedure TFPath.RotationAngle(FValue: Single);
begin
  ControlPath.RotationAngle := FValue;
end;

procedure TFPath.RotationCenter(X, Y: Single);
begin
  ControlPath.RotationCenter.X := X;
  ControlPath.RotationCenter.Y := Y;
end;

procedure TFPath.Enabled(FEnabled: Boolean);
begin
  ControlPath.Enabled := FEnabled;
end;

procedure TFPath.Visible(FVisible: Boolean);
begin
  ControlPath.Visible := FVisible;
end;

procedure TFPath.HitTest(FEnabled: Boolean);
begin
  ControlPath.HitTest := FEnabled;
end;

function TFPath.IsVisible: Boolean;
begin
  Result := ControlPath.Visible;
end;

function TFPath.GetTag: Integer;
begin
  Result := ControlPath.Tag;
end;

function TFPath.GetLeft: Single;
begin
  Result := ControlPath.Position.X;
end;

function TFPath.GetTop: Single;
begin
  Result := ControlPath.Position.Y;
end;

function TFPath.GetHeight: Single;
begin
  Result := ControlPath.Size.Height;
end;

function TFPath.GetWidth: Single;
begin
  Result := ControlPath.Size.Width;
end;

function TFPath.GetObject: TFmxObject;
begin
  Result := ControlPath;
end;

procedure TFPath.OnClick(Event: TNotifyEvent);
begin
  ControlPath.OnClick := TNotifyEvent(Event);
end;

procedure TFPath.OnMouseDown(Event: TMouseEvent);
begin
  ControlPath.OnMouseDown := TMouseEvent(Event);
end;

procedure TFPath.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlPath.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFPath.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlPath.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFPath.OnMouseUp(Event: TMouseEvent);
begin
  ControlPath.OnMouseUp := TMouseEvent(Event);
end;

procedure TFPath.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlPath.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFPath.Handle: TFmxObject;
begin
  Result := ControlPath;
end;

// =============================================================================
// FImage
// =============================================================================
procedure TFImage.FCreate(FParent: TFmxObject);
begin
  ControlImage := TImage.Create(nil);
  ControlImage.Parent := FParent;
end;

procedure TFImage.Cursor(FCursor: TCursor);
begin
  ControlImage.Cursor := TCursor(FCursor);
end;

procedure TFImage.Left(FLeft: Single);
begin
  ControlImage.Position.X := FLeft;
end;

procedure TFImage.Top(FTop: Single);
begin
  ControlImage.Position.Y := FTop;
end;

procedure TFImage.Height(FHeight: Single);
begin
  ControlImage.Size.Height := FHeight;
end;

procedure TFImage.Width(FWidth: Single);
begin
  ControlImage.Size.Width := FWidth;
end;

procedure TFImage.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlImage.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFImage.Position(X, Y: Single);
begin
  ControlImage.Position.X := X;
  ControlImage.Position.Y := Y;
end;

procedure TFImage.Align(Al: TAlignLayout);
begin
  ControlImage.Align := TAlignLayout(Al);
end;

procedure TFImage.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImage.Margins.Left := FLeft;
  ControlImage.Margins.Top := FTop;
  ControlImage.Margins.Right := FRight;
  ControlImage.Margins.Bottom := FBottom;
end;

procedure TFImage.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImage.Padding.Left := FLeft;
  ControlImage.Padding.Top := FTop;
  ControlImage.Padding.Right := FRight;
  ControlImage.Padding.Bottom := FBottom;
end;

procedure TFImage.SetHint(const FText: WideString);
begin
  ControlImage.ShowHint := True;
  ControlImage.Hint := string(FText);
end;

procedure TFImage.SetClipChildren(FValue: Boolean);
begin
  ControlImage.ClipChildren := FValue;
end;

procedure TFImage.SetClipParent(FValue: Boolean);
begin
  ControlImage.ClipParent := FValue;
end;

procedure TFImage.BringToFront;
begin
  ControlImage.BringToFront;
end;

procedure TFImage.SendToBack;
begin
  ControlImage.SendToBack;
end;

procedure TFImage.SetTag(FTag: Integer);
begin
  ControlImage.Tag := FTag;
end;

procedure TFImage.LoadPicture(const FImage: WideString;
  WrapMode: TImageWrapMode);
begin
  ControlImage.WrapMode := TImageWrapMode(WrapMode);
  ControlImage.Bitmap.LoadFromfile(string(FImage));
end;

procedure TFImage.SavePicture(const FImage: WideString);
begin
  if FImage = '' then
    Exit;

  ControlImage.Bitmap.SaveToFile(string(FImage));
end;

procedure TFImage.LoadPictureFromImgList(const FIndex: Integer;
  FImgList: TImageList);
begin
  FImgList := TImageList(FImgList);

  if (FImgList = nil) or (FIndex < 0) or (FIndex >= FImgList.Source.Count) then
    Exit;

  if FImgList.Source.Items[FIndex].MultiResBitmap.Count = 0 then
    Exit;

  ControlImage.Bitmap.Assign(
    FImgList.Source.Items[FIndex].MultiResBitmap.Items[0].Bitmap);
end;

procedure TFImage.BitmapMargins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImage.BitmapMargins.Left := FLeft;
  ControlImage.BitmapMargins.Top := FTop;
  ControlImage.BitmapMargins.Right := FRight;
  ControlImage.BitmapMargins.Bottom := FBottom;
end;

procedure TFImage.MarginWrapMode(WrapMode: TImageWrapMode);
begin
  ControlImage.MarginWrapMode := TImageWrapMode(WrapMode);
end;

procedure TFImage.Opacity(FOpacity: Single);
begin
  ControlImage.Opacity := FOpacity;
end;

procedure TFImage.RotationAngle(FValue: Single);
begin
  ControlImage.RotationAngle := FValue;
end;

procedure TFImage.RotationCenter(X, Y: Single);
begin
  ControlImage.RotationCenter.X := X;
  ControlImage.RotationCenter.Y := Y;
end;

procedure TFImage.Enabled(FEnabled: Boolean);
begin
  ControlImage.Enabled := FEnabled;
end;

procedure TFImage.Visible(FVisible: Boolean);
begin
  ControlImage.Visible := FVisible;
end;

procedure TFImage.HitTest(FEnabled: Boolean);
begin
  ControlImage.HitTest := FEnabled;
end;

function TFImage.IsVisible: Boolean;
begin
  Result := ControlImage.Visible;
end;

function TFImage.GetTag: Integer;
begin
  Result := ControlImage.Tag;
end;

function TFImage.GetLeft: Single;
begin
  Result := ControlImage.Position.X;
end;

function TFImage.GetTop: Single;
begin
  Result := ControlImage.Position.Y;
end;

function TFImage.GetHeight: Single;
begin
  Result := ControlImage.Size.Height;
end;

function TFImage.GetWidth: Single;
begin
  Result := ControlImage.Size.Width;
end;

function TFImage.GetObject: TFmxObject;
begin
  Result := ControlImage;
end;

procedure TFImage.OnClick(Event: TNotifyEvent);
begin
  ControlImage.OnClick := TNotifyEvent(Event);
end;

procedure TFImage.OnMouseDown(Event: TMouseEvent);
begin
  ControlImage.OnMouseDown := TMouseEvent(Event);
end;

procedure TFImage.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlImage.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFImage.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlImage.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFImage.OnMouseUp(Event: TMouseEvent);
begin
  ControlImage.OnMouseUp := TMouseEvent(Event);
end;

procedure TFImage.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlImage.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFImage.Handle: TFmxObject;
begin
  Result := ControlImage;
end;

// =============================================================================
// FCalloutRectangle
// =============================================================================
procedure TFCalloutRectangle.FCreate(FParent: TFmxObject);
begin
  ControlCalloutRect := TCalloutRectangle.Create(nil);
  ControlCalloutRect.Parent := FParent;
  ControlCalloutRect.Stroke.Thickness := 0;
end;

procedure TFCalloutRectangle.Cursor(FCursor: TCursor);
begin
  ControlCalloutRect.Cursor := TCursor(FCursor);
end;

procedure TFCalloutRectangle.Left(FLeft: Single);
begin
  ControlCalloutRect.Position.X := FLeft;
end;

procedure TFCalloutRectangle.Top(FTop: Single);
begin
  ControlCalloutRect.Position.Y := FTop;
end;

procedure TFCalloutRectangle.Height(FHeight: Single);
begin
  ControlCalloutRect.Size.Height := FHeight;
end;

procedure TFCalloutRectangle.Width(FWidth: Single);
begin
  ControlCalloutRect.Size.Width := FWidth;
end;

procedure TFCalloutRectangle.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlCalloutRect.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFCalloutRectangle.Position(X, Y: Single);
begin
  ControlCalloutRect.Position.X := X;
  ControlCalloutRect.Position.Y := Y;
end;

procedure TFCalloutRectangle.Align(Al: TAlignLayout);
begin
  ControlCalloutRect.Align := TAlignLayout(Al);
end;

procedure TFCalloutRectangle.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCalloutRect.Margins.Left := FLeft;
  ControlCalloutRect.Margins.Top := FTop;
  ControlCalloutRect.Margins.Right := FRight;
  ControlCalloutRect.Margins.Bottom := FBottom;
end;

procedure TFCalloutRectangle.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCalloutRect.Padding.Left := FLeft;
  ControlCalloutRect.Padding.Top := FTop;
  ControlCalloutRect.Padding.Right := FRight;
  ControlCalloutRect.Padding.Bottom := FBottom;
end;

procedure TFCalloutRectangle.SetHint(const FText: WideString);
begin
  ControlCalloutRect.ShowHint := True;
  ControlCalloutRect.Hint := string(FText);
end;

procedure TFCalloutRectangle.SetClipChildren(FValue: Boolean);
begin
  ControlCalloutRect.ClipChildren := FValue;
end;

procedure TFCalloutRectangle.SetClipParent(FValue: Boolean);
begin
  ControlCalloutRect.ClipParent := FValue;
end;

procedure TFCalloutRectangle.BringToFront;
begin
  ControlCalloutRect.BringToFront;
end;

procedure TFCalloutRectangle.SendToBack;
begin
  ControlCalloutRect.SendToBack;
end;

procedure TFCalloutRectangle.SetTag(FTag: Integer);
begin
  ControlCalloutRect.Tag := FTag;
end;

procedure TFCalloutRectangle.CalloutWidth(FWidth: Single);
begin
  ControlCalloutRect.CalloutWidth := FWidth;
end;

procedure TFCalloutRectangle.CalloutLength(FLength: Single);
begin
  ControlCalloutRect.CalloutLength := FLength;
end;

procedure TFCalloutRectangle.CalloutOffset(FOffset: Single);
begin
  ControlCalloutRect.CalloutOffset := FOffset;
end;

procedure TFCalloutRectangle.CalloutPosition(FPosition: TCalloutPosition);
begin
  ControlCalloutRect.CalloutPosition := TCalloutPosition(FPosition);
end;

procedure TFCalloutRectangle.FillColor(FColor: TAlphaColor);
begin
  ControlCalloutRect.Fill.Kind := TBrushKind.Solid;
  ControlCalloutRect.Fill.Color := TAlphaColor(FColor);
end;

procedure TFCalloutRectangle.FillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlCalloutRect.Fill.Kind := TBrushKind.Bitmap;
  ControlCalloutRect.Fill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlCalloutRect.Fill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFCalloutRectangle.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlCalloutRect.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlCalloutRect.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFCalloutRectangle.FillGradientLinearAngle(FAngle: Single);
begin
  ControlCalloutRect.Fill.Kind := TBrushKind.Gradient;
  ControlCalloutRect.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlCalloutRect.Fill, FAngle);
end;

procedure TFCalloutRectangle.FillGradientRadialAngle(FAngle: Single);
begin
  ControlCalloutRect.Fill.Kind := TBrushKind.Gradient;
  ControlCalloutRect.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlCalloutRect.Fill, FAngle);
end;

procedure TFCalloutRectangle.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlCalloutRect.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlCalloutRect.Fill, X1, Y1, X2, Y2);
end;

procedure TFCalloutRectangle.StrokeColor(FColor: TAlphaColor);
begin
  ControlCalloutRect.Stroke.Kind := TBrushKind.Solid;
  ControlCalloutRect.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFCalloutRectangle.StrokePicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlCalloutRect.Stroke.Kind := TBrushKind.Bitmap;
  ControlCalloutRect.Stroke.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlCalloutRect.Stroke.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFCalloutRectangle.StrokeGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlCalloutRect.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlCalloutRect.Stroke, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFCalloutRectangle.StrokeGradientLinearAngle(FAngle: Single);
begin
  ControlCalloutRect.Stroke.Kind := TBrushKind.Gradient;
  ControlCalloutRect.Stroke.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlCalloutRect.Stroke, FAngle);
end;

procedure TFCalloutRectangle.StrokeGradientRadialAngle(FAngle: Single);
begin
  ControlCalloutRect.Stroke.Kind := TBrushKind.Gradient;
  ControlCalloutRect.Stroke.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlCalloutRect.Stroke, FAngle);
end;

procedure TFCalloutRectangle.StrokeGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlCalloutRect.Stroke.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlCalloutRect.Stroke, X1, Y1, X2, Y2);
end;

procedure TFCalloutRectangle.StrokeSetting(FThickness: Single;
  CapStyle: TStrokeCap; Dash: TStrokeDash; Join: TStrokeJoin);
begin
  ControlCalloutRect.Stroke.Kind := TBrushKind.Solid;
  ControlCalloutRect.Stroke.Thickness := FThickness;
  ControlCalloutRect.Stroke.Cap := TStrokeCap(CapStyle);
  ControlCalloutRect.Stroke.Dash := TStrokeDash(Dash);
  ControlCalloutRect.Stroke.Join := TStrokeJoin(Join);
end;

procedure TFCalloutRectangle.CornerStyle(XRadi, YRadi: Single;
  FCorners: TCorners; FCornerType: TCornerType);
begin
  ControlCalloutRect.CornerType := TCornerType(FCornerType);
  ControlCalloutRect.Corners := TCorners(FCorners);
  ControlCalloutRect.XRadius := XRadi;
  ControlCalloutRect.YRadius := YRadi;
end;

procedure TFCalloutRectangle.Opacity(FOpacity: Single);
begin
  ControlCalloutRect.Opacity := FOpacity;
end;

procedure TFCalloutRectangle.RotationAngle(FValue: Single);
begin
  ControlCalloutRect.RotationAngle := FValue;
end;

procedure TFCalloutRectangle.RotationCenter(X, Y: Single);
begin
  ControlCalloutRect.RotationCenter.X := X;
  ControlCalloutRect.RotationCenter.Y := Y;
end;

procedure TFCalloutRectangle.Enabled(FEnabled: Boolean);
begin
  ControlCalloutRect.Enabled := FEnabled;
end;

procedure TFCalloutRectangle.Visible(FVisible: Boolean);
begin
  ControlCalloutRect.Visible := FVisible;
end;

procedure TFCalloutRectangle.HitTest(FEnabled: Boolean);
begin
  ControlCalloutRect.HitTest := FEnabled;
end;

function TFCalloutRectangle.IsVisible: Boolean;
begin
  Result := ControlCalloutRect.Visible;
end;

function TFCalloutRectangle.GetTag: Integer;
begin
  Result := ControlCalloutRect.Tag;
end;

function TFCalloutRectangle.GetLeft: Single;
begin
  Result := ControlCalloutRect.Position.X;
end;

function TFCalloutRectangle.GetTop: Single;
begin
  Result := ControlCalloutRect.Position.Y;
end;

function TFCalloutRectangle.GetHeight: Single;
begin
  Result := ControlCalloutRect.Size.Height;
end;

function TFCalloutRectangle.GetWidth: Single;
begin
  Result := ControlCalloutRect.Size.Width;
end;

function TFCalloutRectangle.GetObject: TFmxObject;
begin
  Result := ControlCalloutRect;
end;

procedure TFCalloutRectangle.OnClick(Event: TNotifyEvent);
begin
  ControlCalloutRect.OnClick := TNotifyEvent(Event);
end;

procedure TFCalloutRectangle.OnMouseDown(Event: TMouseEvent);
begin
  ControlCalloutRect.OnMouseDown := TMouseEvent(Event);
end;

procedure TFCalloutRectangle.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlCalloutRect.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFCalloutRectangle.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlCalloutRect.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFCalloutRectangle.OnMouseUp(Event: TMouseEvent);
begin
  ControlCalloutRect.OnMouseUp := TMouseEvent(Event);
end;

procedure TFCalloutRectangle.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlCalloutRect.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFCalloutRectangle.Handle: TFmxObject;
begin
  Result := ControlCalloutRect;
end;

// =============================================================================
// Exports
// =============================================================================
function InitLineHandle: FLine;
begin
  Result := TFLine.Create;
end;

function InitRectangleHandle: FRectangle;
begin
  Result := TFRectangle.Create;
end;

function InitRoundRectHandle: FRoundRect;
begin
  Result := TFRoundRect.Create;
end;

function InitEllipseHandle: FEllipse;
begin
  Result := TFEllipse.Create;
end;

function InitCircleHandle: FCircle;
begin
  Result := TFCircle.Create;
end;

function InitArcHandle: FArc;
begin
  Result := TFArc.Create;
end;

function InitPieHandle: FPie;
begin
  Result := TFPie.Create;
end;

function InitTextHandle: FText;
begin
  Result := TFText.Create;
end;

function InitPathHandle: FPath;
begin
  Result := TFPath.Create;
end;

function InitImageHandle: FImage;
begin
  Result := TFImage.Create;
end;

function InitCalloutRectangleHandle: FCalloutRectangle;
begin
  Result := TFCalloutRectangle.Create;
end;

exports
  InitLineHandle,
  InitRectangleHandle,
  InitRoundRectHandle,
  InitEllipseHandle,
  InitCircleHandle,
  InitArcHandle,
  InitPieHandle,
  InitTextHandle,
  InitPathHandle,
  InitImageHandle,
  InitCalloutRectangleHandle;

end.
