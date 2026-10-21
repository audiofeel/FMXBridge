
unit FMXBridge.Standard;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, System.Types,
  FMX.Types, FMX.Objects, FMX.Edit, FMX.Controls, FMX.StdCtrls,
  FMX.Memo, FMX.ListBox, FMX.TreeView, FMX.ListView,
  FMX.SearchBox, FMX.ImgList, FMX.ExtCtrls, FMX.Menus, FMXBridge.Utils;

// =============================================================================
// FButton
// =============================================================================
type
  FButton = interface(IUnknown)
    ['{F44AD17C-D522-4CA2-BEAC-D4B1190A8DE1}']
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
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure SetFocus; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
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

  TFButton = class(TInterfacedObject, FButton)
  private
    ControlButton: TButton;
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
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure SetFocus; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
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
// FCheckBox
// =============================================================================
type
  FCheckBox = interface(IUnknown)
    ['{F07DF579-A90A-4771-B923-115C5862F843}']
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
    procedure SetChecked(FChecked: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFCheckbox = class(TInterfacedObject, FCheckBox)
  private
    ControlCheckbox: TCheckBox;
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
    procedure SetChecked(FChecked: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FRadioButton
// =============================================================================
type
  FRadioButton = interface(IUnknown)
    ['{87105653-66FE-41AC-B10B-00A1F370E0BB}']
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
    procedure SetChecked(FChecked: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure FontColor(FColor: TAlphaColor); stdcall;
    procedure GroupName(const FGroupName: WideString); stdcall;
    procedure SetFocus; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFRadioButton = class(TInterfacedObject, FRadioButton)
  private
    ControlRadioButton: TRadioButton;
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
    procedure SetChecked(FChecked: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure FontColor(FColor: TAlphaColor); stdcall;
    procedure GroupName(const FGroupName: WideString); stdcall;
    procedure SetFocus; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FGroupBox
// =============================================================================
type
  FGroupBox = interface(IUnknown)
    ['{0B4E3397-5F53-4024-91F2-B3626CC6546D}']
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
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
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

  TFGroupBox = class(TInterfacedObject, FGroupBox)
  private
    ControlGroupBox: TGroupBox;
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
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
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
// FPopupBox
// =============================================================================
type
  FPopupBox = interface(IUnknown)
    ['{616554AE-D854-4BB4-A346-1F1087210FD6}']
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
    procedure DisableDisappear(FDisable: Boolean); stdcall;
    procedure ItemsAdd(const NameStr: WideString); stdcall;
    procedure ItemsAddPair(const NameStr, ValueStr: WideString); stdcall;
    procedure ItemSetIndex(FIndex: Integer); stdcall;
    procedure Index(FValue: Integer); stdcall;
    procedure Clear; stdcall;
    procedure StaysPressed(FEnabled: Boolean); stdcall;
    procedure Pressed(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsPressed: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetIndex: Integer; stdcall;
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
    function Handle: TFmxObject; stdcall;
  end;

  TFPopupBox = class(TInterfacedObject, FPopupBox)
  private
    ControlPopupBox: TPopupBox;
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
    procedure DisableDisappear(FDisable: Boolean); stdcall;
    procedure ItemsAdd(const NameStr: WideString); stdcall;
    procedure ItemsAddPair(const NameStr, ValueStr: WideString); stdcall;
    procedure ItemSetIndex(FIndex: Integer); stdcall;
    procedure Index(FValue: Integer); stdcall;
    procedure Clear; stdcall;
    procedure StaysPressed(FEnabled: Boolean); stdcall;
    procedure Pressed(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsPressed: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetIndex: Integer; stdcall;
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
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FPanel
// =============================================================================
type
  FPanel = interface(IUnknown)
    ['{DF8B5B03-A007-4A51-9293-067C69FD919C}']
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

  TFPanel = class(TInterfacedObject, FPanel)
  private
    ControlPanel: TPanel;
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
// FCalloutPanel
// =============================================================================
type
  FCalloutPanel = interface(IUnknown)
    ['{C4458093-3AEB-4261-B99F-A9102C8E53DC}']
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
    procedure CalloutLength(FLength: Single); stdcall;
    procedure CalloutOffset(FOffset: Single); stdcall;
    procedure CalloutPosition(FPosition: TCalloutPosition); stdcall;
    procedure CalloutWidth(FWidth: Single); stdcall;
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

  TFCalloutPanel = class(TInterfacedObject, FCalloutPanel)
  private
    ControlCalloutPanel: TCalloutPanel;
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
    procedure CalloutLength(FLength: Single); stdcall;
    procedure CalloutOffset(FOffset: Single); stdcall;
    procedure CalloutPosition(FPosition: TCalloutPosition); stdcall;
    procedure CalloutWidth(FWidth: Single); stdcall;
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
// FLabel
// =============================================================================
type
  FLabel = interface(IUnknown)
    ['{1EE436EA-51B9-401A-A6E0-D8919B2B47A7}']
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
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Trimming(FTrimming: TTextTrimming); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetFontColor: TAlphaColor; stdcall;
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

  TFLabel = class(TInterfacedObject, FLabel)
  private
    ControlLabel: TLabel;
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
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Trimming(FTrimming: TTextTrimming); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetFontColor: TAlphaColor; stdcall;
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
// FImageControl
// =============================================================================
type
  FImageControl = interface(IUnknown)
    ['{6F2E60F1-7385-4300-B547-A7F8CF1279E4}']
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
    procedure LoadPicture(const FImage: WideString); stdcall;
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

  TFImageControl = class(TInterfacedObject, FImageControl)
  private
    ControlImageCtrl: TImageControl;
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
    procedure LoadPicture(const FImage: WideString); stdcall;
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
// FProgressBar
// =============================================================================
type
  FProgressBar = interface(IUnknown)
    ['{8EC3C7CE-C814-49DC-A370-0948823543A3}']
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
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Orientation(FVertical: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetValue: Single; stdcall;
    function GetMax: Single; stdcall;
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

  TFProgressBar = class(TInterfacedObject, FProgressBar)
  private
    ControlProgressBar: TProgressBar;
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
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Orientation(FVertical: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetValue: Single; stdcall;
    function GetMax: Single; stdcall;
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
// FExpander
// =============================================================================
type
  FExpander = interface(IUnknown)
    ['{0438B45F-C2D7-42A0-B2AB-81CD5981B924}']
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
    procedure HeaderHeight(FValue: Integer); stdcall;
    procedure SetChecked(Value: Boolean); stdcall;
    procedure SetExpanded(Value: Boolean); stdcall;
    procedure SetShowCheck(Value: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsExpanded: Boolean; stdcall;
    function IsShowCheck: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnCheckChange(Event: TNotifyEvent); stdcall;
    procedure OnExpandedChanged(Event: TNotifyEvent); stdcall;
    procedure OnExpandedChanging(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFExpander = class(TInterfacedObject, FExpander)
  private
    ControlExpander: TExpander;
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
    procedure HeaderHeight(FValue: Integer); stdcall;
    procedure SetChecked(Value: Boolean); stdcall;
    procedure SetExpanded(Value: Boolean); stdcall;
    procedure SetShowCheck(Value: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsExpanded: Boolean; stdcall;
    function IsShowCheck: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnCheckChange(Event: TNotifyEvent); stdcall;
    procedure OnExpandedChanged(Event: TNotifyEvent); stdcall;
    procedure OnExpandedChanging(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FTrackBar
// =============================================================================
type
  FTrackBar = interface(IUnknown)
    ['{A39EED13-DFC1-45D4-B3C4-123BA3B53426}']
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
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Orientation(FVertical: Boolean); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Frequency(FFrequency: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetValue: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnTracking(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    procedure OnMouseWheel(Event: TMouseWheelEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFTrackBar = class(TInterfacedObject, FTrackBar)
  private
    ControlTrackBar: TTrackBar;
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
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Orientation(FVertical: Boolean); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Frequency(FFrequency: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetValue: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnTracking(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    procedure OnMouseWheel(Event: TMouseWheelEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSwitch
// =============================================================================
type
  FSwitch = interface(IUnknown)
    ['{DD572F47-053F-4B8F-813F-12BD02E5B8DB}']
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
    procedure SwitchedOn(FSwitchedOn: Boolean); stdcall;
    procedure SetFocus; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsSwitchedOn: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnSwitch(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSwitch = class(TInterfacedObject, FSwitch)
  private
    ControlSwitch: TSwitch;
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
    procedure SwitchedOn(FSwitchedOn: Boolean); stdcall;
    procedure SetFocus; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsSwitchedOn: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnSwitch(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSplitter
// =============================================================================
type
  FSplitter = interface(IUnknown)
    ['{27D1EA8D-C047-4636-AB44-1B2DA01EE3BA}']
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
    procedure MinSize(FSize: Single); stdcall;
    procedure ShowGrip(FValue: Boolean); stdcall;
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

  TFSplitter = class(TInterfacedObject, FSplitter)
  private
    ControlSplitter: TSplitter;
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
    procedure MinSize(FSize: Single); stdcall;
    procedure ShowGrip(FValue: Boolean); stdcall;
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
// FMenuItem
// =============================================================================
type
  FMenuItem = interface(IUnknown)
    ['{0B7CBD3D-6BAB-4188-BD8F-58F62CD00479}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure LoadImage(const FImage: WideString); stdcall;
    procedure AddItem(FMenuItem: TMenuItem); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure AutoCheck(FValue: Boolean); stdcall;
    procedure SetChecked(FValue: Boolean); stdcall;
    procedure SetIndex(FValue: Integer); stdcall;
    procedure GroupIndex(FValue: Integer); stdcall;
    procedure ImageIndex(FValue: Integer); stdcall;
    procedure RadioItem(FValue: Boolean); stdcall;
    procedure Select(FValue: Boolean); stdcall;
    procedure Change; stdcall;
    procedure Clear; stdcall;
    procedure Popup; stdcall;
    procedure NeedPopup; stdcall;
    procedure ShortCut(FValue: TShortCut); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsAutoCheck: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsSeparator: Boolean; stdcall;
    function IsRadioItem: Boolean; stdcall;
    function IsChecked: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function ParenIMenuItem: TMenuItem; stdcall;
    function MainMenu: TMainMenu; stdcall;
    function HavePopup: Boolean; stdcall;
    function ItemsCount: Integer; stdcall;
    function GetItem(FIndex: Integer): TMenuItem; stdcall;
    function GetIndex: Integer; stdcall;
    function GetGroupIndex: Integer; stdcall;
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

  TFMenuItem = class(TInterfacedObject, FMenuItem)
  private
    ControlMenuItem: TMenuItem;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure LoadImage(const FImage: WideString); stdcall;
    procedure AddItem(FMenuItem: TMenuItem); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure AutoCheck(FValue: Boolean); stdcall;
    procedure SetChecked(FValue: Boolean); stdcall;
    procedure SetIndex(FValue: Integer); stdcall;
    procedure GroupIndex(FValue: Integer); stdcall;
    procedure ImageIndex(FValue: Integer); stdcall;
    procedure RadioItem(FValue: Boolean); stdcall;
    procedure Select(FValue: Boolean); stdcall;
    procedure Change; stdcall;
    procedure Clear; stdcall;
    procedure Popup; stdcall;
    procedure NeedPopup; stdcall;
    procedure ShortCut(FValue: TShortCut); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsAutoCheck: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsSeparator: Boolean; stdcall;
    function IsRadioItem: Boolean; stdcall;
    function IsChecked: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function ParenIMenuItem: TMenuItem; stdcall;
    function MainMenu: TMainMenu; stdcall;
    function HavePopup: Boolean; stdcall;
    function ItemsCount: Integer; stdcall;
    function GetItem(FIndex: Integer): TMenuItem; stdcall;
    function GetIndex: Integer; stdcall;
    function GetGroupIndex: Integer; stdcall;
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
// FMenuBar
// =============================================================================
type
  FMenuBar = interface(IUnknown)
    ['{C4E0F1FC-B0BE-42DC-811D-8E0060E7BC54}']
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
    procedure AddItem(FItem: TMenuItem); stdcall;
    procedure ImageList(FImgList: TImageList); stdcall;
    procedure ItemPopup(FIndex: Integer); stdcall;
    procedure Clear; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function ItemCount: Integer; stdcall;
    function ItemIsSelected(FIndex: Integer): Boolean; stdcall;
    function ItemIsSeparator(FIndex: Integer): Boolean; stdcall;
    function ItemIsChecked(FIndex: Integer): Boolean; stdcall;
    function ItemGroupIndex(FIndex: Integer): Integer; stdcall;
    function ItemText(FIndex: Integer): WideString; stdcall;
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

  TFMenuBar = class(TInterfacedObject, FMenuBar)
  private
    ControlMenuBar: TMenuBar;
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
    procedure AddItem(FItem: TMenuItem); stdcall;
    procedure ImageList(FImgList: TImageList); stdcall;
    procedure ItemPopup(FIndex: Integer); stdcall;
    procedure Clear; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function ItemCount: Integer; stdcall;
    function ItemIsSelected(FIndex: Integer): Boolean; stdcall;
    function ItemIsSeparator(FIndex: Integer): Boolean; stdcall;
    function ItemIsChecked(FIndex: Integer): Boolean; stdcall;
    function ItemGroupIndex(FIndex: Integer): Integer; stdcall;
    function ItemText(FIndex: Integer): WideString; stdcall;
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
// FStatusBar
// =============================================================================
type
  FStatusBar = interface(IUnknown)
    ['{3597EC5B-A227-43AB-ADD2-121EE1D76ECD}']
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
    procedure AutoHint(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
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

  TFStatusBar = class(TInterfacedObject, FStatusBar)
  private
    ControlStatusBar: TStatusBar;
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
    procedure AutoHint(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
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
// FToolBar
// =============================================================================
type
  FToolBar = interface(IUnknown)
    ['{A7B802B8-D4E2-44D1-B9E3-D6F5C83B7513}']
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
    procedure TintColor(const FColor: TAlphaColor); stdcall;
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

  TFToolBar = class(TInterfacedObject, FToolBar)
  private
    ControlToolBar: TToolBar;
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
    procedure TintColor(const FColor: TAlphaColor); stdcall;
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
// FSearchBox
// =============================================================================
type
  FSearchBox = interface(IUnknown)
    ['{301D7E48-2814-4381-952F-558077A69FE3}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
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
    procedure Password(FValue: Boolean); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure TextPrompt(FText: WideString); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
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

  TFSearchBox = class(TInterfacedObject, FSearchBox)
  private
    ControlSearchBox: TSearchBox;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
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
    procedure Password(FValue: Boolean); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure TextPrompt(FText: WideString); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
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
// FListBoxGroupFooter
// =============================================================================
type
  FListBoxGroupFooter = interface(IUnknown)
    ['{E3DC7524-B6FB-486F-A9FB-1590231B00C8}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure Checked(FValue: Boolean); stdcall;
    procedure Selected(FValue: Boolean); stdcall;
    procedure ItemDataAccessory(FAccessory
      : TListBoxItemData.TAccessory); stdcall;
    procedure ItemDataBitmap(FImgFile: WideString); stdcall;
    procedure ItemDataDetail(FDetail: WideString); stdcall;
    procedure ItemDataText(FText: WideString); stdcall;
    procedure Selectable(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GeText: WideString; stdcall;
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

  TFListBoxGroupFooter = class(TInterfacedObject, FListBoxGroupFooter)
  private
    ControlListBoxGroupFooter: TListBoxGroupFooter;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure Checked(FValue: Boolean); stdcall;
    procedure Selected(FValue: Boolean); stdcall;
    procedure ItemDataAccessory(FAccessory
      : TListBoxItemData.TAccessory); stdcall;
    procedure ItemDataBitmap(FImgFile: WideString); stdcall;
    procedure ItemDataDetail(FDetail: WideString); stdcall;
    procedure ItemDataText(FText: WideString); stdcall;
    procedure Selectable(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GeText: WideString; stdcall;
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
// FListBoxGroupHeader
// =============================================================================
type
  FListBoxGroupHeader = interface(IUnknown)
    ['{A0D24802-608B-408F-966D-B6D8554B7200}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure Checked(FValue: Boolean); stdcall;
    procedure Selected(FValue: Boolean); stdcall;
    procedure ItemDataAccessory(FAccessory
      : TListBoxItemData.TAccessory); stdcall;
    procedure ItemDataBitmap(FImgFile: WideString); stdcall;
    procedure ItemDataDetail(FDetail: WideString); stdcall;
    procedure ItemDataText(FText: WideString); stdcall;
    procedure Selectable(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GeText: WideString; stdcall;
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

  TFListBoxGroupHeader = class(TInterfacedObject, FListBoxGroupHeader)
  private
    ControlListBoxGroupHeader: TListBoxGroupHeader;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure Checked(FValue: Boolean); stdcall;
    procedure Selected(FValue: Boolean); stdcall;
    procedure ItemDataAccessory(FAccessory
      : TListBoxItemData.TAccessory); stdcall;
    procedure ItemDataBitmap(FImgFile: WideString); stdcall;
    procedure ItemDataDetail(FDetail: WideString); stdcall;
    procedure ItemDataText(FText: WideString); stdcall;
    procedure Selectable(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GeText: WideString; stdcall;
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
// FListBoxHeader
// =============================================================================
type
  FListBoxHeader = interface(IUnknown)
    ['{EC51B73C-8357-40E8-B4D4-7A48866E80B2}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
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
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsEnabled: Boolean; stdcall;
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

  TFListBoxHeader = class(TInterfacedObject, FListBoxHeader)
  private
    ControlListBoxHeader: TListBoxHeader;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
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
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsEnabled: Boolean; stdcall;
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
// FListBoxItem
// =============================================================================
type
  FListBoxItem = interface(IUnknown)
    ['{B1A45071-52D2-410C-80E2-0B739FDC056F}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure Checked(FValue: Boolean); stdcall;
    procedure Selected(FValue: Boolean); stdcall;
    procedure ItemDataAccessory(FAccessory
      : TListBoxItemData.TAccessory); stdcall;
    procedure ItemDataBitmap(FImgFile: WideString); stdcall;
    procedure ItemDataDetail(FDetail: WideString); stdcall;
    procedure ItemDataText(FText: WideString); stdcall;
    procedure Selectable(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    procedure Free; stdcall;
    function IsChecked: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChangeCheck(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFListBoxItem = class(TInterfacedObject, FListBoxItem)
  private
    ControlListBoxItem: TListBoxItem;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure Checked(FValue: Boolean); stdcall;
    procedure Selected(FValue: Boolean); stdcall;
    procedure ItemDataAccessory(FAccessory
      : TListBoxItemData.TAccessory); stdcall;
    procedure ItemDataBitmap(FImgFile: WideString); stdcall;
    procedure ItemDataDetail(FDetail: WideString); stdcall;
    procedure ItemDataText(FText: WideString); stdcall;
    procedure Selectable(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    procedure Free; stdcall;
    function IsChecked: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChangeCheck(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FListBox
// =============================================================================
type
  FListBox = interface(IUnknown)
    ['{1D3E5D26-0B4E-4AE4-97E7-6B27E78509B8}']
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
    procedure AlternatingRowBackground(FValue: Boolean); stdcall;
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure CanParentFocus(FValue: Boolean); stdcall;
    procedure Columns(FValue: Integer); stdcall;
    procedure DefaultItemStyle(FItemStyle: WideString); stdcall;
    procedure DefaultItemGroupHeaderStyle(FGpHeaderStyle: WideString); stdcall;
    procedure DefaultItemGroupFooterStyle(FGpFooterStyle: WideString); stdcall;
    procedure GroupingKind(FGroupingKind: TListGroupingKind); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure ItemWidth(FWidth: Single); stdcall;
    procedure AddItem(FItem: TListBoxItem); stdcall;
    procedure AddItemHeader(FHeader: TListBoxHeader); stdcall;
    procedure AddItemGroupHeader(FGpHeader: TListBoxGroupHeader); stdcall;
    procedure AddItemGroupFooter(FGpFooter: TListBoxGroupFooter); stdcall;
    procedure AddItemSearchBox(FSrchBox: TSearchBox); stdcall;
    procedure SetItemIndex(FIndex: Integer); stdcall;
    procedure ListStyle(FListStyle: TListStyle); stdcall;
    procedure MultiSelectStyle(FMultiSelectStyle: TMultiSelectStyle); stdcall;
    procedure ShowCheckboxes(FShow: Boolean); stdcall;
    procedure ShowScrollBars(FShow: Boolean); stdcall;
    procedure SmoothScroll(FEnabled: Boolean); stdcall;
    procedure Sorted(FValue: Boolean); stdcall;
    procedure Clear; stdcall;
    procedure SelectAll; stdcall;
    procedure ClearSelection; stdcall;
    procedure DeleteItem(FIndex: Integer); stdcall;
    procedure MultiSelect(FValue: Boolean); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure FileDropEnabled(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function Count: Integer; stdcall;
    function Selected: TListBoxItem; stdcall;
    function IsItemChecked(FIndex: Integer): Boolean; stdcall;
    function IsItemSelected(FIndex: Integer): Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetIndexOfItem(FItemText: WideString): Integer; stdcall;
    function GetItem(FIndex: Integer): TListBoxItem; stdcall;
    function GetItemText(FIndex: Integer): WideString; stdcall;
    function GetItemHeight: Single; stdcall;
    function GetItemWidth: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeCheck(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFListBox = class(TInterfacedObject, FListBox)
  private
    ControlListBox: TListBox;
    FDropEnabled: Boolean;
    procedure DragDrop(Sender: TObject; const Data: TDragObject;
      const Point: TPointF);
    procedure DragOver(Sender: TObject; const Data: TDragObject;
      const Point: TPointF; var Operation: TDragOperation);
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
    procedure AlternatingRowBackground(FValue: Boolean); stdcall;
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure CanParentFocus(FValue: Boolean); stdcall;
    procedure Columns(FValue: Integer); stdcall;
    procedure DefaultItemStyle(FItemStyle: WideString); stdcall;
    procedure DefaultItemGroupHeaderStyle(FGpHeaderStyle: WideString); stdcall;
    procedure DefaultItemGroupFooterStyle(FGpFooterStyle: WideString); stdcall;
    procedure GroupingKind(FGroupingKind: TListGroupingKind); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure ItemWidth(FWidth: Single); stdcall;
    procedure AddItem(FItem: TListBoxItem); stdcall;
    procedure AddItemHeader(FHeader: TListBoxHeader); stdcall;
    procedure AddItemGroupHeader(FGpHeader: TListBoxGroupHeader); stdcall;
    procedure AddItemGroupFooter(FGpFooter: TListBoxGroupFooter); stdcall;
    procedure AddItemSearchBox(FSrchBox: TSearchBox); stdcall;
    procedure SetItemIndex(FIndex: Integer); stdcall;
    procedure ListStyle(FListStyle: TListStyle); stdcall;
    procedure MultiSelectStyle(FMultiSelectStyle: TMultiSelectStyle); stdcall;
    procedure ShowCheckboxes(FShow: Boolean); stdcall;
    procedure ShowScrollBars(FShow: Boolean); stdcall;
    procedure SmoothScroll(FEnabled: Boolean); stdcall;
    procedure Sorted(FValue: Boolean); stdcall;
    procedure Clear; stdcall;
    procedure SelectAll; stdcall;
    procedure ClearSelection; stdcall;
    procedure DeleteItem(FIndex: Integer); stdcall;
    procedure MultiSelect(FValue: Boolean); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure FileDropEnabled(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function Count: Integer; stdcall;
    function Selected: TListBoxItem; stdcall;
    function IsItemChecked(FIndex: Integer): Boolean; stdcall;
    function IsItemSelected(FIndex: Integer): Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetIndexOfItem(FItemText: WideString): Integer; stdcall;
    function GetItem(FIndex: Integer): TListBoxItem; stdcall;
    function GetItemText(FIndex: Integer): WideString; stdcall;
    function GetItemHeight: Single; stdcall;
    function GetItemWidth: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeCheck(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FComboBox
// =============================================================================
type
  FComboBox = interface(IUnknown)
    ['{BFAC7AE9-7819-442A-A9EE-6C912B04EC41}']
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
    procedure AddItem(const FItem: WideString); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure ItemWidth(FWidth: Single); stdcall;
    procedure SetItemIndex(FIndex: Integer); stdcall;
    procedure SetDropDownCount(Count: Integer); stdcall;
    procedure Placement(Value: TPlacement); stdcall;
    procedure Clear; stdcall;
    procedure DropDown; stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
       FontColor: TAlphaColor); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItem(FIndex: Integer): WideString; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetItemCount: Integer; stdcall;
    function GetDropDownCount: Integer; stdcall;
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
    function Handle: TFmxObject; stdcall;
  end;

  TFComboBox = class(TInterfacedObject, FComboBox)
  private
    ControlComboBox: TComboBox;
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
    procedure AddItem(const FItem: WideString); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure ItemWidth(FWidth: Single); stdcall;
    procedure SetItemIndex(FIndex: Integer); stdcall;
    procedure SetDropDownCount(Count: Integer); stdcall;
    procedure Placement(Value: TPlacement); stdcall;
    procedure Clear; stdcall;
    procedure DropDown; stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
       FontColor: TAlphaColor); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItem(FIndex: Integer): WideString; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetItemCount: Integer; stdcall;
    function GetDropDownCount: Integer; stdcall;
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
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FMemo
// =============================================================================
type
  FMemo = interface(IUnknown)
    ['{6F84CA9F-7336-41F1-9BA8-B41C1508F6C4}']
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
    procedure AutoSelect(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure DisableFocusEffect(FValue: Boolean); stdcall;
    procedure EnabledScroll(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure TextPrompt(const FText: WideString); stdcall;
    procedure MaxLength(FLength: Integer); stdcall;
    procedure CheckSpelling(FCheck: Boolean); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure SmoothScroll(FEnabled: Boolean); stdcall;
    procedure LoadFromfile(const Filename: WideString); stdcall;
    procedure SetStrings(Src: TStrings); stdcall;
    procedure AddLine(const FText: WideString); stdcall;
    procedure Clear; stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
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
    function LineCount: Integer; stdcall;
    function LineStrings(FIndex: Integer): WideString; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
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

  TFMemo = class(TInterfacedObject, FMemo)
  private
    ControlMemo: TMemo;
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
    procedure AutoSelect(FValue: Boolean); stdcall;
    procedure Bounces(FValue: Boolean); stdcall;
    procedure DisableFocusEffect(FValue: Boolean); stdcall;
    procedure EnabledScroll(FValue: Boolean); stdcall;
    procedure ShowSizeGrip(FValue: Boolean); stdcall;
    procedure TextPrompt(const FText: WideString); stdcall;
    procedure MaxLength(FLength: Integer); stdcall;
    procedure CheckSpelling(FCheck: Boolean); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure ShowScrollBars(FValue: Boolean); stdcall;
    procedure SmoothScroll(FEnabled: Boolean); stdcall;
    procedure LoadFromfile(const Filename: WideString); stdcall;
    procedure SetStrings(Src: TStrings); stdcall;
    procedure AddLine(const FText: WideString); stdcall;
    procedure Clear; stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
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
    function LineCount: Integer; stdcall;
    function LineStrings(FIndex: Integer): WideString; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
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
// FEdit
// =============================================================================
type
  FEdit = interface(IUnknown)
    ['{37489E7F-D52D-40A7-9974-8B6D29487297}']
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
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure TextPrompt(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure AddSearchButton(Event: TNotifyEvent); stdcall;
    procedure AddClearButton(Event: TNotifyEvent); stdcall;
    procedure AddPasswordButton; stdcall;
    procedure Password(FPassword: Boolean); stdcall;
    procedure FilterChar(FFilterStr: WideString); stdcall;
    procedure DisableFocusEffect(FDisable: Boolean); stdcall;
    procedure MaxLength(FLength: Integer); stdcall;
    procedure CheckSpelling(FCheck: Boolean); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure CaretShow(FShow: Boolean); stdcall;
    procedure SelectAll; stdcall;
    procedure SelectWord; stdcall;
    procedure SelStart(FValue: Integer); stdcall;
    procedure SelLength(FValue: Integer); stdcall;
    procedure SelectionFillColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetSelText: WideString; stdcall;
    function GetSearchBtnObject: TFmxObject; stdcall;
    function GetPasswordBtnObject: TFmxObject; stdcall;
    function GetClearBtnObject: TFmxObject; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnTyping(Event: TNotifyEvent); stdcall;
    procedure OnEnter(Event: TNotifyEvent); stdcall;
    procedure OnExit(Event: TNotifyEvent); stdcall;
    procedure OnKeyDown(Event: TKeyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFEdit = class(TInterfacedObject, FEdit)
  private
    ControlEdit: TEdit;
    SearchEditButton1: TSearchEditButton;
    ClearEditButton1: TClearEditButton;
    PasswordEditButton1: TPasswordEditButton;
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
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure ReadOnly(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure TextPrompt(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure AddSearchButton(Event: TNotifyEvent); stdcall;
    procedure AddClearButton(Event: TNotifyEvent); stdcall;
    procedure AddPasswordButton; stdcall;
    procedure Password(FPassword: Boolean); stdcall;
    procedure FilterChar(FFilterStr: WideString); stdcall;
    procedure DisableFocusEffect(FDisable: Boolean); stdcall;
    procedure MaxLength(FLength: Integer); stdcall;
    procedure CheckSpelling(FCheck: Boolean); stdcall;
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word); stdcall;
    procedure CaretShow(FShow: Boolean); stdcall;
    procedure SelectAll; stdcall;
    procedure SelectWord; stdcall;
    procedure SelStart(FValue: Integer); stdcall;
    procedure SelLength(FValue: Integer); stdcall;
    procedure SelectionFillColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetSelText: WideString; stdcall;
    function GetSearchBtnObject: TFmxObject; stdcall;
    function GetPasswordBtnObject: TFmxObject; stdcall;
    function GetClearBtnObject: TFmxObject; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnTyping(Event: TNotifyEvent); stdcall;
    procedure OnEnter(Event: TNotifyEvent); stdcall;
    procedure OnExit(Event: TNotifyEvent); stdcall;
    procedure OnKeyDown(Event: TKeyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FTreeViewItem
// =============================================================================
type
  FTreeViewItem = interface(IUnknown)
    ['{4051407B-7B23-4235-94D9-98C73AF6D428}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure SetChecked(FValue: Boolean); stdcall;
    procedure SetSelected(FValue: Boolean); stdcall;
    procedure AddItem(FItem: TTreeViewItem); stdcall;
    procedure Deselect; stdcall;
    procedure ExpandAll; stdcall;
    procedure CollapseAll; stdcall;
    procedure Expand; stdcall;
    procedure Collapse; stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsExpanded: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GetGlobalIndex: Integer; stdcall;
    function GeText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFTreeViewItem = class(TInterfacedObject, FTreeViewItem)
  private
    ControlTreeViewItem: TTreeViewItem;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ImageIndex(FIndex: Integer); stdcall;
    procedure SetChecked(FValue: Boolean); stdcall;
    procedure SetSelected(FValue: Boolean); stdcall;
    procedure AddItem(FItem: TTreeViewItem); stdcall;
    procedure Deselect; stdcall;
    procedure ExpandAll; stdcall;
    procedure CollapseAll; stdcall;
    procedure Expand; stdcall;
    procedure Collapse; stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsChecked: Boolean; stdcall;
    function IsSelected: Boolean; stdcall;
    function IsExpanded: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GetGlobalIndex: Integer; stdcall;
    function GeText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FTreeView
// =============================================================================
type
  FTreeView = interface(IUnknown)
    ['{82FDDA21-00DD-4687-A9CC-0AC6B8C4B62D}']
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
    procedure Images(FImgList: TImageList); stdcall;
    procedure AlternatingRowBackground(FValue: Boolean); stdcall;
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure DisableFocusEffect(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure DeleteItem(FIndex: Integer); stdcall;
    procedure MultiSelect(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure ShowCheckboxes(FShow: Boolean); stdcall;
    procedure ShowScrollBars(FShow: Boolean); stdcall;
    procedure Sorted(FValue: Boolean); stdcall;
    procedure SetItemIndex(FIndex: Integer); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure AddItem(FItem: TTreeViewItem); stdcall;
    procedure ExpandAll; stdcall;
    procedure CollapseAll; stdcall;
    procedure DeselectAll; stdcall;
    procedure Clear; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsItemChecked(FIndex: Integer): Boolean; stdcall;
    function IsItemSelected(FIndex: Integer): Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetIndexOfItem(FItemText: WideString): Integer; stdcall;
    function GetItem(FIndex: Integer): TTreeViewItem; stdcall;
    function GetItemText(FIndex: Integer): WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeCheck(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFTreeView = class(TInterfacedObject, FTreeView)
  private
    ControlTreeView: TTreeView;
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
    procedure Images(FImgList: TImageList); stdcall;
    procedure AlternatingRowBackground(FValue: Boolean); stdcall;
    procedure AutoHide(FValue: Boolean); stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure DisableFocusEffect(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure DeleteItem(FIndex: Integer); stdcall;
    procedure MultiSelect(FValue: Boolean); stdcall;
    procedure ScrollAnimation(FValue: Boolean); stdcall;
    procedure ShowCheckboxes(FShow: Boolean); stdcall;
    procedure ShowScrollBars(FShow: Boolean); stdcall;
    procedure Sorted(FValue: Boolean); stdcall;
    procedure SetItemIndex(FIndex: Integer); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure AddItem(FItem: TTreeViewItem); stdcall;
    procedure ExpandAll; stdcall;
    procedure CollapseAll; stdcall;
    procedure DeselectAll; stdcall;
    procedure Clear; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsItemChecked(FIndex: Integer): Boolean; stdcall;
    function IsItemSelected(FIndex: Integer): Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetItemIndex: Integer; stdcall;
    function GetIndexOfItem(FItemText: WideString): Integer; stdcall;
    function GetItem(FIndex: Integer): TTreeViewItem; stdcall;
    function GetItemText(FIndex: Integer): WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnChangeCheck(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FImageList
// =============================================================================
type
  FImageList = interface(IUnknown)
    ['{3943EE98-BB04-4582-8ABC-5EA024B03027}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AddImage(const AFileImage: WideString); stdcall;
    procedure AddImageResized(const AFileImage: WideString;
      FWidth, FHeight: Integer); stdcall;
    procedure Clear; stdcall;
    procedure Delete(FIndex: Integer); stdcall;
    procedure Replace(FIndex: Integer; const AFileImage: WideString); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    function Count: Integer; stdcall;
    function GetTag: Integer; stdcall;
    function Handle: TImageList; stdcall;
  end;

  TFImageList = class(TInterfacedObject, FImageList)
  private
    ControlImageList: TImageList;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AddImage(const AFileImage: WideString); stdcall;
    procedure AddImageResized(const AFileImage: WideString;
      FWidth, FHeight: Integer); stdcall;
    procedure Clear; stdcall;
    procedure Delete(FIndex: Integer); stdcall;
    procedure Replace(FIndex: Integer; const AFileImage: WideString); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    function Count: Integer; stdcall;
    function GetTag: Integer; stdcall;
    function Handle: TImageList; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitButtonHandle: FButton; stdcall;
function InitCheckboxHandle: FCheckBox; stdcall;
function InitRadioButtonHandle: FRadioButton; stdcall;
function InitGroupBoxHandle: FGroupBox; stdcall;
function InitPopupBoxHandle: FPopupBox; stdcall;
function InitPanelHandle: FPanel; stdcall;
function InitCalloutPanelHandle: FCalloutPanel; stdcall;
function InitLabelHandle: FLabel; stdcall;
function InitImageControlHandle: FImageControl; stdcall;
function InitProgressBarHandle: FProgressBar; stdcall;
function InitExpanderHandle: FExpander; stdcall;
function InitTrackBarHandle: FTrackBar; stdcall;
function InitSwitchHandle: FSwitch; stdcall;
function InitSplitterHandle: FSplitter; stdcall;
function InitMenuItemHandle: FMenuItem; stdcall;
function InitMenuBarHandle: FMenuBar; stdcall;
function InitStatusBarHandle: FStatusBar; stdcall;
function InitToolBarHandle: FToolBar; stdcall;
function InitSearchBoxHandle: FSearchBox; stdcall;
function InitListBoxGroupFooterHandle: FListBoxGroupFooter; stdcall;
function InitListBoxGroupHeaderHandle: FListBoxGroupHeader; stdcall;
function InitListBoxHeaderHandle: FListBoxHeader; stdcall;
function InitListBoxItemHandle: FListBoxItem; stdcall;
function InitListBoxHandle: FListBox; stdcall;
function InitComboBoxHandle: FComboBox; stdcall;
function InitMemoHandle: FMemo; stdcall;
function InitEditHandle: FEdit; stdcall;
function InitTreeViewItemHandle: FTreeViewItem; stdcall;
function InitTreeViewHandle: FTreeView; stdcall;
function InitImageListHandle: FImageList; stdcall;

implementation

uses
  System.Math,
  Winapi.Windows,
  FMX.BehaviorManager, FMX.Pickers;

// =============================================================================
// FButton
// =============================================================================
procedure TFButton.FCreate(FParent: TFmxObject);
begin
  ControlButton := TButton.Create(nil);
  ControlButton.Parent := TFmxObject(FParent);
  ControlButton.Text := 'Button1';
end;

procedure TFButton.Cursor(FCursor: TCursor);
begin
  ControlButton.Cursor := TCursor(FCursor);
end;

procedure TFButton.Left(FLeft: Single);
begin
  ControlButton.Position.X := FLeft;
end;

procedure TFButton.Top(FTop: Single);
begin
  ControlButton.Position.Y := FTop;
end;

procedure TFButton.Height(FHeight: Single);
begin
  ControlButton.Size.Height := FHeight;
end;

procedure TFButton.Width(FWidth: Single);
begin
  ControlButton.Size.Width := FWidth;
end;

procedure TFButton.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlButton.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFButton.Position(X, Y: Single);
begin
  ControlButton.Position.X := X;
  ControlButton.Position.Y := Y;
end;

procedure TFButton.Align(Al: TAlignLayout);
begin
  ControlButton.Align := TAlignLayout(Al);
end;

procedure TFButton.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlButton.Margins.Left := FLeft;
  ControlButton.Margins.Top := FTop;
  ControlButton.Margins.Right := FRight;
  ControlButton.Margins.Bottom := FBottom;
end;

procedure TFButton.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlButton.Padding.Left := FLeft;
  ControlButton.Padding.Top := FTop;
  ControlButton.Padding.Right := FRight;
  ControlButton.Padding.Bottom := FBottom;
end;

procedure TFButton.SetHint(const FText: WideString);
begin
  ControlButton.ShowHint := True;
  ControlButton.Hint := string(FText);
end;

procedure TFButton.SetClipChildren(FValue: Boolean);
begin
  ControlButton.ClipChildren := FValue;
end;

procedure TFButton.SetClipParent(FValue: Boolean);
begin
  ControlButton.ClipParent := FValue;
end;

procedure TFButton.BringToFront;
begin
  ControlButton.BringToFront;
end;

procedure TFButton.SendToBack;
begin
  ControlButton.SendToBack;
end;

procedure TFButton.SetTag(FTag: Integer);
begin
  ControlButton.Tag := FTag;
end;

procedure TFButton.StayPressed(FValue: Boolean);
begin
  ControlButton.StaysPressed := FValue;
end;

procedure TFButton.Text(const FText: WideString);
begin
  ControlButton.Text := string(FText);
end;

procedure TFButton.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlButton.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFButton.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlButton.StyledSettings := [];

  ControlButton.TextSettings.Font.Family := string(FontName);
  ControlButton.TextSettings.Font.Size := FontSize;
  ControlButton.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFButton.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlButton.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlButton.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlButton.TextSettings.WordWrap := FWordWrap;
end;

procedure TFButton.FontStyle(FStyle: TFontStyles);
begin
  ControlButton.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFButton.Images(FImgList: TImageList);
begin
  ControlButton.Images := TImageList(FImgList);
end;

procedure TFButton.ImageIndex(FIndex: Integer);
begin
  ControlButton.ImageIndex := FIndex;
end;

procedure TFButton.SetFocus;
begin
  ControlButton.SetFocus;
end;

procedure TFButton.CanFocus(FValue: Boolean);
begin
  ControlButton.CanFocus := FValue;
end;

procedure TFButton.TextHorzAlign(FHorzAlign: TTextAlign);
begin
  ControlButton.TextSettings.HorzAlign := FHorzAlign;
end;

procedure TFButton.Opacity(FOpacity: Single);
begin
  ControlButton.Opacity := FOpacity;
end;

procedure TFButton.RotationAngle(FValue: Single);
begin
  ControlButton.RotationAngle := FValue;
end;

procedure TFButton.RotationCenter(X, Y: Single);
begin
  ControlButton.RotationCenter.X := X;
  ControlButton.RotationCenter.Y := Y;
end;

procedure TFButton.Enabled(FEnabled: Boolean);
begin
  ControlButton.Enabled := FEnabled;
end;

procedure TFButton.Visible(FVisible: Boolean);
begin
  ControlButton.Visible := FVisible;
end;

procedure TFButton.HitTest(FEnabled: Boolean);
begin
  ControlButton.HitTest := FEnabled;
end;

procedure TFButton.StyleLookUp(FStyle: WideString);
begin
  ControlButton.StyleLookUp := string(FStyle);
end;

procedure TFButton.ModalResult(FModalResult: TModalResult);
begin
  ControlButton.ModalResult := TModalResult(FModalResult);
end;

function TFButton.GetModalResult: TModalResult;
begin
  Result := ControlButton.ModalResult;
end;

function TFButton.IsPressed: Boolean;
begin
  Result := ControlButton.IsPressed;
end;

function TFButton.IsVisible: Boolean;
begin
  Result := ControlButton.Visible;
end;

function TFButton.GetText: WideString;
begin
  Result := ControlButton.Text
end;

function TFButton.GetTag: Integer;
begin
  Result := ControlButton.Tag;
end;

function TFButton.GetLeft: Single;
begin
  Result := ControlButton.Position.X;
end;

function TFButton.GetTop: Single;
begin
  Result := ControlButton.Position.Y;
end;

function TFButton.GetHeight: Single;
begin
  Result := ControlButton.Size.Height;
end;

function TFButton.GetWidth: Single;
begin
  Result := ControlButton.Size.Width;
end;

function TFButton.GetObject: TFmxObject;
begin
  Result := ControlButton;
end;

procedure TFButton.OnClick(Event: TNotifyEvent);
begin
  ControlButton.OnClick := TNotifyEvent(Event);
end;

procedure TFButton.OnMouseDown(Event: TMouseEvent);
begin
  ControlButton.OnMouseDown := TMouseEvent(Event);
end;

procedure TFButton.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlButton.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFButton.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlButton.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFButton.OnMouseUp(Event: TMouseEvent);
begin
  ControlButton.OnMouseUp := TMouseEvent(Event);
end;

function TFButton.Handle: TFmxObject;
begin
  Result := ControlButton;
end;

// =============================================================================
// FCheckbox
// =============================================================================
procedure TFCheckbox.FCreate(FParent: TFmxObject);
begin
  ControlCheckbox := TCheckBox.Create(nil);
  ControlCheckbox.Parent := TFmxObject(FParent);
  ControlCheckbox.Text := 'CheckBox1';
end;

procedure TFCheckbox.Cursor(FCursor: TCursor);
begin
  ControlCheckbox.Cursor := TCursor(FCursor);
end;

procedure TFCheckbox.Left(FLeft: Single);
begin
  ControlCheckbox.Position.X := FLeft;
end;

procedure TFCheckbox.Top(FTop: Single);
begin
  ControlCheckbox.Position.Y := FTop;
end;

procedure TFCheckbox.Height(FHeight: Single);
begin
  ControlCheckbox.Size.Height := FHeight;
end;

procedure TFCheckbox.Width(FWidth: Single);
begin
  ControlCheckbox.Size.Width := FWidth;
end;

procedure TFCheckbox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlCheckbox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFCheckbox.Position(X, Y: Single);
begin
  ControlCheckbox.Position.X := X;
  ControlCheckbox.Position.Y := Y;
end;

procedure TFCheckbox.Align(Al: TAlignLayout);
begin
  ControlCheckbox.Align := TAlignLayout(Al);
end;

procedure TFCheckbox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCheckbox.Margins.Left := FLeft;
  ControlCheckbox.Margins.Top := FTop;
  ControlCheckbox.Margins.Right := FRight;
  ControlCheckbox.Margins.Bottom := FBottom;
end;

procedure TFCheckbox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCheckbox.Padding.Left := FLeft;
  ControlCheckbox.Padding.Top := FTop;
  ControlCheckbox.Padding.Right := FRight;
  ControlCheckbox.Padding.Bottom := FBottom;
end;

procedure TFCheckbox.SetHint(const FText: WideString);
begin
  ControlCheckbox.ShowHint := True;
  ControlCheckbox.Hint := string(FText);
end;

procedure TFCheckbox.SetClipChildren(FValue: Boolean);
begin
  ControlCheckbox.ClipChildren := FValue;
end;

procedure TFCheckbox.SetClipParent(FValue: Boolean);
begin
  ControlCheckbox.ClipParent := FValue;
end;

procedure TFCheckbox.BringToFront;
begin
  ControlCheckbox.BringToFront;
end;

procedure TFCheckbox.SendToBack;
begin
  ControlCheckbox.SendToBack;
end;

procedure TFCheckbox.SetTag(FTag: Integer);
begin
  ControlCheckbox.Tag := FTag;
end;

procedure TFCheckbox.SetChecked(FChecked: Boolean);
begin
  ControlCheckbox.IsChecked := FChecked;
end;

procedure TFCheckbox.Text(const FText: WideString);
begin
  ControlCheckbox.Text := string(FText);
end;

procedure TFCheckbox.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlCheckbox.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFCheckbox.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlCheckbox.StyledSettings := [];

  ControlCheckbox.TextSettings.Font.Family := string(FontName);
  ControlCheckbox.TextSettings.Font.Size := FontSize;
  ControlCheckbox.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFCheckbox.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlCheckbox.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlCheckbox.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlCheckbox.TextSettings.WordWrap := FWordWrap;
end;

procedure TFCheckbox.FontStyle(FStyle: TFontStyles);
begin
  ControlCheckbox.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFCheckbox.Opacity(FOpacity: Single);
begin
  ControlCheckbox.Opacity := FOpacity;
end;

procedure TFCheckbox.RotationAngle(FValue: Single);
begin
  ControlCheckbox.RotationAngle := FValue;
end;

procedure TFCheckbox.RotationCenter(X, Y: Single);
begin
  ControlCheckbox.RotationCenter.X := X;
  ControlCheckbox.RotationCenter.Y := Y;
end;

procedure TFCheckbox.Enabled(FEnabled: Boolean);
begin
  ControlCheckbox.Enabled := FEnabled;
end;

procedure TFCheckbox.Visible(FVisible: Boolean);
begin
  ControlCheckbox.Visible := FVisible;
end;

procedure TFCheckbox.HitTest(FEnabled: Boolean);
begin
  ControlCheckbox.HitTest := FEnabled;
end;

procedure TFCheckbox.StyleLookUp(FStyle: WideString);
begin
  ControlCheckbox.StyleLookUp := string(FStyle);
end;

function TFCheckbox.IsChecked: Boolean;
begin
  Result := ControlCheckbox.IsChecked;
end;

function TFCheckbox.IsVisible: Boolean;
begin
  Result := ControlCheckbox.Visible;
end;

function TFCheckbox.GetText: WideString;
begin
  Result := ControlCheckbox.Text;
end;

function TFCheckbox.GetTag: Integer;
begin
  Result := ControlCheckbox.Tag;
end;

function TFCheckbox.GetLeft: Single;
begin
  Result := ControlCheckbox.Position.X;
end;

function TFCheckbox.GetTop: Single;
begin
  Result := ControlCheckbox.Position.Y;
end;

function TFCheckbox.GetHeight: Single;
begin
  Result := ControlCheckbox.Size.Height;
end;

function TFCheckbox.GetWidth: Single;
begin
  Result := ControlCheckbox.Size.Width;
end;

function TFCheckbox.GetObject: TFmxObject;
begin
  Result := ControlCheckbox;
end;

procedure TFCheckbox.OnChange(Event: TNotifyEvent);
begin
  ControlCheckbox.OnChange := TNotifyEvent(Event);
end;

procedure TFCheckbox.OnClick(Event: TNotifyEvent);
begin
  ControlCheckbox.OnClick := TNotifyEvent(Event);
end;

procedure TFCheckbox.OnMouseDown(Event: TMouseEvent);
begin
  ControlCheckbox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFCheckbox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlCheckbox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFCheckbox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlCheckbox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFCheckbox.OnMouseUp(Event: TMouseEvent);
begin
  ControlCheckbox.OnMouseUp := TMouseEvent(Event);
end;

function TFCheckbox.Handle: TFmxObject;
begin
  Result := ControlCheckbox;
end;

// =============================================================================
// FRadioButton
// =============================================================================
procedure TFRadioButton.FCreate(FParent: TFmxObject);
begin
  ControlRadioButton := TRadioButton.Create(nil);
  ControlRadioButton.Parent := TFmxObject(FParent);
  ControlRadioButton.Text := 'RadioButton1';
end;

procedure TFRadioButton.Cursor(FCursor: TCursor);
begin
  ControlRadioButton.Cursor := TCursor(FCursor);
end;

procedure TFRadioButton.Left(FLeft: Single);
begin
  ControlRadioButton.Position.X := FLeft;
end;

procedure TFRadioButton.Top(FTop: Single);
begin
  ControlRadioButton.Position.Y := FTop;
end;

procedure TFRadioButton.Height(FHeight: Single);
begin
  ControlRadioButton.Size.Height := FHeight;
end;

procedure TFRadioButton.Width(FWidth: Single);
begin
  ControlRadioButton.Size.Width := FWidth;
end;

procedure TFRadioButton.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlRadioButton.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRadioButton.Position(X, Y: Single);
begin
  ControlRadioButton.Position.X := X;
  ControlRadioButton.Position.Y := Y;
end;

procedure TFRadioButton.Align(Al: TAlignLayout);
begin
  ControlRadioButton.Align := TAlignLayout(Al);
end;

procedure TFRadioButton.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadioButton.Margins.Left := FLeft;
  ControlRadioButton.Margins.Top := FTop;
  ControlRadioButton.Margins.Right := FRight;
  ControlRadioButton.Margins.Bottom := FBottom;
end;

procedure TFRadioButton.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlRadioButton.Padding.Left := FLeft;
  ControlRadioButton.Padding.Top := FTop;
  ControlRadioButton.Padding.Right := FRight;
  ControlRadioButton.Padding.Bottom := FBottom;
end;

procedure TFRadioButton.SetHint(const FText: WideString);
begin
  ControlRadioButton.ShowHint := True;
  ControlRadioButton.Hint := string(FText);
end;

procedure TFRadioButton.SetClipChildren(FValue: Boolean);
begin
  ControlRadioButton.ClipChildren := FValue;
end;

procedure TFRadioButton.SetClipParent(FValue: Boolean);
begin
  ControlRadioButton.ClipParent := FValue;
end;

procedure TFRadioButton.BringToFront;
begin
  ControlRadioButton.BringToFront;
end;

procedure TFRadioButton.SendToBack;
begin
  ControlRadioButton.SendToBack;
end;

procedure TFRadioButton.SetTag(FTag: Integer);
begin
  ControlRadioButton.Tag := FTag;
end;

procedure TFRadioButton.SetChecked(FChecked: Boolean);
begin
  ControlRadioButton.IsChecked := FChecked;
end;

procedure TFRadioButton.Text(const FText: WideString);
begin
  ControlRadioButton.Text := string(FText);
end;

procedure TFRadioButton.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlRadioButton.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFRadioButton.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlRadioButton.StyledSettings := [];
  ControlRadioButton.TextSettings.Font.Family := string(FontName);
  ControlRadioButton.TextSettings.Font.Size := FontSize;
  ControlRadioButton.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFRadioButton.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlRadioButton.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlRadioButton.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlRadioButton.TextSettings.WordWrap := FWordWrap;
end;

procedure TFRadioButton.FontStyle(FStyle: TFontStyles);
begin
  ControlRadioButton.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFRadioButton.FontColor(FColor: TAlphaColor);
begin
  ControlRadioButton.TextSettings.FontColor := TAlphaColor(FColor);
end;

procedure TFRadioButton.GroupName(const FGroupName: WideString);
begin
  ControlRadioButton.GroupName := string(FGroupName);
end;

procedure TFRadioButton.SetFocus;
begin
  ControlRadioButton.SetFocus;
end;

procedure TFRadioButton.CanFocus(FValue: Boolean);
begin
  ControlRadioButton.CanFocus := FValue;
end;

procedure TFRadioButton.Opacity(FOpacity: Single);
begin
  ControlRadioButton.Opacity := FOpacity;
end;

procedure TFRadioButton.RotationAngle(FValue: Single);
begin
  ControlRadioButton.RotationAngle := FValue;
end;

procedure TFRadioButton.RotationCenter(X, Y: Single);
begin
  ControlRadioButton.RotationCenter.X := X;
  ControlRadioButton.RotationCenter.Y := Y;
end;

procedure TFRadioButton.Enabled(FEnabled: Boolean);
begin
  ControlRadioButton.Enabled := FEnabled;
end;

procedure TFRadioButton.Visible(FVisible: Boolean);
begin
  ControlRadioButton.Visible := FVisible;
end;

procedure TFRadioButton.HitTest(FEnabled: Boolean);
begin
  ControlRadioButton.HitTest := FEnabled;
end;

procedure TFRadioButton.StyleLookUp(FStyle: WideString);
begin
  ControlRadioButton.StyleLookUp := string(FStyle);
end;

function TFRadioButton.IsChecked: Boolean;
begin
  Result := ControlRadioButton.IsChecked;
end;

function TFRadioButton.IsVisible: Boolean;
begin
  Result := ControlRadioButton.Visible;
end;

function TFRadioButton.GetText: WideString;
begin
  Result := ControlRadioButton.Text;
end;

function TFRadioButton.GetTag: Integer;
begin
  Result := ControlRadioButton.Tag;
end;

function TFRadioButton.GetLeft: Single;
begin
  Result := ControlRadioButton.Position.X;
end;

function TFRadioButton.GetTop: Single;
begin
  Result := ControlRadioButton.Position.Y;
end;

function TFRadioButton.GetHeight: Single;
begin
  Result := ControlRadioButton.Size.Height;
end;

function TFRadioButton.GetWidth: Single;
begin
  Result := ControlRadioButton.Size.Width;
end;

function TFRadioButton.GetObject: TFmxObject;
begin
  Result := ControlRadioButton;
end;

procedure TFRadioButton.OnChange(Event: TNotifyEvent);
begin
  ControlRadioButton.OnChange := TNotifyEvent(Event);
end;

procedure TFRadioButton.OnClick(Event: TNotifyEvent);
begin
  ControlRadioButton.OnClick := TNotifyEvent(Event);
end;

procedure TFRadioButton.OnMouseDown(Event: TMouseEvent);
begin
  ControlRadioButton.OnMouseDown := TMouseEvent(Event);
end;

procedure TFRadioButton.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRadioButton.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFRadioButton.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRadioButton.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFRadioButton.OnMouseUp(Event: TMouseEvent);
begin
  ControlRadioButton.OnMouseUp := TMouseEvent(Event);
end;

function TFRadioButton.Handle: TFmxObject;
begin
  Result := ControlRadioButton;
end;

// =============================================================================
// FGroupBox
// =============================================================================
procedure TFGroupBox.FCreate(FParent: TFmxObject);
begin
  ControlGroupBox := TGroupBox.Create(nil);
  ControlGroupBox.Parent := TFmxObject(FParent);
  ControlGroupBox.Text := 'GroupBox1';
end;

procedure TFGroupBox.Cursor(FCursor: TCursor);
begin
  ControlGroupBox.Cursor := TCursor(FCursor);
end;

procedure TFGroupBox.Left(FLeft: Single);
begin
  ControlGroupBox.Position.X := FLeft;
end;

procedure TFGroupBox.Top(FTop: Single);
begin
  ControlGroupBox.Position.Y := FTop;
end;

procedure TFGroupBox.Height(FHeight: Single);
begin
  ControlGroupBox.Size.Height := FHeight;
end;

procedure TFGroupBox.Width(FWidth: Single);
begin
  ControlGroupBox.Size.Width := FWidth;
end;

procedure TFGroupBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlGroupBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFGroupBox.Position(X, Y: Single);
begin
  ControlGroupBox.Position.X := X;
  ControlGroupBox.Position.Y := Y;
end;

procedure TFGroupBox.Align(Al: TAlignLayout);
begin
  ControlGroupBox.Align := TAlignLayout(Al);
end;

procedure TFGroupBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGroupBox.Margins.Left := FLeft;
  ControlGroupBox.Margins.Top := FTop;
  ControlGroupBox.Margins.Right := FRight;
  ControlGroupBox.Margins.Bottom := FBottom;
end;

procedure TFGroupBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGroupBox.Padding.Left := FLeft;
  ControlGroupBox.Padding.Top := FTop;
  ControlGroupBox.Padding.Right := FRight;
  ControlGroupBox.Padding.Bottom := FBottom;
end;

procedure TFGroupBox.SetHint(const FText: WideString);
begin
  ControlGroupBox.ShowHint := True;
  ControlGroupBox.Hint := string(FText);
end;

procedure TFGroupBox.SetClipChildren(FValue: Boolean);
begin
  ControlGroupBox.ClipChildren := FValue;
end;

procedure TFGroupBox.SetClipParent(FValue: Boolean);
begin
  ControlGroupBox.ClipParent := FValue;
end;

procedure TFGroupBox.BringToFront;
begin
  ControlGroupBox.BringToFront;
end;

procedure TFGroupBox.SendToBack;
begin
  ControlGroupBox.SendToBack;
end;

procedure TFGroupBox.SetTag(FTag: Integer);
begin
  ControlGroupBox.Tag := FTag;
end;

procedure TFGroupBox.Text(const FText: WideString);
begin
  ControlGroupBox.Text := string(FText);
end;

procedure TFGroupBox.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlGroupBox.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFGroupBox.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlGroupBox.StyledSettings := [];

  ControlGroupBox.TextSettings.Font.Family := string(FontName);
  ControlGroupBox.TextSettings.Font.Size := FontSize;
  ControlGroupBox.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFGroupBox.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlGroupBox.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlGroupBox.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlGroupBox.TextSettings.WordWrap := FWordWrap;
end;

procedure TFGroupBox.FontStyle(FStyle: TFontStyles);
begin
  ControlGroupBox.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFGroupBox.Opacity(FOpacity: Single);
begin
  ControlGroupBox.Opacity := FOpacity;
end;

procedure TFGroupBox.RotationAngle(FValue: Single);
begin
  ControlGroupBox.RotationAngle := FValue;
end;

procedure TFGroupBox.RotationCenter(X, Y: Single);
begin
  ControlGroupBox.RotationCenter.X := X;
  ControlGroupBox.RotationCenter.Y := Y;
end;

procedure TFGroupBox.Enabled(FEnabled: Boolean);
begin
  ControlGroupBox.Enabled := FEnabled;
end;

procedure TFGroupBox.Visible(FVisible: Boolean);
begin
  ControlGroupBox.Visible := FVisible;
end;

procedure TFGroupBox.HitTest(FEnabled: Boolean);
begin
  ControlGroupBox.HitTest := FEnabled;
end;

procedure TFGroupBox.StyleLookUp(FStyle: WideString);
begin
  ControlGroupBox.StyleLookUp := string(FStyle);
end;

function TFGroupBox.IsVisible: Boolean;
begin
  Result := ControlGroupBox.Visible;
end;

function TFGroupBox.GetTag: Integer;
begin
  Result := ControlGroupBox.Tag;
end;

function TFGroupBox.GetLeft: Single;
begin
  Result := ControlGroupBox.Position.X;
end;

function TFGroupBox.GetTop: Single;
begin
  Result := ControlGroupBox.Position.Y;
end;

function TFGroupBox.GetHeight: Single;
begin
  Result := ControlGroupBox.Size.Height;
end;

function TFGroupBox.GetWidth: Single;
begin
  Result := ControlGroupBox.Size.Width;
end;

function TFGroupBox.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlGroupBox);
end;

procedure TFGroupBox.OnClick(Event: TNotifyEvent);
begin
  ControlGroupBox.OnClick := TNotifyEvent(Event);
end;

procedure TFGroupBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlGroupBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFGroupBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlGroupBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFGroupBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlGroupBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFGroupBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlGroupBox.OnMouseUp := TMouseEvent(Event);
end;

function TFGroupBox.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlGroupBox);
end;

// =============================================================================
// FPopupBox
// =============================================================================
procedure TFPopupBox.FCreate(FParent: TFmxObject);
begin
  ControlPopupBox := TPopupBox.Create(nil);
  ControlPopupBox.Parent := TFmxObject(FParent);
end;

procedure TFPopupBox.Cursor(FCursor: TCursor);
begin
  ControlPopupBox.Cursor := TCursor(FCursor);
end;

procedure TFPopupBox.Left(FLeft: Single);
begin
  ControlPopupBox.Position.X := FLeft;
end;

procedure TFPopupBox.Top(FTop: Single);
begin
  ControlPopupBox.Position.Y := FTop;
end;

procedure TFPopupBox.Height(FHeight: Single);
begin
  ControlPopupBox.Size.Height := FHeight;
end;

procedure TFPopupBox.Width(FWidth: Single);
begin
  ControlPopupBox.Size.Width := FWidth;
end;

procedure TFPopupBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlPopupBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFPopupBox.Position(X, Y: Single);
begin
  ControlPopupBox.Position.X := X;
  ControlPopupBox.Position.Y := Y;
end;

procedure TFPopupBox.Align(Al: TAlignLayout);
begin
  ControlPopupBox.Align := TAlignLayout(Al);
end;

procedure TFPopupBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPopupBox.Margins.Left := FLeft;
  ControlPopupBox.Margins.Top := FTop;
  ControlPopupBox.Margins.Right := FRight;
  ControlPopupBox.Margins.Bottom := FBottom;
end;

procedure TFPopupBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPopupBox.Padding.Left := FLeft;
  ControlPopupBox.Padding.Top := FTop;
  ControlPopupBox.Padding.Right := FRight;
  ControlPopupBox.Padding.Bottom := FBottom;
end;

procedure TFPopupBox.SetHint(const FText: WideString);
begin
  ControlPopupBox.ShowHint := True;
  ControlPopupBox.Hint := string(FText);
end;

procedure TFPopupBox.SetClipChildren(FValue: Boolean);
begin
  ControlPopupBox.ClipChildren := FValue;
end;

procedure TFPopupBox.SetClipParent(FValue: Boolean);
begin
  ControlPopupBox.ClipParent := FValue;
end;

procedure TFPopupBox.BringToFront;
begin
  ControlPopupBox.BringToFront;
end;

procedure TFPopupBox.SendToBack;
begin
  ControlPopupBox.SendToBack;
end;

procedure TFPopupBox.SetTag(FTag: Integer);
begin
  ControlPopupBox.Tag := FTag;
end;

procedure TFPopupBox.DisableDisappear(FDisable: Boolean);
begin
  ControlPopupBox.DisableDisappear := FDisable;
end;

procedure TFPopupBox.ItemsAdd(const NameStr: WideString);
begin
  ControlPopupBox.Items.Add(string(NameStr));
end;

procedure TFPopupBox.ItemsAddPair(const NameStr, ValueStr: WideString);
begin
  ControlPopupBox.Items.AddPair(string(NameStr), string(ValueStr));
end;

procedure TFPopupBox.ItemSetIndex(FIndex: Integer);
begin
  ControlPopupBox.ItemIndex := FIndex;
end;

procedure TFPopupBox.Index(FValue: Integer);
begin
  ControlPopupBox.Index := FValue;
end;

procedure TFPopupBox.Clear;
begin
  ControlPopupBox.Clear;
end;

procedure TFPopupBox.StaysPressed(FEnabled: Boolean);
begin
  ControlPopupBox.StaysPressed := FEnabled;
end;

procedure TFPopupBox.Pressed(FValue: Boolean);
begin
  ControlPopupBox.Pressed := FValue;
end;

procedure TFPopupBox.Text(const FText: WideString);
begin
  ControlPopupBox.Text := string(FText);
end;

procedure TFPopupBox.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlPopupBox.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFPopupBox.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlPopupBox.StyledSettings := [];

  ControlPopupBox.TextSettings.Font.Family := string(FontName);
  ControlPopupBox.TextSettings.Font.Size := FontSize;
  ControlPopupBox.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFPopupBox.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlPopupBox.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlPopupBox.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlPopupBox.TextSettings.WordWrap := FWordWrap;
end;

procedure TFPopupBox.FontStyle(FStyle: TFontStyles);
begin
  ControlPopupBox.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFPopupBox.Opacity(FOpacity: Single);
begin
  ControlPopupBox.Opacity := FOpacity;
end;

procedure TFPopupBox.RotationAngle(FValue: Single);
begin
  ControlPopupBox.RotationAngle := FValue;
end;

procedure TFPopupBox.RotationCenter(X, Y: Single);
begin
  ControlPopupBox.RotationCenter.X := X;
  ControlPopupBox.RotationCenter.Y := Y;
end;

procedure TFPopupBox.Enabled(FEnabled: Boolean);
begin
  ControlPopupBox.Enabled := FEnabled;
end;

procedure TFPopupBox.Visible(FVisible: Boolean);
begin
  ControlPopupBox.Visible := FVisible;
end;

procedure TFPopupBox.HitTest(FEnabled: Boolean);
begin
  ControlPopupBox.HitTest := FEnabled;
end;

procedure TFPopupBox.StyleLookUp(FStyle: WideString);
begin
  ControlPopupBox.StyleLookUp := string(FStyle);
end;

function TFPopupBox.IsPressed: Boolean;
begin
  Result := ControlPopupBox.IsPressed;
end;

function TFPopupBox.IsVisible: Boolean;
begin
  Result := ControlPopupBox.Visible;
end;

function TFPopupBox.GetItemIndex: Integer;
begin
  Result := ControlPopupBox.ItemIndex;
end;

function TFPopupBox.GetIndex: Integer;
begin
  Result := ControlPopupBox.Index;
end;

function TFPopupBox.GetTag: Integer;
begin
  Result := ControlPopupBox.Tag;
end;

function TFPopupBox.GetLeft: Single;
begin
  Result := ControlPopupBox.Position.X;
end;

function TFPopupBox.GetTop: Single;
begin
  Result := ControlPopupBox.Position.Y;
end;

function TFPopupBox.GetHeight: Single;
begin
  Result := ControlPopupBox.Size.Height;
end;

function TFPopupBox.GetWidth: Single;
begin
  Result := ControlPopupBox.Size.Width;
end;

function TFPopupBox.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlPopupBox);
end;

procedure TFPopupBox.OnChange(Event: TNotifyEvent);
begin
  ControlPopupBox.OnChange := TNotifyEvent(Event);
end;

procedure TFPopupBox.OnClick(Event: TNotifyEvent);
begin
  ControlPopupBox.OnClick := TNotifyEvent(Event);
end;

procedure TFPopupBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlPopupBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFPopupBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlPopupBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFPopupBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlPopupBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFPopupBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlPopupBox.OnMouseUp := TMouseEvent(Event);
end;

function TFPopupBox.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlPopupBox);
end;

// =============================================================================
// FPanel
// =============================================================================
procedure TFPanel.FCreate(FParent: TFmxObject);
begin
  ControlPanel := TPanel.Create(nil);
  ControlPanel.Parent := TFmxObject(FParent);
end;

procedure TFPanel.Cursor(FCursor: TCursor);
begin
  ControlPanel.Cursor := TCursor(FCursor);
end;

procedure TFPanel.Left(FLeft: Single);
begin
  ControlPanel.Position.X := FLeft;
end;

procedure TFPanel.Top(FTop: Single);
begin
  ControlPanel.Position.Y := FTop;
end;

procedure TFPanel.Height(FHeight: Single);
begin
  ControlPanel.Size.Height := FHeight;
end;

procedure TFPanel.Width(FWidth: Single);
begin
  ControlPanel.Size.Width := FWidth;
end;

procedure TFPanel.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlPanel.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFPanel.Position(X, Y: Single);
begin
  ControlPanel.Position.X := X;
  ControlPanel.Position.Y := Y;
end;

procedure TFPanel.Align(Al: TAlignLayout);
begin
  ControlPanel.Align := TAlignLayout(Al);
end;

procedure TFPanel.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPanel.Margins.Left := FLeft;
  ControlPanel.Margins.Top := FTop;
  ControlPanel.Margins.Right := FRight;
  ControlPanel.Margins.Bottom := FBottom;
end;

procedure TFPanel.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPanel.Padding.Left := FLeft;
  ControlPanel.Padding.Top := FTop;
  ControlPanel.Padding.Right := FRight;
  ControlPanel.Padding.Bottom := FBottom;
end;

procedure TFPanel.SetHint(const FText: WideString);
begin
  ControlPanel.ShowHint := True;
  ControlPanel.Hint := string(FText);
end;

procedure TFPanel.SetClipChildren(FValue: Boolean);
begin
  ControlPanel.ClipChildren := FValue;
end;

procedure TFPanel.SetClipParent(FValue: Boolean);
begin
  ControlPanel.ClipParent := FValue;
end;

procedure TFPanel.BringToFront;
begin
  ControlPanel.BringToFront;
end;

procedure TFPanel.SendToBack;
begin
  ControlPanel.SendToBack;
end;

procedure TFPanel.SetTag(FTag: Integer);
begin
  ControlPanel.Tag := FTag;
end;

procedure TFPanel.Opacity(FOpacity: Single);
begin
  ControlPanel.Opacity := FOpacity;
end;

procedure TFPanel.RotationAngle(FValue: Single);
begin
  ControlPanel.RotationAngle := FValue;
end;

procedure TFPanel.RotationCenter(X, Y: Single);
begin
  ControlPanel.RotationCenter.X := X;
  ControlPanel.RotationCenter.Y := Y;
end;

procedure TFPanel.Enabled(FEnabled: Boolean);
begin
  ControlPanel.Enabled := FEnabled;
end;

procedure TFPanel.Visible(FVisible: Boolean);
begin
  ControlPanel.Visible := FVisible;
end;

procedure TFPanel.HitTest(FEnabled: Boolean);
begin
  ControlPanel.HitTest := FEnabled;
end;

procedure TFPanel.StyleLookUp(FStyle: WideString);
begin
  ControlPanel.StyleLookUp := string(FStyle);
end;

function TFPanel.IsVisible: Boolean;
begin
  Result := ControlPanel.Visible;
end;

function TFPanel.GetTag: Integer;
begin
  Result := ControlPanel.Tag;
end;

function TFPanel.GetLeft: Single;
begin
  Result := ControlPanel.Position.X;
end;

function TFPanel.GetTop: Single;
begin
  Result := ControlPanel.Position.Y;
end;

function TFPanel.GetHeight: Single;
begin
  Result := ControlPanel.Size.Height;
end;

function TFPanel.GetWidth: Single;
begin
  Result := ControlPanel.Size.Width;
end;

function TFPanel.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlPanel);
end;

procedure TFPanel.OnClick(Event: TNotifyEvent);
begin
  ControlPanel.OnClick := TNotifyEvent(Event);
end;

procedure TFPanel.OnMouseDown(Event: TMouseEvent);
begin
  ControlPanel.OnMouseDown := TMouseEvent(Event);
end;

procedure TFPanel.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlPanel.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFPanel.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlPanel.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFPanel.OnMouseUp(Event: TMouseEvent);
begin
  ControlPanel.OnMouseUp := TMouseEvent(Event);
end;

function TFPanel.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlPanel);
end;

// =============================================================================
// FCalloutPanel
// =============================================================================
procedure TFCalloutPanel.FCreate(FParent: TFmxObject);
begin
  ControlCalloutPanel := TCalloutPanel.Create(nil);
  ControlCalloutPanel.Parent := TFmxObject(FParent);
end;

procedure TFCalloutPanel.Cursor(FCursor: TCursor);
begin
  ControlCalloutPanel.Cursor := TCursor(FCursor);
end;

procedure TFCalloutPanel.Left(FLeft: Single);
begin
  ControlCalloutPanel.Position.X := FLeft;
end;

procedure TFCalloutPanel.Top(FTop: Single);
begin
  ControlCalloutPanel.Position.Y := FTop;
end;

procedure TFCalloutPanel.Height(FHeight: Single);
begin
  ControlCalloutPanel.Size.Height := FHeight;
end;

procedure TFCalloutPanel.Width(FWidth: Single);
begin
  ControlCalloutPanel.Size.Width := FWidth;
end;

procedure TFCalloutPanel.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlCalloutPanel.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFCalloutPanel.Position(X, Y: Single);
begin
  ControlCalloutPanel.Position.X := X;
  ControlCalloutPanel.Position.Y := Y;
end;

procedure TFCalloutPanel.Align(Al: TAlignLayout);
begin
  ControlCalloutPanel.Align := TAlignLayout(Al);
end;

procedure TFCalloutPanel.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCalloutPanel.Margins.Left := FLeft;
  ControlCalloutPanel.Margins.Top := FTop;
  ControlCalloutPanel.Margins.Right := FRight;
  ControlCalloutPanel.Margins.Bottom := FBottom;
end;

procedure TFCalloutPanel.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlCalloutPanel.Padding.Left := FLeft;
  ControlCalloutPanel.Padding.Top := FTop;
  ControlCalloutPanel.Padding.Right := FRight;
  ControlCalloutPanel.Padding.Bottom := FBottom;
end;

procedure TFCalloutPanel.SetHint(const FText: WideString);
begin
  ControlCalloutPanel.ShowHint := True;
  ControlCalloutPanel.Hint := string(FText);
end;

procedure TFCalloutPanel.SetClipChildren(FValue: Boolean);
begin
  ControlCalloutPanel.ClipChildren := FValue;
end;

procedure TFCalloutPanel.SetClipParent(FValue: Boolean);
begin
  ControlCalloutPanel.ClipParent := FValue;
end;

procedure TFCalloutPanel.BringToFront;
begin
  ControlCalloutPanel.BringToFront;
end;

procedure TFCalloutPanel.SendToBack;
begin
  ControlCalloutPanel.SendToBack;
end;

procedure TFCalloutPanel.SetTag(FTag: Integer);
begin
  ControlCalloutPanel.Tag := FTag;
end;

procedure TFCalloutPanel.CalloutLength(FLength: Single);
begin
  ControlCalloutPanel.CalloutLength := FLength;
end;

procedure TFCalloutPanel.CalloutOffset(FOffset: Single);
begin
  ControlCalloutPanel.CalloutOffset := FOffset;
end;

procedure TFCalloutPanel.CalloutPosition(FPosition: TCalloutPosition);
begin
  ControlCalloutPanel.CalloutPosition := TCalloutPosition(FPosition);
end;

procedure TFCalloutPanel.CalloutWidth(FWidth: Single);
begin
  ControlCalloutPanel.CalloutWidth := FWidth;
end;

procedure TFCalloutPanel.Opacity(FOpacity: Single);
begin
  ControlCalloutPanel.Opacity := FOpacity;
end;

procedure TFCalloutPanel.RotationAngle(FValue: Single);
begin
  ControlCalloutPanel.RotationAngle := FValue;
end;

procedure TFCalloutPanel.RotationCenter(X, Y: Single);
begin
  ControlCalloutPanel.RotationCenter.X := X;
  ControlCalloutPanel.RotationCenter.Y := Y;
end;

procedure TFCalloutPanel.Enabled(FEnabled: Boolean);
begin
  ControlCalloutPanel.Enabled := FEnabled;
end;

procedure TFCalloutPanel.Visible(FVisible: Boolean);
begin
  ControlCalloutPanel.Visible := FVisible;
end;

procedure TFCalloutPanel.HitTest(FEnabled: Boolean);
begin
  ControlCalloutPanel.HitTest := FEnabled;
end;

function TFCalloutPanel.IsVisible: Boolean;
begin
  Result := ControlCalloutPanel.Visible;
end;

function TFCalloutPanel.GetTag: Integer;
begin
  Result := ControlCalloutPanel.Tag;
end;

function TFCalloutPanel.GetLeft: Single;
begin
  Result := ControlCalloutPanel.Position.X;
end;

function TFCalloutPanel.GetTop: Single;
begin
  Result := ControlCalloutPanel.Position.Y;
end;

function TFCalloutPanel.GetHeight: Single;
begin
  Result := ControlCalloutPanel.Size.Height;
end;

function TFCalloutPanel.GetWidth: Single;
begin
  Result := ControlCalloutPanel.Size.Width;
end;

function TFCalloutPanel.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlCalloutPanel);
end;

procedure TFCalloutPanel.OnClick(Event: TNotifyEvent);
begin
  ControlCalloutPanel.OnClick := TNotifyEvent(Event);
end;

procedure TFCalloutPanel.OnMouseDown(Event: TMouseEvent);
begin
  ControlCalloutPanel.OnMouseDown := TMouseEvent(Event);
end;

procedure TFCalloutPanel.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlCalloutPanel.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFCalloutPanel.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlCalloutPanel.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFCalloutPanel.OnMouseUp(Event: TMouseEvent);
begin
  ControlCalloutPanel.OnMouseUp := TMouseEvent(Event);
end;

function TFCalloutPanel.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlCalloutPanel);
end;

// =============================================================================
// FLabel
// =============================================================================
procedure TFLabel.FCreate(FParent: TFmxObject);
begin
  ControlLabel := TLabel.Create(nil);
  ControlLabel.Parent := TFmxObject(FParent);
  ControlLabel.Text := 'Label1';
end;

procedure TFLabel.Cursor(FCursor: TCursor);
begin
  ControlLabel.Cursor := TCursor(FCursor);
end;

procedure TFLabel.Left(FLeft: Single);
begin
  ControlLabel.Position.X := FLeft;
end;

procedure TFLabel.Top(FTop: Single);
begin
  ControlLabel.Position.Y := FTop;
end;

procedure TFLabel.Height(FHeight: Single);
begin
  ControlLabel.Size.Height := FHeight;
end;

procedure TFLabel.Width(FWidth: Single);
begin
  ControlLabel.Size.Width := FWidth;
end;

procedure TFLabel.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlLabel.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFLabel.Position(X, Y: Single);
begin
  ControlLabel.Position.X := X;
  ControlLabel.Position.Y := Y;
end;

procedure TFLabel.Align(Al: TAlignLayout);
begin
  ControlLabel.Align := TAlignLayout(Al);
end;

procedure TFLabel.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLabel.Margins.Left := FLeft;
  ControlLabel.Margins.Top := FTop;
  ControlLabel.Margins.Right := FRight;
  ControlLabel.Margins.Bottom := FBottom;
end;

procedure TFLabel.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLabel.Padding.Left := FLeft;
  ControlLabel.Padding.Top := FTop;
  ControlLabel.Padding.Right := FRight;
  ControlLabel.Padding.Bottom := FBottom;
end;

procedure TFLabel.SetHint(const FText: WideString);
begin
  ControlLabel.ShowHint := True;
  ControlLabel.Hint := string(FText);
end;

procedure TFLabel.SetClipChildren(FValue: Boolean);
begin
  ControlLabel.ClipChildren := FValue;
end;

procedure TFLabel.SetClipParent(FValue: Boolean);
begin
  ControlLabel.ClipParent := FValue;
end;

procedure TFLabel.BringToFront;
begin
  ControlLabel.BringToFront;
end;

procedure TFLabel.SendToBack;
begin
  ControlLabel.SendToBack;
end;

procedure TFLabel.SetTag(FTag: Integer);
begin
  ControlLabel.Tag := FTag;
end;

procedure TFLabel.AutoSize(FAutoSize: Boolean);
begin
  ControlLabel.AutoSize := FAutoSize;
end;

procedure TFLabel.Text(const FText: WideString);
begin
  ControlLabel.Text := string(FText);
end;

procedure TFLabel.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlLabel.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFLabel.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlLabel.StyledSettings := [];

  ControlLabel.TextSettings.Font.Family := string(FontName);
  ControlLabel.TextSettings.Font.Size := FontSize;
  ControlLabel.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFLabel.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlLabel.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlLabel.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlLabel.TextSettings.WordWrap := FWordWrap;
end;

procedure TFLabel.Trimming(FTrimming: TTextTrimming);
begin
  ControlLabel.TextSettings.Trimming := TTextTrimming(FTrimming);
end;

procedure TFLabel.FontStyle(FStyle: TFontStyles);
begin
  ControlLabel.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFLabel.Color(FontColor: TAlphaColor);
begin
  ControlLabel.FontColor := TAlphaColor(FontColor);
end;

procedure TFLabel.Opacity(FOpacity: Single);
begin
  ControlLabel.Opacity := FOpacity;
end;

procedure TFLabel.RotationAngle(FValue: Single);
begin
  ControlLabel.RotationAngle := FValue;
end;

procedure TFLabel.RotationCenter(X, Y: Single);
begin
  ControlLabel.RotationCenter.X := X;
  ControlLabel.RotationCenter.Y := Y;
end;

procedure TFLabel.Enabled(FEnabled: Boolean);
begin
  ControlLabel.Enabled := FEnabled;
end;

procedure TFLabel.Visible(FVisible: Boolean);
begin
  ControlLabel.Visible := FVisible;
end;

procedure TFLabel.HitTest(FEnabled: Boolean);
begin
  ControlLabel.HitTest := FEnabled;
end;

procedure TFLabel.StyleLookUp(FStyle: WideString);
begin
  ControlLabel.StyleLookUp := string(FStyle);
end;

function TFLabel.IsVisible: Boolean;
begin
  Result := ControlLabel.Visible;
end;

function TFLabel.GetText: WideString;
begin
  Result := ControlLabel.Text
end;

function TFLabel.GetFontColor: TAlphaColor;
begin
  Result := ControlLabel.TextSettings.FontColor;
end;

function TFLabel.GetTag: Integer;
begin
  Result := ControlLabel.Tag;
end;

function TFLabel.GetLeft: Single;
begin
  Result := ControlLabel.Position.X;
end;

function TFLabel.GetTop: Single;
begin
  Result := ControlLabel.Position.Y;
end;

function TFLabel.GetHeight: Single;
begin
  Result := ControlLabel.Size.Height;
end;

function TFLabel.GetWidth: Single;
begin
  Result := ControlLabel.Size.Width;
end;

function TFLabel.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlLabel);
end;

procedure TFLabel.OnClick(Event: TNotifyEvent);
begin
  ControlLabel.OnClick := TNotifyEvent(Event);
end;

procedure TFLabel.OnMouseDown(Event: TMouseEvent);
begin
  ControlLabel.OnMouseDown := TMouseEvent(Event);
end;

procedure TFLabel.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlLabel.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFLabel.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlLabel.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFLabel.OnMouseUp(Event: TMouseEvent);
begin
  ControlLabel.OnMouseUp := TMouseEvent(Event);
end;

function TFLabel.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlLabel);
end;

// =============================================================================
// FImageControl
// =============================================================================
procedure TFImageControl.FCreate(FParent: TFmxObject);
begin
  ControlImageCtrl := TImageControl.Create(nil);
  ControlImageCtrl.Parent := TFmxObject(FParent);
end;

procedure TFImageControl.Cursor(FCursor: TCursor);
begin
  ControlImageCtrl.Cursor := TCursor(FCursor);
end;

procedure TFImageControl.Left(FLeft: Single);
begin
  ControlImageCtrl.Position.X := FLeft;
end;

procedure TFImageControl.Top(FTop: Single);
begin
  ControlImageCtrl.Position.Y := FTop;
end;

procedure TFImageControl.Height(FHeight: Single);
begin
  ControlImageCtrl.Size.Height := FHeight;
end;

procedure TFImageControl.Width(FWidth: Single);
begin
  ControlImageCtrl.Size.Width := FWidth;
end;

procedure TFImageControl.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlImageCtrl.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFImageControl.Position(X, Y: Single);
begin
  ControlImageCtrl.Position.X := X;
  ControlImageCtrl.Position.Y := Y;
end;

procedure TFImageControl.Align(Al: TAlignLayout);
begin
  ControlImageCtrl.Align := TAlignLayout(Al);
end;

procedure TFImageControl.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageCtrl.Margins.Left := FLeft;
  ControlImageCtrl.Margins.Top := FTop;
  ControlImageCtrl.Margins.Right := FRight;
  ControlImageCtrl.Margins.Bottom := FBottom;
end;

procedure TFImageControl.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageCtrl.Padding.Left := FLeft;
  ControlImageCtrl.Padding.Top := FTop;
  ControlImageCtrl.Padding.Right := FRight;
  ControlImageCtrl.Padding.Bottom := FBottom;
end;

procedure TFImageControl.SetHint(const FText: WideString);
begin
  ControlImageCtrl.ShowHint := True;
  ControlImageCtrl.Hint := string(FText);
end;

procedure TFImageControl.SetClipChildren(FValue: Boolean);
begin
  ControlImageCtrl.ClipChildren := FValue;
end;

procedure TFImageControl.SetClipParent(FValue: Boolean);
begin
  ControlImageCtrl.ClipParent := FValue;
end;

procedure TFImageControl.BringToFront;
begin
  ControlImageCtrl.BringToFront;
end;

procedure TFImageControl.SendToBack;
begin
  ControlImageCtrl.SendToBack;
end;

procedure TFImageControl.SetTag(FTag: Integer);
begin
  ControlImageCtrl.Tag := FTag;
end;

procedure TFImageControl.LoadPicture(const FImage: WideString);
begin
  ControlImageCtrl.Bitmap.LoadFromfile(string(FImage));
end;

procedure TFImageControl.Opacity(FOpacity: Single);
begin
  ControlImageCtrl.Opacity := FOpacity;
end;

procedure TFImageControl.RotationAngle(FValue: Single);
begin
  ControlImageCtrl.RotationAngle := FValue;
end;

procedure TFImageControl.RotationCenter(X, Y: Single);
begin
  ControlImageCtrl.RotationCenter.X := X;
  ControlImageCtrl.RotationCenter.Y := Y;
end;

procedure TFImageControl.Enabled(FEnabled: Boolean);
begin
  ControlImageCtrl.Enabled := FEnabled;
end;

procedure TFImageControl.Visible(FVisible: Boolean);
begin
  ControlImageCtrl.Visible := FVisible;
end;

procedure TFImageControl.HitTest(FEnabled: Boolean);
begin
  ControlImageCtrl.HitTest := FEnabled;
end;

procedure TFImageControl.StyleLookUp(FStyle: WideString);
begin
  ControlImageCtrl.StyleLookUp := string(FStyle);
end;

function TFImageControl.IsVisible: Boolean;
begin
  Result := ControlImageCtrl.Visible;
end;

function TFImageControl.GetTag: Integer;
begin
  Result := ControlImageCtrl.Tag;
end;

function TFImageControl.GetLeft: Single;
begin
  Result := ControlImageCtrl.Position.X;
end;

function TFImageControl.GetTop: Single;
begin
  Result := ControlImageCtrl.Position.Y;
end;

function TFImageControl.GetHeight: Single;
begin
  Result := ControlImageCtrl.Size.Height;
end;

function TFImageControl.GetWidth: Single;
begin
  Result := ControlImageCtrl.Size.Width;
end;

function TFImageControl.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlImageCtrl);
end;

procedure TFImageControl.OnClick(Event: TNotifyEvent);
begin
  ControlImageCtrl.OnClick := TNotifyEvent(Event);
end;

procedure TFImageControl.OnMouseDown(Event: TMouseEvent);
begin
  ControlImageCtrl.OnMouseDown := TMouseEvent(Event);
end;

procedure TFImageControl.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlImageCtrl.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFImageControl.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlImageCtrl.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFImageControl.OnMouseUp(Event: TMouseEvent);
begin
  ControlImageCtrl.OnMouseUp := TMouseEvent(Event);
end;

function TFImageControl.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlImageCtrl);
end;

// =============================================================================
// FImageControl
// =============================================================================
procedure TFProgressBar.FCreate(FParent: TFmxObject);
begin
  ControlProgressBar := TProgressBar.Create(nil);
  ControlProgressBar.Parent := TFmxObject(FParent);
end;

procedure TFProgressBar.Cursor(FCursor: TCursor);
begin
  ControlProgressBar.Cursor := TCursor(FCursor);
end;

procedure TFProgressBar.Left(FLeft: Single);
begin
  ControlProgressBar.Position.X := FLeft;
end;

procedure TFProgressBar.Top(FTop: Single);
begin
  ControlProgressBar.Position.Y := FTop;
end;

procedure TFProgressBar.Height(FHeight: Single);
begin
  ControlProgressBar.Size.Height := FHeight;
end;

procedure TFProgressBar.Width(FWidth: Single);
begin
  ControlProgressBar.Size.Width := FWidth;
end;

procedure TFProgressBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlProgressBar.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFProgressBar.Position(X, Y: Single);
begin
  ControlProgressBar.Position.X := X;
  ControlProgressBar.Position.Y := Y;
end;

procedure TFProgressBar.Align(Al: TAlignLayout);
begin
  ControlProgressBar.Align := TAlignLayout(Al);
end;

procedure TFProgressBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlProgressBar.Margins.Left := FLeft;
  ControlProgressBar.Margins.Top := FTop;
  ControlProgressBar.Margins.Right := FRight;
  ControlProgressBar.Margins.Bottom := FBottom;
end;

procedure TFProgressBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlProgressBar.Padding.Left := FLeft;
  ControlProgressBar.Padding.Top := FTop;
  ControlProgressBar.Padding.Right := FRight;
  ControlProgressBar.Padding.Bottom := FBottom;
end;

procedure TFProgressBar.SetHint(const FText: WideString);
begin
  ControlProgressBar.ShowHint := True;
  ControlProgressBar.Hint := string(FText);
end;

procedure TFProgressBar.SetClipChildren(FValue: Boolean);
begin
  ControlProgressBar.ClipChildren := FValue;
end;

procedure TFProgressBar.SetClipParent(FValue: Boolean);
begin
  ControlProgressBar.ClipParent := FValue;
end;

procedure TFProgressBar.BringToFront;
begin
  ControlProgressBar.BringToFront;
end;

procedure TFProgressBar.SendToBack;
begin
  ControlProgressBar.SendToBack;
end;

procedure TFProgressBar.SetTag(FTag: Integer);
begin
  ControlProgressBar.Tag := FTag;
end;

procedure TFProgressBar.Max(FMax: Single);
begin
  ControlProgressBar.Max := FMax;
end;

procedure TFProgressBar.Min(FMin: Single);
begin
  ControlProgressBar.Min := FMin;
end;

procedure TFProgressBar.Value(FValue: Single);
begin
  ControlProgressBar.Value := FValue;
end;

procedure TFProgressBar.Orientation(FVertical: Boolean);
begin
  if FVertical then
    ControlProgressBar.Orientation := TOrientation.Vertical
  else
    ControlProgressBar.Orientation := TOrientation.Horizontal;
end;

procedure TFProgressBar.Opacity(FOpacity: Single);
begin
  ControlProgressBar.Opacity := FOpacity;
end;

procedure TFProgressBar.RotationAngle(FValue: Single);
begin
  ControlProgressBar.RotationAngle := FValue;
end;

procedure TFProgressBar.RotationCenter(X, Y: Single);
begin
  ControlProgressBar.RotationCenter.X := X;
  ControlProgressBar.RotationCenter.Y := Y;
end;

procedure TFProgressBar.Enabled(FEnabled: Boolean);
begin
  ControlProgressBar.Enabled := FEnabled;
end;

procedure TFProgressBar.Visible(FVisible: Boolean);
begin
  ControlProgressBar.Visible := FVisible;
end;

procedure TFProgressBar.HitTest(FEnabled: Boolean);
begin
  ControlProgressBar.HitTest := FEnabled;
end;

procedure TFProgressBar.StyleLookUp(FStyle: WideString);
begin
  ControlProgressBar.StyleLookUp := string(FStyle);
end;

function TFProgressBar.IsVisible: Boolean;
begin
  Result := ControlProgressBar.Visible;
end;

function TFProgressBar.GetValue: Single;
begin
  Result := ControlProgressBar.Value;
end;

function TFProgressBar.GetMax: Single;
begin
  Result := ControlProgressBar.Max;
end;

function TFProgressBar.GetTag: Integer;
begin
  Result := ControlProgressBar.Tag;
end;

function TFProgressBar.GetLeft: Single;
begin
  Result := ControlProgressBar.Position.X;
end;

function TFProgressBar.GetTop: Single;
begin
  Result := ControlProgressBar.Position.Y;
end;

function TFProgressBar.GetHeight: Single;
begin
  Result := ControlProgressBar.Size.Height;
end;

function TFProgressBar.GetWidth: Single;
begin
  Result := ControlProgressBar.Size.Width;
end;

function TFProgressBar.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlProgressBar);
end;

procedure TFProgressBar.OnClick(Event: TNotifyEvent);
begin
  ControlProgressBar.OnClick := TNotifyEvent(Event);
end;

procedure TFProgressBar.OnMouseDown(Event: TMouseEvent);
begin
  ControlProgressBar.OnMouseDown := TMouseEvent(Event);
end;

procedure TFProgressBar.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlProgressBar.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFProgressBar.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlProgressBar.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFProgressBar.OnMouseUp(Event: TMouseEvent);
begin
  ControlProgressBar.OnMouseUp := TMouseEvent(Event);
end;

function TFProgressBar.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlProgressBar);
end;

// =============================================================================
// FExpander
// =============================================================================
procedure TFExpander.FCreate(FParent: TFmxObject);
begin
  ControlExpander := TExpander.Create(nil);
  ControlExpander.Parent := TFmxObject(FParent);
  ControlExpander.Text := 'Expander1';
end;

procedure TFExpander.Cursor(FCursor: TCursor);
begin
  ControlExpander.Cursor := TCursor(FCursor);
end;

procedure TFExpander.Left(FLeft: Single);
begin
  ControlExpander.Position.X := FLeft;
end;

procedure TFExpander.Top(FTop: Single);
begin
  ControlExpander.Position.Y := FTop;
end;

procedure TFExpander.Height(FHeight: Single);
begin
  ControlExpander.Size.Height := FHeight;
end;

procedure TFExpander.Width(FWidth: Single);
begin
  ControlExpander.Size.Width := FWidth;
end;

procedure TFExpander.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlExpander.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFExpander.Position(X, Y: Single);
begin
  ControlExpander.Position.X := X;
  ControlExpander.Position.Y := Y;
end;

procedure TFExpander.Align(Al: TAlignLayout);
begin
  ControlExpander.Align := TAlignLayout(Al);
end;

procedure TFExpander.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlExpander.Margins.Left := FLeft;
  ControlExpander.Margins.Top := FTop;
  ControlExpander.Margins.Right := FRight;
  ControlExpander.Margins.Bottom := FBottom;
end;

procedure TFExpander.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlExpander.Padding.Left := FLeft;
  ControlExpander.Padding.Top := FTop;
  ControlExpander.Padding.Right := FRight;
  ControlExpander.Padding.Bottom := FBottom;
end;

procedure TFExpander.SetHint(const FText: WideString);
begin
  ControlExpander.ShowHint := True;
  ControlExpander.Hint := string(FText);
end;

procedure TFExpander.SetClipChildren(FValue: Boolean);
begin
  ControlExpander.ClipChildren := FValue;
end;

procedure TFExpander.SetClipParent(FValue: Boolean);
begin
  ControlExpander.ClipParent := FValue;
end;

procedure TFExpander.BringToFront;
begin
  ControlExpander.BringToFront;
end;

procedure TFExpander.SendToBack;
begin
  ControlExpander.SendToBack;
end;

procedure TFExpander.SetTag(FTag: Integer);
begin
  ControlExpander.Tag := FTag;
end;

procedure TFExpander.HeaderHeight(FValue: Integer);
begin
  ControlExpander.HeaderHeight := FValue;
end;

procedure TFExpander.SetChecked(Value: Boolean);
begin
  ControlExpander.IsChecked := Value;
end;

procedure TFExpander.SetExpanded(Value: Boolean);
begin
  ControlExpander.IsExpanded := Value;
end;

procedure TFExpander.SetShowCheck(Value: Boolean);
begin
  ControlExpander.ShowCheck := Value;
end;

procedure TFExpander.Text(const FText: WideString);
begin
  ControlExpander.Text := string(FText);
end;

procedure TFExpander.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlExpander.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFExpander.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlExpander.StyledSettings := [];

  ControlExpander.TextSettings.Font.Family := string(FontName);
  ControlExpander.TextSettings.Font.Size := FontSize;
  ControlExpander.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFExpander.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlExpander.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlExpander.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlExpander.TextSettings.WordWrap := FWordWrap;
end;

procedure TFExpander.FontStyle(FStyle: TFontStyles);
begin
  ControlExpander.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFExpander.Opacity(FOpacity: Single);
begin
  ControlExpander.Opacity := FOpacity;
end;

procedure TFExpander.RotationAngle(FValue: Single);
begin
  ControlExpander.RotationAngle := FValue;
end;

procedure TFExpander.RotationCenter(X, Y: Single);
begin
  ControlExpander.RotationCenter.X := X;
  ControlExpander.RotationCenter.Y := Y;
end;

procedure TFExpander.Enabled(FEnabled: Boolean);
begin
  ControlExpander.Enabled := FEnabled;
end;

procedure TFExpander.Visible(FVisible: Boolean);
begin
  ControlExpander.Visible := FVisible;
end;

procedure TFExpander.HitTest(FEnabled: Boolean);
begin
  ControlExpander.HitTest := FEnabled;
end;

procedure TFExpander.StyleLookUp(FStyle: WideString);
begin
  ControlExpander.StyleLookUp := string(FStyle);
end;

function TFExpander.IsChecked: Boolean;
begin
  Result := ControlExpander.IsChecked;
end;

function TFExpander.IsExpanded: Boolean;
begin
  Result := ControlExpander.IsExpanded;
end;

function TFExpander.IsShowCheck: Boolean;
begin
  Result := ControlExpander.ShowCheck;
end;

function TFExpander.IsVisible: Boolean;
begin
  Result := ControlExpander.Visible;
end;

function TFExpander.GetTag: Integer;
begin
  Result := ControlExpander.Tag;
end;

function TFExpander.GetLeft: Single;
begin
  Result := ControlExpander.Position.X;
end;

function TFExpander.GetTop: Single;
begin
  Result := ControlExpander.Position.Y;
end;

function TFExpander.GetHeight: Single;
begin
  Result := ControlExpander.Size.Height;
end;

function TFExpander.GetWidth: Single;
begin
  Result := ControlExpander.Size.Width;
end;

function TFExpander.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlExpander);
end;

procedure TFExpander.OnCheckChange(Event: TNotifyEvent);
begin
  ControlExpander.OnCheckChange := TNotifyEvent(Event);
end;

procedure TFExpander.OnExpandedChanged(Event: TNotifyEvent);
begin
  ControlExpander.OnExpandedChanged := TNotifyEvent(Event);
end;

procedure TFExpander.OnExpandedChanging(Event: TNotifyEvent);
begin
  ControlExpander.OnExpandedChanging := TNotifyEvent(Event);
end;

procedure TFExpander.OnClick(Event: TNotifyEvent);
begin
  ControlExpander.OnClick := TNotifyEvent(Event);
end;

procedure TFExpander.OnMouseDown(Event: TMouseEvent);
begin
  ControlExpander.OnMouseDown := TMouseEvent(Event);
end;

procedure TFExpander.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlExpander.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFExpander.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlExpander.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFExpander.OnMouseUp(Event: TMouseEvent);
begin
  ControlExpander.OnMouseUp := TMouseEvent(Event);
end;

function TFExpander.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlExpander);
end;

// =============================================================================
// FTrackBar
// =============================================================================
procedure TFTrackBar.FCreate(FParent: TFmxObject);
begin
  ControlTrackBar := TTrackBar.Create(nil);
  ControlTrackBar.Parent := TFmxObject(FParent);
end;

procedure TFTrackBar.Cursor(FCursor: TCursor);
begin
  ControlTrackBar.Cursor := TCursor(FCursor);
end;

procedure TFTrackBar.Left(FLeft: Single);
begin
  ControlTrackBar.Position.X := FLeft;
end;

procedure TFTrackBar.Top(FTop: Single);
begin
  ControlTrackBar.Position.Y := FTop;
end;

procedure TFTrackBar.Height(FHeight: Single);
begin
  ControlTrackBar.Size.Height := FHeight;
end;

procedure TFTrackBar.Width(FWidth: Single);
begin
  ControlTrackBar.Size.Width := FWidth;
end;

procedure TFTrackBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlTrackBar.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFTrackBar.Position(X, Y: Single);
begin
  ControlTrackBar.Position.X := X;
  ControlTrackBar.Position.Y := Y;
end;

procedure TFTrackBar.Align(Al: TAlignLayout);
begin
  ControlTrackBar.Align := TAlignLayout(Al);
end;

procedure TFTrackBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTrackBar.Margins.Left := FLeft;
  ControlTrackBar.Margins.Top := FTop;
  ControlTrackBar.Margins.Right := FRight;
  ControlTrackBar.Margins.Bottom := FBottom;
end;

procedure TFTrackBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTrackBar.Padding.Left := FLeft;
  ControlTrackBar.Padding.Top := FTop;
  ControlTrackBar.Padding.Right := FRight;
  ControlTrackBar.Padding.Bottom := FBottom;
end;

procedure TFTrackBar.SetHint(const FText: WideString);
begin
  ControlTrackBar.ShowHint := True;
  ControlTrackBar.Hint := string(FText);
end;

procedure TFTrackBar.SetClipChildren(FValue: Boolean);
begin
  ControlTrackBar.ClipChildren := FValue;
end;

procedure TFTrackBar.SetClipParent(FValue: Boolean);
begin
  ControlTrackBar.ClipParent := FValue;
end;

procedure TFTrackBar.BringToFront;
begin
  ControlTrackBar.BringToFront;
end;

procedure TFTrackBar.SendToBack;
begin
  ControlTrackBar.SendToBack;
end;

procedure TFTrackBar.SetTag(FTag: Integer);
begin
  ControlTrackBar.Tag := FTag;
end;

procedure TFTrackBar.Max(FMax: Single);
begin
  ControlTrackBar.Max := FMax;
end;

procedure TFTrackBar.Min(FMin: Single);
begin
  ControlTrackBar.Min := FMin;
end;

procedure TFTrackBar.Orientation(FVertical: Boolean);
begin
  if FVertical then
    ControlTrackBar.Orientation := TOrientation.Vertical
  else
    ControlTrackBar.Orientation := TOrientation.Horizontal;
end;

procedure TFTrackBar.Value(FValue: Single);
begin
  ControlTrackBar.Value := FValue;
end;

procedure TFTrackBar.Frequency(FFrequency: Single);
begin
  ControlTrackBar.Frequency := FFrequency;
end;

procedure TFTrackBar.Opacity(FOpacity: Single);
begin
  ControlTrackBar.Opacity := FOpacity;
end;

procedure TFTrackBar.RotationAngle(FValue: Single);
begin
  ControlTrackBar.RotationAngle := FValue;
end;

procedure TFTrackBar.RotationCenter(X, Y: Single);
begin
  ControlTrackBar.RotationCenter.X := X;
  ControlTrackBar.RotationCenter.Y := Y;
end;

procedure TFTrackBar.Enabled(FEnabled: Boolean);
begin
  ControlTrackBar.Enabled := FEnabled;
end;

procedure TFTrackBar.Visible(FVisible: Boolean);
begin
  ControlTrackBar.Visible := FVisible;
end;

procedure TFTrackBar.HitTest(FEnabled: Boolean);
begin
  ControlTrackBar.HitTest := FEnabled;
end;

procedure TFTrackBar.StyleLookUp(FStyle: WideString);
begin
  ControlTrackBar.StyleLookUp := string(FStyle);
end;

function TFTrackBar.IsVisible: Boolean;
begin
  Result := ControlTrackBar.Visible;
end;

function TFTrackBar.GetValue: Single;
begin
  Result := ControlTrackBar.Value;
end;

function TFTrackBar.GetTag: Integer;
begin
  Result := ControlTrackBar.Tag;
end;

function TFTrackBar.GetLeft: Single;
begin
  Result := ControlTrackBar.Position.X;
end;

function TFTrackBar.GetTop: Single;
begin
  Result := ControlTrackBar.Position.Y;
end;

function TFTrackBar.GetHeight: Single;
begin
  Result := ControlTrackBar.Size.Height;
end;

function TFTrackBar.GetWidth: Single;
begin
  Result := ControlTrackBar.Size.Width;
end;

function TFTrackBar.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlTrackBar);
end;

procedure TFTrackBar.OnChange(Event: TNotifyEvent);
begin
  ControlTrackBar.OnChange := TNotifyEvent(Event);
end;

procedure TFTrackBar.OnClick(Event: TNotifyEvent);
begin
  ControlTrackBar.OnClick := TNotifyEvent(Event);
end;

procedure TFTrackBar.OnTracking(Event: TNotifyEvent);
begin
  ControlTrackBar.OnTracking := TNotifyEvent(Event);
end;

procedure TFTrackBar.OnMouseDown(Event: TMouseEvent);
begin
  ControlTrackBar.OnMouseDown := TMouseEvent(Event);
end;

procedure TFTrackBar.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlTrackBar.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFTrackBar.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlTrackBar.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFTrackBar.OnMouseUp(Event: TMouseEvent);
begin
  ControlTrackBar.OnMouseUp := TMouseEvent(Event);
end;

procedure TFTrackBar.OnMouseWheel(Event: TMouseWheelEvent);
begin
  ControlTrackBar.OnMouseWheel := TMouseWheelEvent(Event);
end;

function TFTrackBar.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlTrackBar);
end;

// =============================================================================
// FSwitch
// =============================================================================
procedure TFSwitch.FCreate(FParent: TFmxObject);
begin
  ControlSwitch := TSwitch.Create(nil);
  ControlSwitch.Parent := TFmxObject(FParent);
end;

procedure TFSwitch.Cursor(FCursor: TCursor);
begin
  ControlSwitch.Cursor := TCursor(FCursor);
end;

procedure TFSwitch.Left(FLeft: Single);
begin
  ControlSwitch.Position.X := FLeft;
end;

procedure TFSwitch.Top(FTop: Single);
begin
  ControlSwitch.Position.Y := FTop;
end;

procedure TFSwitch.Height(FHeight: Single);
begin
  ControlSwitch.Size.Height := FHeight;
end;

procedure TFSwitch.Width(FWidth: Single);
begin
  ControlSwitch.Size.Width := FWidth;
end;

procedure TFSwitch.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlSwitch.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSwitch.Position(X, Y: Single);
begin
  ControlSwitch.Position.X := X;
  ControlSwitch.Position.Y := Y;
end;

procedure TFSwitch.Align(Al: TAlignLayout);
begin
  ControlSwitch.Align := TAlignLayout(Al);
end;

procedure TFSwitch.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSwitch.Margins.Left := FLeft;
  ControlSwitch.Margins.Top := FTop;
  ControlSwitch.Margins.Right := FRight;
  ControlSwitch.Margins.Bottom := FBottom;
end;

procedure TFSwitch.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSwitch.Padding.Left := FLeft;
  ControlSwitch.Padding.Top := FTop;
  ControlSwitch.Padding.Right := FRight;
  ControlSwitch.Padding.Bottom := FBottom;
end;

procedure TFSwitch.SetHint(const FText: WideString);
begin
  ControlSwitch.ShowHint := True;
  ControlSwitch.Hint := string(FText);
end;

procedure TFSwitch.SetClipChildren(FValue: Boolean);
begin
  ControlSwitch.ClipChildren := FValue;
end;

procedure TFSwitch.SetClipParent(FValue: Boolean);
begin
  ControlSwitch.ClipParent := FValue;
end;

procedure TFSwitch.BringToFront;
begin
  ControlSwitch.BringToFront;
end;

procedure TFSwitch.SendToBack;
begin
  ControlSwitch.SendToBack;
end;

procedure TFSwitch.SetTag(FTag: Integer);
begin
  ControlSwitch.Tag := FTag;
end;

procedure TFSwitch.SwitchedOn(FSwitchedOn: Boolean);
begin
  ControlSwitch.IsChecked := FSwitchedOn;
end;

procedure TFSwitch.SetFocus;
begin
  ControlSwitch.SetFocus;
end;

procedure TFSwitch.CanFocus(FValue: Boolean);
begin
  ControlSwitch.CanFocus := FValue;
end;

procedure TFSwitch.Opacity(FOpacity: Single);
begin
  ControlSwitch.Opacity := FOpacity;
end;

procedure TFSwitch.RotationAngle(FValue: Single);
begin
  ControlSwitch.RotationAngle := FValue;
end;

procedure TFSwitch.RotationCenter(X, Y: Single);
begin
  ControlSwitch.RotationCenter.X := X;
  ControlSwitch.RotationCenter.Y := Y;
end;

procedure TFSwitch.Enabled(FEnabled: Boolean);
begin
  ControlSwitch.Enabled := FEnabled;
end;

procedure TFSwitch.Visible(FVisible: Boolean);
begin
  ControlSwitch.Visible := FVisible;
end;

procedure TFSwitch.HitTest(FEnabled: Boolean);
begin
  ControlSwitch.HitTest := FEnabled;
end;

procedure TFSwitch.StyleLookUp(FStyle: WideString);
begin
  ControlSwitch.StyleLookUp := string(FStyle);
end;

function TFSwitch.IsSwitchedOn: Boolean;
begin
  Result := ControlSwitch.IsChecked;
end;

function TFSwitch.IsVisible: Boolean;
begin
  Result := ControlSwitch.Visible;
end;

function TFSwitch.GetTag: Integer;
begin
  Result := ControlSwitch.Tag;
end;

function TFSwitch.GetLeft: Single;
begin
  Result := ControlSwitch.Position.X;
end;

function TFSwitch.GetTop: Single;
begin
  Result := ControlSwitch.Position.Y;
end;

function TFSwitch.GetHeight: Single;
begin
  Result := ControlSwitch.Size.Height;
end;

function TFSwitch.GetWidth: Single;
begin
  Result := ControlSwitch.Size.Width;
end;

function TFSwitch.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlSwitch);
end;

procedure TFSwitch.OnClick(Event: TNotifyEvent);
begin
  ControlSwitch.OnClick := TNotifyEvent(Event);
end;

procedure TFSwitch.OnSwitch(Event: TNotifyEvent);
begin
  ControlSwitch.OnSwitch := TNotifyEvent(Event);
end;

procedure TFSwitch.OnMouseDown(Event: TMouseEvent);
begin
  ControlSwitch.OnMouseDown := TMouseEvent(Event);
end;

procedure TFSwitch.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSwitch.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSwitch.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSwitch.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFSwitch.OnMouseUp(Event: TMouseEvent);
begin
  ControlSwitch.OnMouseUp := TMouseEvent(Event);
end;

function TFSwitch.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlSwitch);
end;

// =============================================================================
// FSplitter
// =============================================================================
procedure TFSplitter.FCreate(FParent: TFmxObject);
begin
  ControlSplitter := TSplitter.Create(nil);
  ControlSplitter.Parent := TFmxObject(FParent);
end;

procedure TFSplitter.Cursor(FCursor: TCursor);
begin
  ControlSplitter.Cursor := TCursor(FCursor);
end;

procedure TFSplitter.Left(FLeft: Single);
begin
  ControlSplitter.Position.X := FLeft;
end;

procedure TFSplitter.Top(FTop: Single);
begin
  ControlSplitter.Position.Y := FTop;
end;

procedure TFSplitter.Height(FHeight: Single);
begin
  ControlSplitter.Size.Height := FHeight;
end;

procedure TFSplitter.Width(FWidth: Single);
begin
  ControlSplitter.Size.Width := FWidth;
end;

procedure TFSplitter.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlSplitter.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSplitter.Position(X, Y: Single);
begin
  ControlSplitter.Position.X := X;
  ControlSplitter.Position.Y := Y;
end;

procedure TFSplitter.Align(Al: TAlignLayout);
begin
  ControlSplitter.Align := TAlignLayout(Al);
end;

procedure TFSplitter.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSplitter.Margins.Left := FLeft;
  ControlSplitter.Margins.Top := FTop;
  ControlSplitter.Margins.Right := FRight;
  ControlSplitter.Margins.Bottom := FBottom;
end;

procedure TFSplitter.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSplitter.Padding.Left := FLeft;
  ControlSplitter.Padding.Top := FTop;
  ControlSplitter.Padding.Right := FRight;
  ControlSplitter.Padding.Bottom := FBottom;
end;

procedure TFSplitter.SetHint(const FText: WideString);
begin
  ControlSplitter.ShowHint := True;
  ControlSplitter.Hint := string(FText);
end;

procedure TFSplitter.SetClipChildren(FValue: Boolean);
begin
  ControlSplitter.ClipChildren := FValue;
end;

procedure TFSplitter.SetClipParent(FValue: Boolean);
begin
  ControlSplitter.ClipParent := FValue;
end;

procedure TFSplitter.BringToFront;
begin
  ControlSplitter.BringToFront;
end;

procedure TFSplitter.SendToBack;
begin
  ControlSplitter.SendToBack;
end;

procedure TFSplitter.SetTag(FTag: Integer);
begin
  ControlSplitter.Tag := FTag;
end;

procedure TFSplitter.MinSize(FSize: Single);
begin
  ControlSplitter.MinSize := FSize;
end;

procedure TFSplitter.ShowGrip(FValue: Boolean);
begin
  ControlSplitter.ShowGrip := FValue;
end;

procedure TFSplitter.Opacity(FOpacity: Single);
begin
  ControlSplitter.Opacity := FOpacity;
end;

procedure TFSplitter.RotationAngle(FValue: Single);
begin
  ControlSplitter.RotationAngle := FValue;
end;

procedure TFSplitter.RotationCenter(X, Y: Single);
begin
  ControlSplitter.RotationCenter.X := X;
  ControlSplitter.RotationCenter.Y := Y;
end;

procedure TFSplitter.Enabled(FEnabled: Boolean);
begin
  ControlSplitter.Enabled := FEnabled;
end;

procedure TFSplitter.Visible(FVisible: Boolean);
begin
  ControlSplitter.Visible := FVisible;
end;

procedure TFSplitter.HitTest(FEnabled: Boolean);
begin
  ControlSplitter.HitTest := FEnabled;
end;

procedure TFSplitter.StyleLookUp(FStyle: WideString);
begin
  ControlSplitter.StyleLookUp := string(FStyle);
end;

function TFSplitter.IsVisible: Boolean;
begin
  Result := ControlSplitter.Visible;
end;

function TFSplitter.GetTag: Integer;
begin
  Result := ControlSplitter.Tag;
end;

function TFSplitter.GetLeft: Single;
begin
  Result := ControlSplitter.Position.X;
end;

function TFSplitter.GetTop: Single;
begin
  Result := ControlSplitter.Position.Y;
end;

function TFSplitter.GetHeight: Single;
begin
  Result := ControlSplitter.Size.Height;
end;

function TFSplitter.GetWidth: Single;
begin
  Result := ControlSplitter.Size.Width;
end;

function TFSplitter.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlSplitter);
end;

procedure TFSplitter.OnClick(Event: TNotifyEvent);
begin
  ControlSplitter.OnClick := TNotifyEvent(Event);
end;

procedure TFSplitter.OnMouseDown(Event: TMouseEvent);
begin
  ControlSplitter.OnMouseDown := TMouseEvent(Event);
end;

procedure TFSplitter.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSplitter.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSplitter.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSplitter.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFSplitter.OnMouseUp(Event: TMouseEvent);
begin
  ControlSplitter.OnMouseUp := TMouseEvent(Event);
end;

function TFSplitter.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlSplitter);
end;

// =============================================================================
// FMenuItem
// =============================================================================
procedure TFMenuItem.FCreate(FParent: TFmxObject);
begin
  ControlMenuItem := TMenuItem.Create(TFmxObject(FParent));
  ControlMenuItem.Parent := TFmxObject(FParent);
end;

procedure TFMenuItem.Cursor(FCursor: TCursor);
begin
  ControlMenuItem.Cursor := TCursor(FCursor);
end;

procedure TFMenuItem.Position(X, Y: Single);
begin
  ControlMenuItem.Position.X := X;
  ControlMenuItem.Position.Y := Y;
end;

procedure TFMenuItem.Height(FHeight: Single);
begin
  ControlMenuItem.Height := FHeight;
end;

procedure TFMenuItem.Width(FWidth: Single);
begin
  ControlMenuItem.Width := FWidth;
end;

procedure TFMenuItem.Align(Al: TAlignLayout);
begin
  ControlMenuItem.Align := TAlignLayout(Al);
end;

procedure TFMenuItem.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlMenuItem.Margins.Left := FLeft;
  ControlMenuItem.Margins.Top := FTop;
  ControlMenuItem.Margins.Right := FRight;
  ControlMenuItem.Margins.Bottom := FBottom;
end;

procedure TFMenuItem.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlMenuItem.Padding.Left := FLeft;
  ControlMenuItem.Padding.Top := FTop;
  ControlMenuItem.Padding.Right := FRight;
  ControlMenuItem.Padding.Bottom := FBottom;
end;

procedure TFMenuItem.LoadImage(const FImage: WideString);
begin
  ControlMenuItem.Bitmap.LoadFromfile(string(FImage));
end;

procedure TFMenuItem.AddItem(FMenuItem: TMenuItem);
begin
  ControlMenuItem.AddObject(TMenuItem(FMenuItem));
end;

procedure TFMenuItem.Text(const FText: WideString);
begin
  ControlMenuItem.Text := string(FText);
end;

procedure TFMenuItem.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlMenuItem.StyledSettings := [];

  ControlMenuItem.TextSettings.Font.Family := string(FontName);
  ControlMenuItem.TextSettings.Font.Size := FontSize;
  ControlMenuItem.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFMenuItem.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlMenuItem.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlMenuItem.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlMenuItem.TextSettings.WordWrap := FWordWrap;
end;

procedure TFMenuItem.FontStyle(FStyle: TFontStyles);
begin
  ControlMenuItem.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFMenuItem.AutoCheck(FValue: Boolean);
begin
  ControlMenuItem.AutoCheck := FValue;
end;

procedure TFMenuItem.SetChecked(FValue: Boolean);
begin
  ControlMenuItem.IsChecked := FValue;
end;

procedure TFMenuItem.SetIndex(FValue: Integer);
begin
  ControlMenuItem.Index := FValue;
end;

procedure TFMenuItem.GroupIndex(FValue: Integer);
begin
  ControlMenuItem.GroupIndex := FValue;
end;

procedure TFMenuItem.ImageIndex(FValue: Integer);
begin
  ControlMenuItem.ImageIndex := FValue;
end;

procedure TFMenuItem.RadioItem(FValue: Boolean);
begin
  ControlMenuItem.RadioItem := FValue;
end;

procedure TFMenuItem.Select(FValue: Boolean);
begin
  ControlMenuItem.IsSelected := FValue;
end;

procedure TFMenuItem.Change;
begin
  ControlMenuItem.Change;
end;

procedure TFMenuItem.Clear;
begin
  ControlMenuItem.Clear;
end;

procedure TFMenuItem.Popup;
begin
  ControlMenuItem.Popup;
end;

procedure TFMenuItem.NeedPopup;
begin
  ControlMenuItem.NeedPopup;
end;

procedure TFMenuItem.ShortCut(FValue: TShortCut);
begin
  ControlMenuItem.ShortCut := TShortCut(FValue);
end;

procedure TFMenuItem.BeginUpdate;
begin
  ControlMenuItem.BeginUpdate;
end;

procedure TFMenuItem.EndUpdate;
begin
  ControlMenuItem.EndUpdate;
end;

procedure TFMenuItem.Opacity(FOpacity: Single);
begin
  ControlMenuItem.Opacity := FOpacity;
end;

procedure TFMenuItem.Enabled(FEnabled: Boolean);
begin
  ControlMenuItem.Enabled := FEnabled;
end;

procedure TFMenuItem.Visible(FVisible: Boolean);
begin
  ControlMenuItem.Visible := FVisible;
end;

procedure TFMenuItem.HitTest(FEnabled: Boolean);
begin
  ControlMenuItem.HitTest := FEnabled;
end;

procedure TFMenuItem.StyleLookUp(FStyle: WideString);
begin
  ControlMenuItem.StyleLookUp := string(FStyle);
end;

function TFMenuItem.IsAutoCheck: Boolean;
begin
  Result := ControlMenuItem.AutoCheck;
end;

function TFMenuItem.IsSelected: Boolean;
begin
  Result := ControlMenuItem.IsSelected;
end;

function TFMenuItem.IsSeparator: Boolean;
begin
  Result := ControlMenuItem.IsSeparator;
end;

function TFMenuItem.IsRadioItem: Boolean;
begin
  Result := ControlMenuItem.RadioItem;
end;

function TFMenuItem.IsChecked: Boolean;
begin
  Result := ControlMenuItem.IsChecked;
end;

function TFMenuItem.IsVisible: Boolean;
begin
  Result := ControlMenuItem.Visible;
end;

function TFMenuItem.ParenIMenuItem: TMenuItem;
begin
  Result := ControlMenuItem.ParenTMenuItem;
end;

function TFMenuItem.MainMenu: TMainMenu;
begin
  Result := ControlMenuItem.MainMenu;
end;

function TFMenuItem.HavePopup: Boolean;
begin
  Result := ControlMenuItem.HavePopup;
end;

function TFMenuItem.ItemsCount: Integer;
begin
  Result := ControlMenuItem.ItemsCount;
end;

function TFMenuItem.GetItem(FIndex: Integer): TMenuItem;
begin
  Result := ControlMenuItem.Items[FIndex];
end;

function TFMenuItem.GetIndex: Integer;
begin
  Result := ControlMenuItem.Index;
end;

function TFMenuItem.GetGroupIndex: Integer;
begin
  Result := ControlMenuItem.GroupIndex;
end;

function TFMenuItem.GetText: WideString;
begin
  Result := ControlMenuItem.Text;
end;

function TFMenuItem.GetTag: Integer;
begin
  Result := ControlMenuItem.Tag;
end;

function TFMenuItem.GetLeft: Single;
begin
  Result := ControlMenuItem.Position.X;
end;

function TFMenuItem.GetTop: Single;
begin
  Result := ControlMenuItem.Position.Y;
end;

function TFMenuItem.GetHeight: Single;
begin
  Result := ControlMenuItem.Height;
end;

function TFMenuItem.GetWidth: Single;
begin
  Result := ControlMenuItem.Width;
end;

function TFMenuItem.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlMenuItem);
end;

procedure TFMenuItem.OnClick(Event: TNotifyEvent);
begin
  ControlMenuItem.OnClick := TNotifyEvent(Event);
end;

procedure TFMenuItem.OnMouseDown(Event: TMouseEvent);
begin
  ControlMenuItem.OnMouseDown := TMouseEvent(Event);
end;

procedure TFMenuItem.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlMenuItem.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFMenuItem.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlMenuItem.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFMenuItem.OnMouseUp(Event: TMouseEvent);
begin
  ControlMenuItem.OnMouseUp := TMouseEvent(Event);
end;

function TFMenuItem.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlMenuItem);
end;

// =============================================================================
// FMenuBar
// =============================================================================
procedure TFMenuBar.FCreate(FParent: TFmxObject);
begin
  ControlMenuBar := TMenuBar.Create(nil);
  ControlMenuBar.Parent := TFmxObject(FParent);
end;

procedure TFMenuBar.Cursor(FCursor: TCursor);
begin
  ControlMenuBar.Cursor := TCursor(FCursor);
end;

procedure TFMenuBar.Left(FLeft: Single);
begin
  ControlMenuBar.Position.X := FLeft;
end;

procedure TFMenuBar.Top(FTop: Single);
begin
  ControlMenuBar.Position.Y := FTop;
end;

procedure TFMenuBar.Height(FHeight: Single);
begin
  ControlMenuBar.Size.Height := FHeight;
end;

procedure TFMenuBar.Width(FWidth: Single);
begin
  ControlMenuBar.Size.Width := FWidth;
end;

procedure TFMenuBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlMenuBar.Position.X := FLeft;
  ControlMenuBar.Position.Y := FTop;
  ControlMenuBar.Size.Width := FWidth;
  ControlMenuBar.Size.Height := FHeight;
end;

procedure TFMenuBar.Position(X, Y: Single);
begin
  ControlMenuBar.Position.X := X;
  ControlMenuBar.Position.Y := Y;
end;

procedure TFMenuBar.Align(Al: TAlignLayout);
begin
  ControlMenuBar.Align := TAlignLayout(Al);
end;

procedure TFMenuBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlMenuBar.Margins.Left := FLeft;
  ControlMenuBar.Margins.Top := FTop;
  ControlMenuBar.Margins.Right := FRight;
  ControlMenuBar.Margins.Bottom := FBottom;
end;

procedure TFMenuBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlMenuBar.Padding.Left := FLeft;
  ControlMenuBar.Padding.Top := FTop;
  ControlMenuBar.Padding.Right := FRight;
  ControlMenuBar.Padding.Bottom := FBottom;
end;

procedure TFMenuBar.SetHint(const FText: WideString);
begin
  ControlMenuBar.ShowHint := True;
  ControlMenuBar.Hint := string(FText);
end;

procedure TFMenuBar.SetClipParent(FValue: Boolean);
begin
  ControlMenuBar.ClipParent := FValue;
end;

procedure TFMenuBar.SetClipChildren(FValue: Boolean);
begin
  ControlMenuBar.ClipChildren := FValue;
end;

procedure TFMenuBar.BringToFront;
begin
  ControlMenuBar.BringToFront;
end;

procedure TFMenuBar.SendToBack;
begin
  ControlMenuBar.SendToBack;
end;

procedure TFMenuBar.SetTag(FTag: Integer);
begin
  ControlMenuBar.Tag := FTag;
end;

procedure TFMenuBar.AddItem(FItem: TMenuItem);
begin
  ControlMenuBar.AddObject(TMenuItem(FItem));
end;

procedure TFMenuBar.ImageList(FImgList: TImageList);
begin
  ControlMenuBar.Images := TImageList(FImgList);
end;

procedure TFMenuBar.ItemPopup(FIndex: Integer);
begin
  if (FIndex >= 0) and (FIndex < ControlMenuBar.ItemsCount) then
    ControlMenuBar.Items[FIndex].Popup;
end;

procedure TFMenuBar.Clear;
begin
  ControlMenuBar.Clear;
end;

procedure TFMenuBar.BeginUpdate;
begin
  ControlMenuBar.BeginUpdate;
end;

procedure TFMenuBar.EndUpdate;
begin
  ControlMenuBar.EndUpdate;
end;

procedure TFMenuBar.RecalcSize;
begin
  ControlMenuBar.RecalcSize;
end;

procedure TFMenuBar.Repaint;
begin
  ControlMenuBar.Repaint;
end;

procedure TFMenuBar.Opacity(FOpacity: Single);
begin
  ControlMenuBar.Opacity := FOpacity;
end;

procedure TFMenuBar.RotationAngle(FValue: Single);
begin
  ControlMenuBar.RotationAngle := FValue;
end;

procedure TFMenuBar.RotationCenter(X, Y: Single);
begin
  ControlMenuBar.RotationCenter.X := X;
  ControlMenuBar.RotationCenter.Y := Y;
end;

procedure TFMenuBar.Enabled(FEnabled: Boolean);
begin
  ControlMenuBar.Enabled := FEnabled;
end;

procedure TFMenuBar.Visible(FVisible: Boolean);
begin
  ControlMenuBar.Visible := FVisible;
end;

procedure TFMenuBar.HitTest(FEnabled: Boolean);
begin
  ControlMenuBar.HitTest := FEnabled;
end;

procedure TFMenuBar.StyleLookUp(FStyle: WideString);
begin
  ControlMenuBar.StyleLookUp := string(FStyle);
end;

function TFMenuBar.ItemCount: Integer;
begin
  Result := ControlMenuBar.ItemsCount;
end;

function TFMenuBar.ItemIsSelected(FIndex: Integer): Boolean;
begin
  Result := ControlMenuBar.Items[FIndex].IsSelected;
end;

function TFMenuBar.ItemIsSeparator(FIndex: Integer): Boolean;
begin
  Result := ControlMenuBar.Items[FIndex].IsSeparator;
end;

function TFMenuBar.ItemIsChecked(FIndex: Integer): Boolean;
begin
  Result := ControlMenuBar.Items[FIndex].IsChecked;
end;

function TFMenuBar.ItemGroupIndex(FIndex: Integer): Integer;
begin
  Result := ControlMenuBar.Items[FIndex].GroupIndex;
end;

function TFMenuBar.ItemText(FIndex: Integer): WideString;
begin
  Result := ControlMenuBar.Items[FIndex].Text;
end;

function TFMenuBar.IsVisible: Boolean;
begin
  Result := ControlMenuBar.Visible;
end;

function TFMenuBar.GetTag: Integer;
begin
  Result := ControlMenuBar.Tag;
end;

function TFMenuBar.GetLeft: Single;
begin
  Result := ControlMenuBar.Position.X;
end;

function TFMenuBar.GetTop: Single;
begin
  Result := ControlMenuBar.Position.Y;
end;

function TFMenuBar.GetHeight: Single;
begin
  Result := ControlMenuBar.Size.Height;
end;

function TFMenuBar.GetWidth: Single;
begin
  Result := ControlMenuBar.Size.Width;
end;

function TFMenuBar.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlMenuBar);
end;

procedure TFMenuBar.OnClick(Event: TNotifyEvent);
begin
  ControlMenuBar.OnClick := TNotifyEvent(Event);
end;

procedure TFMenuBar.OnMouseDown(Event: TMouseEvent);
begin
  ControlMenuBar.OnMouseDown := TMouseEvent(Event);
end;

procedure TFMenuBar.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlMenuBar.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFMenuBar.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlMenuBar.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFMenuBar.OnMouseUp(Event: TMouseEvent);
begin
  ControlMenuBar.OnMouseUp := TMouseEvent(Event);
end;

function TFMenuBar.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlMenuBar);
end;

// =============================================================================
// FStatusBar
// =============================================================================
procedure TFStatusBar.FCreate(FParent: TFmxObject);
begin
  ControlStatusBar := TStatusBar.Create(nil);
  ControlStatusBar.Parent := TFmxObject(FParent);
  ControlStatusBar.ShowSizeGrip := False;
end;

procedure TFStatusBar.Cursor(FCursor: TCursor);
begin
  ControlStatusBar.Cursor := TCursor(FCursor);
end;

procedure TFStatusBar.Left(FLeft: Single);
begin
  ControlStatusBar.Position.X := FLeft;
end;

procedure TFStatusBar.Top(FTop: Single);
begin
  ControlStatusBar.Position.Y := FTop;
end;

procedure TFStatusBar.Height(FHeight: Single);
begin
  ControlStatusBar.Size.Height := FHeight;
end;

procedure TFStatusBar.Width(FWidth: Single);
begin
  ControlStatusBar.Size.Width := FWidth;
end;

procedure TFStatusBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlStatusBar.Position.X := FLeft;
  ControlStatusBar.Position.Y := FTop;
  ControlStatusBar.Size.Width := FWidth;
  ControlStatusBar.Size.Height := FHeight;
end;

procedure TFStatusBar.Position(X, Y: Single);
begin
  ControlStatusBar.Position.X := X;
  ControlStatusBar.Position.Y := Y;
end;

procedure TFStatusBar.Align(Al: TAlignLayout);
begin
  ControlStatusBar.Align := TAlignLayout(Al);
end;

procedure TFStatusBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlStatusBar.Margins.Left := FLeft;
  ControlStatusBar.Margins.Top := FTop;
  ControlStatusBar.Margins.Right := FRight;
  ControlStatusBar.Margins.Bottom := FBottom;
end;

procedure TFStatusBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlStatusBar.Padding.Left := FLeft;
  ControlStatusBar.Padding.Top := FTop;
  ControlStatusBar.Padding.Right := FRight;
  ControlStatusBar.Padding.Bottom := FBottom;
end;

procedure TFStatusBar.SetHint(const FText: WideString);
begin
  ControlStatusBar.ShowHint := True;
  ControlStatusBar.Hint := string(FText);
end;

procedure TFStatusBar.SetClipParent(FValue: Boolean);
begin
  ControlStatusBar.ClipParent := FValue;
end;

procedure TFStatusBar.SetClipChildren(FValue: Boolean);
begin
  ControlStatusBar.ClipChildren := FValue;
end;

procedure TFStatusBar.BringToFront;
begin
  ControlStatusBar.BringToFront;
end;

procedure TFStatusBar.SendToBack;
begin
  ControlStatusBar.SendToBack;
end;

procedure TFStatusBar.SetTag(FTag: Integer);
begin
  ControlStatusBar.Tag := FTag;
end;

procedure TFStatusBar.AutoHint(FValue: Boolean);
begin
  ControlStatusBar.AutoHint := FValue;
end;

procedure TFStatusBar.ShowSizeGrip(FValue: Boolean);
begin
  ControlStatusBar.ShowSizeGrip := FValue;
end;

procedure TFStatusBar.Opacity(FOpacity: Single);
begin
  ControlStatusBar.Opacity := FOpacity;
end;

procedure TFStatusBar.RotationAngle(FValue: Single);
begin
  ControlStatusBar.RotationAngle := FValue;
end;

procedure TFStatusBar.RotationCenter(X, Y: Single);
begin
  ControlStatusBar.RotationCenter.X := X;
  ControlStatusBar.RotationCenter.Y := Y;
end;

procedure TFStatusBar.Enabled(FEnabled: Boolean);
begin
  ControlStatusBar.Enabled := FEnabled;
end;

procedure TFStatusBar.Visible(FVisible: Boolean);
begin
  ControlStatusBar.Visible := FVisible;
end;

procedure TFStatusBar.HitTest(FEnabled: Boolean);
begin
  ControlStatusBar.HitTest := FEnabled;
end;

procedure TFStatusBar.StyleLookUp(FStyle: WideString);
begin
  ControlStatusBar.StyleLookUp := string(FStyle);
end;

function TFStatusBar.IsVisible: Boolean;
begin
  Result := ControlStatusBar.Visible;
end;

function TFStatusBar.GetTag: Integer;
begin
  Result := ControlStatusBar.Tag;
end;

function TFStatusBar.GetLeft: Single;
begin
  Result := ControlStatusBar.Position.X;
end;

function TFStatusBar.GetTop: Single;
begin
  Result := ControlStatusBar.Position.Y;
end;

function TFStatusBar.GetHeight: Single;
begin
  Result := ControlStatusBar.Size.Height;
end;

function TFStatusBar.GetWidth: Single;
begin
  Result := ControlStatusBar.Size.Width;
end;

function TFStatusBar.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlStatusBar);
end;

procedure TFStatusBar.OnClick(Event: TNotifyEvent);
begin
  ControlStatusBar.OnClick := TNotifyEvent(Event);
end;

procedure TFStatusBar.OnMouseDown(Event: TMouseEvent);
begin
  ControlStatusBar.OnMouseDown := TMouseEvent(Event);
end;

procedure TFStatusBar.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlStatusBar.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFStatusBar.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlStatusBar.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFStatusBar.OnMouseUp(Event: TMouseEvent);
begin
  ControlStatusBar.OnMouseUp := TMouseEvent(Event);
end;

function TFStatusBar.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlStatusBar);
end;

// =============================================================================
// FToolBar
// =============================================================================
procedure TFToolBar.FCreate(FParent: TFmxObject);
begin
  ControlToolBar := TToolBar.Create(nil);
  ControlToolBar.Parent := TFmxObject(FParent);
end;

procedure TFToolBar.Cursor(FCursor: TCursor);
begin
  ControlToolBar.Cursor := TCursor(FCursor);
end;

procedure TFToolBar.Left(FLeft: Single);
begin
  ControlToolBar.Position.X := FLeft;
end;

procedure TFToolBar.Top(FTop: Single);
begin
  ControlToolBar.Position.Y := FTop;
end;

procedure TFToolBar.Height(FHeight: Single);
begin
  ControlToolBar.Size.Height := FHeight;
end;

procedure TFToolBar.Width(FWidth: Single);
begin
  ControlToolBar.Size.Width := FWidth;
end;

procedure TFToolBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlToolBar.Position.X := FLeft;
  ControlToolBar.Position.Y := FTop;
  ControlToolBar.Size.Width := FWidth;
  ControlToolBar.Size.Height := FHeight;
end;

procedure TFToolBar.Position(X, Y: Single);
begin
  ControlToolBar.Position.X := X;
  ControlToolBar.Position.Y := Y;
end;

procedure TFToolBar.Align(Al: TAlignLayout);
begin
  ControlToolBar.Align := TAlignLayout(Al);
end;

procedure TFToolBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlToolBar.Margins.Left := FLeft;
  ControlToolBar.Margins.Top := FTop;
  ControlToolBar.Margins.Right := FRight;
  ControlToolBar.Margins.Bottom := FBottom;
end;

procedure TFToolBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlToolBar.Padding.Left := FLeft;
  ControlToolBar.Padding.Top := FTop;
  ControlToolBar.Padding.Right := FRight;
  ControlToolBar.Padding.Bottom := FBottom;
end;

procedure TFToolBar.SetHint(const FText: WideString);
begin
  ControlToolBar.ShowHint := True;
  ControlToolBar.Hint := string(FText);
end;

procedure TFToolBar.SetClipParent(FValue: Boolean);
begin
  ControlToolBar.ClipParent := FValue;
end;

procedure TFToolBar.SetClipChildren(FValue: Boolean);
begin
  ControlToolBar.ClipChildren := FValue;
end;

procedure TFToolBar.BringToFront;
begin
  ControlToolBar.BringToFront;
end;

procedure TFToolBar.SendToBack;
begin
  ControlToolBar.SendToBack;
end;

procedure TFToolBar.SetTag(FTag: Integer);
begin
  ControlToolBar.Tag := FTag;
end;

procedure TFToolBar.TintColor(const FColor: TAlphaColor);
begin
  ControlToolBar.TintColor := TAlphaColor(FColor);
end;

procedure TFToolBar.Opacity(FOpacity: Single);
begin
  ControlToolBar.Opacity := FOpacity;
end;

procedure TFToolBar.RotationAngle(FValue: Single);
begin
  ControlToolBar.RotationAngle := FValue;
end;

procedure TFToolBar.RotationCenter(X, Y: Single);
begin
  ControlToolBar.RotationCenter.X := X;
  ControlToolBar.RotationCenter.Y := Y;
end;

procedure TFToolBar.Enabled(FEnabled: Boolean);
begin
  ControlToolBar.Enabled := FEnabled;
end;

procedure TFToolBar.Visible(FVisible: Boolean);
begin
  ControlToolBar.Visible := FVisible;
end;

procedure TFToolBar.HitTest(FEnabled: Boolean);
begin
  ControlToolBar.HitTest := FEnabled;
end;

procedure TFToolBar.StyleLookUp(FStyle: WideString);
begin
  ControlToolBar.StyleLookUp := string(FStyle);
end;

function TFToolBar.IsVisible: Boolean;
begin
  Result := ControlToolBar.Visible;
end;

function TFToolBar.GetTag: Integer;
begin
  Result := ControlToolBar.Tag;
end;

function TFToolBar.GetLeft: Single;
begin
  Result := ControlToolBar.Position.X;
end;

function TFToolBar.GetTop: Single;
begin
  Result := ControlToolBar.Position.Y;
end;

function TFToolBar.GetHeight: Single;
begin
  Result := ControlToolBar.Size.Height;
end;

function TFToolBar.GetWidth: Single;
begin
  Result := ControlToolBar.Size.Width;
end;

function TFToolBar.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlToolBar);
end;

procedure TFToolBar.OnClick(Event: TNotifyEvent);
begin
  ControlToolBar.OnClick := TNotifyEvent(Event);
end;

procedure TFToolBar.OnMouseDown(Event: TMouseEvent);
begin
  ControlToolBar.OnMouseDown := TMouseEvent(Event);
end;

procedure TFToolBar.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlToolBar.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFToolBar.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlToolBar.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFToolBar.OnMouseUp(Event: TMouseEvent);
begin
  ControlToolBar.OnMouseUp := TMouseEvent(Event);
end;

function TFToolBar.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlToolBar);
end;

// =============================================================================
// FSearchBox
// =============================================================================
procedure TFSearchBox.FCreate(FParent: TFmxObject);
begin
  ControlSearchBox := TSearchBox.Create(TFmxObject(FParent));
  ControlSearchBox.Parent := TFmxObject(FParent);
end;

procedure TFSearchBox.Cursor(FCursor: TCursor);
begin
  ControlSearchBox.Cursor := TCursor(FCursor);
end;

procedure TFSearchBox.Height(FHeight: Single);
begin
  ControlSearchBox.Size.Height := FHeight;
end;

procedure TFSearchBox.Width(FWidth: Single);
begin
  ControlSearchBox.Size.Width := FWidth;
end;

procedure TFSearchBox.Position(X, Y: Single);
begin
  ControlSearchBox.Position.X := X;
  ControlSearchBox.Position.Y := Y;
end;

procedure TFSearchBox.Align(Al: TAlignLayout);
begin
  ControlSearchBox.Align := TAlignLayout(Al);
end;

procedure TFSearchBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSearchBox.Margins.Left := FLeft;
  ControlSearchBox.Margins.Top := FTop;
  ControlSearchBox.Margins.Right := FRight;
  ControlSearchBox.Margins.Bottom := FBottom;
end;

procedure TFSearchBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSearchBox.Padding.Left := FLeft;
  ControlSearchBox.Padding.Top := FTop;
  ControlSearchBox.Padding.Right := FRight;
  ControlSearchBox.Padding.Bottom := FBottom;
end;

procedure TFSearchBox.SetHint(const FText: WideString);
begin
  ControlSearchBox.ShowHint := True;
  ControlSearchBox.Hint := string(FText);
end;

procedure TFSearchBox.SetClipChildren(FValue: Boolean);
begin
  ControlSearchBox.ClipChildren := FValue;
end;

procedure TFSearchBox.SetClipParent(FValue: Boolean);
begin
  ControlSearchBox.ClipParent := FValue;
end;

procedure TFSearchBox.BringToFront;
begin
  ControlSearchBox.BringToFront;
end;

procedure TFSearchBox.SendToBack;
begin
  ControlSearchBox.SendToBack;
end;

procedure TFSearchBox.SetTag(FTag: Integer);
begin
  ControlSearchBox.Tag := FTag;
end;

procedure TFSearchBox.Password(FValue: Boolean);
begin
  ControlSearchBox.Password := FValue;
end;

procedure TFSearchBox.ReadOnly(FValue: Boolean);
begin
  ControlSearchBox.ReadOnly := FValue;
end;

procedure TFSearchBox.Caret(FColor: TAlphaColor; FInterval: Integer; FWidth: Word);
begin
  ControlSearchBox.Caret.Color := TAlphaColor(FColor);
  ControlSearchBox.Caret.Interval := FInterval;
  ControlSearchBox.Caret.Width := FWidth;
end;

procedure TFSearchBox.TextPrompt(FText: WideString);
begin
  ControlSearchBox.TextPrompt := string(FText);
end;

procedure TFSearchBox.Text(const FText: WideString);
begin
  ControlSearchBox.Text := string(FText);
end;

procedure TFSearchBox.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlSearchBox.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFSearchBox.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlSearchBox.StyledSettings := [];

  ControlSearchBox.TextSettings.Font.Family := string(FontName);
  ControlSearchBox.TextSettings.Font.Size := FontSize;
  ControlSearchBox.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFSearchBox.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlSearchBox.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlSearchBox.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlSearchBox.TextSettings.WordWrap := FWordWrap;
end;

procedure TFSearchBox.FontStyle(FStyle: TFontStyles);
begin
  ControlSearchBox.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFSearchBox.Opacity(FOpacity: Single);
begin
  ControlSearchBox.Opacity := FOpacity;
end;

procedure TFSearchBox.RotationAngle(FValue: Single);
begin
  ControlSearchBox.RotationAngle := FValue;
end;

procedure TFSearchBox.RotationCenter(X, Y: Single);
begin
  ControlSearchBox.RotationCenter.X := X;
  ControlSearchBox.RotationCenter.Y := Y;
end;

procedure TFSearchBox.Enabled(FEnabled: Boolean);
begin
  ControlSearchBox.Enabled := FEnabled;
end;

procedure TFSearchBox.Visible(FVisible: Boolean);
begin
  ControlSearchBox.Visible := FVisible;
end;

procedure TFSearchBox.HitTest(FEnabled: Boolean);
begin
  ControlSearchBox.HitTest := FEnabled;
end;

procedure TFSearchBox.StyleLookUp(FStyle: WideString);
begin
  ControlSearchBox.StyleLookUp := string(FStyle);
end;

function TFSearchBox.IsVisible: Boolean;
begin
  Result := ControlSearchBox.IsVisible;
end;

function TFSearchBox.GetTag: Integer;
begin
  Result := ControlSearchBox.Tag;
end;

function TFSearchBox.GetLeft: Single;
begin
  Result := ControlSearchBox.Position.X;
end;

function TFSearchBox.GetTop: Single;
begin
  Result := ControlSearchBox.Position.Y;
end;

function TFSearchBox.GetHeight: Single;
begin
  Result := ControlSearchBox.Size.Height;
end;

function TFSearchBox.GetWidth: Single;
begin
  Result := ControlSearchBox.Size.Width;
end;

function TFSearchBox.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlSearchBox);
end;

procedure TFSearchBox.OnClick(Event: TNotifyEvent);
begin
  ControlSearchBox.OnClick := TNotifyEvent(Event);
end;

procedure TFSearchBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlSearchBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFSearchBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSearchBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSearchBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSearchBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFSearchBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlSearchBox.OnMouseUp := TMouseEvent(Event);
end;

function TFSearchBox.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlSearchBox);
end;

// =============================================================================
// FListBoxGroupFooter
// =============================================================================
procedure TFListBoxGroupFooter.FCreate(FParent: TFmxObject);
begin
  ControlListBoxGroupFooter := TListBoxGroupFooter.Create(TFmxObject(FParent));
  ControlListBoxGroupFooter.Parent := TFmxObject(FParent);
end;

procedure TFListBoxGroupFooter.Cursor(FCursor: TCursor);
begin
  ControlListBoxGroupFooter.Cursor := TCursor(FCursor);
end;

procedure TFListBoxGroupFooter.Height(FHeight: Single);
begin
  ControlListBoxGroupFooter.Size.Height := FHeight;
end;

procedure TFListBoxGroupFooter.Width(FWidth: Single);
begin
  ControlListBoxGroupFooter.Size.Width := FWidth;
end;

procedure TFListBoxGroupFooter.Position(X, Y: Single);
begin
  ControlListBoxGroupFooter.Position.X := X;
  ControlListBoxGroupFooter.Position.Y := Y;
end;

procedure TFListBoxGroupFooter.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBoxGroupFooter.Margins.Left := FLeft;
  ControlListBoxGroupFooter.Margins.Top := FTop;
  ControlListBoxGroupFooter.Margins.Right := FRight;
  ControlListBoxGroupFooter.Margins.Bottom := FBottom;
end;

procedure TFListBoxGroupFooter.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBoxGroupFooter.Padding.Left := FLeft;
  ControlListBoxGroupFooter.Padding.Top := FTop;
  ControlListBoxGroupFooter.Padding.Right := FRight;
  ControlListBoxGroupFooter.Padding.Bottom := FBottom;
end;

procedure TFListBoxGroupFooter.SetClipChildren(FValue: Boolean);
begin
  ControlListBoxGroupFooter.ClipChildren := FValue;
end;

procedure TFListBoxGroupFooter.SetClipParent(FValue: Boolean);
begin
  ControlListBoxGroupFooter.ClipParent := FValue;
end;

procedure TFListBoxGroupFooter.BringToFront;
begin
  ControlListBoxGroupFooter.BringToFront;
end;

procedure TFListBoxGroupFooter.SendToBack;
begin
  ControlListBoxGroupFooter.SendToBack;
end;

procedure TFListBoxGroupFooter.SetTag(FTag: Integer);
begin
  ControlListBoxGroupFooter.Tag := FTag;
end;

procedure TFListBoxGroupFooter.ImageIndex(FIndex: Integer);
begin
  ControlListBoxGroupFooter.ImageIndex := FIndex;
end;

procedure TFListBoxGroupFooter.Checked(FValue: Boolean);
begin
  ControlListBoxGroupFooter.IsChecked := FValue;
end;

procedure TFListBoxGroupFooter.Selected(FValue: Boolean);
begin
  ControlListBoxGroupFooter.IsSelected := FValue;
end;

procedure TFListBoxGroupFooter.ItemDataAccessory
  (FAccessory: TListBoxItemData.TAccessory);
begin
  ControlListBoxGroupFooter.ItemData.Accessory :=
    TListBoxItemData.TAccessory(FAccessory);
end;

procedure TFListBoxGroupFooter.ItemDataBitmap(FImgFile: WideString);
begin
  ControlListBoxGroupFooter.ItemData.Bitmap.LoadFromfile(string(FImgFile));
end;

procedure TFListBoxGroupFooter.ItemDataDetail(FDetail: WideString);
begin
  ControlListBoxGroupFooter.ItemData.Detail := string(FDetail);
end;

procedure TFListBoxGroupFooter.ItemDataText(FText: WideString);
begin
  ControlListBoxGroupFooter.ItemData.Text := string(FText);
end;

procedure TFListBoxGroupFooter.Selectable(FValue: Boolean);
begin
  ControlListBoxGroupFooter.Selectable := FValue;
end;

procedure TFListBoxGroupFooter.Text(const FText: WideString);
begin
  ControlListBoxGroupFooter.Text := string(FText);
end;

procedure TFListBoxGroupFooter.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlListBoxGroupFooter.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFListBoxGroupFooter.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlListBoxGroupFooter.StyledSettings := [];

  ControlListBoxGroupFooter.TextSettings.Font.Family := string(FontName);
  ControlListBoxGroupFooter.TextSettings.Font.Size := FontSize;
  ControlListBoxGroupFooter.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFListBoxGroupFooter.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlListBoxGroupFooter.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlListBoxGroupFooter.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlListBoxGroupFooter.TextSettings.WordWrap := FWordWrap;
end;

procedure TFListBoxGroupFooter.FontStyle(FStyle: TFontStyles);
begin
  ControlListBoxGroupFooter.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFListBoxGroupFooter.Opacity(FOpacity: Single);
begin
  ControlListBoxGroupFooter.Opacity := FOpacity;
end;

procedure TFListBoxGroupFooter.Visible(FVisible: Boolean);
begin
  ControlListBoxGroupFooter.Visible := FVisible;
end;

procedure TFListBoxGroupFooter.HitTest(FEnabled: Boolean);
begin
  ControlListBoxGroupFooter.HitTest := FEnabled;
end;

procedure TFListBoxGroupFooter.StyleLookUp(FStyle: WideString);
begin
  ControlListBoxGroupFooter.StyleLookUp := string(FStyle);
end;

function TFListBoxGroupFooter.IsChecked: Boolean;
begin
  Result := ControlListBoxGroupFooter.IsChecked;
end;

function TFListBoxGroupFooter.IsSelected: Boolean;
begin
  Result := ControlListBoxGroupFooter.IsSelected;
end;

function TFListBoxGroupFooter.IsVisible: Boolean;
begin
  Result := ControlListBoxGroupFooter.Visible;
end;

function TFListBoxGroupFooter.GetIndex: Integer;
begin
  Result := ControlListBoxGroupFooter.Index;
end;

function TFListBoxGroupFooter.GeText: WideString;
begin
  Result := ControlListBoxGroupFooter.Text;
end;

function TFListBoxGroupFooter.GetTag: Integer;
begin
  Result := ControlListBoxGroupFooter.Tag;
end;

function TFListBoxGroupFooter.GetLeft: Single;
begin
  Result := ControlListBoxGroupFooter.Position.X;
end;

function TFListBoxGroupFooter.GetTop: Single;
begin
  Result := ControlListBoxGroupFooter.Position.Y;
end;

function TFListBoxGroupFooter.GetHeight: Single;
begin
  Result := ControlListBoxGroupFooter.Size.Height;
end;

function TFListBoxGroupFooter.GetWidth: Single;
begin
  Result := ControlListBoxGroupFooter.Size.Width;
end;

function TFListBoxGroupFooter.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlListBoxGroupFooter);
end;

procedure TFListBoxGroupFooter.OnClick(Event: TNotifyEvent);
begin
  ControlListBoxGroupFooter.OnClick := TNotifyEvent(Event);
end;

procedure TFListBoxGroupFooter.OnMouseDown(Event: TMouseEvent);
begin
  ControlListBoxGroupFooter.OnMouseDown := TMouseEvent(Event);
end;

procedure TFListBoxGroupFooter.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlListBoxGroupFooter.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFListBoxGroupFooter.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlListBoxGroupFooter.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFListBoxGroupFooter.OnMouseUp(Event: TMouseEvent);
begin
  ControlListBoxGroupFooter.OnMouseUp := TMouseEvent(Event);
end;

function TFListBoxGroupFooter.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlListBoxGroupFooter);
end;

// =============================================================================
// FListBoxGroupHeader
// =============================================================================
procedure TFListBoxGroupHeader.FCreate(FParent: TFmxObject);
begin
  ControlListBoxGroupHeader := TListBoxGroupHeader.Create(TFmxObject(FParent));
  ControlListBoxGroupHeader.Parent := TFmxObject(FParent);
end;

procedure TFListBoxGroupHeader.Cursor(FCursor: TCursor);
begin
  ControlListBoxGroupHeader.Cursor := TCursor(FCursor);
end;

procedure TFListBoxGroupHeader.Height(FHeight: Single);
begin
  ControlListBoxGroupHeader.Size.Height := FHeight;
end;

procedure TFListBoxGroupHeader.Width(FWidth: Single);
begin
  ControlListBoxGroupHeader.Size.Width := FWidth;
end;

procedure TFListBoxGroupHeader.Position(X, Y: Single);
begin
  ControlListBoxGroupHeader.Position.X := X;
  ControlListBoxGroupHeader.Position.Y := Y;
end;

procedure TFListBoxGroupHeader.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBoxGroupHeader.Margins.Left := FLeft;
  ControlListBoxGroupHeader.Margins.Top := FTop;
  ControlListBoxGroupHeader.Margins.Right := FRight;
  ControlListBoxGroupHeader.Margins.Bottom := FBottom;
end;

procedure TFListBoxGroupHeader.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBoxGroupHeader.Padding.Left := FLeft;
  ControlListBoxGroupHeader.Padding.Top := FTop;
  ControlListBoxGroupHeader.Padding.Right := FRight;
  ControlListBoxGroupHeader.Padding.Bottom := FBottom;
end;

procedure TFListBoxGroupHeader.SetClipChildren(FValue: Boolean);
begin
  ControlListBoxGroupHeader.ClipChildren := FValue;
end;

procedure TFListBoxGroupHeader.SetClipParent(FValue: Boolean);
begin
  ControlListBoxGroupHeader.ClipParent := FValue;
end;

procedure TFListBoxGroupHeader.BringToFront;
begin
  ControlListBoxGroupHeader.BringToFront;
end;

procedure TFListBoxGroupHeader.SendToBack;
begin
  ControlListBoxGroupHeader.SendToBack;
end;

procedure TFListBoxGroupHeader.SetTag(FTag: Integer);
begin
  ControlListBoxGroupHeader.Tag := FTag;
end;

procedure TFListBoxGroupHeader.ImageIndex(FIndex: Integer);
begin
  ControlListBoxGroupHeader.ImageIndex := FIndex;
end;

procedure TFListBoxGroupHeader.Checked(FValue: Boolean);
begin
  ControlListBoxGroupHeader.IsChecked := FValue;
end;

procedure TFListBoxGroupHeader.Selected(FValue: Boolean);
begin
  ControlListBoxGroupHeader.IsSelected := FValue;
end;

procedure TFListBoxGroupHeader.ItemDataAccessory
  (FAccessory: TListBoxItemData.TAccessory);
begin
  ControlListBoxGroupHeader.ItemData.Accessory :=
    TListBoxItemData.TAccessory(FAccessory);
end;

procedure TFListBoxGroupHeader.ItemDataBitmap(FImgFile: WideString);
begin
  ControlListBoxGroupHeader.ItemData.Bitmap.LoadFromfile(string(FImgFile));
end;

procedure TFListBoxGroupHeader.ItemDataDetail(FDetail: WideString);
begin
  ControlListBoxGroupHeader.ItemData.Detail := string(FDetail);
end;

procedure TFListBoxGroupHeader.ItemDataText(FText: WideString);
begin
  ControlListBoxGroupHeader.ItemData.Text := string(FText);
end;

procedure TFListBoxGroupHeader.Selectable(FValue: Boolean);
begin
  ControlListBoxGroupHeader.Selectable := FValue;
end;

procedure TFListBoxGroupHeader.Text(const FText: WideString);
begin
  ControlListBoxGroupHeader.Text := string(FText);
end;

procedure TFListBoxGroupHeader.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlListBoxGroupHeader.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFListBoxGroupHeader.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlListBoxGroupHeader.StyledSettings := [];

  ControlListBoxGroupHeader.TextSettings.Font.Family := string(FontName);
  ControlListBoxGroupHeader.TextSettings.Font.Size := FontSize;
  ControlListBoxGroupHeader.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFListBoxGroupHeader.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlListBoxGroupHeader.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlListBoxGroupHeader.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlListBoxGroupHeader.TextSettings.WordWrap := FWordWrap;
end;

procedure TFListBoxGroupHeader.FontStyle(FStyle: TFontStyles);
begin
  ControlListBoxGroupHeader.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFListBoxGroupHeader.Opacity(FOpacity: Single);
begin
  ControlListBoxGroupHeader.Opacity := FOpacity;
end;

procedure TFListBoxGroupHeader.Visible(FVisible: Boolean);
begin
  ControlListBoxGroupHeader.Visible := FVisible;
end;

procedure TFListBoxGroupHeader.HitTest(FEnabled: Boolean);
begin
  ControlListBoxGroupHeader.HitTest := FEnabled;
end;

procedure TFListBoxGroupHeader.StyleLookUp(FStyle: WideString);
begin
  ControlListBoxGroupHeader.StyleLookUp := string(FStyle);
end;

function TFListBoxGroupHeader.IsChecked: Boolean;
begin
  Result := ControlListBoxGroupHeader.IsChecked;
end;

function TFListBoxGroupHeader.IsSelected: Boolean;
begin
  Result := ControlListBoxGroupHeader.IsSelected;
end;

function TFListBoxGroupHeader.IsVisible: Boolean;
begin
  Result := ControlListBoxGroupHeader.Visible;
end;

function TFListBoxGroupHeader.GetIndex: Integer;
begin
  Result := ControlListBoxGroupHeader.Index;
end;

function TFListBoxGroupHeader.GeText: WideString;
begin
  Result := ControlListBoxGroupHeader.Text;
end;

function TFListBoxGroupHeader.GetTag: Integer;
begin
  Result := ControlListBoxGroupHeader.Tag;
end;

function TFListBoxGroupHeader.GetLeft: Single;
begin
  Result := ControlListBoxGroupHeader.Position.X;
end;

function TFListBoxGroupHeader.GetTop: Single;
begin
  Result := ControlListBoxGroupHeader.Position.Y;
end;

function TFListBoxGroupHeader.GetHeight: Single;
begin
  Result := ControlListBoxGroupHeader.Size.Height;
end;

function TFListBoxGroupHeader.GetWidth: Single;
begin
  Result := ControlListBoxGroupHeader.Size.Width;
end;

function TFListBoxGroupHeader.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlListBoxGroupHeader);
end;

procedure TFListBoxGroupHeader.OnClick(Event: TNotifyEvent);
begin
  ControlListBoxGroupHeader.OnClick := TNotifyEvent(Event);
end;

procedure TFListBoxGroupHeader.OnMouseDown(Event: TMouseEvent);
begin
  ControlListBoxGroupHeader.OnMouseDown := TMouseEvent(Event);
end;

procedure TFListBoxGroupHeader.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlListBoxGroupHeader.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFListBoxGroupHeader.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlListBoxGroupHeader.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFListBoxGroupHeader.OnMouseUp(Event: TMouseEvent);
begin
  ControlListBoxGroupHeader.OnMouseUp := TMouseEvent(Event);
end;

function TFListBoxGroupHeader.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlListBoxGroupHeader);
end;

// =============================================================================
// FListBoxHeader
// =============================================================================
procedure TFListBoxHeader.FCreate(FParent: TFmxObject);
begin
  ControlListBoxHeader := TListBoxHeader.Create(TFmxObject(FParent));
  ControlListBoxHeader.Parent := TFmxObject(FParent);
end;

procedure TFListBoxHeader.Cursor(FCursor: TCursor);
begin
  ControlListBoxHeader.Cursor := TCursor(FCursor);
end;

procedure TFListBoxHeader.Height(FHeight: Single);
begin
  ControlListBoxHeader.Size.Height := FHeight;
end;

procedure TFListBoxHeader.Width(FWidth: Single);
begin
  ControlListBoxHeader.Size.Width := FWidth;
end;

procedure TFListBoxHeader.Position(X, Y: Single);
begin
  ControlListBoxHeader.Position.X := X;
  ControlListBoxHeader.Position.Y := Y;
end;

procedure TFListBoxHeader.Align(Al: TAlignLayout);
begin
  ControlListBoxHeader.Align := TAlignLayout(Al);
end;

procedure TFListBoxHeader.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBoxHeader.Margins.Left := FLeft;
  ControlListBoxHeader.Margins.Top := FTop;
  ControlListBoxHeader.Margins.Right := FRight;
  ControlListBoxHeader.Margins.Bottom := FBottom;
end;

procedure TFListBoxHeader.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBoxHeader.Padding.Left := FLeft;
  ControlListBoxHeader.Padding.Top := FTop;
  ControlListBoxHeader.Padding.Right := FRight;
  ControlListBoxHeader.Padding.Bottom := FBottom;
end;

procedure TFListBoxHeader.SetHint(const FText: WideString);
begin
  ControlListBoxHeader.ShowHint := True;
  ControlListBoxHeader.Hint := string(FText);
end;

procedure TFListBoxHeader.SetClipChildren(FValue: Boolean);
begin
  ControlListBoxHeader.ClipChildren := FValue;
end;

procedure TFListBoxHeader.SetClipParent(FValue: Boolean);
begin
  ControlListBoxHeader.ClipParent := FValue;
end;

procedure TFListBoxHeader.BringToFront;
begin
  ControlListBoxHeader.BringToFront;
end;

procedure TFListBoxHeader.SendToBack;
begin
  ControlListBoxHeader.SendToBack;
end;

procedure TFListBoxHeader.SetTag(FTag: Integer);
begin
  ControlListBoxHeader.Tag := FTag;
end;

procedure TFListBoxHeader.Opacity(FOpacity: Single);
begin
  ControlListBoxHeader.Opacity := FOpacity;
end;

procedure TFListBoxHeader.RotationAngle(FValue: Single);
begin
  ControlListBoxHeader.RotationAngle := FValue;
end;

procedure TFListBoxHeader.RotationCenter(X, Y: Single);
begin
  ControlListBoxHeader.RotationCenter.X := X;
  ControlListBoxHeader.RotationCenter.Y := Y;
end;

procedure TFListBoxHeader.Enabled(FEnabled: Boolean);
begin
  ControlListBoxHeader.Enabled := FEnabled;
end;

procedure TFListBoxHeader.Visible(FVisible: Boolean);
begin
  ControlListBoxHeader.Visible := FVisible;
end;

procedure TFListBoxHeader.HitTest(FEnabled: Boolean);
begin
  ControlListBoxHeader.HitTest := FEnabled;
end;

procedure TFListBoxHeader.StyleLookUp(FStyle: WideString);
begin
  ControlListBoxHeader.StyleLookUp := string(FStyle);
end;

function TFListBoxHeader.IsEnabled: Boolean;
begin
  Result := ControlListBoxHeader.Enabled;
end;

function TFListBoxHeader.IsVisible: Boolean;
begin
  Result := ControlListBoxHeader.IsVisible;
end;

function TFListBoxHeader.GetTag: Integer;
begin
  Result := ControlListBoxHeader.Tag;
end;

function TFListBoxHeader.GetLeft: Single;
begin
  Result := ControlListBoxHeader.Position.X;
end;

function TFListBoxHeader.GetTop: Single;
begin
  Result := ControlListBoxHeader.Position.Y;
end;

function TFListBoxHeader.GetHeight: Single;
begin
  Result := ControlListBoxHeader.Size.Height;
end;

function TFListBoxHeader.GetWidth: Single;
begin
  Result := ControlListBoxHeader.Size.Width;
end;

function TFListBoxHeader.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlListBoxHeader);
end;

procedure TFListBoxHeader.OnClick(Event: TNotifyEvent);
begin
  ControlListBoxHeader.OnClick := TNotifyEvent(Event);
end;

procedure TFListBoxHeader.OnMouseDown(Event: TMouseEvent);
begin
  ControlListBoxHeader.OnMouseDown := TMouseEvent(Event);
end;

procedure TFListBoxHeader.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlListBoxHeader.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFListBoxHeader.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlListBoxHeader.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFListBoxHeader.OnMouseUp(Event: TMouseEvent);
begin
  ControlListBoxHeader.OnMouseUp := TMouseEvent(Event);
end;

function TFListBoxHeader.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlListBoxHeader);
end;

// =============================================================================
// FListBoxItem
// =============================================================================
procedure TFListBoxItem.FCreate(FParent: TFmxObject);
begin
  ControlListBoxItem := TListBoxItem.Create(TFmxObject(FParent));
  ControlListBoxItem.Parent := TFmxObject(FParent);
end;

procedure TFListBoxItem.Cursor(FCursor: TCursor);
begin
  ControlListBoxItem.Cursor := TCursor(FCursor);
end;

procedure TFListBoxItem.Height(FHeight: Single);
begin
  ControlListBoxItem.Size.Height := FHeight;
end;

procedure TFListBoxItem.Width(FWidth: Single);
begin
  ControlListBoxItem.Size.Width := FWidth;
end;

procedure TFListBoxItem.Position(X, Y: Single);
begin
  ControlListBoxItem.Position.X := X;
  ControlListBoxItem.Position.Y := Y;
end;

procedure TFListBoxItem.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBoxItem.Margins.Left := FLeft;
  ControlListBoxItem.Margins.Top := FTop;
  ControlListBoxItem.Margins.Right := FRight;
  ControlListBoxItem.Margins.Bottom := FBottom;
end;

procedure TFListBoxItem.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBoxItem.Padding.Left := FLeft;
  ControlListBoxItem.Padding.Top := FTop;
  ControlListBoxItem.Padding.Right := FRight;
  ControlListBoxItem.Padding.Bottom := FBottom;
end;

procedure TFListBoxItem.SetClipChildren(FValue: Boolean);
begin
  ControlListBoxItem.ClipChildren := FValue;
end;

procedure TFListBoxItem.SetClipParent(FValue: Boolean);
begin
  ControlListBoxItem.ClipParent := FValue;
end;

procedure TFListBoxItem.BringToFront;
begin
  ControlListBoxItem.BringToFront;
end;

procedure TFListBoxItem.SendToBack;
begin
  ControlListBoxItem.SendToBack;
end;

procedure TFListBoxItem.SetTag(FTag: Integer);
begin
  ControlListBoxItem.Tag := FTag;
end;

procedure TFListBoxItem.ImageIndex(FIndex: Integer);
begin
  ControlListBoxItem.ImageIndex := FIndex;
end;

procedure TFListBoxItem.Checked(FValue: Boolean);
begin
  ControlListBoxItem.IsChecked := FValue;
end;

procedure TFListBoxItem.Selected(FValue: Boolean);
begin
  ControlListBoxItem.IsSelected := FValue;
end;

procedure TFListBoxItem.ItemDataAccessory(FAccessory
  : TListBoxItemData.TAccessory);
begin
  ControlListBoxItem.ItemData.Accessory :=
    TListBoxItemData.TAccessory(FAccessory);
end;

procedure TFListBoxItem.ItemDataBitmap(FImgFile: WideString);
begin
  ControlListBoxItem.ItemData.Bitmap.LoadFromfile(string(FImgFile));
end;

procedure TFListBoxItem.ItemDataDetail(FDetail: WideString);
begin
  ControlListBoxItem.ItemData.Detail := string(FDetail);
end;

procedure TFListBoxItem.ItemDataText(FText: WideString);
begin
  ControlListBoxItem.ItemData.Text := string(FText);
end;

procedure TFListBoxItem.Selectable(FValue: Boolean);
begin
  ControlListBoxItem.Selectable := FValue;
end;

procedure TFListBoxItem.Text(const FText: WideString);
begin
  ControlListBoxItem.Text := string(FText);
end;

procedure TFListBoxItem.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlListBoxItem.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFListBoxItem.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlListBoxItem.StyledSettings := [];

  ControlListBoxItem.TextSettings.Font.Family := string(FontName);
  ControlListBoxItem.TextSettings.Font.Size := FontSize;
  ControlListBoxItem.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFListBoxItem.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlListBoxItem.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlListBoxItem.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlListBoxItem.TextSettings.WordWrap := FWordWrap;
end;

procedure TFListBoxItem.FontStyle(FStyle: TFontStyles);
begin
  ControlListBoxItem.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFListBoxItem.Opacity(FOpacity: Single);
begin
  ControlListBoxItem.Opacity := FOpacity;
end;

procedure TFListBoxItem.Enabled(FEnabled: Boolean);
begin
  ControlListBoxItem.Enabled := FEnabled;
end;

procedure TFListBoxItem.Visible(FVisible: Boolean);
begin
  ControlListBoxItem.Visible := FVisible;
end;

procedure TFListBoxItem.HitTest(FEnabled: Boolean);
begin
  ControlListBoxItem.HitTest := FEnabled;
end;

procedure TFListBoxItem.StyleLookUp(FStyle: WideString);
begin
  ControlListBoxItem.StyleLookUp := string(FStyle);
end;

procedure TFListBoxItem.Free;
begin
  ControlListBoxItem.Free;
end;

function TFListBoxItem.IsChecked: Boolean;
begin
  Result := ControlListBoxItem.IsChecked;
end;

function TFListBoxItem.IsSelected: Boolean;
begin
  Result := ControlListBoxItem.IsSelected;
end;

function TFListBoxItem.IsVisible: Boolean;
begin
  Result := ControlListBoxItem.IsVisible;
end;

function TFListBoxItem.GetIndex: Integer;
begin
  Result := ControlListBoxItem.Index;
end;

function TFListBoxItem.GetText: WideString;
begin
  Result := ControlListBoxItem.Text;
end;

function TFListBoxItem.GetTag: Integer;
begin
  Result := ControlListBoxItem.Tag;
end;

function TFListBoxItem.GetLeft: Single;
begin
  Result := ControlListBoxItem.Position.X;
end;

function TFListBoxItem.GetTop: Single;
begin
  Result := ControlListBoxItem.Position.Y;
end;

function TFListBoxItem.GetHeight: Single;
begin
  Result := ControlListBoxItem.Size.Height;
end;

function TFListBoxItem.GetWidth: Single;
begin
  Result := ControlListBoxItem.Size.Width;
end;

function TFListBoxItem.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlListBoxItem);
end;

procedure TFListBoxItem.OnChangeCheck(Event: TNotifyEvent);
begin
  ControlListBoxItem.OnChangeCheck := TNotifyEvent(Event);
end;

procedure TFListBoxItem.OnClick(Event: TNotifyEvent);
begin
  ControlListBoxItem.OnClick := TNotifyEvent(Event);
end;

procedure TFListBoxItem.OnMouseDown(Event: TMouseEvent);
begin
  ControlListBoxItem.OnMouseDown := TMouseEvent(Event);
end;

procedure TFListBoxItem.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlListBoxItem.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFListBoxItem.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlListBoxItem.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFListBoxItem.OnMouseUp(Event: TMouseEvent);
begin
  ControlListBoxItem.OnMouseUp := TMouseEvent(Event);
end;

function TFListBoxItem.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlListBoxItem);
end;

// =============================================================================
// FListBox
// =============================================================================
procedure TFListBox.FCreate(FParent: TFmxObject);
begin
  ControlListBox := TListBox.Create(nil);
  ControlListBox.Parent := TFmxObject(FParent);
  ControlListBox.OnDragDrop := DragDrop;
  ControlListBox.OnDragOver := DragOver;
end;

procedure TFListBox.FileDropEnabled(FValue: Boolean);
begin
  FDropEnabled := FValue;
end;

procedure TFListBox.DragDrop(Sender: TObject; const Data: TDragObject;
  const Point: TPointF);
var
  i: Integer;
begin
  if not FDropEnabled then
    Exit;

  ControlListBox.BeginUpdate;
  try
    for i := 0 to High(Data.Files) do
    begin
      ControlListBox.Items.Add(Data.Files[i]);
      NotifyFileDrop(ControlListBox, Data.Files[i]);
    end;
  finally
    ControlListBox.EndUpdate;
  end;
end;

procedure TFListBox.DragOver(Sender: TObject; const Data: TDragObject;
  const Point: TPointF; var Operation: TDragOperation);
begin
  if FDropEnabled then
    Operation := TDragOperation.Copy
  else
    Operation := TDragOperation.None;
end;

procedure TFListBox.Cursor(FCursor: TCursor);
begin
  ControlListBox.Cursor := TCursor(FCursor);
end;

procedure TFListBox.Left(FLeft: Single);
begin
  ControlListBox.Position.X := FLeft;
end;

procedure TFListBox.Top(FTop: Single);
begin
  ControlListBox.Position.Y := FTop;
end;

procedure TFListBox.Height(FHeight: Single);
begin
  ControlListBox.Size.Height := FHeight;
end;

procedure TFListBox.Width(FWidth: Single);
begin
  ControlListBox.Size.Width := FWidth;
end;

procedure TFListBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlListBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFListBox.Position(X, Y: Single);
begin
  ControlListBox.Position.X := X;
  ControlListBox.Position.Y := Y;
end;

procedure TFListBox.Align(Al: TAlignLayout);
begin
  ControlListBox.Align := TAlignLayout(Al);
end;

procedure TFListBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBox.Margins.Left := FLeft;
  ControlListBox.Margins.Top := FTop;
  ControlListBox.Margins.Right := FRight;
  ControlListBox.Margins.Bottom := FBottom;
end;

procedure TFListBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlListBox.Padding.Left := FLeft;
  ControlListBox.Padding.Top := FTop;
  ControlListBox.Padding.Right := FRight;
  ControlListBox.Padding.Bottom := FBottom;
end;

procedure TFListBox.SetHint(const FText: WideString);
begin
  ControlListBox.ShowHint := True;
  ControlListBox.Hint := string(FText);
end;

procedure TFListBox.SetClipChildren(FValue: Boolean);
begin
  ControlListBox.ClipChildren := FValue;
end;

procedure TFListBox.SetClipParent(FValue: Boolean);
begin
  ControlListBox.ClipParent := FValue;
end;

procedure TFListBox.BringToFront;
begin
  ControlListBox.BringToFront;
end;

procedure TFListBox.SendToBack;
begin
  ControlListBox.SendToBack;
end;

procedure TFListBox.SetTag(FTag: Integer);
begin
  ControlListBox.Tag := FTag;
end;

procedure TFListBox.AlternatingRowBackground(FValue: Boolean);
begin
  ControlListBox.AlternatingRowBackground := FValue;
end;

procedure TFListBox.AutoHide(FValue: Boolean);
begin
  ControlListBox.AutoHide := FValue;
end;

procedure TFListBox.CanFocus(FValue: Boolean);
begin
  ControlListBox.CanFocus := FValue;
end;

procedure TFListBox.CanParentFocus(FValue: Boolean);
begin
  ControlListBox.CanParentFocus := FValue;
end;

procedure TFListBox.Columns(FValue: Integer);
begin
  ControlListBox.Columns := FValue;
end;

procedure TFListBox.DefaultItemStyle(FItemStyle: WideString);
begin
  ControlListBox.DefaultItemStyles.ItemStyle := string(FItemStyle);
end;

procedure TFListBox.DefaultItemGroupHeaderStyle(FGpHeaderStyle: WideString);
begin
  ControlListBox.DefaultItemStyles.GroupHeaderStyle := string(FGpHeaderStyle);
end;

procedure TFListBox.DefaultItemGroupFooterStyle(FGpFooterStyle: WideString);
begin
  ControlListBox.DefaultItemStyles.GroupFooterStyle := string(FGpFooterStyle);
end;

procedure TFListBox.GroupingKind(FGroupingKind: TListGroupingKind);
begin
  ControlListBox.GroupingKind := TListGroupingKind(FGroupingKind);
end;

procedure TFListBox.ItemHeight(FHeight: Single);
begin
  ControlListBox.ItemHeight := FHeight;
end;

procedure TFListBox.ItemWidth(FWidth: Single);
begin
  ControlListBox.ItemWidth := FWidth;
end;

procedure TFListBox.AddItem(FItem: TListBoxItem);
begin
  ControlListBox.Content.AddObject(TListBoxItem(FItem));
end;

procedure TFListBox.AddItemHeader(FHeader: TListBoxHeader);
begin
  ControlListBox.AddObject(TListBoxHeader(FHeader));
end;

procedure TFListBox.AddItemGroupHeader(FGpHeader: TListBoxGroupHeader);
begin
  ControlListBox.AddObject(TListBoxGroupHeader(FGpHeader));
end;

procedure TFListBox.AddItemGroupFooter(FGpFooter: TListBoxGroupFooter);
begin
  ControlListBox.AddObject(TListBoxGroupFooter(FGpFooter));
end;

procedure TFListBox.AddItemSearchBox(FSrchBox: TSearchBox);
begin
  ControlListBox.AddObject(TSearchBox(FSrchBox));
end;

procedure TFListBox.SetItemIndex(FIndex: Integer);
begin
  ControlListBox.ItemIndex := FIndex;
end;

procedure TFListBox.ListStyle(FListStyle: TListStyle);
begin
  ControlListBox.ListStyle := TListStyle(FListStyle);
end;

procedure TFListBox.MultiSelectStyle(FMultiSelectStyle: TMultiSelectStyle);
begin
  ControlListBox.MultiSelectStyle := TMultiSelectStyle(FMultiSelectStyle);
end;

procedure TFListBox.ShowCheckboxes(FShow: Boolean);
begin
  ControlListBox.ShowCheckboxes := FShow;
end;

procedure TFListBox.ShowScrollBars(FShow: Boolean);
begin
  ControlListBox.ShowScrollBars := FShow;
end;

procedure TFListBox.SmoothScroll(FEnabled: Boolean);
begin
  ControlListBox.AniCalculations.Animation := FEnabled;
end;

procedure TFListBox.Sorted(FValue: Boolean);
begin
  ControlListBox.Sorted := FValue;
end;

procedure TFListBox.Clear;
begin
  ControlListBox.Clear;
end;

procedure TFListBox.SelectAll;
begin
  ControlListBox.SelectAll;
end;

procedure TFListBox.ClearSelection;
begin
  ControlListBox.ClearSelection;
end;

procedure TFListBox.DeleteItem(FIndex: Integer);
begin
  if (FIndex >= 0) and (FIndex < ControlListBox.Count) then
    ControlListBox.ListItems[FIndex].Free;
end;

procedure TFListBox.MultiSelect(FValue: Boolean);
begin
  ControlListBox.MultiSelect := FValue;
end;

procedure TFListBox.Images(FImgList: TImageList);
begin
  ControlListBox.Images := TImageList(FImgList);
end;

procedure TFListBox.BeginUpdate;
begin
  ControlListBox.BeginUpdate;
end;

procedure TFListBox.EndUpdate;
begin
  ControlListBox.EndUpdate;
end;

procedure TFListBox.Opacity(FOpacity: Single);
begin
  ControlListBox.Opacity := FOpacity;
end;

procedure TFListBox.RotationAngle(FValue: Single);
begin
  ControlListBox.RotationAngle := FValue;
end;

procedure TFListBox.RotationCenter(X, Y: Single);
begin
  ControlListBox.RotationCenter.X := X;
  ControlListBox.RotationCenter.Y := Y;
end;

procedure TFListBox.Enabled(FEnabled: Boolean);
begin
  ControlListBox.Enabled := FEnabled;
end;

procedure TFListBox.Visible(FVisible: Boolean);
begin
  ControlListBox.Visible := FVisible;
end;

procedure TFListBox.HitTest(FEnabled: Boolean);
begin
  ControlListBox.HitTest := FEnabled;
end;

procedure TFListBox.StyleLookUp(FStyle: WideString);
begin
  ControlListBox.StyleLookUp := string(FStyle);
end;

function TFListBox.Count: Integer;
begin
  Result := ControlListBox.Count;
end;

function TFListBox.Selected: TListBoxItem;
begin
  Result := ControlListBox.ListItems[ControlListBox.ItemIndex]
end;

function TFListBox.IsItemChecked(FIndex: Integer): Boolean;
begin
  if (FIndex >= 0) and (FIndex < ControlListBox.Count) then
    Result := ControlListBox.ListItems[FIndex].IsChecked
  else
    Result := False;
end;

function TFListBox.IsItemSelected(FIndex: Integer): Boolean;
begin
  Result := ControlListBox.ItemByIndex(FIndex).IsSelected;
end;

function TFListBox.IsVisible: Boolean;
begin
  Result := ControlListBox.Visible;
end;

function TFListBox.GetItemIndex: Integer;
begin
  Result := ControlListBox.ItemIndex;
end;

function TFListBox.GetIndexOfItem(FItemText: WideString): Integer;
begin
  Result := ControlListBox.Items.IndexOf(FItemText);
end;

function TFListBox.GetItem(FIndex: Integer): TListBoxItem;
begin
  Result := ControlListBox.ListItems[FIndex]
end;

function TFListBox.GetItemText(FIndex: Integer): WideString;
begin
  Result := ControlListBox.Items[FIndex];
end;

function TFListBox.GetItemHeight: Single;
begin
  Result := ControlListBox.ItemHeight;
end;

function TFListBox.GetItemWidth: Single;
begin
  Result := ControlListBox.ItemWidth;
end;

function TFListBox.GetTag: Integer;
begin
  Result := ControlListBox.Tag;
end;

function TFListBox.GetLeft: Single;
begin
  Result := ControlListBox.Position.X;
end;

function TFListBox.GetTop: Single;
begin
  Result := ControlListBox.Position.Y;
end;

function TFListBox.GetHeight: Single;
begin
  Result := ControlListBox.Size.Height;
end;

function TFListBox.GetWidth: Single;
begin
  Result := ControlListBox.Size.Width;
end;

function TFListBox.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlListBox);
end;

procedure TFListBox.OnChange(Event: TNotifyEvent);
begin
  ControlListBox.OnChange := TNotifyEvent(Event);
end;

procedure TFListBox.OnChangeCheck(Event: TNotifyEvent);
begin
  ControlListBox.OnChange := TNotifyEvent(Event);
end;

procedure TFListBox.OnClick(Event: TNotifyEvent);
begin
  ControlListBox.OnClick := TNotifyEvent(Event);
end;

procedure TFListBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlListBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFListBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlListBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFListBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlListBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFListBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlListBox.OnMouseUp := TMouseEvent(Event);
end;

function TFListBox.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlListBox);
end;

// =============================================================================
// FComboBox
// =============================================================================
procedure TFComboBox.FCreate(FParent: TFmxObject);
begin
  ControlComboBox := TComboBox.Create(nil);
  ControlComboBox.Parent := TFmxObject(FParent);
end;

procedure TFComboBox.Cursor(FCursor: TCursor);
begin
  ControlComboBox.Cursor := TCursor(FCursor);
end;

procedure TFComboBox.Left(FLeft: Single);
begin
  ControlComboBox.Position.X := FLeft;
end;

procedure TFComboBox.Top(FTop: Single);
begin
  ControlComboBox.Position.Y := FTop;
end;

procedure TFComboBox.Height(FHeight: Single);
begin
  ControlComboBox.Size.Height := FHeight;
end;

procedure TFComboBox.Width(FWidth: Single);
begin
  ControlComboBox.Size.Width := FWidth;
end;

procedure TFComboBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlComboBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFComboBox.Position(X, Y: Single);
begin
  ControlComboBox.Position.X := X;
  ControlComboBox.Position.Y := Y;
end;

procedure TFComboBox.Align(Al: TAlignLayout);
begin
  ControlComboBox.Align := TAlignLayout(Al);
end;

procedure TFComboBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlComboBox.Margins.Left := FLeft;
  ControlComboBox.Margins.Top := FTop;
  ControlComboBox.Margins.Right := FRight;
  ControlComboBox.Margins.Bottom := FBottom;
end;

procedure TFComboBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlComboBox.Padding.Left := FLeft;
  ControlComboBox.Padding.Top := FTop;
  ControlComboBox.Padding.Right := FRight;
  ControlComboBox.Padding.Bottom := FBottom;
end;

procedure TFComboBox.SetHint(const FText: WideString);
begin
  ControlComboBox.ShowHint := True;
  ControlComboBox.Hint := string(FText);
end;

procedure TFComboBox.SetClipChildren(FValue: Boolean);
begin
  ControlComboBox.ClipChildren := FValue;
end;

procedure TFComboBox.SetClipParent(FValue: Boolean);
begin
  ControlComboBox.ClipParent := FValue;
end;

procedure TFComboBox.BringToFront;
begin
  ControlComboBox.BringToFront;
end;

procedure TFComboBox.SendToBack;
begin
  ControlComboBox.SendToBack;
end;

procedure TFComboBox.SetTag(FTag: Integer);
begin
  ControlComboBox.Tag := FTag;
end;

procedure TFComboBox.AddItem(const FItem: WideString);
begin
  ControlComboBox.Items.Add(string(FItem));
end;

procedure TFComboBox.ItemHeight(FHeight: Single);
begin
  ControlComboBox.ItemHeight := FHeight;
end;

procedure TFComboBox.ItemWidth(FWidth: Single);
begin
  ControlComboBox.ItemWidth := FWidth;
end;

procedure TFComboBox.SetItemIndex(FIndex: Integer);
begin
  ControlComboBox.ItemIndex := FIndex;
end;

procedure TFComboBox.SetDropDownCount(Count: Integer);
begin
  ControlComboBox.DropDownCount := Count;
end;

procedure TFComboBox.Placement(Value: TPlacement);
begin
  ControlComboBox.Placement := Value;
end;

procedure TFComboBox.Clear;
begin
  ControlComboBox.Clear;
end;

procedure TFComboBox.DropDown;
begin
  ControlComboBox.DropDown;
end;

procedure TFComboBox.StyledSettings(FStyledSettings: TStyledSettings);
var
  i: integer;
begin
  ControlComboBox.DropdownKind:= TDropdownKind.Native;

  for i := 0 to (ControlComboBox.Count - 1) do
    ControlComboBox.ListItems[i].StyledSettings :=
      TStyledSettings(FStyledSettings);
end;

procedure TFComboBox.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
var
  i: integer;
begin
  ControlComboBox.DropdownKind:= TDropdownKind.Custom;

  for i := 0 to (ControlComboBox.Count - 1) do
  begin
    ControlComboBox.ListItems[i].StyledSettings := [];
    ControlComboBox.ListItems[i].Font.Family := string(FontName);
    ControlComboBox.ListItems[i].Font.Size := FontSize;
    ControlComboBox.ListItems[i].FontColor := TAlphaColor(FontColor);
  end;
end;

procedure TFComboBox.FontStyle(FStyle: TFontStyles);
var
  i: integer;
begin
  ControlComboBox.DropdownKind:= TDropdownKind.Custom;

  for i := 0 to (ControlComboBox.Count - 1) do
    ControlComboBox.ListItems[i].Font.Style := TFontStyles(FStyle);
end;

procedure TFComboBox.Opacity(FOpacity: Single);
begin
  ControlComboBox.Opacity := FOpacity;
end;

procedure TFComboBox.RotationAngle(FValue: Single);
begin
  ControlComboBox.RotationAngle := FValue;
end;

procedure TFComboBox.RotationCenter(X, Y: Single);
begin
  ControlComboBox.RotationCenter.X := X;
  ControlComboBox.RotationCenter.Y := Y;
end;

procedure TFComboBox.Enabled(FEnabled: Boolean);
begin
  ControlComboBox.Enabled := FEnabled;
end;

procedure TFComboBox.Visible(FVisible: Boolean);
begin
  ControlComboBox.Visible := FVisible;
end;

procedure TFComboBox.HitTest(FEnabled: Boolean);
begin
  ControlComboBox.HitTest := FEnabled;
end;

procedure TFComboBox.StyleLookUp(FStyle: WideString);
begin
  ControlComboBox.StyleLookUp := string(FStyle);
end;

procedure TFComboBox.BeginUpdate;
begin
  ControlComboBox.BeginUpdate;
end;

procedure TFComboBox.EndUpdate;
begin
  ControlComboBox.EndUpdate;
end;

function TFComboBox.IsVisible: Boolean;
begin
  Result := ControlComboBox.Visible;
end;

function TFComboBox.GetItem(FIndex: Integer): WideString;
begin
  Result := '';

  if (ControlComboBox = nil) or
     (FIndex < 0) or
     (FIndex >= ControlComboBox.Items.Count) then
    Exit;

  Result := ControlComboBox.Items[FIndex];
end;

function TFComboBox.GetItemIndex: Integer;
begin
  if ControlComboBox = nil then
    Result := -1
  else
    Result := ControlComboBox.ItemIndex;
end;

function TFComboBox.GetItemCount: Integer;
begin
  Result := ControlComboBox.Count;
end;

function TFComboBox.GetDropDownCount: Integer;
begin
  Result := ControlComboBox.DropDownCount;
end;

function TFComboBox.GetTag: Integer;
begin
  Result := ControlComboBox.Tag;
end;

function TFComboBox.GetLeft: Single;
begin
  Result := ControlComboBox.Position.X;
end;

function TFComboBox.GetTop: Single;
begin
  Result := ControlComboBox.Position.Y;
end;

function TFComboBox.GetHeight: Single;
begin
  Result := ControlComboBox.Size.Height;
end;

function TFComboBox.GetWidth: Single;
begin
  Result := ControlComboBox.Size.Width;
end;

function TFComboBox.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlComboBox);
end;

procedure TFComboBox.OnChange(Event: TNotifyEvent);
begin
  ControlComboBox.OnChange := TNotifyEvent(Event);
end;

procedure TFComboBox.OnClick(Event: TNotifyEvent);
begin
  ControlComboBox.OnClick := TNotifyEvent(Event);
end;

procedure TFComboBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlComboBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFComboBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlComboBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFComboBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlComboBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFComboBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlComboBox.OnMouseUp := TMouseEvent(Event);
end;

function TFComboBox.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlComboBox);
end;

// =============================================================================
// FMemo
// =============================================================================
procedure TFMemo.FCreate(FParent: TFmxObject);
begin
  ControlMemo := TMemo.Create(nil);
  ControlMemo.Parent := TFmxObject(FParent);
end;

procedure TFMemo.Cursor(FCursor: TCursor);
begin
  ControlMemo.Cursor := TCursor(FCursor);
end;

procedure TFMemo.Left(FLeft: Single);
begin
  ControlMemo.Position.X := FLeft;
end;

procedure TFMemo.Top(FTop: Single);
begin
  ControlMemo.Position.Y := FTop;
end;

procedure TFMemo.Height(FHeight: Single);
begin
  ControlMemo.Size.Height := FHeight;
end;

procedure TFMemo.Width(FWidth: Single);
begin
  ControlMemo.Size.Width := FWidth;
end;

procedure TFMemo.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlMemo.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFMemo.Position(X, Y: Single);
begin
  ControlMemo.Position.X := X;
  ControlMemo.Position.Y := Y;
end;

procedure TFMemo.Align(Al: TAlignLayout);
begin
  ControlMemo.Align := TAlignLayout(Al);
end;

procedure TFMemo.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlMemo.Margins.Left := FLeft;
  ControlMemo.Margins.Top := FTop;
  ControlMemo.Margins.Right := FRight;
  ControlMemo.Margins.Bottom := FBottom;
end;

procedure TFMemo.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlMemo.Padding.Left := FLeft;
  ControlMemo.Padding.Top := FTop;
  ControlMemo.Padding.Right := FRight;
  ControlMemo.Padding.Bottom := FBottom;
end;

procedure TFMemo.SetHint(const FText: WideString);
begin
  ControlMemo.ShowHint := True;
  ControlMemo.Hint := string(FText);
end;

procedure TFMemo.SetClipChildren(FValue: Boolean);
begin
  ControlMemo.ClipChildren := FValue;
end;

procedure TFMemo.SetClipParent(FValue: Boolean);
begin
  ControlMemo.ClipParent := FValue;
end;

procedure TFMemo.BringToFront;
begin
  ControlMemo.BringToFront;
end;

procedure TFMemo.SendToBack;
begin
  ControlMemo.SendToBack;
end;

procedure TFMemo.SetTag(FTag: Integer);
begin
  ControlMemo.Tag := FTag;
end;

procedure TFMemo.AutoHide(FValue: Boolean);
begin
  if FValue then
    ControlMemo.AutoHide := TBehaviorBoolean.True
  else
    ControlMemo.AutoHide := TBehaviorBoolean.False;
end;

procedure TFMemo.AutoSelect(FValue: Boolean);
begin
  ControlMemo.AutoSelect := FValue;
end;

procedure TFMemo.Bounces(FValue: Boolean);
begin
  if FValue then
    ControlMemo.Bounces := TBehaviorBoolean.True
  else
    ControlMemo.Bounces := TBehaviorBoolean.False;
end;

procedure TFMemo.DisableFocusEffect(FValue: Boolean);
begin
  ControlMemo.DisableFocusEffect := FValue;
end;

procedure TFMemo.EnabledScroll(FValue: Boolean);
begin
  ControlMemo.EnabledScroll := FValue;
end;

procedure TFMemo.ShowSizeGrip(FValue: Boolean);
begin
  ControlMemo.ShowSizeGrip := FValue;
end;

procedure TFMemo.TextPrompt(const FText: WideString);
begin
  ControlMemo.TextPrompt := string(FText);
end;

procedure TFMemo.MaxLength(FLength: Integer);
begin
  ControlMemo.MaxLength := FLength;
end;

procedure TFMemo.CheckSpelling(FCheck: Boolean);
begin
  ControlMemo.CheckSpelling := FCheck;
end;

procedure TFMemo.Caret(FColor: TAlphaColor; FInterval: Integer; FWidth: Word);
begin
  ControlMemo.Caret.Color := TAlphaColor(FColor);
  ControlMemo.Caret.Interval := FInterval;
  ControlMemo.Caret.Width := FWidth;
end;

procedure TFMemo.ShowScrollBars(FValue: Boolean);
begin
  ControlMemo.EnabledScroll := FValue;
end;

procedure TFMemo.SmoothScroll(FEnabled: Boolean);
begin
  if FEnabled then
    ControlMemo.ScrollAnimation := TBehaviorBoolean.True
  else
    ControlMemo.ScrollAnimation := TBehaviorBoolean.False;
end;

procedure TFMemo.LoadFromfile(const Filename: WideString);
const
  ScrollPadding = 8;
begin
  ControlMemo.Lines.LoadFromfile(Filename);
end;

procedure TFMemo.SetStrings(Src: TStrings);
begin
  ControlMemo.Lines.SetStrings(Src);
end;

procedure TFMemo.AddLine(const FText: WideString);
const
  ScrollPadding = 8;
begin
  ControlMemo.Lines.Add(string(FText));
  ControlMemo.ViewportPosition :=
    TPointF.Create(0, Max(0, ControlMemo.ContentBounds.Height -
      ControlMemo.Height + ScrollPadding));
end;

procedure TFMemo.Clear;
begin
  ControlMemo.Lines.Clear;
end;

procedure TFMemo.ReadOnly(FValue: Boolean);
begin
  ControlMemo.ReadOnly := FValue;
end;

procedure TFMemo.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlMemo.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFMemo.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlMemo.StyledSettings := [];

  ControlMemo.TextSettings.Font.Size := FontSize;
  ControlMemo.TextSettings.Font.Family := string(FontName);
  ControlMemo.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFMemo.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlMemo.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlMemo.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlMemo.TextSettings.WordWrap := FWordWrap;
end;

procedure TFMemo.FontStyle(FStyle: TFontStyles);
begin
  ControlMemo.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFMemo.BeginUpdate;
begin
  ControlMemo.BeginUpdate;
end;

procedure TFMemo.EndUpdate;
begin
  ControlMemo.EndUpdate;
end;

procedure TFMemo.RealignContent;
begin
  ControlMemo.RealignContent;
end;

procedure TFMemo.RecalcSize;
begin
  ControlMemo.RecalcSize;
end;

procedure TFMemo.Repaint;
begin
  ControlMemo.Repaint;
end;

procedure TFMemo.Opacity(FOpacity: Single);
begin
  ControlMemo.Opacity := FOpacity;
end;

procedure TFMemo.RotationAngle(FValue: Single);
begin
  ControlMemo.RotationAngle := FValue;
end;

procedure TFMemo.RotationCenter(X, Y: Single);
begin
  ControlMemo.RotationCenter.X := X;
  ControlMemo.RotationCenter.Y := Y;
end;

procedure TFMemo.Enabled(FEnabled: Boolean);
begin
  ControlMemo.Enabled := FEnabled;
end;

procedure TFMemo.Visible(FVisible: Boolean);
begin
  ControlMemo.Visible := FVisible;
end;

procedure TFMemo.HitTest(FEnabled: Boolean);
begin
  ControlMemo.HitTest := FEnabled;
end;

procedure TFMemo.StyleLookUp(FStyle: WideString);
begin
  ControlMemo.StyleLookUp := string(FStyle);
end;

function TFMemo.LineCount: Integer;
begin
  Result := ControlMemo.Lines.Count;
end;

function TFMemo.LineStrings(FIndex: Integer): WideString;
begin
  Result := ControlMemo.Lines.Strings[FIndex];
end;

function TFMemo.IsVisible: Boolean;
begin
  Result := ControlMemo.Visible;
end;

function TFMemo.GetText: WideString;
begin
  Result := ControlMemo.Text;
end;

function TFMemo.GetTag: Integer;
begin
  Result := ControlMemo.Tag;
end;

function TFMemo.GetLeft: Single;
begin
  Result := ControlMemo.Position.X;
end;

function TFMemo.GetTop: Single;
begin
  Result := ControlMemo.Position.Y;
end;

function TFMemo.GetHeight: Single;
begin
  Result := ControlMemo.Size.Height;
end;

function TFMemo.GetWidth: Single;
begin
  Result := ControlMemo.Size.Width;
end;

function TFMemo.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlMemo);
end;

procedure TFMemo.OnChange(Event: TNotifyEvent);
begin
  ControlMemo.OnChange := TNotifyEvent(Event);
end;

procedure TFMemo.OnChangeTracking(Event: TNotifyEvent);
begin
  ControlMemo.OnChangeTracking := TNotifyEvent(Event);
end;

procedure TFMemo.OnClick(Event: TNotifyEvent);
begin
  ControlMemo.OnClick := TNotifyEvent(Event);
end;

procedure TFMemo.OnMouseDown(Event: TMouseEvent);
begin
  ControlMemo.OnMouseDown := TMouseEvent(Event);
end;

procedure TFMemo.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlMemo.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFMemo.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlMemo.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFMemo.OnMouseUp(Event: TMouseEvent);
begin
  ControlMemo.OnMouseUp := TMouseEvent(Event);
end;

function TFMemo.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlMemo);
end;

// =============================================================================
// FEdit
// =============================================================================
procedure TFEdit.FCreate(FParent: TFmxObject);
begin
  ControlEdit := TEdit.Create(nil);
  ControlEdit.Parent := TFmxObject(FParent);
end;

procedure TFEdit.Cursor(FCursor: TCursor);
begin
  ControlEdit.Cursor := TCursor(FCursor);
end;

procedure TFEdit.Left(FLeft: Single);
begin
  ControlEdit.Position.X := FLeft;
end;

procedure TFEdit.Top(FTop: Single);
begin
  ControlEdit.Position.Y := FTop;
end;

procedure TFEdit.Height(FHeight: Single);
begin
  ControlEdit.Size.Height := FHeight;
end;

procedure TFEdit.Width(FWidth: Single);
begin
  ControlEdit.Size.Width := FWidth;
end;

procedure TFEdit.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlEdit.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFEdit.Position(X, Y: Single);
begin
  ControlEdit.Position.X := X;
  ControlEdit.Position.Y := Y;
end;

procedure TFEdit.Align(Al: TAlignLayout);
begin
  ControlEdit.Align := TAlignLayout(Al);
end;

procedure TFEdit.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlEdit.Margins.Left := FLeft;
  ControlEdit.Margins.Top := FTop;
  ControlEdit.Margins.Right := FRight;
  ControlEdit.Margins.Bottom := FBottom;
end;

procedure TFEdit.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlEdit.Padding.Left := FLeft;
  ControlEdit.Padding.Top := FTop;
  ControlEdit.Padding.Right := FRight;
  ControlEdit.Padding.Bottom := FBottom;
end;

procedure TFEdit.SetHint(const FText: WideString);
begin
  ControlEdit.ShowHint := True;
  ControlEdit.Hint := string(FText);
end;

procedure TFEdit.SetClipChildren(FValue: Boolean);
begin
  ControlEdit.ClipChildren := FValue;
end;

procedure TFEdit.SetClipParent(FValue: Boolean);
begin
  ControlEdit.ClipParent := FValue;
end;

procedure TFEdit.BringToFront;
begin
  ControlEdit.BringToFront;
end;

procedure TFEdit.SendToBack;
begin
  ControlEdit.SendToBack;
end;

procedure TFEdit.SetTag(FTag: Integer);
begin
  ControlEdit.Tag := FTag;
end;

procedure TFEdit.CanFocus(FValue: Boolean);
begin
  ControlEdit.CanFocus := FValue;
end;

procedure TFEdit.ReadOnly(FValue: Boolean);
begin
  ControlEdit.ReadOnly := FValue;
end;

procedure TFEdit.Text(const FText: WideString);
begin
  ControlEdit.Text := string(FText);
end;

procedure TFEdit.TextPrompt(const FText: WideString);
begin
  ControlEdit.TextPrompt := string(FText);
end;

procedure TFEdit.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlEdit.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFEdit.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlEdit.StyledSettings := [];

  ControlEdit.TextSettings.Font.Family := string(FontName);
  ControlEdit.TextSettings.Font.Size := FontSize;
  ControlEdit.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFEdit.TextSetting(FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlEdit.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlEdit.TextSettings.VertAlign := TTextAlign(FVertAlign);
end;

procedure TFEdit.FontStyle(FStyle: TFontStyles);
begin
  ControlEdit.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFEdit.AddSearchButton(Event: TNotifyEvent);
begin
  SearchEditButton1 := TSearchEditButton.Create(TFmxObject(ControlEdit));
  SearchEditButton1.Parent := TFmxObject(ControlEdit);
  SearchEditButton1.OnClick := TNotifyEvent(Event);
end;

procedure TFEdit.AddClearButton(Event: TNotifyEvent);
begin
  ClearEditButton1 := TClearEditButton.Create(TFmxObject(ControlEdit));
  ClearEditButton1.Parent := TFmxObject(ControlEdit);
  ClearEditButton1.OnClick := TNotifyEvent(Event);
end;

procedure TFEdit.AddPasswordButton;
begin
  PasswordEditButton1 := TPasswordEditButton.Create(TFmxObject(ControlEdit));
  PasswordEditButton1.Parent := TFmxObject(ControlEdit);
end;

procedure TFEdit.Password(FPassword: Boolean);
begin
  ControlEdit.Password := FPassword;
end;

procedure TFEdit.FilterChar(FFilterStr: WideString);
begin
  ControlEdit.FilterChar := string(FFilterStr);
end;

procedure TFEdit.DisableFocusEffect(FDisable: Boolean);
begin
  ControlEdit.DisableFocusEffect := FDisable;
end;

procedure TFEdit.MaxLength(FLength: Integer);
begin
  ControlEdit.MaxLength := FLength;
end;

procedure TFEdit.CheckSpelling(FCheck: Boolean);
begin
  ControlEdit.CheckSpelling := FCheck;
end;

procedure TFEdit.Caret(FColor: TAlphaColor; FInterval: Integer; FWidth: Word);
begin
  ControlEdit.Caret.Color := TAlphaColor(FColor);
  ControlEdit.Caret.Interval := FInterval;
  ControlEdit.Caret.Width := FWidth;
end;

procedure TFEdit.CaretShow(FShow: Boolean);
begin
  ControlEdit.Caret.Visible := FShow;
end;

procedure TFEdit.SelectAll;
begin
  ControlEdit.SelectAll;
end;

procedure TFEdit.SelectWord;
begin
  ControlEdit.SelectWord;
end;

procedure TFEdit.SelStart(FValue: Integer);
begin
  ControlEdit.SelStart := FValue;
end;

procedure TFEdit.SelLength(FValue: Integer);
begin
  ControlEdit.SelLength := FValue;
end;

procedure TFEdit.SelectionFillColor(FColor: TAlphaColor);
begin
  if ControlEdit.SelLength > 0 then
    ControlEdit.SelectionFill.Color := TAlphaColor(FColor);
end;

procedure TFEdit.Opacity(FOpacity: Single);
begin
  ControlEdit.Opacity := FOpacity;
end;

procedure TFEdit.RotationAngle(FValue: Single);
begin
  ControlEdit.RotationAngle := FValue;
end;

procedure TFEdit.RotationCenter(X, Y: Single);
begin
  ControlEdit.RotationCenter.X := X;
  ControlEdit.RotationCenter.Y := Y;
end;

procedure TFEdit.Enabled(FEnabled: Boolean);
begin
  ControlEdit.Enabled := FEnabled;
end;

procedure TFEdit.Visible(FVisible: Boolean);
begin
  ControlEdit.Visible := FVisible;
end;

procedure TFEdit.HitTest(FEnabled: Boolean);
begin
  ControlEdit.HitTest := FEnabled;
end;

procedure TFEdit.StyleLookUp(FStyle: WideString);
begin
  ControlEdit.StyleLookUp := string(FStyle);
end;

function TFEdit.IsVisible: Boolean;
begin
  Result := ControlEdit.Visible;
end;

function TFEdit.GetSelText: WideString;
begin
  Result := ControlEdit.SelText;
end;

function TFEdit.GetSearchBtnObject: TFmxObject;
begin
  Result := TFmxObject(SearchEditButton1);
end;

function TFEdit.GetPasswordBtnObject: TFmxObject;
begin
  Result := TFmxObject(PasswordEditButton1);
end;

function TFEdit.GetClearBtnObject: TFmxObject;
begin
  Result := TFmxObject(ClearEditButton1);
end;

function TFEdit.GetText: WideString;
begin
  Result := ControlEdit.Text
end;

function TFEdit.GetTag: Integer;
begin
  Result := ControlEdit.Tag;
end;

function TFEdit.GetLeft: Single;
begin
  Result := ControlEdit.Position.X;
end;

function TFEdit.GetTop: Single;
begin
  Result := ControlEdit.Position.Y;
end;

function TFEdit.GetHeight: Single;
begin
  Result := ControlEdit.Size.Height;
end;

function TFEdit.GetWidth: Single;
begin
  Result := ControlEdit.Size.Width;
end;

function TFEdit.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlEdit);
end;

procedure TFEdit.OnTyping(Event: TNotifyEvent);
begin
  ControlEdit.OnTyping := TNotifyEvent(Event);
end;

procedure TFEdit.OnEnter(Event: TNotifyEvent);
begin
  ControlEdit.OnEnter := TNotifyEvent(Event);
end;

procedure TFEdit.OnExit(Event: TNotifyEvent);
begin
  ControlEdit.OnExit := TNotifyEvent(Event);
end;

procedure TFEdit.OnKeyDown(Event: TKeyEvent);
begin
  ControlEdit.OnKeyDown := TKeyEvent(Event);
end;

procedure TFEdit.OnClick(Event: TNotifyEvent);
begin
  ControlEdit.OnClick := TNotifyEvent(Event);
end;

procedure TFEdit.OnChange(Event: TNotifyEvent);
begin
  ControlEdit.OnChange := TNotifyEvent(Event);
end;

procedure TFEdit.OnMouseDown(Event: TMouseEvent);
begin
  ControlEdit.OnMouseDown := TMouseEvent(Event);
end;

procedure TFEdit.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlEdit.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFEdit.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlEdit.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFEdit.OnMouseUp(Event: TMouseEvent);
begin
  ControlEdit.OnMouseUp := TMouseEvent(Event);
end;

function TFEdit.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlEdit);
end;

// =============================================================================
// FTreeViewItem
// =============================================================================
procedure TFTreeViewItem.FCreate(FParent: TFmxObject);
begin
  ControlTreeViewItem := TTreeViewItem.Create(TFmxObject(FParent));
  ControlTreeViewItem.Parent := TFmxObject(FParent);
end;

procedure TFTreeViewItem.Cursor(FCursor: TCursor);
begin
  ControlTreeViewItem.Cursor := TCursor(FCursor);
end;

procedure TFTreeViewItem.Height(FHeight: Single);
begin
  ControlTreeViewItem.Size.Height := FHeight;
end;

procedure TFTreeViewItem.Position(X, Y: Single);
begin
  ControlTreeViewItem.Position.X := X;
  ControlTreeViewItem.Position.Y := Y;
end;

procedure TFTreeViewItem.Align(Al: TAlignLayout);
begin
  ControlTreeViewItem.Align := TAlignLayout(Al);
end;

procedure TFTreeViewItem.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTreeViewItem.Margins.Left := FLeft;
  ControlTreeViewItem.Margins.Top := FTop;
  ControlTreeViewItem.Margins.Right := FRight;
  ControlTreeViewItem.Margins.Bottom := FBottom;
end;

procedure TFTreeViewItem.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTreeViewItem.Padding.Left := FLeft;
  ControlTreeViewItem.Padding.Top := FTop;
  ControlTreeViewItem.Padding.Right := FRight;
  ControlTreeViewItem.Padding.Bottom := FBottom;
end;

procedure TFTreeViewItem.SetTag(FTag: Integer);
begin
  ControlTreeViewItem.Tag := FTag;
end;

procedure TFTreeViewItem.ImageIndex(FIndex: Integer);
begin
  ControlTreeViewItem.ImageIndex := FIndex;
end;

procedure TFTreeViewItem.SetChecked(FValue: Boolean);
begin
  ControlTreeViewItem.IsChecked := FValue;
end;

procedure TFTreeViewItem.SetSelected(FValue: Boolean);
begin
  ControlTreeViewItem.IsSelected := FValue;
end;

procedure TFTreeViewItem.AddItem(FItem: TTreeViewItem);
begin
  if Assigned(FItem) then
    FItem.Parent := TTreeViewItem(ControlTreeViewItem);
end;

procedure TFTreeViewItem.Deselect;
begin
  ControlTreeViewItem.Deselect;
end;

procedure TFTreeViewItem.ExpandAll;
begin
  ControlTreeViewItem.ExpandAll;
  ControlTreeViewItem.RecalcSize;
  ControlTreeViewItem.Repaint;
end;

procedure TFTreeViewItem.CollapseAll;
begin
  ControlTreeViewItem.CollapseAll;
  ControlTreeViewItem.RecalcSize;
  ControlTreeViewItem.Repaint;
end;

procedure TFTreeViewItem.Expand;
begin
  ControlTreeViewItem.Expand;
  ControlTreeViewItem.RecalcSize;
  ControlTreeViewItem.Repaint;
end;

procedure TFTreeViewItem.Collapse;
begin
  ControlTreeViewItem.Collapse;
  ControlTreeViewItem.RecalcSize;
  ControlTreeViewItem.Repaint;
end;

procedure TFTreeViewItem.Text(const FText: WideString);
begin
  ControlTreeViewItem.Text := string(FText);
end;

procedure TFTreeViewItem.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlTreeViewItem.StyledSettings := FStyledSettings;
end;

procedure TFTreeViewItem.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlTreeViewItem.StyledSettings := [];

  ControlTreeViewItem.TextSettings.Font.Family := string(FontName);
  ControlTreeViewItem.TextSettings.Font.Size := FontSize;
  ControlTreeViewItem.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFTreeViewItem.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlTreeViewItem.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlTreeViewItem.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlTreeViewItem.TextSettings.WordWrap := FWordWrap;
end;

procedure TFTreeViewItem.FontStyle(FStyle: TFontStyles);
begin
  ControlTreeViewItem.TextSettings.Font.Style := TFontStyles(FStyle);
end;

procedure TFTreeViewItem.BeginUpdate;
begin
  ControlTreeViewItem.BeginUpdate;
end;

procedure TFTreeViewItem.EndUpdate;
begin
  ControlTreeViewItem.EndUpdate;
end;

procedure TFTreeViewItem.Opacity(FOpacity: Single);
begin
  ControlTreeViewItem.Opacity := FOpacity;
end;

procedure TFTreeViewItem.RotationAngle(FValue: Single);
begin
  ControlTreeViewItem.RotationAngle := FValue;
end;

procedure TFTreeViewItem.RotationCenter(X, Y: Single);
begin
  ControlTreeViewItem.RotationCenter.X := X;
  ControlTreeViewItem.RotationCenter.Y := Y;
end;

procedure TFTreeViewItem.Enabled(FEnabled: Boolean);
begin
  ControlTreeViewItem.Enabled := FEnabled;
end;

procedure TFTreeViewItem.Visible(FVisible: Boolean);
begin
  ControlTreeViewItem.Visible := FVisible;
end;

procedure TFTreeViewItem.HitTest(FEnabled: Boolean);
begin
  ControlTreeViewItem.HitTest := FEnabled;
end;

procedure TFTreeViewItem.StyleLookUp(FStyle: WideString);
begin
  ControlTreeViewItem.StyleLookUp := string(FStyle);
end;

function TFTreeViewItem.IsChecked: Boolean;
begin
  Result := ControlTreeViewItem.IsChecked;
end;

function TFTreeViewItem.IsSelected: Boolean;
begin
  Result := ControlTreeViewItem.IsSelected;
end;

function TFTreeViewItem.IsExpanded: Boolean;
begin
  Result := ControlTreeViewItem.IsExpanded;
end;

function TFTreeViewItem.IsVisible: Boolean;
begin
  Result := ControlTreeViewItem.Visible;
end;

function TFTreeViewItem.GetIndex: Integer;
begin
  Result := ControlTreeViewItem.Index;
end;

function TFTreeViewItem.GetGlobalIndex: Integer;
begin
  Result := ControlTreeViewItem.GlobalIndex;
end;

function TFTreeViewItem.GeText: WideString;
begin
  Result := ControlTreeViewItem.Text;
end;

function TFTreeViewItem.GetTag: Integer;
begin
  Result := ControlTreeViewItem.Tag;
end;

function TFTreeViewItem.GetHeight: Single;
begin
  Result := ControlTreeViewItem.Height;
end;

function TFTreeViewItem.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlTreeViewItem);
end;

procedure TFTreeViewItem.OnClick(Event: TNotifyEvent);
begin
  ControlTreeViewItem.OnClick := TNotifyEvent(Event);
end;

procedure TFTreeViewItem.OnMouseDown(Event: TMouseEvent);
begin
  ControlTreeViewItem.OnMouseDown := TMouseEvent(Event);
end;

procedure TFTreeViewItem.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlTreeViewItem.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFTreeViewItem.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlTreeViewItem.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFTreeViewItem.OnMouseUp(Event: TMouseEvent);
begin
  ControlTreeViewItem.OnMouseUp := TMouseEvent(Event);
end;

function TFTreeViewItem.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlTreeViewItem);
end;

// =============================================================================
// FTreeView
// =============================================================================
procedure TFTreeView.FCreate(FParent: TFmxObject);
begin
  ControlTreeView := TTreeView.Create(nil);
  ControlTreeView.Parent := TFmxObject(FParent);
end;

procedure TFTreeView.Cursor(FCursor: TCursor);
begin
  ControlTreeView.Cursor := TCursor(FCursor);
end;

procedure TFTreeView.Left(FLeft: Single);
begin
  ControlTreeView.Position.X := FLeft;
end;

procedure TFTreeView.Top(FTop: Single);
begin
  ControlTreeView.Position.Y := FTop;
end;

procedure TFTreeView.Height(FHeight: Single);
begin
  ControlTreeView.Size.Height := FHeight;
end;

procedure TFTreeView.Width(FWidth: Single);
begin
  ControlTreeView.Size.Width := FWidth;
end;

procedure TFTreeView.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlTreeView.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFTreeView.Position(X, Y: Single);
begin
  ControlTreeView.Position.X := X;
  ControlTreeView.Position.Y := Y;
end;

procedure TFTreeView.Align(Al: TAlignLayout);
begin
  ControlTreeView.Align := TAlignLayout(Al);
end;

procedure TFTreeView.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTreeView.Margins.Left := FLeft;
  ControlTreeView.Margins.Top := FTop;
  ControlTreeView.Margins.Right := FRight;
  ControlTreeView.Margins.Bottom := FBottom;
end;

procedure TFTreeView.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTreeView.Padding.Left := FLeft;
  ControlTreeView.Padding.Top := FTop;
  ControlTreeView.Padding.Right := FRight;
  ControlTreeView.Padding.Bottom := FBottom;
end;

procedure TFTreeView.SetHint(const FText: WideString);
begin
  ControlTreeView.ShowHint := True;
  ControlTreeView.Hint := string(FText);
end;

procedure TFTreeView.SetClipChildren(FValue: Boolean);
begin
  ControlTreeView.ClipChildren := FValue;
end;

procedure TFTreeView.SetClipParent(FValue: Boolean);
begin
  ControlTreeView.ClipParent := FValue;
end;

procedure TFTreeView.BringToFront;
begin
  ControlTreeView.BringToFront;
end;

procedure TFTreeView.SendToBack;
begin
  ControlTreeView.SendToBack;
end;

procedure TFTreeView.SetTag(FTag: Integer);
begin
  ControlTreeView.Tag := FTag;
end;

procedure TFTreeView.Images(FImgList: TImageList);
begin
  ControlTreeView.Images := TImageList(FImgList);
end;

procedure TFTreeView.AlternatingRowBackground(FValue: Boolean);
begin
  ControlTreeView.AlternatingRowBackground := FValue;
end;

procedure TFTreeView.AutoHide(FValue: Boolean);
begin
  ControlTreeView.AutoHide := FValue;
end;

procedure TFTreeView.CanFocus(FValue: Boolean);
begin
  ControlTreeView.CanFocus := FValue;
end;

procedure TFTreeView.DisableFocusEffect(FValue: Boolean);
begin
  ControlTreeView.DisableFocusEffect := FValue;
end;

procedure TFTreeView.DisableMouseWheel(FValue: Boolean);
begin
  ControlTreeView.DisableMouseWheel := FValue;
end;

procedure TFTreeView.DeleteItem(FIndex: Integer);
begin
  if (FIndex >= 0) and (FIndex < ControlTreeView.Count) then
    ControlTreeView.Items[FIndex].Free;
end;

procedure TFTreeView.MultiSelect(FValue: Boolean);
begin
  ControlTreeView.MultiSelect := FValue;
end;

procedure TFTreeView.ScrollAnimation(FValue: Boolean);
begin
  ControlTreeView.AniCalculations.Animation := FValue;
end;

procedure TFTreeView.ShowCheckboxes(FShow: Boolean);
begin
  ControlTreeView.ShowCheckboxes := FShow;
end;

procedure TFTreeView.ShowScrollBars(FShow: Boolean);
begin
  ControlTreeView.ShowScrollBars := FShow;
end;

procedure TFTreeView.Sorted(FValue: Boolean);
begin
  ControlTreeView.Sorted := FValue;
end;

procedure TFTreeView.SetItemIndex(FIndex: Integer);
begin
  if (FIndex >= 0) and (FIndex < ControlTreeView.Count) then
    ControlTreeView.Selected := ControlTreeView.Items[FIndex];
end;

procedure TFTreeView.ItemHeight(FHeight: Single);
begin
  ControlTreeView.ItemHeight := FHeight;
end;

procedure TFTreeView.AddItem(FItem: TTreeViewItem);
begin
  if Assigned(FItem) then
    FItem.Parent := ControlTreeView;
end;

procedure TFTreeView.ExpandAll;
begin
  ControlTreeView.ExpandAll;
  ControlTreeView.RealignContent;
  ControlTreeView.RecalcSize;
  ControlTreeView.Repaint;
end;

procedure TFTreeView.CollapseAll;
begin
  ControlTreeView.CollapseAll;
  ControlTreeView.RealignContent;
  ControlTreeView.RecalcSize;
  ControlTreeView.Repaint;
end;

procedure TFTreeView.DeselectAll;
var
  i: Integer;
begin
  for i := 0 to ControlTreeView.Count - 1 do
    ControlTreeView.Items[i].IsSelected := False;
end;

procedure TFTreeView.Clear;
begin
  ControlTreeView.Clear;
end;

procedure TFTreeView.BeginUpdate;
begin
  ControlTreeView.BeginUpdate;
end;

procedure TFTreeView.EndUpdate;
begin
  ControlTreeView.EndUpdate;
end;

procedure TFTreeView.RecalcSize;
begin
  ControlTreeView.RecalcSize;
end;

procedure TFTreeView.Repaint;
begin
  ControlTreeView.Repaint;
end;

procedure TFTreeView.Opacity(FOpacity: Single);
begin
  ControlTreeView.Opacity := FOpacity;
end;

procedure TFTreeView.RotationAngle(FValue: Single);
begin
  ControlTreeView.RotationAngle := FValue;
end;

procedure TFTreeView.RotationCenter(X, Y: Single);
begin
  ControlTreeView.RotationCenter.X := X;
  ControlTreeView.RotationCenter.Y := Y;
end;

procedure TFTreeView.Enabled(FEnabled: Boolean);
begin
  ControlTreeView.Enabled := FEnabled;
end;

procedure TFTreeView.Visible(FVisible: Boolean);
begin
  ControlTreeView.Visible := FVisible;
end;

procedure TFTreeView.HitTest(FEnabled: Boolean);
begin
  ControlTreeView.HitTest := FEnabled;
end;

procedure TFTreeView.StyleLookUp(FStyle: WideString);
begin
  ControlTreeView.StyleLookUp := string(FStyle);
end;

function TFTreeView.IsItemChecked(FIndex: Integer): Boolean;
begin
  if (FIndex >= 0) and (FIndex < ControlTreeView.Count) then
    Result := ControlTreeView.Items[FIndex].IsChecked
  else
    Result := False;
end;

function TFTreeView.IsItemSelected(FIndex: Integer): Boolean;
begin
  if (FIndex >= 0) and (FIndex < ControlTreeView.Count) then
    Result := ControlTreeView.Items[FIndex].IsSelected
  else
    Result := False;
end;

function TFTreeView.IsVisible: Boolean;
begin
  Result := ControlTreeView.Visible;
end;

function TFTreeView.GetItemIndex: Integer;
begin
  if Assigned(ControlTreeView.Selected) then
    Result := ControlTreeView.Selected.Index
  else
    Result := -1;
end;

function TFTreeView.GetIndexOfItem(FItemText: WideString): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to ControlTreeView.Count - 1 do
    if ControlTreeView.Items[i].Text = string(FItemText) then
      Exit(i);
end;

function TFTreeView.GetItem(FIndex: Integer): TTreeViewItem;
begin
  Result := ControlTreeView.Items[FIndex]
end;

function TFTreeView.GetItemText(FIndex: Integer): WideString;
begin
  if (FIndex >= 0) and (FIndex < ControlTreeView.Count) then
    Result := ControlTreeView.Items[FIndex].Text
  else
    Result := '';
end;

function TFTreeView.GetTag: Integer;
begin
  Result := ControlTreeView.Tag;
end;

function TFTreeView.GetLeft: Single;
begin
  Result := ControlTreeView.Position.X;
end;

function TFTreeView.GetTop: Single;
begin
  Result := ControlTreeView.Position.Y;
end;

function TFTreeView.GetHeight: Single;
begin
  Result := ControlTreeView.Size.Height;
end;

function TFTreeView.GetWidth: Single;
begin
  Result := ControlTreeView.Size.Width;
end;

function TFTreeView.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlTreeView);
end;

procedure TFTreeView.OnClick(Event: TNotifyEvent);
begin
  ControlTreeView.OnClick := TNotifyEvent(Event);
end;

procedure TFTreeView.OnChange(Event: TNotifyEvent);
begin
  ControlTreeView.OnChange := TNotifyEvent(Event);
end;

procedure TFTreeView.OnChangeCheck(Event: TNotifyEvent);
begin
  ControlTreeView.OnChangeCheck := TNotifyEvent(Event);
end;

procedure TFTreeView.OnMouseDown(Event: TMouseEvent);
begin
  ControlTreeView.OnMouseDown := TMouseEvent(Event);
end;

procedure TFTreeView.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlTreeView.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFTreeView.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlTreeView.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFTreeView.OnMouseUp(Event: TMouseEvent);
begin
  ControlTreeView.OnMouseUp := TMouseEvent(Event);
end;

function TFTreeView.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlTreeView);
end;

// =============================================================================
// FImageList
// =============================================================================
procedure TFImageList.FCreate(FParent: TFmxObject);
begin
  ControlImageList := TImageList.Create(TFmxObject(FParent));
end;

procedure TFImageList.AddImage(const AFileImage: WideString);
var
  Name: string;
begin
  if AFileImage = '' then
    Exit;

  Name := ExtractFileName(ChangeFileExt(AFileImage, ''));

  ControlImageList.AddOrSet(Name, [1.0], [string(AFileImage)]);
end;

procedure TFImageList.AddImageResized(const AFileImage: WideString;
  FWidth, FHeight: Integer);
var
  Bmp: FMX.Graphics.TBitmap;
  Item: TCustomSourceItem;
  Name: string;
  Index: Integer;
begin
  if AFileImage = '' then
    Exit;

  Name := ExtractFileName(ChangeFileExt(AFileImage, ''));

  Bmp := FMX.Graphics.TBitmap.Create;
  try
    Bmp.LoadFromFile(string(AFileImage));
    Bmp.Resize(FWidth, FHeight);

    Index := ControlImageList.Source.IndexOf(Name);

    if Index <> -1 then
      Item := ControlImageList.Source.Items[Index]
    else
    begin
      Item := ControlImageList.Source.Add;
      Item.Name := Name;
    end;

    Item.MultiResBitmap.Clear;
    Item.MultiResBitmap.Add.Bitmap.Assign(Bmp);

  finally
    Bmp.Free;
  end;
end;

procedure TFImageList.Clear;
begin
  ControlImageList.Source.Clear;
end;

procedure TFImageList.Delete(FIndex: Integer);
begin
  if (FIndex >= 0) and (FIndex < ControlImageList.Source.Count) then
    ControlImageList.Source.Delete(FIndex);
end;

procedure TFImageList.Replace(FIndex: Integer; const AFileImage: WideString);
var
  Name: string;
begin
  if AFileImage = '' then
    Exit;

  if (FIndex < 0) or (FIndex >= ControlImageList.Source.Count) then
    Exit;

  Name := ControlImageList.Source.Items[FIndex].Name;

  ControlImageList.AddOrSet(Name, [1.0], [string(AFileImage)]);
end;

procedure TFImageList.BeginUpdate;
begin
  ControlImageList.Source.BeginUpdate;
end;

procedure TFImageList.EndUpdate;
begin
  ControlImageList.Source.EndUpdate;
end;

procedure TFImageList.SetTag(FTag: Integer);
begin
  ControlImageList.Tag := FTag;
end;

function TFImageList.Count: Integer;
begin
  Result := ControlImageList.Source.Count;
end;

function TFImageList.GetTag: Integer;
begin
  Result := ControlImageList.Tag;
end;

function TFImageList.Handle: TImageList;
begin
  Result := TImageList(ControlImageList);
end;

// =============================================================================
// Exports
// =============================================================================
function InitButtonHandle: FButton;
begin
  Result := TFButton.Create;
end;

function InitCheckboxHandle: FCheckBox;
begin
  Result := TFCheckbox.Create;
end;

function InitRadioButtonHandle: FRadioButton;
begin
  Result := TFRadioButton.Create;
end;

function InitGroupBoxHandle: FGroupBox;
begin
  Result := TFGroupBox.Create;
end;

function InitPopupBoxHandle: FPopupBox;
begin
  Result := TFPopupBox.Create;
end;

function InitPanelHandle: FPanel;
begin
  Result := TFPanel.Create;
end;

function InitCalloutPanelHandle: FCalloutPanel;
begin
  Result := TFCalloutPanel.Create;
end;

function InitLabelHandle: FLabel;
begin
  Result := TFLabel.Create;
end;

function InitImageControlHandle: FImageControl;
begin
  Result := TFImageControl.Create;
end;

function InitProgressBarHandle: FProgressBar;
begin
  Result := TFProgressBar.Create;
end;

function InitExpanderHandle: FExpander;
begin
  Result := TFExpander.Create;
end;

function InitTrackBarHandle: FTrackBar;
begin
  Result := TFTrackBar.Create;
end;

function InitSwitchHandle: FSwitch;
begin
  Result := TFSwitch.Create;
end;

function InitSplitterHandle: FSplitter;
begin
  Result := TFSplitter.Create;
end;

function InitMenuItemHandle: FMenuItem;
begin
  Result := TFMenuItem.Create;
end;

function InitMenuBarHandle: FMenuBar;
begin
  Result := TFMenuBar.Create;
end;

function InitStatusBarHandle: FStatusBar;
begin
  Result := TFStatusBar.Create;
end;

function InitToolBarHandle: FToolBar;
begin
  Result := TFToolBar.Create;
end;

function InitSearchBoxHandle: FSearchBox;
begin
  Result := TFSearchBox.Create;
end;

function InitListBoxGroupFooterHandle: FListBoxGroupFooter;
begin
  Result := TFListBoxGroupFooter.Create;
end;

function InitListBoxGroupHeaderHandle: FListBoxGroupHeader;
begin
  Result := TFListBoxGroupHeader.Create;
end;

function InitListBoxHeaderHandle: FListBoxHeader;
begin
  Result := TFListBoxHeader.Create;
end;

function InitListBoxItemHandle: FListBoxItem;
begin
  Result := TFListBoxItem.Create;
end;

function InitListBoxHandle: FListBox;
begin
  Result := TFListBox.Create;
end;

function InitComboBoxHandle: FComboBox;
begin
  Result := TFComboBox.Create;
end;

function InitMemoHandle: FMemo;
begin
  Result := TFMemo.Create;
end;

function InitEditHandle: FEdit;
begin
  Result := TFEdit.Create;
end;

function InitTreeViewItemHandle: FTreeViewItem;
begin
  Result := TFTreeViewItem.Create;
end;

function InitTreeViewHandle: FTreeView;
begin
  Result := TFTreeView.Create;
end;

function InitImageListHandle: FImageList;
begin
  Result := TFImageList.Create;
end;

exports
  InitButtonHandle,
  InitCheckboxHandle,
  InitRadioButtonHandle,
  InitGroupBoxHandle,
  InitPopupBoxHandle,
  InitPanelHandle,
  InitCalloutPanelHandle,
  InitLabelHandle,
  InitImageControlHandle,
  InitProgressBarHandle,
  InitExpanderHandle,
  InitTrackBarHandle,
  InitSwitchHandle,
  InitSplitterHandle,
  InitMenuItemHandle,
  InitMenuBarHandle,
  InitStatusBarHandle,
  InitToolBarHandle,
  InitSearchBoxHandle,
  InitListBoxGroupFooterHandle,
  InitListBoxGroupHeaderHandle,
  InitListBoxHeaderHandle,
  InitListBoxItemHandle,
  InitListBoxHandle,
  InitComboBoxHandle,
  InitMemoHandle,
  InitEditHandle,
  InitTreeViewItemHandle,
  InitTreeViewHandle,
  InitImageListHandle;

end.
