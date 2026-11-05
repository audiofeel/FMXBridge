
#define Lang1 "English"
#define Lang2 "Russian"

[Setup]
AppName=FMXBridge - LangForm
AppVersion=1.0
CreateAppDir=no
AppCopyright=audiofeel
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[CustomMessages]
{#Lang1}_TitleBar=Setup
{#Lang1}_LangFormOkBtn=Ok
{#Lang1}_LangFormCancelBtn=Cancel
{#Lang1}_LangFormTitle=Select Setup Language
{#Lang1}_LangFormSubTitle=Select the language to use during the installation.
{#Lang1}_Text1=Welcome to the {#SetupSetting('AppName')} Setup Wizard
{#Lang1}_Text2=This will install {#SetupSetting('AppName')} on your computer.It is recommended that you close all other applications before continuing.
{#Lang1}_ExitFormYesBtn=Yes
{#Lang1}_ExitFormNoBtn=No
{#Lang1}_ExitFormTitle=Are you sure to Lang the installer?
{#Lang1}_ExitFormSubTitle=This will closes the installer wizard.%nThe product you are installing would not be installed.

{#Lang2}_TitleBar=Установка
{#Lang2}_LangFormOkBtn=ОК
{#Lang2}_LangFormCancelBtn=Отмена
{#Lang2}_LangFormTitle=Выберите язык установки
{#Lang2}_LangFormSubTitle=Выберите язык, который будет использован в процессе установки.
{#Lang2}_Text1=Вас приветствует Мастер установки {#SetupSetting('AppName')}
{#Lang2}_Text2=Программа установит {#SetupSetting('AppName')} на ваш компьютер.Рекомендуется закрыть все прочие приложения перед тем, как продолжить.
{#Lang2}_ExitFormYesBtn=Да
{#Lang2}_ExitFormNoBtn=Нет
{#Lang2}_ExitFormTitle=Вы уверены, что хотите выйти из установщика?
{#Lang2}_ExitFormSubTitle=При этом мастер установки закроется. Устанавливаемый вами продукт не будет установлен.

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  Text1            : FLabel;
  Text2            : FLabel;

  WizardLang       : String;
  LangForm         : FMsgForm;
  LangFormTitle    : FLabel;
  LangFormSubTitle : FLabel;
  LangComboBox     : FComboBox;
  LangFormOkBtn    : FButton;
  LangFormCancelBtn: FButton;

  ExitForm         : FMsgForm;
  ExitFormTitle    : FLabel;
  ExitFormSubTitle : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  Text1            := InitLabelHandle;
  Text2            := InitLabelHandle;

  LangForm         := InitMsgFormHandle;
  LangFormTitle    := InitLabelHandle;
  LangFormSubTitle := InitLabelHandle;
  LangComboBox     := InitComboBoxHandle;
  LangFormOkBtn    := InitButtonHandle;
  LangFormCancelBtn:= InitButtonHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormTitle    := InitLabelHandle;
  ExitFormSubTitle := InitLabelHandle;
  ExitFormYesBtn   := InitButtonHandle;
  ExitFormNoBtn    := InitButtonHandle;
end;

function InitializeSetup(): Boolean;
begin
  WizardLang:= '{#Lang1}' + '_';

  FMXInit;
  Result:= True;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;

procedure ShowLangForm(const Title, SubTitle: String);
begin
  LangFormTitle.Text(Title);
  LangFormSubTitle.Text(SubTitle);

  LangForm.Show;

  BeginHaltProc;
end;

procedure LangComboBoxOnChange(Sender: TObject);
var
  sLan: string;
begin
  sLan:= LangComboBox.GetItem(LangComboBox.GetItemIndex) + '_';

  LangFormTitle.Text(CustomMessage(sLan + 'LangFormTitle'));
  LangFormSubTitle.Text(CustomMessage(sLan + 'LangFormSubTitle'));
  LangFormOkBtn.Text(CustomMessage(sLan + 'LangFormOkBtn'));
  LangFormCancelBtn.Text(CustomMessage(sLan + 'LangFormCancelBtn'));
end;

procedure UpdateSetupLanguage;
begin
  LangForm.Caption(CustomMessage(WizardLang + 'TitleBar') + ' - {#SetupSetting('AppName')}');

  Text1.Text(CustomMessage(WizardLang + 'Text1'));
  Text2.Text(CustomMessage(WizardLang + 'Text2'));

  ExitFormTitle.Text(CustomMessage(WizardLang + 'ExitFormTitle'));
  ExitFormSubTitle.Text(CustomMessage(WizardLang + 'ExitFormSubTitle'));
  ExitFormYesBtn.Text(CustomMessage(WizardLang + 'ExitFormYesBtn'));
  ExitFormNoBtn.Text(CustomMessage(WizardLang + 'ExitFormNoBtn'));
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(LangFormOkBtn.GetObject):
    begin
      WizardLang:= LangComboBox.GetItem(LangComboBox.GetItemIndex) + '_';
      UpdateSetupLanguage;
      LangForm.Close;
      EndHaltProc;
    end;

    TObject(LangFormCancelBtn.GetObject):
    begin
      LangForm.Close;
      EndHaltProc;
      WizardForm.Close;
      FMXBridgeShutDown;
    end;

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
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btMain, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Text1.FCreate(FormLayer.Handle);
  Text1.SetBounds(50, 150, FormLayer.GetWidth - 100, 70);
  Text1.TextSetting(True, txCenter, txCenter);
  Text1.FontSetting('Segoe UI Variable Display', 25, ALAntiqueWhite);
  Text1.Text(CustomMessage(WizardLang + 'Text1'));

  Text2.FCreate(FormLayer.Handle);
  Text2.SetBounds(100, Text1.GetTop + Text1.GetHeight + 30, FormLayer.GetWidth - 200, 110);
  Text2.TextSetting(True, txCenter, txCenter);
  Text2.FontSetting('Segoe UI Variable Display', 14, ALAntiqueWhite);
  Text2.Text(CustomMessage(WizardLang + 'Text2'));

  LangForm.FCreateBackdropForm(FMXForm.HandleHWND, btMain, True, True);
  LangForm.Caption('Language Setup');
  LangForm.Height(200);
  LangForm.Width(400);

  LangFormTitle.FCreate(LangForm.Handle);
  LangFormTitle.SetBounds(20, 30, 360, 24);
  LangFormTitle.Text('');
  LangFormTitle.FontSetting('Segoe UI Variable Text', 17, ALAntiqueWhite);
  LangFormTitle.TextSetting(False, txLeading, txLeading);

  LangFormSubTitle.FCreate(LangForm.Handle);
  LangFormSubTitle.SetBounds(30, 64, 340, 46);
  LangFormSubTitle.Text('');
  LangFormSubTitle.FontSetting('Segoe UI Variable Text', 12, ALAntiqueWhite);
  LangFormSubTitle.TextSetting(True, txLeading, txLeading);

  LangComboBox.FCreate(LangForm.Handle);
  LangComboBox.Width(340);
  LangComboBox.Left(30);
  LangComboBox.Top(106);
#ifdef Lang1
  LangComboBox.AddItem('{#Lang1}');
#endif
#ifdef Lang2
  LangComboBox.AddItem('{#Lang2}');
#endif
  LangComboBox.SetItemIndex(0);
  LangComboBox.OnChange(@LangComboBoxOnChange);

  LangFormOkBtn.FCreate(LangForm.Handle);
  LangFormOkBtn.Position(199, 155);
  LangFormOkBtn.Text(CustomMessage(WizardLang + 'LangFormOkBtn'));
  LangFormOkBtn.OnClick(@CommonOnClick);

  LangFormCancelBtn.FCreate(LangForm.Handle);
  LangFormCancelBtn.Position(289, 155);
  LangFormCancelBtn.Text(CustomMessage(WizardLang + 'LangFormCancelBtn'));
  LangFormCancelBtn.OnClick(@CommonOnClick);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btMain, True, True);
  ExitForm.Caption('Exit Setup');
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitle.FCreate(ExitForm.Handle);
  ExitFormTitle.SetBounds(15, 69, 505, 28);
  ExitFormTitle.Text(CustomMessage(WizardLang + 'ExitFormTitle'));
  ExitFormTitle.FontSetting('Segoe UI Variable Display Semib', 20, ALAntiqueWhite);
  ExitFormTitle.TextSetting(True, txCenter, txLeading);

  ExitFormSubTitle.FCreate(ExitForm.Handle);
  ExitFormSubTitle.SetBounds(15, 113, 505, 45);
  ExitFormSubTitle.Text(CustomMessage(WizardLang + 'ExitFormSubTitle'));
  ExitFormSubTitle.FontSetting('Segoe UI Variable Text SemiBold', 15, ALAntiqueWhite);
  ExitFormSubTitle.TextSetting(True, txCenter, txCenter);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(383, 207, 46, 27);
  ExitFormYesBtn.Text(CustomMessage(WizardLang + 'ExitFormYesBtn'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(442, 207, 72, 27);
  ExitFormNoBtn.Text(CustomMessage(WizardLang + 'ExitFormNoBtn'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(740, 480);
  FMXDesigning;

  ShowLangForm(CustomMessage(WizardLang + 'LangFormTitle'), CustomMessage(WizardLang + 'LangFormSubTitle'));

  FMXForm.Show;
end;

procedure DeinitializeSetup();
begin
  FMXBridgeShutDown;
end;
