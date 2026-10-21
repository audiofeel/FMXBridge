[Setup]
AppName=FMXBridge_3D Objects_03
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
Source: "Files\3D_Objects_03\*"; Flags: dontcopy
Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm               : FForm;
  FormLayer             : FLayout;
  TitleBar              : FWinTitleBar;

  Dragging              : Boolean;
  LastX                 : Single;

  Viewport3D            : FViewport3D;
  Camera                : FCamera;
  Dummy                 : FDummy;
  Model3DTexture        : FTextureMaterialSource;
  Model3D               : FModel3D;
  PlaneTexture          : FTextureMaterialSource;
  Plane                 : FPlane;
  Light1                : FLight;
  Light2                : FLight;

  ExitForm              : FMsgForm;
  ExitFormTitleBar      : FWinTitleBar;
  ExitFormLabel1        : FLabel;
  ExitFormLabel2        : FLabel;
  ExitFormBottomBar     : FRectangle;
  ExitFormYesBtn        : FButton;
  ExitFormNoBtn         : FButton;

procedure FMXInit;
begin
  FMXForm               := InitFormHandle;
  FormLayer             := InitLayoutHandle;
  TitleBar              := InitWinTitleBarHandle;

  Dragging              := False;
  LastX                 := 0;

  Viewport3D            := InitViewport3DHandle;
  Camera                := InitCameraHandle;
  Dummy                 := InitDummyHandle;
  Model3DTexture        := InitTextureMaterialSourceHandle;
  Model3D               := InitModel3DHandle;
  PlaneTexture          := InitTextureMaterialSourceHandle;
  Plane                 := InitPlaneHandle;
  Light1                := InitLightHandle;
  Light2                := InitLightHandle;

  ExitForm              := InitMsgFormHandle;
  ExitFormTitleBar      := InitWinTitleBarHandle;
  ExitFormLabel1        := InitLabelHandle;
  ExitFormLabel2        := InitLabelHandle;
  ExitFormBottomBar     := InitRectangleHandle;
  ExitFormYesBtn        := InitButtonHandle;
  ExitFormNoBtn         := InitButtonHandle;
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

procedure Viewport3DMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  Dragging:= True;
  LastX:= X;
end;

procedure Viewport3DMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  if Dragging then
  begin
    Dummy.RotationAngleY(Dummy.GetRotationAngleY + (LastX - X) * 0.1);
    LastX:= X;
  end;
end;

procedure Viewport3DMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  Dragging := False;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btAcrylic, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), 0);
  FMXForm.Caption('FMX Bridge');
  FMXForm.CanvasQuality(HighQuality);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Viewport3D.FCreate(FormLayer.Handle);
  Viewport3D.Align(Client);
  Viewport3D.Color(ALNull);
  Viewport3D.Multisample(msFourSamples);
  Viewport3D.OnMouseDown(@Viewport3DMouseDown);
  Viewport3D.OnMouseUp(@Viewport3DMouseUp);
  Viewport3D.OnMouseMove(@Viewport3DMouseMove);

  Camera.FCreate(Viewport3D.Handle);
  Camera.AngleOfView(45);
  Camera.Position(0.61, -6.77, -17.4);
  Camera.RotationAngle(-15.72, 0, 0);
  Camera.Width(1);
  Camera.Height(1);
  Camera.Depth(1);
  Camera.Projection(pjCamera);

  Viewport3D.UsingDesignCamera(False);
  Viewport3D.Camera(Camera.Handle);

  Dummy.FCreate(Viewport3D.Handle);
  Dummy.Width(1);
  Dummy.Height(1);
  Dummy.Depth(1);

  Model3DTexture.FCreate(Viewport3D.Handle);
  Model3DTexture.LoadFromFile(ExtractAndLoad('RGB_133f199f3fb74bb5b5e4b292381350df_car_rrsp.png'));

  Model3D.FCreate(Dummy.Handle);
  Model3D.Scale(3.2, 3.2, 3.2);
  Model3D.RotationAngle(90, 0, 270);
  Model3D.Width(2.15);
  Model3D.Height(5.5);
  Model3D.Depth(3.1);
  Model3D.TwoSide(False);
  Model3D.WrapMode(mwmResize);
  Model3D.LoadFromFile(ExtractAndLoad('model.dae'));

  PlaneTexture.FCreate(Viewport3D.Handle);
  PlaneTexture.LoadFromFile(ExtractAndLoad('concrete_texture.jpg'));

  Plane.FCreate(Dummy.Handle);
  Plane.RotationAngleX(90);
  Plane.Width(15);
  Plane.Height(15);
  Plane.HitTest(False);
  Plane.WrapMode(mwmFit);
  Plane.MaterialSource(PlaneTexture.Handle);

  Light1.FCreate(Viewport3D.Handle);
  Light1.Color($FFFFF4E6);
  Light1.LightType(ltPoint);
  Light1.SpotCutOff(180);
  Light1.Position(-7, -7, -11);
  Light1.Width(1);
  Light1.Height(1);
  Light1.Depth(1);

  Light2.FCreate(Viewport3D.Handle);
  Light2.Color($FFE6EEFF);
  Light2.LightType(ltPoint);
  Light2.SpotCutOff(180);
  Light2.Position(7, -3, -8);
  Light2.Width(1);
  Light2.Height(1);
  Light2.Depth(1);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btAcrylic, True, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FFF5F5F5);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FF767676);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Align(MostBottom);
  ExitFormBottomBar.Height(54);
  ExitFormBottomBar.FillColor($40000000);

  ExitFormYesBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormYesBtn.SetBounds(310, 13, 92, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.StyleLookUp('buttonstyle_accent');
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormNoBtn.SetBounds(412, 13, 92, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.StyleLookUp('buttonstyle_accent');
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(950, 550);
  FMXDesigning;
  FMXForm.Show;
end;
