
unit FMXBridge.ShapeControls;

interface

uses
  System.Classes, System.UITypes,
  FMX.Objects, FMX.Types, FMX.Graphics, FMX.Ani;

// =============================================================================
// FShapeArc
// =============================================================================
type
  FShapeArc = interface(IUnknown)
    ['{0A089D80-A6E3-47D8-BECC-49404EC404F4}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth: Single); stdcall;
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
    procedure BackStrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function GetValue: Single; stdcall;
    function GetMax: Single; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFShapeArc = class(TInterfacedObject, FShapeArc)
  private
    FBack: TArc;
    FArc: TArc;
    FPct: TText;
    FMin: Single;
    FMax: Single;
    FValue: Single;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth: Single); stdcall;
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
    procedure BackStrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function GetValue: Single; stdcall;
    function GetMax: Single; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FShapeSwitch
// =============================================================================
type
  FShapeSwitch = interface(IUnknown)
    ['{12D91194-172F-4B4A-8CC3-43B66ADF3871}']
    procedure FCreate(FParent: TFmxObject; FRound: Boolean); stdcall;
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
    procedure SetChecked(FValue: Boolean); stdcall;
    procedure Thickness(FThickness: Single); stdcall;
    procedure ColorOn(FColor: TAlphaColor); stdcall;
    procedure StrokeOn(FColor: TAlphaColor); stdcall;
    procedure ColorOff(FColor: TAlphaColor); stdcall;
    procedure StrokeOff(FColor: TAlphaColor); stdcall;
    procedure SlideWidth(FWidth: Single); stdcall;
    procedure SlideColorOn(FColor: TAlphaColor); stdcall;
    procedure SlideColorOff(FColor: TAlphaColor); stdcall;
    procedure SlideInset(FValue: Single); stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFShapeSwitch = class(TInterfacedObject, FShapeSwitch)
  private
    FTrack: TShape;
    FThumb: TShape;
    FThumbWidth: Single;
    FChecked: Boolean;
    FRounded: Boolean;
    FColorOn: TAlphaColor;
    FColorOff: TAlphaColor;
    FStrokeOn: TAlphaColor;
    FStrokeOff: TAlphaColor;
    FSlideColorOn: TAlphaColor;
    FSlideColorOff: TAlphaColor;
    FSlideInset: Single;
    FOnClick: TNotifyEvent;
    FOnChange: TNotifyEvent;
    function ThumbLeft: Single;
    function ThumbRight: Single;
    procedure UpdateThumb;
    procedure UpdateLayout;
    procedure InternalClick(Sender: TObject);
  public
    procedure FCreate(FParent: TFmxObject; FRound: Boolean); stdcall;
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
    procedure SetChecked(FValue: Boolean); stdcall;
    procedure Thickness(FThickness: Single); stdcall;
    procedure ColorOn(FColor: TAlphaColor); stdcall;
    procedure StrokeOn(FColor: TAlphaColor); stdcall;
    procedure ColorOff(FColor: TAlphaColor); stdcall;
    procedure StrokeOff(FColor: TAlphaColor); stdcall;
    procedure SlideWidth(FWidth: Single); stdcall;
    procedure SlideColorOn(FColor: TAlphaColor); stdcall;
    procedure SlideColorOff(FColor: TAlphaColor); stdcall;
    procedure SlideInset(FValue: Single); stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FShapeButton
// =============================================================================
type
  FShapeButton = interface(IUnknown)
    ['{AAE05579-71D9-475E-99D6-AB9F759AABFB}']
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
    procedure BackColor(FColor: TAlphaColor); stdcall;
    procedure StrokeColor(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Corner(FRadius: Single); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure TextColor(FColor: TAlphaColor); stdcall;
    procedure TextHorzAlign(FHorzAlign: TTextAlign); stdcall;
    procedure Repaint; stdcall;
    procedure SetFocus; stdcall;
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
    function Handle: TFmxObject; stdcall;
  end;

  TFShapeButton = class(TInterfacedObject, FShapeButton)
  private
    FBackground: TRectangle;
    FBackColor: TAlphaColor;
    FCaption: TText;
    FDown: Boolean;
    FHover: Boolean;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FOnMouseDown: TMouseEvent;
    FOnMouseUp: TMouseEvent;
    procedure InternalMouseEnter(Sender: TObject);
    procedure InternalMouseLeave(Sender: TObject);
    procedure InternalMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure InternalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
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
    procedure BackColor(FColor: TAlphaColor); stdcall;
    procedure StrokeColor(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Corner(FRadius: Single); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure TextColor(FColor: TAlphaColor); stdcall;
    procedure TextHorzAlign(FHorzAlign: TTextAlign); stdcall;
    procedure Repaint; stdcall;
    procedure SetFocus; stdcall;
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
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FShapeGradientButton
// =============================================================================
type
  FShapeGradientButton = interface(IUnknown)
    ['{CCC4AEE5-CC87-44D8-89C9-D13C6C24C9B9}']
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
    procedure BackColor(FColor1, FColor2: TAlphaColor); stdcall;
    procedure GradientPosition(FVerticle: Boolean); stdcall;
    procedure CusGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Corner(FRadius: Single); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure TextColor(FColor: TAlphaColor); stdcall;
    procedure TextHorzAlign(FHorzAlign: TTextAlign); stdcall;
    procedure Repaint; stdcall;
    procedure SetFocus; stdcall;
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
    function Handle: TFmxObject; stdcall;
  end;

  TFShapeGradientButton = class(TInterfacedObject, FShapeGradientButton)
  private
    FBackground: TRectangle;
    FGradColor1: TAlphaColor;
    FGradColor2: TAlphaColor;
    FGradientPositionLocked: Boolean;
    FGradPosX1: Single;
    FGradPosY1: Single;
    FGradPosX2: Single;
    FGradPosY2: Single;
    FCaption: TText;
    FDown: Boolean;
    FHover: Boolean;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FOnMouseDown: TMouseEvent;
    FOnMouseUp: TMouseEvent;
    procedure InternalMouseEnter(Sender: TObject);
    procedure InternalMouseLeave(Sender: TObject);
    procedure InternalMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure InternalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure UpdateGradient(const AColor1, AColor2: TAlphaColor);
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
    procedure BackColor(FColor1, FColor2: TAlphaColor); stdcall;
    procedure GradientPosition(FVerticle: Boolean); stdcall;
    procedure CusGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Corner(FRadius: Single); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure TextColor(FColor: TAlphaColor); stdcall;
    procedure TextHorzAlign(FHorzAlign: TTextAlign); stdcall;
    procedure Repaint; stdcall;
    procedure SetFocus; stdcall;
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
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FShapeProgressBar
// =============================================================================
type
  FShapeProgressBar = interface(IUnknown)
    ['{F31C763A-F195-40BD-8CEC-953A6DB85270}']
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
    procedure BackColor(FColor: TAlphaColor); stdcall;
    procedure BackStroke(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Stroke(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Gradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure GradientLinearAngle(FAngle: Single); stdcall;
    procedure GradientRadialAngle(FAngle: Single); stdcall;
    procedure GradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure GradientAnimSetup(FAnimationType: TAnimationType;
      FDuration, FDelay: Single; FInverse, FAutoReverse,
      FLoop: Boolean); stdcall;
    procedure GradientAnimInterpolation(FInterpolation
      : TInterpolationType); stdcall;
    procedure GradientAnimColors(FColor1, FColor2, FColor3,
      FColor4: TAlphaColor); stdcall;
    procedure GradientAnimEnable(FEnabled: Boolean); stdcall;
    procedure Corner(FRadius: Single); stdcall;
    procedure Inset(FPadding: Single); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function GetValue: Single; stdcall;
    function GetMax: Single; stdcall;
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

  TFShapeProgressBar = class(TInterfacedObject, FShapeProgressBar)
  private
    FTrack: TRectangle;
    FIndicator: TRectangle;
    FGradientAnim: TGradientAnimation;
    FMin: Single;
    FMax: Single;
    FValue: Single;
    procedure EnsureGradient;
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
    procedure BackColor(FColor: TAlphaColor); stdcall;
    procedure BackStroke(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Stroke(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Gradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure GradientLinearAngle(FAngle: Single); stdcall;
    procedure GradientRadialAngle(FAngle: Single); stdcall;
    procedure GradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure GradientAnimSetup(FAnimationType: TAnimationType;
      FDuration, FDelay: Single; FInverse, FAutoReverse,
      FLoop: Boolean); stdcall;
    procedure GradientAnimInterpolation(FInterpolation
      : TInterpolationType); stdcall;
    procedure GradientAnimColors(FColor1, FColor2, FColor3,
      FColor4: TAlphaColor); stdcall;
    procedure GradientAnimEnable(FEnabled: Boolean); stdcall;
    procedure Corner(FRadius: Single); stdcall;
    procedure Inset(FPadding: Single); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function GetValue: Single; stdcall;
    function GetMax: Single; stdcall;
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
function InitShapeArcHandle: FShapeArc; stdcall;
function InitShapeSwitchHandle: FShapeSwitch; stdcall;
function InitShapeButtonHandle: FShapeButton; stdcall;
function InitShapeGradientButtonHandle: FShapeGradientButton; stdcall;
function InitShapeProgressBarHandle: FShapeProgressBar; stdcall;

implementation

uses
  System.Types, System.Math, System.SysUtils;

// =============================================================================
// FShapeArc
// =============================================================================
procedure TFShapeArc.FCreate(FParent: TFmxObject);
begin
  FMin := 0;
  FMax := 100;
  FValue := 0;

  FBack := TArc.Create(nil);
  FBack.Parent := TFmxObject(FParent);
  FBack.Height := 115;
  FBack.Width := FBack.Height;
  FBack.Fill.Kind := TBrushKind.None;
  FBack.Stroke.Kind := TBrushKind.Solid;
  FBack.Stroke.Thickness := 8;
  FBack.Stroke.Color := $25000000;
  FBack.Stroke.Cap := TStrokeCap.Round;
  FBack.Stroke.Dash := TStrokeDash.Solid;
  FBack.StartAngle := -90.0;
  FBack.EndAngle := 360.0;

  FArc := TArc.Create(nil);
  FArc.Parent := FBack;
  FArc.Align := TAlignLayout.Contents;
  FArc.Fill.Kind := TBrushKind.None;
  FArc.Stroke.Kind := TBrushKind.Solid;
  FArc.Stroke.Color := $FF005FB8;
  FArc.Stroke.Thickness := 8;
  FArc.Stroke.Cap := TStrokeCap.Round;
  FArc.Stroke.Dash := TStrokeDash.Solid;
  FArc.StartAngle := -90.0;
  FArc.EndAngle := 0;
  FArc.HitTest := False;

  FPct := TText.Create(nil);
  FPct.Parent := FArc;
  FPct.Margins.Left := 7;
  FPct.Align := TAlignLayout.Client;
  FPct.TextSettings.Font.Family := 'Segoe UI Bold';
  FPct.TextSettings.Font.Size := 24;
  FPct.TextSettings.FontColor := $FF000000;
  FPct.TextSettings.HorzAlign := TTextAlign.Center;
  FPct.TextSettings.VertAlign := TTextAlign.Center;
  FPct.TextSettings.WordWrap := False;
  FPct.HitTest := False;
end;

procedure TFShapeArc.Cursor(FCursor: TCursor);
begin
  FBack.Cursor := TCursor(FCursor);
end;

procedure TFShapeArc.Left(FLeft: Single);
begin
  FBack.Position.X := FLeft;
end;

procedure TFShapeArc.Top(FTop: Single);
begin
  FBack.Position.Y := FTop;
end;

procedure TFShapeArc.Width(FWidth: Single);
begin
  FBack.Size.Width := FWidth;
end;

procedure TFShapeArc.SetBounds(FLeft, FTop, FWidth: Single);
begin
  FBack.SetBounds(FLeft, FTop, FWidth, FWidth);
end;

procedure TFShapeArc.Position(X, Y: Single);
begin
  FBack.Position.X := X;
  FBack.Position.Y := Y;
end;

procedure TFShapeArc.Align(Al: TAlignLayout);
begin
  FBack.Align := TAlignLayout(Al);
end;

procedure TFShapeArc.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FBack.Margins.Left := FLeft;
  FBack.Margins.Top := FTop;
  FBack.Margins.Right := FRight;
  FBack.Margins.Bottom := FBottom;
end;

procedure TFShapeArc.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FBack.Padding.Left := FLeft;
  FBack.Padding.Top := FTop;
  FBack.Padding.Right := FRight;
  FBack.Padding.Bottom := FBottom;
end;

procedure TFShapeArc.SetHint(const FText: WideString);
begin
  FBack.ShowHint := True;
  FBack.Hint := string(FText);
end;

procedure TFShapeArc.SetClipParent(FValue: Boolean);
begin
  FBack.ClipChildren := FValue;
end;

procedure TFShapeArc.SetClipChildren(FValue: Boolean);
begin
  FBack.ClipParent := FValue;
end;

procedure TFShapeArc.BringToFront;
begin
  FBack.BringToFront;
end;

procedure TFShapeArc.SendToBack;
begin
  FBack.SendToBack;
end;

procedure TFShapeArc.SetTag(FTag: Integer);
begin
  FBack.Tag := FTag;
end;

procedure TFShapeArc.BackStrokeColor(FColor: TAlphaColor);
begin
  FBack.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFShapeArc.StrokeColor(FColor: TAlphaColor);
begin
  FArc.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFShapeArc.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash);
begin
  FBack.Stroke.Thickness := FThickness;
  FBack.Stroke.Cap := TStrokeCap(CapStyle);
  FBack.Stroke.Dash := TStrokeDash(Dash);

  FArc.Stroke.Thickness := FThickness;
  FArc.Stroke.Cap := TStrokeCap(CapStyle);
  FArc.Stroke.Dash := TStrokeDash(Dash);
end;

procedure TFShapeArc.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  FPct.TextSettings.Font.Family := string(FontName);
  FPct.TextSettings.Font.Size := FontSize;
  FPct.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFShapeArc.Max(FMax: Single);
begin
  if FMax <= FMin then
    Exit;

  Self.FMax := FMax;

  Value(FValue);
end;

procedure TFShapeArc.Min(FMin: Single);
begin
  if FMin >= FMax then
    Exit;

  Self.FMin := FMin;

  Value(FValue);
end;

procedure TFShapeArc.Value(FValue: Single);
var
  Percent: Single;
begin
  Self.FValue := FValue;

  if FMax <= FMin then
    Exit;

  Percent := (Self.FValue - FMin) / (FMax - FMin);

  if Percent < 0 then
    Percent := 0
  else if Percent > 1 then
    Percent := 1;

  FArc.EndAngle := (Percent * 360);

  FPct.Text := IntToStr(Round(Percent * 100)) + WideChar($FE6A);
end;

procedure TFShapeArc.Opacity(FOpacity: Single);
begin
  FBack.Opacity := FOpacity;
end;

procedure TFShapeArc.RotationAngle(FValue: Single);
begin
  FBack.RotationAngle := FValue;
end;

procedure TFShapeArc.RotationCenter(X, Y: Single);
begin
  FBack.RotationCenter.X := X;
  FBack.RotationCenter.Y := Y;
end;

procedure TFShapeArc.Enabled(FEnabled: Boolean);
begin
  FBack.Enabled := FEnabled;
end;

procedure TFShapeArc.Visible(FVisible: Boolean);
begin
  FBack.Visible := FVisible;
end;

procedure TFShapeArc.HitTest(FEnabled: Boolean);
begin
  FBack.HitTest := FEnabled;
end;

function TFShapeArc.GetValue: Single;
begin
  Result := FValue;
end;

function TFShapeArc.GetMax: Single;
begin
  Result := FMax;
end;

function TFShapeArc.IsVisible: Boolean;
begin
  Result := FBack.Visible;
end;

function TFShapeArc.GetTag: Integer;
begin
  Result := FBack.Tag;
end;

function TFShapeArc.GetLeft: Single;
begin
  Result := FBack.Position.X;
end;

function TFShapeArc.GetTop: Single;
begin
  Result := FBack.Position.Y;
end;

function TFShapeArc.GetWidth: Single;
begin
  Result := FBack.Width;
end;

function TFShapeArc.GetObject: TFmxObject;
begin
  Result := TFmxObject(FBack);
end;

procedure TFShapeArc.OnClick(Event: TNotifyEvent);
begin
  FBack.OnClick := TNotifyEvent(Event);
end;

procedure TFShapeArc.OnMouseEnter(Event: TNotifyEvent);
begin
  FBack.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFShapeArc.OnMouseLeave(Event: TNotifyEvent);
begin
  FBack.OnMouseLeave := TNotifyEvent(Event);
end;

function TFShapeArc.Handle: TFmxObject;
begin
  Result := TFmxObject(FBack);
end;

// =============================================================================
// FShapeSwitch
// =============================================================================
procedure TFShapeSwitch.FCreate(FParent: TFmxObject; FRound: Boolean);
begin
  FChecked := False;
  FRounded := FRound;

  FColorOn := $FF005FB8;
  FColorOff := $06000000;
  FStrokeOn := $FF005FB8;
  FStrokeOff := $9A000000;

  FSlideColorOn := $FFFFFFFF;
  FSlideColorOff := $9A000000;
  FSlideInset := 2;

  if FRounded then
  begin
    FTrack := TRoundRect.Create(nil);
    FThumb := TCircle.Create(nil);
  end
  else
  begin
    FTrack := TRectangle.Create(nil);
    FThumb := TRectangle.Create(nil);
  end;

  FTrack.Parent := TFmxObject(FParent);
  FTrack.Height := 20;
  FTrack.Width := 40;
  FTrack.Fill.Kind := TBrushKind.Solid;
  FTrack.Fill.Color := FColorOff;
  FTrack.Stroke.Kind := TBrushKind.Solid;
  FTrack.Stroke.Color := FStrokeOff;
  FTrack.Stroke.Thickness := 1;

  FThumb.Parent := FTrack;
  FThumbWidth := FTrack.Height - FSlideInset * 2;

  UpdateLayout;

  FThumb.Fill.Kind := TBrushKind.Solid;
  FThumb.Fill.Color := FSlideColorOff;
  FThumb.Stroke.Kind := TBrushKind.None;
  FThumb.HitTest := False;

  FTrack.OnClick := InternalClick;
end;

function TFShapeSwitch.ThumbLeft: Single;
begin
  Result := FSlideInset;
end;

function TFShapeSwitch.ThumbRight: Single;
begin
  Result := FTrack.Width - FThumb.Width - FSlideInset;
end;

procedure TFShapeSwitch.UpdateThumb;
begin
  if FChecked then
  begin
    TAnimator.AnimateFloat(FThumb, 'Position.X', ThumbRight, 0.12,
      TAnimationType.In, TInterpolationType.Linear);

    FTrack.Fill.Color := FColorOn;
    FTrack.Stroke.Color := FStrokeOn;

    FThumb.Fill.Color := FSlideColorOn;
  end
  else
  begin
    TAnimator.AnimateFloat(FThumb, 'Position.X', ThumbLeft, 0.12,
      TAnimationType.In, TInterpolationType.Linear);

    FTrack.Fill.Color := FColorOff;
    FTrack.Stroke.Color := FStrokeOff;

    FThumb.Fill.Color := FSlideColorOff;
  end;
end;

procedure TFShapeSwitch.UpdateLayout;
var
  W: Single;
begin
  W := FThumbWidth;

  if W > FTrack.Width - FSlideInset * 2 then
    W := FTrack.Width - FSlideInset * 2;

  if W < 0 then
    W := 0;

  FThumb.SetBounds(FThumb.Position.X, FSlideInset, W,
    FTrack.Height - FSlideInset * 2);

  UpdateThumb;
end;

procedure TFShapeSwitch.InternalClick(Sender: TObject);
begin
  SetChecked(not FChecked);

  if Assigned(FOnClick) then
    FOnClick(Sender);
end;

procedure TFShapeSwitch.Cursor(FCursor: TCursor);
begin
  FTrack.Cursor := TCursor(FCursor);
end;

procedure TFShapeSwitch.Left(FLeft: Single);
begin
  FTrack.Position.X := FLeft;
end;

procedure TFShapeSwitch.Top(FTop: Single);
begin
  FTrack.Position.Y := FTop;
end;

procedure TFShapeSwitch.Height(FHeight: Single);
begin
  FTrack.Height := FHeight;

  UpdateLayout;
end;

procedure TFShapeSwitch.Width(FWidth: Single);
begin
  FTrack.Width := FWidth;
end;

procedure TFShapeSwitch.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  FTrack.SetBounds(FLeft, FTop, FWidth, FHeight);

  UpdateLayout;
end;

procedure TFShapeSwitch.Position(X, Y: Single);
begin
  FTrack.Position.X := X;
  FTrack.Position.Y := Y;
end;

procedure TFShapeSwitch.Align(Al: TAlignLayout);
begin
  FTrack.Align := TAlignLayout(Al);
end;

procedure TFShapeSwitch.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FTrack.Margins.Left := FLeft;
  FTrack.Margins.Top := FTop;
  FTrack.Margins.Right := FRight;
  FTrack.Margins.Bottom := FBottom;
end;

procedure TFShapeSwitch.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FTrack.Padding.Left := FLeft;
  FTrack.Padding.Top := FTop;
  FTrack.Padding.Right := FRight;
  FTrack.Padding.Bottom := FBottom;
end;

procedure TFShapeSwitch.SetHint(const FText: WideString);
begin
  FTrack.ShowHint := True;
  FTrack.Hint := string(FText);
end;

procedure TFShapeSwitch.SetClipChildren(FValue: Boolean);
begin
  FTrack.ClipChildren := FValue;
end;

procedure TFShapeSwitch.SetClipParent(FValue: Boolean);
begin
  FTrack.ClipParent := FValue;
end;

procedure TFShapeSwitch.BringToFront;
begin
  FTrack.BringToFront;
end;

procedure TFShapeSwitch.SendToBack;
begin
  FTrack.SendToBack;
end;

procedure TFShapeSwitch.SetTag(FTag: Integer);
begin
  FTrack.Tag := FTag;
end;

procedure TFShapeSwitch.SetChecked(FValue: Boolean);
begin
  if FChecked = FValue then
    Exit;

  FChecked := FValue;

  UpdateThumb;

  if Assigned(FOnChange) then
    FOnChange(FTrack);
end;

procedure TFShapeSwitch.Thickness(FThickness: Single);
begin
  FTrack.Stroke.Thickness := FThickness;
end;

procedure TFShapeSwitch.ColorOn(FColor: TAlphaColor);
begin
  FColorOn := TAlphaColor(FColor);

  UpdateThumb;
end;

procedure TFShapeSwitch.StrokeOn(FColor: TAlphaColor);
begin
  FStrokeOn := TAlphaColor(FColor);

  UpdateThumb;
end;

procedure TFShapeSwitch.ColorOff(FColor: TAlphaColor);
begin
  FColorOff := TAlphaColor(FColor);

  UpdateThumb;
end;

procedure TFShapeSwitch.StrokeOff(FColor: TAlphaColor);
begin
  FStrokeOff := TAlphaColor(FColor);

  UpdateThumb;
end;

procedure TFShapeSwitch.SlideWidth(FWidth: Single);
begin
  FThumbWidth := FWidth;

  FThumb.Width := FThumbWidth;

  UpdateThumb;
end;

procedure TFShapeSwitch.SlideColorOn(FColor: TAlphaColor);
begin
  FSlideColorOn := TAlphaColor(FColor);

  UpdateThumb;
end;

procedure TFShapeSwitch.SlideColorOff(FColor: TAlphaColor);
begin
  FSlideColorOff := TAlphaColor(FColor);

  UpdateThumb;
end;

procedure TFShapeSwitch.SlideInset(FValue: Single);
begin
  FSlideInset := FValue;

  UpdateLayout;
end;

procedure TFShapeSwitch.Repaint;
begin
  FTrack.Repaint;
end;

procedure TFShapeSwitch.Opacity(FOpacity: Single);
begin
  FTrack.Opacity := FOpacity;
end;

procedure TFShapeSwitch.Enabled(FEnabled: Boolean);
begin
  FTrack.Enabled := FEnabled;
end;

procedure TFShapeSwitch.Visible(FVisible: Boolean);
begin
  FTrack.Visible := FVisible;
end;

procedure TFShapeSwitch.HitTest(FEnabled: Boolean);
begin
  FTrack.HitTest := FEnabled;
end;

function TFShapeSwitch.IsChecked: Boolean;
begin
  Result := FChecked;
end;

function TFShapeSwitch.IsVisible: Boolean;
begin
  Result := FTrack.Visible;
end;

function TFShapeSwitch.GetTag: Integer;
begin
  Result := FTrack.Tag;
end;

function TFShapeSwitch.GetLeft: Single;
begin
  Result := FTrack.Position.X;
end;

function TFShapeSwitch.GetTop: Single;
begin
  Result := FTrack.Position.Y;
end;

function TFShapeSwitch.GetHeight: Single;
begin
  Result := FTrack.Height;
end;

function TFShapeSwitch.GetWidth: Single;
begin
  Result := FTrack.Width;
end;

function TFShapeSwitch.GetObject: TFmxObject;
begin
  Result := FTrack;
end;

procedure TFShapeSwitch.OnClick(Event: TNotifyEvent);
begin
  FOnClick := TNotifyEvent(Event);
end;

procedure TFShapeSwitch.OnChange(Event: TNotifyEvent);
begin
  FOnChange := TNotifyEvent(Event);
end;

procedure TFShapeSwitch.OnMouseEnter(Event: TNotifyEvent);
begin
  FTrack.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFShapeSwitch.OnMouseLeave(Event: TNotifyEvent);
begin
  FTrack.OnMouseLeave := TNotifyEvent(Event);
end;

function TFShapeSwitch.Handle: TFmxObject;
begin
  Result := TFmxObject(FTrack);
end;

// =============================================================================
// FShapeButton
// =============================================================================
procedure TFShapeButton.FCreate(FParent: TFmxObject);
begin
  FBackColor := $FF0078D4;

  FBackground := TRectangle.Create(nil);
  FBackground.Parent := TFmxObject(FParent);
  FBackground.Height := 32;
  FBackground.Width := 100;
  FBackground.Fill.Kind := TBrushKind.Solid;
  FBackground.Fill.Color := FBackColor;
  FBackground.Stroke.Kind := TBrushKind.None;
  FBackground.XRadius := 4.0;
  FBackground.YRadius := 4.0;

  FCaption := TText.Create(nil);
  FCaption.Parent := FBackground;
  FCaption.Align := TAlignLayout.Contents;
  FCaption.TextSettings.Font.Family := 'Segoe UI';
  FCaption.TextSettings.Font.Size := 12;
  FCaption.TextSettings.FontColor := $FFFFFFFF;
  FCaption.TextSettings.HorzAlign := TTextAlign.Center;
  FCaption.TextSettings.VertAlign := TTextAlign.Center;
  FCaption.TextSettings.WordWrap := False;
  FCaption.Text := 'ShapeButton1';
  FCaption.HitTest := False;

  FBackground.OnMouseEnter := InternalMouseEnter;
  FBackground.OnMouseLeave := InternalMouseLeave;
  FBackground.OnMouseDown := InternalMouseDown;
  FBackground.OnMouseUp := InternalMouseUp;
end;

procedure TFShapeButton.InternalMouseEnter(Sender: TObject);
begin
  FHover := True;

  FBackground.Opacity := 0.86;

  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Sender);
end;

procedure TFShapeButton.InternalMouseLeave(Sender: TObject);
begin
  FHover := False;
  FDown := False;

  FBackground.Opacity := 1.0;

  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Sender);
end;

procedure TFShapeButton.InternalMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if Button <> TMouseButton.mbLeft then
    Exit;

  FBackground.SetFocus;

  FDown := True;

  FBackground.Opacity := 1.0;

  if Assigned(FOnMouseDown) then
    FOnMouseDown(Sender, Button, Shift, X, Y);
end;

procedure TFShapeButton.InternalMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if Button <> TMouseButton.mbLeft then
    Exit;

  FDown := False;

  if FHover then
    FBackground.Opacity := 0.86
  else
    FBackground.Opacity := 1.0;

  if Assigned(FOnMouseUp) then
    FOnMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TFShapeButton.Cursor(FCursor: TCursor);
begin
  FBackground.Cursor := TCursor(FCursor);
end;

procedure TFShapeButton.Left(FLeft: Single);
begin
  FBackground.Position.X := FLeft;
end;

procedure TFShapeButton.Top(FTop: Single);
begin
  FBackground.Position.Y := FTop;
end;

procedure TFShapeButton.Height(FHeight: Single);
begin
  FBackground.Size.Height := FHeight;
end;

procedure TFShapeButton.Width(FWidth: Single);
begin
  FBackground.Size.Width := FWidth;
end;

procedure TFShapeButton.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  FBackground.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFShapeButton.Position(X, Y: Single);
begin
  FBackground.Position.X := X;
  FBackground.Position.Y := Y;
end;

procedure TFShapeButton.Align(Al: TAlignLayout);
begin
  FBackground.Align := TAlignLayout(Al);
end;

procedure TFShapeButton.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FBackground.Margins.Left := FLeft;
  FBackground.Margins.Top := FTop;
  FBackground.Margins.Right := FRight;
  FBackground.Margins.Bottom := FBottom;
end;

procedure TFShapeButton.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FBackground.Padding.Left := FLeft;
  FBackground.Padding.Top := FTop;
  FBackground.Padding.Right := FRight;
  FBackground.Padding.Bottom := FBottom;
end;

procedure TFShapeButton.SetHint(const FText: WideString);
begin
  FBackground.ShowHint := True;
  FBackground.Hint := string(FText);
end;

procedure TFShapeButton.SetClipChildren(FValue: Boolean);
begin
  FBackground.ClipChildren := FValue;
end;

procedure TFShapeButton.SetClipParent(FValue: Boolean);
begin
  FBackground.ClipParent := FValue;
end;

procedure TFShapeButton.BringToFront;
begin
  FBackground.BringToFront;
end;

procedure TFShapeButton.SendToBack;
begin
  FBackground.SendToBack;
end;

procedure TFShapeButton.SetTag(FTag: Integer);
begin
  FBackground.Tag := FTag;
end;

procedure TFShapeButton.BackColor(FColor: TAlphaColor);
begin
  FBackColor := TAlphaColor(FColor);
  FBackground.Fill.Color := FBackColor;
end;

procedure TFShapeButton.StrokeColor(FColor: TAlphaColor; FThickness: Single);
begin
  FBackground.Stroke.Kind := TBrushKind.Solid;
  FBackground.Stroke.Color := TAlphaColor(FColor);
  FBackground.Stroke.Thickness := FThickness;
end;

procedure TFShapeButton.Corner(FRadius: Single);
begin
  FBackground.XRadius := FRadius;
  FBackground.YRadius := FRadius;
end;

procedure TFShapeButton.Text(const FText: WideString);
begin
  FCaption.Text := string(FText);
end;

procedure TFShapeButton.FontSetting(const FontName: WideString;
  FontSize: Single; FColor: TAlphaColor);
begin
  FCaption.TextSettings.Font.Family := string(FontName);
  FCaption.TextSettings.Font.Size := FontSize;
  FCaption.TextSettings.FontColor := TAlphaColor(FColor);
end;

procedure TFShapeButton.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  FCaption.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  FCaption.TextSettings.VertAlign := TTextAlign(FVertAlign);
  FCaption.TextSettings.WordWrap := FWordWrap;
end;

procedure TFShapeButton.TextColor(FColor: TAlphaColor);
begin
  FCaption.TextSettings.FontColor := TAlphaColor(FColor);
end;

procedure TFShapeButton.TextHorzAlign(FHorzAlign: TTextAlign);
begin
  FCaption.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
end;

procedure TFShapeButton.Repaint;
begin
  FBackground.Repaint;
  FCaption.Repaint;
end;

procedure TFShapeButton.SetFocus;
begin
  FBackground.SetFocus;
end;

procedure TFShapeButton.Opacity(FOpacity: Single);
begin
  FBackground.Opacity := FOpacity;
end;

procedure TFShapeButton.RotationAngle(FValue: Single);
begin
  FBackground.RotationAngle := FValue;
end;

procedure TFShapeButton.RotationCenter(X, Y: Single);
begin
  FBackground.RotationCenter.X := X;
  FBackground.RotationCenter.Y := Y;
end;

procedure TFShapeButton.Enabled(FEnabled: Boolean);
begin
  FBackground.Enabled := FEnabled;
end;

procedure TFShapeButton.Visible(FVisible: Boolean);
begin
  FBackground.Visible := FVisible;
end;

procedure TFShapeButton.HitTest(FEnabled: Boolean);
begin
  FBackground.HitTest := FEnabled;
end;

function TFShapeButton.IsVisible: Boolean;
begin
  Result := FBackground.Visible;
end;

function TFShapeButton.GetText: WideString;
begin
  Result := FCaption.Text;
end;

function TFShapeButton.GetTag: Integer;
begin
  Result := FBackground.Tag;
end;

function TFShapeButton.GetLeft: Single;
begin
  Result := FBackground.Position.X;
end;

function TFShapeButton.GetTop: Single;
begin
  Result := FBackground.Position.Y;
end;

function TFShapeButton.GetHeight: Single;
begin
  Result := FBackground.Height;
end;

function TFShapeButton.GetWidth: Single;
begin
  Result := FBackground.Width;
end;

function TFShapeButton.GetObject: TFmxObject;
begin
  Result := TFmxObject(FBackground);
end;

procedure TFShapeButton.OnClick(Event: TNotifyEvent);
begin
  FBackground.OnClick := TNotifyEvent(Event);
end;

procedure TFShapeButton.OnMouseDown(Event: TMouseEvent);
begin
  FOnMouseDown := TMouseEvent(Event);
end;

procedure TFShapeButton.OnMouseEnter(Event: TNotifyEvent);
begin
  FOnMouseEnter := TNotifyEvent(Event);
end;

procedure TFShapeButton.OnMouseLeave(Event: TNotifyEvent);
begin
  FOnMouseLeave := TNotifyEvent(Event);
end;

procedure TFShapeButton.OnMouseUp(Event: TMouseEvent);
begin
  FOnMouseUp := TMouseEvent(Event);
end;

function TFShapeButton.Handle: TFmxObject;
begin
  Result := TFmxObject(FBackground);
end;

// =============================================================================
// FShapeGradientButton
// =============================================================================
procedure TFShapeGradientButton.FCreate(FParent: TFmxObject);
begin
  FGradColor1 := $FFDC143C;
  FGradColor2 := $FF000000;
  FGradientPositionLocked := False;
  FGradPosX1 := 0;
  FGradPosY1 := 0;
  FGradPosX2 := 0;
  FGradPosY2 := 1;

  FBackground := TRectangle.Create(nil);
  FBackground.Parent := TFmxObject(FParent);
  FBackground.Height := 32;
  FBackground.Width := 100;
  FBackground.Fill.Kind := TBrushKind.Gradient;
  FBackground.Fill.Gradient.Style := TGradientStyle.Linear;

  UpdateGradient(FGradColor1, FGradColor2);

  FBackground.Stroke.Kind := TBrushKind.None;
  FBackground.XRadius := 4;
  FBackground.YRadius := 4;

  FCaption := TText.Create(nil);
  FCaption.Parent := FBackground;
  FCaption.Align := TAlignLayout.Contents;
  FCaption.TextSettings.Font.Family := 'Segoe UI';
  FCaption.TextSettings.Font.Size := 12;
  FCaption.TextSettings.FontColor := $FFFFFFFF;
  FCaption.TextSettings.HorzAlign := TTextAlign.Center;
  FCaption.TextSettings.VertAlign := TTextAlign.Center;
  FCaption.TextSettings.WordWrap := False;
  FCaption.Text := 'ShapeButton1';
  FCaption.HitTest := False;

  FBackground.OnMouseEnter := InternalMouseEnter;
  FBackground.OnMouseLeave := InternalMouseLeave;
  FBackground.OnMouseDown := InternalMouseDown;
  FBackground.OnMouseUp := InternalMouseUp;
end;

procedure TFShapeGradientButton.UpdateGradient(const AColor1,
  AColor2: TAlphaColor);
begin
  FBackground.Fill.Gradient.Points.Clear;

  with TGradientPoint(FBackground.Fill.Gradient.Points.Add) do
  begin
    Offset := 0.0;
    Color := AColor1;
  end;

  with TGradientPoint(FBackground.Fill.Gradient.Points.Add) do
  begin
    Offset := 1.0;
    Color := AColor2;
  end;

  FBackground.Fill.Gradient.StartPosition.Point :=
    TPointF.Create(FGradPosX1, FGradPosY1);

  FBackground.Fill.Gradient.StopPosition.Point :=
    TPointF.Create(FGradPosX2, FGradPosY2);

  FBackground.Repaint;
end;

procedure TFShapeGradientButton.InternalMouseEnter(Sender: TObject);
begin
  FHover := True;

  FBackground.Opacity := 0.86;

  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Sender);
end;

procedure TFShapeGradientButton.InternalMouseLeave(Sender: TObject);
begin
  FHover := False;
  FDown := False;

  FBackground.Opacity := 1.0;

  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Sender);
end;

procedure TFShapeGradientButton.InternalMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Button <> TMouseButton.mbLeft then
    Exit;

  FBackground.SetFocus;

  FDown := True;

  FBackground.Opacity := 1.0;

  if Assigned(FOnMouseDown) then
    FOnMouseDown(Sender, Button, Shift, X, Y);
end;

procedure TFShapeGradientButton.InternalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Button <> TMouseButton.mbLeft then
    Exit;

  FDown := False;

  if FHover then
    FBackground.Opacity := 0.86
  else
    FBackground.Opacity := 1.0;

  if Assigned(FOnMouseUp) then
    FOnMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TFShapeGradientButton.Cursor(FCursor: TCursor);
begin
  FBackground.Cursor := TCursor(FCursor);
end;

procedure TFShapeGradientButton.Left(FLeft: Single);
begin
  FBackground.Position.X := FLeft;
end;

procedure TFShapeGradientButton.Top(FTop: Single);
begin
  FBackground.Position.Y := FTop;
end;

procedure TFShapeGradientButton.Height(FHeight: Single);
begin
  FBackground.Height := FHeight;
end;

procedure TFShapeGradientButton.Width(FWidth: Single);
begin
  FBackground.Width := FWidth;
end;

procedure TFShapeGradientButton.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  FBackground.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFShapeGradientButton.Position(X, Y: Single);
begin
  FBackground.Position.X := X;
  FBackground.Position.Y := Y;
end;

procedure TFShapeGradientButton.Align(Al: TAlignLayout);
begin
  FBackground.Align := TAlignLayout(Al);
end;

procedure TFShapeGradientButton.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FBackground.Margins.Left := FLeft;
  FBackground.Margins.Top := FTop;
  FBackground.Margins.Right := FRight;
  FBackground.Margins.Bottom := FBottom;
end;

procedure TFShapeGradientButton.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FBackground.Padding.Left := FLeft;
  FBackground.Padding.Top := FTop;
  FBackground.Padding.Right := FRight;
  FBackground.Padding.Bottom := FBottom;
end;

procedure TFShapeGradientButton.SetHint(const FText: WideString);
begin
  FBackground.ShowHint := True;
  FBackground.Hint := string(FText);
end;

procedure TFShapeGradientButton.SetClipParent(FValue: Boolean);
begin
  FBackground.ClipParent := FValue;
end;

procedure TFShapeGradientButton.SetClipChildren(FValue: Boolean);
begin
  FBackground.ClipChildren := FValue;
end;

procedure TFShapeGradientButton.BringToFront;
begin
  FBackground.BringToFront;
end;

procedure TFShapeGradientButton.SendToBack;
begin
  FBackground.SendToBack;
end;

procedure TFShapeGradientButton.SetTag(FTag: Integer);
begin
  FBackground.Tag := FTag;
end;

procedure TFShapeGradientButton.BackColor(FColor1, FColor2: TAlphaColor);
begin
  FGradColor1 := TAlphaColor(FColor1);
  FGradColor2 := TAlphaColor(FColor2);

  UpdateGradient(FGradColor1, FGradColor2);
end;

procedure TFShapeGradientButton.GradientPosition(FVerticle: Boolean);
begin
  if FGradientPositionLocked then
    Exit;

  if FVerticle then
  begin
    FGradPosX1 := 0;
    FGradPosY1 := 0;
    FGradPosX2 := 0;
    FGradPosY2 := 1;
  end
  else
  begin
    FGradPosX1 := 0;
    FGradPosY1 := 0;
    FGradPosX2 := 1;
    FGradPosY2 := 0;
  end;

  FBackground.Fill.Gradient.StartPosition.Point :=
    TPointF.Create(FGradPosX1, FGradPosY1);

  FBackground.Fill.Gradient.StopPosition.Point :=
    TPointF.Create(FGradPosX2, FGradPosY2);

  UpdateGradient(FGradColor1, FGradColor2);
end;

procedure TFShapeGradientButton.CusGradientPosition(X1, Y1, X2, Y2: Single);
begin
  FGradientPositionLocked := True;

  FGradPosX1 := X1;
  FGradPosY1 := Y1;
  FGradPosX2 := X2;
  FGradPosY2 := Y2;

  FBackground.Fill.Gradient.StartPosition.Point :=
    TPointF.Create(FGradPosX1, FGradPosY1);

  FBackground.Fill.Gradient.StopPosition.Point :=
    TPointF.Create(FGradPosX2, FGradPosY2);

  UpdateGradient(FGradColor1, FGradColor2);
end;

procedure TFShapeGradientButton.StrokeColor(FColor: TAlphaColor;
  FThickness: Single);
begin
  FBackground.Stroke.Kind := TBrushKind.Solid;
  FBackground.Stroke.Thickness := FThickness;
  FBackground.Stroke.Color := TAlphaColor(FColor);
end;

procedure TFShapeGradientButton.Corner(FRadius: Single);
begin
  FBackground.XRadius := FRadius;
  FBackground.YRadius := FRadius;
end;

procedure TFShapeGradientButton.Text(const FText: WideString);
begin
  FCaption.Text := string(FText);
end;

procedure TFShapeGradientButton.FontSetting(const FontName: WideString;
  FontSize: Single; FColor: TAlphaColor);
begin
  FCaption.TextSettings.Font.Family := string(FontName);
  FCaption.TextSettings.Font.Size := FontSize;
  FCaption.TextSettings.FontColor := TAlphaColor(FColor);
end;

procedure TFShapeGradientButton.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  FCaption.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  FCaption.TextSettings.VertAlign := TTextAlign(FVertAlign);
  FCaption.TextSettings.WordWrap := FWordWrap;
end;

procedure TFShapeGradientButton.TextColor(FColor: TAlphaColor);
begin
  FCaption.TextSettings.FontColor := TAlphaColor(FColor);
end;

procedure TFShapeGradientButton.TextHorzAlign(FHorzAlign: TTextAlign);
begin
  FCaption.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
end;

procedure TFShapeGradientButton.Repaint;
begin
  FBackground.Repaint;
  FCaption.Repaint;
end;

procedure TFShapeGradientButton.SetFocus;
begin
  FBackground.SetFocus;
end;

procedure TFShapeGradientButton.Opacity(FOpacity: Single);
begin
  FBackground.Opacity := FOpacity;
end;

procedure TFShapeGradientButton.RotationAngle(FValue: Single);
begin
  FBackground.RotationAngle := FValue;
end;

procedure TFShapeGradientButton.RotationCenter(X, Y: Single);
begin
  FBackground.RotationCenter.X := X;
  FBackground.RotationCenter.Y := Y;
end;

procedure TFShapeGradientButton.Enabled(FEnabled: Boolean);
begin
  FBackground.Enabled := FEnabled;
end;

procedure TFShapeGradientButton.Visible(FVisible: Boolean);
begin
  FBackground.Visible := FVisible;
end;

procedure TFShapeGradientButton.HitTest(FEnabled: Boolean);
begin
  FBackground.HitTest := FEnabled;
end;

function TFShapeGradientButton.IsVisible: Boolean;
begin
  Result := FBackground.Visible;
end;

function TFShapeGradientButton.GetText: WideString;
begin
  Result := FCaption.Text;
end;

function TFShapeGradientButton.GetTag: Integer;
begin
  Result := FBackground.Tag;
end;

function TFShapeGradientButton.GetLeft: Single;
begin
  Result := FBackground.Position.X;
end;

function TFShapeGradientButton.GetTop: Single;
begin
  Result := FBackground.Position.Y;
end;

function TFShapeGradientButton.GetHeight: Single;
begin
  Result := FBackground.Height;
end;

function TFShapeGradientButton.GetWidth: Single;
begin
  Result := FBackground.Width;
end;

function TFShapeGradientButton.GetObject: TFmxObject;
begin
  Result := TFmxObject(FBackground);
end;

procedure TFShapeGradientButton.OnClick(Event: TNotifyEvent);
begin
  FBackground.OnClick := TNotifyEvent(Event);
end;

procedure TFShapeGradientButton.OnMouseDown(Event: TMouseEvent);
begin
  FOnMouseDown := TMouseEvent(Event);
end;

procedure TFShapeGradientButton.OnMouseEnter(Event: TNotifyEvent);
begin
  FOnMouseEnter := TNotifyEvent(Event);
end;

procedure TFShapeGradientButton.OnMouseLeave(Event: TNotifyEvent);
begin
  FOnMouseLeave := TNotifyEvent(Event);
end;

procedure TFShapeGradientButton.OnMouseUp(Event: TMouseEvent);
begin
  FOnMouseUp := TMouseEvent(Event);
end;

function TFShapeGradientButton.Handle: TFmxObject;
begin
  Result := TFmxObject(FBackground);
end;

// =============================================================================
// FShapeProgressBar
// =============================================================================
procedure TFShapeProgressBar.FCreate(FParent: TFmxObject);
begin
  FMin := 0;
  FMax := 100;
  FValue := 0;

  FTrack := TRectangle.Create(nil);
  FTrack.Parent := TFmxObject(FParent);
  FTrack.Height := 20;
  FTrack.Width := 200;
  FTrack.Fill.Kind := TBrushKind.Solid;
  FTrack.Fill.Color := $25000000;
  FTrack.Stroke.Kind := TBrushKind.None;

  FIndicator := TRectangle.Create(nil);
  FIndicator.Parent := FTrack;
  FIndicator.Position.X := 0;
  FIndicator.Position.Y := 0;
  FIndicator.Height := FTrack.Height;
  FIndicator.Width := 0;
  FIndicator.Fill.Kind := TBrushKind.Solid;
  FIndicator.Fill.Color := $FFDC143C;
  FIndicator.Stroke.Kind := TBrushKind.None;

  FGradientAnim := TGradientAnimation.Create(nil);
  FGradientAnim.Parent := FIndicator;
  FGradientAnim.PropertyName := 'Fill.Gradient';
  FGradientAnim.Enabled := False;
end;

procedure TFShapeProgressBar.Cursor(FCursor: TCursor);
begin
  FTrack.Cursor := TCursor(FCursor);
end;

procedure TFShapeProgressBar.Left(FLeft: Single);
begin
  FTrack.Position.X := FLeft;
end;

procedure TFShapeProgressBar.Top(FTop: Single);
begin
  FTrack.Position.Y := FTop;
end;

procedure TFShapeProgressBar.Height(FHeight: Single);
begin
  FTrack.Height := FHeight;
end;

procedure TFShapeProgressBar.Width(FWidth: Single);
begin
  FTrack.Width := FWidth;
end;

procedure TFShapeProgressBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  FTrack.SetBounds(FLeft, FTop, FWidth, FHeight);

  FIndicator.Height := FTrack.Height - (2 * FIndicator.Position.Y);

  Value(FValue);
end;

procedure TFShapeProgressBar.Position(X, Y: Single);
begin
  FTrack.Position.X := X;
  FTrack.Position.Y := Y;
end;

procedure TFShapeProgressBar.Align(Al: TAlignLayout);
begin
  FTrack.Align := TAlignLayout(Al);
end;

procedure TFShapeProgressBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FTrack.Margins.Left := FLeft;
  FTrack.Margins.Top := FTop;
  FTrack.Margins.Right := FRight;
  FTrack.Margins.Bottom := FBottom;
end;

procedure TFShapeProgressBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FTrack.Padding.Left := FLeft;
  FTrack.Padding.Top := FTop;
  FTrack.Padding.Right := FRight;
  FTrack.Padding.Bottom := FBottom;
end;

procedure TFShapeProgressBar.SetHint(const FText: WideString);
begin
  FTrack.ShowHint := True;
  FTrack.Hint := string(FText);
end;

procedure TFShapeProgressBar.SetClipChildren(FValue: Boolean);
begin
  FTrack.ClipChildren := FValue;
end;

procedure TFShapeProgressBar.SetClipParent(FValue: Boolean);
begin
  FTrack.ClipParent := FValue;
end;

procedure TFShapeProgressBar.BringToFront;
begin
  FTrack.BringToFront;
end;

procedure TFShapeProgressBar.SendToBack;
begin
  FTrack.SendToBack;
end;

procedure TFShapeProgressBar.SetTag(FTag: Integer);
begin
  FTrack.Tag := FTag;
end;

procedure TFShapeProgressBar.BackColor(FColor: TAlphaColor);
begin
  FTrack.Fill.Color := TAlphaColor(FColor);
end;

procedure TFShapeProgressBar.BackStroke(FColor: TAlphaColor; FThickness: Single);
begin
  FTrack.Stroke.Kind := TBrushKind.Solid;

  FTrack.Stroke.Color := TAlphaColor(FColor);
  FTrack.Stroke.Thickness := FThickness;
end;

procedure TFShapeProgressBar.EnsureGradient;
begin
  if FIndicator.Fill.Kind <> TBrushKind.Gradient then
    FIndicator.Fill.Kind := TBrushKind.Gradient;
end;

procedure TFShapeProgressBar.Color(FColor: TAlphaColor);
begin
  FIndicator.Fill.Color := TAlphaColor(FColor);
end;

procedure TFShapeProgressBar.Stroke(FColor: TAlphaColor; FThickness: Single);
begin
  FIndicator.Stroke.Kind := TBrushKind.Solid;

  FIndicator.Stroke.Color := TAlphaColor(FColor);
  FIndicator.Stroke.Thickness := FThickness;
end;

procedure TFShapeProgressBar.Gradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  EnsureGradient;

  FIndicator.Fill.Gradient.Style := FStyle;
  FIndicator.Fill.Gradient.Points.Clear;

  with TGradientPoint(FIndicator.Fill.Gradient.Points.Add) do
  begin
    Offset := 0.0;
    Color := TAlphaColor(FColor1);
  end;

  with TGradientPoint(FIndicator.Fill.Gradient.Points.Add) do
  begin
    Offset := 1.0;
    Color := TAlphaColor(FColor2);
  end;
end;

procedure TFShapeProgressBar.GradientLinearAngle(FAngle: Single);
var
  dx, dy: Single;
begin
  EnsureGradient;

  FIndicator.Fill.Gradient.Style := TGradientStyle.Linear;

  dx := Cos(DegToRad(FAngle));
  dy := Sin(DegToRad(FAngle));

  FIndicator.Fill.Gradient.StartPosition.Point :=
    TPointF.Create(0.5 - dx * 0.5, 0.5 - dy * 0.5);
  FIndicator.Fill.Gradient.StopPosition.Point :=
    TPointF.Create(0.5 + dx * 0.5, 0.5 + dy * 0.5);
end;

procedure TFShapeProgressBar.GradientRadialAngle(FAngle: Single);
var
  cx, cy, dx, dy: Single;
begin
  EnsureGradient;

  FIndicator.Fill.Gradient.Style := TGradientStyle.Radial;

  cx := 0.5;
  cy := 0.5;

  dx := Cos(DegToRad(FAngle)) * 0.5;
  dy := Sin(DegToRad(FAngle)) * 0.5;

  FIndicator.Fill.Gradient.StartPosition.Point :=
    TPointF.Create(cx, cy);
  FIndicator.Fill.Gradient.StopPosition.Point :=
    TPointF.Create(cx + dx, cy + dy);
end;

procedure TFShapeProgressBar.GradientPosition(X1, Y1, X2, Y2: Single);
begin
  EnsureGradient;

  FIndicator.Fill.Gradient.StartPosition.Point := TPointF.Create(X1, Y1);
  FIndicator.Fill.Gradient.StopPosition.Point := TPointF.Create(X2, Y2);
end;

procedure TFShapeProgressBar.GradientAnimSetup(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  FGradientAnim.AnimationType := TAnimationType(FAnimationType);
  FGradientAnim.Duration := FDuration;
  FGradientAnim.Delay := FDelay;
  FGradientAnim.Inverse := FInverse;
  FGradientAnim.AutoReverse := FAutoReverse;
  FGradientAnim.Loop := FLoop;
end;

procedure TFShapeProgressBar.GradientAnimInterpolation(FInterpolation
  : TInterpolationType);
begin
  FGradientAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFShapeProgressBar.GradientAnimColors(FColor1, FColor2, FColor3,
  FColor4: TAlphaColor);
begin
  FGradientAnim.StartValue.Points.Clear;
  FGradientAnim.StopValue.Points.Clear;

  with TGradientPoint(FGradientAnim.StartValue.Points.Add) do
  begin
    Offset := 0.0;
    Color := TAlphaColor(FColor1);
  end;

  with TGradientPoint(FGradientAnim.StartValue.Points.Add) do
  begin
    Offset := 1.0;
    Color := TAlphaColor(FColor2);
  end;

  with TGradientPoint(FGradientAnim.StopValue.Points.Add) do
  begin
    Offset := 0.0;
    Color := TAlphaColor(FColor3);
  end;

  with TGradientPoint(FGradientAnim.StopValue.Points.Add) do
  begin
    Offset := 1.0;
    Color := TAlphaColor(FColor4);
  end;
end;

procedure TFShapeProgressBar.GradientAnimEnable(FEnabled: Boolean);
begin
  FGradientAnim.Enabled := FEnabled;

  if FEnabled then
    FGradientAnim.Start
  else
    FGradientAnim.Stop;
end;

procedure TFShapeProgressBar.Corner(FRadius: Single);
var
  IndicatorRadius: Single;
begin
  FTrack.XRadius := FRadius;
  FTrack.YRadius := FRadius;

  IndicatorRadius := FRadius - 1.0;

  if IndicatorRadius < 0 then
    IndicatorRadius := 0;

  FIndicator.XRadius := IndicatorRadius;
  FIndicator.YRadius := IndicatorRadius;
end;

procedure TFShapeProgressBar.Inset(FPadding: Single);
begin
  FIndicator.Position.X := FPadding;
  FIndicator.Position.Y := FPadding;
  FIndicator.Height := FTrack.Height - FPadding * 2;

  Value(FValue);
end;

procedure TFShapeProgressBar.Max(FMax: Single);
begin
  if FMax <= FMin then
    Exit;

  Self.FMax := FMax;

  Value(FValue);
end;

procedure TFShapeProgressBar.Min(FMin: Single);
begin
  if FMin >= FMax then
    Exit;

  Self.FMin := FMin;

  Value(FValue);
end;

procedure TFShapeProgressBar.Value(FValue: Single);
var
  Percent, W: Single;
begin
  Self.FValue := FValue;

  if FMax <= FMin then
    Exit;

  Percent := (Self.FValue - FMin) / (FMax - FMin);

  if Percent < 0 then
    Percent := 0
  else if Percent > 1 then
    Percent := 1;

  W := FTrack.Width - (2 * FIndicator.Position.X);

  FIndicator.Width := W * Percent;
  FIndicator.Repaint;
end;

procedure TFShapeProgressBar.Opacity(FOpacity: Single);
begin
  FTrack.Opacity := FOpacity;
end;

procedure TFShapeProgressBar.RotationAngle(FValue: Single);
begin
  FTrack.RotationAngle := FValue;
end;

procedure TFShapeProgressBar.RotationCenter(X, Y: Single);
begin
  FTrack.RotationCenter.X := X;
  FTrack.RotationCenter.Y := Y;
end;

procedure TFShapeProgressBar.Enabled(FEnabled: Boolean);
begin
  FTrack.Enabled := FEnabled;
end;

procedure TFShapeProgressBar.Visible(FVisible: Boolean);
begin
  FTrack.Visible := FVisible;
end;

procedure TFShapeProgressBar.HitTest(FEnabled: Boolean);
begin
  FTrack.HitTest := FEnabled;
end;

function TFShapeProgressBar.GetValue: Single;
begin
  Result := FValue;
end;

function TFShapeProgressBar.GetMax: Single;
begin
  Result := FMax;
end;

function TFShapeProgressBar.IsVisible: Boolean;
begin
  Result := FTrack.Visible;
end;

function TFShapeProgressBar.GetTag: Integer;
begin
  Result := FTrack.Tag;
end;

function TFShapeProgressBar.GetLeft: Single;
begin
  Result := FTrack.Position.X;
end;

function TFShapeProgressBar.GetTop: Single;
begin
  Result := FTrack.Position.Y;
end;

function TFShapeProgressBar.GetHeight: Single;
begin
  Result := FTrack.Height;
end;

function TFShapeProgressBar.GetWidth: Single;
begin
  Result := FTrack.Width;
end;

function TFShapeProgressBar.GetObject: TFmxObject;
begin
  Result := TFmxObject(FTrack);
end;

procedure TFShapeProgressBar.OnClick(Event: TNotifyEvent);
begin
  FTrack.OnClick := TNotifyEvent(Event);
end;

procedure TFShapeProgressBar.OnMouseDown(Event: TMouseEvent);
begin
  FTrack.OnMouseDown := TMouseEvent(Event);
end;

procedure TFShapeProgressBar.OnMouseEnter(Event: TNotifyEvent);
begin
  FTrack.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFShapeProgressBar.OnMouseLeave(Event: TNotifyEvent);
begin
  FTrack.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFShapeProgressBar.OnMouseUp(Event: TMouseEvent);
begin
  FTrack.OnMouseUp := TMouseEvent(Event);
end;

function TFShapeProgressBar.Handle: TFmxObject;
begin
  Result := TFmxObject(FTrack);
end;

// =============================================================================
// Exports
// =============================================================================
function InitShapeArcHandle: FShapeArc;
begin
  Result := TFShapeArc.Create;
end;

function InitShapeSwitchHandle: FShapeSwitch;
begin
  Result := TFShapeSwitch.Create;
end;

function InitShapeButtonHandle: FShapeButton;
begin
  Result := TFShapeButton.Create;
end;

function InitShapeGradientButtonHandle: FShapeGradientButton;
begin
  Result := TFShapeGradientButton.Create;
end;

function InitShapeProgressBarHandle: FShapeProgressBar;
begin
  Result := TFShapeProgressBar.Create;
end;

exports
  InitShapeArcHandle,
  InitShapeSwitchHandle,
  InitShapeButtonHandle,
  InitShapeGradientButtonHandle,
  InitShapeProgressBarHandle;

end.
