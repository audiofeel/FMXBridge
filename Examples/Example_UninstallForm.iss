[Setup]
AppName=FMXBridge_UninstallForm
AppVersion=1.0
DefaultDirName={autopf}\FMXBridge_UninstallForm
SetupIconFile=Files\setup.ico
DisableReadyPage=True
UninstallDisplayIcon={uninstallexe}
UninstallDisplayName={#SetupSetting('AppName')}
UninstallFilesDir={app}\Uninstall
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
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; DestDir: "{tmp}"; Flags: dontcopy
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; DestDir: "{app}\Uninstall"
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; DestDir: "{tmp}"; Flags: dontcopy
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; DestDir: "{app}\Uninstall";
#endif

Source: "Files\Styles\Transparent.fsf"; DestDir: "{tmp}"; Flags: dontcopy
Source: "Files\Styles\Transparent.fsf"; DestDir: "{app}\Uninstall"
Source: "Files\setup.ico"; DestDir: "{tmp}"; Flags: dontcopy
Source: "Files\setup.ico"; DestDir: "{app}\Uninstall"

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  DirEdit          : FEdit;
  FormBottomBar    : FStatusBar;
  InstallBtn       : FButton;

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

  DirEdit          := InitEditHandle;
  FormBottomBar    := InitStatusBarHandle;
  InstallBtn       := InitButtonHandle;

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

procedure DirEditOnChange(Sender: TObject);
begin
  DirEdit.Text(WizardForm.DirEdit.Text);
end;

procedure DirEditOnTyping(Sender: TObject);
begin
  WizardForm.DirEdit.Text:= DirEdit.GetText;
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectCloseBtn):
    begin
      if WizardForm.CurPageID = wpFinished then
        WizardForm.NextButton.OnClick(Sender)
      else
        ExitForm.Show;
    end;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

    TObject(DirEdit.GetSearchBtnObject):
      WizardForm.DirBrowseButton.OnClick(Sender);

    TObject(InstallBtn.GetObject):
      WizardForm.NextButton.OnClick(Sender);

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('Transparent.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($9A2C6373);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  DirEdit.FCreate(FormLayer.Handle);
  DirEdit.SetBounds(60, 146, 580, 27);
  DirEdit.Text(WizardForm.DirEdit.Text);
  DirEdit.AddSearchButton(@CommonOnClick);
  DirEdit.OnTyping(@DirEditOnTyping);

  FormBottomBar.FCreate(FormLayer.Handle);
  FormBottomBar.Height(54);

  InstallBtn.FCreate(FormBottomBar.Handle);
  InstallBtn.SetBounds(300, 15, 100, 27);
  InstallBtn.Text('Install');
  InstallBtn.OnClick(@CommonOnClick);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(179);
  ExitForm.Width(380);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($9A2C6373);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(50, 40, 290, 22);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.TextSetting(False, txLeading, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(50, 70, 290, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.TextSetting(False, txLeading, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Height(54);

  ExitFormYesBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormYesBtn.SetBounds(190, 15, 75, 23);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormNoBtn.SetBounds(276, 15, 75, 23);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(700, 450);

  FMXDesigning;
  FMXForm.Show;

  WizardForm.DirEdit.OnChange:= @DirEditOnChange;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  case CurPageID of

    wpSelectDir:
      InstallBtn.Text('Install');
    
    wpInstalling:
    begin
      InstallBtn.Text('Wait...');
      InstallBtn.Enabled(False);
    end;

    wpFinished:
    begin
      InstallBtn.Enabled(True);
      InstallBtn.Text('Finish');
    end;

  end;
end;

function InitFormHandleUn: FForm;
  external 'InitFormHandle@{tmp}\FMXBridge.dll uninstallonly stdcall delayload';
function InitLayoutHandleUn: FLayout;
  external 'InitLayoutHandle@{tmp}\FMXBridge.dll uninstallonly stdcall delayload';
function InitWinTitleBarHandleUn: FWinTitleBar;
  external 'InitWinTitleBarHandle@{tmp}\FMXBridge.dll uninstallonly stdcall delayload';
function InitLabelHandleUn: FLabel;
  external 'InitLabelHandle@{tmp}\FMXBridge.dll uninstallonly stdcall delayload';
function InitProgressBarHandleUn: FProgressBar;
  external 'InitProgressBarHandle@{tmp}\FMXBridge.dll uninstallonly stdcall delayload';
function InitStatusBarHandleUn: FStatusBar;
  external 'InitStatusBarHandle@{tmp}\FMXBridge.dll uninstallonly stdcall delayload';
function InitTimerUn: FTimer;
  external 'InitTimer@{tmp}\FMXBridge.dll uninstallonly stdcall delayload';

var
  UnForm: FForm;
  UnLayout: FLayout;
  UnTitleBar: FWinTitleBar;
  UnLabel1: FLabel;
  UnLabel2: FLabel;
  UnProgressBar: FProgressBar;
  UnBottomBar: FStatusBar;
  UnTimer: FTimer;
  UnDoStop: Boolean;

procedure UnFMXInit;
begin
  UnForm:= InitFormHandleUn;
  UnLayout:= InitLayoutHandleUn;
  UnTitleBar:= InitWinTitleBarHandleUn;
  UnLabel1:= InitLabelHandleUn;
  UnLabel2:= InitLabelHandleUn;
  UnProgressBar:= InitProgressBarHandleUn;
  UnBottomBar:= InitStatusBarHandleUn;
  UnTimer:= InitTimerUn;
  UnDoStop:= False;
end;

function InitializeUninstall: Boolean;
begin
  CopyFile(ExpandConstant('{app}\Uninstall\FMXBridge.dll'), ExpandConstant('{tmp}\FMXBridge.dll'), False);
  CopyFile(ExpandConstant('{app}\Uninstall\Transparent.fsf'), ExpandConstant('{tmp}\Transparent.fsf'), False);
  CopyFile(ExpandConstant('{app}\Uninstall\setup.ico'), ExpandConstant('{tmp}\setup.ico'), False);

  UnFMXInit;
  Result:= True;
end;

procedure DeinitializeUninstall();
begin
  FMXBridgeShutDownUn;
end;

procedure UnOnTimer(Sender: TObject);
begin
  if UnProgressBar.GetValue >= 100 then
  begin
    UnTimer.Enabled(False);
    UnDoStop:= True;
  end else
  begin
    UnProgressBar.Value(UnProgressBar.GetValue + 5);
    UnLabel2.Text(Format(' %.0f %%', [(UnProgressBar.GetValue * 100) / UnProgressBar.GetMax]));
  end;
end;

procedure UnFMXDesigning;
begin
  if FileExists(ExpandConstant('{tmp}\FMXBridge.dll')) then
  begin
    UnForm.FCreateBlankForm(UninstallProgressForm.Handle, 0, '', False);
    UnForm.LoadStyleFromFile(ExpandConstant('{tmp}\Transparent.fsf'), 0);

    UnLayout.FCreate(UnForm.Handle);
    UnLayout.Align(Client);

    UnTitleBar.FCreate(UnLayout.Handle, False);
    UnTitleBar.CloseBtnEnabled(False);

    UnLabel1.FCreate(UnLayout.Handle);
    UnLabel1.SetBounds(60, 120, 580, 20);
    UnLabel1.TextSetting(False, txLeading, txLeading);
    UnLabel1.Text('Uninstalling, Please wait ...');

    UnProgressBar.FCreate(UnLayout.Handle);
    UnProgressBar.SetBounds(60, 146, 580, 27);

    UnLabel2.FCreate(UnProgressBar.Handle);
    UnLabel2.Align(Center);
    UnLabel2.TextSetting(False, txCenter, txCenter);
    UnLabel2.Text('00%');

    UnBottomBar.FCreate(UnLayout.Handle);
    UnBottomBar.Height(54);

    UnTimer.FCreate(UnForm.Handle);
    UnTimer.Interval(100);
    UnTimer.OnTimer(@UnOnTimer);

  end else
  begin
    MsgBox(FmtSetupMessage(msgUninstallDataCorrupted, '"%1"', 'FMXBridge.dll', True), mbError, MB_OK);
  end;
end;

procedure InitializeUninstallProgressForm;
begin
  with UninstallProgressForm do
  begin
    Position := poScreenCenter;

    Height := 450;
    Width := 700;

    CancelButton.SetBounds(0,0,0,0);
  end;

  UnFMXDesigning;
  UnForm.Show;

  UnTimer.Enabled(True);
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  case CurUninstallStep of

    usUninstall:
    begin
      while not UnDoStop do
      begin
        Sleep(25);
        ProcessMessagesUn;
      end;
    end;

  end;
end;
