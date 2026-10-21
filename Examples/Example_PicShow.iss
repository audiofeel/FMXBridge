[Setup]
AppName=FMXBridge_PicShow
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

Source: "Files\Images\wallpapers??.jpg"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  SlideShow        : FPicShow;
  ComboBox         : FComboEdit;

  StartBtn         : FButton;
  StopBtn          : FButton;
  CheckBox         : FCheckBox;

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

  SlideShow        := InitPicShowHandle;
  ComboBox         := InitComboEditHandle;

  StartBtn         := InitButtonHandle;
  StopBtn          := InitButtonHandle;
  CheckBox         := InitCheckBoxHandle;

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

    TObject(StartBtn.GetObject):
      SlideShow.Start;

    TObject(StopBtn.GetObject):
      SlideShow.Stop;

  end;
end;

procedure EffectChange(Sender: TObject);
begin
  SlideShow.SetEffect(ComboBox.GetItem(ComboBox.GetItemIndex));
end;

procedure RandomChange(Sender: TObject);
begin
  SlideShow.SetRandom(CheckBox.IsChecked);
end;

procedure FMXDesigning;
var
  i: Integer;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0)

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF0E192B);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  SlideShow.FCreate(FormLayer.Handle);
  SlideShow.SetBounds(23, 51, 593, 333);
  SlideShow.SetDelay(3);
  SlideShow.SetDuration(1.3);
  for i:= 1 to 11 do
    SlideShow.AddImage(ExtractAndLoad('wallpapers' + IntToStr(i) + '.jpg'));
  SlideShow.SetBorder($FF1E365D, 1);

  ComboBox.FCreate(FormLayer.Handle);
  ComboBox.SetBounds(23, 404, 340, 22);
  for i:= 0 to SlideShow.GetEffectsCount - 1 do
    ComboBox.AddItem(SlideShow.GetEffectsName(i));
  ComboBox.SetItemIndex(0);
  ComboBox.OnChange(@EffectChange);

  StartBtn.FCreate(FormLayer.Handle);
  StartBtn.Position(400, 404);
  StartBtn.Text('Start');
  StartBtn.OnClick(@CommonOnClick);

  StopBtn.FCreate(FormLayer.Handle);
  StopBtn.Position(400, 435);
  StopBtn.Text('Stop');
  StopBtn.OnClick(@CommonOnClick);

  CheckBox.FCreate(FormLayer.Handle);
  CheckBox.SetBounds(505, 419, 110, 20);
  CheckBox.Text(' Effect Shuffle');
  CheckBox.OnChange(@RandomChange);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btTabbed, True, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(200);
  ExitForm.Width(400);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($FF0E192B);
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

procedure CurPageChanged(CurPageID : Integer);
begin
  EffectChange(nil);
end;
