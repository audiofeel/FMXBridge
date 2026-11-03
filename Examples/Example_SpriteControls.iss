[Setup]
AppName=FMXBridge_SpriteControls
AppVersion=1.0
CreateAppDir=no
AppCopyright=audiofeel
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

Source: "Files\SpriteImages\*"; Flags: dontcopy
Source: "Files\ImageList\*"; Flags: dontcopy
Source: "Files\Music\music1.mp3"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm         : FForm;

  MusicPlayer     : FBASSPlayer;

  FormLayer       : FLayout;
  TitleBar        : FMacTitleBar;

  TestChangeImg   : FImage;

  BotvaButton     : FImageButton;
  MusicCheckBox   : FImageCheckBox;
  CheckBox        : FImageCheckBox;
  CheckBoxTxt     : FText;

  RadioButton1    : FImageRadioButton;
  RadioButton1Txt : FText;
  RadioButton2    : FImageRadioButton;
  RadioButton2Txt : FText;

  RadioButton3    : FImageRadioButton;
  RadioButton3Txt : FText;
  RadioButton4    : FImageRadioButton;
  RadioButton4Txt : FText;

  OnChangeTxt     : FText;

  LinkButton      : FImageButton;

  ProgressBar     : FImageProgressBar;
  ProgressBarTxt  : FText;
  ArcDial         : FArcDial;

procedure FMXInit;
begin
  FMXForm         := InitFormHandle;

  MusicPlayer     := InitBASSPlayer;

  FormLayer       := InitLayoutHandle;
  TitleBar        := InitMacTitleBarHandle;

  TestChangeImg   := InitImageHandle;

  BotvaButton     := InitImageButtonHandle;
  MusicCheckBox   := InitImageCheckBoxHandle;
  CheckBox        := InitImageCheckBoxHandle;
  CheckBoxTxt     := InitTextHandle;

  RadioButton1    := InitImageRadioButtonHandle;
  RadioButton1Txt := InitTextHandle;
  RadioButton2    := InitImageRadioButtonHandle;
  RadioButton2Txt := InitTextHandle;

  RadioButton3    := InitImageRadioButtonHandle;
  RadioButton3Txt := InitTextHandle;
  RadioButton4    := InitImageRadioButtonHandle;
  RadioButton4Txt := InitTextHandle;

  OnChangeTxt     := InitTextHandle;

  LinkButton      := InitImageButtonHandle;

  ProgressBar     := InitImageProgressBarHandle;
  ProgressBarTxt  := InitTextHandle;
  ArcDial         := InitArcDialHandle;
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

procedure ProgressBarOnChange(Sender: TObject);
var
  V: Integer;
begin
  V:= Round(ArcDial.GetValue);

  if V < 0 then
    V:= 0
  else
  if V > 100 then
    V:= 100;

  ProgressBar.Value(V);

  ProgressBarTxt.Text(IntToStr(V) + '%');
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectMinBtn):
      FMXForm.Minimize;

    TObject(TitleBar.GetObjectExitBtn):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(BotvaButton.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(MusicCheckBox.GetObject):
    begin
      if MusicCheckBox.IsChecked then
        MusicPlayer.Play
      else
        MusicPlayer.Pause;
    end;

    TObject(CheckBox.GetObject):
    begin
      if CheckBox.IsChecked then
      begin
        BotvaButton.Enabled(False);
        MusicCheckBox.Enabled(False);
        CheckBoxTxt.Text('Enabled control');
      end else
      begin
        BotvaButton.Enabled(True);
        MusicCheckBox.Enabled(True);
        CheckBoxTxt.Text('Disabled control');
      end;
    end;

    TObject(LinkButton.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_Botva2.Like', 'Test LinkButton', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(RadioButton1.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_Botva2.Like', 'Test RadioButton1', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(RadioButton2.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_Botva2.Like', 'Test RadioButton2', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(RadioButton3.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_Botva2.Like', 'Test RadioButton3', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(RadioButton4.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_Botva2.Like', 'Test RadioButton3', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(LinkButton.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_Botva2.Like', 'Test RadioButton4', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(ProgressBar.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_Botva2.Like', 'Test ProgressBar', mbInformation, MB_OK, ['Ok'], 0, IDOK);

  end;
end;

procedure CommonOnEnter(Sender: TObject);
begin
  TestChangeImg.LoadPicture(ExtractAndLoad('button2.ico'), iwOriginal);
end;

procedure CommonOnLeave(Sender: TObject);
begin
  TestChangeImg.LoadPicture(ExtractAndLoad('button1.ico'), iwOriginal);
end;

procedure RadioButtonOnChange(Sender: TObject);
var
  Total: Integer;
begin
  Total:= 0;

  if RadioButton1.IsChecked then
    Total:= Total + 2;

  if RadioButton2.IsChecked then
    Total:= Total + 3;

  if RadioButton3.IsChecked then
    Total:= Total + 3;

  if RadioButton4.IsChecked then
    Total:= Total + 4;

  OnChangeTxt.Text(IntToStr(Total));
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALAntiqueWhite, '', True);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle);
  TitleBar.MinBtnOnClick(@CommonOnClick);
  TitleBar.ExitBtnOnClick(@CommonOnClick);
  FMXForm.AddMouseDownControls(TitleBar.Handle);

  TestChangeImg.FCreate(FormLayer.Handle);
  TestChangeImg.SetBounds(78, 48, 24, 24);
  TestChangeImg.LoadPicture(ExtractAndLoad('button1.ico'), iwOriginal);

  BotvaButton.FCreate(FormLayer.Handle);
  BotvaButton.SetBounds(40, 90, 100, 46);
  BotvaButton.SetImage(ExtractAndLoad('button.png'));
  BotvaButton.FontSetting('Bahnschrift', VCLFontSizeToFMX(12), ALCornflowerBlue);
  BotvaButton.Text('EXIT');
  BotvaButton.Enabled(False);
  BotvaButton.OnClick(@CommonOnClick);
  BotvaButton.OnMouseEnter(@CommonOnEnter);
  BotvaButton.OnMouseLeave(@CommonOnLeave);

  MusicCheckBox.FCreate(FormLayer.Handle);
  MusicCheckBox.SetBounds(390, 96, 36, 36);
  MusicCheckBox.SetImage(ExtractAndLoad('musicbutton.png'));
  MusicCheckBox.SetChecked(True);
  MusicCheckBox.OnClick(@CommonOnClick);
  MusicCheckBox.OnMouseEnter(@CommonOnEnter);
  MusicCheckBox.OnMouseLeave(@CommonOnLeave);
  MusicCheckBox.Enabled(False);

  CheckBox.FCreate(FormLayer.Handle);
  CheckBox.SetBounds(450, 399, 28, 32);
  CheckBox.SetImage(ExtractAndLoad('checkbox.png'));
  CheckBox.OnMouseEnter(@CommonOnEnter);
  CheckBox.OnMouseLeave(@CommonOnLeave);
  CheckBox.OnClick(@CommonOnClick);

  CheckBoxTxt.FCreate(FormLayer.Handle);
  CheckBoxTxt.SetBounds(CheckBox.GetLeft + CheckBox.GetWidth + 6, CheckBox.GetTop, 140, 32);
  CheckBoxTxt.Text('Enabled control');
  CheckBoxTxt.FontSetting('Bahnschrift', 14, ALCornflowerBlue);
  CheckBoxTxt.TextSetting(False, txLeading, txCenter);

  RadioButton1.FCreate(FormLayer.Handle);
  RadioButton1.SetBounds(55, 180, 32, 32);
  RadioButton1.SetImage(ExtractAndLoad('radiobutton.png'));
  RadioButton1.SetChecked(True);
  RadioButton1.GroupName('Group1');
  RadioButton1.OnMouseEnter(@CommonOnEnter);
  RadioButton1.OnMouseLeave(@CommonOnLeave);
  RadioButton1.OnClick(@CommonOnClick);
  RadioButton1.OnChange(@RadioButtonOnChange);

  RadioButton1Txt.FCreate(FormLayer.Handle);
  RadioButton1Txt.SetBounds(RadioButton1.GetLeft + RadioButton1.GetWidth + 6, RadioButton1.GetTop, 140, 32);
  RadioButton1Txt.Text('RadioButton1 Group1');
  RadioButton1Txt.FontSetting('Bahnschrift', 14, ALCornflowerBlue);
  RadioButton1Txt.TextSetting(False, txLeading, txCenter);

  RadioButton2.FCreate(FormLayer.Handle);
  RadioButton2.SetBounds(55, 210, 32, 32);
  RadioButton2.SetImage(ExtractAndLoad('radiobutton.png'));
  RadioButton2.GroupName('Group1');
  RadioButton2.OnMouseEnter(@CommonOnEnter);
  RadioButton2.OnMouseLeave(@CommonOnLeave);
  RadioButton2.OnClick(@CommonOnClick);
  RadioButton2.OnChange(@RadioButtonOnChange);

  RadioButton2Txt.FCreate(FormLayer.Handle);
  RadioButton2Txt.SetBounds(RadioButton2.GetLeft + RadioButton2.GetWidth + 6, RadioButton2.GetTop, 140, 32);
  RadioButton2Txt.Text('RadioButton2 Group1');
  RadioButton2Txt.FontSetting('Bahnschrift', 14, ALCornflowerBlue);
  RadioButton2Txt.TextSetting(False, txLeading, txCenter);

  RadioButton3.FCreate(FormLayer.Handle);
  RadioButton3.SetBounds(260, 180, 32, 32);
  RadioButton3.SetImage(ExtractAndLoad('radiobutton.png'));
  RadioButton3.SetChecked(True);
  RadioButton3.GroupName('Group2');
  RadioButton3.OnMouseEnter(@CommonOnEnter);
  RadioButton3.OnMouseLeave(@CommonOnLeave);
  RadioButton3.OnClick(@CommonOnClick);
  RadioButton3.OnChange(@RadioButtonOnChange);

  RadioButton3Txt.FCreate(FormLayer.Handle);
  RadioButton3Txt.SetBounds(RadioButton3.GetLeft + RadioButton3.GetWidth + 6, RadioButton3.GetTop, 140, 32);
  RadioButton3Txt.Text('RadioButton1 Group2');
  RadioButton3Txt.FontSetting('Bahnschrift', 14, ALCornflowerBlue);
  RadioButton3Txt.TextSetting(False, txLeading, txCenter);

  RadioButton4.FCreate(FormLayer.Handle);
  RadioButton4.SetBounds(260, 210, 32, 32);
  RadioButton4.SetImage(ExtractAndLoad('radiobutton.png'));
  RadioButton4.GroupName('Group2');
  RadioButton4.OnMouseEnter(@CommonOnEnter);
  RadioButton4.OnMouseLeave(@CommonOnLeave);
  RadioButton4.OnClick(@CommonOnClick);
  RadioButton4.OnChange(@RadioButtonOnChange);

  RadioButton4Txt.FCreate(FormLayer.Handle);
  RadioButton4Txt.SetBounds(RadioButton4.GetLeft + RadioButton4.GetWidth + 6, RadioButton4.GetTop, 140, 32);
  RadioButton4Txt.Text('RadioButton2 Group2');
  RadioButton4Txt.FontSetting('Bahnschrift', 14, ALCornflowerBlue);
  RadioButton4Txt.TextSetting(False, txLeading, txCenter);

  OnChangeTxt.FCreate(FormLayer.Handle);
  OnChangeTxt.SetBounds(RadioButton4Txt.GetLeft + RadioButton4Txt.GetWidth, RadioButton3Txt.GetTop, 145, 64);
  OnChangeTxt.Text('00');
  OnChangeTxt.FontSetting('Bahnschrift', 28, ALMediumPurple);
  OnChangeTxt.TextSetting(False, txCenter, txCenter);

  LinkButton.FCreate(FormLayer.Handle);
  LinkButton.Cursor(crHandPoint);
  LinkButton.SetBounds(30, 390, 116, 52);
  LinkButton.SetImage(ExtractAndLoad('button2.png'));
  LinkButton.OnMouseEnter(@CommonOnEnter);
  LinkButton.OnMouseLeave(@CommonOnLeave);
  LinkButton.OnClick(@CommonOnClick);

  ProgressBar.FCreate(FormLayer.Handle);
  ProgressBar.SetBounds(50, 284, 395, 36);
  ProgressBar.SetBackImage(ExtractAndLoad('progress_back.png'));
  ProgressBar.SetImage(ExtractAndLoad('progress_fill.png'));
  ProgressBar.Min(0);
  ProgressBar.Max(100);
  ProgressBar.Value(35);
  ProgressBar.OnMouseEnter(@CommonOnEnter);
  ProgressBar.OnMouseLeave(@CommonOnLeave);
  ProgressBar.OnClick(@CommonOnClick);

  ProgressBarTxt.FCreate(FormLayer.Handle);
  ProgressBarTxt.SetBounds(540, 279, 100, 44);
  ProgressBarTxt.Text('35%');
  ProgressBarTxt.FontSetting('Bahnschrift', 18, ALCornflowerBlue);
  ProgressBarTxt.TextSetting(False, txLeading, txCenter);

  ArcDial.FCreate(FormLayer.Handle);
  ArcDial.SetBounds(480, 279, 44, 44);
  ArcDial.Value(35);
  ArcDial.OnChange(@ProgressBarOnChange);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(600, 450);

  FMXDesigning;

  MusicPlayer.FCreate(FMXForm.Handle, ExtractAndLoad('Music1.mp3'), True);

  FMXForm.Show;
end;

procedure CurPageChanged(CurPageID : Integer);
begin
  RadioButtonOnChange(nil);
end;
