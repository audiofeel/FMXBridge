
[Setup]
AppName=FMXBridge_GlassRectangle
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[CustomMessages]
ExitForm=Уведомление
ExitFormLabel1=Выход из установки
ExitFormLabel2=Вы действительно хотите выйти из установки%n{#SetupSetting('AppName')}?
ExitFormYesButton=ОК
ExitFormNoButton=Отмена

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Images\Img1.jpg"; Flags: dontcopy
Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm               : FForm;
  FormLayer             : FLayout;
  TitleBar              : FWinTitleBar;

  Dragging              : Boolean;
  OffsetX, OffsetY      : Single;

  LiquidGlass           : FGlassRectangle;
  TextLiquidGlass       : FLabel;
  LiquidGlassLight      : FGlassRectangle;
  TextLiquidGlassLight  : FLabel;

  CloseBtn              : FButton;

  ExitForm              : FMsgForm;
  ExitFormTitleBar      : FWinTitleBar;
  ExitFormLabel1        : FLabel;
  ExitFormLabel2        : FLabel;
  ExitFormBottomBar     : FRectangle;
  ExitFormYesBtn        : FButton;
  ExitFormNoBtn         : FButton;

procedure FMXInit;
begin
  FMXForm               := InitFormHandle;
  FormLayer             := InitLayoutHandle;
  TitleBar              := InitWinTitleBarHandle;

  Dragging              := False;

  LiquidGlass           := InitGlassRectangleHandle;
  TextLiquidGlass       := InitLabelHandle;
  LiquidGlassLight      := InitGlassRectangleHandle;
  TextLiquidGlassLight  := InitLabelHandle;

  CloseBtn              := InitButtonHandle;

  ExitForm              := InitMsgFormHandle;
  ExitFormTitleBar      := InitWinTitleBarHandle;
  ExitFormLabel1        := InitLabelHandle;
  ExitFormLabel2        := InitLabelHandle;
  ExitFormBottomBar     := InitRectangleHandle;
  ExitFormYesBtn        := InitButtonHandle;
  ExitFormNoBtn         := InitButtonHandle;
end;

function InitializeSetup(): Boolean;
begin
  FMXInit;
  Result:= True;
end;

procedure DeinitializeSetup();
begin
  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm:= False;
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectCloseBtn), TObject(CloseBtn.GetObject):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

  end;
end;

procedure MsgFormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  Dragging:= True;

  OffsetX:= X;
  OffsetY:= Y;

  FMXForm.SetCaptured(LiquidGlass.Handle);
end;

procedure MsgFormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
var
  NewLeft, NewTop: Single;
  MaxLeft, MaxTop: Single;
begin
  if not Dragging then
    Exit;

  NewLeft:= LiquidGlass.GetLeft + (X - OffsetX);
  NewTop:= LiquidGlass.GetTop + (Y - OffsetY);

  MaxLeft:= FMXForm.GetWidth - LiquidGlass.GetWidth;
  MaxTop:= FMXForm.GetHeight - LiquidGlass.GetHeight;

  if NewLeft < 0 then
    NewLeft:= 0;

  if NewTop < 0 then
    NewTop:= 0;

  if NewLeft > MaxLeft then
    NewLeft:= MaxLeft;

  if NewTop > MaxTop then
    NewTop:= MaxTop;

  LiquidGlass.Left(Single(NewLeft));
  LiquidGlass.Top(Single(NewTop));
end;

procedure MsgFormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  Dragging:= False;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, ExtractAndLoad('Img1.jpg'), True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), $FFFF8C00);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($80000000);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  CloseBtn.FCreate(FormLayer.Handle);
  CloseBtn.SetBounds(310, 413, 92, 27);
  CloseBtn.Text('Close');
  CloseBtn.StyleLookUp('buttonstyle_accent');
  CloseBtn.OnClick(@CommonOnClick);

  LiquidGlassLight.FCreate(FormLayer.Handle, False);
  LiquidGlassLight.SetBounds(260, 70, 180, 180);
  LiquidGlassLight.StrokeSetting(1, scRound, sdSolid, sjMiter);
  LiquidGlassLight.CornerStyle(19, 19, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  LiquidGlassLight.GlassAmount(100);

  TextLiquidGlassLight.FCreate(LiquidGlassLight.Handle);
  TextLiquidGlassLight.Align(Client);
  TextLiquidGlassLight.AutoSize(True);
  TextLiquidGlassLight.FontSetting('Segoe UI Variable Display', 29, $FFFF8C00);
  TextLiquidGlassLight.TextSetting(False, txCenter, txCenter);
  TextLiquidGlassLight.StyledSettings([ssOther]);
  TextLiquidGlassLight.Text('Light Liquid Glass');

  LiquidGlass.FCreate(FormLayer.Handle, True);
  LiquidGlass.SetBounds(50, 70, 180, 180);
  LiquidGlass.StrokeSetting(0, scRound, sdSolid, sjMiter);
  LiquidGlass.CornerStyle(19, 19, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  LiquidGlass.GlassAmount(90);
  LiquidGlass.BlurAmount(10);
  LiquidGlass.TintColor($FF7FFFD4);
  LiquidGlass.OnMouseDown(@MsgFormMouseDown);
  LiquidGlass.OnMouseUp(@MsgFormMouseUp);
  LiquidGlass.OnMouseMove(@MsgFormMouseMove);

  TextLiquidGlass.FCreate(LiquidGlass.Handle);
  TextLiquidGlass.Align(Client);
  TextLiquidGlass.AutoSize(True);
  TextLiquidGlass.FontSetting('Segoe UI Variable Display', 29, $FFFF8C00);
  TextLiquidGlass.TextSetting(False, txCenter, txCenter);
  TextLiquidGlass.StyledSettings([ssOther]);
  TextLiquidGlass.Text('Dark Liquid Glass');

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, ExtractAndLoad('Img1.jpg'), True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($80000000);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FFF5F5F5);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FFF5F5F5);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Align(MostBottom);
  ExitFormBottomBar.Height(54);
  ExitFormBottomBar.FillColor($80000000);

  ExitFormYesBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormYesBtn.SetBounds(310, 13, 92, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.StyleLookUp('buttonstyle_accent');
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormNoBtn.SetBounds(412, 13, 92, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.StyleLookUp('buttonstyle_accent');
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(726, 500);

  FMXDesigning;
  FMXForm.Show;
end;
