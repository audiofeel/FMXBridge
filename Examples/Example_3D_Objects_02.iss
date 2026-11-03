[Setup]
AppName=FMXBridge_3D Objects_02
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
Source: "Files\Images\wallpapers1.jpg"; Flags: dontcopy
Source: "Files\Images\wallpapers11.jpg"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm               : FForm;
  FormLayer             : FLayout;
  TitleBar              : FWinTitleBar;

  Viewport3D            : FViewport3D;
  TextureMaterialSource : FTextureMaterialSource;
  LightMaterialSource   : FLightMaterialSource;
  CyanMaterialSource    : FLightMaterialSource;
  PinkMaterialSource    : FLightMaterialSource;
  WhiteMaterialSource   : FLightMaterialSource;
  Camera                : FCamera;

  Text3DMain            : FText3D;
  Text3DCyan            : FText3D;
  Text3DPink            : FText3D;
  Text3DSub             : FText3D;
  Text3DTag             : FText3D;

  ExitForm              : FMsgForm;
  ExitFormTitleBar      : FWinTitleBar;
  ExitFormLabel1        : FLabel;
  ExitFormLabel2        : FLabel;
  ExitFormYesBtn        : FButton;
  ExitFormNoBtn         : FButton;
  ExitFormBottomBar     : FStatusBar;

procedure FMXInit;
begin
  FMXForm               := InitFormHandle;
  FormLayer             := InitLayoutHandle;
  TitleBar              := InitWinTitleBarHandle;

  Viewport3D            := InitViewport3DHandle;
  TextureMaterialSource := InitTextureMaterialSourceHandle;
  LightMaterialSource   := InitLightMaterialSourceHandle;
  CyanMaterialSource    := InitLightMaterialSourceHandle;
  PinkMaterialSource    := InitLightMaterialSourceHandle;
  WhiteMaterialSource   := InitLightMaterialSourceHandle;
  Camera                := InitCameraHandle;

  Text3DMain            := InitText3DHandle;
  Text3DCyan            := InitText3DHandle;
  Text3DPink            := InitText3DHandle;
  Text3DSub             := InitText3DHandle;
  Text3DTag             := InitText3DHandle;

  ExitForm              := InitMsgFormHandle;
  ExitFormTitleBar      := InitWinTitleBarHandle;
  ExitFormLabel1        := InitLabelHandle;
  ExitFormLabel2        := InitLabelHandle;
  ExitFormYesBtn        := InitButtonHandle;
  ExitFormNoBtn         := InitButtonHandle;
  ExitFormBottomBar     := InitStatusBarHandle;
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
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, ExtractAndLoad('wallpapers1.jpg'), True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF16253D);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Viewport3D.FCreate(FormLayer.Handle);
  Viewport3D.Align(Client);
  Viewport3D.Multisample(msFourSamples);
  Viewport3D.Color(ALNull);

  Camera.FCreate(Viewport3D.Handle);
  Camera.AngleOfView(46);
  Camera.Depth(0.1);
  Camera.Height(1);
  Camera.Position(4.2, 4.8, -7.8);
  Camera.RotationAngle(6.0, 326.0, 358.0);
  Camera.Width(1);

  Viewport3D.UsingDesignCamera(False);
  Viewport3D.Camera(Camera.Handle);

  TextureMaterialSource.FCreate(Viewport3D.Handle);
  TextureMaterialSource.LoadFromFile(ExtractAndLoad('wallpapers11.jpg'));

  LightMaterialSource.FCreate(Viewport3D.Handle);
  LightMaterialSource.Ambient($FF666A72);
  LightMaterialSource.Diffuse($FFE8EBF0);
  LightMaterialSource.Emissive(ALNull);
  LightMaterialSource.Shininess(95);
  LightMaterialSource.Specular($FFFFFFFF);

  CyanMaterialSource.FCreate(Viewport3D.Handle);
  CyanMaterialSource.Ambient($FF102B32);
  CyanMaterialSource.Diffuse($FF00D9FF);
  CyanMaterialSource.Emissive($FF063A45);
  CyanMaterialSource.Shininess(90);
  CyanMaterialSource.Specular($FFB8FFFF);

  PinkMaterialSource.FCreate(Viewport3D.Handle);
  PinkMaterialSource.Ambient($FF32101F);
  PinkMaterialSource.Diffuse($FFFF337D);
  PinkMaterialSource.Emissive($FF430A24);
  PinkMaterialSource.Shininess(90);
  PinkMaterialSource.Specular($FFFFB5D1);

  WhiteMaterialSource.FCreate(Viewport3D.Handle);
  WhiteMaterialSource.Ambient($FF303030);
  WhiteMaterialSource.Diffuse($FFE8E8E8);
  WhiteMaterialSource.Emissive(ALNull);
  WhiteMaterialSource.Shininess(70);
  WhiteMaterialSource.Specular($FFFFFFFF);

  Text3DCyan.FCreate(Viewport3D.Handle);
  Text3DCyan.Text('FMXBRIDGE');
  Text3DCyan.TextSetting(False, txCenter, txCenter);
  Text3DCyan.Depth(0.65);
  Text3DCyan.Flatness(0.025);
  Text3DCyan.Height(7.4);
  Text3DCyan.MaterialSource(CyanMaterialSource.Handle);
  Text3DCyan.MaterialShaftSource(CyanMaterialSource.Handle);
  Text3DCyan.Position(-0.48, -3.05, 0.75);
  Text3DCyan.RotationAngle(10.0, -24.0, -5.0);
  Text3DCyan.Scale(1, 1, 1);
  Text3DCyan.Stretch(False);
  Text3DCyan.TwoSide(False);
  Text3DCyan.Width(13.6);
  Text3DCyan.WrapMode(mwmOriginal);
  Text3DCyan.ZWrite(False);

  Text3DPink.FCreate(Viewport3D.Handle);
  Text3DPink.Text('FMXBRIDGE');
  Text3DPink.TextSetting(False, txCenter, txCenter);
  Text3DPink.Depth(0.65);
  Text3DPink.Flatness(0.025);
  Text3DPink.Height(7.4);
  Text3DPink.MaterialSource(PinkMaterialSource.Handle);
  Text3DPink.MaterialShaftSource(PinkMaterialSource.Handle);

  Text3DPink.Position(0.42, -2.78, 0.48);
  Text3DPink.RotationAngle(10.0, -24.0, -5.0);
  Text3DPink.Scale(1, 1, 1);
  Text3DPink.Stretch(False);
  Text3DPink.TwoSide(False);
  Text3DPink.Width(13.6);
  Text3DPink.WrapMode(mwmOriginal);
  Text3DPink.ZWrite(False);

  Text3DMain.FCreate(Viewport3D.Handle);
  Text3DMain.Text('FMXBRIDGE');
  Text3DMain.TextSetting(False, txCenter, txCenter);
  Text3DMain.Depth(0.90);
  Text3DMain.Flatness(0.025);
  Text3DMain.Height(7.4);
  Text3DMain.MaterialSource(TextureMaterialSource.Handle);
  Text3DMain.MaterialShaftSource(LightMaterialSource.Handle);

  Text3DMain.Position(0.0, -2.90, 0.0);
  Text3DMain.RotationAngle(10.0, -24.0, -5.0);
  Text3DMain.Scale(1, 1, 1);
  Text3DMain.Stretch(False);
  Text3DMain.TwoSide(False);
  Text3DMain.Width(13.6);
  Text3DMain.WrapMode(mwmOriginal);
  Text3DMain.ZWrite(True);

  Text3DSub.FCreate(Viewport3D.Handle);
  Text3DSub.Text('FIREMONKEY');
  Text3DSub.TextSetting(False, txCenter, txCenter);

  Text3DSub.Depth(0.22);
  Text3DSub.Flatness(0.025);
  Text3DSub.Height(1.35);

  Text3DSub.MaterialSource(WhiteMaterialSource.Handle);
  Text3DSub.MaterialShaftSource(WhiteMaterialSource.Handle);
  Text3DSub.Position(0.95, -4.70, -0.15);
  Text3DSub.RotationAngle(10.0, -24.0, -5.0);

  Text3DSub.Scale(1, 1, 1);
  Text3DSub.Stretch(False);
  Text3DSub.TwoSide(False);
  Text3DSub.Width(8.2);
  Text3DSub.WrapMode(mwmOriginal);
  Text3DSub.ZWrite(True);

  Camera.Target(Text3DMain.Handle);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, ExtractAndLoad('wallpapers1.jpg'), True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($FF16253D);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display', 20, ALBlanchedAlmond);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text', 15, ALBlanchedAlmond);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Height(54);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(383, 207, 46, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(442, 207, 72, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(640, 480);
  FMXDesigning;

  FMXForm.Show;
end;
