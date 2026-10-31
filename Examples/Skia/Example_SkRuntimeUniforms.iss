#define ShaderFile "runtime-uniforms.sksl"

[Setup]
AppId=FMXBridge_Skia_RuntimeUniforms
AppName=FMXBridge Skia Runtime Uniforms
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

[Code]
#include "Modules\FMXBridgeHandle.iss"
#include "Modules\FMXSkiaHandle.iss"

var
  FMXForm             : FForm;
  FormLayer           : FLayout;
  WinTB               : FWinTitleBar;
  SkBackground        : FSkAnimatedPaintBox;

  TitleText           : FText;
  DescriptionText     : FText;
  StatusText          : FText;

  NextPresetButton    : FButton;
  AnimationButton     : FButton;
  ValidationButton    : FButton;

  PresetIndex         : Integer;
  AnimationRunning    : Boolean;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  WinTB            := InitWinTitleBarHandle;
  SkBackground     := InitSkAnimatedPaintBox;

  TitleText        := InitTextHandle;
  DescriptionText  := InitTextHandle;
  StatusText       := InitTextHandle;

  NextPresetButton := InitButtonHandle;
  AnimationButton  := InitButtonHandle;
  ValidationButton := InitButtonHandle;
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

procedure ApplyPreset(AIndex: Integer);
var
  Ok: Boolean;
begin
  Ok := True;

  case AIndex of
    0:
      begin
        Ok := SkBackground.SetUniformFloat('uProgress', 0.22) and Ok;
        Ok := SkBackground.SetUniformFloat2('uCenter', 0.73, 0.49) and Ok;
        Ok := SkBackground.SetUniformFloat3('uAccent', 0.12, 0.66, 1.00) and Ok;
        Ok := SkBackground.SetUniformFloat4('uTint', 0.96, 0.24, 0.60, 1.00) and Ok;
        StatusText.Text('Preset 1  |  Progress: 22%');
      end;

    1:
      begin
        Ok := SkBackground.SetUniformFloat('uProgress', 0.48) and Ok;
        Ok := SkBackground.SetUniformFloat2('uCenter', 0.70, 0.50) and Ok;
        Ok := SkBackground.SetUniformFloat3('uAccent', 0.20, 0.95, 0.62) and Ok;
        Ok := SkBackground.SetUniformFloat4('uTint', 1.00, 0.68, 0.18, 1.00) and Ok;
        StatusText.Text('Preset 2  |  Progress: 48%');
      end;

    2:
      begin
        Ok := SkBackground.SetUniformFloat('uProgress', 0.73) and Ok;
        Ok := SkBackground.SetUniformFloat2('uCenter', 0.74, 0.48) and Ok;
        Ok := SkBackground.SetUniformFloat3('uAccent', 0.62, 0.36, 1.00) and Ok;
        Ok := SkBackground.SetUniformFloat4('uTint', 0.16, 0.88, 1.00, 1.00) and Ok;
        StatusText.Text('Preset 3  |  Progress: 73%');
      end;

    else
      begin
        Ok := SkBackground.SetUniformFloat('uProgress', 0.94) and Ok;
        Ok := SkBackground.SetUniformFloat2('uCenter', 0.76, 0.50) and Ok;
        Ok := SkBackground.SetUniformFloat3('uAccent', 1.00, 0.34, 0.18) and Ok;
        Ok := SkBackground.SetUniformFloat4('uTint', 1.00, 0.86, 0.24, 1.00) and Ok;
        StatusText.Text('Preset 4  |  Progress: 94%');
      end;
  end;

  if not Ok then
    MsgBox(
      'One or more Skia uniforms could not be updated.'#13#10 +
      'Check the shader uniform names and types.',
      mbError, MB_OK);
end;

procedure NextPresetClick(Sender: TObject);
begin
  PresetIndex := (PresetIndex + 1) mod 4;
  ApplyPreset(PresetIndex);
end;

procedure AnimationClick(Sender: TObject);
begin
  if AnimationRunning then
  begin
    SkBackground.StopAnim;
    AnimationRunning := False;
    AnimationButton.Text('START ANIMATION');
    StatusText.Text('Animation stopped. NEXT PRESET still redraws the shader.');
  end
  else
  begin
    SkBackground.RunAnim;
    AnimationRunning := True;
    AnimationButton.Text('STOP ANIMATION');
    StatusText.Text('Animation running.');
  end;
end;

procedure ValidationClick(Sender: TObject);
var
  WrongTypeRejected: Boolean;
  MissingNameRejected: Boolean;
  TimeIsReserved: Boolean;
  ResolutionIsReserved: Boolean;
  TimeDeltaIsReserved: Boolean;
begin
  WrongTypeRejected := not SkBackground.SetUniformFloat('uCenter', 0.5);
  MissingNameRejected := not SkBackground.SetUniformFloat('uMissingUniform', 0.5);
  TimeIsReserved := not SkBackground.SetUniformFloat('iTime', 0.5);
  ResolutionIsReserved := not SkBackground.SetUniformFloat2('iResolution', 720, 540);
  TimeDeltaIsReserved := not SkBackground.SetUniformFloat('iTimeDelta', 0.016);

  if WrongTypeRejected and MissingNameRejected and TimeIsReserved and
    ResolutionIsReserved and TimeDeltaIsReserved then
    MsgBox(
      'Validation passed.'#13#10#13#10 +
      'Wrong type: rejected'#13#10 +
      'Unknown uniform: rejected'#13#10 +
      'Automatic iTime: protected'#13#10 +
      'Automatic iResolution: protected'#13#10 +
      'Automatic iTimeDelta: protected',
      mbInformation, MB_OK)
  else
    MsgBox(
      'Validation failed. One or more invalid assignments were accepted.',
      mbError, MB_OK);
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FF101522, '', True);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  SkBackground.FCreate(FormLayer.Handle);
  SkBackground.Align(Client);
  SkBackground.LoadShader(ExtractAndLoad('{#ShaderFile}'));
  SkBackground.InteractWithMouse(False);
  SkBackground.SendToBack;

  WinTB.FCreate(FormLayer.Handle, True);
  WinTB.CloseBtnOnClick(@WindowCloseClick);

  TitleText.FCreate(FormLayer.Handle);
  TitleText.SetBounds(42, 82, 470, 52);
  TitleText.FontSetting('Segoe UI Variable Display', 32, $FFFFFFFF);
  TitleText.Text('RUNTIME SHADER UNIFORMS');
  TitleText.HitTest(False);

  DescriptionText.FCreate(FormLayer.Handle);
  DescriptionText.SetBounds(45, 137, 470, 58);
  DescriptionText.FontSetting('Segoe UI', 14, $FFD0D8E8);
  DescriptionText.Text(
    'Change float, float2, float3 and float4 values while the shader is running — ' +
    'or stopped. The render is refreshed without restarting the animation.');
  DescriptionText.TextSetting(True, txLeading, txLeading);
  DescriptionText.HitTest(False);

  StatusText.FCreate(FormLayer.Handle);
  StatusText.SetBounds(45, 400, 560, 28);
  StatusText.FontSetting('Segoe UI', 12, $FFB9C8DD);
  StatusText.Text('Preset 1  |  Progress: 22%');
  StatusText.HitTest(False);

  NextPresetButton.FCreate(FormLayer.Handle);
  NextPresetButton.SetBounds(45, 454, 190, 42);
  NextPresetButton.Text('NEXT PRESET');
  NextPresetButton.OnClick(@NextPresetClick);

  AnimationButton.FCreate(FormLayer.Handle);
  AnimationButton.SetBounds(250, 454, 190, 42);
  AnimationButton.Text('STOP ANIMATION');
  AnimationButton.OnClick(@AnimationClick);

  ValidationButton.FCreate(FormLayer.Handle);
  ValidationButton.SetBounds(455, 454, 190, 42);
  ValidationButton.Text('TEST VALIDATION');
  ValidationButton.OnClick(@ValidationClick);

  PresetIndex := 0;
  ApplyPreset(PresetIndex);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(720, 540);
  FMXDesigning;
  FMXForm.Show;

  SkBackground.RunAnim;
  AnimationRunning := True;
end;
