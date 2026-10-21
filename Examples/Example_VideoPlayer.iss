[Setup]
AppName=FMXBridge_VideoPlayer
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
Source: "Files\Video\test.avi"; Flags: dontcopy nocompression

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  VideoPlayer      : FMediaPlayer;

  FormBottomBar    : FStatusBar;
  VolumeTrackbar   : FTrackbar;
  Text             : FLabel;
  LoopCheckBox     : FCheckBox;
  Button           : array [1..3] of FButton;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  VolumeTrackbar   := InitTrackBarHandle;

  FormBottomBar    := InitStatusBarHandle;
  Text             := InitLabelHandle;
  VideoPlayer      := InitMediaPlayer;
  LoopCheckBox     := InitCheckBoxHandle;
  for i:= 1 to 3 do Button[i]:= InitButtonHandle;

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

    TObject(Button[1].GetObject):
    begin
      if VideoPlayer.IsPaused then
      begin
        VideoPlayer.Resume
        Button[1].Text('Play');
      end else
        VideoPlayer.Play;
    end;

    TObject(Button[2].GetObject):
    begin
      if VideoPlayer.IsPlaying then
        VideoPlayer.Stop;
    end;

    TObject(Button[3].GetObject):
    begin
      if VideoPlayer.IsPlaying then
      begin
        VideoPlayer.Pause;
        Button[1].Text('Resume');
      end;
    end;

  end;
end;

procedure TrackbarOnChange(Sender: TObject);
begin
  Text.Text(format('Volume:  %0.1f%%', [VolumeTrackbar.GetValue]));
  VideoPlayer.Volume(VolumeTrackbar.GetValue / 100);
end;

procedure LoopOnChange(Sender: TObject);
begin
  if LoopCheckBox.IsChecked then
    VideoPlayer.Loop(True)
  else
    VideoPlayer.Loop(False);
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  VideoPlayer.FCreate(FormLayer.Handle, ExtractAndLoad('test.avi'), False);
  VideoPlayer.Align(Client);
  VideoPlayer.Volume(0.5);

  FormBottomBar.FCreate(FormLayer.Handle);
  FormBottomBar.Height(54);

  Text.FCreate(FormBottomBar.Handle);
  Text.SetBounds(45, 9, 130, 19);
  Text.TextSetting(False, txCenter, txLeading);
  Text.Text('Volume:  50.0%');

  VolumeTrackbar.FCreate(FormBottomBar.Handle);
  VolumeTrackbar.SetBounds(45, 24, 130, 19);
  VolumeTrackbar.Max(100);
  VolumeTrackbar.Value(50);
  VolumeTrackbar.OnChange(@TrackbarOnChange);

  LoopCheckBox.FCreate(FormBottomBar.Handle);
  LoopCheckBox.SetBounds(200, 16, 90, 19);
  LoopCheckBox.Text('Loop');
  LoopCheckBox.OnChange(@LoopOnChange);

  Button[1].FCreate(FormBottomBar.Handle);
  Button[1].SetBounds(290, 16, 90, 21);
  Button[1].Text('Play');
  Button[1].OnClick(@CommonOnClick);

  Button[2].FCreate(FormBottomBar.Handle);
  Button[2].SetBounds(390, 16, 90, 21);
  Button[2].Text('Stop');
  Button[2].OnClick(@CommonOnClick);

  Button[3].FCreate(FormBottomBar.Handle);
  Button[3].SetBounds(490, 16, 90, 21);
  Button[3].Text('Pause');
  Button[3].OnClick(@CommonOnClick);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.CloseBtnEnabled(False);
  ExitForm.AddMouseDownControls(ExitFormTitleBar.Handle);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FF767676);
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
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(442, 207, 72, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(640, 480);
  FMXDesigning;
  FMXForm.Show;
end;
