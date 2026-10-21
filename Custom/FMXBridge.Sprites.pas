
unit FMXBridge.Sprites;

interface

uses
  System.Classes, System.UITypes,
  FMX.Graphics, FMX.Types, FMX.Controls;

// -----------------------------------------------------------------------------
// TSpriteProgressBar
// -----------------------------------------------------------------------------
type
  TSpriteProgressBar = class(TControl)
  private
    FBack: TBitmap;
    FFill: TBitmap;
    FMin: Integer;
    FMax: Integer;
    FValue: Integer;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadBack(const FileName: string);
    procedure LoadFill(const FileName: string);
    procedure SetValue(Value: Integer);
  end;

// =============================================================================
// FImageProgressBar
// =============================================================================
  FImageProgressBar = interface(IUnknown)
    ['{8FDE87C3-99A4-4909-830D-6A7440AFB088}']
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
    procedure SetBackImage(const FImage: WideString); stdcall;
    procedure SetImage(const FImage: WideString); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Repaint; stdcall;
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
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFImageProgressBar = class(TInterfacedObject, FImageProgressBar)
  private
    ControlImageProgressBar: TSpriteProgressBar;
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
    procedure SetBackImage(const FImage: WideString); stdcall;
    procedure SetImage(const FImage: WideString); stdcall;
    procedure Max(FMax: Single); stdcall;
    procedure Min(FMin: Single); stdcall;
    procedure Value(FValue: Single); stdcall;
    procedure Repaint; stdcall;
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
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// -----------------------------------------------------------------------------
// TSpriteRadioButton
// -----------------------------------------------------------------------------
type
  TSpriteRadioButton = class(TControl)
  private
    FSprite: TBitmap;
    FChecked: Boolean;
    FGroupName: string;
    FOnChange: TNotifyEvent;
    FDown: Boolean;
    FHover: Boolean;
    FText: string;
    FFontName: string;
    FFontSize: Single;
    FFontColor: TAlphaColor;
    FWordWrap: Boolean;
    FHorzAlign: TTextAlign;
    FVertAlign: TTextAlign;
    function GetFrame: Integer;
  protected
    procedure Paint; override;
    procedure DoMouseLeave; override;
    function IsMouseOver(X, Y: Single): Boolean;
    procedure UpdateState(X, Y: Single; MouseDown: Boolean);
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetChecked(Value: Boolean);
    function IsChecked: Boolean;
    property Checked: Boolean read IsChecked write SetChecked;
    property GroupName: string read FGroupName write FGroupName;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    procedure UncheckGroup;
    procedure LoadSprite(const FileName: string);
    procedure SetText(const Value: string);
    procedure SetFontName(const Name: string);
    procedure SetFontSize(Size: Single);
    procedure SetFontColor(Color: TAlphaColor);
    procedure SetFontSetting(const Name: string; Size: Single;
      Color: TAlphaColor);
    procedure SetTextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
  end;

// =============================================================================
// FImageRadioButton
// =============================================================================
  FImageRadioButton = interface(IUnknown)
    ['{DF5B2573-7D63-4DC8-89B4-66C6D0D07A17}']
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
    procedure GroupName(const FGroup: WideString); stdcall;
    procedure SetImage(const FImage: WideString); stdcall;
    procedure Text(const AText: WideString); stdcall;
    procedure TextColor(FontColor: TAlphaColor); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
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

  TFImageRadioButton = class(TInterfacedObject, FImageRadioButton)
  private
    ControlImageRadioButton: TSpriteRadioButton;
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
    procedure GroupName(const FGroup: WideString); stdcall;
    procedure SetImage(const FImage: WideString); stdcall;
    procedure Text(const AText: WideString); stdcall;
    procedure TextColor(FontColor: TAlphaColor); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
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

// -----------------------------------------------------------------------------
// TSpriteCheckBox
// -----------------------------------------------------------------------------
type
  TSpriteCheckBox = class(TControl)
  private
    FSprite: TBitmap;
    FChecked: Boolean;
    FOnChange: TNotifyEvent;
    FDown: Boolean;
    FHover: Boolean;
    FText: string;
    FFontName: string;
    FFontSize: Single;
    FFontColor: TAlphaColor;
    FWordWrap: Boolean;
    FHorzAlign: TTextAlign;
    FVertAlign: TTextAlign;
    function GetFrame: Integer;
  protected
    procedure Paint; override;
    procedure DoMouseLeave; override;
    function IsMouseOver(X, Y: Single): Boolean;
    procedure UpdateState(X, Y: Single; MouseDown: Boolean);
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetChecked(Value: Boolean);
    function IsChecked: Boolean;
    property Checked: Boolean read IsChecked write SetChecked;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    procedure LoadSprite(const FileName: string);
    procedure SetText(const Value: string);
    procedure SetFontName(const Name: string);
    procedure SetFontSize(Size: Single);
    procedure SetFontColor(Color: TAlphaColor);
    procedure SetFontSetting(const Name: string; Size: Single;
      Color: TAlphaColor);
    procedure SetTextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
  end;

// =============================================================================
// FImageCheckBox
// =============================================================================
  FImageCheckBox = interface(IUnknown)
    ['{71609447-B537-4CF5-A6EA-7CC0B7489490}']
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
    procedure SetImage(const FImage: WideString); stdcall;
    procedure Text(const AText: WideString); stdcall;
    procedure TextColor(FontColor: TAlphaColor); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
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

  TFImageCheckBox = class(TInterfacedObject, FImageCheckBox)
  private
    ControlImageCheckBox: TSpriteCheckBox;
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
    procedure SetImage(const FImage: WideString); stdcall;
    procedure Text(const AText: WideString); stdcall;
    procedure TextColor(FontColor: TAlphaColor); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
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

// -----------------------------------------------------------------------------
// TSpriteButton
// -----------------------------------------------------------------------------
type
  TSpriteButton = class(TControl)
  private
    FSprite: TBitmap;
    FDown: Boolean;
    FHover: Boolean;
    FText: string;
    FFontName: string;
    FFontSize: Single;
    FFontColor: TAlphaColor;
    FWordWrap: Boolean;
    FHorzAlign: TTextAlign;
    FVertAlign: TTextAlign;
    function GetFrame: Integer;
  protected
    procedure Paint; override;
    procedure DoMouseLeave; override;
    procedure UpdateState(X, Y: Single; MouseDown: Boolean);
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadSprite(const FileName: string);
    procedure SetText(const Value: string);
    procedure SetFontName(const Name: string);
    procedure SetFontSize(Size: Single);
    procedure SetFontColor(Color: TAlphaColor);
    procedure SetFontSetting(const Name: string; Size: Single;
      Color: TAlphaColor);
    procedure SetTextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
  end;

// =============================================================================
// FImageButton
// =============================================================================
  FImageButton = interface(IUnknown)
    ['{AE4F6E09-5A3A-46EB-AB43-616DDECBAF3F}']
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
    procedure SetImage(const FImage: WideString); stdcall;
    procedure Text(const AText: WideString); stdcall;
    procedure TextColor(FontColor: TAlphaColor); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
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
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFImageButton = class(TInterfacedObject, FImageButton)
  private
    ControlImageButton: TSpriteButton;
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
    procedure SetImage(const FImage: WideString); stdcall;
    procedure Text(const AText: WideString); stdcall;
    procedure TextColor(FontColor: TAlphaColor); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
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
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitImageProgressBarHandle: FImageProgressBar; stdcall;
function InitImageRadioButtonHandle: FImageRadioButton; stdcall;
function InitImageCheckBoxHandle: FImageCheckBox; stdcall;
function InitImageButtonHandle: FImageButton; stdcall;

implementation

uses
  System.Types;

// -----------------------------------------------------------------------------
// TSpriteProgressBar
// -----------------------------------------------------------------------------
constructor TSpriteProgressBar.Create(AOwner: TComponent);
begin
  inherited;

  FBack := TBitmap.Create;
  FFill := TBitmap.Create;

  FMin := 0;
  FMax := 100;
  FValue := 0;
end;

destructor TSpriteProgressBar.Destroy;
begin
  FBack.Free;
  FFill.Free;

  inherited;
end;

procedure TSpriteProgressBar.LoadBack(const FileName: string);
begin
  FBack.LoadFromFile(FileName);
  Repaint;
end;

procedure TSpriteProgressBar.LoadFill(const FileName: string);
begin
  FFill.LoadFromFile(FileName);
  Repaint;
end;

procedure TSpriteProgressBar.SetValue(Value: Integer);
begin
  if Value < FMin then
    Value := FMin;

  if Value > FMax then
    Value := FMax;

  FValue := Value;

  Repaint;
end;

procedure TSpriteProgressBar.Paint;
var
  Percent: Single;
  SrcRect: TRectF;
  DstRect: TRectF;
begin
  inherited;

  if not FBack.IsEmpty then
  begin
    Canvas.DrawBitmap(FBack, RectF(0, 0, FBack.Width, FBack.Height),
      RectF(0, 0, Width, Height), AbsoluteOpacity, False);
  end;

  if FFill.IsEmpty then
    Exit;

  if FMax <= FMin then
    Exit;

  Percent := (FValue - FMin) / (FMax - FMin);

  if Percent <= 0 then
    Exit;

  SrcRect := RectF(0, 0, FFill.Width * Percent, FFill.Height);

  DstRect := RectF(0, 0, Width * Percent, Height);

  Canvas.DrawBitmap(FFill, SrcRect, DstRect, AbsoluteOpacity, True);
end;

// =============================================================================
// FImageProgressBar
// =============================================================================
procedure TFImageProgressBar.FCreate(FParent: TFmxObject);
begin
  ControlImageProgressBar := TSpriteProgressBar.Create(nil);
  ControlImageProgressBar.Parent := TFmxObject(FParent);
end;

procedure TFImageProgressBar.Cursor(FCursor: TCursor);
begin
  ControlImageProgressBar.Cursor := TCursor(FCursor);
end;

procedure TFImageProgressBar.Left(FLeft: Single);
begin
  ControlImageProgressBar.Position.X := FLeft;
end;

procedure TFImageProgressBar.Top(FTop: Single);
begin
  ControlImageProgressBar.Position.Y := FTop;
end;

procedure TFImageProgressBar.Height(FHeight: Single);
begin
  ControlImageProgressBar.Size.Height := FHeight;
end;

procedure TFImageProgressBar.Width(FWidth: Single);
begin
  ControlImageProgressBar.Size.Width := FWidth;
end;

procedure TFImageProgressBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlImageProgressBar.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFImageProgressBar.Position(X, Y: Single);
begin
  ControlImageProgressBar.Position.X := X;
  ControlImageProgressBar.Position.Y := Y;
end;

procedure TFImageProgressBar.Align(Al: TAlignLayout);
begin
  ControlImageProgressBar.Align := TAlignLayout(Al);
end;

procedure TFImageProgressBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageProgressBar.Margins.Left := FLeft;
  ControlImageProgressBar.Margins.Top := FTop;
  ControlImageProgressBar.Margins.Right := FRight;
  ControlImageProgressBar.Margins.Bottom := FBottom;
end;

procedure TFImageProgressBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageProgressBar.Padding.Left := FLeft;
  ControlImageProgressBar.Padding.Top := FTop;
  ControlImageProgressBar.Padding.Right := FRight;
  ControlImageProgressBar.Padding.Bottom := FBottom;
end;

procedure TFImageProgressBar.SetHint(const FText: WideString);
begin
  ControlImageProgressBar.ShowHint := True;
  ControlImageProgressBar.Hint := string(FText);
end;

procedure TFImageProgressBar.SetClipChildren(FValue: Boolean);
begin
  ControlImageProgressBar.ClipChildren := FValue;
end;

procedure TFImageProgressBar.SetClipParent(FValue: Boolean);
begin
  ControlImageProgressBar.ClipParent := FValue;
end;

procedure TFImageProgressBar.BringToFront;
begin
  ControlImageProgressBar.BringToFront;
end;

procedure TFImageProgressBar.SendToBack;
begin
  ControlImageProgressBar.SendToBack;
end;

procedure TFImageProgressBar.SetTag(FTag: Integer);
begin
  ControlImageProgressBar.Tag := FTag;
end;

procedure TFImageProgressBar.SetBackImage(const FImage: WideString);
begin
  if FImage <> '' then
    ControlImageProgressBar.LoadBack(string(FImage));
end;

procedure TFImageProgressBar.SetImage(const FImage: WideString);
begin
  if FImage <> '' then
    ControlImageProgressBar.LoadFill(string(FImage));
end;

procedure TFImageProgressBar.Value(FValue: Single);
begin
  ControlImageProgressBar.SetValue(Round(FValue));
end;

procedure TFImageProgressBar.Max(FMax: Single);
begin
  ControlImageProgressBar.FMax := Round(FMax);
  ControlImageProgressBar.Repaint;
end;

procedure TFImageProgressBar.Min(FMin: Single);
begin
  ControlImageProgressBar.FMin := Round(FMin);
  ControlImageProgressBar.Repaint;
end;

procedure TFImageProgressBar.Repaint;
begin
  ControlImageProgressBar.Repaint;
end;

procedure TFImageProgressBar.Opacity(FOpacity: Single);
begin
  ControlImageProgressBar.Opacity := FOpacity;
end;

procedure TFImageProgressBar.RotationAngle(FValue: Single);
begin
  ControlImageProgressBar.RotationAngle := FValue;
end;

procedure TFImageProgressBar.RotationCenter(X, Y: Single);
begin
  ControlImageProgressBar.RotationCenter.X := X;
  ControlImageProgressBar.RotationCenter.Y := Y;
end;

procedure TFImageProgressBar.Enabled(FEnabled: Boolean);
begin
  ControlImageProgressBar.Enabled := FEnabled;
end;

procedure TFImageProgressBar.Visible(FVisible: Boolean);
begin
  ControlImageProgressBar.Visible := FVisible;
end;

procedure TFImageProgressBar.HitTest(FEnabled: Boolean);
begin
  ControlImageProgressBar.HitTest := FEnabled;
end;

function TFImageProgressBar.GetValue: Single;
begin
  Result := ControlImageProgressBar.FValue;
end;

function TFImageProgressBar.GetMax: Single;
begin
  Result := ControlImageProgressBar.FMax;
end;

function TFImageProgressBar.IsVisible: Boolean;
begin
  Result := ControlImageProgressBar.Visible;
end;

function TFImageProgressBar.GetTag: Integer;
begin
  Result := ControlImageProgressBar.Tag;
end;

function TFImageProgressBar.GetLeft: Single;
begin
  Result := ControlImageProgressBar.Position.X;
end;

function TFImageProgressBar.GetTop: Single;
begin
  Result := ControlImageProgressBar.Position.Y;
end;

function TFImageProgressBar.GetHeight: Single;
begin
  Result := ControlImageProgressBar.Size.Height;
end;

function TFImageProgressBar.GetWidth: Single;
begin
  Result := ControlImageProgressBar.Size.Width;
end;

function TFImageProgressBar.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlImageProgressBar);
end;

procedure TFImageProgressBar.OnClick(Event: TNotifyEvent);
begin
  ControlImageProgressBar.OnClick := TNotifyEvent(Event);
end;

procedure TFImageProgressBar.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlImageProgressBar.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFImageProgressBar.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlImageProgressBar.OnMouseLeave := TNotifyEvent(Event);
end;

function TFImageProgressBar.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlImageProgressBar);
end;

// -----------------------------------------------------------------------------
// TSpriteRadioButton
// -----------------------------------------------------------------------------
constructor TSpriteRadioButton.Create(AOwner: TComponent);
begin
  inherited;

  FSprite := TBitmap.Create;
  HitTest := True;

  FChecked := False;

  FFontName := 'Segoe UI';
  FFontSize := 13;
  FFontColor := TAlphaColor($FFFFFFFF);

  FWordWrap := False;
  FHorzAlign := TTextAlign.Center;
  FVertAlign := TTextAlign.Center;
end;

destructor TSpriteRadioButton.Destroy;
begin
  FSprite.Free;

  inherited;
end;

procedure TSpriteRadioButton.DoMouseLeave;
begin
  inherited;

  FHover := False;
  FDown := False;

  Repaint;
end;

function TSpriteRadioButton.IsMouseOver(X, Y: Single): Boolean;
begin
  Result := (X >= 0) and (Y >= 0) and (X <= Width) and (Y <= Height);
end;

procedure TSpriteRadioButton.UpdateState(X, Y: Single; MouseDown: Boolean);
var
  NewHover: Boolean;
begin
  if not Enabled then
  begin
    FHover := False;
    FDown := False;
    Exit;
  end;

  NewHover := (X >= 0) and (Y >= 0) and (X <= Width) and (Y <= Height);

  FHover := NewHover;
  FDown := MouseDown and NewHover;

  Repaint;
end;

procedure TSpriteRadioButton.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;

  UpdateState(X, Y, FDown);
end;

procedure TSpriteRadioButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;

  if Button <> TMouseButton.mbLeft then
    Exit;

  Capture;
  UpdateState(X, Y, True);
end;

procedure TSpriteRadioButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;

  if Button <> TMouseButton.mbLeft then
    Exit;

  UpdateState(X, Y, False);
  ReleaseCapture;

  if IsMouseOver(X, Y) then
  begin
    if not FChecked then
    begin
      UncheckGroup;
      SetChecked(True);
    end;
  end;
end;

function TSpriteRadioButton.GetFrame: Integer;
begin
  if FChecked then
  begin
    if not Enabled then
      Exit(7);
    if FDown then
      Exit(6);
    if FHover then
      Exit(5);
    Exit(4);
  end;

  if not Enabled then
    Exit(3);
  if FDown then
    Exit(2);
  if FHover then
    Exit(1);

  Result := 0;
end;

procedure TSpriteRadioButton.Paint;
var
  Frame: Integer;
  Src, Dest: TRectF;
  FrameH: Single;
begin
  inherited;

  if (FSprite = nil) or FSprite.IsEmpty then
    Exit;

  Frame := GetFrame;
  FrameH := FSprite.Height / 8;

  Src := RectF(0, Frame * FrameH, FSprite.Width, (Frame + 1) * FrameH);

  Dest := RectF(0, 0, Width, Height);

  Canvas.DrawBitmap(FSprite, Src, Dest, AbsoluteOpacity, False);

  if FText <> '' then
  begin
    Canvas.Font.Family := FFontName;
    Canvas.Font.Size := FFontSize;
    Canvas.Fill.Color := FFontColor;
    Canvas.FillText(Dest, FText, FWordWrap, 1, [], FHorzAlign, FVertAlign);
  end;
end;

procedure TSpriteRadioButton.LoadSprite(const FileName: string);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    B.LoadFromFile(FileName);

    FSprite.SetSize(Round(Width), Round(Height * 8));
    FSprite.Canvas.BeginScene;
    FSprite.Canvas.DrawBitmap(B, RectF(0, 0, B.Width, B.Height),
      RectF(0, 0, FSprite.Width, FSprite.Height), 1);
    FSprite.Canvas.EndScene;
  finally
    B.Free;
  end;
end;

procedure TSpriteRadioButton.SetFontName(const Name: string);
begin
  FFontName := Name;

  Repaint;
end;

procedure TSpriteRadioButton.SetFontSize(Size: Single);
begin
  FFontSize := Size;

  Repaint;
end;

procedure TSpriteRadioButton.SetFontColor(Color: TAlphaColor);
begin
  FFontColor := Color;

  Repaint;
end;

procedure TSpriteRadioButton.SetText(const Value: string);
begin
  FText := Value;

  Repaint;
end;

procedure TSpriteRadioButton.SetFontSetting(const Name: string; Size: Single;
  Color: TAlphaColor);
begin
  FFontName := Name;
  FFontSize := Size;
  FFontColor := TAlphaColor(Color);

  Repaint;
end;

procedure TSpriteRadioButton.SetTextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  Self.FWordWrap := FWordWrap;
  Self.FHorzAlign := FHorzAlign;
  Self.FVertAlign := FVertAlign;

  Repaint;
end;

procedure TSpriteRadioButton.SetChecked(Value: Boolean);
begin
  if FChecked = Value then
    Exit;

  FChecked := Value;

  if Assigned(FOnChange) then
    FOnChange(Self);

  Repaint;
end;

procedure TSpriteRadioButton.UncheckGroup;
var
  I: Integer;
  Obj: TFMXObject;
begin
  if Parent = nil then
    Exit;

  for I := 0 to Parent.ChildrenCount - 1 do
  begin
    Obj := Parent.Children[I];

    if (Obj is TSpriteRadioButton) and (Obj <> Self) and
      (TSpriteRadioButton(Obj).GroupName = FGroupName) then
    begin
      TSpriteRadioButton(Obj).SetChecked(False);
    end;
  end;
end;

function TSpriteRadioButton.IsChecked: Boolean;
begin
  Result := FChecked;
end;

// =============================================================================
// FImageRadioButton
// =============================================================================
procedure TFImageRadioButton.FCreate(FParent: TFmxObject);
begin
  ControlImageRadioButton := TSpriteRadioButton.Create(nil);
  ControlImageRadioButton.Parent := TFmxObject(FParent);
end;

procedure TFImageRadioButton.Cursor(FCursor: TCursor);
begin
  ControlImageRadioButton.Cursor := TCursor(FCursor);
end;

procedure TFImageRadioButton.Left(FLeft: Single);
begin
  ControlImageRadioButton.Position.X := FLeft;
end;

procedure TFImageRadioButton.Top(FTop: Single);
begin
  ControlImageRadioButton.Position.Y := FTop;
end;

procedure TFImageRadioButton.Height(FHeight: Single);
begin
  ControlImageRadioButton.Size.Height := FHeight;
end;

procedure TFImageRadioButton.Width(FWidth: Single);
begin
  ControlImageRadioButton.Size.Width := FWidth;
end;

procedure TFImageRadioButton.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlImageRadioButton.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFImageRadioButton.Position(X, Y: Single);
begin
  ControlImageRadioButton.Position.X := X;
  ControlImageRadioButton.Position.Y := Y;
end;

procedure TFImageRadioButton.Align(Al: TAlignLayout);
begin
  ControlImageRadioButton.Align := TAlignLayout(Al);
end;

procedure TFImageRadioButton.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageRadioButton.Margins.Left := FLeft;
  ControlImageRadioButton.Margins.Top := FTop;
  ControlImageRadioButton.Margins.Right := FRight;
  ControlImageRadioButton.Margins.Bottom := FBottom;
end;

procedure TFImageRadioButton.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageRadioButton.Padding.Left := FLeft;
  ControlImageRadioButton.Padding.Top := FTop;
  ControlImageRadioButton.Padding.Right := FRight;
  ControlImageRadioButton.Padding.Bottom := FBottom;
end;

procedure TFImageRadioButton.SetHint(const FText: WideString);
begin
  ControlImageRadioButton.ShowHint := True;
  ControlImageRadioButton.Hint := string(FText);
end;

procedure TFImageRadioButton.SetClipChildren(FValue: Boolean);
begin
  ControlImageRadioButton.ClipChildren := FValue;
end;

procedure TFImageRadioButton.SetClipParent(FValue: Boolean);
begin
  ControlImageRadioButton.ClipParent := FValue;
end;

procedure TFImageRadioButton.BringToFront;
begin
  ControlImageRadioButton.BringToFront;
end;

procedure TFImageRadioButton.SendToBack;
begin
  ControlImageRadioButton.SendToBack;
end;

procedure TFImageRadioButton.SetTag(FTag: Integer);
begin
  ControlImageRadioButton.Tag := FTag;
end;

procedure TFImageRadioButton.SetChecked(FChecked: Boolean);
begin
  ControlImageRadioButton.Checked := FChecked;
end;

procedure TFImageRadioButton.GroupName(const FGroup: WideString);
begin
  ControlImageRadioButton.GroupName := string(FGroup);
end;

procedure TFImageRadioButton.SetImage(const FImage: WideString);
begin
  ControlImageRadioButton.LoadSprite(string(FImage));
end;

procedure TFImageRadioButton.Text(const AText: WideString);
begin
  ControlImageRadioButton.SetText(string(AText));
end;

procedure TFImageRadioButton.TextColor(FontColor: TAlphaColor);
begin
  ControlImageRadioButton.SetFontColor(TAlphaColor(FontColor));
end;

procedure TFImageRadioButton.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlImageRadioButton.SetFontSetting(string(FontName), FontSize,
    TAlphaColor(FontColor));
end;

procedure TFImageRadioButton.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlImageRadioButton.SetTextSetting(FWordWrap,
    TTextAlign(FHorzAlign), TTextAlign(FVertAlign));
end;

procedure TFImageRadioButton.Repaint;
begin
  ControlImageRadioButton.Repaint;
end;

procedure TFImageRadioButton.Opacity(FOpacity: Single);
begin
  ControlImageRadioButton.Opacity := FOpacity;
end;

procedure TFImageRadioButton.RotationAngle(FValue: Single);
begin
  ControlImageRadioButton.RotationAngle := FValue;
end;

procedure TFImageRadioButton.RotationCenter(X, Y: Single);
begin
  ControlImageRadioButton.RotationCenter.X := X;
  ControlImageRadioButton.RotationCenter.Y := Y;
end;

procedure TFImageRadioButton.Enabled(FEnabled: Boolean);
begin
  ControlImageRadioButton.Enabled := FEnabled;
end;

procedure TFImageRadioButton.Visible(FVisible: Boolean);
begin
  ControlImageRadioButton.Visible := FVisible;
end;

procedure TFImageRadioButton.HitTest(FEnabled: Boolean);
begin
  ControlImageRadioButton.HitTest := FEnabled;
end;

function TFImageRadioButton.IsChecked: Boolean;
begin
  Result := ControlImageRadioButton.Checked;
end;

function TFImageRadioButton.IsVisible: Boolean;
begin
  Result := ControlImageRadioButton.Visible;
end;

function TFImageRadioButton.GetTag: Integer;
begin
  Result := ControlImageRadioButton.Tag;
end;

function TFImageRadioButton.GetLeft: Single;
begin
  Result := ControlImageRadioButton.Position.X;
end;

function TFImageRadioButton.GetTop: Single;
begin
  Result := ControlImageRadioButton.Position.Y;
end;

function TFImageRadioButton.GetHeight: Single;
begin
  Result := ControlImageRadioButton.Size.Height;
end;

function TFImageRadioButton.GetWidth: Single;
begin
  Result := ControlImageRadioButton.Size.Width;
end;

function TFImageRadioButton.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlImageRadioButton);
end;

procedure TFImageRadioButton.OnClick(Event: TNotifyEvent);
begin
  ControlImageRadioButton.OnClick := TNotifyEvent(Event);
end;

procedure TFImageRadioButton.OnChange(Event: TNotifyEvent);
begin
  ControlImageRadioButton.OnChange := TNotifyEvent(Event);
end;

procedure TFImageRadioButton.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlImageRadioButton.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFImageRadioButton.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlImageRadioButton.OnMouseLeave := TNotifyEvent(Event);
end;

function TFImageRadioButton.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlImageRadioButton);
end;

// -----------------------------------------------------------------------------
// TSpriteCheckBox
// -----------------------------------------------------------------------------
constructor TSpriteCheckBox.Create(AOwner: TComponent);
begin
  inherited;

  FSprite := TBitmap.Create;
  HitTest := True;

  FChecked := False;

  FFontName := 'Segoe UI';
  FFontSize := 13;
  FFontColor := TAlphaColor($FFFFFFFF);

  FWordWrap := False;
  FHorzAlign := TTextAlign.Center;
  FVertAlign := TTextAlign.Center;
end;

destructor TSpriteCheckBox.Destroy;
begin
  FSprite.Free;

  inherited;
end;

procedure TSpriteCheckBox.DoMouseLeave;
begin
  inherited;

  FHover := False;
  FDown := False;

  Repaint;
end;

function TSpriteCheckBox.IsMouseOver(X, Y: Single): Boolean;
begin
  Result := (X >= 0) and (Y >= 0) and (X <= Width) and (Y <= Height);
end;

procedure TSpriteCheckBox.UpdateState(X, Y: Single; MouseDown: Boolean);
var
  NewHover: Boolean;
begin
  if not Enabled then
  begin
    FHover := False;
    FDown := False;
    Exit;
  end;

  NewHover := (X >= 0) and (Y >= 0) and (X <= Width) and (Y <= Height);

  FHover := NewHover;
  FDown := MouseDown and NewHover;

  Repaint;
end;

procedure TSpriteCheckBox.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;

  UpdateState(X, Y, FDown);
end;

procedure TSpriteCheckBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;

  if Button <> TMouseButton.mbLeft then
    Exit;

  Capture;
  UpdateState(X, Y, True);
end;

procedure TSpriteCheckBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;

  if Button <> TMouseButton.mbLeft then
    Exit;

  UpdateState(X, Y, False);
  ReleaseCapture;

  if IsMouseOver(X, Y) then
  begin
    SetChecked(not FChecked);
    Repaint;
  end;
end;

function TSpriteCheckBox.GetFrame: Integer;
begin
  if FChecked then
  begin
    if not Enabled then
      Exit(7);
    if FDown then
      Exit(6);
    if FHover then
      Exit(5);
    Exit(4);
  end;

  if not Enabled then
    Exit(3);
  if FDown then
    Exit(2);
  if FHover then
    Exit(1);

  Result := 0;
end;

procedure TSpriteCheckBox.Paint;
var
  Frame: Integer;
  Src, Dest: TRectF;
  FrameH: Single;
begin
  inherited;

  if (FSprite = nil) or FSprite.IsEmpty then
    Exit;

  Frame := GetFrame;
  FrameH := FSprite.Height / 8;

  Src := RectF(0, Frame * FrameH, FSprite.Width, (Frame + 1) * FrameH);

  Dest := RectF(0, 0, Width, Height);

  Canvas.DrawBitmap(FSprite, Src, Dest, AbsoluteOpacity, False);

  if FText <> '' then
  begin
    Canvas.Font.Family := FFontName;
    Canvas.Font.Size := FFontSize;
    Canvas.Fill.Color := FFontColor;
    Canvas.FillText(Dest, FText, FWordWrap, 1, [], FHorzAlign, FVertAlign);
  end;
end;

procedure TSpriteCheckBox.LoadSprite(const FileName: string);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    B.LoadFromFile(FileName);

    FSprite.SetSize(Round(Width), Round(Height * 8));
    FSprite.Canvas.BeginScene;
    FSprite.Canvas.DrawBitmap(B, RectF(0, 0, B.Width, B.Height),
      RectF(0, 0, FSprite.Width, FSprite.Height), 1);
    FSprite.Canvas.EndScene;
  finally
    B.Free;
  end;
end;

procedure TSpriteCheckBox.SetFontName(const Name: string);
begin
  FFontName := Name;

  Repaint;
end;

procedure TSpriteCheckBox.SetFontSize(Size: Single);
begin
  FFontSize := Size;

  Repaint;
end;

procedure TSpriteCheckBox.SetFontColor(Color: TAlphaColor);
begin
  FFontColor := Color;

  Repaint;
end;

procedure TSpriteCheckBox.SetText(const Value: string);
begin
  FText := Value;

  Repaint;
end;

procedure TSpriteCheckBox.SetFontSetting(const Name: string; Size: Single;
  Color: TAlphaColor);
begin
  FFontName := Name;
  FFontSize := Size;
  FFontColor := TAlphaColor(Color);

  Repaint;
end;

procedure TSpriteCheckBox.SetTextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  Self.FWordWrap := FWordWrap;
  Self.FHorzAlign := FHorzAlign;
  Self.FVertAlign := FVertAlign;

  Repaint;
end;

procedure TSpriteCheckBox.SetChecked(Value: Boolean);
begin
  if FChecked = Value then
    Exit;

  FChecked := Value;

  if Assigned(FOnChange) then
    FOnChange(Self);

  Repaint;
end;

function TSpriteCheckBox.IsChecked: Boolean;
begin
  Result := FChecked;
end;

// =============================================================================
// TFImageCheckBox
// =============================================================================
procedure TFImageCheckBox.FCreate(FParent: TFmxObject);
begin
  ControlImageCheckBox := TSpriteCheckBox.Create(nil);
  ControlImageCheckBox.Parent := TFmxObject(FParent);
end;

procedure TFImageCheckBox.Cursor(FCursor: TCursor);
begin
  ControlImageCheckBox.Cursor := TCursor(FCursor);
end;

procedure TFImageCheckBox.Left(FLeft: Single);
begin
  ControlImageCheckBox.Position.X := FLeft;
end;

procedure TFImageCheckBox.Top(FTop: Single);
begin
  ControlImageCheckBox.Position.Y := FTop;
end;

procedure TFImageCheckBox.Height(FHeight: Single);
begin
  ControlImageCheckBox.Size.Height := FHeight;
end;

procedure TFImageCheckBox.Width(FWidth: Single);
begin
  ControlImageCheckBox.Size.Width := FWidth;
end;

procedure TFImageCheckBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlImageCheckBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFImageCheckBox.Position(X, Y: Single);
begin
  ControlImageCheckBox.Position.X := X;
  ControlImageCheckBox.Position.Y := Y;
end;

procedure TFImageCheckBox.Align(Al: TAlignLayout);
begin
  ControlImageCheckBox.Align := TAlignLayout(Al);
end;

procedure TFImageCheckBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageCheckBox.Margins.Left := FLeft;
  ControlImageCheckBox.Margins.Top := FTop;
  ControlImageCheckBox.Margins.Right := FRight;
  ControlImageCheckBox.Margins.Bottom := FBottom;
end;

procedure TFImageCheckBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageCheckBox.Padding.Left := FLeft;
  ControlImageCheckBox.Padding.Top := FTop;
  ControlImageCheckBox.Padding.Right := FRight;
  ControlImageCheckBox.Padding.Bottom := FBottom;
end;

procedure TFImageCheckBox.SetHint(const FText: WideString);
begin
  ControlImageCheckBox.ShowHint := True;
  ControlImageCheckBox.Hint := string(FText);
end;

procedure TFImageCheckBox.SetClipChildren(FValue: Boolean);
begin
  ControlImageCheckBox.ClipChildren := FValue;
end;

procedure TFImageCheckBox.SetClipParent(FValue: Boolean);
begin
  ControlImageCheckBox.ClipParent := FValue;
end;

procedure TFImageCheckBox.BringToFront;
begin
  ControlImageCheckBox.BringToFront;
end;

procedure TFImageCheckBox.SendToBack;
begin
  ControlImageCheckBox.SendToBack;
end;

procedure TFImageCheckBox.SetTag(FTag: Integer);
begin
  ControlImageCheckBox.Tag := FTag;
end;

procedure TFImageCheckBox.SetChecked(FChecked: Boolean);
begin
  ControlImageCheckBox.Checked := FChecked;
end;

procedure TFImageCheckBox.SetImage(const FImage: WideString);
begin
  ControlImageCheckBox.LoadSprite(string(FImage));
end;

procedure TFImageCheckBox.Text(const AText: WideString);
begin
  ControlImageCheckBox.SetText(string(AText));
end;

procedure TFImageCheckBox.TextColor(FontColor: TAlphaColor);
begin
  ControlImageCheckBox.SetFontColor(TAlphaColor(FontColor));
end;

procedure TFImageCheckBox.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlImageCheckBox.SetFontSetting(string(FontName), FontSize,
    TAlphaColor(FontColor));
end;

procedure TFImageCheckBox.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlImageCheckBox.SetTextSetting(FWordWrap,
    TTextAlign(FHorzAlign), TTextAlign(FVertAlign));
end;

procedure TFImageCheckBox.Repaint;
begin
  ControlImageCheckBox.Repaint;
end;

procedure TFImageCheckBox.Opacity(FOpacity: Single);
begin
  ControlImageCheckBox.Opacity := FOpacity;
end;

procedure TFImageCheckBox.RotationAngle(FValue: Single);
begin
  ControlImageCheckBox.RotationAngle := FValue;
end;

procedure TFImageCheckBox.RotationCenter(X, Y: Single);
begin
  ControlImageCheckBox.RotationCenter.X := X;
  ControlImageCheckBox.RotationCenter.Y := Y;
end;

procedure TFImageCheckBox.Enabled(FEnabled: Boolean);
begin
  ControlImageCheckBox.Enabled := FEnabled;
end;

procedure TFImageCheckBox.Visible(FVisible: Boolean);
begin
  ControlImageCheckBox.Visible := FVisible;
end;

procedure TFImageCheckBox.HitTest(FEnabled: Boolean);
begin
  ControlImageCheckBox.HitTest := FEnabled;
end;

function TFImageCheckBox.IsChecked: Boolean;
begin
  Result := ControlImageCheckBox.Checked;
end;

function TFImageCheckBox.IsVisible: Boolean;
begin
  Result := ControlImageCheckBox.Visible;
end;

function TFImageCheckBox.GetTag: Integer;
begin
  Result := ControlImageCheckBox.Tag;
end;

function TFImageCheckBox.GetLeft: Single;
begin
  Result := ControlImageCheckBox.Position.X;
end;

function TFImageCheckBox.GetTop: Single;
begin
  Result := ControlImageCheckBox.Position.Y;
end;

function TFImageCheckBox.GetHeight: Single;
begin
  Result := ControlImageCheckBox.Size.Height;
end;

function TFImageCheckBox.GetWidth: Single;
begin
  Result := ControlImageCheckBox.Size.Width;
end;

function TFImageCheckBox.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlImageCheckBox);
end;

procedure TFImageCheckBox.OnClick(Event: TNotifyEvent);
begin
  ControlImageCheckBox.OnClick := TNotifyEvent(Event);
end;

procedure TFImageCheckBox.OnChange(Event: TNotifyEvent);
begin
  ControlImageCheckBox.OnChange := TNotifyEvent(Event);
end;

procedure TFImageCheckBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlImageCheckBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFImageCheckBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlImageCheckBox.OnMouseLeave := TNotifyEvent(Event);
end;

function TFImageCheckBox.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlImageCheckBox);
end;

// -----------------------------------------------------------------------------
// TSpriteButton
// ----------------------------------------------------------------
constructor TSpriteButton.Create(AOwner: TComponent);
begin
  inherited;

  FSprite := TBitmap.Create;
  HitTest := True;

  FFontName := 'Segoe UI';
  FFontSize := 13;
  FFontColor := TAlphaColor($FFFFFFFF);

  FWordWrap := False;
  FHorzAlign := TTextAlign.Center;
  FVertAlign := TTextAlign.Center;
end;

destructor TSpriteButton.Destroy;
begin
  FSprite.Free;

  inherited;
end;

procedure TSpriteButton.DoMouseLeave;
begin
  inherited;

  FHover := False;
  FDown := False;

  Repaint;
end;

procedure TSpriteButton.UpdateState(X, Y: Single; MouseDown: Boolean);
var
  NewHover: Boolean;
begin
  if not Enabled then
  begin
    FHover := False;
    FDown := False;
    Exit;
  end;

  NewHover := (X >= 0) and (Y >= 0) and (X <= Width) and (Y <= Height);

  FHover := NewHover;
  FDown := MouseDown and NewHover;

  Repaint;
end;

procedure TSpriteButton.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;

  UpdateState(X, Y, FDown);
end;

procedure TSpriteButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;

  if Button <> TMouseButton.mbLeft then
    Exit;

  Capture;
  UpdateState(X, Y, True);
end;

procedure TSpriteButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;

  UpdateState(X, Y, False);
  ReleaseCapture;
end;

function TSpriteButton.GetFrame: Integer;
begin
  if not Enabled then
    Exit(3);

  if FDown then
    Exit(2);

  if FHover then
    Exit(1);

  Result := 0;
end;

procedure TSpriteButton.Paint;
var
  Frame: Integer;
  Src, Dest: TRectF;
  FrameH: Single;
begin
  inherited;

  if (FSprite = nil) or FSprite.IsEmpty then
    Exit;

  Frame := GetFrame;
  FrameH := FSprite.Height / 4;

  Src := RectF(0, Frame * FrameH, FSprite.Width, (Frame + 1) * FrameH);

  Dest := RectF(0, 0, Width, Height);

  Canvas.DrawBitmap(FSprite, Src, Dest, AbsoluteOpacity, False);

  if FText <> '' then
  begin
    Canvas.Font.Family := FFontName;
    Canvas.Font.Size := FFontSize;
    Canvas.Fill.Color := FFontColor;
    Canvas.FillText(Dest, FText, FWordWrap, AbsoluteOpacity, [],
      FHorzAlign, FVertAlign);
  end;
end;

procedure TSpriteButton.LoadSprite(const FileName: string);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    B.LoadFromFile(FileName);

    FSprite.SetSize(Round(Width), Round(Height * 4));
    FSprite.Canvas.BeginScene;
    FSprite.Canvas.DrawBitmap(B, RectF(0, 0, B.Width, B.Height),
      RectF(0, 0, FSprite.Width, FSprite.Height), 1);
    FSprite.Canvas.EndScene;
  finally
    B.Free;
  end;
end;

procedure TSpriteButton.SetFontName(const Name: string);
begin
  FFontName := Name;

  Repaint;
end;

procedure TSpriteButton.SetFontSize(Size: Single);
begin
  FFontSize := Size;

  Repaint;
end;

procedure TSpriteButton.SetFontColor(Color: TAlphaColor);
begin
  FFontColor := Color;

  Repaint;
end;

procedure TSpriteButton.SetText(const Value: string);
begin
  FText := Value;

  Repaint;
end;

procedure TSpriteButton.SetFontSetting(const Name: string; Size: Single;
  Color: TAlphaColor);
begin
  FFontName := Name;
  FFontSize := Size;
  FFontColor := TAlphaColor(Color);

  Repaint;
end;

procedure TSpriteButton.SetTextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  Self.FWordWrap := FWordWrap;
  Self.FHorzAlign := FHorzAlign;
  Self.FVertAlign := FVertAlign;

  Repaint;
end;

// =============================================================================
// TFImageButton
// =============================================================================
procedure TFImageButton.FCreate(FParent: TFmxObject);
begin
  ControlImageButton := TSpriteButton.Create(nil);
  ControlImageButton.Parent := TFmxObject(FParent);
end;

procedure TFImageButton.Cursor(FCursor: TCursor);
begin
  ControlImageButton.Cursor := TCursor(FCursor);
end;

procedure TFImageButton.Left(FLeft: Single);
begin
  ControlImageButton.Position.X := FLeft;
end;

procedure TFImageButton.Top(FTop: Single);
begin
  ControlImageButton.Position.Y := FTop;
end;

procedure TFImageButton.Height(FHeight: Single);
begin
  ControlImageButton.Size.Height := FHeight;
end;

procedure TFImageButton.Width(FWidth: Single);
begin
  ControlImageButton.Size.Width := FWidth;
end;

procedure TFImageButton.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlImageButton.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFImageButton.Position(X, Y: Single);
begin
  ControlImageButton.Position.X := X;
  ControlImageButton.Position.Y := Y;
end;

procedure TFImageButton.Align(Al: TAlignLayout);
begin
  ControlImageButton.Align := TAlignLayout(Al);
end;

procedure TFImageButton.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageButton.Margins.Left := FLeft;
  ControlImageButton.Margins.Top := FTop;
  ControlImageButton.Margins.Right := FRight;
  ControlImageButton.Margins.Bottom := FBottom;
end;

procedure TFImageButton.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImageButton.Padding.Left := FLeft;
  ControlImageButton.Padding.Top := FTop;
  ControlImageButton.Padding.Right := FRight;
  ControlImageButton.Padding.Bottom := FBottom;
end;

procedure TFImageButton.SetHint(const FText: WideString);
begin
  ControlImageButton.ShowHint := True;
  ControlImageButton.Hint := string(FText);
end;

procedure TFImageButton.SetClipChildren(FValue: Boolean);
begin
  ControlImageButton.ClipChildren := FValue;
end;

procedure TFImageButton.SetClipParent(FValue: Boolean);
begin
  ControlImageButton.ClipParent := FValue;
end;

procedure TFImageButton.BringToFront;
begin
  ControlImageButton.BringToFront;
end;

procedure TFImageButton.SendToBack;
begin
  ControlImageButton.SendToBack;
end;

procedure TFImageButton.SetTag(FTag: Integer);
begin
  ControlImageButton.Tag := FTag;
end;

procedure TFImageButton.SetImage(const FImage: WideString);
begin
  ControlImageButton.LoadSprite(string(FImage));
end;

procedure TFImageButton.Text(const AText: WideString);
begin
  ControlImageButton.SetText(string(AText));
end;

procedure TFImageButton.TextColor(FontColor: TAlphaColor);
begin
  ControlImageButton.SetFontColor(TAlphaColor(FontColor));
end;

procedure TFImageButton.FontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  ControlImageButton.SetFontSetting(string(FontName), FontSize,
    TAlphaColor(FontColor));
end;

procedure TFImageButton.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlImageButton.SetTextSetting(FWordWrap,
    TTextAlign(FHorzAlign), TTextAlign(FVertAlign));
end;

procedure TFImageButton.Repaint;
begin
  ControlImageButton.Repaint;
end;

procedure TFImageButton.Opacity(FOpacity: Single);
begin
  ControlImageButton.Opacity := FOpacity;
end;

procedure TFImageButton.RotationAngle(FValue: Single);
begin
  ControlImageButton.RotationAngle := FValue;
end;

procedure TFImageButton.RotationCenter(X, Y: Single);
begin
  ControlImageButton.RotationCenter.X := X;
  ControlImageButton.RotationCenter.Y := Y;
end;

procedure TFImageButton.Enabled(FEnabled: Boolean);
begin
  ControlImageButton.Enabled := FEnabled;
end;

procedure TFImageButton.Visible(FVisible: Boolean);
begin
  ControlImageButton.Visible := FVisible;
end;

procedure TFImageButton.HitTest(FEnabled: Boolean);
begin
  ControlImageButton.HitTest := FEnabled;
end;

function TFImageButton.IsVisible: Boolean;
begin
  Result := ControlImageButton.Visible;
end;

function TFImageButton.GetTag: Integer;
begin
  Result := ControlImageButton.Tag;
end;

function TFImageButton.GetLeft: Single;
begin
  Result := ControlImageButton.Position.X;
end;

function TFImageButton.GetTop: Single;
begin
  Result := ControlImageButton.Position.Y;
end;

function TFImageButton.GetHeight: Single;
begin
  Result := ControlImageButton.Size.Height;
end;

function TFImageButton.GetWidth: Single;
begin
  Result := ControlImageButton.Size.Width;
end;

function TFImageButton.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlImageButton);
end;

procedure TFImageButton.OnClick(Event: TNotifyEvent);
begin
  ControlImageButton.OnClick := TNotifyEvent(Event);
end;

procedure TFImageButton.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlImageButton.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFImageButton.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlImageButton.OnMouseLeave := TNotifyEvent(Event);
end;

function TFImageButton.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlImageButton);
end;

// =============================================================================
// Exports
// =============================================================================
function InitImageProgressBarHandle: FImageProgressBar;
begin
  Result := TFImageProgressBar.Create;
end;

function InitImageRadioButtonHandle: FImageRadioButton;
begin
  Result := TFImageRadioButton.Create;
end;

function InitImageCheckBoxHandle: FImageCheckBox;
begin
  Result := TFImageCheckBox.Create;
end;

function InitImageButtonHandle: FImageButton;
begin
  Result := TFImageButton.Create;
end;

exports
  InitImageProgressBarHandle,
  InitImageRadioButtonHandle,
  InitImageCheckBoxHandle,
  InitImageButtonHandle;

end.
