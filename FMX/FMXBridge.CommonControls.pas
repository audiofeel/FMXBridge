
unit FMXBridge.CommonControls;

interface

uses
  System.Classes, System.UITypes,
  FMX.Types, FMX.TabControl, FMX.MultiView, FMX.MultiView.Types;

// =============================================================================
// FTabItem
// =============================================================================
type
  FTabItem = interface(IUnknown)
    ['{3B241A9D-521C-4AD3-A5DE-02E5260082B8}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ShowAsDot(FValue: Boolean); stdcall;
    procedure AutoSize(FValue: Boolean); stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure SetFocus; stdcall;
    procedure IsSelected(FValue: Boolean); stdcall;
    procedure Index(FIndex: Integer); stdcall;
    procedure Pressed(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIsSelected: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GetPressed: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TTabItem; stdcall;
  end;

  TFTabItem = class(TInterfacedObject, FTabItem)
    ControlTabItem: TTabItem;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ShowAsDot(FValue: Boolean); stdcall;
    procedure AutoSize(FValue: Boolean); stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure SetFocus; stdcall;
    procedure IsSelected(FValue: Boolean); stdcall;
    procedure Index(FIndex: Integer); stdcall;
    procedure Pressed(FValue: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetIsSelected: Boolean; stdcall;
    function GetIndex: Integer; stdcall;
    function GetPressed: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TTabItem; stdcall;
  end;

// =============================================================================
// FTabControl
// =============================================================================
type
  FTabControl = interface(IUnknown)
    ['{D2273196-C2A0-4E93-864E-DC8D5626FBBF}']
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
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure SetActiveTabWithTransition(const FTab: TTabItem;
      FTransition: TTabTransition;
      FDirection: TTabTransitionDirection); stdcall;
    procedure SetActiveTabWithTransitionAsync(const FTab: TTabItem;
      FTransition: TTabTransition; FDirection: TTabTransitionDirection;
      FOnFinish: TNotifyEvent); stdcall;
    procedure FinishCurrentTabTransition; stdcall;
    procedure GoToActiveTab; stdcall;
    procedure TabPosition(FTabPosition: TTabPosition); stdcall;
    procedure TabHeight(FHeight: Single); stdcall;
    procedure TabIndex(FIndex: Integer); stdcall;
    procedure TabStop(FValue: Boolean); stdcall;
    procedure UpdateTabBarButtons; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function GotoVisibleTab(FIndex: Integer; FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function Next(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function Previous(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function First(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function Last(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function Delete(const FIndex: Integer): Boolean; stdcall;
    function HasActiveTab: Boolean; stdcall;
    function TabCount: Integer; stdcall;
    function TransitionRunning: Boolean; stdcall;
    function ActiveTab: TTabItem; stdcall;
    function ActiveTabIndex: Integer; stdcall;
    function GetTabItem(FIndex: Integer): TTabItem; stdcall;
    function GetPressed: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFTabControl = class(TInterfacedObject, FTabControl)
  private
    ControlTab: TTabControl;
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
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure SetActiveTabWithTransition(const FTab: TTabItem;
      FTransition: TTabTransition;
      FDirection: TTabTransitionDirection); stdcall;
    procedure SetActiveTabWithTransitionAsync(const FTab: TTabItem;
      FTransition: TTabTransition; FDirection: TTabTransitionDirection;
      FOnFinish: TNotifyEvent); stdcall;
    procedure FinishCurrentTabTransition; stdcall;
    procedure GoToActiveTab; stdcall;
    procedure TabPosition(FTabPosition: TTabPosition); stdcall;
    procedure TabHeight(FHeight: Single); stdcall;
    procedure TabIndex(FIndex: Integer); stdcall;
    procedure TabStop(FValue: Boolean); stdcall;
    procedure UpdateTabBarButtons; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function GotoVisibleTab(FIndex: Integer; FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function Next(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function Previous(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function First(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function Last(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean; stdcall;
    function Delete(const FIndex: Integer): Boolean; stdcall;
    function HasActiveTab: Boolean; stdcall;
    function TabCount: Integer; stdcall;
    function TransitionRunning: Boolean; stdcall;
    function ActiveTab: TTabItem; stdcall;
    function ActiveTabIndex: Integer; stdcall;
    function GetTabItem(FIndex: Integer): TTabItem; stdcall;
    function GetPressed: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FMultiView
// =============================================================================
type
  FMultiView = interface(IUnknown)
    ['{79822FD5-F942-4BE6-952C-0E07989C8C43}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure BorderOptions(FColor: TAlphaColor; FVisible: Boolean); stdcall;
    procedure DrawerOptions(FMode: TSlidingMode; FPlacement: TPanelPlacement;
      FDurationSliding, FTouchAreaSize: Single); stdcall;
    procedure MasterButton(FControl: TFmxObject); stdcall;
    procedure Mode(FMode: TMultiViewMode); stdcall;
    procedure NavCollapsedWidth(CollapsedWidth: Single); stdcall;
    procedure PopoverOptions(FAppearanceDuration, FPopupHeight: Single;
      FStyleLookup: WideString; FTintColor: TAlphaColor); stdcall;
    procedure ShadowOptions(FColor: TAlphaColor; FEnable: Boolean;
      FOpacity: Single); stdcall;
    procedure SplitViewOptions(FPlacement: TPanelPlacement); stdcall;
    procedure TargetControl(FTargetControl: TFmxObject); stdcall;
    procedure ShowMaster; stdcall;
    procedure HideMaster; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsShowed: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnStartShowing(Event: TNotifyEvent); stdcall;
    procedure OnStartHiding(Event: TNotifyEvent); stdcall;
    procedure OnShown(Event: TNotifyEvent); stdcall;
    procedure OnHidden(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFMultiView = class(TInterfacedObject, FMultiView)
  private
    ControlMultiView: TMultiView;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure BorderOptions(FColor: TAlphaColor; FVisible: Boolean); stdcall;
    procedure DrawerOptions(FMode: TSlidingMode; FPlacement: TPanelPlacement;
      FDurationSliding, FTouchAreaSize: Single); stdcall;
    procedure MasterButton(FControl: TFmxObject); stdcall;
    procedure Mode(FMode: TMultiViewMode); stdcall;
    procedure NavCollapsedWidth(CollapsedWidth: Single); stdcall;
    procedure PopoverOptions(FAppearanceDuration, FPopupHeight: Single;
      FStyleLookup: WideString; FTintColor: TAlphaColor); stdcall;
    procedure ShadowOptions(FColor: TAlphaColor; FEnable: Boolean;
      FOpacity: Single); stdcall;
    procedure SplitViewOptions(FPlacement: TPanelPlacement); stdcall;
    procedure TargetControl(FTargetControl: TFmxObject); stdcall;
    procedure ShowMaster; stdcall;
    procedure HideMaster; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsShowed: Boolean; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnStartShowing(Event: TNotifyEvent); stdcall;
    procedure OnStartHiding(Event: TNotifyEvent); stdcall;
    procedure OnShown(Event: TNotifyEvent); stdcall;
    procedure OnHidden(Event: TNotifyEvent); stdcall;
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
function InitTabItemHandle: FTabItem; stdcall;
function InitTabControlHandle: FTabControl; stdcall;
function InitMultiViewHandle: FMultiView; stdcall;

implementation

uses
  FMX.Controls;

// =============================================================================
// FTabItem
// =============================================================================
procedure TFTabItem.FCreate(FParent: TFmxObject);
begin
  ControlTabItem := TTabItem.Create(FParent);
  ControlTabItem.Parent := FParent;
  ControlTabItem.Text := 'TabItem1';
end;

procedure TFTabItem.Cursor(FCursor: TCursor);
begin
  ControlTabItem.Cursor := TCursor(FCursor);
end;

procedure TFTabItem.Height(FHeight: Single);
begin
  ControlTabItem.Size.Height := FHeight;
end;

procedure TFTabItem.Width(FWidth: Single);
begin
  ControlTabItem.Size.Width := FWidth;
end;

procedure TFTabItem.BringToFront;
begin
  ControlTabItem.BringToFront;
end;

procedure TFTabItem.SendToBack;
begin
  ControlTabItem.SendToBack;
end;

procedure TFTabItem.SetHint(const FText: WideString);
begin
  ControlTabItem.Hint := string(FText);
end;

procedure TFTabItem.SetTag(FTag: Integer);
begin
  ControlTabItem.Tag := FTag;
end;

procedure TFTabItem.ShowAsDot(FValue: Boolean);
begin
  ControlTabItem.ShowAsDot := FValue;
end;

procedure TFTabItem.AutoSize(FValue: Boolean);
begin
  ControlTabItem.AutoSize := FValue;
end;

procedure TFTabItem.CanFocus(FValue: Boolean);
begin
  ControlTabItem.CanFocus := FValue;
end;

procedure TFTabItem.SetFocus;
begin
  ControlTabItem.SetFocus;
end;

procedure TFTabItem.IsSelected(FValue: Boolean);
begin
  ControlTabItem.IsSelected := FValue;
end;

procedure TFTabItem.Index(FIndex: Integer);
begin
  ControlTabItem.Index := FIndex;
end;

procedure TFTabItem.Pressed(FValue: Boolean);
begin
  ControlTabItem.Pressed := FValue;
end;

procedure TFTabItem.Text(const FText: WideString);
begin
  ControlTabItem.Text := string(FText);
end;

procedure TFTabItem.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlTabItem.StyledSettings := TStyledSettings(FStyledSettings);
end;

procedure TFTabItem.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlTabItem.StyledSettings := [];

  ControlTabItem.TextSettings.Font.Family := string(FontName);
  ControlTabItem.TextSettings.Font.Size := FontSize;
  ControlTabItem.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFTabItem.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlTabItem.TextSettings.HorzAlign := TTextAlign(FHorzAlign);
  ControlTabItem.TextSettings.VertAlign := TTextAlign(FVertAlign);
  ControlTabItem.TextSettings.WordWrap := FWordWrap;
end;

procedure TFTabItem.Opacity(FOpacity: Single);
begin
  ControlTabItem.Opacity := FOpacity;
end;

procedure TFTabItem.Enabled(FEnabled: Boolean);
begin
  ControlTabItem.Enabled := FEnabled;
end;

procedure TFTabItem.Visible(FVisible: Boolean);
begin
  ControlTabItem.Visible := FVisible;
end;

procedure TFTabItem.HitTest(FEnabled: Boolean);
begin
  ControlTabItem.HitTest := FEnabled;
end;

procedure TFTabItem.StyleLookUp(FStyle: WideString);
begin
  ControlTabItem.StyleLookUp := string(FStyle);
end;

function TFTabItem.IsVisible: Boolean;
begin
  Result := ControlTabItem.Visible;
end;

function TFTabItem.GetIsSelected: Boolean;
begin
  Result := ControlTabItem.IsSelected
end;

function TFTabItem.GetIndex: Integer;
begin
  Result := ControlTabItem.Index;
end;

function TFTabItem.GetPressed: Boolean;
begin
  Result := ControlTabItem.Pressed;
end;

function TFTabItem.GetTag: Integer;
begin
  Result := ControlTabItem.Tag;
end;

function TFTabItem.GetHeight: Single;
begin
  Result := ControlTabItem.Size.Height;
end;

function TFTabItem.GetWidth: Single;
begin
  Result := ControlTabItem.Size.Width;
end;

function TFTabItem.GetObject: TFmxObject;
begin
  Result := ControlTabItem;
end;

procedure TFTabItem.OnClick(Event: TNotifyEvent);
begin
  ControlTabItem.OnClick := TNotifyEvent(Event);
end;

procedure TFTabItem.OnMouseDown(Event: TMouseEvent);
begin
  ControlTabItem.OnMouseDown := TMouseEvent(Event);
end;

procedure TFTabItem.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlTabItem.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFTabItem.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlTabItem.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFTabItem.OnMouseUp(Event: TMouseEvent);
begin
  ControlTabItem.OnMouseUp := TMouseEvent(Event);
end;

function TFTabItem.Handle: TTabItem;
begin
  Result := ControlTabItem;
end;

// =============================================================================
// FTabControl
// =============================================================================
procedure TFTabControl.FCreate(FParent: TFmxObject);
begin
  ControlTab := TTabControl.Create(nil);
  ControlTab.Parent := FParent;
end;

procedure TFTabControl.Cursor(FCursor: TCursor);
begin
  ControlTab.Cursor := TCursor(FCursor);
end;

procedure TFTabControl.Left(FLeft: Single);
begin
  ControlTab.Position.X := FLeft;
end;

procedure TFTabControl.Top(FTop: Single);
begin
  ControlTab.Position.Y := FTop;
end;

procedure TFTabControl.Height(FHeight: Single);
begin
  ControlTab.Size.Height := FHeight;
end;

procedure TFTabControl.Width(FWidth: Single);
begin
  ControlTab.Size.Width := FWidth;
end;

procedure TFTabControl.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlTab.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFTabControl.Position(X, Y: Single);
begin
  ControlTab.Position.X := X;
  ControlTab.Position.Y := Y;
end;

procedure TFTabControl.Align(Al: TAlignLayout);
begin
  ControlTab.Align := TAlignLayout(Al);
end;

procedure TFTabControl.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTab.Margins.Left := FLeft;
  ControlTab.Margins.Top := FTop;
  ControlTab.Margins.Right := FRight;
  ControlTab.Margins.Bottom := FBottom;
end;

procedure TFTabControl.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTab.Padding.Left := FLeft;
  ControlTab.Padding.Top := FTop;
  ControlTab.Padding.Right := FRight;
  ControlTab.Padding.Bottom := FBottom;
end;

procedure TFTabControl.SetHint(const FText: WideString);
begin
  ControlTab.ShowHint := True;
  ControlTab.Hint := string(FText);
end;

procedure TFTabControl.BringToFront;
begin
  ControlTab.BringToFront;
end;

procedure TFTabControl.SendToBack;
begin
  ControlTab.SendToBack;
end;

procedure TFTabControl.SetTag(FTag: Integer);
begin
  ControlTab.Tag := FTag;
end;

procedure TFTabControl.SetActiveTabWithTransition(const FTab: TTabItem;
  FTransition: TTabTransition; FDirection: TTabTransitionDirection);
begin
  ControlTab.SetActiveTabWithTransition(TTabItem(FTab),
    TTabTransition(FTransition), TTabTransitionDirection(FDirection));
end;

procedure TFTabControl.SetActiveTabWithTransitionAsync(const FTab: TTabItem;
  FTransition: TTabTransition; FDirection: TTabTransitionDirection;
  FOnFinish: TNotifyEvent);
begin
  ControlTab.SetActiveTabWithTransitionAsync(TTabItem(FTab),
    TTabTransition(FTransition), TTabTransitionDirection(FDirection),
    TNotifyEvent(FOnFinish));
end;

procedure TFTabControl.FinishCurrentTabTransition;
begin
  ControlTab.FinishCurrentTabTransition;
end;

procedure TFTabControl.GoToActiveTab;
begin
  ControlTab.GoToActiveTab;
end;

procedure TFTabControl.TabPosition(FTabPosition: TTabPosition);
begin
  ControlTab.TabPosition := TTabPosition(FTabPosition);
end;

procedure TFTabControl.TabHeight(FHeight: Single);
begin
  ControlTab.TabHeight := FHeight;
end;

procedure TFTabControl.TabIndex(FIndex: Integer);
begin
  ControlTab.TabIndex := FIndex;
end;

procedure TFTabControl.TabStop(FValue: Boolean);
begin
  ControlTab.TabStop := FValue;
end;

procedure TFTabControl.UpdateTabBarButtons;
begin
  ControlTab.UpdateTabBarButtons;
end;

procedure TFTabControl.CanFocus(FValue: Boolean);
begin
  ControlTab.CanFocus := FValue;
end;

procedure TFTabControl.Opacity(FOpacity: Single);
begin
  ControlTab.Opacity := FOpacity;
end;

procedure TFTabControl.RotationAngle(FValue: Single);
begin
  ControlTab.RotationAngle := FValue;
end;

procedure TFTabControl.RotationCenter(X, Y: Single);
begin
  ControlTab.RotationCenter.X := X;
  ControlTab.RotationCenter.Y := Y;
end;

procedure TFTabControl.Enabled(FEnabled: Boolean);
begin
  ControlTab.Enabled := FEnabled;
end;

procedure TFTabControl.Visible(FVisible: Boolean);
begin
  ControlTab.Visible := FVisible;
end;

procedure TFTabControl.HitTest(FEnabled: Boolean);
begin
  ControlTab.HitTest := FEnabled;
end;

procedure TFTabControl.StyleLookUp(FStyle: WideString);
begin
  ControlTab.StyleLookUp := string(FStyle);
end;

function TFTabControl.GotoVisibleTab(FIndex: Integer;
  FTransition: TTabTransition; FDirection: TTabTransitionDirection): Boolean;
begin
  Result := ControlTab.GotoVisibleTab(FIndex, TTabTransition(FTransition),
    TTabTransitionDirection(FDirection));
end;

function TFTabControl.Next(FTransition: TTabTransition;
  FDirection: TTabTransitionDirection): Boolean;
begin
  Result := ControlTab.Next(TTabTransition(FTransition),
    TTabTransitionDirection(FDirection));
end;

function TFTabControl.Previous(FTransition: TTabTransition;
  FDirection: TTabTransitionDirection): Boolean;
begin
  Result := ControlTab.Previous(TTabTransition(FTransition),
    TTabTransitionDirection(FDirection));
end;

function TFTabControl.First(FTransition: TTabTransition;
  FDirection: TTabTransitionDirection): Boolean;
begin
  Result := ControlTab.First(TTabTransition(FTransition),
    TTabTransitionDirection(FDirection));
end;

function TFTabControl.Last(FTransition: TTabTransition;
  FDirection: TTabTransitionDirection): Boolean;
begin
  Result := ControlTab.Last(TTabTransition(FTransition),
    TTabTransitionDirection(FDirection));
end;

function TFTabControl.Delete(const FIndex: Integer): Boolean;
begin
  Result := ControlTab.Delete(FIndex);
end;

function TFTabControl.HasActiveTab: Boolean;
begin
  Result := ControlTab.HasActiveTab;
end;

function TFTabControl.TabCount: Integer;
begin
  Result := ControlTab.TabCount;
end;

function TFTabControl.TransitionRunning: Boolean;
begin
  Result := ControlTab.TransitionRunning;
end;

function TFTabControl.ActiveTab: TTabItem;
begin
  Result := ControlTab.ActiveTab;
end;

function TFTabControl.ActiveTabIndex: Integer;
begin
  Result := ControlTab.TabIndex;
end;

function TFTabControl.GetTabItem(FIndex: Integer): TTabItem;
begin
  Result := ControlTab.Tabs[FIndex];
end;

function TFTabControl.GetPressed: Boolean;
begin
  Result := ControlTab.Pressed;
end;

function TFTabControl.IsVisible: Boolean;
begin
  Result := ControlTab.Visible;
end;

function TFTabControl.GetTag: Integer;
begin
  Result := ControlTab.Tag;
end;

function TFTabControl.GetLeft: Single;
begin
  Result := ControlTab.Position.X;
end;

function TFTabControl.GetTop: Single;
begin
  Result := ControlTab.Position.Y;
end;

function TFTabControl.GetHeight: Single;
begin
  Result := ControlTab.Size.Height;
end;

function TFTabControl.GetWidth: Single;
begin
  Result := ControlTab.Size.Width;
end;

procedure TFTabControl.OnClick(Event: TNotifyEvent);
begin
  ControlTab.OnClick := TNotifyEvent(Event);
end;

procedure TFTabControl.OnChange(Event: TNotifyEvent);
begin
  ControlTab.OnChange := TNotifyEvent(Event);
end;

procedure TFTabControl.OnMouseDown(Event: TMouseEvent);
begin
  ControlTab.OnMouseDown := TMouseEvent(Event);
end;

procedure TFTabControl.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlTab.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFTabControl.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlTab.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFTabControl.OnMouseUp(Event: TMouseEvent);
begin
  ControlTab.OnMouseUp := TMouseEvent(Event);
end;

function TFTabControl.Handle: TFmxObject;
begin
  Result := ControlTab;
end;

// =============================================================================
// FMultiView
// =============================================================================
procedure TFMultiView.FCreate(FParent: TFmxObject);
begin
  ControlMultiView := TMultiView.Create(nil);
  ControlMultiView.Parent := FParent;
end;

procedure TFMultiView.Cursor(FCursor: TCursor);
begin
  ControlMultiView.Cursor := TCursor(FCursor);
end;

procedure TFMultiView.Left(FLeft: Single);
begin
  ControlMultiView.Position.X := FLeft;
end;

procedure TFMultiView.Top(FTop: Single);
begin
  ControlMultiView.Position.Y := FTop;
end;

procedure TFMultiView.Height(FHeight: Single);
begin
  ControlMultiView.Size.Height := FHeight;
end;

procedure TFMultiView.Width(FWidth: Single);
begin
  ControlMultiView.Size.Width := FWidth;
end;

procedure TFMultiView.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlMultiView.Position.X := FLeft;
  ControlMultiView.Position.Y := FTop;
  ControlMultiView.Size.Width := FWidth;
  ControlMultiView.Size.Height := FHeight;
end;

procedure TFMultiView.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlMultiView.Padding.Left := FLeft;
  ControlMultiView.Padding.Top := FTop;
  ControlMultiView.Padding.Right := FRight;
  ControlMultiView.Padding.Bottom := FBottom;
end;

procedure TFMultiView.SetClipParent(FValue: Boolean);
begin
  ControlMultiView.ClipParent := FValue;
end;

procedure TFMultiView.SetClipChildren(FValue: Boolean);
begin
  ControlMultiView.ClipChildren := FValue;
end;

procedure TFMultiView.BringToFront;
begin
  ControlMultiView.BringToFront;
end;

procedure TFMultiView.SendToBack;
begin
  ControlMultiView.SendToBack;
end;

procedure TFMultiView.SetTag(FTag: Integer);
begin
  ControlMultiView.Tag := FTag;
end;

procedure TFMultiView.BorderOptions(FColor: TAlphaColor; FVisible: Boolean);
begin
  ControlMultiView.BorderOptions.Color := TAlphaColor(FColor);
  ControlMultiView.BorderOptions.Visible := FVisible;
end;

procedure TFMultiView.DrawerOptions(FMode: TSlidingMode;
  FPlacement: TPanelPlacement; FDurationSliding, FTouchAreaSize: Single);
begin
  ControlMultiView.DrawerOptions.Mode := TSlidingMode(FMode);
  ControlMultiView.DrawerOptions.Placement := TPanelPlacement(FPlacement);
  ControlMultiView.DrawerOptions.DurationSliding := FDurationSliding;
  ControlMultiView.DrawerOptions.TouchAreaSize := FTouchAreaSize;
end;

procedure TFMultiView.MasterButton(FControl: TFmxObject);
var
  Ctrl: TControl;
begin
  Ctrl := TControl(FControl);

  if Assigned(Ctrl) then
    ControlMultiView.MasterButton := Ctrl;
end;

procedure TFMultiView.Mode(FMode: TMultiViewMode);
begin
  ControlMultiView.Mode := TMultiViewMode(FMode);
end;

procedure TFMultiView.NavCollapsedWidth(CollapsedWidth: Single);
begin
  ControlMultiView.NavigationPaneOptions.CollapsedWidth := CollapsedWidth;
end;

procedure TFMultiView.PopoverOptions(FAppearanceDuration, FPopupHeight: Single;
  FStyleLookup: WideString; FTintColor: TAlphaColor);
begin
  ControlMultiView.PopoverOptions.AppearanceDuration := FAppearanceDuration;
  ControlMultiView.PopoverOptions.PopupHeight := FPopupHeight;
  ControlMultiView.PopoverOptions.StyleLookUp := string(FStyleLookup);
  ControlMultiView.PopoverOptions.TintColor := TAlphaColor(FTintColor);
end;

procedure TFMultiView.ShadowOptions(FColor: TAlphaColor; FEnable: Boolean;
  FOpacity: Single);
begin
  ControlMultiView.ShadowOptions.Color := TAlphaColor(FColor);
  ControlMultiView.ShadowOptions.Enabled := FEnable;
  ControlMultiView.ShadowOptions.Opacity := FOpacity;
end;

procedure TFMultiView.SplitViewOptions(FPlacement: TPanelPlacement);
begin
  ControlMultiView.SplitViewOptions.Placement := TPanelPlacement(FPlacement);
end;

procedure TFMultiView.TargetControl(FTargetControl: TFmxObject);
var
  Ctrl: TControl;
begin
  Ctrl := TControl(FTargetControl);

  if Assigned(Ctrl) then
    ControlMultiView.TargetControl := Ctrl;
end;

procedure TFMultiView.ShowMaster;
begin
  ControlMultiView.ShowMaster;
end;

procedure TFMultiView.HideMaster;
begin
  ControlMultiView.HideMaster;
end;

procedure TFMultiView.Opacity(FOpacity: Single);
begin
  ControlMultiView.Opacity := FOpacity;
end;

procedure TFMultiView.Enabled(FEnabled: Boolean);
begin
  ControlMultiView.Enabled := FEnabled;
end;

procedure TFMultiView.Visible(FVisible: Boolean);
begin
  ControlMultiView.Visible := FVisible;
end;

procedure TFMultiView.HitTest(FEnabled: Boolean);
begin
  ControlMultiView.HitTest := FEnabled;
end;

procedure TFMultiView.StyleLookUp(FStyle: WideString);
begin
  ControlMultiView.StyleLookUp := string(FStyle);
end;

function TFMultiView.IsShowed: Boolean;
begin
  Result := ControlMultiView.IsShowed;
end;

function TFMultiView.IsVisible: Boolean;
begin
  Result := ControlMultiView.Visible;
end;

function TFMultiView.GetTag: Integer;
begin
  Result := ControlMultiView.Tag;
end;

function TFMultiView.GetLeft: Single;
begin
  Result := ControlMultiView.Position.X;
end;

function TFMultiView.GetTop: Single;
begin
  Result := ControlMultiView.Position.Y;
end;

function TFMultiView.GetHeight: Single;
begin
  Result := ControlMultiView.Size.Height;
end;

function TFMultiView.GetWidth: Single;
begin
  Result := ControlMultiView.Size.Width;
end;

function TFMultiView.GetObject: TFmxObject;
begin
  Result := ControlMultiView;
end;

procedure TFMultiView.OnStartShowing(Event: TNotifyEvent);
begin
  ControlMultiView.OnStartShowing := TNotifyEvent(Event);
end;

procedure TFMultiView.OnStartHiding(Event: TNotifyEvent);
begin
  ControlMultiView.OnStartHiding := TNotifyEvent(Event);
end;

procedure TFMultiView.OnShown(Event: TNotifyEvent);
begin
  ControlMultiView.OnShown := TNotifyEvent(Event);
end;

procedure TFMultiView.OnHidden(Event: TNotifyEvent);
begin
  ControlMultiView.OnHidden := TNotifyEvent(Event);
end;

procedure TFMultiView.OnClick(Event: TNotifyEvent);
begin
  ControlMultiView.OnClick := TNotifyEvent(Event);
end;

procedure TFMultiView.OnMouseDown(Event: TMouseEvent);
begin
  ControlMultiView.OnMouseDown := TMouseEvent(Event);
end;

procedure TFMultiView.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlMultiView.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFMultiView.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlMultiView.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFMultiView.OnMouseUp(Event: TMouseEvent);
begin
  ControlMultiView.OnMouseUp := TMouseEvent(Event);
end;

function TFMultiView.Handle: TFmxObject;
begin
  Result := ControlMultiView;
end;

// =============================================================================
// Exports
// =============================================================================
function InitTabItemHandle: FTabItem;
begin
  Result := TFTabItem.Create;
end;

function InitTabControlHandle: FTabControl;
begin
  Result := TFTabControl.Create;
end;

function InitMultiViewHandle: FMultiView;
begin
  Result := TFMultiView.Create;
end;

exports
  InitTabItemHandle,
  InitTabControlHandle,
  InitMultiViewHandle;

end.
