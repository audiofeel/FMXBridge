
[Setup]
AppName=FMXBridge_RTFViewer_Test
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

Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy
Source: "Files\RTFViewer\Info.rtf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm   : FForm;
  FormLayer : FLayout;
  TitleBar  : FWinTitleBar;
  RTFViewer : FRTFViewer;

procedure FMXInit;
begin
  FMXForm   := InitFormHandle;
  FormLayer := InitLayoutHandle;
  TitleBar  := InitWinTitleBarHandle;
  RTFViewer := InitRTFViewerHandle;
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

procedure RTFViewerLinkClick(Sender: TObject; const URL: WideString);
begin
  MsgBox('RTF link click received:' + #13#10 + URL, mbInformation, MB_OK);
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

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FF171B25, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF202C40);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  RTFViewer.FCreate(FormLayer.Handle);
  RTFViewer.SetBounds(30, 50, 610, 400);
  RTFViewer.Color(ALWhite);
  RTFViewer.Border(True);
  RTFViewer.Padding(5, 5, 5, 5);
  RTFViewer.ScrollBars(rtfScrollVertical);
  RTFViewer.AutoOpenLink(True);
  RTFViewer.OnLinkClick(@RTFViewerLinkClick);
  RTFViewer.LoadFromFile(ExtractAndLoad('Info.rtf'));
  RTFViewer.BringToFront;
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(670, 490);
  FMXDesigning;

  FMXForm.Show;
end;
