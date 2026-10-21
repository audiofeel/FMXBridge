[Setup]
AppName=FMXBridge_AutoColorMode
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
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy
Source: "Files\Styles\LightStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  ColorFill        : TAlphaColor;
  ColorText        : TAlphaColor;

  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  Text             : FLabel;
  TextShadow       : FShadowEffect;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
begin
  if IsWinDark then
  begin
    ColorFill:= $FF0E192B;
    ColorText:= $FFFFFFFF;
  end else
  begin
    ColorFill:= $FF5A6EBA;
    ColorText:= $FF000000;
  end;

  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  Text             := InitLabelHandle;
  TextShadow       := InitShadowEffect;

  ExitForm         := InitMsgFormHandle;
  ExitFormTitleBar := InitWinTitleBarHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitButtonHandle;
  ExitFormNoBtn    := InitButtonHandle;
  ExitFormBottomBar:= InitStatusBarHandle;
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

    TObject(TitleBar.GetObjectCloseBtn):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, IsWinDark, True);
  if IsWinDark then
    FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0)
  else
    FMXForm.LoadStyleFromFile(ExtractAndLoad('LightStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, IsWinDark);
  TitleBar.SetColor(ColorFill);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Text.FCreate(FormLayer.Handle);
  Text.Align(Client);
  Text.AutoSize(True);
  Text.FontSetting('Segoe UI Variable Display', 68, $FFFFFFFF);
  Text.TextSetting(False, txCenter, txCenter);
  Text.StyledSettings([ssFontColor, ssOther]);
  Text.FontStyle([fsItalic, fsUnderline]);

  if IsWinDark then
    Text.Text('Windows Dark')
  else
    Text.Text('Windows Light');

  TextShadow.FCreate(Text.Handle);
  TextShadow.ShadowColor(ColorText);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btTabbed, IsWinDark, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(200);
  ExitForm.Width(400);

  ExitFormTitleBar.FCreate(ExitForm.Handle, IsWinDark);
  ExitFormTitleBar.SetColor(ColorFill);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 54, 370, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 88, 370, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Height(54);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(250, 164, 46, 22);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(312, 164, 72, 22);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(640, 480);
  FMXDesigning;
  FMXForm.Show;
end;
