
unit FMXBridge.Additional;

interface

uses
  System.Classes, System.UITypes, System.Types,
  FMX.Types, FMX.Graphics, FMX.StdCtrls, FMX.ExtCtrls, FMX.Objects, FMX.ImgList,
  FMX.ComboEdit, FMX.EditBox, FMX.SpinBox, FMX.NumberBox, FMX.ComboTrackBar;

// =============================================================================
// FSpeedButton
// =============================================================================
type
  FSpeedButton = interface(IUnknown)
    ['{06685429-686A-46B5-8C4C-1DDA4C1AF424}']
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
    procedure StayPressed(FValue: Boolean); stdcall;
    procedure Pressed(FValue: Boolean); stdcall;
    procedure GroupName(FGroup: WideString); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure TextHorzAlign(FHorzAlign: TTextAlign); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    procedure ModalResult(FModalResult: TModalResult); stdcall;
    function GetModalResult: TModalResult; stdcall;
    function IsPressed: Boolean; stdcall;
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

  TFSpeedButton = class(TInterfacedObject, FSpeedButton)
  private
    ControlSpeedButton: TSpeedButton;
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
    procedure StayPressed(FValue: Boolean); stdcall;
    procedure Pressed(FValue: Boolean); stdcall;
    procedure GroupName(FGroup: WideString); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure TextHorzAlign(FHorzAlign: TTextAlign); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    procedure ModalResult(FModalResult: TModalResult); stdcall;
    function GetModalResult: TModalResult; stdcall;
    function IsPressed: Boolean; stdcall;
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
// FCornerButton
// =============================================================================
type
  FCornerButton = interface(IUnknown)
    ['{41D1AB35-3B0F-4B13-BB6E-A464CEABF708}']
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
    procedure StayPressed(FValue: Boolean); stdcall;
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure Sides(FSides: TSides); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure TextHorzAlign(FHorzAlign: TTextAlign); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    procedure ModalResult(FModalResult: TModalResult); stdcall;
    function GetModalResult: TModalResult; stdcall;
    function IsPressed: Boolean; stdcall;
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

  TFCornerButton = class(TInterfacedObject, FCornerButton)
  private
    ControlCornerButton: TCornerButton;
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
    procedure StayPressed(FValue: Boolean); stdcall;
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure Sides(FSides: TSides); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure TextHorzAlign(FHorzAlign: TTextAlign); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    procedure ModalResult(FModalResult: TModalResult); stdcall;
    function GetModalResult: TModalResult; stdcall;
    function IsPressed: Boolean; stdcall;
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
// FArcDial
// =============================================================================
type
  FArcDial = interface(IUnknown)
    ['{E79CB1CE-E09E-45B5-8A37-6798E7C0B4FE}']
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure ShowValue(FValue: Boolean); stdcall;
    procedure Frequency(FValue: Double); stdcall;
    procedure Tracking(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetValue: Single; stdcall;
    function GetFrequency: Double; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    procedure OnMouseWheel(Event: TMouseWheelEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFArcDial = class(TInterfacedObject, FArcDial)
  private
    ControlArcDial: TArcDial;
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure ShowValue(FValue: Boolean); stdcall;
    procedure Frequency(FValue: Double); stdcall;
    procedure Tracking(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetValue: Single; stdcall;
    function GetFrequency: Double; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    procedure OnMouseWheel(Event: TMouseWheelEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FAniIndicator
// =============================================================================
type
  FAniIndicator = interface(IUnknown)
    ['{604C3ED3-2902-4F6C-BE03-D72BFF22BB23}']
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
    procedure Style(FStyle: TAniIndicatorStyle); stdcall;
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

  TFAniIndicator = class(TInterfacedObject, FAniIndicator)
  private
    ControlAniIndicator: TAniIndicator;
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
    procedure Style(FStyle: TAniIndicatorStyle); stdcall;
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
// FDropTarget
// =============================================================================
type
  FDropTarget = interface(IUnknown)
    ['{71BAA1DE-B251-47FA-8FC6-F4A96D6D48C3}']
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
    procedure Filter(const FFilter: WideString); stdcall;
    procedure FilterIndex(FIndex: Integer); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFDropTarget = class(TInterfacedObject, FDropTarget)
  private
    ControlDropTarget: TDropTarget;
    procedure DropTargetDropped(Sender: TObject; const Data: TDragObject;
      const Point: TPointF);
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
    procedure Filter(const FFilter: WideString); stdcall;
    procedure FilterIndex(FIndex: Integer); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FImageViewer
// =============================================================================
type
  FImageViewer = interface(IUnknown)
    ['{55425B62-7DBE-4027-9F46-075F446D81F0}']
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
    procedure BackgroundFillColor(FColor: TAlphaColor); stdcall;
    procedure BackgroundFillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure BackgroundFillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure BackgroundFillGradientLinearAngle(FAngle: Single); stdcall;
    procedure BackgroundFillGradientRadialAngle(FAngle: Single); stdcall;
    procedure BackgroundFillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure LoadPicture(const FImage: WideString); stdcall;
    procedure BitmapScale(FScale: Single); stdcall;
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure MouseScaling(FValue: Boolean); stdcall;
    procedure ShowBackground(FValue: Boolean); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure TouchTracking(FValue: Boolean); stdcall;
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

  TFImageViewer = class(TInterfacedObject, FImageViewer)
  private
    ControlImageViewer: TImageViewer;
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
    procedure BackgroundFillColor(FColor: TAlphaColor); stdcall;
    procedure BackgroundFillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure BackgroundFillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure BackgroundFillGradientLinearAngle(FAngle: Single); stdcall;
    procedure BackgroundFillGradientRadialAngle(FAngle: Single); stdcall;
    procedure BackgroundFillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure LoadPicture(const FImage: WideString); stdcall;
    procedure BitmapScale(FScale: Single); stdcall;
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure MouseScaling(FValue: Boolean); stdcall;
    procedure ShowBackground(FValue: Boolean); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure TouchTracking(FValue: Boolean); stdcall;
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
// FNumberBox
// =============================================================================
type
  FNumberBox = interface(IUnknown)
    ['{0D944035-9B03-43D3-9D2B-B456BD63A295}']
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure DecimalDigits(FDigits: Integer); stdcall;
    procedure HorzIncrement(FValue: Single); stdcall;
    procedure VertIncrement(FValue: Single); stdcall;
    procedure VerticalMode(FEnabled: Boolean); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure ValueType(FFloat: Boolean); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetHorzIncrement: Single; stdcall;
    function GetVertIncrement: Single; stdcall;
    function IsVerticalMode: Boolean; stdcall;
    function GetValue: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeTracking(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFNumberBox = class(TInterfacedObject, FNumberBox)
  private
    ControlNumberBox: TNumberBox;
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure DecimalDigits(FDigits: Integer); stdcall;
    procedure HorzIncrement(FValue: Single); stdcall;
    procedure VertIncrement(FValue: Single); stdcall;
    procedure VerticalMode(FEnabled: Boolean); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure ValueType(FFloat: Boolean); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetHorzIncrement: Single; stdcall;
    function GetVertIncrement: Single; stdcall;
    function IsVerticalMode: Boolean; stdcall;
    function GetValue: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeTracking(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSpinBox
// =============================================================================
type
  FSpinBox = interface(IUnknown)
    ['{D958ED9F-723B-4544-9B8A-ACDE84247F75}']
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure DecimalDigits(FDigits: Integer); stdcall;
    procedure Increment(FValue: Single); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure ValueType(FFloat: Boolean); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure StepUp; stdcall;
    procedure StepDown; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIncrement: Single; stdcall;
    function GetValue: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeTracking(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSpinBox = class(TInterfacedObject, FSpinBox)
  private
    ControlSpinBox: TSpinBox;
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure DecimalDigits(FDigits: Integer); stdcall;
    procedure Increment(FValue: Single); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure ValueType(FFloat: Boolean); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure StepUp; stdcall;
    procedure StepDown; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIncrement: Single; stdcall;
    function GetValue: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeTracking(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FComboEdit
// =============================================================================
type
  FComboEdit = interface(IUnknown)
    ['{69CC8E2E-9C88-4021-91BA-469DAFE9BDCB}']
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
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure SetDropDownCount(Count: Integer); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure ItemWidth(FWidth: Single); stdcall;
    procedure SetItemIndex(FIndex: Integer); stdcall;
    procedure AddItem(const FItem: WideString); stdcall;
    procedure ListBoxResource(const FResource: WideString); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItem(FIndex: Integer): WideString; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetItemCount: Integer; stdcall;
    function GetDropDownCount: Integer; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClosePopup(Event: TNotifyEvent); stdcall;
    procedure OnTyping(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFComboEdit = class(TInterfacedObject, FComboEdit)
  private
    ControlComboEdit: TComboEdit;
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
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure SetDropDownCount(Count: Integer); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure ItemWidth(FWidth: Single); stdcall;
    procedure SetItemIndex(FIndex: Integer); stdcall;
    procedure AddItem(const FItem: WideString); stdcall;
    procedure ListBoxResource(const FResource: WideString); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItem(FIndex: Integer): WideString; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetItemCount: Integer; stdcall;
    function GetDropDownCount: Integer; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClosePopup(Event: TNotifyEvent); stdcall;
    procedure OnTyping(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FComboTrackBar
// =============================================================================
type
  FComboTrackBar = interface(IUnknown)
    ['{1CA4E80E-BAC1-457E-8DB3-BC48ACEFC2BC}']
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure DecimalDigits(FValue: Integer); stdcall;
    procedure Frequency(FValue: Double); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure ValueType(FType: Integer); stdcall;
    procedure ReadOnly(FEnabled: Boolean); stdcall;
    procedure DropDown; stdcall;
    procedure CloseDropDown; stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetDroppedDown: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetValue: Single; stdcall;
    function GetFrequency: Double; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeTracking(Event: TNotifyEvent); stdcall;
    procedure OnTyping(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFComboTrackBar = class(TInterfacedObject, FComboTrackBar)
  private
    ControlComboTrackBar: TComboTrackBar;
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure DecimalDigits(FValue: Integer); stdcall;
    procedure Frequency(FValue: Double); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure ValueType(FType: Integer); stdcall;
    procedure ReadOnly(FEnabled: Boolean); stdcall;
    procedure DropDown; stdcall;
    procedure CloseDropDown; stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetDroppedDown: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetValue: Single; stdcall;
    function GetFrequency: Double; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeTracking(Event: TNotifyEvent); stdcall;
    procedure OnTyping(Event: TNotifyEvent); stdcall;
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
function InitSpeedButtonHandle: FSpeedButton; stdcall;
function InitCornerButtonHandle: FCornerButton; stdcall;
function InitArcDialHandle: FArcDial; stdcall;
function InitAniIndicatorHandle: FAniIndicator; stdcall;
function InitDropTargetHandle: FDropTarget; stdcall;
function InitImageViewerHandle: FImageViewer; stdcall;
function InitNumberBoxHandle: FNumberBox; stdcall;
function InitSpinBoxHandle: FSpinBox; stdcall;
function InitComboEditHandle: FComboEdit; stdcall;
function InitComboTrackBarHandle: FComboTrackBar; stdcall;

implementation

uses
  FMX.Text, FMX.Pickers, FMX.BehaviorManager,
  FMXBridge.Utils, FMXBridge.BrushHelpers;

// =============================================================================
// FSpeedButton
// =============================================================================
procedure TFSpeedButton.FCreate(FParent: TFmxObject);
begin
  ControlSpeedButton := TSpeedButton.Create(nil);
  ControlSpeedButton.Parent := FParent;
  ControlSpeedButton.Text := 'SpeedButton1';
end;

procedure TFSpeedButton.Cursor(FCursor: TCursor);
begin
  ControlSpeedButton.Cursor := TCursor(FCursor);
end;

procedure TFSpeedButton.Left(FLeft: Single);
begin
  ControlSpeedButton.Position.X := FLeft;
end;

procedure TFSpeedButton.Top(FTop: Single);
begin
  ControlSpeedButton.Position.Y := FTop;
end;

procedure TFSpeedButton.Height(FHeight: Single);
begin
  ControlSpeedButton.Size.Height := FHeight;
end;

procedure TFSpeedButton.Width(FWidth: Single);
begin
  ControlSpeedButton.Size.Width := FWidth;
end;

procedure TFSpeedButton.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlSpeedButton.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSpeedButton.Position(X, Y: Single);
begin
  ControlSpeedButton.Position.X := X;
  ControlSpeedButton.Position.Y := Y;
end;

procedure TFSpeedButton.Align(Al: TAlignLayout);
begin
  ControlSpeedButton.Align := TAlignLayout(Al);
end;

procedure TFSpeedButton.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSpeedButton.Margins.Left := FLeft;
  ControlSpeedButton.Margins.Top := FTop;
  ControlSpeedButton.Margins.Right := FRight;
  ControlSpeedButton.Margins.Bottom := FBottom;
end;

procedure TFSpeedButton.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSpeedButton.Padding.Left := FLeft;
  ControlSpeedButton.Padding.Top := FTop;
  ControlSpeedButton.Padding.Right := FRight;
  ControlSpeedButton.Padding.Bottom := FBottom;
end;

procedure TFSpeedButton.SetHint(const FText: WideString);
begin
  ControlSpeedButton.ShowHint := True;
  ControlSpeedButton.Hint := string(FText);
end;

procedure TFSpeedButton.SetClipChildren(FValue: Boolean);
begin
  ControlSpeedButton.ClipChildren := FValue;
end;

procedure TFSpeedButton.SetClipParent(FValue: Boolean);
begin
  ControlSpeedButton.ClipParent := FValue;
end;

procedure TFSpeedButton.BringToFront;
begin
  ControlSpeedButton.BringToFront;
end;

procedure TFSpeedButton.SendToBack;
begin
  ControlSpeedButton.SendToBack;
end;

procedure TFSpeedButton.SetTag(FTag: Integer);
begin
  ControlSpeedButton.Tag := FTag;
end;

procedure TFSpeedButton.StayPressed(FValue: Boolean);
begin
  ControlSpeedButton.StaysPressed := FValue;
end;

procedure TFSpeedButton.Pressed(FValue: Boolean);
begin
  if FValue then
    ControlSpeedButton.StaysPressed := True;

  ControlSpeedButton.IsPressed := FValue;
end;

procedure TFSpeedButton.GroupName(FGroup: WideString);
begin
  ControlSpeedButton.GroupName := string(FGroup);
end;

procedure TFSpeedButton.Text(const FText: WideString);
begin
  ControlSpeedButton.Text := string(FText);
end;

procedure TFSpeedButton.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlSpeedButton.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFSpeedButton.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlSpeedButton.StyledSettings := [];

  ControlSpeedButton.TextSettings.Font.Family := string(FontName);
  ControlSpeedButton.TextSettings.Font.Size := FontSize;
  ControlSpeedButton.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFSpeedButton.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlSpeedButton.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlSpeedButton.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlSpeedButton.TextSettings.WordWrap := FWordWrap;
end;

procedure TFSpeedButton.Images(FImgList: TImageList);
begin
  ControlSpeedButton.Images := TImageList(FImgList);
end;

procedure TFSpeedButton.ImageIndex(FIndex: Integer);
begin
  ControlSpeedButton.ImageIndex := FIndex;
end;

procedure TFSpeedButton.TextHorzAlign(FHorzAlign: TTextAlign);
begin
  ControlSpeedButton.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
end;

procedure TFSpeedButton.Opacity(FOpacity: Single);
begin
  ControlSpeedButton.Opacity := FOpacity;
end;

procedure TFSpeedButton.RotationAngle(FValue: Single);
begin
  ControlSpeedButton.RotationAngle := FValue;
end;

procedure TFSpeedButton.RotationCenter(X, Y: Single);
begin
  ControlSpeedButton.RotationCenter.X := X;
  ControlSpeedButton.RotationCenter.Y := Y;
end;

procedure TFSpeedButton.Enabled(FEnabled: Boolean);
begin
  ControlSpeedButton.Enabled := FEnabled;
end;

procedure TFSpeedButton.Visible(FVisible: Boolean);
begin
  ControlSpeedButton.Visible := FVisible;
end;

procedure TFSpeedButton.HitTest(FEnabled: Boolean);
begin
  ControlSpeedButton.HitTest := FEnabled;
end;

procedure TFSpeedButton.StyleLookUp(FStyle: WideString);
begin
  ControlSpeedButton.StyleLookUp := string(FStyle);
end;

procedure TFSpeedButton.ModalResult(FModalResult: TModalResult);
begin
  ControlSpeedButton.ModalResult := TModalResult(FModalResult);
end;

function TFSpeedButton.GetModalResult: TModalResult;
begin
  Result := ControlSpeedButton.ModalResult;
end;

function TFSpeedButton.IsPressed: Boolean;
begin
  Result := ControlSpeedButton.IsPressed;
end;

function TFSpeedButton.IsVisible: Boolean;
begin
  Result := ControlSpeedButton.Visible;
end;

function TFSpeedButton.GetText: WideString;
begin
  Result := ControlSpeedButton.Text;
end;

function TFSpeedButton.GetTag: Integer;
begin
  Result := ControlSpeedButton.Tag;
end;

function TFSpeedButton.GetLeft: Single;
begin
  Result := ControlSpeedButton.Position.X;
end;

function TFSpeedButton.GetTop: Single;
begin
  Result := ControlSpeedButton.Position.Y;
end;

function TFSpeedButton.GetHeight: Single;
begin
  Result := ControlSpeedButton.Size.Height;
end;

function TFSpeedButton.GetWidth: Single;
begin
  Result := ControlSpeedButton.Size.Width;
end;

function TFSpeedButton.GetObject: TFmxObject;
begin
  Result := ControlSpeedButton;
end;

procedure TFSpeedButton.OnClick(Event: TNotifyEvent);
begin
  ControlSpeedButton.OnClick := TNotifyEvent(Event);
end;

procedure TFSpeedButton.OnMouseDown(Event: TMouseEvent);
begin
  ControlSpeedButton.OnMouseDown := TMouseEvent(Event);
end;

procedure TFSpeedButton.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSpeedButton.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSpeedButton.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSpeedButton.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFSpeedButton.OnMouseUp(Event: TMouseEvent);
begin
  ControlSpeedButton.OnMouseUp := TMouseEvent(Event);
end;

function TFSpeedButton.Handle: TFmxObject;
begin
  Result := ControlSpeedButton;
end;

// =============================================================================
// FCornerButton
// =============================================================================
procedure TFCornerButton.FCreate(FParent: TFmxObject);
begin
  ControlCornerButton := TCornerButton.Create(nil);
  ControlCornerButton.Parent := FParent;
  ControlCornerButton.Text := 'CornerButton1';
end;

procedure TFCornerButton.Cursor(FCursor: TCursor);
begin
  ControlCornerButton.Cursor := TCursor(FCursor);
end;

procedure TFCornerButton.Left(FLeft: Single);
begin
  ControlCornerButton.Position.X := FLeft;
end;

procedure TFCornerButton.Top(FTop: Single);
begin
  ControlCornerButton.Position.Y := FTop;
end;

procedure TFCornerButton.Height(FHeight: Single);
begin
  ControlCornerButton.Size.Height := FHeight;
end;

procedure TFCornerButton.Width(FWidth: Single);
begin
  ControlCornerButton.Size.Width := FWidth;
end;

procedure TFCornerButton.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlCornerButton.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFCornerButton.Position(X, Y: Single);
begin
  ControlCornerButton.Position.X := X;
  ControlCornerButton.Position.Y := Y;
end;

procedure TFCornerButton.Align(Al: TAlignLayout);
begin
  ControlCornerButton.Align := TAlignLayout(Al);
end;

procedure TFCornerButton.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCornerButton.Margins.Left := FLeft;
  ControlCornerButton.Margins.Top := FTop;
  ControlCornerButton.Margins.Right := FRight;
  ControlCornerButton.Margins.Bottom := FBottom;
end;

procedure TFCornerButton.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCornerButton.Padding.Left := FLeft;
  ControlCornerButton.Padding.Top := FTop;
  ControlCornerButton.Padding.Right := FRight;
  ControlCornerButton.Padding.Bottom := FBottom;
end;

procedure TFCornerButton.SetHint(const FText: WideString);
begin
  ControlCornerButton.ShowHint := True;
  ControlCornerButton.Hint := string(FText);
end;

procedure TFCornerButton.SetClipChildren(FValue: Boolean);
begin
  ControlCornerButton.ClipChildren := FValue;
end;

procedure TFCornerButton.SetClipParent(FValue: Boolean);
begin
  ControlCornerButton.ClipParent := FValue;
end;

procedure TFCornerButton.BringToFront;
begin
  ControlCornerButton.BringToFront;
end;

procedure TFCornerButton.SendToBack;
begin
  ControlCornerButton.SendToBack;
end;

procedure TFCornerButton.SetTag(FTag: Integer);
begin
  ControlCornerButton.Tag := FTag;
end;

procedure TFCornerButton.StayPressed(FValue: Boolean);
begin
  ControlCornerButton.StaysPressed := FValue;
end;

procedure TFCornerButton.CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
  FCornerType: TCornerType);
begin
  ControlCornerButton.CornerType := TCornerType(FCornerType);
  ControlCornerButton.Corners := TCorners(FCorners);
  ControlCornerButton.XRadius := XRadi;
  ControlCornerButton.YRadius := YRadi;
end;

procedure TFCornerButton.Sides(FSides: TSides);
begin
  ControlCornerButton.Sides := TSides(FSides);
end;

procedure TFCornerButton.Text(const FText: WideString);
begin
  ControlCornerButton.Text := string(FText);
end;

procedure TFCornerButton.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlCornerButton.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFCornerButton.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlCornerButton.StyledSettings := [];

  ControlCornerButton.TextSettings.Font.Family := string(FontName);
  ControlCornerButton.TextSettings.Font.Size := FontSize;
  ControlCornerButton.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFCornerButton.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlCornerButton.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlCornerButton.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlCornerButton.TextSettings.WordWrap := FWordWrap;
end;

procedure TFCornerButton.Images(FImgList: TImageList);
begin
  ControlCornerButton.Images := TImageList(FImgList);
end;

procedure TFCornerButton.ImageIndex(FIndex: Integer);
begin
  ControlCornerButton.ImageIndex := FIndex;
end;

procedure TFCornerButton.TextHorzAlign(FHorzAlign: TTextAlign);
begin
  ControlCornerButton.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
end;

procedure TFCornerButton.Opacity(FOpacity: Single);
begin
  ControlCornerButton.Opacity := FOpacity;
end;

procedure TFCornerButton.RotationAngle(FValue: Single);
begin
  ControlCornerButton.RotationAngle := FValue;
end;

procedure TFCornerButton.RotationCenter(X, Y: Single);
begin
  ControlCornerButton.RotationCenter.X := X;
  ControlCornerButton.RotationCenter.Y := Y;
end;

procedure TFCornerButton.Enabled(FEnabled: Boolean);
begin
  ControlCornerButton.Enabled := FEnabled;
end;

procedure TFCornerButton.Visible(FVisible: Boolean);
begin
  ControlCornerButton.Visible := FVisible;
end;

procedure TFCornerButton.HitTest(FEnabled: Boolean);
begin
  ControlCornerButton.HitTest := FEnabled;
end;

procedure TFCornerButton.StyleLookUp(FStyle: WideString);
begin
  ControlCornerButton.StyleLookUp := string(FStyle);
end;

procedure TFCornerButton.ModalResult(FModalResult: TModalResult);
begin
  ControlCornerButton.ModalResult := TModalResult(FModalResult);
end;

function TFCornerButton.GetModalResult: TModalResult;
begin
  Result := ControlCornerButton.ModalResult;
end;

function TFCornerButton.IsPressed: Boolean;
begin
  Result := ControlCornerButton.IsPressed;
end;

function TFCornerButton.IsVisible: Boolean;
begin
  Result := ControlCornerButton.Visible;
end;

function TFCornerButton.GetText: WideString;
begin
  Result := ControlCornerButton.Text
end;

function TFCornerButton.GetTag: Integer;
begin
  Result := ControlCornerButton.Tag;
end;

function TFCornerButton.GetLeft: Single;
begin
  Result := ControlCornerButton.Position.X;
end;

function TFCornerButton.GetTop: Single;
begin
  Result := ControlCornerButton.Position.Y;
end;

function TFCornerButton.GetHeight: Single;
begin
  Result := ControlCornerButton.Size.Height;
end;

function TFCornerButton.GetWidth: Single;
begin
  Result := ControlCornerButton.Size.Width;
end;

function TFCornerButton.GetObject: TFmxObject;
begin
  Result := ControlCornerButton;
end;

procedure TFCornerButton.OnClick(Event: TNotifyEvent);
begin
  ControlCornerButton.OnClick := TNotifyEvent(Event);
end;

procedure TFCornerButton.OnMouseDown(Event: TMouseEvent);
begin
  ControlCornerButton.OnMouseDown := TMouseEvent(Event);
end;

procedure TFCornerButton.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlCornerButton.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFCornerButton.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlCornerButton.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFCornerButton.OnMouseUp(Event: TMouseEvent);
begin
  ControlCornerButton.OnMouseUp := TMouseEvent(Event);
end;

function TFCornerButton.Handle: TFmxObject;
begin
  Result := ControlCornerButton;
end;

// =============================================================================
// FArcDial
// =============================================================================
procedure TFArcDial.FCreate(FParent: TFmxObject);
begin
  ControlArcDial := TArcDial.Create(nil);
  ControlArcDial.Parent := FParent;
end;

procedure TFArcDial.Cursor(FCursor: TCursor);
begin
  ControlArcDial.Cursor := TCursor(FCursor);
end;

procedure TFArcDial.Left(FLeft: Single);
begin
  ControlArcDial.Position.X := FLeft;
end;

procedure TFArcDial.Top(FTop: Single);
begin
  ControlArcDial.Position.Y := FTop;
end;

procedure TFArcDial.Height(FHeight: Single);
begin
  ControlArcDial.Size.Height := FHeight;
end;

procedure TFArcDial.Width(FWidth: Single);
begin
  ControlArcDial.Size.Width := FWidth;
end;

procedure TFArcDial.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlArcDial.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFArcDial.Position(X, Y: Single);
begin
  ControlArcDial.Position.X := X;
  ControlArcDial.Position.Y := Y;
end;

procedure TFArcDial.Align(Al: TAlignLayout);
begin
  ControlArcDial.Align := TAlignLayout(Al);
end;

procedure TFArcDial.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlArcDial.Margins.Left := FLeft;
  ControlArcDial.Margins.Top := FTop;
  ControlArcDial.Margins.Right := FRight;
  ControlArcDial.Margins.Bottom := FBottom;
end;

procedure TFArcDial.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlArcDial.Padding.Left := FLeft;
  ControlArcDial.Padding.Top := FTop;
  ControlArcDial.Padding.Right := FRight;
  ControlArcDial.Padding.Bottom := FBottom;
end;

procedure TFArcDial.SetHint(const FText: WideString);
begin
  ControlArcDial.ShowHint := True;
  ControlArcDial.Hint := string(FText);
end;

procedure TFArcDial.SetClipChildren(FValue: Boolean);
begin
  ControlArcDial.ClipChildren := FValue;
end;

procedure TFArcDial.SetClipParent(FValue: Boolean);
begin
  ControlArcDial.ClipParent := FValue;
end;

procedure TFArcDial.BringToFront;
begin
  ControlArcDial.BringToFront;
end;

procedure TFArcDial.SendToBack;
begin
  ControlArcDial.SendToBack;
end;

procedure TFArcDial.SetTag(FTag: Integer);
begin
  ControlArcDial.Tag := FTag;
end;

procedure TFArcDial.Value(FValue: Single);
begin
  ControlArcDial.Value := FValue;
end;

procedure TFArcDial.ShowValue(FValue: Boolean);
begin
  ControlArcDial.ShowValue := FValue;
end;

procedure TFArcDial.Frequency(FValue: Double);
begin
  ControlArcDial.Frequency := FValue;
end;

procedure TFArcDial.Tracking(FValue: Boolean);
begin
  ControlArcDial.Tracking := FValue;
end;

procedure TFArcDial.Opacity(FOpacity: Single);
begin
  ControlArcDial.Opacity := FOpacity;
end;

procedure TFArcDial.RotationAngle(FValue: Single);
begin
  ControlArcDial.RotationAngle := FValue;
end;

procedure TFArcDial.RotationCenter(X, Y: Single);
begin
  ControlArcDial.RotationCenter.X := X;
  ControlArcDial.RotationCenter.Y := Y;
end;

procedure TFArcDial.Enabled(FEnabled: Boolean);
begin
  ControlArcDial.Enabled := FEnabled;
end;

procedure TFArcDial.Visible(FVisible: Boolean);
begin
  ControlArcDial.Visible := FVisible;
end;

procedure TFArcDial.HitTest(FEnabled: Boolean);
begin
  ControlArcDial.HitTest := FEnabled;
end;

procedure TFArcDial.StyleLookUp(FStyle: WideString);
begin
  ControlArcDial.StyleLookUp := string(FStyle);
end;

function TFArcDial.IsVisible: Boolean;
begin
  Result := ControlArcDial.Visible;
end;

function TFArcDial.GetValue: Single;
begin
  Result := ControlArcDial.Value;
end;

function TFArcDial.GetFrequency: Double;
begin
  Result := ControlArcDial.Frequency;
end;

function TFArcDial.GetTag: Integer;
begin
  Result := ControlArcDial.Tag;
end;

function TFArcDial.GetLeft: Single;
begin
  Result := ControlArcDial.Position.X;
end;

function TFArcDial.GetTop: Single;
begin
  Result := ControlArcDial.Position.Y;
end;

function TFArcDial.GetHeight: Single;
begin
  Result := ControlArcDial.Size.Height;
end;

function TFArcDial.GetWidth: Single;
begin
  Result := ControlArcDial.Size.Width;
end;

function TFArcDial.GetObject: TFmxObject;
begin
  Result := ControlArcDial;
end;

procedure TFArcDial.OnChange(Event: TNotifyEvent);
begin
  ControlArcDial.OnChange := TNotifyEvent(Event);
end;

procedure TFArcDial.OnClick(Event: TNotifyEvent);
begin
  ControlArcDial.OnClick := TNotifyEvent(Event);
end;

procedure TFArcDial.OnMouseDown(Event: TMouseEvent);
begin
  ControlArcDial.OnMouseDown := TMouseEvent(Event);
end;

procedure TFArcDial.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlArcDial.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFArcDial.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlArcDial.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFArcDial.OnMouseUp(Event: TMouseEvent);
begin
  ControlArcDial.OnMouseUp := TMouseEvent(Event);
end;

procedure TFArcDial.OnMouseWheel(Event: TMouseWheelEvent);
begin
  ControlArcDial.OnMouseWheel := TMouseWheelEvent(Event);
end;

function TFArcDial.Handle: TFmxObject;
begin
  Result := ControlArcDial;
end;

// =============================================================================
// FAniIndicator
// =============================================================================
procedure TFAniIndicator.FCreate(FParent: TFmxObject);
begin
  ControlAniIndicator := TAniIndicator.Create(nil);
  ControlAniIndicator.Parent := FParent;
  ControlAniIndicator.Enabled := True;
end;

procedure TFAniIndicator.Cursor(FCursor: TCursor);
begin
  ControlAniIndicator.Cursor := TCursor(FCursor);
end;

procedure TFAniIndicator.Left(FLeft: Single);
begin
  ControlAniIndicator.Position.X := FLeft;
end;

procedure TFAniIndicator.Top(FTop: Single);
begin
  ControlAniIndicator.Position.Y := FTop;
end;

procedure TFAniIndicator.Height(FHeight: Single);
begin
  ControlAniIndicator.Size.Height := FHeight;
end;

procedure TFAniIndicator.Width(FWidth: Single);
begin
  ControlAniIndicator.Size.Width := FWidth;
end;

procedure TFAniIndicator.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlAniIndicator.Position.X := FLeft;
  ControlAniIndicator.Position.Y := FTop;
  ControlAniIndicator.Size.Width := FWidth;
  ControlAniIndicator.Size.Height := FHeight;
end;

procedure TFAniIndicator.Position(X, Y: Single);
begin
  ControlAniIndicator.Position.X := X;
  ControlAniIndicator.Position.Y := Y;
end;

procedure TFAniIndicator.Align(Al: TAlignLayout);
begin
  ControlAniIndicator.Align := TAlignLayout(Al);
end;

procedure TFAniIndicator.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlAniIndicator.Margins.Left := FLeft;
  ControlAniIndicator.Margins.Top := FTop;
  ControlAniIndicator.Margins.Right := FRight;
  ControlAniIndicator.Margins.Bottom := FBottom;
end;

procedure TFAniIndicator.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlAniIndicator.Padding.Left := FLeft;
  ControlAniIndicator.Padding.Top := FTop;
  ControlAniIndicator.Padding.Right := FRight;
  ControlAniIndicator.Padding.Bottom := FBottom;
end;

procedure TFAniIndicator.SetHint(const FText: WideString);
begin
  ControlAniIndicator.ShowHint := True;
  ControlAniIndicator.Hint := string(FText);
end;

procedure TFAniIndicator.SetClipParent(FValue: Boolean);
begin
  ControlAniIndicator.ClipParent := FValue;
end;

procedure TFAniIndicator.SetClipChildren(FValue: Boolean);
begin
  ControlAniIndicator.ClipChildren := FValue;
end;

procedure TFAniIndicator.BringToFront;
begin
  ControlAniIndicator.BringToFront;
end;

procedure TFAniIndicator.SendToBack;
begin
  ControlAniIndicator.SendToBack;
end;

procedure TFAniIndicator.SetTag(FTag: Integer);
begin
  ControlAniIndicator.Tag := FTag;
end;

procedure TFAniIndicator.Opacity(FOpacity: Single);
begin
  ControlAniIndicator.Opacity := FOpacity;
end;

procedure TFAniIndicator.Style(FStyle: TAniIndicatorStyle);
begin
  ControlAniIndicator.Style := TAniIndicatorStyle(FStyle);
end;

procedure TFAniIndicator.RotationAngle(FValue: Single);
begin
  ControlAniIndicator.RotationAngle := FValue;
end;

procedure TFAniIndicator.RotationCenter(X, Y: Single);
begin
  ControlAniIndicator.RotationCenter.X := X;
  ControlAniIndicator.RotationCenter.Y := Y;
end;

procedure TFAniIndicator.Enabled(FEnabled: Boolean);
begin
  ControlAniIndicator.Enabled := FEnabled;
end;

procedure TFAniIndicator.Visible(FVisible: Boolean);
begin
  ControlAniIndicator.Visible := FVisible;
end;

procedure TFAniIndicator.HitTest(FEnabled: Boolean);
begin
  ControlAniIndicator.HitTest := FEnabled;
end;

procedure TFAniIndicator.StyleLookUp(FStyle: WideString);
begin
  ControlAniIndicator.StyleLookUp := string(FStyle);
end;

function TFAniIndicator.IsVisible: Boolean;
begin
  Result := ControlAniIndicator.Visible;
end;

function TFAniIndicator.GetTag: Integer;
begin
  Result := ControlAniIndicator.Tag;
end;

function TFAniIndicator.GetLeft: Single;
begin
  Result := ControlAniIndicator.Position.X;
end;

function TFAniIndicator.GetTop: Single;
begin
  Result := ControlAniIndicator.Position.Y;
end;

function TFAniIndicator.GetHeight: Single;
begin
  Result := ControlAniIndicator.Size.Height;
end;

function TFAniIndicator.GetWidth: Single;
begin
  Result := ControlAniIndicator.Size.Width;
end;

function TFAniIndicator.GetObject: TFmxObject;
begin
  Result := ControlAniIndicator;
end;

procedure TFAniIndicator.OnClick(Event: TNotifyEvent);
begin
  ControlAniIndicator.OnClick := TNotifyEvent(Event);
end;

procedure TFAniIndicator.OnMouseDown(Event: TMouseEvent);
begin
  ControlAniIndicator.OnMouseDown := TMouseEvent(Event);
end;

procedure TFAniIndicator.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlAniIndicator.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFAniIndicator.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlAniIndicator.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFAniIndicator.OnMouseUp(Event: TMouseEvent);
begin
  ControlAniIndicator.OnMouseUp := TMouseEvent(Event);
end;

function TFAniIndicator.Handle: TFmxObject;
begin
  Result := ControlAniIndicator;
end;

// =============================================================================
// FDropTarget
// =============================================================================
procedure TFDropTarget.FCreate(FParent: TFmxObject);
begin
  ControlDropTarget := TDropTarget.Create(nil);
  ControlDropTarget.Parent := FParent;
  ControlDropTarget.OnDropped := DropTargetDropped;
end;

procedure TFDropTarget.DropTargetDropped(Sender: TObject;
  const Data: TDragObject; const Point: TPointF);
var
  i: Integer;
begin
  for i := 0 to High(Data.Files) do
    NotifyFileDrop(Sender, Data.Files[i]);
end;

procedure TFDropTarget.Cursor(FCursor: TCursor);
begin
  ControlDropTarget.Cursor := TCursor(FCursor);
end;

procedure TFDropTarget.Left(FLeft: Single);
begin
  ControlDropTarget.Position.X := FLeft;
end;

procedure TFDropTarget.Top(FTop: Single);
begin
  ControlDropTarget.Position.Y := FTop;
end;

procedure TFDropTarget.Height(FHeight: Single);
begin
  ControlDropTarget.Size.Height := FHeight;
end;

procedure TFDropTarget.Width(FWidth: Single);
begin
  ControlDropTarget.Size.Width := FWidth;
end;

procedure TFDropTarget.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlDropTarget.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFDropTarget.Position(X, Y: Single);
begin
  ControlDropTarget.Position.X := X;
  ControlDropTarget.Position.Y := Y;
end;

procedure TFDropTarget.Align(Al: TAlignLayout);
begin
  ControlDropTarget.Align := TAlignLayout(Al);
end;

procedure TFDropTarget.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlDropTarget.Margins.Left := FLeft;
  ControlDropTarget.Margins.Top := FTop;
  ControlDropTarget.Margins.Right := FRight;
  ControlDropTarget.Margins.Bottom := FBottom;
end;

procedure TFDropTarget.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlDropTarget.Padding.Left := FLeft;
  ControlDropTarget.Padding.Top := FTop;
  ControlDropTarget.Padding.Right := FRight;
  ControlDropTarget.Padding.Bottom := FBottom;
end;

procedure TFDropTarget.SetHint(const FText: WideString);
begin
  ControlDropTarget.ShowHint := True;
  ControlDropTarget.Hint := string(FText);
end;

procedure TFDropTarget.SetClipChildren(FValue: Boolean);
begin
  ControlDropTarget.ClipChildren := FValue;
end;

procedure TFDropTarget.SetClipParent(FValue: Boolean);
begin
  ControlDropTarget.ClipParent := FValue;
end;

procedure TFDropTarget.BringToFront;
begin
  ControlDropTarget.BringToFront;
end;

procedure TFDropTarget.SendToBack;
begin
  ControlDropTarget.SendToBack;
end;

procedure TFDropTarget.SetTag(FTag: Integer);
begin
  ControlDropTarget.Tag := FTag;
end;

procedure TFDropTarget.Filter(const FFilter: WideString);
begin
  ControlDropTarget.Filter := string(FFilter);
end;

procedure TFDropTarget.FilterIndex(FIndex: Integer);
begin
  ControlDropTarget.FilterIndex := FIndex;
end;

procedure TFDropTarget.Text(const FText: WideString);
begin
  ControlDropTarget.Text := string(FText);
end;

procedure TFDropTarget.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlDropTarget.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFDropTarget.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlDropTarget.StyledSettings := [];

  ControlDropTarget.TextSettings.Font.Family := string(FontName);
  ControlDropTarget.TextSettings.Font.Size := FontSize;
  ControlDropTarget.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFDropTarget.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlDropTarget.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlDropTarget.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlDropTarget.TextSettings.WordWrap := FWordWrap;
end;

procedure TFDropTarget.Opacity(FOpacity: Single);
begin
  ControlDropTarget.Opacity := FOpacity;
end;

procedure TFDropTarget.RotationAngle(FValue: Single);
begin
  ControlDropTarget.RotationAngle := FValue;
end;

procedure TFDropTarget.RotationCenter(X, Y: Single);
begin
  ControlDropTarget.RotationCenter.X := X;
  ControlDropTarget.RotationCenter.Y := Y;
end;

procedure TFDropTarget.Enabled(FEnabled: Boolean);
begin
  ControlDropTarget.Enabled := FEnabled;
end;

procedure TFDropTarget.Visible(FVisible: Boolean);
begin
  ControlDropTarget.Visible := FVisible;
end;

procedure TFDropTarget.HitTest(FEnabled: Boolean);
begin
  ControlDropTarget.HitTest := FEnabled;
end;

procedure TFDropTarget.StyleLookUp(FStyle: WideString);
begin
  ControlDropTarget.StyleLookUp := string(FStyle);
end;

function TFDropTarget.IsVisible: Boolean;
begin
  Result := ControlDropTarget.Visible;
end;

function TFDropTarget.GetText: WideString;
begin
  Result := ControlDropTarget.Text
end;

function TFDropTarget.GetTag: Integer;
begin
  Result := ControlDropTarget.Tag;
end;

function TFDropTarget.GetLeft: Single;
begin
  Result := ControlDropTarget.Position.X;
end;

function TFDropTarget.GetTop: Single;
begin
  Result := ControlDropTarget.Position.Y;
end;

function TFDropTarget.GetHeight: Single;
begin
  Result := ControlDropTarget.Size.Height;
end;

function TFDropTarget.GetWidth: Single;
begin
  Result := ControlDropTarget.Size.Width;
end;

function TFDropTarget.GetObject: TFmxObject;
begin
  Result := ControlDropTarget;
end;

procedure TFDropTarget.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlDropTarget.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFDropTarget.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlDropTarget.OnMouseLeave := TNotifyEvent(Event);
end;

function TFDropTarget.Handle: TFmxObject;
begin
  Result := ControlDropTarget;
end;

// =============================================================================
// FImageViewer
// =============================================================================
procedure TFImageViewer.FCreate(FParent: TFmxObject);
begin
  ControlImageViewer := TImageViewer.Create(nil);
  ControlImageViewer.Parent := FParent;
end;

procedure TFImageViewer.Cursor(FCursor: TCursor);
begin
  ControlImageViewer.Cursor := TCursor(FCursor);
end;

procedure TFImageViewer.Left(FLeft: Single);
begin
  ControlImageViewer.Position.X := FLeft;
end;

procedure TFImageViewer.Top(FTop: Single);
begin
  ControlImageViewer.Position.Y := FTop;
end;

procedure TFImageViewer.Height(FHeight: Single);
begin
  ControlImageViewer.Size.Height := FHeight;
end;

procedure TFImageViewer.Width(FWidth: Single);
begin
  ControlImageViewer.Size.Width := FWidth;
end;

procedure TFImageViewer.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlImageViewer.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFImageViewer.Position(X, Y: Single);
begin
  ControlImageViewer.Position.X := X;
  ControlImageViewer.Position.Y := Y;
end;

procedure TFImageViewer.Align(Al: TAlignLayout);
begin
  ControlImageViewer.Align := TAlignLayout(Al);
end;

procedure TFImageViewer.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageViewer.Margins.Left := FLeft;
  ControlImageViewer.Margins.Top := FTop;
  ControlImageViewer.Margins.Right := FRight;
  ControlImageViewer.Margins.Bottom := FBottom;
end;

procedure TFImageViewer.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageViewer.Padding.Left := FLeft;
  ControlImageViewer.Padding.Top := FTop;
  ControlImageViewer.Padding.Right := FRight;
  ControlImageViewer.Padding.Bottom := FBottom;
end;

procedure TFImageViewer.SetHint(const FText: WideString);
begin
  ControlImageViewer.ShowHint := True;
  ControlImageViewer.Hint := string(FText);
end;

procedure TFImageViewer.SetClipChildren(FValue: Boolean);
begin
  ControlImageViewer.ClipChildren := FValue;
end;

procedure TFImageViewer.SetClipParent(FValue: Boolean);
begin
  ControlImageViewer.ClipParent := FValue;
end;

procedure TFImageViewer.BringToFront;
begin
  ControlImageViewer.BringToFront;
end;

procedure TFImageViewer.SendToBack;
begin
  ControlImageViewer.SendToBack;
end;

procedure TFImageViewer.SetTag(FTag: Integer);
begin
  ControlImageViewer.Tag := FTag;
end;

procedure TFImageViewer.BackgroundFillColor(FColor: TAlphaColor);
begin
  ControlImageViewer.BackgroundFill.Kind := TBrushKind.Solid;
  ControlImageViewer.BackgroundFill.Color := TAlphaColor(FColor);
end;

procedure TFImageViewer.BackgroundFillPicture(const FImage: WideString;
  WrapMode: TWrapMode);
begin
  ControlImageViewer.BackgroundFill.Kind := TBrushKind.Bitmap;
  ControlImageViewer.BackgroundFill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlImageViewer.BackgroundFill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFImageViewer.BackgroundFillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlImageViewer.BackgroundFill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlImageViewer.BackgroundFill,
    TAlphaColor(FColor1), TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFImageViewer.BackgroundFillGradientLinearAngle(FAngle: Single);
begin
  ControlImageViewer.BackgroundFill.Kind := TBrushKind.Gradient;
  ControlImageViewer.BackgroundFill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlImageViewer.BackgroundFill, FAngle);
end;

procedure TFImageViewer.BackgroundFillGradientRadialAngle(FAngle: Single);
begin
  ControlImageViewer.BackgroundFill.Kind := TBrushKind.Gradient;
  ControlImageViewer.BackgroundFill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlImageViewer.BackgroundFill, FAngle);
end;

procedure TFImageViewer.BackgroundFillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlImageViewer.BackgroundFill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlImageViewer.BackgroundFill, X1,
    Y1, X2, Y2);
end;

procedure TFImageViewer.LoadPicture(const FImage: WideString);
begin
  ControlImageViewer.Bitmap.LoadFromfile(string(FImage));
end;

procedure TFImageViewer.BitmapScale(FScale: Single);
begin
  ControlImageViewer.BitmapScale := FScale;
end;

procedure TFImageViewer.AutoHide(FValue: Boolean);
begin
  ControlImageViewer.AutoHide := FValue;
end;

procedure TFImageViewer.DisableMouseWheel(FValue: Boolean);
begin
  ControlImageViewer.DisableMouseWheel := FValue;
end;

procedure TFImageViewer.MouseScaling(FValue: Boolean);
begin
  ControlImageViewer.MouseScaling := FValue;
end;

procedure TFImageViewer.ShowBackground(FValue: Boolean);
begin
  ControlImageViewer.ShowBackground := FValue;
end;

procedure TFImageViewer.ShowScrollBars(FValue: Boolean);
begin
  ControlImageViewer.ShowScrollBars := FValue;
end;

procedure TFImageViewer.ShowSizeGrip(FValue: Boolean);
begin
  ControlImageViewer.ShowSizeGrip := FValue;
end;

procedure TFImageViewer.Bounces(FValue: Boolean);
begin
  if FValue then
    ControlImageViewer.Bounces := TBehaviorBoolean.True
  else
    ControlImageViewer.Bounces := TBehaviorBoolean.False;
end;

procedure TFImageViewer.ScrollAnimation(FValue: Boolean);
begin
  if FValue then
    ControlImageViewer.ScrollAnimation := TBehaviorBoolean.True
  else
    ControlImageViewer.ScrollAnimation := TBehaviorBoolean.False;
end;

procedure TFImageViewer.TouchTracking(FValue: Boolean);
begin
  if FValue then
    ControlImageViewer.TouchTracking := TBehaviorBoolean.True
  else
    ControlImageViewer.TouchTracking := TBehaviorBoolean.False;
end;

procedure TFImageViewer.Opacity(FOpacity: Single);
begin
  ControlImageViewer.Opacity := FOpacity;
end;

procedure TFImageViewer.RotationAngle(FValue: Single);
begin
  ControlImageViewer.RotationAngle := FValue;
end;

procedure TFImageViewer.RotationCenter(X, Y: Single);
begin
  ControlImageViewer.RotationCenter.X := X;
  ControlImageViewer.RotationCenter.Y := Y;
end;

procedure TFImageViewer.Enabled(FEnabled: Boolean);
begin
  ControlImageViewer.Enabled := FEnabled;
end;

procedure TFImageViewer.Visible(FVisible: Boolean);
begin
  ControlImageViewer.Visible := FVisible;
end;

procedure TFImageViewer.HitTest(FEnabled: Boolean);
begin
  ControlImageViewer.HitTest := FEnabled;
end;

function TFImageViewer.IsVisible: Boolean;
begin
  Result := ControlImageViewer.Visible;
end;

function TFImageViewer.GetTag: Integer;
begin
  Result := ControlImageViewer.Tag;
end;

function TFImageViewer.GetLeft: Single;
begin
  Result := ControlImageViewer.Position.X;
end;

function TFImageViewer.GetTop: Single;
begin
  Result := ControlImageViewer.Position.Y;
end;

function TFImageViewer.GetHeight: Single;
begin
  Result := ControlImageViewer.Size.Height;
end;

function TFImageViewer.GetWidth: Single;
begin
  Result := ControlImageViewer.Size.Width;
end;

function TFImageViewer.GetObject: TFmxObject;
begin
  Result := ControlImageViewer;
end;

procedure TFImageViewer.OnClick(Event: TNotifyEvent);
begin
  ControlImageViewer.OnClick := TNotifyEvent(Event);
end;

procedure TFImageViewer.OnMouseDown(Event: TMouseEvent);
begin
  ControlImageViewer.OnMouseDown := TMouseEvent(Event);
end;

procedure TFImageViewer.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlImageViewer.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFImageViewer.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlImageViewer.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFImageViewer.OnMouseUp(Event: TMouseEvent);
begin
  ControlImageViewer.OnMouseUp := TMouseEvent(Event);
end;

function TFImageViewer.Handle: TFmxObject;
begin
  Result := ControlImageViewer;
end;

// =============================================================================
// FNumberBox
// =============================================================================
procedure TFNumberBox.FCreate(FParent: TFmxObject);
begin
  ControlNumberBox := TNumberBox.Create(nil);
  ControlNumberBox.Parent := FParent;
end;

procedure TFNumberBox.Cursor(FCursor: TCursor);
begin
  ControlNumberBox.Cursor := TCursor(FCursor);
end;

procedure TFNumberBox.Left(FLeft: Single);
begin
  ControlNumberBox.Position.X := FLeft;
end;

procedure TFNumberBox.Top(FTop: Single);
begin
  ControlNumberBox.Position.Y := FTop;
end;

procedure TFNumberBox.Height(FHeight: Single);
begin
  ControlNumberBox.Size.Height := FHeight;
end;

procedure TFNumberBox.Width(FWidth: Single);
begin
  ControlNumberBox.Size.Width := FWidth;
end;

procedure TFNumberBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlNumberBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFNumberBox.Position(X, Y: Single);
begin
  ControlNumberBox.Position.X := X;
  ControlNumberBox.Position.Y := Y;
end;

procedure TFNumberBox.Align(Al: TAlignLayout);
begin
  ControlNumberBox.Align := TAlignLayout(Al);
end;

procedure TFNumberBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlNumberBox.Margins.Left := FLeft;
  ControlNumberBox.Margins.Top := FTop;
  ControlNumberBox.Margins.Right := FRight;
  ControlNumberBox.Margins.Bottom := FBottom;
end;

procedure TFNumberBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlNumberBox.Padding.Left := FLeft;
  ControlNumberBox.Padding.Top := FTop;
  ControlNumberBox.Padding.Right := FRight;
  ControlNumberBox.Padding.Bottom := FBottom;
end;

procedure TFNumberBox.SetHint(const FText: WideString);
begin
  ControlNumberBox.ShowHint := True;
  ControlNumberBox.Hint := string(FText);
end;

procedure TFNumberBox.SetClipChildren(FValue: Boolean);
begin
  ControlNumberBox.ClipChildren := FValue;
end;

procedure TFNumberBox.SetClipParent(FValue: Boolean);
begin
  ControlNumberBox.ClipParent := FValue;
end;

procedure TFNumberBox.BringToFront;
begin
  ControlNumberBox.BringToFront;
end;

procedure TFNumberBox.SendToBack;
begin
  ControlNumberBox.SendToBack;
end;

procedure TFNumberBox.SetTag(FTag: Integer);
begin
  ControlNumberBox.Tag := FTag;
end;

procedure TFNumberBox.DecimalDigits(FDigits: Integer);
begin
  ControlNumberBox.DecimalDigits := FDigits;
end;

procedure TFNumberBox.HorzIncrement(FValue: Single);
begin
  ControlNumberBox.HorzIncrement := FValue;
end;

procedure TFNumberBox.VertIncrement(FValue: Single);
begin
  ControlNumberBox.VertIncrement := FValue;
end;

procedure TFNumberBox.VerticalMode(FEnabled: Boolean);
begin
  ControlNumberBox.VertIncrementEnabled := FEnabled;
end;

procedure TFNumberBox.Max(FMax: Single);
begin
  ControlNumberBox.Max := FMax;
end;

procedure TFNumberBox.Min(FMin: Single);
begin
  ControlNumberBox.Min := FMin;
end;

procedure TFNumberBox.Value(FValue: Single);
begin
  ControlNumberBox.Value := FValue;
end;

procedure TFNumberBox.ValueType(FFloat: Boolean);
begin
  if FFloat then
    ControlNumberBox.ValueType := TNumValueType.Float
  else
    ControlNumberBox.ValueType := TNumValueType.Integer;
end;

procedure TFNumberBox.ReadOnly(FValue: Boolean);
begin
  ControlNumberBox.ReadOnly := FValue;
end;

procedure TFNumberBox.Text(const FText: WideString);
begin
  ControlNumberBox.Text := string(FText);
end;

procedure TFNumberBox.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlNumberBox.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFNumberBox.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlNumberBox.StyledSettings := [];

  ControlNumberBox.TextSettings.Font.Family := string(FontName);
  ControlNumberBox.TextSettings.Font.Size := FontSize;
  ControlNumberBox.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFNumberBox.TextSetting(FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlNumberBox.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlNumberBox.TextSettings.VertAlign := TTextAlign(FVertAlign);
end;

procedure TFNumberBox.Caret(FColor: TAlphaColor; FInterval: Integer;
  FWidth: Word);
begin
  ControlNumberBox.Caret.Color := TAlphaColor(FColor);
  ControlNumberBox.Caret.Interval := FInterval;
  ControlNumberBox.Caret.Width := FWidth;
end;

procedure TFNumberBox.Opacity(FOpacity: Single);
begin
  ControlNumberBox.Opacity := FOpacity;
end;

procedure TFNumberBox.RotationAngle(FValue: Single);
begin
  ControlNumberBox.RotationAngle := FValue;
end;

procedure TFNumberBox.RotationCenter(X, Y: Single);
begin
  ControlNumberBox.RotationCenter.X := X;
  ControlNumberBox.RotationCenter.Y := Y;
end;

procedure TFNumberBox.Enabled(FEnabled: Boolean);
begin
  ControlNumberBox.Enabled := FEnabled;
end;

procedure TFNumberBox.Visible(FVisible: Boolean);
begin
  ControlNumberBox.Visible := FVisible;
end;

procedure TFNumberBox.HitTest(FEnabled: Boolean);
begin
  ControlNumberBox.HitTest := FEnabled;
end;

procedure TFNumberBox.StyleLookUp(FStyle: WideString);
begin
  ControlNumberBox.StyleLookUp := string(FStyle);
end;

function TFNumberBox.IsVisible: Boolean;
begin
  Result := ControlNumberBox.Visible;
end;

function TFNumberBox.GetHorzIncrement: Single;
begin
  Result := ControlNumberBox.HorzIncrement;
end;

function TFNumberBox.GetVertIncrement: Single;
begin
  Result := ControlNumberBox.VertIncrement;
end;

function TFNumberBox.IsVerticalMode: Boolean;
begin
  Result := ControlNumberBox.VertIncrementEnabled;
end;

function TFNumberBox.GetValue: Single;
begin
  Result := ControlNumberBox.Value;
end;

function TFNumberBox.GetTag: Integer;
begin
  Result := ControlNumberBox.Tag;
end;

function TFNumberBox.GetLeft: Single;
begin
  Result := ControlNumberBox.Position.X;
end;

function TFNumberBox.GetTop: Single;
begin
  Result := ControlNumberBox.Position.Y;
end;

function TFNumberBox.GetHeight: Single;
begin
  Result := ControlNumberBox.Size.Height;
end;

function TFNumberBox.GetWidth: Single;
begin
  Result := ControlNumberBox.Size.Width;
end;

function TFNumberBox.GetObject: TFmxObject;
begin
  Result := ControlNumberBox;
end;

procedure TFNumberBox.OnChange(Event: TNotifyEvent);
begin
  ControlNumberBox.OnChange := TNotifyEvent(Event);
end;

procedure TFNumberBox.OnChangeTracking(Event: TNotifyEvent);
begin
  ControlNumberBox.OnChangeTracking := TNotifyEvent(Event);
end;

procedure TFNumberBox.OnClick(Event: TNotifyEvent);
begin
  ControlNumberBox.OnClick := TNotifyEvent(Event);
end;

procedure TFNumberBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlNumberBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFNumberBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlNumberBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFNumberBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlNumberBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFNumberBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlNumberBox.OnMouseUp := TMouseEvent(Event);
end;

function TFNumberBox.Handle: TFmxObject;
begin
  Result := ControlNumberBox;
end;

// =============================================================================
// FSpinBox
// =============================================================================
procedure TFSpinBox.FCreate(FParent: TFmxObject);
begin
  ControlSpinBox := TSpinBox.Create(nil);
  ControlSpinBox.Parent := FParent;
end;

procedure TFSpinBox.Cursor(FCursor: TCursor);
begin
  ControlSpinBox.Cursor := TCursor(FCursor);
end;

procedure TFSpinBox.Left(FLeft: Single);
begin
  ControlSpinBox.Position.X := FLeft;
end;

procedure TFSpinBox.Top(FTop: Single);
begin
  ControlSpinBox.Position.Y := FTop;
end;

procedure TFSpinBox.Height(FHeight: Single);
begin
  ControlSpinBox.Size.Height := FHeight;
end;

procedure TFSpinBox.Width(FWidth: Single);
begin
  ControlSpinBox.Size.Width := FWidth;
end;

procedure TFSpinBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlSpinBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSpinBox.Position(X, Y: Single);
begin
  ControlSpinBox.Position.X := X;
  ControlSpinBox.Position.Y := Y;
end;

procedure TFSpinBox.Align(Al: TAlignLayout);
begin
  ControlSpinBox.Align := TAlignLayout(Al);
end;

procedure TFSpinBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSpinBox.Margins.Left := FLeft;
  ControlSpinBox.Margins.Top := FTop;
  ControlSpinBox.Margins.Right := FRight;
  ControlSpinBox.Margins.Bottom := FBottom;
end;

procedure TFSpinBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSpinBox.Padding.Left := FLeft;
  ControlSpinBox.Padding.Top := FTop;
  ControlSpinBox.Padding.Right := FRight;
  ControlSpinBox.Padding.Bottom := FBottom;
end;

procedure TFSpinBox.SetHint(const FText: WideString);
begin
  ControlSpinBox.ShowHint := True;
  ControlSpinBox.Hint := string(FText);
end;

procedure TFSpinBox.SetClipChildren(FValue: Boolean);
begin
  ControlSpinBox.ClipChildren := FValue;
end;

procedure TFSpinBox.SetClipParent(FValue: Boolean);
begin
  ControlSpinBox.ClipParent := FValue;
end;

procedure TFSpinBox.BringToFront;
begin
  ControlSpinBox.BringToFront;
end;

procedure TFSpinBox.SendToBack;
begin
  ControlSpinBox.SendToBack;
end;

procedure TFSpinBox.SetTag(FTag: Integer);
begin
  ControlSpinBox.Tag := FTag;
end;

procedure TFSpinBox.DecimalDigits(FDigits: Integer);
begin
  ControlSpinBox.DecimalDigits := FDigits;
end;

procedure TFSpinBox.Increment(FValue: Single);
begin
  ControlSpinBox.Increment := FValue;
end;

procedure TFSpinBox.Max(FMax: Single);
begin
  ControlSpinBox.Max := FMax;
end;

procedure TFSpinBox.Min(FMin: Single);
begin
  ControlSpinBox.Min := FMin;
end;

procedure TFSpinBox.Value(FValue: Single);
begin
  ControlSpinBox.Value := FValue;
end;

procedure TFSpinBox.ValueType(FFloat: Boolean);
begin
  if FFloat then
    ControlSpinBox.ValueType := TNumValueType.Float
  else
    ControlSpinBox.ValueType := TNumValueType.Integer;
end;

procedure TFSpinBox.ReadOnly(FValue: Boolean);
begin
  ControlSpinBox.ReadOnly := FValue;
end;

procedure TFSpinBox.Text(const FText: WideString);
begin
  ControlSpinBox.Text := string(FText);
end;

procedure TFSpinBox.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlSpinBox.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFSpinBox.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlSpinBox.StyledSettings := [];

  ControlSpinBox.TextSettings.Font.Family := string(FontName);
  ControlSpinBox.TextSettings.Font.Size := FontSize;
  ControlSpinBox.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFSpinBox.TextSetting(FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlSpinBox.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlSpinBox.TextSettings.VertAlign := TTextAlign(FVertAlign);
end;

procedure TFSpinBox.Caret(FColor: TAlphaColor; FInterval: Integer; FWidth: Word);
begin
  ControlSpinBox.Caret.Color := TAlphaColor(FColor);
  ControlSpinBox.Caret.Interval := FInterval;
  ControlSpinBox.Caret.Width := FWidth;
end;

procedure TFSpinBox.StepUp;
var
  V: Single;
begin
  V := ControlSpinBox.Value + ControlSpinBox.Increment;

  if V > ControlSpinBox.Max then
    V := ControlSpinBox.Max;

  if ControlSpinBox.ValueType = TNumValueType.Integer then
    V := Trunc(V);

  ControlSpinBox.Value := V;
end;

procedure TFSpinBox.StepDown;
var
  V: Single;
begin
  V := ControlSpinBox.Value - ControlSpinBox.Increment;

  if V < ControlSpinBox.Min then
    V := ControlSpinBox.Min;

  if ControlSpinBox.ValueType = TNumValueType.Integer then
    V := Trunc(V);

  ControlSpinBox.Value := V;
end;

procedure TFSpinBox.Opacity(FOpacity: Single);
begin
  ControlSpinBox.Opacity := FOpacity;
end;

procedure TFSpinBox.RotationAngle(FValue: Single);
begin
  ControlSpinBox.RotationAngle := FValue;
end;

procedure TFSpinBox.RotationCenter(X, Y: Single);
begin
  ControlSpinBox.RotationCenter.X := X;
  ControlSpinBox.RotationCenter.Y := Y;
end;

procedure TFSpinBox.Enabled(FEnabled: Boolean);
begin
  ControlSpinBox.Enabled := FEnabled;
end;

procedure TFSpinBox.Visible(FVisible: Boolean);
begin
  ControlSpinBox.Visible := FVisible;
end;

procedure TFSpinBox.HitTest(FEnabled: Boolean);
begin
  ControlSpinBox.HitTest := FEnabled;
end;

procedure TFSpinBox.StyleLookUp(FStyle: WideString);
begin
  ControlSpinBox.StyleLookUp := string(FStyle);
end;

function TFSpinBox.IsVisible: Boolean;
begin
  Result := ControlSpinBox.Visible;
end;

function TFSpinBox.GetIncrement: Single;
begin
  Result := ControlSpinBox.Increment;
end;

function TFSpinBox.GetValue: Single;
begin
  Result := ControlSpinBox.Value;
end;

function TFSpinBox.GetTag: Integer;
begin
  Result := ControlSpinBox.Tag;
end;

function TFSpinBox.GetLeft: Single;
begin
  Result := ControlSpinBox.Position.X;
end;

function TFSpinBox.GetTop: Single;
begin
  Result := ControlSpinBox.Position.Y;
end;

function TFSpinBox.GetHeight: Single;
begin
  Result := ControlSpinBox.Size.Height;
end;

function TFSpinBox.GetWidth: Single;
begin
  Result := ControlSpinBox.Size.Width;
end;

function TFSpinBox.GetObject: TFmxObject;
begin
  Result := ControlSpinBox;
end;

procedure TFSpinBox.OnChange(Event: TNotifyEvent);
begin
  ControlSpinBox.OnChange := TNotifyEvent(Event);
end;

procedure TFSpinBox.OnChangeTracking(Event: TNotifyEvent);
begin
  ControlSpinBox.OnChangeTracking := TNotifyEvent(Event);
end;

procedure TFSpinBox.OnClick(Event: TNotifyEvent);
begin
  ControlSpinBox.OnClick := TNotifyEvent(Event);
end;

procedure TFSpinBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlSpinBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFSpinBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSpinBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSpinBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSpinBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFSpinBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlSpinBox.OnMouseUp := TMouseEvent(Event);
end;

function TFSpinBox.Handle: TFmxObject;
begin
  Result := ControlSpinBox;
end;

// =============================================================================
// FComboEdit
// =============================================================================
procedure TFComboEdit.FCreate(FParent: TFmxObject);
begin
  ControlComboEdit := TComboEdit.Create(nil);
  ControlComboEdit.Parent := FParent;
end;

procedure TFComboEdit.Cursor(FCursor: TCursor);
begin
  ControlComboEdit.Cursor := TCursor(FCursor);
end;

procedure TFComboEdit.Left(FLeft: Single);
begin
  ControlComboEdit.Position.X := FLeft;
end;

procedure TFComboEdit.Top(FTop: Single);
begin
  ControlComboEdit.Position.Y := FTop;
end;

procedure TFComboEdit.Height(FHeight: Single);
begin
  ControlComboEdit.Size.Height := FHeight;
end;

procedure TFComboEdit.Width(FWidth: Single);
begin
  ControlComboEdit.Size.Width := FWidth;
end;

procedure TFComboEdit.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlComboEdit.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFComboEdit.Position(X, Y: Single);
begin
  ControlComboEdit.Position.X := X;
  ControlComboEdit.Position.Y := Y;
end;

procedure TFComboEdit.Align(Al: TAlignLayout);
begin
  ControlComboEdit.Align := TAlignLayout(Al);
end;

procedure TFComboEdit.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlComboEdit.Margins.Left := FLeft;
  ControlComboEdit.Margins.Top := FTop;
  ControlComboEdit.Margins.Right := FRight;
  ControlComboEdit.Margins.Bottom := FBottom;
end;

procedure TFComboEdit.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlComboEdit.Padding.Left := FLeft;
  ControlComboEdit.Padding.Top := FTop;
  ControlComboEdit.Padding.Right := FRight;
  ControlComboEdit.Padding.Bottom := FBottom;
end;

procedure TFComboEdit.SetHint(const FText: WideString);
begin
  ControlComboEdit.ShowHint := True;
  ControlComboEdit.Hint := string(FText);
end;

procedure TFComboEdit.SetClipChildren(FValue: Boolean);
begin
  ControlComboEdit.ClipChildren := FValue;
end;

procedure TFComboEdit.SetClipParent(FValue: Boolean);
begin
  ControlComboEdit.ClipParent := FValue;
end;

procedure TFComboEdit.BringToFront;
begin
  ControlComboEdit.BringToFront;
end;

procedure TFComboEdit.SendToBack;
begin
  ControlComboEdit.SendToBack;
end;

procedure TFComboEdit.CanFocus(FValue: Boolean);
begin
  ControlComboEdit.CanFocus := FValue;
end;

procedure TFComboEdit.SetDropDownCount(Count: Integer);
begin
  ControlComboEdit.DropDownCount := Count;
end;

procedure TFComboEdit.ReadOnly(FValue: Boolean);
begin
  ControlComboEdit.ReadOnly := FValue;
end;

procedure TFComboEdit.ItemHeight(FHeight: Single);
begin
  ControlComboEdit.ItemHeight := FHeight;
end;

procedure TFComboEdit.ItemWidth(FWidth: Single);
begin
  ControlComboEdit.ItemWidth := FWidth;
end;

procedure TFComboEdit.SetItemIndex(FIndex: Integer);
begin
  ControlComboEdit.ItemIndex := FIndex;
end;

procedure TFComboEdit.AddItem(const FItem: WideString);
begin
  ControlComboEdit.Items.Add(string(FItem));
end;

procedure TFComboEdit.ListBoxResource(const FResource: WideString);
begin
  ControlComboEdit.ListBoxResource := string(FResource);
end;

procedure TFComboEdit.Text(const FText: WideString);
begin
  ControlComboEdit.Text := string(FText);
end;

procedure TFComboEdit.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlComboEdit.DropdownKind:= TDropdownKind.Native;
  ControlComboEdit.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFComboEdit.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlComboEdit.DropdownKind:= TDropdownKind.Custom;
  ControlComboEdit.StyledSettings := [];

  ControlComboEdit.Font.Family := string(FontName);
  ControlComboEdit.Font.Size := FontSize;
  ControlComboEdit.FontColor := TAlphaColor(FontColor);
end;

procedure TFComboEdit.TextSetting(FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlComboEdit.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlComboEdit.TextSettings.VertAlign := TTextAlign(FVertAlign);
end;

procedure TFComboEdit.Caret(FColor: TAlphaColor; FInterval: Integer;
  FWidth: Word);
begin
  ControlComboEdit.Caret.Color := TAlphaColor(FColor);
  ControlComboEdit.Caret.Interval := FInterval;
  ControlComboEdit.Caret.Width := FWidth;
end;

procedure TFComboEdit.Opacity(FOpacity: Single);
begin
  ControlComboEdit.Opacity := FOpacity;
end;

procedure TFComboEdit.RotationAngle(FValue: Single);
begin
  ControlComboEdit.RotationAngle := FValue;
end;

procedure TFComboEdit.RotationCenter(X, Y: Single);
begin
  ControlComboEdit.RotationCenter.X := X;
  ControlComboEdit.RotationCenter.Y := Y;
end;

procedure TFComboEdit.Enabled(FEnabled: Boolean);
begin
  ControlComboEdit.Enabled := FEnabled;
end;

procedure TFComboEdit.Visible(FVisible: Boolean);
begin
  ControlComboEdit.Visible := FVisible;
end;

procedure TFComboEdit.HitTest(FEnabled: Boolean);
begin
  ControlComboEdit.HitTest := FEnabled;
end;

procedure TFComboEdit.StyleLookUp(FStyle: WideString);
begin
  ControlComboEdit.StyleLookUp := string(FStyle);
end;

function TFComboEdit.IsVisible: Boolean;
begin
  Result := ControlComboEdit.Visible;
end;

function TFComboEdit.GetItem(FIndex: Integer): WideString;
begin
  Result := '';

  if (ControlComboEdit = nil) or (FIndex < 0) or
     (FIndex >= ControlComboEdit.Items.Count) then
    Exit;

  Result := ControlComboEdit.Items[FIndex];
end;

function TFComboEdit.GetItemIndex: Integer;
begin
  if ControlComboEdit = nil then
    Result := -1
  else
    Result := ControlComboEdit.ItemIndex;
end;

function TFComboEdit.GetItemCount: Integer;
begin
  Result := ControlComboEdit.Count;
end;

function TFComboEdit.GetDropDownCount: Integer;
begin
  Result := ControlComboEdit.DropDownCount;
end;

function TFComboEdit.GetText: WideString;
begin
  Result := ControlComboEdit.Text;
end;

function TFComboEdit.GetTag: Integer;
begin
  Result := ControlComboEdit.Tag;
end;

function TFComboEdit.GetLeft: Single;
begin
  Result := ControlComboEdit.Position.X;
end;

function TFComboEdit.GetTop: Single;
begin
  Result := ControlComboEdit.Position.Y;
end;

function TFComboEdit.GetHeight: Single;
begin
  Result := ControlComboEdit.Size.Height;
end;

function TFComboEdit.GetWidth: Single;
begin
  Result := ControlComboEdit.Size.Width;
end;

function TFComboEdit.GetObject: TFmxObject;
begin
  Result := ControlComboEdit;
end;

procedure TFComboEdit.OnClosePopup(Event: TNotifyEvent);
begin
  ControlComboEdit.OnClosePopup := TNotifyEvent(Event);
end;

procedure TFComboEdit.OnTyping(Event: TNotifyEvent);
begin
  ControlComboEdit.OnTyping := TNotifyEvent(Event);
end;

procedure TFComboEdit.OnClick(Event: TNotifyEvent);
begin
  ControlComboEdit.OnClick := TNotifyEvent(Event);
end;

procedure TFComboEdit.OnChange(Event: TNotifyEvent);
begin
  ControlComboEdit.OnChange := TNotifyEvent(Event);
end;

procedure TFComboEdit.OnMouseDown(Event: TMouseEvent);
begin
  ControlComboEdit.OnMouseDown := TMouseEvent(Event);
end;

procedure TFComboEdit.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlComboEdit.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFComboEdit.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlComboEdit.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFComboEdit.OnMouseUp(Event: TMouseEvent);
begin
  ControlComboEdit.OnMouseUp := TMouseEvent(Event);
end;

function TFComboEdit.Handle: TFmxObject;
begin
  Result := ControlComboEdit;
end;

// =============================================================================
// FComboTrackBar
// =============================================================================
procedure TFComboTrackBar.FCreate(FParent: TFmxObject);
begin
  ControlComboTrackBar := TComboTrackBar.Create(nil);
  ControlComboTrackBar.Parent := FParent;
end;

procedure TFComboTrackBar.Cursor(FCursor: TCursor);
begin
  ControlComboTrackBar.Cursor := TCursor(FCursor);
end;

procedure TFComboTrackBar.Left(FLeft: Single);
begin
  ControlComboTrackBar.Position.X := FLeft;
end;

procedure TFComboTrackBar.Top(FTop: Single);
begin
  ControlComboTrackBar.Position.Y := FTop;
end;

procedure TFComboTrackBar.Height(FHeight: Single);
begin
  ControlComboTrackBar.Size.Height := FHeight;
end;

procedure TFComboTrackBar.Width(FWidth: Single);
begin
  ControlComboTrackBar.Size.Width := FWidth;
end;

procedure TFComboTrackBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlComboTrackBar.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFComboTrackBar.Position(X, Y: Single);
begin
  ControlComboTrackBar.Position.X := X;
  ControlComboTrackBar.Position.Y := Y;
end;

procedure TFComboTrackBar.Align(Al: TAlignLayout);
begin
  ControlComboTrackBar.Align := TAlignLayout(Al);
end;

procedure TFComboTrackBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlComboTrackBar.Margins.Left := FLeft;
  ControlComboTrackBar.Margins.Top := FTop;
  ControlComboTrackBar.Margins.Right := FRight;
  ControlComboTrackBar.Margins.Bottom := FBottom;
end;

procedure TFComboTrackBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlComboTrackBar.Padding.Left := FLeft;
  ControlComboTrackBar.Padding.Top := FTop;
  ControlComboTrackBar.Padding.Right := FRight;
  ControlComboTrackBar.Padding.Bottom := FBottom;
end;

procedure TFComboTrackBar.SetHint(const FText: WideString);
begin
  ControlComboTrackBar.ShowHint := True;
  ControlComboTrackBar.Hint := string(FText);
end;

procedure TFComboTrackBar.SetClipChildren(FValue: Boolean);
begin
  ControlComboTrackBar.ClipChildren := FValue;
end;

procedure TFComboTrackBar.SetClipParent(FValue: Boolean);
begin
  ControlComboTrackBar.ClipParent := FValue;
end;

procedure TFComboTrackBar.BringToFront;
begin
  ControlComboTrackBar.BringToFront;
end;

procedure TFComboTrackBar.SendToBack;
begin
  ControlComboTrackBar.SendToBack;
end;

procedure TFComboTrackBar.SetTag(FTag: Integer);
begin
  ControlComboTrackBar.Tag := FTag;
end;

procedure TFComboTrackBar.DecimalDigits(FValue: Integer);
begin
  ControlComboTrackBar.DecimalDigits := FValue;
end;

procedure TFComboTrackBar.Frequency(FValue: Double);
begin
  ControlComboTrackBar.Frequency := FValue;
end;

procedure TFComboTrackBar.Max(FMax: Single);
begin
  ControlComboTrackBar.Max := FMax;
end;

procedure TFComboTrackBar.Min(FMin: Single);
begin
  ControlComboTrackBar.Min := FMin;
end;

procedure TFComboTrackBar.Value(FValue: Single);
begin
  ControlComboTrackBar.Value := FValue;
end;

procedure TFComboTrackBar.ValueType(FType: Integer);
begin
  ControlComboTrackBar.ValueType := TNumValueType(FType);
end;

procedure TFComboTrackBar.ReadOnly(FEnabled: Boolean);
begin
  ControlComboTrackBar.ReadOnly := FEnabled;
end;

procedure TFComboTrackBar.DropDown;
begin
  ControlComboTrackBar.DropDown;
end;

procedure TFComboTrackBar.CloseDropDown;
begin
  ControlComboTrackBar.CloseDropDown;
end;

procedure TFComboTrackBar.Text(const FText: WideString);
begin
  ControlComboTrackBar.Text := string(FText);
end;

procedure TFComboTrackBar.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlComboTrackBar.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFComboTrackBar.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlComboTrackBar.StyledSettings := [];

  ControlComboTrackBar.TextSettings.Font.Family := string(FontName);
  ControlComboTrackBar.TextSettings.Font.Size := FontSize;
  ControlComboTrackBar.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFComboTrackBar.TextSetting(FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlComboTrackBar.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlComboTrackBar.TextSettings.VertAlign := TTextAlign(FVertAlign);
end;

procedure TFComboTrackBar.Caret(FColor: TAlphaColor; FInterval: Integer;
  FWidth: Word);
begin
  ControlComboTrackBar.Caret.Color := TAlphaColor(FColor);
  ControlComboTrackBar.Caret.Interval := FInterval;
  ControlComboTrackBar.Caret.Width := FWidth;
end;

procedure TFComboTrackBar.Opacity(FOpacity: Single);
begin
  ControlComboTrackBar.Opacity := FOpacity;
end;

procedure TFComboTrackBar.RotationAngle(FValue: Single);
begin
  ControlComboTrackBar.RotationAngle := FValue;
end;

procedure TFComboTrackBar.RotationCenter(X, Y: Single);
begin
  ControlComboTrackBar.RotationCenter.X := X;
  ControlComboTrackBar.RotationCenter.Y := Y;
end;

procedure TFComboTrackBar.Enabled(FEnabled: Boolean);
begin
  ControlComboTrackBar.Enabled := FEnabled;
end;

procedure TFComboTrackBar.Visible(FVisible: Boolean);
begin
  ControlComboTrackBar.Visible := FVisible;
end;

procedure TFComboTrackBar.HitTest(FEnabled: Boolean);
begin
  ControlComboTrackBar.HitTest := FEnabled;
end;

procedure TFComboTrackBar.StyleLookUp(FStyle: WideString);
begin
  ControlComboTrackBar.StyleLookUp := string(FStyle);
end;

function TFComboTrackBar.IsVisible: Boolean;
begin
  Result := ControlComboTrackBar.Visible;
end;

function TFComboTrackBar.GetDroppedDown: Boolean;
begin
  Result := ControlComboTrackBar.DroppedDown;
end;

function TFComboTrackBar.GetText: WideString;
begin
  Result := ControlComboTrackBar.Text;
end;

function TFComboTrackBar.GetValue: Single;
begin
  Result := ControlComboTrackBar.Value;
end;

function TFComboTrackBar.GetFrequency: Double;
begin
  Result := ControlComboTrackBar.Frequency;
end;

function TFComboTrackBar.GetTag: Integer;
begin
  Result := ControlComboTrackBar.Tag;
end;

function TFComboTrackBar.GetLeft: Single;
begin
  Result := ControlComboTrackBar.Position.X;
end;

function TFComboTrackBar.GetTop: Single;
begin
  Result := ControlComboTrackBar.Position.Y;
end;

function TFComboTrackBar.GetHeight: Single;
begin
  Result := ControlComboTrackBar.Size.Height;
end;

function TFComboTrackBar.GetWidth: Single;
begin
  Result := ControlComboTrackBar.Size.Width;
end;

function TFComboTrackBar.GetObject: TFmxObject;
begin
  Result := ControlComboTrackBar;
end;

procedure TFComboTrackBar.OnChange(Event: TNotifyEvent);
begin
  ControlComboTrackBar.OnChange := TNotifyEvent(Event);
end;

procedure TFComboTrackBar.OnChangeTracking(Event: TNotifyEvent);
begin
  ControlComboTrackBar.OnChangeTracking := TNotifyEvent(Event);
end;

procedure TFComboTrackBar.OnTyping(Event: TNotifyEvent);
begin
  ControlComboTrackBar.OnTyping := TNotifyEvent(Event);
end;

procedure TFComboTrackBar.OnClick(Event: TNotifyEvent);
begin
  ControlComboTrackBar.OnClick := TNotifyEvent(Event);
end;

procedure TFComboTrackBar.OnMouseDown(Event: TMouseEvent);
begin
  ControlComboTrackBar.OnMouseDown := TMouseEvent(Event);
end;

procedure TFComboTrackBar.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlComboTrackBar.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFComboTrackBar.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlComboTrackBar.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFComboTrackBar.OnMouseUp(Event: TMouseEvent);
begin
  ControlComboTrackBar.OnMouseUp := TMouseEvent(Event);
end;

function TFComboTrackBar.Handle: TFmxObject;
begin
  Result := ControlComboTrackBar;
end;

// =============================================================================
// Exports
// =============================================================================
function InitSpeedButtonHandle: FSpeedButton;
begin
  Result := TFSpeedButton.Create;
end;

function InitCornerButtonHandle: FCornerButton;
begin
  Result := TFCornerButton.Create;
end;

function InitArcDialHandle: FArcDial;
begin
  Result := TFArcDial.Create;
end;

function InitAniIndicatorHandle: FAniIndicator;
begin
  Result := TFAniIndicator.Create;
end;

function InitDropTargetHandle: FDropTarget;
begin
  Result := TFDropTarget.Create;
end;

function InitImageViewerHandle: FImageViewer;
begin
  Result := TFImageViewer.Create;
end;

function InitNumberBoxHandle: FNumberBox;
begin
  Result := TFNumberBox.Create;
end;

function InitSpinBoxHandle: FSpinBox;
begin
  Result := TFSpinBox.Create;
end;

function InitComboEditHandle: FComboEdit;
begin
  Result := TFComboEdit.Create;
end;

function InitComboTrackBarHandle: FComboTrackBar;
begin
  Result := TFComboTrackBar.Create;
end;

exports
  InitSpeedButtonHandle,
  InitCornerButtonHandle,
  InitArcDialHandle,
  InitAniIndicatorHandle,
  InitDropTargetHandle,
  InitImageViewerHandle,
  InitNumberBoxHandle,
  InitSpinBoxHandle,
  InitComboEditHandle,
  InitComboTrackBarHandle;

end.
