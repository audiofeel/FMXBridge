#define ShaderFile "wave-dashboard.sksl"

[Setup]
AppId=FMXBridge_Skia_WaveDashboard
AppName=FMXBridge Skia Wave Dashboard
AppVersion=1.0
CreateAppDir=no
Uninstallable=no
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

[Code]
#include "Modules\FMXBridgeHandle.iss"
#include "Modules\FMXSkiaHandle.iss"

var
  FMXForm           : FForm;
  FormLayer         : FLayout;
  SkScene           : FSkAnimatedPaintBox;
  ProgressTimer     : FTimer;

  TitleText         : FText;
  BrandText         : FText;
  PageTitleText     : FText;
  PageInfoText      : FText;
  FieldLabel1       : FText;
  FieldValue1       : FText;
  FieldLabel2       : FText;
  FieldValue2       : FText;
  PercentText       : FText;
  ProgressInfoText  : FText;
  MetricText        : FText;
  CpuTabText        : FText;
  RamTabText        : FText;
  DiskTabText       : FText;
  PrimaryButtonText : FText;
  SecondaryButtonText : FText;
  FooterText        : FText;

  DemoPage          : Integer;
  SelectedResource  : Integer;
  PressedButton     : Integer;
  DemoProgress      : Double;
  DemoPaused        : Boolean;

procedure FMXInit;
begin
  FMXForm             := InitFormHandle;
  FormLayer           := InitLayoutHandle;
  SkScene             := InitSkAnimatedPaintBox;
  ProgressTimer       := InitTimer;

  TitleText           := InitTextHandle;
  BrandText           := InitTextHandle;
  PageTitleText       := InitTextHandle;
  PageInfoText        := InitTextHandle;
  FieldLabel1         := InitTextHandle;
  FieldValue1         := InitTextHandle;
  FieldLabel2         := InitTextHandle;
  FieldValue2         := InitTextHandle;
  PercentText         := InitTextHandle;
  ProgressInfoText    := InitTextHandle;
  MetricText          := InitTextHandle;
  CpuTabText          := InitTextHandle;
  RamTabText          := InitTextHandle;
  DiskTabText         := InitTextHandle;
  PrimaryButtonText   := InitTextHandle;
  SecondaryButtonText := InitTextHandle;
  FooterText          := InitTextHandle;
end;

function InitializeSetup(): Boolean;
begin
  FMXInit;
  Result := True;
end;

procedure DeinitializeSetup();
begin
  ProgressTimer.Enabled(False);
  SkScene.StopAnim;
  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;

procedure CreateSceneText(var AText: FText; const AValue: WideString;
  X, Y, W, H: Single; FontSize: Single; FontColor: TAlphaColor;
  HorzAlign: TTextAlign);
begin
  AText.FCreate(FormLayer.Handle);
  AText.SetBounds(X, Y, W, H);
  AText.FontSetting('Segoe UI', FontSize, FontColor);
  AText.Text(AValue);
  AText.TextSetting(False, HorzAlign, txCenter);
  AText.HitTest(False);
end;

procedure UpdateDemoUniforms;
begin
  SkScene.BeginUniformUpdate;
  SkScene.SetUniformFloat('uProgress', DemoProgress);
  SkScene.SetUniformInt('uPage', DemoPage);
  SkScene.SetUniformInt('uResource', SelectedResource);
  SkScene.SetUniformInt('uPressedButton', PressedButton);
  SkScene.EndUniformUpdate;
end;

procedure UpdateMetricText;
begin
  case SelectedResource of
    0: MetricText.Text('CPU   12%  /  4.84 GHz');
    1: MetricText.Text('RAM   5.8 / 16 GB');
    2: MetricText.Text('DISK   112 MB/s');
  end;
end;

procedure SetDemoPage(AValue: Integer);
begin
  if AValue < 0 then AValue := 0;
  if AValue > 2 then AValue := 2;

  DemoPage := AValue;
  PressedButton := 0;

  if DemoPage <> 1 then
    ProgressTimer.Enabled(False);

  case DemoPage of
    0:
      begin
        PageTitleText.Text('CONFIGURE VISUAL DEMO');
        PageInfoText.Text('A three-stage Skia showcase. No files will be installed.');
        FieldLabel1.Text('ACTIVE PROFILE');
        FieldValue1.Text('RESONANT / NEON MATRIX');
        FieldLabel2.Text('VISUAL MODULES');
        FieldValue2.Text('ROTATING MESH  /  LIQUID WAVE  /  TELEMETRY');
        PercentText.Visible(False);
        ProgressInfoText.Visible(False);
        MetricText.Visible(False);
        CpuTabText.Visible(False);
        RamTabText.Visible(False);
        DiskTabText.Visible(False);
        FieldLabel1.Visible(True);
        FieldValue1.Visible(True);
        FieldLabel2.Visible(True);
        FieldValue2.Visible(True);
        PrimaryButtonText.Text('START DEMO');
        SecondaryButtonText.Text('EXIT');
      end;

    1:
      begin
        PageTitleText.Text('SIMULATING DATA TRANSFER');
        PageInfoText.Text('Timer-driven progress with a continuously animated SkSL wave field.');
        PercentText.Visible(True);
        PercentText.Text(IntToStr(Round(DemoProgress * 100)) + '%');
        ProgressInfoText.Visible(True);
        ProgressInfoText.Text('LIVE PROGRESS  /  TIME-BASED SIMULATION');
        MetricText.Visible(True);
        CpuTabText.Visible(True);
        RamTabText.Visible(True);
        DiskTabText.Visible(True);
        FieldLabel1.Visible(False);
        FieldValue1.Visible(False);
        FieldLabel2.Visible(False);
        FieldValue2.Visible(False);
        PrimaryButtonText.Text(DemoPaused ? 'RESUME' : 'PAUSE');
        SecondaryButtonText.Text('BACK');
        UpdateMetricText;
      end;

    2:
      begin
        PageTitleText.Text('SEQUENCE COMPLETE');
        PageInfoText.Text('The wave field reached 100 percent. The shader remains animated.');
        FieldLabel1.Visible(False);
        FieldValue1.Visible(False);
        FieldLabel2.Visible(False);
        FieldValue2.Visible(False);
        PercentText.Visible(False);
        ProgressInfoText.Visible(True);
        ProgressInfoText.Text('DEMO FINISHED  /  NO SETUP OPERATIONS PERFORMED');
        MetricText.Visible(False);
        CpuTabText.Visible(False);
        RamTabText.Visible(False);
        DiskTabText.Visible(False);
        PrimaryButtonText.Text('RESTART');
        SecondaryButtonText.Text('EXIT');
      end;
  end;

  UpdateDemoUniforms;
end;

procedure StartSimulation;
begin
  DemoProgress := 0;
  DemoPaused := False;
  SelectedResource := 0;
  UpdateMetricText;
  SetDemoPage(1);
  ProgressTimer.Enabled(True);
end;

procedure TogglePause;
begin
  DemoPaused := not DemoPaused;
  ProgressTimer.Enabled(not DemoPaused);
  if DemoPaused then
    PrimaryButtonText.Text('RESUME')
  else
    PrimaryButtonText.Text('PAUSE');
end;

procedure ProgressTimerTick(Sender: TObject);
begin
  if (DemoPage <> 1) or DemoPaused then
    Exit;

  DemoProgress := DemoProgress + 0.005;
  if DemoProgress >= 1.0 then
  begin
    DemoProgress := 1.0;
    UpdateDemoUniforms;
    PercentText.Text('100%');
    SetDemoPage(2);
    Exit;
  end;

  UpdateDemoUniforms;
  PercentText.Text(IntToStr(Round(DemoProgress * 100)) + '%');
end;

function HitTestScene(X, Y: Single): Integer;
begin
  Result := 0;

  if (X >= 858) and (X <= 894) and (Y >= 40) and (Y <= 76) then
  begin
    Result := 3;
    Exit;
  end;

  if (DemoPage = 1) and (Y >= 338) and (Y <= 370) then
  begin
    if (X >= 86) and (X <= 164) then Result := 4
    else if (X >= 164) and (X <= 242) then Result := 5
    else if (X >= 242) and (X <= 320) then Result := 6;
    if Result <> 0 then Exit;
  end;

  if (Y >= 344) and (Y <= 380) then
  begin
    if (X >= 370) and (X <= 575) then
      Result := 1
    else if (X >= 648) and (X <= 854) then
      Result := 2;
  end;
end;

procedure SceneMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  PressedButton := 0;

  if Button <> mbLeft then
    Exit;

  PressedButton := HitTestScene(X, Y);

  if (PressedButton = 0) and (Y >= 0) and (Y <= 38) and (X < 850) then
  begin
    FMXForm.StartWindowDrag;
    Exit;
  end;

  SkScene.SetUniformInt('uPressedButton', PressedButton);
end;

procedure SceneMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  ReleasedButton: Integer;
begin
  ReleasedButton := HitTestScene(X, Y);
  SkScene.SetUniformInt('uPressedButton', 0);

  if (Button <> mbLeft) or (PressedButton = 0) or
    (PressedButton <> ReleasedButton) then
  begin
    PressedButton := 0;
    Exit;
  end;

  PressedButton := 0;

  case ReleasedButton of
    1:
      case DemoPage of
        0: StartSimulation;
        1: TogglePause;
        2: StartSimulation;
      end;

    2:
      case DemoPage of
        0, 2:
          WizardForm.CancelButton.OnClick(Sender);
        1:
          begin
            DemoProgress := 0;
            DemoPaused := False;
            SetDemoPage(0);
          end;
      end;

    3:
      WizardForm.CancelButton.OnClick(Sender);

    4, 5, 6:
      begin
        SelectedResource := ReleasedButton - 4;
        UpdateMetricText;
        UpdateDemoUniforms;
      end;
  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateImageForm(WizardForm.Handle, $FF260B18, '', False);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  SkScene.FCreate(FormLayer.Handle);
  SkScene.Align(Client);
  SkScene.LoadShader(ExtractAndLoad('{#ShaderFile}'));
  SkScene.InteractWithMouse(True);
  SkScene.OnMouseDown(@SceneMouseDown);
  SkScene.OnMouseUp(@SceneMouseUp);
  SkScene.SendToBack;

  CreateSceneText(TitleText, 'RESONANT  /  SKIA LAB',
    54, 39, 340, 22, 11, $FFFF4C9B, txLeading);
  CreateSceneText(BrandText, 'CONTROL  /  VISUAL SYSTEM  1.0',
    388, 67, 430, 30, 16, $FFF3E8EE, txLeading);
  CreateSceneText(PageTitleText, 'CONFIGURE VISUAL DEMO',
    388, 112, 430, 28, 16, $FFFFD6E6, txLeading);
  CreateSceneText(PageInfoText, 'A three-stage Skia showcase. No files will be installed.',
    388, 143, 430, 36, 11, $FFD9BFCB, txLeading);

  CreateSceneText(FieldLabel1, 'ACTIVE PROFILE',
    389, 194, 420, 18, 10, $FFFF4C9B, txLeading);
  CreateSceneText(FieldValue1, 'RESONANT / NEON MATRIX',
    389, 216, 420, 24, 14, $FFF3E8EE, txLeading);
  CreateSceneText(FieldLabel2, 'VISUAL MODULES',
    389, 260, 420, 18, 10, $FFFF4C9B, txLeading);
  CreateSceneText(FieldValue2, 'ROTATING MESH  /  LIQUID WAVE  /  TELEMETRY',
    389, 282, 420, 24, 12, $FFF3E8EE, txLeading);

  CreateSceneText(PercentText, '0%',
    526, 193, 172, 40, 28, $FFFFFFFF, txCenter);
  CreateSceneText(ProgressInfoText, 'LIVE PROGRESS  /  TIME-BASED SIMULATION',
    414, 270, 396, 24, 11, $FFF0D8E4, txCenter);
  CreateSceneText(MetricText, 'CPU   12%  /  4.84 GHz',
    80, 292, 244, 24, 12, $FFF0D8E4, txCenter);

  CreateSceneText(CpuTabText, 'CPU',
    86, 340, 78, 28, 10, $FFFF4C9B, txCenter);
  CreateSceneText(RamTabText, 'RAM',
    164, 340, 78, 28, 10, $FFF0D8E4, txCenter);
  CreateSceneText(DiskTabText, 'DISK',
    242, 340, 78, 28, 10, $FFF0D8E4, txCenter);

  CreateSceneText(PrimaryButtonText, 'START DEMO',
    385, 347, 175, 30, 12, $FFF5EAF0, txCenter);
  CreateSceneText(SecondaryButtonText, 'EXIT',
    670, 347, 162, 30, 12, $FFF5EAF0, txCenter);
  CreateSceneText(FooterText, 'SKSL  /  RUNTIME UNIFORMS  /  FMXBRIDGE',
    490, 402, 340, 22, 10, $FFF3C5D9, txCenter);

  ProgressTimer.FCreate(FormLayer.Handle);
  ProgressTimer.Interval(50);
  ProgressTimer.OnTimer(@ProgressTimerTick);
  ProgressTimer.Enabled(False);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(920, 440);

  DemoProgress := 0;
  DemoPage := 0;
  SelectedResource := 0;
  PressedButton := 0;
  DemoPaused := False;

  FMXDesigning;
  SetDemoPage(0);

  FMXForm.Show;
  SkScene.RunAnim;
end;
