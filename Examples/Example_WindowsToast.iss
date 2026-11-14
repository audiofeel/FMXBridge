[Setup]
AppId={{C673EC79-6BD6-4965-A991-084DE16DEB25}
AppName=FMXBridge_WindowsToast
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy
Source: "Files\Toast\*"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm      : FForm;
  FormLayer    : FLayout;
  TitleBar     : FWinTitleBar;
  BtnToast     : FButton;
  BtnToastImg  : FButton;
  BtnToastLogo : FButton;

  Toast        : FToast;

procedure FMXInit;
begin
  FMXForm      := InitFormHandle;
  FormLayer    := InitLayoutHandle;
  TitleBar     := InitWinTitleBarHandle;
  BtnToast     := InitButtonHandle;
  BtnToastImg  := InitButtonHandle;
  BtnToastLogo := InitButtonHandle;

  Toast        := InitToastHandle;
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
  Confirm := False;
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectMinBtn):
      FMXForm.Minimize;

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.Close;

    TObject(BtnToast.GetObject):
      Toast.Show('FMXBridge Toast', 'This notification was sent by the running Setup.exe process.');

    TObject(BtnToastImg.GetObject):
      Toast.ShowImage('FMXBridge Toast', 'This notification contains a hero image.', ExtractAndLoad('Hero_364x180.png'));

    TObject(BtnToastLogo.GetObject):
      Toast.ShowLogo('FMXBridge Toast', 'This notification uses AppLogoOverride.', ExtractAndLoad('ToastLogo_48x48.png'));

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALDarkSlateBlue, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), ALSkyBlue);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF0E192B);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Toast.SetAppInfo('{#SetupSetting("AppId")}', '{#SetupSetting('AppName')}', ExtractAndLoad('AppIcon_32x32.png'));

  BtnToast.FCreate(FormLayer.Handle);
  BtnToast.SetBounds(260, 100, 140, 32);
  BtnToast.Text('Notification');
  BtnToast.StyleLookUp('buttonstyle_accent');
  BtnToast.OnClick(@CommonOnClick);

  BtnToastImg.FCreate(FormLayer.Handle);
  BtnToastImg.SetBounds(260, 200, 140, 32);
  BtnToastImg.Text('Notification Image');
  BtnToastImg.StyleLookUp('buttonstyle_accent');
  BtnToastImg.OnClick(@CommonOnClick);

  BtnToastLogo.FCreate(FormLayer.Handle);
  BtnToastLogo.SetBounds(260, 300, 140, 32);
  BtnToastLogo.Text('Notification Logo');
  BtnToastLogo.StyleLookUp('buttonstyle_accent');
  BtnToastLogo.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(670, 500);
  FMXDesigning;

  FMXForm.Show;
end;
