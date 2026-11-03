
unit FMXBridge.Layouts;

interface

uses
  System.Classes, System.UITypes,
  FMX.Types, FMX.Controls, FMX.Layouts, FMX.BufferedLayout;

// =============================================================================
// FLayout
// =============================================================================
type
  FLayout = interface(IUnknown)
    ['{05AA3448-0DBB-4327-82F0-DA671C6729C6}']
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
    procedure Repaint; stdcall;
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

  TFLayout = class(TInterfacedObject, FLayout)
  private
    ControlLayout: TLayout;
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
    procedure Repaint; stdcall;
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
// FScaledLayout
// =============================================================================
type
  FScaledLayout = interface(IUnknown)
    ['{A19FA214-4511-4D47-9E76-B97C68C2BEA8}']
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
    procedure OriginalHeight(FHeight: Single); stdcall;
    procedure OriginalWidth(FWidth: Single); stdcall;
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

  TFScaledLayout = class(TInterfacedObject, FScaledLayout)
  private
    ControlScaledLayout: TScaledLayout;
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
    procedure OriginalHeight(FHeight: Single); stdcall;
    procedure OriginalWidth(FWidth: Single); stdcall;
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
// FGridLayout
// =============================================================================
type
  FGridLayout = interface(IUnknown)
    ['{E6AF4EEA-4F30-484B-B3F3-80AAD2E3AF67}']
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
    procedure ItemWidth(FWidth: Single); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure Orientation(FOrientation: TOrientation); stdcall;
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

  TFGridLayout = class(TInterfacedObject, FGridLayout)
  private
    ControlGridLayout: TGridLayout;
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
    procedure ItemWidth(FWidth: Single); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure Orientation(FOrientation: TOrientation); stdcall;
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
// FGridPanelLayout
// =============================================================================
type
  TGPLSizeStyle = (gplssAbsolute, gplssPercent, gplssAuto, gplssWeight);

  FGridPanelLayout = interface(IUnknown)
    ['{0B6D54B3-B541-4937-A923-697866A0B1F8}']
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
    procedure AddNewColumn; stdcall;
    procedure AddNewRow; stdcall;
    procedure ApplyAllLoadedControls; stdcall;
    procedure ColumnSettings(FIndex: Integer; FSizeStyle: TGPLSizeStyle;
      FValue: Double); stdcall;
    procedure RowSettings(FIndex: Integer; FSizeStyle: TGPLSizeStyle;
      FValue: Double); stdcall;
    procedure LoadAControl(FControl: TFmxObject;
      FColumn, FColumnSpan, FRow, FRowSpan: Integer); stdcall;
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

  TFGridPanelLayout = class(TInterfacedObject, FGridPanelLayout)
  private
    ControlGridPanelLayout: TGridPanelLayout;
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
    procedure AddNewColumn; stdcall;
    procedure AddNewRow; stdcall;
    procedure ApplyAllLoadedControls; stdcall;
    procedure ColumnSettings(FIndex: Integer; FSizeStyle: TGPLSizeStyle;
      FValue: Double); stdcall;
    procedure RowSettings(FIndex: Integer; FSizeStyle: TGPLSizeStyle;
      FValue: Double); stdcall;
    procedure LoadAControl(FControl: TFmxObject;
      FColumn, FColumnSpan, FRow, FRowSpan: Integer); stdcall;
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
// FFlowLayout
// =============================================================================
type
  FFlowLayout = interface(IUnknown)
    ['{10771559-57DE-452B-917E-02AC22AC4904}']
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
    procedure FlowDirection(FFlowDirection: TFlowDirection); stdcall;
    procedure HorizontalGap(FValue: Single); stdcall;
    procedure VerticalGap(FValue: Single); stdcall;
    procedure Justify(FJustify: TFlowJustify); stdcall;
    procedure JustifyLastLine(FJustifyLastLine: TFlowJustify); stdcall;
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

  TFFlowLayout = class(TInterfacedObject, FFlowLayout)
  private
    ControlFlowLayout: TFlowLayout;
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
    procedure FlowDirection(FFlowDirection: TFlowDirection); stdcall;
    procedure HorizontalGap(FValue: Single); stdcall;
    procedure VerticalGap(FValue: Single); stdcall;
    procedure Justify(FJustify: TFlowJustify); stdcall;
    procedure JustifyLastLine(FJustifyLastLine: TFlowJustify); stdcall;
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
// FScrollBox
// =============================================================================
type
  FScrollBox = interface(IUnknown)
    ['{EBF8ADB5-01F0-4D25-A2C3-C21F6383B318}']
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
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure TouchTracking(FValue: Boolean); stdcall;
    procedure ScrollTo(const Dx, Dy: Single); stdcall;
    procedure ScrollBy(const Dx, Dy: Single); stdcall;
    procedure GotoLastLine; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RealignContent; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
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

  TFScrollBox = class(TInterfacedObject, FScrollBox)
  private
    ControlScrollBox: TScrollBox;
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
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure TouchTracking(FValue: Boolean); stdcall;
    procedure ScrollTo(const Dx, Dy: Single); stdcall;
    procedure ScrollBy(const Dx, Dy: Single); stdcall;
    procedure GotoLastLine; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RealignContent; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
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
// FHorzScrollBox
// =============================================================================
type
  FHorzScrollBox = interface(IUnknown)
    ['{EBF8ADB5-01F0-4D25-A2C3-C21F6383B318}']
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
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure TouchTracking(FValue: Boolean); stdcall;
    procedure ScrollTo(const Dx, Dy: Single); stdcall;
    procedure ScrollBy(const Dx, Dy: Single); stdcall;
    procedure GotoLastLine; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RealignContent; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
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

  TFHorzScrollBox = class(TInterfacedObject, FHorzScrollBox)
  private
    ControlHorzScrollBox: THorzScrollBox;
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
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure TouchTracking(FValue: Boolean); stdcall;
    procedure ScrollTo(const Dx, Dy: Single); stdcall;
    procedure ScrollBy(const Dx, Dy: Single); stdcall;
    procedure GotoLastLine; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RealignContent; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
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
// FVertScrollBox
// =============================================================================
type
  FVertScrollBox = interface(IUnknown)
    ['{E7392376-82E6-4CDA-875B-FA933635BFE3}']
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
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure TouchTracking(FValue: Boolean); stdcall;
    procedure ScrollTo(const Dx, Dy: Single); stdcall;
    procedure ScrollBy(const Dx, Dy: Single); stdcall;
    procedure GotoLastLine; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RealignContent; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
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

  TFVertScrollBox = class(TInterfacedObject, FVertScrollBox)
  private
    ControlVertScrollBox: TVertScrollBox;
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
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure TouchTracking(FValue: Boolean); stdcall;
    procedure ScrollTo(const Dx, Dy: Single); stdcall;
    procedure ScrollBy(const Dx, Dy: Single); stdcall;
    procedure GotoLastLine; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RealignContent; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
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
// FBufferedLayout
// =============================================================================
type
  FBufferedLayout = interface(IUnknown)
    ['{F5BAD5FB-0681-4B2D-AB06-E25206179D69}']
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

  TFBufferedLayout = class(TInterfacedObject, FBufferedLayout)
  private
    ControlBufferLayout: TLayout;
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
function InitLayoutHandle: FLayout; stdcall;
function InitScaledLayoutHandle: FScaledLayout; stdcall;
function InitGridLayoutHandle: FGridLayout; stdcall;
function InitGridPanelLayoutHandle: FGridPanelLayout; stdcall;
function InitFlowLayoutHandle: FFlowLayout; stdcall;
function InitScrollBoxHandle: FScrollBox; stdcall;
function InitHorzScrollBoxHandle: FHorzScrollBox; stdcall;
function InitVertScrollBoxHandle: FVertScrollBox; stdcall;
function InitBufferedLayoutHandle: FBufferedLayout; stdcall;

implementation

uses
  System.Types, FMX.BehaviorManager;

// =============================================================================
// FLayout
// =============================================================================
procedure TFLayout.FCreate(FParent: TFmxObject);
begin
  ControlLayout := TLayout.Create(nil);
  ControlLayout.Parent := FParent;
end;

procedure TFLayout.Cursor(FCursor: TCursor);
begin
  ControlLayout.Cursor := TCursor(FCursor);
end;

procedure TFLayout.Left(FLeft: Single);
begin
  ControlLayout.Position.X := FLeft;
end;

procedure TFLayout.Top(FTop: Single);
begin
  ControlLayout.Position.Y := FTop;
end;

procedure TFLayout.Height(FHeight: Single);
begin
  ControlLayout.Size.Height := FHeight;
end;

procedure TFLayout.Width(FWidth: Single);
begin
  ControlLayout.Size.Width := FWidth;
end;

procedure TFLayout.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlLayout.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFLayout.Position(X, Y: Single);
begin
  ControlLayout.Position.X := X;
  ControlLayout.Position.Y := Y;
end;

procedure TFLayout.Align(Al: TAlignLayout);
begin
  ControlLayout.Align := TAlignLayout(Al);
end;

procedure TFLayout.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLayout.Margins.Left := FLeft;
  ControlLayout.Margins.Top := FTop;
  ControlLayout.Margins.Right := FRight;
  ControlLayout.Margins.Bottom := FBottom;
end;

procedure TFLayout.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLayout.Padding.Left := FLeft;
  ControlLayout.Padding.Top := FTop;
  ControlLayout.Padding.Right := FRight;
  ControlLayout.Padding.Bottom := FBottom;
end;

procedure TFLayout.SetHint(const FText: WideString);
begin
  ControlLayout.ShowHint := True;
  ControlLayout.Hint := string(FText);
end;

procedure TFLayout.SetClipChildren(FValue: Boolean);
begin
  ControlLayout.ClipChildren := FValue;
end;

procedure TFLayout.SetClipParent(FValue: Boolean);
begin
  ControlLayout.ClipParent := FValue;
end;

procedure TFLayout.BringToFront;
begin
  ControlLayout.BringToFront;
end;

procedure TFLayout.SendToBack;
begin
  ControlLayout.SendToBack;
end;

procedure TFLayout.SetTag(FTag: Integer);
begin
  ControlLayout.Tag := FTag;
end;

procedure TFLayout.Repaint;
begin
  ControlLayout.Repaint;
end;

procedure TFLayout.Opacity(FOpacity: Single);
begin
  ControlLayout.Opacity := FOpacity;
end;

procedure TFLayout.RotationAngle(FValue: Single);
begin
  ControlLayout.RotationAngle := FValue;
end;

procedure TFLayout.RotationCenter(X, Y: Single);
begin
  ControlLayout.RotationCenter.X := X;
  ControlLayout.RotationCenter.Y := Y;
end;

procedure TFLayout.Enabled(FEnabled: Boolean);
begin
  ControlLayout.Enabled := FEnabled;
end;

procedure TFLayout.Visible(FVisible: Boolean);
begin
  ControlLayout.Visible := FVisible;
end;

procedure TFLayout.HitTest(FEnabled: Boolean);
begin
  ControlLayout.HitTest := FEnabled;
end;

function TFLayout.IsVisible: Boolean;
begin
  Result := ControlLayout.Visible;
end;

function TFLayout.GetTag: Integer;
begin
  Result := ControlLayout.Tag;
end;

function TFLayout.GetLeft: Single;
begin
  Result := ControlLayout.Position.X;
end;

function TFLayout.GetTop: Single;
begin
  Result := ControlLayout.Position.Y;
end;

function TFLayout.GetHeight: Single;
begin
  Result := ControlLayout.Size.Height;
end;

function TFLayout.GetWidth: Single;
begin
  Result := ControlLayout.Size.Width;
end;

function TFLayout.GetObject: TFmxObject;
begin
  Result := ControlLayout;
end;

procedure TFLayout.OnClick(Event: TNotifyEvent);
begin
  ControlLayout.OnClick := TNotifyEvent(Event);
end;

procedure TFLayout.OnMouseDown(Event: TMouseEvent);
begin
  ControlLayout.OnMouseDown := TMouseEvent(Event);
end;

procedure TFLayout.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlLayout.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFLayout.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlLayout.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFLayout.OnMouseUp(Event: TMouseEvent);
begin
  ControlLayout.OnMouseUp := TMouseEvent(Event);
end;

function TFLayout.Handle: TFmxObject;
begin
  Result := ControlLayout;
end;

// =============================================================================
// FScaledLayout
// =============================================================================
procedure TFScaledLayout.FCreate(FParent: TFmxObject);
begin
  ControlScaledLayout := TScaledLayout.Create(nil);
  ControlScaledLayout.Parent := FParent;
end;

procedure TFScaledLayout.Cursor(FCursor: TCursor);
begin
  ControlScaledLayout.Cursor := TCursor(FCursor);
end;

procedure TFScaledLayout.Left(FLeft: Single);
begin
  ControlScaledLayout.Position.X := FLeft;
end;

procedure TFScaledLayout.Top(FTop: Single);
begin
  ControlScaledLayout.Position.Y := FTop;
end;

procedure TFScaledLayout.Height(FHeight: Single);
begin
  ControlScaledLayout.Size.Height := FHeight;
end;

procedure TFScaledLayout.Width(FWidth: Single);
begin
  ControlScaledLayout.Size.Width := FWidth;
end;

procedure TFScaledLayout.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlScaledLayout.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFScaledLayout.Position(X, Y: Single);
begin
  ControlScaledLayout.Position.X := X;
  ControlScaledLayout.Position.Y := Y;
end;

procedure TFScaledLayout.Align(Al: TAlignLayout);
begin
  ControlScaledLayout.Align := TAlignLayout(Al);
end;

procedure TFScaledLayout.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlScaledLayout.Margins.Left := FLeft;
  ControlScaledLayout.Margins.Top := FTop;
  ControlScaledLayout.Margins.Right := FRight;
  ControlScaledLayout.Margins.Bottom := FBottom;
end;

procedure TFScaledLayout.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlScaledLayout.Padding.Left := FLeft;
  ControlScaledLayout.Padding.Top := FTop;
  ControlScaledLayout.Padding.Right := FRight;
  ControlScaledLayout.Padding.Bottom := FBottom;
end;

procedure TFScaledLayout.SetHint(const FText: WideString);
begin
  ControlScaledLayout.ShowHint := True;
  ControlScaledLayout.Hint := string(FText);
end;

procedure TFScaledLayout.SetClipChildren(FValue: Boolean);
begin
  ControlScaledLayout.ClipChildren := FValue;
end;

procedure TFScaledLayout.SetClipParent(FValue: Boolean);
begin
  ControlScaledLayout.ClipParent := FValue;
end;

procedure TFScaledLayout.BringToFront;
begin
  ControlScaledLayout.BringToFront;
end;

procedure TFScaledLayout.SendToBack;
begin
  ControlScaledLayout.SendToBack;
end;

procedure TFScaledLayout.SetTag(FTag: Integer);
begin
  ControlScaledLayout.Tag := FTag;
end;

procedure TFScaledLayout.OriginalHeight(FHeight: Single);
begin
  ControlScaledLayout.OriginalHeight := FHeight;
end;

procedure TFScaledLayout.OriginalWidth(FWidth: Single);
begin
  ControlScaledLayout.OriginalWidth := FWidth;
end;

procedure TFScaledLayout.Opacity(FOpacity: Single);
begin
  ControlScaledLayout.Opacity := FOpacity;
end;

procedure TFScaledLayout.RotationAngle(FValue: Single);
begin
  ControlScaledLayout.RotationAngle := FValue;
end;

procedure TFScaledLayout.RotationCenter(X, Y: Single);
begin
  ControlScaledLayout.RotationCenter.X := X;
  ControlScaledLayout.RotationCenter.Y := Y;
end;

procedure TFScaledLayout.Enabled(FEnabled: Boolean);
begin
  ControlScaledLayout.Enabled := FEnabled;
end;

procedure TFScaledLayout.Visible(FVisible: Boolean);
begin
  ControlScaledLayout.Visible := FVisible;
end;

procedure TFScaledLayout.HitTest(FEnabled: Boolean);
begin
  ControlScaledLayout.HitTest := FEnabled;
end;

function TFScaledLayout.IsVisible: Boolean;
begin
  Result := ControlScaledLayout.Visible;
end;

function TFScaledLayout.GetTag: Integer;
begin
  Result := ControlScaledLayout.Tag;
end;

function TFScaledLayout.GetLeft: Single;
begin
  Result := ControlScaledLayout.Position.X;
end;

function TFScaledLayout.GetTop: Single;
begin
  Result := ControlScaledLayout.Position.Y;
end;

function TFScaledLayout.GetHeight: Single;
begin
  Result := ControlScaledLayout.Size.Height;
end;

function TFScaledLayout.GetWidth: Single;
begin
  Result := ControlScaledLayout.Size.Width;
end;

function TFScaledLayout.GetObject: TFmxObject;
begin
  Result := ControlScaledLayout;
end;

procedure TFScaledLayout.OnClick(Event: TNotifyEvent);
begin
  ControlScaledLayout.OnClick := TNotifyEvent(Event);
end;

procedure TFScaledLayout.OnMouseDown(Event: TMouseEvent);
begin
  ControlScaledLayout.OnMouseDown := TMouseEvent(Event);
end;

procedure TFScaledLayout.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlScaledLayout.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFScaledLayout.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlScaledLayout.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFScaledLayout.OnMouseUp(Event: TMouseEvent);
begin
  ControlScaledLayout.OnMouseUp := TMouseEvent(Event);
end;

function TFScaledLayout.Handle: TFmxObject;
begin
  Result := ControlScaledLayout;
end;

// =============================================================================
// FGridLayout
// =============================================================================
procedure TFGridLayout.FCreate(FParent: TFmxObject);
begin
  ControlGridLayout := TGridLayout.Create(nil);
  ControlGridLayout.Parent := FParent;
end;

procedure TFGridLayout.Cursor(FCursor: TCursor);
begin
  ControlGridLayout.Cursor := TCursor(FCursor);
end;

procedure TFGridLayout.Left(FLeft: Single);
begin
  ControlGridLayout.Position.X := FLeft;
end;

procedure TFGridLayout.Top(FTop: Single);
begin
  ControlGridLayout.Position.Y := FTop;
end;

procedure TFGridLayout.Height(FHeight: Single);
begin
  ControlGridLayout.Size.Height := FHeight;
end;

procedure TFGridLayout.Width(FWidth: Single);
begin
  ControlGridLayout.Size.Width := FWidth;
end;

procedure TFGridLayout.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlGridLayout.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFGridLayout.Position(X, Y: Single);
begin
  ControlGridLayout.Position.X := X;
  ControlGridLayout.Position.Y := Y;
end;

procedure TFGridLayout.Align(Al: TAlignLayout);
begin
  ControlGridLayout.Align := TAlignLayout(Al);
end;

procedure TFGridLayout.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGridLayout.Margins.Left := FLeft;
  ControlGridLayout.Margins.Top := FTop;
  ControlGridLayout.Margins.Right := FRight;
  ControlGridLayout.Margins.Bottom := FBottom;
end;

procedure TFGridLayout.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGridLayout.Padding.Left := FLeft;
  ControlGridLayout.Padding.Top := FTop;
  ControlGridLayout.Padding.Right := FRight;
  ControlGridLayout.Padding.Bottom := FBottom;
end;

procedure TFGridLayout.SetHint(const FText: WideString);
begin
  ControlGridLayout.ShowHint := True;
  ControlGridLayout.Hint := string(FText);
end;

procedure TFGridLayout.SetClipChildren(FValue: Boolean);
begin
  ControlGridLayout.ClipChildren := FValue;
end;

procedure TFGridLayout.SetClipParent(FValue: Boolean);
begin
  ControlGridLayout.ClipParent := FValue;
end;

procedure TFGridLayout.BringToFront;
begin
  ControlGridLayout.BringToFront;
end;

procedure TFGridLayout.SendToBack;
begin
  ControlGridLayout.SendToBack;
end;

procedure TFGridLayout.SetTag(FTag: Integer);
begin
  ControlGridLayout.Tag := FTag;
end;

procedure TFGridLayout.ItemWidth(FWidth: Single);
begin
  ControlGridLayout.ItemWidth := FWidth;
end;

procedure TFGridLayout.ItemHeight(FHeight: Single);
begin
  ControlGridLayout.ItemHeight := FHeight;
end;

procedure TFGridLayout.Orientation(FOrientation: TOrientation);
begin
  ControlGridLayout.Orientation := TOrientation(FOrientation);
end;

procedure TFGridLayout.Opacity(FOpacity: Single);
begin
  ControlGridLayout.Opacity := FOpacity;
end;

procedure TFGridLayout.RotationAngle(FValue: Single);
begin
  ControlGridLayout.RotationAngle := FValue;
end;

procedure TFGridLayout.RotationCenter(X, Y: Single);
begin
  ControlGridLayout.RotationCenter.X := X;
  ControlGridLayout.RotationCenter.Y := Y;
end;

procedure TFGridLayout.Enabled(FEnabled: Boolean);
begin
  ControlGridLayout.Enabled := FEnabled;
end;

procedure TFGridLayout.Visible(FVisible: Boolean);
begin
  ControlGridLayout.Visible := FVisible;
end;

procedure TFGridLayout.HitTest(FEnabled: Boolean);
begin
  ControlGridLayout.HitTest := FEnabled;
end;

function TFGridLayout.IsVisible: Boolean;
begin
  Result := ControlGridLayout.Visible;
end;

function TFGridLayout.GetTag: Integer;
begin
  Result := ControlGridLayout.Tag;
end;

function TFGridLayout.GetLeft: Single;
begin
  Result := ControlGridLayout.Position.X;
end;

function TFGridLayout.GetTop: Single;
begin
  Result := ControlGridLayout.Position.Y;
end;

function TFGridLayout.GetHeight: Single;
begin
  Result := ControlGridLayout.Size.Height;
end;

function TFGridLayout.GetWidth: Single;
begin
  Result := ControlGridLayout.Size.Width;
end;

function TFGridLayout.GetObject: TFmxObject;
begin
  Result := ControlGridLayout;
end;

procedure TFGridLayout.OnClick(Event: TNotifyEvent);
begin
  ControlGridLayout.OnClick := TNotifyEvent(Event);
end;

procedure TFGridLayout.OnMouseDown(Event: TMouseEvent);
begin
  ControlGridLayout.OnMouseDown := TMouseEvent(Event);
end;

procedure TFGridLayout.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlGridLayout.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFGridLayout.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlGridLayout.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFGridLayout.OnMouseUp(Event: TMouseEvent);
begin
  ControlGridLayout.OnMouseUp := TMouseEvent(Event);
end;

function TFGridLayout.Handle: TFmxObject;
begin
  Result := ControlGridLayout;
end;

// =============================================================================
// FGridPanelLayout
// =============================================================================
procedure TFGridPanelLayout.FCreate(FParent: TFmxObject);
begin
  ControlGridPanelLayout := TGridPanelLayout.Create(nil);
  ControlGridPanelLayout.Parent := FParent;
end;

procedure TFGridPanelLayout.Cursor(FCursor: TCursor);
begin
  ControlGridPanelLayout.Cursor := TCursor(FCursor);
end;

procedure TFGridPanelLayout.Left(FLeft: Single);
begin
  ControlGridPanelLayout.Position.X := FLeft;
end;

procedure TFGridPanelLayout.Top(FTop: Single);
begin
  ControlGridPanelLayout.Position.Y := FTop;
end;

procedure TFGridPanelLayout.Height(FHeight: Single);
begin
  ControlGridPanelLayout.Size.Height := FHeight;
end;

procedure TFGridPanelLayout.Width(FWidth: Single);
begin
  ControlGridPanelLayout.Size.Width := FWidth;
end;

procedure TFGridPanelLayout.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlGridPanelLayout.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFGridPanelLayout.Position(X, Y: Single);
begin
  ControlGridPanelLayout.Position.X := X;
  ControlGridPanelLayout.Position.Y := Y;
end;

procedure TFGridPanelLayout.Align(Al: TAlignLayout);
begin
  ControlGridPanelLayout.Align := TAlignLayout(Al);
end;

procedure TFGridPanelLayout.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGridPanelLayout.Margins.Left := FLeft;
  ControlGridPanelLayout.Margins.Top := FTop;
  ControlGridPanelLayout.Margins.Right := FRight;
  ControlGridPanelLayout.Margins.Bottom := FBottom;
end;

procedure TFGridPanelLayout.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGridPanelLayout.Padding.Left := FLeft;
  ControlGridPanelLayout.Padding.Top := FTop;
  ControlGridPanelLayout.Padding.Right := FRight;
  ControlGridPanelLayout.Padding.Bottom := FBottom;
end;

procedure TFGridPanelLayout.SetHint(const FText: WideString);
begin
  ControlGridPanelLayout.ShowHint := True;
  ControlGridPanelLayout.Hint := string(FText);
end;

procedure TFGridPanelLayout.SetClipChildren(FValue: Boolean);
begin
  ControlGridPanelLayout.ClipChildren := FValue;
end;

procedure TFGridPanelLayout.SetClipParent(FValue: Boolean);
begin
  ControlGridPanelLayout.ClipParent := FValue;
end;

procedure TFGridPanelLayout.BringToFront;
begin
  ControlGridPanelLayout.BringToFront;
end;

procedure TFGridPanelLayout.SendToBack;
begin
  ControlGridPanelLayout.SendToBack;
end;

procedure TFGridPanelLayout.SetTag(FTag: Integer);
begin
  ControlGridPanelLayout.Tag := FTag;
end;

procedure TFGridPanelLayout.AddNewColumn;
begin
  ControlGridPanelLayout.ColumnCollection.Add;
end;

procedure TFGridPanelLayout.AddNewRow;
begin
  ControlGridPanelLayout.RowCollection.Add;
end;

procedure TFGridPanelLayout.ApplyAllLoadedControls;
begin
  ControlGridPanelLayout.InvalidateRect(ControlGridPanelLayout.BoundsRect);
end;

procedure TFGridPanelLayout.ColumnSettings(FIndex: Integer;
  FSizeStyle: TGPLSizeStyle; FValue: Double);
var
  Style: TGridPanelLayout.TSizeStyle;
begin
  Style := TGridPanelLayout.TSizeStyle.Percent;

  case FSizeStyle of
    gplssAbsolute:
      Style := TGridPanelLayout.TSizeStyle.Absolute;
    gplssPercent:
      Style := TGridPanelLayout.TSizeStyle.Percent;
    gplssAuto:
      Style := TGridPanelLayout.TSizeStyle.Auto;
    gplssWeight:
      Style := TGridPanelLayout.TSizeStyle.Weight;
  end;

  if (FIndex >= 0) and (FIndex < ControlGridPanelLayout.ColumnCollection.Count)
  then
  begin
    ControlGridPanelLayout.ColumnCollection[FIndex].SizeStyle := Style;
    ControlGridPanelLayout.ColumnCollection[FIndex].Value := FValue;
  end;
end;

procedure TFGridPanelLayout.RowSettings(FIndex: Integer;
  FSizeStyle: TGPLSizeStyle; FValue: Double);
var
  Style: TGridPanelLayout.TSizeStyle;
begin
  Style := TGridPanelLayout.TSizeStyle.Percent;

  case FSizeStyle of
    gplssAbsolute:
      Style := TGridPanelLayout.TSizeStyle.Absolute;
    gplssPercent:
      Style := TGridPanelLayout.TSizeStyle.Percent;
    gplssAuto:
      Style := TGridPanelLayout.TSizeStyle.Auto;
    gplssWeight:
      Style := TGridPanelLayout.TSizeStyle.Weight;
  end;

  if (FIndex >= 0) and (FIndex < ControlGridPanelLayout.RowCollection.Count)
  then
  begin
    ControlGridPanelLayout.RowCollection[FIndex].SizeStyle := Style;
    ControlGridPanelLayout.RowCollection[FIndex].Value := FValue;
  end;
end;

procedure TFGridPanelLayout.LoadAControl(FControl: TFmxObject;
  FColumn, FColumnSpan, FRow, FRowSpan: Integer);
var
  Item: TGridPanelLayout.TControlItem;
  Ctrl: TControl;
begin
  Ctrl := TControl(FControl);

  Item := ControlGridPanelLayout.ControlCollection.Add as TGridPanelLayout.
    TControlItem;

  Item.Control := Ctrl;

  Item.Column := FColumn;
  Item.ColumnSpan := FColumnSpan;
  Item.Row := FRow;
  Item.RowSpan := FRowSpan;

  Ctrl.Parent := ControlGridPanelLayout;
  ControlGridPanelLayout.InvalidateRect(ControlGridPanelLayout.BoundsRect);
end;

procedure TFGridPanelLayout.Opacity(FOpacity: Single);
begin
  ControlGridPanelLayout.Opacity := FOpacity;
end;

procedure TFGridPanelLayout.RotationAngle(FValue: Single);
begin
  ControlGridPanelLayout.RotationAngle := FValue;
end;

procedure TFGridPanelLayout.RotationCenter(X, Y: Single);
begin
  ControlGridPanelLayout.RotationCenter.X := X;
  ControlGridPanelLayout.RotationCenter.Y := Y;
end;

procedure TFGridPanelLayout.Enabled(FEnabled: Boolean);
begin
  ControlGridPanelLayout.Enabled := FEnabled;
end;

procedure TFGridPanelLayout.Visible(FVisible: Boolean);
begin
  ControlGridPanelLayout.Visible := FVisible;
end;

procedure TFGridPanelLayout.HitTest(FEnabled: Boolean);
begin
  ControlGridPanelLayout.HitTest := FEnabled;
end;

function TFGridPanelLayout.IsVisible: Boolean;
begin
  Result := ControlGridPanelLayout.Visible;
end;

function TFGridPanelLayout.GetTag: Integer;
begin
  Result := ControlGridPanelLayout.Tag;
end;

function TFGridPanelLayout.GetLeft: Single;
begin
  Result := ControlGridPanelLayout.Position.X;
end;

function TFGridPanelLayout.GetTop: Single;
begin
  Result := ControlGridPanelLayout.Position.Y;
end;

function TFGridPanelLayout.GetHeight: Single;
begin
  Result := ControlGridPanelLayout.Size.Height;
end;

function TFGridPanelLayout.GetWidth: Single;
begin
  Result := ControlGridPanelLayout.Size.Width;
end;

function TFGridPanelLayout.GetObject: TFmxObject;
begin
  Result := ControlGridPanelLayout;
end;

procedure TFGridPanelLayout.OnClick(Event: TNotifyEvent);
begin
  ControlGridPanelLayout.OnClick := TNotifyEvent(Event);
end;

procedure TFGridPanelLayout.OnMouseDown(Event: TMouseEvent);
begin
  ControlGridPanelLayout.OnMouseDown := TMouseEvent(Event);
end;

procedure TFGridPanelLayout.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlGridPanelLayout.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFGridPanelLayout.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlGridPanelLayout.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFGridPanelLayout.OnMouseUp(Event: TMouseEvent);
begin
  ControlGridPanelLayout.OnMouseUp := TMouseEvent(Event);
end;

function TFGridPanelLayout.Handle: TFmxObject;
begin
  Result := ControlGridPanelLayout;
end;

// =============================================================================
// FFlowLayout
// =============================================================================
procedure TFFlowLayout.FCreate(FParent: TFmxObject);
begin
  ControlFlowLayout := TFlowLayout.Create(nil);
  ControlFlowLayout.Parent := FParent;
end;

procedure TFFlowLayout.Cursor(FCursor: TCursor);
begin
  ControlFlowLayout.Cursor := TCursor(FCursor);
end;

procedure TFFlowLayout.Left(FLeft: Single);
begin
  ControlFlowLayout.Position.X := FLeft;
end;

procedure TFFlowLayout.Top(FTop: Single);
begin
  ControlFlowLayout.Position.Y := FTop;
end;

procedure TFFlowLayout.Height(FHeight: Single);
begin
  ControlFlowLayout.Size.Height := FHeight;
end;

procedure TFFlowLayout.Width(FWidth: Single);
begin
  ControlFlowLayout.Size.Width := FWidth;
end;

procedure TFFlowLayout.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlFlowLayout.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFFlowLayout.Position(X, Y: Single);
begin
  ControlFlowLayout.Position.X := X;
  ControlFlowLayout.Position.Y := Y;
end;

procedure TFFlowLayout.Align(Al: TAlignLayout);
begin
  ControlFlowLayout.Align := TAlignLayout(Al);
end;

procedure TFFlowLayout.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlFlowLayout.Margins.Left := FLeft;
  ControlFlowLayout.Margins.Top := FTop;
  ControlFlowLayout.Margins.Right := FRight;
  ControlFlowLayout.Margins.Bottom := FBottom;
end;

procedure TFFlowLayout.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlFlowLayout.Padding.Left := FLeft;
  ControlFlowLayout.Padding.Top := FTop;
  ControlFlowLayout.Padding.Right := FRight;
  ControlFlowLayout.Padding.Bottom := FBottom;
end;

procedure TFFlowLayout.SetHint(const FText: WideString);
begin
  ControlFlowLayout.ShowHint := True;
  ControlFlowLayout.Hint := string(FText);
end;

procedure TFFlowLayout.SetClipChildren(FValue: Boolean);
begin
  ControlFlowLayout.ClipChildren := FValue;
end;

procedure TFFlowLayout.SetClipParent(FValue: Boolean);
begin
  ControlFlowLayout.ClipParent := FValue;
end;

procedure TFFlowLayout.BringToFront;
begin
  ControlFlowLayout.BringToFront;
end;

procedure TFFlowLayout.SendToBack;
begin
  ControlFlowLayout.SendToBack;
end;

procedure TFFlowLayout.SetTag(FTag: Integer);
begin
  ControlFlowLayout.Tag := FTag;
end;

procedure TFFlowLayout.FlowDirection(FFlowDirection: TFlowDirection);
begin
  ControlFlowLayout.FlowDirection := TFlowDirection(FFlowDirection);
end;

procedure TFFlowLayout.HorizontalGap(FValue: Single);
begin
  ControlFlowLayout.HorizontalGap := FValue;
end;

procedure TFFlowLayout.VerticalGap(FValue: Single);
begin
  ControlFlowLayout.VerticalGap := FValue;
end;

procedure TFFlowLayout.Justify(FJustify: TFlowJustify);
begin
  ControlFlowLayout.Justify := TFlowJustify(FJustify);
end;

procedure TFFlowLayout.JustifyLastLine(FJustifyLastLine: TFlowJustify);
begin
  ControlFlowLayout.JustifyLastLine := TFlowJustify(FJustifyLastLine);
end;

procedure TFFlowLayout.Opacity(FOpacity: Single);
begin
  ControlFlowLayout.Opacity := FOpacity;
end;

procedure TFFlowLayout.RotationAngle(FValue: Single);
begin
  ControlFlowLayout.RotationAngle := FValue;
end;

procedure TFFlowLayout.RotationCenter(X, Y: Single);
begin
  ControlFlowLayout.RotationCenter.X := X;
  ControlFlowLayout.RotationCenter.Y := Y;
end;

procedure TFFlowLayout.Enabled(FEnabled: Boolean);
begin
  ControlFlowLayout.Enabled := FEnabled;
end;

procedure TFFlowLayout.Visible(FVisible: Boolean);
begin
  ControlFlowLayout.Visible := FVisible;
end;

procedure TFFlowLayout.HitTest(FEnabled: Boolean);
begin
  ControlFlowLayout.HitTest := FEnabled;
end;

function TFFlowLayout.IsVisible: Boolean;
begin
  Result := ControlFlowLayout.Visible;
end;

function TFFlowLayout.GetTag: Integer;
begin
  Result := ControlFlowLayout.Tag;
end;

function TFFlowLayout.GetLeft: Single;
begin
  Result := ControlFlowLayout.Position.X;
end;

function TFFlowLayout.GetTop: Single;
begin
  Result := ControlFlowLayout.Position.Y;
end;

function TFFlowLayout.GetHeight: Single;
begin
  Result := ControlFlowLayout.Size.Height;
end;

function TFFlowLayout.GetWidth: Single;
begin
  Result := ControlFlowLayout.Size.Width;
end;

function TFFlowLayout.GetObject: TFmxObject;
begin
  Result := ControlFlowLayout;
end;

procedure TFFlowLayout.OnClick(Event: TNotifyEvent);
begin
  ControlFlowLayout.OnClick := TNotifyEvent(Event);
end;

procedure TFFlowLayout.OnMouseDown(Event: TMouseEvent);
begin
  ControlFlowLayout.OnMouseDown := TMouseEvent(Event);
end;

procedure TFFlowLayout.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlFlowLayout.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFFlowLayout.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlFlowLayout.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFFlowLayout.OnMouseUp(Event: TMouseEvent);
begin
  ControlFlowLayout.OnMouseUp := TMouseEvent(Event);
end;

function TFFlowLayout.Handle: TFmxObject;
begin
  Result := ControlFlowLayout;
end;

// =============================================================================
// FScrollBox
// =============================================================================
procedure TFScrollBox.FCreate(FParent: TFmxObject);
begin
  ControlScrollBox := TScrollBox.Create(nil);
  ControlScrollBox.Parent := FParent;
end;

procedure TFScrollBox.Cursor(FCursor: TCursor);
begin
  ControlScrollBox.Cursor := TCursor(FCursor);
end;

procedure TFScrollBox.Left(FLeft: Single);
begin
  ControlScrollBox.Position.X := FLeft;
end;

procedure TFScrollBox.Top(FTop: Single);
begin
  ControlScrollBox.Position.Y := FTop;
end;

procedure TFScrollBox.Height(FHeight: Single);
begin
  ControlScrollBox.Size.Height := FHeight;
end;

procedure TFScrollBox.Width(FWidth: Single);
begin
  ControlScrollBox.Size.Width := FWidth;
end;

procedure TFScrollBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlScrollBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFScrollBox.Position(X, Y: Single);
begin
  ControlScrollBox.Position.X := X;
  ControlScrollBox.Position.Y := Y;
end;

procedure TFScrollBox.Align(Al: TAlignLayout);
begin
  ControlScrollBox.Align := TAlignLayout(Al);
end;

procedure TFScrollBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlScrollBox.Margins.Left := FLeft;
  ControlScrollBox.Margins.Top := FTop;
  ControlScrollBox.Margins.Right := FRight;
  ControlScrollBox.Margins.Bottom := FBottom;
end;

procedure TFScrollBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlScrollBox.Padding.Left := FLeft;
  ControlScrollBox.Padding.Top := FTop;
  ControlScrollBox.Padding.Right := FRight;
  ControlScrollBox.Padding.Bottom := FBottom;
end;

procedure TFScrollBox.SetHint(const FText: WideString);
begin
  ControlScrollBox.ShowHint := True;
  ControlScrollBox.Hint := string(FText);
end;

procedure TFScrollBox.SetClipChildren(FValue: Boolean);
begin
  ControlScrollBox.ClipChildren := FValue;
end;

procedure TFScrollBox.SetClipParent(FValue: Boolean);
begin
  ControlScrollBox.ClipParent := FValue;
end;

procedure TFScrollBox.BringToFront;
begin
  ControlScrollBox.BringToFront;
end;

procedure TFScrollBox.SendToBack;
begin
  ControlScrollBox.SendToBack;
end;

procedure TFScrollBox.SetTag(FTag: Integer);
begin
  ControlScrollBox.Tag := FTag;
end;

procedure TFScrollBox.AutoHide(FValue: Boolean);
begin
  ControlScrollBox.AutoHide := FValue;
end;

procedure TFScrollBox.Bounces(FValue: Boolean);
begin
  if FValue then
    ControlScrollBox.Bounces := TBehaviorBoolean.True
  else
    ControlScrollBox.Bounces := TBehaviorBoolean.False;
end;

procedure TFScrollBox.DisableMouseWheel(FValue: Boolean);
begin
  ControlScrollBox.DisableMouseWheel := FValue;
end;

procedure TFScrollBox.ScrollAnimation(FValue: Boolean);
begin
  if FValue then
    ControlScrollBox.ScrollAnimation := TBehaviorBoolean.True
  else
    ControlScrollBox.ScrollAnimation := TBehaviorBoolean.False;
end;

procedure TFScrollBox.ShowScrollBars(FValue: Boolean);
begin
  ControlScrollBox.ShowScrollBars := FValue;
end;

procedure TFScrollBox.ShowSizeGrip(FValue: Boolean);
begin
  ControlScrollBox.ShowSizeGrip := FValue;
end;

procedure TFScrollBox.TouchTracking(FValue: Boolean);
begin
  if FValue then
    ControlScrollBox.TouchTracking := TBehaviorBoolean.True
  else
    ControlScrollBox.TouchTracking := TBehaviorBoolean.False;
end;

procedure TFScrollBox.ScrollTo(const Dx, Dy: Single);
begin
  ControlScrollBox.ViewportPosition := PointF(Dx, Dy);
end;

procedure TFScrollBox.ScrollBy(const Dx, Dy: Single);
begin
  with ControlScrollBox do
    ViewportPosition := PointF(ViewportPosition.X + Dx,
      ViewportPosition.Y + Dy);
end;

procedure TFScrollBox.GotoLastLine;
begin
  with ControlScrollBox do
    ViewportPosition := PointF(ViewportPosition.X,
      ContentBounds.Bottom - Height);
end;

procedure TFScrollBox.BeginUpdate;
begin
  ControlScrollBox.BeginUpdate;
end;

procedure TFScrollBox.EndUpdate;
begin
  ControlScrollBox.EndUpdate;
end;

procedure TFScrollBox.RealignContent;
begin
  ControlScrollBox.RealignContent;
end;

procedure TFScrollBox.RecalcSize;
begin
  ControlScrollBox.RecalcSize;
end;

procedure TFScrollBox.Repaint;
begin
  ControlScrollBox.Repaint;
end;

procedure TFScrollBox.Opacity(FOpacity: Single);
begin
  ControlScrollBox.Opacity := FOpacity;
end;

procedure TFScrollBox.RotationAngle(FValue: Single);
begin
  ControlScrollBox.RotationAngle := FValue;
end;

procedure TFScrollBox.RotationCenter(X, Y: Single);
begin
  ControlScrollBox.RotationCenter.X := X;
  ControlScrollBox.RotationCenter.Y := Y;
end;

procedure TFScrollBox.Enabled(FEnabled: Boolean);
begin
  ControlScrollBox.Enabled := FEnabled;
end;

procedure TFScrollBox.Visible(FVisible: Boolean);
begin
  ControlScrollBox.Visible := FVisible;
end;

procedure TFScrollBox.HitTest(FEnabled: Boolean);
begin
  ControlScrollBox.HitTest := FEnabled;
end;

procedure TFScrollBox.StyleLookUp(FStyle: WideString);
begin
  ControlScrollBox.StyleLookUp := string(FStyle);
end;

function TFScrollBox.IsVisible: Boolean;
begin
  Result := ControlScrollBox.Visible;
end;

function TFScrollBox.GetTag: Integer;
begin
  Result := ControlScrollBox.Tag;
end;

function TFScrollBox.GetLeft: Single;
begin
  Result := ControlScrollBox.Position.X;
end;

function TFScrollBox.GetTop: Single;
begin
  Result := ControlScrollBox.Position.Y;
end;

function TFScrollBox.GetHeight: Single;
begin
  Result := ControlScrollBox.Size.Height;
end;

function TFScrollBox.GetWidth: Single;
begin
  Result := ControlScrollBox.Size.Width;
end;

function TFScrollBox.GetObject: TFmxObject;
begin
  Result := ControlScrollBox;
end;

procedure TFScrollBox.OnClick(Event: TNotifyEvent);
begin
  ControlScrollBox.OnClick := TNotifyEvent(Event);
end;

procedure TFScrollBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlScrollBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFScrollBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlScrollBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFScrollBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlScrollBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFScrollBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlScrollBox.OnMouseUp := TMouseEvent(Event);
end;

function TFScrollBox.Handle: TFmxObject;
begin
  Result := ControlScrollBox;
end;

// =============================================================================
// FHorzScrollBox
// =============================================================================
procedure TFHorzScrollBox.FCreate(FParent: TFmxObject);
begin
  ControlHorzScrollBox := THorzScrollBox.Create(nil);
  ControlHorzScrollBox.Parent := FParent;
end;

procedure TFHorzScrollBox.Cursor(FCursor: TCursor);
begin
  ControlHorzScrollBox.Cursor := TCursor(FCursor);
end;

procedure TFHorzScrollBox.Left(FLeft: Single);
begin
  ControlHorzScrollBox.Position.X := FLeft;
end;

procedure TFHorzScrollBox.Top(FTop: Single);
begin
  ControlHorzScrollBox.Position.Y := FTop;
end;

procedure TFHorzScrollBox.Height(FHeight: Single);
begin
  ControlHorzScrollBox.Size.Height := FHeight;
end;

procedure TFHorzScrollBox.Width(FWidth: Single);
begin
  ControlHorzScrollBox.Size.Width := FWidth;
end;

procedure TFHorzScrollBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlHorzScrollBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFHorzScrollBox.Position(X, Y: Single);
begin
  ControlHorzScrollBox.Position.X := X;
  ControlHorzScrollBox.Position.Y := Y;
end;

procedure TFHorzScrollBox.Align(Al: TAlignLayout);
begin
  ControlHorzScrollBox.Align := TAlignLayout(Al);
end;

procedure TFHorzScrollBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlHorzScrollBox.Margins.Left := FLeft;
  ControlHorzScrollBox.Margins.Top := FTop;
  ControlHorzScrollBox.Margins.Right := FRight;
  ControlHorzScrollBox.Margins.Bottom := FBottom;
end;

procedure TFHorzScrollBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlHorzScrollBox.Padding.Left := FLeft;
  ControlHorzScrollBox.Padding.Top := FTop;
  ControlHorzScrollBox.Padding.Right := FRight;
  ControlHorzScrollBox.Padding.Bottom := FBottom;
end;

procedure TFHorzScrollBox.SetHint(const FText: WideString);
begin
  ControlHorzScrollBox.ShowHint := True;
  ControlHorzScrollBox.Hint := string(FText);
end;

procedure TFHorzScrollBox.SetClipChildren(FValue: Boolean);
begin
  ControlHorzScrollBox.ClipChildren := FValue;
end;

procedure TFHorzScrollBox.SetClipParent(FValue: Boolean);
begin
  ControlHorzScrollBox.ClipParent := FValue;
end;

procedure TFHorzScrollBox.BringToFront;
begin
  ControlHorzScrollBox.BringToFront;
end;

procedure TFHorzScrollBox.SendToBack;
begin
  ControlHorzScrollBox.SendToBack;
end;

procedure TFHorzScrollBox.SetTag(FTag: Integer);
begin
  ControlHorzScrollBox.Tag := FTag;
end;

procedure TFHorzScrollBox.AutoHide(FValue: Boolean);
begin
  ControlHorzScrollBox.AutoHide := FValue;
end;

procedure TFHorzScrollBox.Bounces(FValue: Boolean);
begin
  if FValue then
    ControlHorzScrollBox.Bounces := TBehaviorBoolean.True
  else
    ControlHorzScrollBox.Bounces := TBehaviorBoolean.False;
end;

procedure TFHorzScrollBox.DisableMouseWheel(FValue: Boolean);
begin
  ControlHorzScrollBox.DisableMouseWheel := FValue;
end;

procedure TFHorzScrollBox.ScrollAnimation(FValue: Boolean);
begin
  if FValue then
    ControlHorzScrollBox.ScrollAnimation := TBehaviorBoolean.True
  else
    ControlHorzScrollBox.ScrollAnimation := TBehaviorBoolean.False;
end;

procedure TFHorzScrollBox.ShowScrollBars(FValue: Boolean);
begin
  ControlHorzScrollBox.ShowScrollBars := FValue;
end;

procedure TFHorzScrollBox.ShowSizeGrip(FValue: Boolean);
begin
  ControlHorzScrollBox.ShowSizeGrip := FValue;
end;

procedure TFHorzScrollBox.TouchTracking(FValue: Boolean);
begin
  if FValue then
    ControlHorzScrollBox.TouchTracking := TBehaviorBoolean.True
  else
    ControlHorzScrollBox.TouchTracking := TBehaviorBoolean.False;
end;

procedure TFHorzScrollBox.ScrollTo(const Dx, Dy: Single);
begin
  ControlHorzScrollBox.ViewportPosition := PointF(Dx, Dy);
end;

procedure TFHorzScrollBox.ScrollBy(const Dx, Dy: Single);
begin
  with ControlHorzScrollBox do
    ViewportPosition := PointF(ViewportPosition.X + Dx,
      ViewportPosition.Y + Dy);
end;

procedure TFHorzScrollBox.GotoLastLine;
begin
  with ControlHorzScrollBox do
    ViewportPosition := PointF(ViewportPosition.X,
      ContentBounds.Bottom - Height);
end;

procedure TFHorzScrollBox.BeginUpdate;
begin
  ControlHorzScrollBox.BeginUpdate;
end;

procedure TFHorzScrollBox.EndUpdate;
begin
  ControlHorzScrollBox.EndUpdate;
end;

procedure TFHorzScrollBox.RealignContent;
begin
  ControlHorzScrollBox.RealignContent;
end;

procedure TFHorzScrollBox.RecalcSize;
begin
  ControlHorzScrollBox.RecalcSize;
end;

procedure TFHorzScrollBox.Repaint;
begin
  ControlHorzScrollBox.Repaint;
end;

procedure TFHorzScrollBox.Opacity(FOpacity: Single);
begin
  ControlHorzScrollBox.Opacity := FOpacity;
end;

procedure TFHorzScrollBox.RotationAngle(FValue: Single);
begin
  ControlHorzScrollBox.RotationAngle := FValue;
end;

procedure TFHorzScrollBox.RotationCenter(X, Y: Single);
begin
  ControlHorzScrollBox.RotationCenter.X := X;
  ControlHorzScrollBox.RotationCenter.Y := Y;
end;

procedure TFHorzScrollBox.Enabled(FEnabled: Boolean);
begin
  ControlHorzScrollBox.Enabled := FEnabled;
end;

procedure TFHorzScrollBox.Visible(FVisible: Boolean);
begin
  ControlHorzScrollBox.Visible := FVisible;
end;

procedure TFHorzScrollBox.HitTest(FEnabled: Boolean);
begin
  ControlHorzScrollBox.HitTest := FEnabled;
end;

procedure TFHorzScrollBox.StyleLookUp(FStyle: WideString);
begin
  ControlHorzScrollBox.StyleLookUp := string(FStyle);
end;

function TFHorzScrollBox.IsVisible: Boolean;
begin
  Result := ControlHorzScrollBox.Visible;
end;

function TFHorzScrollBox.GetTag: Integer;
begin
  Result := ControlHorzScrollBox.Tag;
end;

function TFHorzScrollBox.GetLeft: Single;
begin
  Result := ControlHorzScrollBox.Position.X;
end;

function TFHorzScrollBox.GetTop: Single;
begin
  Result := ControlHorzScrollBox.Position.Y;
end;

function TFHorzScrollBox.GetHeight: Single;
begin
  Result := ControlHorzScrollBox.Size.Height;
end;

function TFHorzScrollBox.GetWidth: Single;
begin
  Result := ControlHorzScrollBox.Size.Width;
end;

function TFHorzScrollBox.GetObject: TFmxObject;
begin
  Result := ControlHorzScrollBox;
end;

procedure TFHorzScrollBox.OnClick(Event: TNotifyEvent);
begin
  ControlHorzScrollBox.OnClick := TNotifyEvent(Event);
end;

procedure TFHorzScrollBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlHorzScrollBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFHorzScrollBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlHorzScrollBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFHorzScrollBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlHorzScrollBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFHorzScrollBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlHorzScrollBox.OnMouseUp := TMouseEvent(Event);
end;

function TFHorzScrollBox.Handle: TFmxObject;
begin
  Result := ControlHorzScrollBox;
end;

// =============================================================================
// FVertScrollBox
// =============================================================================
procedure TFVertScrollBox.FCreate(FParent: TFmxObject);
begin
  ControlVertScrollBox := TVertScrollBox.Create(nil);
  ControlVertScrollBox.Parent := FParent;
end;

procedure TFVertScrollBox.Cursor(FCursor: TCursor);
begin
  ControlVertScrollBox.Cursor := TCursor(FCursor);
end;

procedure TFVertScrollBox.Left(FLeft: Single);
begin
  ControlVertScrollBox.Position.X := FLeft;
end;

procedure TFVertScrollBox.Top(FTop: Single);
begin
  ControlVertScrollBox.Position.Y := FTop;
end;

procedure TFVertScrollBox.Height(FHeight: Single);
begin
  ControlVertScrollBox.Size.Height := FHeight;
end;

procedure TFVertScrollBox.Width(FWidth: Single);
begin
  ControlVertScrollBox.Size.Width := FWidth;
end;

procedure TFVertScrollBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlVertScrollBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFVertScrollBox.Position(X, Y: Single);
begin
  ControlVertScrollBox.Position.X := X;
  ControlVertScrollBox.Position.Y := Y;
end;

procedure TFVertScrollBox.Align(Al: TAlignLayout);
begin
  ControlVertScrollBox.Align := TAlignLayout(Al);
end;

procedure TFVertScrollBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlVertScrollBox.Margins.Left := FLeft;
  ControlVertScrollBox.Margins.Top := FTop;
  ControlVertScrollBox.Margins.Right := FRight;
  ControlVertScrollBox.Margins.Bottom := FBottom;
end;

procedure TFVertScrollBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlVertScrollBox.Padding.Left := FLeft;
  ControlVertScrollBox.Padding.Top := FTop;
  ControlVertScrollBox.Padding.Right := FRight;
  ControlVertScrollBox.Padding.Bottom := FBottom;
end;

procedure TFVertScrollBox.SetHint(const FText: WideString);
begin
  ControlVertScrollBox.ShowHint := True;
  ControlVertScrollBox.Hint := string(FText);
end;

procedure TFVertScrollBox.SetClipChildren(FValue: Boolean);
begin
  ControlVertScrollBox.ClipChildren := FValue;
end;

procedure TFVertScrollBox.SetClipParent(FValue: Boolean);
begin
  ControlVertScrollBox.ClipParent := FValue;
end;

procedure TFVertScrollBox.BringToFront;
begin
  ControlVertScrollBox.BringToFront;
end;

procedure TFVertScrollBox.SendToBack;
begin
  ControlVertScrollBox.SendToBack;
end;

procedure TFVertScrollBox.SetTag(FTag: Integer);
begin
  ControlVertScrollBox.Tag := FTag;
end;

procedure TFVertScrollBox.AutoHide(FValue: Boolean);
begin
  ControlVertScrollBox.AutoHide := FValue;
end;

procedure TFVertScrollBox.Bounces(FValue: Boolean);
begin
  if FValue then
    ControlVertScrollBox.Bounces := TBehaviorBoolean.True
  else
    ControlVertScrollBox.Bounces := TBehaviorBoolean.False;
end;

procedure TFVertScrollBox.DisableMouseWheel(FValue: Boolean);
begin
  ControlVertScrollBox.DisableMouseWheel := FValue;
end;

procedure TFVertScrollBox.ScrollAnimation(FValue: Boolean);
begin
  if FValue then
    ControlVertScrollBox.ScrollAnimation := TBehaviorBoolean.True
  else
    ControlVertScrollBox.ScrollAnimation := TBehaviorBoolean.False;
end;

procedure TFVertScrollBox.ShowScrollBars(FValue: Boolean);
begin
  ControlVertScrollBox.ShowScrollBars := FValue;
end;

procedure TFVertScrollBox.ShowSizeGrip(FValue: Boolean);
begin
  ControlVertScrollBox.ShowSizeGrip := FValue;
end;

procedure TFVertScrollBox.TouchTracking(FValue: Boolean);
begin
  if FValue then
    ControlVertScrollBox.TouchTracking := TBehaviorBoolean.True
  else
    ControlVertScrollBox.TouchTracking := TBehaviorBoolean.False;
end;

procedure TFVertScrollBox.ScrollTo(const Dx, Dy: Single);
begin
  ControlVertScrollBox.ViewportPosition := PointF(Dx, Dy);
end;

procedure TFVertScrollBox.ScrollBy(const Dx, Dy: Single);
begin
  with ControlVertScrollBox do
    ViewportPosition := PointF(ViewportPosition.X + Dx,
      ViewportPosition.Y + Dy);
end;

procedure TFVertScrollBox.GotoLastLine;
begin
  with ControlVertScrollBox do
    ViewportPosition := PointF(ViewportPosition.X,
      ContentBounds.Bottom - Height);
end;

procedure TFVertScrollBox.BeginUpdate;
begin
  ControlVertScrollBox.BeginUpdate;
end;

procedure TFVertScrollBox.EndUpdate;
begin
  ControlVertScrollBox.EndUpdate;
end;

procedure TFVertScrollBox.RealignContent;
begin
  ControlVertScrollBox.RealignContent;
end;

procedure TFVertScrollBox.RecalcSize;
begin
  ControlVertScrollBox.RecalcSize;
end;

procedure TFVertScrollBox.Repaint;
begin
  ControlVertScrollBox.Repaint;
end;

procedure TFVertScrollBox.Opacity(FOpacity: Single);
begin
  ControlVertScrollBox.Opacity := FOpacity;
end;

procedure TFVertScrollBox.RotationAngle(FValue: Single);
begin
  ControlVertScrollBox.RotationAngle := FValue;
end;

procedure TFVertScrollBox.RotationCenter(X, Y: Single);
begin
  ControlVertScrollBox.RotationCenter.X := X;
  ControlVertScrollBox.RotationCenter.Y := Y;
end;

procedure TFVertScrollBox.Enabled(FEnabled: Boolean);
begin
  ControlVertScrollBox.Enabled := FEnabled;
end;

procedure TFVertScrollBox.Visible(FVisible: Boolean);
begin
  ControlVertScrollBox.Visible := FVisible;
end;

procedure TFVertScrollBox.HitTest(FEnabled: Boolean);
begin
  ControlVertScrollBox.HitTest := FEnabled;
end;

procedure TFVertScrollBox.StyleLookUp(FStyle: WideString);
begin
  ControlVertScrollBox.StyleLookUp := string(FStyle);
end;

function TFVertScrollBox.IsVisible: Boolean;
begin
  Result := ControlVertScrollBox.Visible;
end;

function TFVertScrollBox.GetTag: Integer;
begin
  Result := ControlVertScrollBox.Tag;
end;

function TFVertScrollBox.GetLeft: Single;
begin
  Result := ControlVertScrollBox.Position.X;
end;

function TFVertScrollBox.GetTop: Single;
begin
  Result := ControlVertScrollBox.Position.Y;
end;

function TFVertScrollBox.GetHeight: Single;
begin
  Result := ControlVertScrollBox.Size.Height;
end;

function TFVertScrollBox.GetWidth: Single;
begin
  Result := ControlVertScrollBox.Size.Width;
end;

function TFVertScrollBox.GetObject: TFmxObject;
begin
  Result := ControlVertScrollBox;
end;

procedure TFVertScrollBox.OnClick(Event: TNotifyEvent);
begin
  ControlVertScrollBox.OnClick := TNotifyEvent(Event);
end;

procedure TFVertScrollBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlVertScrollBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFVertScrollBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlVertScrollBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFVertScrollBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlVertScrollBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFVertScrollBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlVertScrollBox.OnMouseUp := TMouseEvent(Event);
end;

function TFVertScrollBox.Handle: TFmxObject;
begin
  Result := ControlVertScrollBox;
end;

// =============================================================================
// FBufferedLayout
// =============================================================================
procedure TFBufferedLayout.FCreate(FParent: TFmxObject);
begin
  ControlBufferLayout := TBufferedLayout.Create(nil);
  ControlBufferLayout.Parent := FParent;
end;

procedure TFBufferedLayout.Cursor(FCursor: TCursor);
begin
  ControlBufferLayout.Cursor := TCursor(FCursor);
end;

procedure TFBufferedLayout.Left(FLeft: Single);
begin
  ControlBufferLayout.Position.X := FLeft;
end;

procedure TFBufferedLayout.Top(FTop: Single);
begin
  ControlBufferLayout.Position.Y := FTop;
end;

procedure TFBufferedLayout.Height(FHeight: Single);
begin
  ControlBufferLayout.Size.Height := FHeight;
end;

procedure TFBufferedLayout.Width(FWidth: Single);
begin
  ControlBufferLayout.Size.Width := FWidth;
end;

procedure TFBufferedLayout.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlBufferLayout.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFBufferedLayout.Position(X, Y: Single);
begin
  ControlBufferLayout.Position.X := X;
  ControlBufferLayout.Position.Y := Y;
end;

procedure TFBufferedLayout.Align(Al: TAlignLayout);
begin
  ControlBufferLayout.Align := TAlignLayout(Al);
end;

procedure TFBufferedLayout.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlBufferLayout.Margins.Left := FLeft;
  ControlBufferLayout.Margins.Top := FTop;
  ControlBufferLayout.Margins.Right := FRight;
  ControlBufferLayout.Margins.Bottom := FBottom;
end;

procedure TFBufferedLayout.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlBufferLayout.Padding.Left := FLeft;
  ControlBufferLayout.Padding.Top := FTop;
  ControlBufferLayout.Padding.Right := FRight;
  ControlBufferLayout.Padding.Bottom := FBottom;
end;

procedure TFBufferedLayout.SetHint(const FText: WideString);
begin
  ControlBufferLayout.ShowHint := True;
  ControlBufferLayout.Hint := string(FText);
end;

procedure TFBufferedLayout.SetClipChildren(FValue: Boolean);
begin
  ControlBufferLayout.ClipChildren := FValue;
end;

procedure TFBufferedLayout.SetClipParent(FValue: Boolean);
begin
  ControlBufferLayout.ClipParent := FValue;
end;

procedure TFBufferedLayout.BringToFront;
begin
  ControlBufferLayout.BringToFront;
end;

procedure TFBufferedLayout.SendToBack;
begin
  ControlBufferLayout.SendToBack;
end;

procedure TFBufferedLayout.SetTag(FTag: Integer);
begin
  ControlBufferLayout.Tag := FTag;
end;

procedure TFBufferedLayout.Opacity(FOpacity: Single);
begin
  ControlBufferLayout.Opacity := FOpacity;
end;

procedure TFBufferedLayout.RotationAngle(FValue: Single);
begin
  ControlBufferLayout.RotationAngle := FValue;
end;

procedure TFBufferedLayout.RotationCenter(X, Y: Single);
begin
  ControlBufferLayout.RotationCenter.X := X;
  ControlBufferLayout.RotationCenter.Y := Y;
end;

procedure TFBufferedLayout.Enabled(FEnabled: Boolean);
begin
  ControlBufferLayout.Enabled := FEnabled;
end;

procedure TFBufferedLayout.Visible(FVisible: Boolean);
begin
  ControlBufferLayout.Visible := FVisible;
end;

procedure TFBufferedLayout.HitTest(FEnabled: Boolean);
begin
  ControlBufferLayout.HitTest := FEnabled;
end;

function TFBufferedLayout.IsVisible: Boolean;
begin
  Result := ControlBufferLayout.Visible;
end;

function TFBufferedLayout.GetTag: Integer;
begin
  Result := ControlBufferLayout.Tag;
end;

function TFBufferedLayout.GetLeft: Single;
begin
  Result := ControlBufferLayout.Position.X;
end;

function TFBufferedLayout.GetTop: Single;
begin
  Result := ControlBufferLayout.Position.Y;
end;

function TFBufferedLayout.GetHeight: Single;
begin
  Result := ControlBufferLayout.Size.Height;
end;

function TFBufferedLayout.GetWidth: Single;
begin
  Result := ControlBufferLayout.Size.Width;
end;

function TFBufferedLayout.GetObject: TFmxObject;
begin
  Result := ControlBufferLayout;
end;

procedure TFBufferedLayout.OnClick(Event: TNotifyEvent);
begin
  ControlBufferLayout.OnClick := TNotifyEvent(Event);
end;

procedure TFBufferedLayout.OnMouseDown(Event: TMouseEvent);
begin
  ControlBufferLayout.OnMouseDown := TMouseEvent(Event);
end;

procedure TFBufferedLayout.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlBufferLayout.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFBufferedLayout.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlBufferLayout.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFBufferedLayout.OnMouseUp(Event: TMouseEvent);
begin
  ControlBufferLayout.OnMouseUp := TMouseEvent(Event);
end;

function TFBufferedLayout.Handle: TFmxObject;
begin
  Result := ControlBufferLayout;
end;

// =============================================================================
// Exports
// =============================================================================
function InitLayoutHandle: FLayout;
begin
  Result := TFLayout.Create;
end;

function InitScaledLayoutHandle: FScaledLayout;
begin
  Result := TFScaledLayout.Create;
end;

function InitGridLayoutHandle: FGridLayout;
begin
  Result := TFGridLayout.Create;
end;

function InitGridPanelLayoutHandle: FGridPanelLayout;
begin
  Result := TFGridPanelLayout.Create;
end;

function InitFlowLayoutHandle: FFlowLayout;
begin
  Result := TFFlowLayout.Create;
end;

function InitScrollBoxHandle: FScrollBox;
begin
  Result := TFScrollBox.Create;
end;

function InitHorzScrollBoxHandle: FHorzScrollBox;
begin
  Result := TFHorzScrollBox.Create;
end;

function InitVertScrollBoxHandle: FVertScrollBox;
begin
  Result := TFVertScrollBox.Create;
end;

function InitBufferedLayoutHandle: FBufferedLayout;
begin
  Result := TFBufferedLayout.Create;
end;

exports
  InitLayoutHandle,
  InitScaledLayoutHandle,
  InitGridLayoutHandle,
  InitGridPanelLayoutHandle,
  InitFlowLayoutHandle,
  InitScrollBoxHandle,
  InitHorzScrollBoxHandle,
  InitVertScrollBoxHandle,
  InitBufferedLayoutHandle;

end.
