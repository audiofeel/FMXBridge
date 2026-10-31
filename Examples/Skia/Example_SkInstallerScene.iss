#define ShaderFile "installer-scene.sksl"

[Setup]
AppId=FMXBridge_Skia_InstallerScene
AppName=FMXBridge Skia Installer Scene
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\sk4d_x64.dll";      DestName: "sk4d.dll";      Flags: dontcopy nocompression
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy nocompression
#else
  Source: "Modules\sk4d_x86.dll";      DestName: "sk4d.dll";      Flags: dontcopy nocompression
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy nocompression
#endif

Source: "Files\Shaders\{#ShaderFile}"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

; Real Setup file operations used to make the native progress callback observable.
; These sample assets are copied to {tmp} and removed automatically after Setup.
Source: "Files\Fonts\bonheur-royale-regular.ttf"; DestDir: "{tmp}\FMXBridgeSkiaScene"; Flags: deleteafterinstall
Source: "Files\Fonts\nunito-extrabold.ttf"; DestDir: "{tmp}\FMXBridgeSkiaScene"; Flags: deleteafterinstall
Source: "Files\Svg\lion.svg"; DestDir: "{tmp}\FMXBridgeSkiaScene"; Flags: deleteafterinstall
Source: "Files\AnimatedImages\rocket.json"; DestDir: "{tmp}\FMXBridgeSkiaScene"; Flags: deleteafterinstall

[Code]
#include "Modules\FMXBridgeHandle.iss"
#include "Modules\FMXSkiaHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  WinTB            : FWinTitleBar;
  InstallerScene   : FSkAnimatedPaintBox;

  TitleText        : FText;
  SubtitleText     : FText;
  HeadlineText     : FText;
  DetailText       : FText;
  PercentText      : FText;
  PercentCaption   : FText;
  ReadyLabel       : FText;
  DeployLabel      : FText;
  FinalizeLabel    : FText;
  DoneLabel        : FText;

  InstallProgress  : Double;
  InstallStage     : Integer;
  SceneUniformsOK  : Boolean;

procedure FMXInit;
begin
  FMXForm        := InitFormHandle;
  FormLayer      := InitLayoutHandle;
  WinTB          := InitWinTitleBarHandle;
  InstallerScene := InitSkAnimatedPaintBox;

  TitleText      := InitTextHandle;
  SubtitleText   := InitTextHandle;
  HeadlineText   := InitTextHandle;
  DetailText     := InitTextHandle;
  PercentText    := InitTextHandle;
  PercentCaption := InitTextHandle;
  ReadyLabel     := InitTextHandle;
  DeployLabel    := InitTextHandle;
  FinalizeLabel  := InitTextHandle;
  DoneLabel      := InitTextHandle;
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

procedure WindowCloseClick(Sender: TObject);
begin
  WizardForm.CancelButton.OnClick(Sender);
end;

procedure SetSceneState(AStage: Integer; const AHeadline, ADetail: String;
  AProgress: Double);
var
  P: Integer;
begin
  if AProgress < 0 then
    AProgress := 0
  else if AProgress > 1 then
    AProgress := 1;

  InstallStage := AStage;
  InstallProgress := AProgress;
  P := Round(InstallProgress * 100);

  InstallerScene.BeginUniformUpdate;
  SceneUniformsOK := InstallerScene.SetUniformFloat('uProgress', InstallProgress);
  SceneUniformsOK := InstallerScene.SetUniformInt('uStage', InstallStage) and SceneUniformsOK;
  InstallerScene.EndUniformUpdate;

  if not SceneUniformsOK then
    Log('Skia installer scene: failed to update one or more runtime uniforms.');

  HeadlineText.Text(AHeadline);
  DetailText.Text(ADetail);
  PercentText.Text(IntToStr(P) + '%');
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FF0B1020, '', True);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  InstallerScene.FCreate(FormLayer.Handle);
  InstallerScene.Align(Client);
  InstallerScene.LoadShader(ExtractAndLoad('{#ShaderFile}'));
  InstallerScene.InteractWithMouse(False);
  InstallerScene.SendToBack;

  WinTB.FCreate(FormLayer.Handle, True);
  WinTB.CloseBtnOnClick(@WindowCloseClick);

  TitleText.FCreate(FormLayer.Handle);
  TitleText.SetBounds(48, 76, 560, 42);
  TitleText.FontSetting('Segoe UI Variable Display', 27, $FFF4F7FF);
  TitleText.Text('NOVA  /  INSTALLATION');
  TitleText.TextSetting(False, txLeading, txCenter);
  TitleText.HitTest(False);

  SubtitleText.FCreate(FormLayer.Handle);
  SubtitleText.SetBounds(51, 119, 570, 28);
  SubtitleText.FontSetting('Segoe UI', 12, $FF8F9DB5);
  SubtitleText.Text('DEPLOYMENT SEQUENCE  |  FMXBRIDGE + SKIA');
  SubtitleText.TextSetting(False, txLeading, txCenter);
  SubtitleText.HitTest(False);

  HeadlineText.FCreate(FormLayer.Handle);
  HeadlineText.SetBounds(54, 222, 445, 46);
  HeadlineText.FontSetting('Segoe UI Variable Display', 25, $FFF4F7FF);
  HeadlineText.Text('Waiting for Setup');
  HeadlineText.TextSetting(False, txLeading, txCenter);
  HeadlineText.HitTest(False);

  DetailText.FCreate(FormLayer.Handle);
  DetailText.SetBounds(57, 275, 440, 58);
  DetailText.FontSetting('Segoe UI', 13, $FFA8B5C9);
  DetailText.Text('The installation scene will follow the actual Setup events.');
  DetailText.TextSetting(True, txLeading, txLeading);
  DetailText.HitTest(False);

  PercentText.FCreate(FormLayer.Handle);
  PercentText.SetBounds(570, 265, 190, 62);
  PercentText.FontSetting('Segoe UI Variable Display', 43, $FFF4F7FF);
  PercentText.Text('0%');
  PercentText.TextSetting(False, txCenter, txCenter);
  PercentText.HitTest(False);

  PercentCaption.FCreate(FormLayer.Handle);
  PercentCaption.SetBounds(583, 327, 164, 22);
  PercentCaption.FontSetting('Segoe UI', 10, $FF9CAAC0);
  PercentCaption.Text('SETUP PROGRESS');
  PercentCaption.TextSetting(False, txCenter, txCenter);
  PercentCaption.HitTest(False);

  ReadyLabel.FCreate(FormLayer.Handle);
  ReadyLabel.SetBounds(53, 454, 150, 25);
  ReadyLabel.FontSetting('Segoe UI', 10, $FFB8C5D9);
  ReadyLabel.Text('01  READY');
  ReadyLabel.TextSetting(False, txLeading, txCenter);
  ReadyLabel.HitTest(False);

  DeployLabel.FCreate(FormLayer.Handle);
  DeployLabel.SetBounds(245, 454, 150, 25);
  DeployLabel.FontSetting('Segoe UI', 10, $FFB8C5D9);
  DeployLabel.Text('02  DEPLOY');
  DeployLabel.TextSetting(False, txLeading, txCenter);
  DeployLabel.HitTest(False);

  FinalizeLabel.FCreate(FormLayer.Handle);
  FinalizeLabel.SetBounds(445, 454, 150, 25);
  FinalizeLabel.FontSetting('Segoe UI', 10, $FFB8C5D9);
  FinalizeLabel.Text('03  FINALIZE');
  FinalizeLabel.TextSetting(False, txLeading, txCenter);
  FinalizeLabel.HitTest(False);

  DoneLabel.FCreate(FormLayer.Handle);
  DoneLabel.SetBounds(645, 454, 150, 25);
  DoneLabel.FontSetting('Segoe UI', 10, $FFB8C5D9);
  DoneLabel.Text('04  COMPLETE');
  DoneLabel.TextSetting(False, txLeading, txCenter);
  DoneLabel.HitTest(False);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpReady then
    SetSceneState(0, 'Ready to install', 'Waiting for the user to start the installation.', 0);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  case CurStep of
    ssInstall:
      begin
        SetSceneState(1, 'Installing application', 'Setup is extracting files and applying installation entries.', 0);
      end;

    ssPostInstall:
      SetSceneState(2, 'Finalizing installation', 'The main file and registry operations have completed.', 1);

    ssDone:
      begin
        SetSceneState(3, 'Installation complete', 'Setup finished successfully.', 1);
      end;
  end;
end;

procedure CurInstallProgressChanged(CurProgress, MaxProgress: Integer);
var
  P: Double;
begin
  // Ignore late progress notifications after Setup has entered finalization.
  if (InstallStage <> 1) or (MaxProgress <= 0) then
    Exit;

  P := CurProgress / MaxProgress;
  SetSceneState(1, 'Installing application',
    'Extracting files, creating shortcuts and writing setup data.',
    P);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(900, 560);
  FMXDesigning;
  FMXForm.Show;

  InstallProgress := 0;
  InstallStage := 0;
  SetSceneState(0, 'Ready to install',
    'The scene is idle until Inno Setup starts its installation phase.', 0);

  InstallerScene.RunAnim;
end;
