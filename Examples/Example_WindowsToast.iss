[Setup]
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

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm   : FForm;
  FormLayer : FLayout;
  TitleBar  : FWinTitleBar;
  BtnToast  : FButton;

  Toast     : FToast;

procedure FMXInit;
begin
  FMXForm   := InitFormHandle;
  FormLayer := InitLayoutHandle;
  TitleBar  := InitWinTitleBarHandle;
  BtnToast  := InitButtonHandle;

  Toast     := InitToastHandle;
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

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.Close;

    TObject(BtnToast.GetObject):
      Toast.Show('FMXBridge Toast', 'This notification was sent by the running Setup.exe process.');

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALRebeccaPurple, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), ALMediumSlateBlue);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF0E192B);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  BtnToast.FCreate(FormLayer.Handle);
  BtnToast.SetBounds(280, 200, 110, 32);
  BtnToast.Text('Notification');
  BtnToast.StyleLookUp('buttonstyle_accent');
  BtnToast.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(670, 520);
  FMXDesigning;

  FMXForm.Show;
end;
