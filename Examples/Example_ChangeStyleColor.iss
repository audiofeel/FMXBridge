[Setup]
AppName=FMXBridge_ChangeStyleColor
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

Source: "Files\Cursor\Dark.ani"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  Button           : FButton;
  CheckBox         : FCheckBox;
  RadioButton1     : FRadioButton;
  RadioButton2     : FRadioButton;
  Switch           : FSwitch;
  ColorComboBox    : FColorComboBox;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  Button           := InitButtonHandle;
  CheckBox         := InitCheckBoxHandle;
  RadioButton1     := InitRadioButtonHandle;
  RadioButton2     := InitRadioButtonHandle;
  Switch           := InitSwitchHandle;
  ColorComboBox    := InitColorComboBoxHandle;

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
  Result := True;
end;

procedure DeinitializeSetup();
begin
  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
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

procedure ColorComboBoxOnChange(Sender: TObject);
var
  CtrlClr: TAlphaColor;
begin
  CtrlClr:= ColorComboBox.GetColor;

  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), CtrlClr);
  FMXForm.UpdateStyleBook;
//  ExitForm.UpdateStyleBook;  теперь смена общая
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btMain, True, True);
//  FMXForm.CanvasQuality(HighPerformance);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), ALDarkViolet);
  FMXForm.SetCursor(ExtractAndLoad('Dark.ani'));

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Button.FCreate(FormLayer.Handle);
  Button.SetBounds(35, 80, 130, 32);
  Button.Text('Button');
  Button.StyleLookUp('buttonstyle_accent');

  CheckBox.FCreate(FormLayer.Handle);
  CheckBox.SetBounds(35, 120, 130, 32);
  CheckBox.Text('CheckBox');
  CheckBox.SetChecked(True);

  RadioButton1.FCreate(FormLayer.Handle);
  RadioButton1.SetBounds(35, 160, 190, 32);
  RadioButton1.Text('RadioButton1 Group1');
  RadioButton1.GroupName('group1');
  RadioButton1.SetChecked(True);

  RadioButton2.FCreate(FormLayer.Handle);
  RadioButton2.SetBounds(35, 200, 190, 32);
  RadioButton2.Text('RadioButton2 Group1');
  RadioButton2.GroupName('group1');

  Switch.FCreate(FormLayer.Handle);
  Switch.SetBounds(35, 325, 40, 20);
  Switch.SwitchedOn(True);

  ColorComboBox.FCreate(FormLayer.Handle);
  ColorComboBox.SetBounds(320, 160, 220, 32);
  ColorComboBox.ItemHeight(32);
  ColorComboBox.ItemIndex(0);
  ColorComboBox.OnChange(@ColorComboBoxOnChange);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btMain, True, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FFF5F5F5);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FF767676);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Height(54);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(383, 207, 46, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.StyleLookUp('buttonstyle_accent');
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(442, 207, 72, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.StyleLookUp('buttonstyle_accent');
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(700, 466);
  FMXDesigning;
  FMXForm.Show;
end;
