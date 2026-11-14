[Setup]
AppName=FMXBridge_SystemInfo
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
//SetupArchitecture=x64
Compression=zip

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

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  SystemInfo       := InitSystemInfo;

  UtilLbl          := InitLabelHandle;
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

    TObject(TitleBar.GetObjectMinBtn):
      FMXForm.Minimize;

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.Close;

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

function BoolToText(AValue: Boolean): string;
begin
  if AValue then
    Result:= 'True'
  else
    Result:= 'False';
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0)

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  UtilLbl.FCreate(FormLayer.Handle);
  UtilLbl.SetBounds(70, 55, 565, 555);

  UtilLbl.Text(
    'OS Name:'              + #9#9 + SystemInfo.OSCaption + #13 +
    'OS Build:'             + #9#9 + SystemInfo.OSBuildNumber + #13 +
    'OS Version:'           + #9#9 + SystemInfo.OSVersion + #13 +
    'Get Major Version:'    + #9   + IntToStr(SystemInfo.GetOSMajorVersion) + #13 +
    'Get Build Number:'     + #9   + IntToStr(SystemInfo.GetOSBuildNumber) + #13 +
    'Is Windows 11:'        + #9#9 + BoolToText(SystemInfo.IsWindows11) + #13#13 +

    'GPU Name:'             + #9#9 + SystemInfo.GPUName + #13 +
    'GPU Memory:'           + #9#9 + MbOrTb(SystemInfo.GPUMemory, 1, 'Mb', 'Gb', 'Tb') + #13 +
    'FeatureLevel:'         + #9#9 + SystemInfo.GPUFeatureLevel + #13#13 +

    'RAM Total:'            + #9#9 + MbOrTb(SystemInfo.TotalRam, 2, 'Mb', 'Gb', 'Tb') + #13 +
    'RAM Free:'             + #9#9 + MbOrTb(SystemInfo.FreeRam, 2, 'Mb', 'Gb', 'Tb') + #13 +
    'RAM Used:'             + #9#9 + MbOrTb(SystemInfo.UsedRam, 2, 'Mb', 'Gb', 'Tb') + #13#13 +

    'CPU Name:'             + #9#9 + SystemInfo.CPUName + #13 +
    'CPU Cores:'            + #9#9 + IntToStr(SystemInfo.CPUCores) + #13 +
    'CPU Threads:'          + #9#9 + IntToStr(SystemInfo.CPUThreads) + #13 +
    'CPU Speed:'            + #9#9 + MHzOrGHz(SystemInfo.CPUSpeed, 2) + #13#13 +

    'User Name:'            + #9#9 + SystemInfo.UserName + #13 +
    'User Country:'         + #9#9 + SystemInfo.UserCountryName + #13 +
    'User Domain:'          + #9#9 + SystemInfo.UserDomain + #13 +
    'User ProfilePath:'     + #9   + SystemInfo.UserProfilePath + #13 +
    'User Type:'            + #9#9 + UserTypeToStr(SystemInfo.UserType) + #13 +
    'User Is Elevated:'     + #9   + BoolToText(SystemInfo.UserIsElevated));

  UtilLbl.FontSetting('Consolas', 17, $FFFF4500);
  UtilLbl.FontStyle([fsBold]);
  UtilLbl.TextSetting(True, txLeading, txLeading);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(680, 640);

  FMXDesigning;
  FMXForm.Show;
end;