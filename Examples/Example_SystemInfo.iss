[Setup]
AppName=FMXBridge_SystemInfo
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
//SetupArchitecture=x64
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

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  SystemInfo       : FSystemInfo;

  UtilLbl          : FLabel;

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

  SystemInfo       := InitSystemInfo;

  UtilLbl          := InitLabelHandle;

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

function UserTypeToStr(AType: TUserType): string;
begin
  case AType of
    utUser:   Result:= 'User';
    utAdmin:  Result:= 'Admin';
    utGuest:  Result:= 'Guest';
    utSystem: Result:= 'System';
  else
    Result:= 'Unknown';
  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0)

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  UtilLbl.FCreate(FormLayer.Handle);
  UtilLbl.SetBounds(70, 50, 555, 440);
  UtilLbl.Text('OS Name:'           + #9#9 + SystemInfo.OSCaption + #13 +
               'OS Build:'          + #9#9 + SystemInfo.OSBuildNumber + #13 +
               'OS Version:'        + #9#9 + SystemInfo.OSVersion + #13#13 +
               'GPU Name:'          + #9#9 + SystemInfo.GPUName + #13 +
               'GPU Memory:'        + #9#9 + MbOrTb(SystemInfo.GPUMemory, 1, 'Mb', 'Gb', 'Tb') + #13 +
               'FeatureLevel:'      + #9#9 + SystemInfo.GPUFeatureLevel + #13#13 +
               'RAM Total:'         + #9#9 + MbOrTb(SystemInfo.TotalRam, 2, 'Mb', 'Gb', 'Tb') + #13 +
               'RAM Free:'          + #9#9 + MbOrTb(SystemInfo.FreeRam, 2, 'Mb', 'Gb', 'Tb') + #13 +
               'RAM Used:'          + #9#9 + MbOrTb(SystemInfo.UsedRam, 2, 'Mb', 'Gb', 'Tb') + #13#13 +
               'CPU Name:'          + #9#9 + SystemInfo.CPUName + #13 +
               'CPU Cores:'         + #9#9 + IntToStr(SystemInfo.CPUCores) + #13 +
               'CPU Threads:'       + #9#9 + IntToStr(SystemInfo.CPUThreads) + #13 +
               'CPU Speed:'         + #9#9 + MHzOrGHz(SystemInfo.CPUSpeed, 2) + #13#13 +
               'User Name:'         + #9#9 + SystemInfo.UserName + #13 +
               'User Domain:'       + #9#9 + SystemInfo.UserDomain + #13 +
               'User ProfilePath:'  + #9 + SystemInfo.UserProfilePath + #13 +
               'User Type:'         + #9#9 + UserTypeToStr(SystemInfo.UserType));
  UtilLbl.FontSetting('Consolas', 17, $FFFF4500);
  UtilLbl.FontStyle([fsBold]);
  UtilLbl.TextSetting(True, txLeading, txLeading);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btTabbed, True, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(200);
  ExitForm.Width(400);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
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
  EmptyWizardForm(640, 510);
  FMXDesigning;
  FMXForm.Show;
end;
