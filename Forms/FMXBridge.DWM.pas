
unit FMXBridge.DWM;

interface

uses
  System.UITypes,
  Winapi.Windows;

function ExtendFrameIntoClientArea(FormHWND: HWND): Boolean;

type
  TBackdropType = (btAuto, btNone, btMain, btTabbed, btAcrylic);

function SetBackdropType(FormHWND: HWND; BackdropType: TBackdropType): Boolean;

function SetDarkMode(FormHWND: HWND; Enable: Boolean): Boolean;

function SetRoundedCorners(FormHWND: HWND; Enable: Boolean): Boolean;

procedure ApplyNoTopStripe(FormHWND: HWND);

function SetBlur(FormHWND: HWND): Boolean;

function SetBorderColor(FormHWND: HWND; const Value: TAlphaColor): Boolean;

procedure DisableAeroPeek(MsgHWND: HWND);

implementation

uses
  Winapi.UxTheme, Winapi.Dwmapi;

// =============================================================================
// ExtendFrameIntoClientArea
// =============================================================================
function ExtendFrameIntoClientArea(FormHWND: HWND): Boolean;
var
  Margins: TMARGINS;
begin
  Margins.cxLeftWidth := -1;
  Margins.cxRightWidth := -1;
  Margins.cyTopHeight := -1;
  Margins.cyBottomHeight := -1;

  Result := Succeeded(DwmExtendFrameIntoClientArea(FormHWND, Margins));
end;

// =============================================================================
// SetBackdropType
// =============================================================================
const
  DWMSBT_AUTO = 0;
  DWMSBT_DISABLE = 1;
  DWMSBT_MAINWINDOW = 2;
  DWMSBT_TRANSIENTWINDOW = 3;
  DWMSBT_TABBEDWINDOW = 4;

function SetBackdropType(FormHWND: HWND; BackdropType: TBackdropType): Boolean;
var
  Backdrop: Integer;
begin
  case BackdropType of
    TBackdropType.btAuto:
      Backdrop := DWMSBT_AUTO;

    TBackdropType.btNone:
      Backdrop := DWMSBT_DISABLE;

    TBackdropType.btMain:
      Backdrop := DWMSBT_MAINWINDOW;

    TBackdropType.btTabbed:
      Backdrop := DWMSBT_TABBEDWINDOW;

    TBackdropType.btAcrylic:
      Backdrop := DWMSBT_TRANSIENTWINDOW;
  end;

  Result := Succeeded(DwmSetWindowAttribute(FormHWND, DWMWA_SYSTEMBACKDROP_TYPE,
    @Backdrop, SizeOf(Backdrop)));
end;

// =============================================================================
// SetDarkMode
// =============================================================================
function SetDarkMode(FormHWND: HWND; Enable: Boolean): Boolean;
var
  Value: Integer;
begin
  Value := Ord(Enable);

  Result := Succeeded(DwmSetWindowAttribute(FormHWND,
    DWMWA_USE_IMMERSIVE_DARK_MODE, @Value, SizeOf(Value)));
end;

// =============================================================================
// SetRoundedCorners
// =============================================================================
function SetRoundedCorners(FormHWND: HWND; Enable: Boolean): Boolean;
var
  Value: Integer;
begin
  if Enable then
    Value := DWMWCP_ROUND
  else
    Value := DWMWCP_DONOTROUND;

  Result := Succeeded(DwmSetWindowAttribute(FormHWND,
    DWMWA_WINDOW_CORNER_PREFERENCE, @Value, SizeOf(Value)));
end;

// =============================================================================
// ApplyNoTopStripe
// =============================================================================
const
  DWMWA_CAPTION_COLOR = 35;
  DWMWA_COLOR_NONE = $FFFFFFFE;

procedure ApplyNoTopStripe(FormHWND: HWND);
var
  clr: Cardinal;
begin
  if FormHWND = 0 then
    Exit;

  clr := DWMWA_COLOR_NONE;
  DwmSetWindowAttribute(FormHWND, DWMWA_CAPTION_COLOR, @clr, SizeOf(clr));
end;

// =============================================================================
// SetBlur
// =============================================================================
type
  TWinCompAttrData = record
    Attribute: DWORD;
    Data: Pointer;
    DataSize: ULONG;
  end;

  TSetWindowCompositionAttribute = function(Wnd: HWND;
    const AttrData: TWinCompAttrData): BOOL; stdcall;

const
  WCA_ACCENT_POLICY = 19;
  ACCENT_ENABLE_BLURBEHIND = 3;

  DrawLeftBorder = $20;
  DrawTopBorder = $40;
  DrawRightBorder = $80;
  DrawBottomBorder = $100;

var
  _SetWindowCompositionAttribute: TSetWindowCompositionAttribute = nil;

function InitSetWindowCompositionAttribute: Boolean;
begin
  if not Assigned(_SetWindowCompositionAttribute) then
    _SetWindowCompositionAttribute := TSetWindowCompositionAttribute
      (GetProcAddress(GetModuleHandle(user32),
      'SetWindowCompositionAttribute'));

  Result := Assigned(_SetWindowCompositionAttribute);
end;

type
  TAccentPolicy = record
    AccentState: DWORD;
    AccentFlags: DWORD;
    GradientColor: DWORD;
    AnimationId: DWORD;
  end;

function SetBlur(FormHWND: HWND): Boolean;
var
  Accent: TAccentPolicy;
  Attr: TWinCompAttrData;
begin
  Result := False;

  if not InitSetWindowCompositionAttribute then
    Exit;

  ZeroMemory(@Accent, SizeOf(Accent));

  Accent.AccentState := ACCENT_ENABLE_BLURBEHIND;
  Accent.AccentFlags := DrawLeftBorder or DrawTopBorder or
    DrawRightBorder or DrawBottomBorder;
  Accent.GradientColor := 0;

  Attr.Attribute := WCA_ACCENT_POLICY;
  Attr.Data := @Accent;
  Attr.DataSize := SizeOf(Accent);

  Result := Boolean(_SetWindowCompositionAttribute(FormHWND, Attr));
end;

// =============================================================================
// SetBorderColor
// =============================================================================
function SetBorderColor(FormHWND: HWND; const Value: TAlphaColor): Boolean;
var
  ColorRef: UInt32;
begin
  ColorRef := (TAlphaColorRec(Value).B shl 16) or
    (TAlphaColorRec(Value).G shl 8) or (TAlphaColorRec(Value).R);

  Result := Succeeded(DwmSetWindowAttribute(FormHWND, DWMWA_BORDER_COLOR,
    @ColorRef, SizeOf(ColorRef)));
end;

// =============================================================================
// DisableFormAeroPeek
// =============================================================================
procedure DisableAeroPeek(MsgHWND: HWND);
var
  DisablePeek: BOOL;
begin
  if MsgHWND = 0 then
    Exit;

  DisablePeek := True;

  DwmSetWindowAttribute(MsgHWND, DWMWA_EXCLUDED_FROM_PEEK,
    @DisablePeek, SizeOf(DisablePeek));

  DwmSetWindowAttribute(MsgHWND, DWMWA_DISALLOW_PEEK,
    @DisablePeek, SizeOf(DisablePeek));
end;

end.
