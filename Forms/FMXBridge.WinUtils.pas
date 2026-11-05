
unit FMXBridge.WinUtils;

interface

uses
  Winapi.Windows;

procedure HideInnoSetup(HostHWND: HWND);

function WindowCaption(HostHWND: HWND): string;

procedure CopyWindowIcon(HostHWND, FormHWND: HWND);

procedure ConfigureMsgForm(MsgHWND, FormHWND: HWND);

procedure ConfigureSplashForm(SplashHWND: HWND);

implementation

uses
  Winapi.Messages,
  FMX.Platform.Win;

// =============================================================================
// HideInnoSetup
// =============================================================================
procedure HideInnoSetup(HostHWND: HWND);
var
  ExStyle: LONG_PTR;
begin
  ExStyle := GetWindowLongPtr(HostHWND, GWL_EXSTYLE);
  ExStyle := (ExStyle or WS_EX_LAYERED or WS_EX_TRANSPARENT
    or WS_EX_TOOLWINDOW) and not WS_EX_APPWINDOW;

  SetWindowLongPtr(HostHWND, GWL_EXSTYLE, ExStyle);

  SetWindowPos(HostHWND, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOMOVE or
    SWP_NOSIZE or SWP_HIDEWINDOW or SWP_NOACTIVATE);

  SendMessage(HostHWND, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

// =============================================================================
// WindowCaption
// =============================================================================
function WindowCaption(HostHWND: HWND): string;
var
  Len: Integer;
begin
  Result := '';

  if HostHWND = 0 then
    Exit;

  Len := GetWindowTextLength(HostHWND);

  if Len = 0 then
    Exit;

  SetLength(Result, Len);
  GetWindowText(HostHWND, PChar(Result), Len + 1);
end;

// =============================================================================
// CopyWindowIcon
// =============================================================================
const
  GCLP_HICON = -14;

procedure CopyWindowIcon(HostHWND, FormHWND: HWND);
var
  BigIcon: HICON;
  SmallIcon: HICON;
begin
  if (HostHWND = 0) or (FormHWND = 0) then
    Exit;

  BigIcon := SendMessage(HostHWND, WM_GETICON, ICON_BIG, 0);

  if BigIcon = 0 then
    BigIcon := GetClassLongPtr(HostHWND, GCLP_HICON);

  SmallIcon := SendMessage(HostHWND, WM_GETICON, ICON_SMALL2, 0);

  if SmallIcon = 0 then
    SmallIcon := SendMessage(HostHWND, WM_GETICON, ICON_SMALL, 0);

  if SmallIcon = 0 then
    SmallIcon := GetClassLongPtr(HostHWND, GCLP_HICON);

  if (SmallIcon = 0) and (BigIcon <> 0) then
    SmallIcon := BigIcon;

  if BigIcon <> 0 then
    SendMessage(FormHWND, WM_SETICON, ICON_BIG, LPARAM(CopyIcon(BigIcon)));

  if SmallIcon <> 0 then
    SendMessage(FormHWND, WM_SETICON, ICON_SMALL, LPARAM(CopyIcon(SmallIcon)));
end;

// =============================================================================
// ConfigureMsgForm
// =============================================================================
procedure ConfigureMsgForm(MsgHWND, FormHWND: HWND);
var
  ExStyle: LONG_PTR;
begin
  if (MsgHWND = 0) or (FormHWND = 0) then
    Exit;

  ExStyle := GetWindowLongPtr(MsgHWND, GWL_EXSTYLE);
  ExStyle := ExStyle and not WS_EX_APPWINDOW;

  SetWindowLongPtr(MsgHWND, GWL_EXSTYLE, ExStyle);
  SetWindowLongPtr(MsgHWND, GWLP_HWNDPARENT, FormHWND);
end;

// =============================================================================
// ConfigureSplashForm
// =============================================================================
procedure ConfigureSplashForm(SplashHWND: HWND);
var
  ExStyle: LONG_PTR;
begin
  if SplashHWND = 0 then
    Exit;

  ExStyle := GetWindowLongPtr(SplashHWND, GWL_EXSTYLE);
  ExStyle := (ExStyle and not WS_EX_APPWINDOW) or WS_EX_TOOLWINDOW;

  SetWindowLongPtr(SplashHWND, GWL_EXSTYLE, ExStyle);
end;

end.
