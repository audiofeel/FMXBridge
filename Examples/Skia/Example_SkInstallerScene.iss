#define ShaderFile "installer-scene.sksl"

[Setup]
AppId=FMXBridge_Skia_InstallerScene
AppName=FMXBridge Skia Installer Scene
AppVersion=1.0
CreateAppDir=no
Uninstallable=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

; The native wizard remains hidden. The Skia scene is the complete UI.
; Keep Ready and Finished internally for the shader-rendered actions.
DisableWelcomePage=yes
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyMemo=yes
AllowCancelDuringInstall=yes

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

; Actual Setup file operations make CurInstallProgressChanged observable.
; These sample assets are copied to {tmp} and removed after Setup.
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
  DialogTitle      : FText;
  DialogDetail     : FText;

  InstallProgress  : Double;
  InstallStage     : Integer;
  PressedButton    : Integer;
  SceneDialogOpen  : Boolean;
  SceneUniformsOK  : Boolean;

procedure FMXInit;
begin
  FMXForm        := InitFormHandle;
  FormLayer      := InitLayoutHandle;
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
  DialogTitle    := InitTextHandle;
  DialogDetail   := InitTextHandle;
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
  // Confirmation is rendered by the SkSL scene, not by an Inno dialog.
  Cancel := True;
  Confirm := False;
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
    Log('Skia installer scene: failed to update progress uniforms.');

  HeadlineText.Text(AHeadline);
  DetailText.Text(ADetail);
  PercentText.Text(IntToStr(P) + '%');
end;

procedure SetCancelDialog(AVisible: Boolean);
begin
  SceneDialogOpen := AVisible;
  PressedButton := 0;

  InstallerScene.BeginUniformUpdate;
  InstallerScene.SetUniformInt('uDialog', Ord(AVisible));
  InstallerScene.SetUniformInt('uPressedButton', 0);
  InstallerScene.EndUniformUpdate;

  DialogTitle.Visible(AVisible);
  DialogDetail.Visible(AVisible);
end;

function HitTestSceneButton(X, Y: Single): Integer;
begin
  Result := 0;

  if (not SceneDialogOpen) and (X >= 840) and (X <= 876) and
    (Y >= 8) and (Y <= 40) then
  begin
    Result := 5;
    Exit;
  end;

  if SceneDialogOpen then
  begin
    // These rectangles match the SkSL confirmation buttons.
    if (X >= 286) and (X <= 426) and (Y >= 304) and (Y <= 352) then
      Result := 3
    else if (X >= 474) and (X <= 614) and (Y >= 304) and (Y <= 352) then
      Result := 4;
    Exit;
  end;

  // Primary Install / Finish button.
  if (X >= 58) and (X <= 242) and (Y >= 374) and (Y <= 426) then
  begin
    if (InstallStage = 0) or (InstallStage = 3) then
      Result := 1;
  end;

  // Secondary Cancel button, available until the Finished page.
  if (X >= 255) and (X <= 385) and (Y >= 374) and (Y <= 426) then
  begin
    if InstallStage <= 2 then
      Result := 2;
  end;
end;

procedure SceneMouseEnter(Sender: TObject);
begin
  InstallerScene.SetUniformInt('uMouseInside', 1);
end;

procedure SceneMouseLeave(Sender: TObject);
begin
  InstallerScene.SetUniformInt('uMouseInside', 0);
end;

procedure SceneMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  PressedButton := 0;

  if (Button = mbLeft) and (not SceneDialogOpen) and
    (Y >= 0) and (Y <= 48) and (X < 830) then
  begin
    FMXForm.StartWindowDrag;
    Exit;
  end;

  if Button = mbLeft then
    PressedButton := HitTestSceneButton(X, Y);

  InstallerScene.SetUniformInt('uPressedButton', PressedButton);
end;

procedure SceneMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  ReleasedButton: Integer;
begin
  ReleasedButton := HitTestSceneButton(X, Y);

  InstallerScene.SetUniformInt('uPressedButton', 0);

  if (Button = mbLeft) and (PressedButton <> 0) and
    (PressedButton = ReleasedButton) then
  begin
    case ReleasedButton of
      1:
        begin
          // On Ready this starts installation; on Finished it closes Setup.
          WizardForm.NextButton.OnClick(Sender);
        end;

      2:
        SetCancelDialog(True);

      3:
        begin
          // The custom SkSL confirmation has been accepted.
          SetCancelDialog(False);
          WizardForm.CancelButton.OnClick(Sender);
        end;

      4:
        SetCancelDialog(False);

      5:
        begin
          if InstallStage = 3 then
            WizardForm.NextButton.OnClick(Sender)
          else
            SetCancelDialog(True);
        end;
    end;
  end;

  PressedButton := 0;
end;

procedure FMXDesigning;
begin
  // FCreateBlankForm creates the separate top-level FMX window and hides
  // the native Inno Setup window. All visible interaction is on this form.
  FMXForm.FCreateImageForm(WizardForm.Handle, $FF0B1020, '', False);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  InstallerScene.FCreate(FormLayer.Handle);
  InstallerScene.Align(Client);
  InstallerScene.LoadShader(ExtractAndLoad('{#ShaderFile}'));
  InstallerScene.InteractWithMouse(True);
  InstallerScene.OnMouseDown(@SceneMouseDown);
  InstallerScene.OnMouseUp(@SceneMouseUp);
  InstallerScene.OnMouseEnter(@SceneMouseEnter);
  InstallerScene.OnMouseLeave(@SceneMouseLeave);
  InstallerScene.SendToBack;

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
  HeadlineText.Text('Ready to install');
  HeadlineText.TextSetting(False, txLeading, txCenter);
  HeadlineText.HitTest(False);

  DetailText.FCreate(FormLayer.Handle);
  DetailText.SetBounds(57, 275, 440, 58);
  DetailText.FontSetting('Segoe UI', 13, $FFA8B5C9);
  DetailText.Text('Press INSTALL to begin the deployment sequence.');
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
  ReadyLabel.SetBounds(55, 454, 150, 25);
  ReadyLabel.FontSetting('Segoe UI', 10, $FFB8C5D9);
  ReadyLabel.Text('01  READY');
  ReadyLabel.TextSetting(False, txLeading, txCenter);
  ReadyLabel.HitTest(False);

  DeployLabel.FCreate(FormLayer.Handle);
  DeployLabel.SetBounds(267, 454, 150, 25);
  DeployLabel.FontSetting('Segoe UI', 10, $FFB8C5D9);
  DeployLabel.Text('02  DEPLOY');
  DeployLabel.TextSetting(False, txLeading, txCenter);
  DeployLabel.HitTest(False);

  FinalizeLabel.FCreate(FormLayer.Handle);
  FinalizeLabel.SetBounds(478, 454, 150, 25);
  FinalizeLabel.FontSetting('Segoe UI', 10, $FFB8C5D9);
  FinalizeLabel.Text('03  FINALIZE');
  FinalizeLabel.TextSetting(False, txLeading, txCenter);
  FinalizeLabel.HitTest(False);

  DoneLabel.FCreate(FormLayer.Handle);
  DoneLabel.SetBounds(690, 454, 150, 25);
  DoneLabel.FontSetting('Segoe UI', 10, $FFB8C5D9);
  DoneLabel.Text('04  COMPLETE');
  DoneLabel.TextSetting(False, txLeading, txCenter);
  DoneLabel.HitTest(False);

  DialogTitle.FCreate(FormLayer.Handle);
  DialogTitle.SetBounds(270, 224, 360, 34);
  DialogTitle.FontSetting('Segoe UI Variable Display', 21, $FFF4F7FF);
  DialogTitle.Text('CANCEL INSTALLATION?');
  DialogTitle.TextSetting(False, txCenter, txCenter);
  DialogTitle.HitTest(False);
  DialogTitle.Visible(False);

  DialogDetail.FCreate(FormLayer.Handle);
  DialogDetail.SetBounds(275, 265, 350, 34);
  DialogDetail.FontSetting('Segoe UI', 12, $FFB8C5D9);
  DialogDetail.Text('The current installation will be stopped.');
  DialogDetail.TextSetting(False, txCenter, txCenter);
  DialogDetail.HitTest(False);
  DialogDetail.Visible(False);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpReady then
    SetSceneState(0, 'Ready to install',
      'Press INSTALL to begin the deployment sequence.', 0);

  if CurPageID = wpInstalling then
    SetCancelDialog(False);

  if CurPageID = wpFinished then
  begin
    SetCancelDialog(False);
    SetSceneState(3, 'Installation complete',
      'All Setup operations have completed successfully.', 1);
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  case CurStep of
    ssInstall:
      SetSceneState(1, 'Installing application',
        'Setup is extracting files and applying installation entries.', 0);

    ssPostInstall:
      SetSceneState(2, 'Finalizing installation',
        'The main file and registry operations have completed.', 1);
  end;
end;

procedure CurInstallProgressChanged(CurProgress, MaxProgress: Integer);
var
  P: Double;
begin
  if (InstallStage <> 1) or (MaxProgress <= 0) then
    Exit;

  P := CurProgress / MaxProgress;
  SetSceneState(1, 'Installing application',
    'Extracting files, creating shortcuts and writing Setup data.', P);
end;

procedure InitializeWizard();
begin
  // With the optional wizard pages disabled, the hidden wizard is at wpReady.
  // The SkSL scene is shown immediately and supplies Install/Cancel itself.
  WizardForm.Position := poScreenCenter;
  WizardForm.Width := 900;
  WizardForm.Height := 560;

  InstallProgress := 0;
  InstallStage := 0;
  PressedButton := 0;
  SceneDialogOpen := False;

  FMXDesigning;
  SetSceneState(0, 'Ready to install',
    'Press INSTALL to begin the deployment sequence.', 0);

  InstallerScene.SetUniformInt('uDialog', 0);
  InstallerScene.SetUniformInt('uPressedButton', 0);
  InstallerScene.SetUniformInt('uMouseInside', 0);

  FMXForm.Show;
  InstallerScene.RunAnim;
end;
