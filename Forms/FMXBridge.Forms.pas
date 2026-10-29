
unit FMXBridge.Forms;

interface

uses
  Winapi.Windows,
  System.Classes, System.UITypes,
  FMX.Forms, FMX.Types,
{$IFDEF SKIA}
  FMX.Skia, System.Skia,
{$ENDIF}
  FMX.Graphics, FMXBridge.DWM;

// =============================================================================
// FForm interface
// =============================================================================
type
  FForm = interface(IUnknown)
    ['{C4797C10-4C8F-4102-9EFC-5EDC659D97EE}']
    procedure FCreateBackdropForm(FHost: HWND; FBackType: TBackdropType;
      FDark, FRound: Boolean); stdcall;
    procedure FCreateBlurForm(FHost: HWND; FColor: TAlphaColor;
      FRound: Boolean); stdcall;
    procedure FCreateBlankForm(FHost: HWND; FColor: TAlphaColor;
      const FImage: WideString; FRound: Boolean); stdcall;
    procedure FCreateImageForm(FHost: HWND; FColor: TAlphaColor;
      const FImage: WideString; FOpacity: Boolean); stdcall;
    procedure ChangeFormImage(const FImage: WideString); stdcall;
    procedure ChangeFormColor(FColor: TAlphaColor); stdcall;
    procedure ChangeDarkMode(const FDark: Boolean); stdcall;
    procedure ChangeBorderColor(FColor: TAlphaColor); stdcall;
    procedure GradientFormColors(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure GradientFormLinearAngle(FAngle: Single); stdcall;
    procedure GradientFormRadialAngle(FAngle: Single); stdcall;
    procedure GradientFormPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure LoadStyleFromFile(const StyleFile: WideString;
      AccentColor: TAlphaColor); stdcall;
    procedure SetCursor(const CursorFile: WideString); stdcall;
    procedure Caption(const FText: WideString); stdcall;
    procedure CanvasQuality(FQuality: TCanvasQuality); stdcall;
    procedure StayOnTop(FValue: Boolean); stdcall;
    procedure SetCaptured(FControl: TFmxObject); stdcall;
    procedure AddMouseDownControls(FControl: TFmxObject); stdcall;
    procedure SetContextMenuLanguage(const FLang: WideString); stdcall;
    procedure StartWindowDrag; stdcall;
    procedure UpdateStyleBook; stdcall;
    procedure Show; stdcall;
    procedure Minimize; stdcall;
    function GetHeight: Integer; stdcall;
    function GetWidth: Integer; stdcall;
    procedure OnShow(Event: TNotifyEvent); stdcall;
    procedure OnActivate(Event: TNotifyEvent); stdcall;
    procedure OnDeactivate(Event: TNotifyEvent); stdcall;
    procedure OnKeyDown(Event: TKeyEvent); stdcall;
    procedure OnKeyUp(Event: TKeyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    procedure OnMouseWheel(Event: TMouseWheelEvent); stdcall;
    function Handle: TFmxObject; stdcall;
    function HandleHWND: HWND; stdcall;
  end;

type
  TFForm = class(TInterfacedObject, FForm)
  private
    FHostHWND: HWND;
    FMainForm: TForm;
    FMainFormHWND: HWND;

    procedure CreateMainForm(AHost: HWND; ABorderStyle: TFmxFormBorderStyle;
      ATransparency: Boolean);
    function FormReady: Boolean;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDragMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  public
    procedure FCreateBackdropForm(FHost: HWND; FBackType: TBackdropType;
      FDark, FRound: Boolean); stdcall;
    procedure FCreateBlurForm(FHost: HWND; FColor: TAlphaColor;
      FRound: Boolean); stdcall;
    procedure FCreateBlankForm(FHost: HWND; FColor: TAlphaColor;
      const FImage: WideString; FRound: Boolean); stdcall;
    procedure FCreateImageForm(FHost: HWND; FColor: TAlphaColor;
      const FImage: WideString; FOpacity: Boolean); stdcall;
    procedure ChangeFormImage(const FImage: WideString); stdcall;
    procedure ChangeFormColor(FColor: TAlphaColor); stdcall;
    procedure ChangeDarkMode(const FDark: Boolean); stdcall;
    procedure ChangeBorderColor(FColor: TAlphaColor); stdcall;
    procedure GradientFormColors(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure GradientFormLinearAngle(FAngle: Single); stdcall;
    procedure GradientFormRadialAngle(FAngle: Single); stdcall;
    procedure GradientFormPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure LoadStyleFromFile(const StyleFile: WideString;
      AccentColor: TAlphaColor); stdcall;
    procedure SetCursor(const CursorFile: WideString); stdcall;
    procedure Caption(const FText: WideString); stdcall;
    procedure CanvasQuality(FQuality: TCanvasQuality); stdcall;
    procedure StayOnTop(FValue: Boolean); stdcall;
    procedure SetCaptured(FControl: TFmxObject); stdcall;
    procedure AddMouseDownControls(FControl: TFmxObject); stdcall;
    procedure SetContextMenuLanguage(const FLang: WideString); stdcall;
    procedure StartWindowDrag; stdcall;
    procedure UpdateStyleBook; stdcall;
    procedure Show; stdcall;
    procedure Minimize; stdcall;
    function GetHeight: Integer; stdcall;
    function GetWidth: Integer; stdcall;
    procedure OnShow(Event: TNotifyEvent); stdcall;
    procedure OnActivate(Event: TNotifyEvent); stdcall;
    procedure OnDeactivate(Event: TNotifyEvent); stdcall;
    procedure OnKeyDown(Event: TKeyEvent); stdcall;
    procedure OnKeyUp(Event: TKeyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    procedure OnMouseWheel(Event: TMouseWheelEvent); stdcall;
    function Handle: TFmxObject; stdcall;
    function HandleHWND: HWND; stdcall;
  end;

// =============================================================================
// FMsgForm
// =============================================================================
type
  FMsgForm = interface(IUnknown)
    ['{F314BB73-FE86-42BA-A281-0D254C766425}']
    procedure FCreateBackdropForm(FOwner: HWND; FBackType: TBackdropType;
      FDark, FRound: Boolean); stdcall;
    procedure FCreateBlurForm(FOwner: HWND; FColor: TAlphaColor;
      FRound: Boolean); stdcall;
    procedure FCreateBlankForm(FOwner: HWND; FColor: TAlphaColor;
      const FImage: WideString; FRound: Boolean); stdcall;
    procedure FCreateImageForm(FOwner: HWND; FColor: TAlphaColor;
      const FImage: WideString; FOpacity: Boolean); stdcall;
    procedure Height(FHeight: Integer); stdcall;
    procedure Width(FWidth: Integer); stdcall;
    procedure ChangeFormImage(const FImage: WideString); stdcall;
    procedure ChangeFormColor(FColor: TAlphaColor); stdcall;
    procedure ChangeDarkMode(const FDark: Boolean); stdcall;
    procedure ChangeBorderColor(FColor: TAlphaColor); stdcall;
    procedure GradientFormColors(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure GradientFormLinearAngle(FAngle: Single); stdcall;
    procedure GradientFormRadialAngle(FAngle: Single); stdcall;
    procedure GradientFormPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure Caption(const FText: WideString); stdcall;
    procedure AddMouseDownControls(FControl: TFmxObject); stdcall;
    procedure StartWindowDrag; stdcall;
    procedure Show; stdcall;
    procedure Close; stdcall;
    function GetHeight: Integer; stdcall;
    function GetWidth: Integer; stdcall;
    function Handle: TFmxObject; stdcall;
    function HandleHWND: HWND; stdcall;
  end;

  TFMsgForm = class(TInterfacedObject, FMsgForm)
  private
    FOwnerHWND: HWND;
    FormMsg: TForm;
    FormMsgHWND: HWND;

    procedure CreateMainForm(AOwner: HWND; ABorderStyle: TFmxFormBorderStyle;
      ATransparency: Boolean);
    function FormReady: Boolean;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDragMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  public
    procedure FCreateBackdropForm(FOwner: HWND; FBackType: TBackdropType;
      FDark, FRound: Boolean); stdcall;
    procedure FCreateBlurForm(FOwner: HWND; FColor: TAlphaColor;
      FRound: Boolean); stdcall;
    procedure FCreateBlankForm(FOwner: HWND; FColor: TAlphaColor;
      const FImage: WideString; FRound: Boolean); stdcall;
    procedure FCreateImageForm(FOwner: HWND; FColor: TAlphaColor;
      const FImage: WideString; FOpacity: Boolean); stdcall;
    procedure Height(FHeight: Integer); stdcall;
    procedure Width(FWidth: Integer); stdcall;
    procedure ChangeFormImage(const FImage: WideString); stdcall;
    procedure ChangeFormColor(FColor: TAlphaColor); stdcall;
    procedure ChangeDarkMode(const FDark: Boolean); stdcall;
    procedure ChangeBorderColor(FColor: TAlphaColor); stdcall;
    procedure GradientFormColors(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure GradientFormLinearAngle(FAngle: Single); stdcall;
    procedure GradientFormRadialAngle(FAngle: Single); stdcall;
    procedure GradientFormPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure Caption(const FText: WideString); stdcall;
    procedure AddMouseDownControls(FControl: TFmxObject); stdcall;
    procedure StartWindowDrag; stdcall;
    procedure Show; stdcall;
    procedure Close; stdcall;
    function GetHeight: Integer; stdcall;
    function GetWidth: Integer; stdcall;
    function Handle: TFmxObject; stdcall;
    function HandleHWND: HWND; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitFormHandle: FForm; stdcall;
function InitMsgFormHandle: FMsgForm; stdcall;

implementation

uses
  System.SysUtils, System.Generics.Collections, System.TypInfo, System.Types,
  FMX.Controls, FMX.Platform.Win, FMX.Platform,
  FMXBridge.WinUtils, FMXBridge.BrushHelpers,
  FMXBridge.Cursor, FMXBridge.Localize;

var
  FMXInitialized: Boolean = False;
  SharedStyleBook: TStyleBook;

type
  TFormAccess = class(TCommonCustomForm);
  TControlAccess = class(TControl);

// =============================================================================
// FMainForm Initialized
// =============================================================================
function ApplicationStateRunning: TApplicationState;
begin
  Result := TApplicationState.Running;
end;

procedure EnsureFMXInitialized;
begin
  if not FMXInitialized then
  begin
{$IFDEF SKIA}
    GlobalUseSkia := True;
    GlobalUseSkiaRasterWhenAvailable := False;
    GlobalUseVulkan := True;
{$ENDIF}
    Application.Initialize;
    Application.ApplicationStateQuery := ApplicationStateRunning;

    RegisterCustomCursorService;

    FMXInitialized := True;
  end;
end;

// =============================================================================
// FMainForm Create
// =============================================================================
procedure TFForm.CreateMainForm(AHost: HWND;
  ABorderStyle: TFmxFormBorderStyle; ATransparency: Boolean);
var
  HostRect: TRect;
begin
  if Assigned(FMainForm) then
    Exit;

  FHostHWND := AHost;

  GetWindowRect(FHostHWND, HostRect);
  HideInnoSetup(FHostHWND);

  EnsureFMXInitialized;

  FMainForm := TForm.CreateNew(Application);
  Application.MainForm := FMainForm;

  FMainForm.ClientHeight := HostRect.Height;
  FMainForm.ClientWidth := HostRect.Width;
  FMainForm.Position := TFormPosition.ScreenCenter;

  FMainForm.BorderStyle := ABorderStyle;
  FMainForm.Border.Styling := False;

  if ABorderStyle <> TFmxFormBorderStyle.None then
    FMainForm.BorderIcons := [TBorderIcon.biMinimize]
  else
    FMainForm.BorderIcons := [];

  FMainForm.Transparency := ATransparency;
  FMainForm.Caption := WindowCaption(FHostHWND);
  FMainForm.OnMouseDown := FormDragMouseDown;
  FMainForm.OnClose := FormClose;

  if Assigned(SharedStyleBook) then
    FMainForm.StyleBook := SharedStyleBook;

  FMainForm.HandleNeeded;
  FMainFormHWND := WindowHandleToPlatform(FMainForm.Handle).Wnd;

  CopyWindowIcon(FHostHWND, FMainFormHWND);
end;

function TFForm.FormReady: Boolean;
begin
  Result := Assigned(FMainForm) and (FMainFormHWND <> 0);
end;

// =============================================================================
// FMainForm Backdrop
// =============================================================================
procedure TFForm.FCreateBackdropForm(FHost: HWND; FBackType: TBackdropType;
  FDark, FRound: Boolean);
begin
  CreateMainForm(FHost, TFmxFormBorderStyle.Single, False);

  FMainForm.Fill.Kind := TBrushKind.Solid;
  FMainForm.Fill.Color := TAlphaColors.Null;

  ExtendFrameIntoClientArea(FMainFormHWND);
  SetBackdropType(FMainFormHWND, FBackType);
  SetDarkMode(FMainFormHWND, FDark);
  SetRoundedCorners(FMainFormHWND, FRound);
  ApplyNoTopStripe(FMainFormHWND);
end;

// =============================================================================
// FMainForm Blur
// =============================================================================
procedure TFForm.FCreateBlurForm(FHost: HWND; FColor: TAlphaColor;
  FRound: Boolean);
begin
  CreateMainForm(FHost, TFmxFormBorderStyle.Single, False);

  FMainForm.Fill.Kind := TBrushKind.Solid;

  if FColor <> 0 then
    FMainForm.Fill.Color := TAlphaColor(FColor)
  else
    FMainForm.Fill.Color := TAlphaColors.Null;

  if TOSVersion.Build < 22000 then
    ExtendFrameIntoClientArea(FMainFormHWND)
  else
    SetRoundedCorners(FMainFormHWND, FRound);

  SetBlur(FMainFormHWND);
end;

// =============================================================================
// FMainForm Blank
// =============================================================================
procedure TFForm.FCreateBlankForm(FHost: HWND; FColor: TAlphaColor;
  const FImage: WideString; FRound: Boolean);
begin
  CreateMainForm(FHost, TFmxFormBorderStyle.Single, False);

  FMainForm.Fill.Kind := TBrushKind.None;

  if FImage <> '' then
  begin
    FMainForm.Fill.Kind := TBrushKind.Bitmap;
    FMainForm.Fill.Bitmap.Bitmap.LoadFromFile(string(FImage));
    FMainForm.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  end
  else if FColor <> 0 then
  begin
    FMainForm.Fill.Kind := TBrushKind.Solid;
    FMainForm.Fill.Color := TAlphaColor(FColor);
  end;

  if TOSVersion.Build < 22000 then
    ExtendFrameIntoClientArea(FMainFormHWND)
  else
    SetRoundedCorners(FMainFormHWND, FRound);
end;

// =============================================================================
// FMainForm Image
// =============================================================================
procedure TFForm.FCreateImageForm(FHost: HWND; FColor: TAlphaColor;
  const FImage: WideString; FOpacity: Boolean);
begin
  CreateMainForm(FHost, TFmxFormBorderStyle.None, FOpacity);

  if FColor <> 0 then
  begin
    FMainForm.Fill.Kind := TBrushKind.Solid;
    FMainForm.Fill.Color := TAlphaColor(FColor);
  end
  else if FImage <> '' then
  begin
    FMainForm.Fill.Kind := TBrushKind.Bitmap;
    FMainForm.Fill.Bitmap.Bitmap.LoadFromFile(string(FImage));
    FMainForm.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  end;
end;

procedure TFForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FHostHWND <> 0 then
    PostMessage(FHostHWND, $0010, 0, 0);

  Action := TCloseAction.caNone;
end;

procedure TFForm.FormDragMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if not FormReady then
    Exit;

  if Button = TMouseButton.mbLeft then
  begin
    ReleaseCapture;

    PostMessage(FMainFormHWND, $0112, $F012, 0);
    // SendMessage(FMainFormHWND, WM_NCLBUTTONDOWN, HTCAPTION, 0);
  end;
end;

procedure TFForm.ChangeFormImage(const FImage: WideString);
begin
  if not FormReady then
    Exit;

  FMainForm.Fill.Kind := TBrushKind.Bitmap;
  FMainForm.Fill.Bitmap.Bitmap.LoadFromFile(string(FImage));
  FMainForm.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
end;

procedure TFForm.ChangeFormColor(FColor: TAlphaColor);
begin
  if not FormReady then
    Exit;

  FMainForm.Fill.Kind := TBrushKind.Solid;
  FMainForm.Fill.Color := TAlphaColor(FColor);
end;

procedure TFForm.ChangeDarkMode(const FDark: Boolean);
begin
  if not FormReady then
    Exit;

  SetDarkMode(FMainFormHWND, FDark);
end;

procedure TFForm.ChangeBorderColor(FColor: TAlphaColor);
begin
  if not FormReady then
    Exit;

  SetBorderColor(FMainFormHWND, TAlphaColor(FColor));
end;

procedure TFForm.GradientFormColors(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  if not FormReady then
    Exit;

  FMainForm.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(FMainForm.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFForm.GradientFormLinearAngle(FAngle: Single);
begin
  if not FormReady then
    Exit;

  FMainForm.Fill.Kind := TBrushKind.Gradient;
  FMainForm.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(FMainForm.Fill, FAngle);
end;

procedure TFForm.GradientFormRadialAngle(FAngle: Single);
begin
  if not FormReady then
    Exit;

  FMainForm.Fill.Kind := TBrushKind.Gradient;
  FMainForm.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(FMainForm.Fill, FAngle);
end;

procedure TFForm.GradientFormPosition(X1, Y1, X2, Y2: Single);
begin
  if not FormReady then
    Exit;

  FMainForm.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(FMainForm.Fill, X1, Y1, X2, Y2);
end;

procedure TFForm.LoadStyleFromFile(const StyleFile: WideString;
  AccentColor: TAlphaColor);
begin
  if not FormReady then
    Exit;

  if not FileExists(string(StyleFile)) then
    Exit;

  FreeAndNil(SharedStyleBook);
  SharedStyleBook := TStyleBook.Create(nil);

  SharedStyleBook.LoadFromFile(string(StyleFile));

  if AccentColor <> 0 then
    SetAccentColorStyle(SharedStyleBook, TAlphaColor(AccentColor));

  FMainForm.StyleBook := SharedStyleBook;
end;

procedure TFForm.SetCursor(const CursorFile: WideString);
var
  Service: ICustomCursorService;
  CursorService: IFMXCursorService;
begin
  if not FormReady then
    Exit;

  if not TPlatformServices.Current.SupportsPlatformService(IFMXCursorService,
    CursorService) then
    Exit;

  if not Supports(CursorService, ICustomCursorService, Service) then
    Exit;

  Service.SetCustomCursor(string(CursorFile));
end;

procedure TFForm.Caption(const FText: WideString);
begin
  if not FormReady then
    Exit;

  FMainForm.Caption := string(FText);
end;

procedure TFForm.CanvasQuality(FQuality: TCanvasQuality);
var
  PropertyStore: TDictionary<string, Variant>;
begin
  PropertyStore := TDictionary<string, Variant>.Create;
  try
    PropertyStore.Add('Quality', GetEnumName(TypeInfo(TCanvasQuality),
      Ord(FQuality)));

    TFormAccess(FMainForm).SetPreloadProperties(PropertyStore);
  finally
    PropertyStore.Free;
  end;

  TFormAccess(FMainForm).RecreateResources;
end;

procedure TFForm.StayOnTop(FValue: Boolean);
begin
  if not FormReady then
    Exit;

  if FValue then
    SetWindowPos(FMainFormHWND, HWND_TOPMOST, 0, 0, 0, 0,
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE)
  else
    SetWindowPos(FMainFormHWND, HWND_NOTOPMOST, 0, 0, 0, 0,
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
end;

procedure TFForm.SetCaptured(FControl: TFmxObject);
begin
  if not FormReady then
    Exit;

  if FControl is TControl then
    TControlAccess(FControl).Capture;
end;

procedure TFForm.AddMouseDownControls(FControl: TFmxObject);
begin
  if not FormReady then
    Exit;

  TControl(FControl).OnMouseDown := FormDragMouseDown;
end;

procedure TFForm.SetContextMenuLanguage(const FLang: WideString);
begin
  if not FormReady then
    Exit;

  ConfigureContextMenuLanguage(string(FLang));
end;

procedure TFForm.StartWindowDrag;
begin
  if not FormReady then
    Exit;

  FMainForm.StartWindowDrag;
end;

procedure TFForm.UpdateStyleBook;
var
  I: Integer;
begin
  if not FormReady then
    Exit;

  for I := 0 to Screen.FormCount - 1 do
  begin
    Screen.Forms[I].StyleBook := SharedStyleBook;
    TFormAccess(Screen.Forms[I]).UpdateStyleBook;
  end;
end;

procedure TFForm.Show;
begin
  if not FormReady then
    Exit;

  FMainForm.Show;
  SetForegroundWindow(FMainFormHWND);
end;

procedure TFForm.Minimize;
begin
  if not FormReady then
    Exit;

  ShowWindow(FMainFormHWND, SW_MINIMIZE);
end;

function TFForm.GetHeight: Integer;
begin
  if not FormReady then
    Exit(0);

  Result := FMainForm.Height;
end;

function TFForm.GetWidth: Integer;
begin
  if not FormReady then
    Exit(0);

  Result := FMainForm.Width;
end;

procedure TFForm.OnShow(Event: TNotifyEvent);
begin
  if not FormReady then
    Exit;

  FMainForm.OnShow := TNotifyEvent(Event);
end;

procedure TFForm.OnActivate(Event: TNotifyEvent);
begin
  if not FormReady then
    Exit;

  FMainForm.OnActivate := TNotifyEvent(Event);
end;

procedure TFForm.OnDeactivate(Event: TNotifyEvent);
begin
  if not FormReady then
    Exit;

  FMainForm.OnDeactivate := TNotifyEvent(Event);
end;

procedure TFForm.OnKeyDown(Event: TKeyEvent);
begin
  if not FormReady then
    Exit;

  FMainForm.OnKeyDown := TKeyEvent(Event);
end;

procedure TFForm.OnKeyUp(Event: TKeyEvent);
begin
  if not FormReady then
    Exit;

  FMainForm.OnKeyUp := TKeyEvent(Event);
end;

procedure TFForm.OnMouseDown(Event: TMouseEvent);
begin
  if not FormReady then
    Exit;

  FMainForm.OnMouseDown := TMouseEvent(Event);
end;

procedure TFForm.OnMouseUp(Event: TMouseEvent);
begin
  if not FormReady then
    Exit;

  FMainForm.OnMouseUp := TMouseEvent(Event);
end;

procedure TFForm.OnMouseWheel(Event: TMouseWheelEvent);
begin
  if not FormReady then
    Exit;

  FMainForm.OnMouseWheel := TMouseWheelEvent(Event);
end;

function TFForm.Handle: TFmxObject;
begin
  Result := FMainForm;
end;

function TFForm.HandleHWND: HWND;
begin
  Result := FMainFormHWND;
end;

// =============================================================================
// FMsgForm Create
// =============================================================================
procedure TFMsgForm.CreateMainForm(AOwner: HWND;
  ABorderStyle: TFmxFormBorderStyle; ATransparency: Boolean);
begin
  FOwnerHWND := AOwner;

  FormMsg := TForm.CreateNew(Application);
  FormMsg.ClientHeight := 220;
  FormMsg.ClientWidth := 420;
  FormMsg.Position := TFormPosition.OwnerFormCenter;
  FormMsg.BringToFront;

  FormMsg.BorderStyle := ABorderStyle;
  FormMsg.Border.Styling := False;

  if ABorderStyle <> TFmxFormBorderStyle.None then
    FormMsg.BorderIcons := [TBorderIcon.biSystemMenu]
  else
    FormMsg.BorderIcons := [];

  FormMsg.Transparency := ATransparency;
  FormMsg.Caption := WindowCaption(FOwnerHWND);
  FormMsg.OnMouseDown := FormDragMouseDown;
  FormMsg.OnClose := FormClose;

  if Assigned(SharedStyleBook) then
    FormMsg.StyleBook := SharedStyleBook;

  FormMsg.HandleNeeded;
  FormMsgHWND := WindowHandleToPlatform(FormMsg.Handle).Wnd;

  ConfigureMsgForm(FormMsgHWND, FOwnerHWND);
  CopyWindowIcon(FOwnerHWND, FormMsgHWND);
  DisableAeroPeek(FormMsgHWND);
end;

function TFMsgForm.FormReady: Boolean;
begin
  Result := Assigned(FormMsg) and (FormMsgHWND <> 0);
end;

// =============================================================================
// FMsgForm Backdrop
// =============================================================================
procedure TFMsgForm.FCreateBackdropForm(FOwner: HWND; FBackType: TBackdropType;
  FDark, FRound: Boolean);
begin
  CreateMainForm(FOwner, TFmxFormBorderStyle.Single, False);

  FormMsg.Fill.Kind := TBrushKind.Solid;
  FormMsg.Fill.Color := TAlphaColors.Null;

  ExtendFrameIntoClientArea(FormMsgHWND);
  SetBackdropType(FormMsgHWND, FBackType);
  SetDarkMode(FormMsgHWND, FDark);
  SetRoundedCorners(FormMsgHWND, FRound);
  ApplyNoTopStripe(FormMsgHWND);
end;

// =============================================================================
// FMsgForm Blur
// =============================================================================
procedure TFMsgForm.FCreateBlurForm(FOwner: HWND; FColor: TAlphaColor;
  FRound: Boolean);
begin
  CreateMainForm(FOwner, TFmxFormBorderStyle.Single, False);

  FormMsg.Fill.Kind := TBrushKind.Solid;

  if FColor <> 0 then
    FormMsg.Fill.Color := TAlphaColor(FColor)
  else
    FormMsg.Fill.Color := TAlphaColors.Null;

  if TOSVersion.Build < 22000 then
    ExtendFrameIntoClientArea(FormMsgHWND)
  else
    SetRoundedCorners(FormMsgHWND, FRound);

  SetBlur(FormMsgHWND);
end;

// =============================================================================
// FMsgForm Blank
// =============================================================================
procedure TFMsgForm.FCreateBlankForm(FOwner: HWND; FColor: TAlphaColor;
  const FImage: WideString; FRound: Boolean);
begin
  CreateMainForm(FOwner, TFmxFormBorderStyle.Single, False);

  FormMsg.Fill.Kind := TBrushKind.None;

  if FImage <> '' then
  begin
    FormMsg.Fill.Kind := TBrushKind.Bitmap;
    FormMsg.Fill.Bitmap.Bitmap.LoadFromFile(string(FImage));
    FormMsg.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  end
  else if FColor <> 0 then
  begin
    FormMsg.Fill.Kind := TBrushKind.Solid;
    FormMsg.Fill.Color := TAlphaColor(FColor);
  end;

  if TOSVersion.Build < 22000 then
    ExtendFrameIntoClientArea(FormMsgHWND)
  else
    SetRoundedCorners(FormMsgHWND, FRound);
end;

// =============================================================================
// FMsgForm Image
// =============================================================================
procedure TFMsgForm.FCreateImageForm(FOwner: HWND; FColor: TAlphaColor;
  const FImage: WideString; FOpacity: Boolean);
begin
  CreateMainForm(FOwner, TFmxFormBorderStyle.None, FOpacity);

  if FColor <> 0 then
  begin
    FormMsg.Fill.Kind := TBrushKind.Solid;
    FormMsg.Fill.Color := TAlphaColor(FColor);
  end
  else if FImage <> '' then
  begin
    FormMsg.Fill.Kind := TBrushKind.Bitmap;
    FormMsg.Fill.Bitmap.Bitmap.LoadFromFile(string(FImage));
    FormMsg.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  end;
end;

procedure TFMsgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not FormReady then
    Exit;

  Action := TCloseAction.caHide;
end;

procedure TFMsgForm.FormDragMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if not FormReady then
    Exit;

  if Button = TMouseButton.mbLeft then
  begin
    ReleaseCapture;
    PostMessage(FormMsgHWND, $0112, $F012, 0);
    // SendMessage(FormMsgHWND, WM_NCLBUTTONDOWN, HTCAPTION, 0);
  end;
end;

procedure TFMsgForm.Height(FHeight: Integer);
begin
  if not FormReady then
    Exit;

  FormMsg.Height := FHeight;
end;

procedure TFMsgForm.Width(FWidth: Integer);
begin
  if not FormReady then
    Exit;

  FormMsg.Width := FWidth;
end;

procedure TFMsgForm.ChangeFormImage(const FImage: WideString);
begin
  if not FormReady then
    Exit;

  FormMsg.Fill.Kind := TBrushKind.Bitmap;
  FormMsg.Fill.Bitmap.Bitmap.LoadFromFile(string(FImage));
  FormMsg.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
end;

procedure TFMsgForm.ChangeFormColor(FColor: TAlphaColor);
begin
  if not FormReady then
    Exit;

  FormMsg.Fill.Kind := TBrushKind.Solid;
  FormMsg.Fill.Color := TAlphaColor(FColor);
end;

procedure TFMsgForm.ChangeDarkMode(const FDark: Boolean);
begin
  if not FormReady then
    Exit;

  SetDarkMode(FormMsgHWND, FDark);
end;

procedure TFMsgForm.ChangeBorderColor(FColor: TAlphaColor);
begin
  if not FormReady then
    Exit;

  SetBorderColor(FormMsgHWND, TAlphaColor(FColor));
end;

procedure TFMsgForm.GradientFormColors(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  if not FormReady then
    Exit;

  FormMsg.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(FormMsg.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFMsgForm.GradientFormLinearAngle(FAngle: Single);
begin
  if not FormReady then
    Exit;

  FormMsg.Fill.Kind := TBrushKind.Gradient;
  FormMsg.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(FormMsg.Fill, FAngle);
end;

procedure TFMsgForm.GradientFormRadialAngle(FAngle: Single);
begin
  if not FormReady then
    Exit;

  FormMsg.Fill.Kind := TBrushKind.Gradient;
  FormMsg.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(FormMsg.Fill, FAngle);
end;

procedure TFMsgForm.GradientFormPosition(X1, Y1, X2, Y2: Single);
begin
  if not FormReady then
    Exit;

  FormMsg.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(FormMsg.Fill, X1, Y1, X2, Y2);
end;

procedure TFMsgForm.Caption(const FText: WideString);
begin
  if not FormReady then
    Exit;

  FormMsg.Caption := string(FText);
end;

procedure TFMsgForm.AddMouseDownControls(FControl: TFmxObject);
begin
  if not FormReady then
    Exit;

  TControl(FControl).OnMouseDown := FormDragMouseDown;
end;

procedure TFMsgForm.StartWindowDrag;
begin
  if not FormReady then
    Exit;

  FormMsg.StartWindowDrag;
end;

procedure TFMsgForm.Show;
begin
  if not FormReady then
    Exit;

  EnableWindow(FOwnerHWND, False);

  FormMsg.Show;
end;

procedure TFMsgForm.Close;
begin
  if not FormReady then
    Exit;

  FormMsg.Close;

  EnableWindow(FOwnerHWND, True);
end;

function TFMsgForm.GetHeight: Integer;
begin
  if FormReady then
    Result := FormMsg.Height
  else
    Result := 0;
end;

function TFMsgForm.GetWidth: Integer;
begin
  if FormReady then
    Result := FormMsg.Width
  else
    Result := 0;
end;

function TFMsgForm.Handle: TFmxObject;
begin
  Result := FormMsg;
end;

function TFMsgForm.HandleHWND: HWND;
begin
  Result := FormMsgHWND;
end;

// =============================================================================
// Exports
// =============================================================================
function InitFormHandle: FForm;
begin
  Result := TFForm.Create;
end;

function InitMsgFormHandle: FMsgForm;
begin
  Result := TFMsgForm.Create;
end;

exports
  InitFormHandle,
  InitMsgFormHandle;

end.
