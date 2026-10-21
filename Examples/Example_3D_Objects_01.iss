[Setup]
AppName=FMXBridge_3D Objects
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
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
  FMXForm  : FForm;
  FormLayer: FLayout;
  TitleBar : FWinTitleBar;

  Viewport3D    : FViewport3D;
  LightMaterial : FLightMaterialSource;
  LightMaterial2: FLightMaterialSource;
  Light1        : FLight;
  Light2        : FLight;

  Cube0 : FCube;
  Cube1 : FCube;
  Cube2 : FCube;
  Cube3 : FCube;
  Cube4 : FCube;
  Cube5 : FCube;
  Cube6 : FCube;
  Cube7 : FCube;
  Cube8 : FCube;
  Cube9 : FCube;
  Cube10: FCube;
  Cube11: FCube;

  Anim0 : FFloatAnimation;
  Anim1 : FFloatAnimation;
  Anim2 : FFloatAnimation;
  Anim3 : FFloatAnimation;
  Anim4 : FFloatAnimation;
  Anim5 : FFloatAnimation;
  Anim6 : FFloatAnimation;
  Anim7 : FFloatAnimation;
  Anim8 : FFloatAnimation;
  Anim9 : FFloatAnimation;
  Anim10: FFloatAnimation;
  Anim11: FFloatAnimation;

  ExitForm        : FMsgForm;
  ExitFormTitleBar: FWinTitleBar;
  ExitFormLabel1  : FLabel;
  ExitFormLabel2  : FLabel;
  ExitFormYesBtn  : FButton;
  ExitFormNoBtn   : FButton;

procedure FMXInit;
begin
  FMXForm  := InitFormHandle;
  FormLayer:= InitLayoutHandle;
  TitleBar := InitWinTitleBarHandle;

  Viewport3D:= InitViewport3DHandle;

  LightMaterial  := InitLightMaterialSourceHandle;
  LightMaterial2 := InitLightMaterialSourceHandle;
  Light1       := InitLightHandle;
  Light2       := InitLightHandle;

  Cube0  := InitCubeHandle;
  Cube1  := InitCubeHandle;
  Cube2  := InitCubeHandle;
  Cube3  := InitCubeHandle;
  Cube4  := InitCubeHandle;
  Cube5  := InitCubeHandle;
  Cube6  := InitCubeHandle;
  Cube7  := InitCubeHandle;
  Cube8  := InitCubeHandle;
  Cube9  := InitCubeHandle;
  Cube10 := InitCubeHandle;
  Cube11 := InitCubeHandle;

  Anim0 := InitFloatAnimation;
  Anim1 := InitFloatAnimation;
  Anim2 := InitFloatAnimation;
  Anim3 := InitFloatAnimation;
  Anim4 := InitFloatAnimation;
  Anim5 := InitFloatAnimation;
  Anim6 := InitFloatAnimation;
  Anim7 := InitFloatAnimation;
  Anim8 := InitFloatAnimation;
  Anim9 := InitFloatAnimation;
  Anim10:= InitFloatAnimation;
  Anim11:= InitFloatAnimation;

  ExitForm        := InitMsgFormHandle;
  ExitFormTitleBar:= InitWinTitleBarHandle;
  ExitFormLabel1  := InitLabelHandle;
  ExitFormLabel2  := InitLabelHandle;
  ExitFormYesBtn  := InitButtonHandle;
  ExitFormNoBtn   := InitButtonHandle;
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

procedure SetupCube(const Cube: FCube; const Material: FLightMaterialSource; X, Y, Z: Single; Size: Single; RX, RY, RZ: Single);
begin
  Cube.FCreate(Viewport3D.Handle);
  Cube.Width(Size);
  Cube.Height(Size);
  Cube.Depth(Size);
  Cube.Position(X, Y, Z);
  Cube.RotationAngle(RX, RY, RZ);
  Cube.MaterialSource(Material.Handle);
  Cube.TwoSide(True);
  Cube.HitTest(False);
end;

procedure SetupAnimation(const Anim: FFloatAnimation; const Cube: FCube; const PropertyName: String; Duration: Single; StartAngle, EndAngle: Single);
begin
  Anim.FCreate(Cube.Handle);
  Anim.AnimationType(atIn, Duration, 0, False, False, True);
  Anim.Interpolation(itLinear);
  Anim.PropertyName(PropertyName);
  Anim.SetValues(StartAngle, EndAngle);
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlurForm(WizardForm.Handle, $1A000000, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Viewport3D.FCreate(FormLayer.Handle);
  Viewport3D.Align(Client);
  Viewport3D.Multisample(msFourSamples);
  Viewport3D.Color(0);

  LightMaterial.FCreate(Viewport3D.Handle);
  LightMaterial.Ambient($FF6A4CFF);
  LightMaterial.Diffuse($FF5FD4FF);
  LightMaterial.Emissive($FF15102C);
  LightMaterial.Shininess(100);
  LightMaterial.Specular($FFFFFFFF);

  LightMaterial2.FCreate(Viewport3D.Handle);
  LightMaterial2.Ambient($FFFF6A00);
  LightMaterial2.Diffuse($FFFFB347);
  LightMaterial2.Emissive($FF241006);
  LightMaterial2.Shininess(100);
  LightMaterial2.Specular($FFFFFFFF);

  Light1.FCreate(Viewport3D.Handle);
  Light1.Color($FF7A5CFF);
  Light1.LightType(ltDirectional);
  Light1.Position(-8, -8, -6);
  Light1.RotationAngle(325, 35, 25);
  Light1.Depth(1);
  Light1.Width(1);
  Light1.Height(1);

  Light2.FCreate(Viewport3D.Handle);
  Light2.Color($FFFF9838);
  Light2.LightType(ltDirectional);
  Light2.Position(8, 5, 8);
  Light2.RotationAngle(25, 210, 0);
  Light2.Depth(1);
  Light2.Width(1);
  Light2.Height(1);

  SetupCube(Cube0, LightMaterial, 0, 0, 0, 4.2, 25, 35, 10);
  SetupCube(Cube1, LightMaterial2, -5.0, 0.0,  1.5, 2.1, 20,  45, 10);
  SetupCube(Cube2, LightMaterial, 5.0, 0.0, -1.5, 2.1, 35, 110, 25);
  SetupCube(Cube3, LightMaterial2, 0.0, -5.0,  2.0, 2.1, 70,  20, 55);
  SetupCube(Cube4, LightMaterial, 0.0,  5.0, -2.0, 2.1, 95, 150, 35);
  SetupCube(Cube5, LightMaterial2, -6.5, -4.5, -2.5, 1.7, 25,  40, 15);
  SetupCube(Cube6, LightMaterial, 6.5, -4.5,  2.5, 1.7, 80, 100, 35);
  SetupCube(Cube7, LightMaterial2, -6.5,  4.5,  2.5, 1.7, 120, 160, 55);
  SetupCube(Cube8, LightMaterial, 6.5,  4.5, -2.5, 1.7, 145, 210, 75);
  SetupCube(Cube9, LightMaterial2, -3.5, 0,  6.0, 1.5, 45,  20, 80);
  SetupCube(Cube10, LightMaterial, 3.5, 0, -6.0, 1.5, 90, 140, 20 );
  SetupCube(Cube11, LightMaterial2, 0, 0, 7.0, 1.3, 140, 220, 60);

  SetupAnimation(Anim0, Cube0, 'RotationAngle.Y', 8.0, 0, 360);
  SetupAnimation(Anim1, Cube1, 'RotationAngle.X', 2.6, 0, 360);
  SetupAnimation(Anim2, Cube2, 'RotationAngle.Y', 3.1, 0, 360);
  SetupAnimation(Anim3, Cube3, 'RotationAngle.Z', 3.4, 0, 360);
  SetupAnimation(Anim4, Cube4, 'RotationAngle.X', 3.8, 0, 360);
  SetupAnimation(Anim5, Cube5, 'RotationAngle.Y', 2.2, 0, 360);
  SetupAnimation(Anim6, Cube6, 'RotationAngle.Z', 2.8, 0, 360);
  SetupAnimation(Anim7, Cube7, 'RotationAngle.X', 3.6, 0, 360);
  SetupAnimation(Anim8, Cube8, 'RotationAngle.Y', 4.0, 0, 360);
  SetupAnimation(Anim9, Cube9, 'RotationAngle.Z', 2.4, 0, 360);
  SetupAnimation(Anim10, Cube10, 'RotationAngle.X', 3.0, 0, 360);
  SetupAnimation(Anim11, Cube11, 'RotationAngle.Y', 2.0, 0, 360);

  ExitForm.FCreateBlurForm(FMXForm.HandleHWND, $1A000000, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, False);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 59, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FF464646);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 103, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FF565656);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(290, 191, 99, 31);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.StyleLookUp('buttonstyle_accent');
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(400, 191, 99, 31);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.StyleLookUp('buttonstyle_accent');
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(640, 480);

  FMXDesigning;
  FMXForm.Show;

  Anim0.Enabled(True);
  Anim1.Enabled(True);
  Anim2.Enabled(True);
  Anim3.Enabled(True);
  Anim4.Enabled(True);
  Anim5.Enabled(True);
  Anim6.Enabled(True);
  Anim7.Enabled(True);
  Anim8.Enabled(True);
  Anim9.Enabled(True);
  Anim10.Enabled(True);
  Anim11.Enabled(True);
end;
