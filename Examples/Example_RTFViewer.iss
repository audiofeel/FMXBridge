; =============================================================================
; FMXBridge - RTF Viewer Test
; Uses the native RichEdit viewer hosted inside an FMX form.
; =============================================================================

[Setup]
AppName=FMXBridge_RTFViewer_Test
AppVersion=1.0
CreateAppDir=no
DisableProgramGroupPage=yes
SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\RTFViewer\Install_Information.rtf"; Flags: dontcopy

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
  FMXForm.Caption('FMXBridge - RTF Viewer Test');

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.Height(42);
  TitleBar.SetColor($FF202C40);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  RTFViewer.FCreate(FormLayer.Handle);
  RTFViewer.SetBounds(18, 58, 924, 664);
  RTFViewer.Color(ALWhite);
  RTFViewer.Border(True);
  RTFViewer.Padding(14, 12, 14, 12);
  RTFViewer.ScrollBars(rtfScrollVertical);
  RTFViewer.AutoOpenLink(False);
  RTFViewer.OnLinkClick(@RTFViewerLinkClick);
  RTFViewer.LoadFromFile(ExtractAndLoad('Install_Information.rtf'));
  RTFViewer.BringToFront;
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(960, 740);
  FMXDesigning;
  FMXForm.Show;
  RTFViewer.SetFocus;
end;
