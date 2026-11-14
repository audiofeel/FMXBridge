
unit FMXBridge.TrayIcon;

interface

uses
  Winapi.Windows;

// =============================================================================
// FTrayIcon
// =============================================================================
const
  TrayEventClick = 1;
  TrayEventDoubleClick = 2;
  TrayEventRightClick = 3;
  TrayEventMenuItemClick = 4;

type
  TTrayIconCallback = procedure(const Event, ItemIndex: Integer) of object;

  TTrayMenuItemState = record
    Caption: string;
    Enabled: Boolean;
    Checked: Boolean;
    Separator: Boolean;
  end;

  FTrayIcon = interface(IUnknown)
    ['{A18F05D7-CA91-49AB-8A56-593D7E20F36B}']
    function FCreate(FHandle: HWND): Boolean; stdcall;
    function SetIcon(const FileName: WideString): Boolean; stdcall;
    procedure SetHint(const FHint: WideString); stdcall;
    function Show: Boolean; stdcall;
    procedure Hide; stdcall;
    procedure OnEvent(FCallback: TTrayIconCallback); stdcall;
    function AddMenuItem(const FText: WideString): Integer; stdcall;
    function AddMenuSeparator: Integer; stdcall;
    procedure SetMenuItemText(const Index: Integer;
      const FText: WideString); stdcall;
    procedure SetMenuItemEnabled(const Index: Integer;
      FEnabled: Boolean); stdcall;
    procedure SetMenuItemChecked(const Index: Integer;
      FChecked: Boolean); stdcall;
    procedure ClearMenu; stdcall;
    function MenuCount: Integer; stdcall;
  end;

  TFTrayIcon = class(TInterfacedObject, FTrayIcon)
  private
    FWnd: HWND;
    FID: UINT;
    FIcon: HICON;
    FHint: string;
    FAdded: Boolean;
    FVersion4: Boolean;
    FVisibleRequested: Boolean;
    FMenuActive: Boolean;
    FCallback: TTrayIconCallback;

    FMenuItems: array of TTrayMenuItemState;
    procedure ShowMenu;

    procedure Detach;
    procedure UpdateWindowMessage(const Msg: UINT; const WParam: WParam;
      const LParam: LParam; var Handled: Boolean);
    function HandleNotify(const WParam: WParam; const LParam: LParam): Boolean;
    function UpdateIcon: Boolean;
    procedure DoEvent(const Event, ItemIndex: Integer);

  public
    constructor Create;
    destructor Destroy; override;

    function FCreate(FHandle: HWND): Boolean; stdcall;
    function SetIcon(const FileName: WideString): Boolean; stdcall;
    procedure SetHint(const FHint: WideString); stdcall;
    function Show: Boolean; stdcall;
    procedure Hide; stdcall;
    procedure OnEvent(FCallback: TTrayIconCallback); stdcall;
    function AddMenuItem(const FText: WideString): Integer; stdcall;
    function AddMenuSeparator: Integer; stdcall;
    procedure SetMenuItemText(const Index: Integer;
      const FText: WideString); stdcall;
    procedure SetMenuItemEnabled(const Index: Integer;
      FEnabled: Boolean); stdcall;
    procedure SetMenuItemChecked(const Index: Integer;
      FChecked: Boolean); stdcall;
    procedure ClearMenu; stdcall;
    function MenuCount: Integer; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitTrayIcon: FTrayIcon; stdcall;

implementation

uses
  System.SysUtils,
  Winapi.Messages;

{$ALIGN 8}

type
  TNotifyIconDataW = record
    cbSize: DWORD;
    Wnd: HWND;
    uID: UINT;
    uFlags: UINT;
    uCallbackMessage: UINT;
    HICON: HICON;
    szTip: array [0 .. 127] of WideChar;
    dwState: DWORD;
    dwStateMask: DWORD;
    szInfo: array [0 .. 255] of WideChar;
    uTimeoutOrVersion: UINT;
    szInfoTitle: array [0 .. 63] of WideChar;
    dwInfoFlags: DWORD;
    guidItem: TGUID;
    hBalloonIcon: HICON;
  end;

  PNotifyIconDataW = ^TNotifyIconDataW;

type
  TSubclassProc = function(Wnd: HWND; Msg: UINT; WParam: WParam; LParam: LParam;
    uIdSubclass: UINT_PTR; dwRefData: DWORD_PTR): LRESULT; stdcall;

function SetWindowSubclass(Wnd: HWND; SubclassProc: TSubclassProc;
  uIdSubclass: UINT_PTR; dwRefData: DWORD_PTR): BOOL; stdcall;
  external 'comctl32.dll' name 'SetWindowSubclass';

function RemoveWindowSubclass(Wnd: HWND; SubclassProc: TSubclassProc;
  uIdSubclass: UINT_PTR): BOOL; stdcall;
  external 'comctl32.dll' name 'RemoveWindowSubclass';

function DefSubclassProc(Wnd: HWND; Msg: UINT; WParam: WParam; LParam: LParam)
  : LRESULT; stdcall; external 'comctl32.dll' name 'DefSubclassProc';

function ChangeWindowMessageFilterEx(Wnd: HWND; Msg: UINT; Action: DWORD;
  ChangeFilterStruct: Pointer): BOOL; stdcall;
  external 'user32.dll' name 'ChangeWindowMessageFilterEx';

function Shell_NotifyIconW(dwMessage: DWORD; lpData: PNotifyIconDataW): BOOL;
  stdcall; external 'shell32.dll' name 'Shell_NotifyIconW';

function CreatePopupMenuNative: HMENU; stdcall;
  external 'user32.dll' name 'CreatePopupMenu';

function AppendMenuWNative(HMENU: HMENU; uFlags: UINT; uIDNewItem: UINT_PTR;
  lpNewItem: PWideChar): BOOL; stdcall;
  external 'user32.dll' name 'AppendMenuW';

function DestroyMenuNative(HMENU: HMENU): BOOL; stdcall;
  external 'user32.dll' name 'DestroyMenu';

function TrackPopupMenuExNative(HMENU: HMENU; uFlags: UINT; X, Y: Integer;
  HWND: HWND; lptpm: Pointer): UINT; stdcall;
  external 'user32.dll' name 'TrackPopupMenuEx';

const
  NIM_ADD = $00000000;
  NIM_MODIFY = $00000001;
  NIM_DELETE = $00000002;
  NIM_SETVERSION = $00000004;
  NIM_SETFOCUS = $00000003;

  NIF_MESSAGE = $00000001;
  NIF_ICON = $00000002;
  NIF_TIP = $00000004;
  NIF_INFO = $00000010;
  NIF_SHOWTIP = $00000080;

  TRAY_MF_STRING = $00000000;
  TRAY_MF_GRAYED = $00000001;
  TRAY_MF_CHECKED = $00000008;
  TRAY_MF_SEPARATOR = $00000800;

  TRAY_TPM_RIGHTBUTTON = $0002;
  TRAY_TPM_NONOTIFY = $0080;
  TRAY_TPM_RETURNCMD = $0100;

  NOTIFYICON_VERSION_4 = 4;

  NIN_SELECT = WM_USER;
  NIN_KEYSELECT = WM_USER + 1;

  MSGFLT_ALLOW = 1;

var
  WM_TaskbarCreated: UINT = 0;
  WM_TrayIconCallback: UINT = 0;
  WM_TrayMenuItemSelected: UINT = 0;

  GNextTrayID: Integer = 0;

function NextTrayID: UINT;
var
  Value: Integer;
begin
  Value := InterlockedIncrement(GNextTrayID);

  if (Value <= 0) or (Value > High(Word)) then
  begin
    InterlockedExchange(GNextTrayID, 1);
    Value := 1;
  end;

  Result := Value;
end;

function TraySubclassProc(Wnd: HWND; Msg: UINT; WParam: WParam; LParam: LParam;
  uIdSubclass: UINT_PTR; dwRefData: DWORD_PTR): LRESULT; stdcall;
var
  Tray: TFTrayIcon;
  Handled: Boolean;
begin
  Tray := TFTrayIcon(dwRefData);
  Handled := False;

  try
    if Assigned(Tray) then
      Tray.UpdateWindowMessage(Msg, WParam, LParam, Handled);
  except
    Handled := False;
  end;

  if Handled then
    Exit(0);

  Result := DefSubclassProc(Wnd, Msg, WParam, LParam);
end;

// =============================================================================
// TFTrayIcon
// =============================================================================
constructor TFTrayIcon.Create;
begin
  inherited Create;

  FWnd := 0;
  FID := NextTrayID;
  FIcon := 0;
  FHint := '';
  FAdded := False;
  FVersion4 := False;
  FVisibleRequested := False;
  FMenuActive := False;
end;

destructor TFTrayIcon.Destroy;
begin
  Hide;
  Detach;

  if FIcon <> 0 then
  begin
    DestroyIcon(FIcon);
    FIcon := 0;
  end;

  inherited;
end;

function TFTrayIcon.FCreate(FHandle: HWND): Boolean;
begin
  Result := False;

  if (FWnd <> 0) or not IsWindow(FHandle) then
    Exit;

  if WM_TaskbarCreated = 0 then
    WM_TaskbarCreated := RegisterWindowMessage('TaskbarCreated');

  if WM_TrayIconCallback = 0 then
    WM_TrayIconCallback := RegisterWindowMessage('FMXBridge.TrayIcon.Callback');

  if WM_TrayMenuItemSelected = 0 then
    WM_TrayMenuItemSelected := RegisterWindowMessage
      ('FMXBridge.TrayIcon.MenuItemSelected');

  if (WM_TaskbarCreated = 0) or (WM_TrayIconCallback = 0) or
    (WM_TrayMenuItemSelected = 0) then
    Exit;

  FWnd := FHandle;

  if not SetWindowSubclass(FWnd, TraySubclassProc, UINT_PTR(Self),
    DWORD_PTR(Self)) then
  begin
    FWnd := 0;
    Exit;
  end;

  ChangeWindowMessageFilterEx(FWnd, WM_TaskbarCreated, MSGFLT_ALLOW, nil);
  ChangeWindowMessageFilterEx(FWnd, WM_TrayIconCallback, MSGFLT_ALLOW, nil);

  Result := True;
end;

procedure TFTrayIcon.Detach;
begin
  if FWnd <> 0 then
  begin
    Hide;
    RemoveWindowSubclass(FWnd, TraySubclassProc, UINT_PTR(Self));
    FWnd := 0;
  end;

  FAdded := False;
  FVersion4 := False;
end;

function TFTrayIcon.SetIcon(const FileName: WideString): Boolean;
var
  NewIcon: HICON;
  OldIcon: HICON;
begin
  Result := False;

  if not FileExists(string(FileName)) then
    Exit;

  NewIcon := HICON(LoadImage(0, PChar(string(FileName)), IMAGE_ICON,
    GetSystemMetrics(SM_CXSMICON), GetSystemMetrics(SM_CYSMICON),
    LR_LOADFROMFILE));

  if NewIcon = 0 then
    Exit;

  OldIcon := FIcon;
  FIcon := NewIcon;

  if FAdded and not UpdateIcon then
  begin
    FIcon := OldIcon;
    DestroyIcon(NewIcon);
    Exit;
  end;

  if OldIcon <> 0 then
    DestroyIcon(OldIcon);

  Result := True;
end;

function TFTrayIcon.UpdateIcon: Boolean;
var
  Data: TNotifyIconDataW;
begin
  Result := False;

  if not FAdded or (FWnd = 0) or not IsWindow(FWnd) or (FIcon = 0) then
    Exit;

  FillChar(Data, SizeOf(Data), 0);

  Data.cbSize := SizeOf(Data);
  Data.Wnd := FWnd;
  Data.uID := FID;
  Data.uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP or NIF_SHOWTIP;
  Data.uCallbackMessage := WM_TrayIconCallback;
  Data.HICON := FIcon;

  StrPLCopy(@Data.szTip[0], FHint, Length(Data.szTip) - 1);

  Result := Shell_NotifyIconW(NIM_MODIFY, @Data);
end;

procedure TFTrayIcon.SetHint(const FHint: WideString);
begin
  Self.FHint := string(FHint);

  if FAdded then
    UpdateIcon;
end;

function TFTrayIcon.Show: Boolean;
var
  Data: TNotifyIconDataW;
begin
  Result := False;

  if (FWnd = 0) or not IsWindow(FWnd) then
    Exit;

  if FIcon = 0 then
    Exit;

  FVisibleRequested := True;

  if FAdded then
    Exit(UpdateIcon);

  FillChar(Data, SizeOf(Data), 0);

  Data.cbSize := SizeOf(Data);
  Data.Wnd := FWnd;
  Data.uID := FID;
  Data.uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP or NIF_SHOWTIP;
  Data.uCallbackMessage := WM_TrayIconCallback;
  Data.HICON := FIcon;

  StrPLCopy(@Data.szTip[0], FHint, Length(Data.szTip) - 1);

  if not Shell_NotifyIconW(NIM_ADD, @Data) then
    Exit;

  FAdded := True;

  Data.uTimeoutOrVersion := NOTIFYICON_VERSION_4;

  FVersion4 := Shell_NotifyIconW(NIM_SETVERSION, @Data);

  Result := True;
end;

procedure TFTrayIcon.Hide;
var
  Data: TNotifyIconDataW;
begin
  FVisibleRequested := False;

  if not FAdded then
  begin
    FVersion4 := False;
    Exit;
  end;

  FillChar(Data, SizeOf(Data), 0);

  Data.cbSize := SizeOf(Data);
  Data.Wnd := FWnd;
  Data.uID := FID;

  Shell_NotifyIconW(NIM_DELETE, @Data);

  FAdded := False;
  FVersion4 := False;
end;

procedure TFTrayIcon.OnEvent(FCallback: TTrayIconCallback);
begin
  Self.FCallback := FCallback;
end;

function TFTrayIcon.AddMenuItem(const FText: WideString): Integer;
begin
  Result := Length(FMenuItems);

  SetLength(FMenuItems, Result + 1);

  FMenuItems[Result].Caption := string(FText);
  FMenuItems[Result].Enabled := True;
  FMenuItems[Result].Checked := False;
  FMenuItems[Result].Separator := False;
end;

function TFTrayIcon.AddMenuSeparator: Integer;
begin
  Result := Length(FMenuItems);

  SetLength(FMenuItems, Result + 1);

  FMenuItems[Result].Caption := '';
  FMenuItems[Result].Enabled := False;
  FMenuItems[Result].Checked := False;
  FMenuItems[Result].Separator := True;
end;

procedure TFTrayIcon.SetMenuItemText(const Index: Integer;
  const FText: WideString);
begin
  if (Index < 0) or (Index >= Length(FMenuItems)) then
    Exit;

  if FMenuItems[Index].Separator then
    Exit;

  FMenuItems[Index].Caption := string(FText);
end;

procedure TFTrayIcon.SetMenuItemEnabled(const Index: Integer;
  FEnabled: Boolean);
begin
  if (Index < 0) or (Index >= Length(FMenuItems)) then
    Exit;

  if FMenuItems[Index].Separator then
    Exit;

  FMenuItems[Index].Enabled := FEnabled;
end;

procedure TFTrayIcon.SetMenuItemChecked(const Index: Integer;
  FChecked: Boolean);
begin
  if (Index < 0) or (Index >= Length(FMenuItems)) then
    Exit;

  if FMenuItems[Index].Separator then
    Exit;

  FMenuItems[Index].Checked := FChecked;
end;

procedure TFTrayIcon.ClearMenu;
begin
  SetLength(FMenuItems, 0);
end;

function TFTrayIcon.MenuCount: Integer;
begin
  Result := Length(FMenuItems);
end;

procedure TFTrayIcon.ShowMenu;
var
  Menu: HMENU;
  MenuOwner: HWND;
  Point: TPoint;
  I: Integer;
  Flags: UINT;
  SelectedCommand: UINT;
  SelectedIndex: Integer;
begin
  if FMenuActive then
    Exit;

  if (Length(FMenuItems) = 0) or (FWnd = 0) or not IsWindow(FWnd) then
    Exit;

  Menu := CreatePopupMenuNative;

  if Menu = 0 then
    Exit;

  FMenuActive := True;
  SelectedIndex := -1;

  try
    for I := 0 to High(FMenuItems) do
    begin
      if FMenuItems[I].Separator then
      begin
        AppendMenuWNative(Menu, TRAY_MF_SEPARATOR, 0, nil);
      end
      else
      begin
        Flags := TRAY_MF_STRING;

        if not FMenuItems[I].Enabled then
          Flags := Flags or TRAY_MF_GRAYED;

        if FMenuItems[I].Checked then
          Flags := Flags or TRAY_MF_CHECKED;

        AppendMenuWNative(Menu, Flags, UINT_PTR(I + 1),
          PWideChar(FMenuItems[I].Caption));
      end;
    end;

    if not GetCursorPos(Point) then
      Exit;

    MenuOwner := GetAncestor(FWnd, GA_ROOT);

    if MenuOwner = 0 then
      MenuOwner := FWnd;

    SetForegroundWindow(MenuOwner);

    SelectedCommand := TrackPopupMenuExNative(Menu, TRAY_TPM_RIGHTBUTTON or
      TRAY_TPM_RETURNCMD or TRAY_TPM_NONOTIFY, Point.X, Point.Y,
      MenuOwner, nil);

    PostMessage(FWnd, WM_NULL, 0, 0);

    if SelectedCommand > 0 then
    begin
      SelectedIndex := Integer(SelectedCommand) - 1;

      if (SelectedIndex < 0) or (SelectedIndex > High(FMenuItems)) or
        FMenuItems[SelectedIndex].Separator or not FMenuItems[SelectedIndex].Enabled
      then
        SelectedIndex := -1;
    end;

  finally
    FMenuActive := False;
    DestroyMenuNative(Menu);
  end;

  if (SelectedIndex >= 0) and (FWnd <> 0) and IsWindow(FWnd) then
    PostMessage(FWnd, WM_TrayMenuItemSelected, FID, LParam(SelectedIndex));
end;

procedure TFTrayIcon.DoEvent(const Event, ItemIndex: Integer);
begin
  if Assigned(FCallback) then
    try
      FCallback(Event, ItemIndex);
    except
      // TO DO
    end;
end;

function TFTrayIcon.HandleNotify(const WParam: WParam;
  const LParam: LParam): Boolean;
var
  EventCode: Cardinal;
  IconID: Cardinal;
begin
  Result := False;

  if FVersion4 then
  begin
    EventCode := Cardinal(LParam) and $FFFF;
    IconID := (Cardinal(LParam) shr 16) and $FFFF;
  end
  else
  begin
    IconID := Cardinal(WParam);
    EventCode := Cardinal(LParam);
  end;

  if IconID <> FID then
    Exit;

  Result := True;

  case EventCode of

    NIN_SELECT, NIN_KEYSELECT:
      DoEvent(TrayEventClick, -1);

    WM_LBUTTONUP:
      if not FVersion4 then
        DoEvent(TrayEventClick, -1);

    WM_LBUTTONDBLCLK:
      DoEvent(TrayEventDoubleClick, -1);

    WM_CONTEXTMENU:
      begin
        DoEvent(TrayEventRightClick, -1);
        ShowMenu;
      end;

    WM_RBUTTONUP:
      if not FVersion4 then
      begin
        DoEvent(TrayEventRightClick, -1);
        ShowMenu;
      end;

  end;
end;

procedure TFTrayIcon.UpdateWindowMessage(const Msg: UINT; const WParam: WParam;
  const LParam: LParam; var Handled: Boolean);
begin
  Handled := False;

  if (WM_TrayMenuItemSelected <> 0) and (Msg = WM_TrayMenuItemSelected) and
    (UINT(WParam) = FID) then
  begin
    Handled := True;

    DoEvent(TrayEventMenuItemClick, Integer(LParam));

    Exit;
  end;

  if (WM_TaskbarCreated <> 0) and (Msg = WM_TaskbarCreated) then
  begin
    if FVisibleRequested then
    begin
      FAdded := False;
      FVersion4 := False;
      Show;
    end;

    Exit;
  end;

  if (WM_TrayIconCallback <> 0) and (Msg = WM_TrayIconCallback) then
  begin
    Handled := HandleNotify(WParam, LParam);
    Exit;
  end;

  if Msg = WM_NCDESTROY then
    Detach;
end;

// =============================================================================
// Exports
// =============================================================================
function InitTrayIcon: FTrayIcon;
begin
  Result := TFTrayIcon.Create;
end;

exports
  InitTrayIcon;

end.
