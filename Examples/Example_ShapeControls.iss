[Setup]
AppName=FMXBridge_ShapeControls
AppVersion=1.0
CreateAppDir=no
AppCopyright=audiofeel
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\ImageList\*"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm           : FForm;
  FormLayer         : FLayout;
  TitleBar          : FWinTitleBar;

  TestChangeImg     : FImage;

  ShapeBtn          : FShapeButton;
  ShapeGradientBtn  : FShapeGradientButton;

  RShapeSwitch      : FShapeSwitch;
  RShapeSwitchSetup : FShapeSwitch;
  TShapeSwitch      : FShapeSwitch;
  TShapeSwitchSetup : FShapeSwitch;
  TestText          : FText;

  ShapeProgressBar  : FShapeProgressBar;
  ShapeArc          : FShapeArc;

  ProgressTrackbar  : FTrackbar;

procedure FMXInit;
begin
  FMXForm           := InitFormHandle;
  FormLayer         := InitLayoutHandle;
  TitleBar          := InitWinTitleBarHandle;

  TestChangeImg     := InitImageHandle;

  ShapeBtn          := InitShapeButtonHandle;
  ShapeGradientBtn  := InitShapeGradientButtonHandle;

  RShapeSwitch      := InitShapeSwitchHandle;
  RShapeSwitchSetup := InitShapeSwitchHandle;
  TShapeSwitch      := InitShapeSwitchHandle;
  TShapeSwitchSetup := InitShapeSwitchHandle;
  TestText          := InitTextHandle;

  ShapeProgressBar  := InitShapeProgressBarHandle;
  ShapeArc          := InitShapeArcHandle;
  ProgressTrackbar  := InitTrackbarHandle;
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
  Confirm:= False;
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectMinBtn):
      FMXForm.Minimize;

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.Close;

    TObject(ShapeBtn.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_ShapeControls', 'Test ShapeBtn', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(ShapeGradientBtn.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_ShapeControls', 'Test ShapeGradientBtn', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(RShapeSwitch.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_ShapeControls', 'Test RShapeSwitch', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(TShapeSwitch.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_ShapeControls', 'Test TShapeSwitch', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(RShapeSwitchSetup.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_ShapeControls', 'Test RShapeSwitchSetup', mbInformation, MB_OK, ['Ok'], 0, IDOK);

    TObject(TShapeSwitchSetup.GetObject):
      SuppressibleTaskDialogMsgBox('FMXBridge_ShapeControls', 'Test TShapeSwitchSetup', mbInformation, MB_OK, ['Ok'], 0, IDOK);

  end;
end;

procedure CommonOnEnter(Sender: TObject);
begin
  TestChangeImg.LoadPicture(ExtractAndLoad('button2.ico'), iwOriginal);
end;

procedure CommonOnLeave(Sender: TObject);
begin
  TestChangeImg.LoadPicture(ExtractAndLoad('button1.ico'), iwOriginal);
end;

procedure TrackBarOnChange(Sender: TObject);
begin
  ShapeProgressBar.Value(ProgressTrackbar.GetValue);
  ShapeArc.Value(ProgressTrackbar.GetValue);
end;

procedure SwitchOnChange(Sender: TObject);
var
  Total: Integer;
begin
  Total := 0;

  if RShapeSwitch.IsChecked then
    Total := Total + 17;

  if RShapeSwitchSetup.IsChecked then
    Total := Total + 43;

  if TShapeSwitch.IsChecked then
    Total := Total + 68;

  if TShapeSwitchSetup.IsChecked then
    Total := Total + 91;

  TestText.Text(IntToStr(Total));
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlurForm(WizardForm.Handle, ColorSetOpacity($FFFFFFFF, 0.8), True);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.SetColor($25000000);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  TestChangeImg.FCreate(FormLayer.Handle);
  TestChangeImg.SetBounds(30, 50, 24, 24);
  TestChangeImg.LoadPicture(ExtractAndLoad('button1.ico'), iwOriginal);

  ShapeBtn.FCreate(FormLayer.Handle);
  ShapeBtn.SetBounds(80, 50, 159, 39);
  ShapeBtn.Text('Shape Button');
  ShapeBtn.FontSetting('Segoe UI Variable Text', 14, ALWhite);
  ShapeBtn.OnMouseEnter(@CommonOnEnter);
  ShapeBtn.OnMouseLeave(@CommonOnLeave);
  ShapeBtn.OnClick(@CommonOnClick);

  ShapeGradientBtn.FCreate(FormLayer.Handle);
  ShapeGradientBtn.SetBounds(80, 130, 159, 39);
  ShapeGradientBtn.Text('Shape Gradient Button');
  ShapeGradientBtn.FontSetting('Segoe UI Variable Text', 14, ALWhite);
  ShapeGradientBtn.OnMouseEnter(@CommonOnEnter);
  ShapeGradientBtn.OnMouseLeave(@CommonOnLeave);
  ShapeGradientBtn.OnClick(@CommonOnClick);

  RShapeSwitch.FCreate(FormLayer.Handle, True);
  RShapeSwitch.SetBounds(320, 59, 40, 20);
  RShapeSwitch.OnMouseEnter(@CommonOnEnter);
  RShapeSwitch.OnMouseLeave(@CommonOnLeave);
  RShapeSwitch.OnChange(@SwitchOnChange);
  RShapeSwitch.OnClick(@CommonOnClick);

  RShapeSwitchSetup.FCreate(FormLayer.Handle, True);
  RShapeSwitchSetup.SetBounds(320, 136, 50, 26);
  RShapeSwitchSetup.SetChecked(True);
  RShapeSwitchSetup.ColorOn(ALAqua);
  RShapeSwitchSetup.StrokeOn(ALFuchsia);
  RShapeSwitchSetup.ColorOff(ALBlueViolet);
  RShapeSwitchSetup.StrokeOff(ALDarkOrange);
  RShapeSwitchSetup.SlideColorOn(ALLimeGreen);
  RShapeSwitchSetup.SlideColorOff(ALTomato);
  RShapeSwitchSetup.SlideInset(3);
  RShapeSwitchSetup.SlideWidth(20);

  RShapeSwitchSetup.OnMouseEnter(@CommonOnEnter);
  RShapeSwitchSetup.OnMouseLeave(@CommonOnLeave);
  RShapeSwitchSetup.OnChange(@SwitchOnChange);
  RShapeSwitchSetup.OnClick(@CommonOnClick);

  TShapeSwitch.FCreate(FormLayer.Handle, False);
  TShapeSwitch.SetBounds(420, 59, 40, 20);
  TShapeSwitch.SetChecked(True);
  TShapeSwitch.SlideWidth(12);
  TShapeSwitch.OnMouseEnter(@CommonOnEnter);
  TShapeSwitch.OnMouseLeave(@CommonOnLeave);
  TShapeSwitch.OnChange(@SwitchOnChange);
  TShapeSwitch.OnClick(@CommonOnClick);

  TShapeSwitchSetup.FCreate(FormLayer.Handle, False);
  TShapeSwitchSetup.SetBounds(420, 136, 50, 26);
  TShapeSwitchSetup.ColorOn(ALAqua);
  TShapeSwitchSetup.StrokeOn(ALFuchsia);
  TShapeSwitchSetup.ColorOff(ALBlueViolet);
  TShapeSwitchSetup.StrokeOff(ALDarkOrange);
  TShapeSwitchSetup.SlideWidth(16);
  TShapeSwitchSetup.SlideColorOn(ALLimeGreen);
  TShapeSwitchSetup.SlideColorOff(ALTomato);
  TShapeSwitchSetup.SlideInset(0);
  TShapeSwitchSetup.OnMouseEnter(@CommonOnEnter);
  TShapeSwitchSetup.OnMouseLeave(@CommonOnLeave);
  TShapeSwitchSetup.OnChange(@SwitchOnChange);
  TShapeSwitchSetup.OnClick(@CommonOnClick);

  TestText.FCreate(FormLayer.Handle);
  TestText.SetBounds(470, 90, 150, 30);
  TestText.Text('...');
  TestText.TextSetting(False, txCenter, txCenter);
  TestText.FontSetting('Segoe UI Variable Display Semib', 20, ALBlack);

  ShapeProgressBar.FCreate(FormLayer.Handle);
  ShapeProgressBar.SetBounds(80, 210, 399, 29);
  ShapeProgressBar.Value(50);
  ShapeProgressBar.Corner(3);
  ShapeProgressBar.Gradient($FF84FCB2, $FF395872, gsLinear);
  ShapeProgressBar.GradientLinearAngle(65);
  ShapeProgressBar.GradientAnimSetup(atIn, 1.8, 0, False, True, True);
  ShapeProgressBar.GradientAnimInterpolation(itLinear);
  ShapeProgressBar.GradientAnimColors($FF84FCB2, $FF395872, $FF395872, $FF84FCB2);
  ShapeProgressBar.GradientAnimEnable(True);

  ShapeArc.FCreate(FormLayer.Handle);
  ShapeArc.SetBounds(230, 260, 115);
  ShapeArc.BackStrokeColor($FFFFFFFF);
  ShapeArc.StrokeColor($FF005FB8);
  ShapeArc.StrokeSetting(8, scRound, sdSolid);
  ShapeArc.FontSetting('Segoe UI Bold', 26, $FF005FB8);
  ShapeArc.Max(100);
  ShapeArc.Value(50);

  ProgressTrackbar.FCreate(FormLayer.Handle);
  ProgressTrackbar.SetBounds(80, 385, 399, 29);
  ProgressTrackbar.Value(50);
  ProgressTrackbar.OnChange(@TrackbarOnChange);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(630, 480);
  FMXDesigning;
  FMXForm.Show;
end;

procedure CurPageChanged(CurPageID : Integer);
begin
  SwitchOnChange(nil);
end;
