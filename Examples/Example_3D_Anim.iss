[Setup]
AppName=FMXBridge_3D Anim
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

Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy
Source: "Files\Cursor\Dark.ani"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  FMXViewport3D    : FViewport3D;
  FMXLayer3D       : array [1..2] of FLayer3D;
  FMXFloatAnimation: array [1..2] of FFloatAnimation;

  PageTitle1       : FText;
  PageText1        : FText;
  PageHint1        : FText;

  PageTitle2       : FText;
  PageText2        : FText;
  PageHint2        : FText;

  Btn              : array [1..2] of FButton;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

  CurrentPage      : Integer;
  PageAnimating    : Boolean;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm       := InitFormHandle;
  FormLayer     := InitLayoutHandle;
  TitleBar      := InitWinTitleBarHandle;

  FMXViewport3D := InitViewport3DHandle;

  for i := 1 to 2 do
    FMXLayer3D[i] := InitLayer3DHandle;

  for i := 1 to 2 do
    FMXFloatAnimation[i] := InitFloatAnimation;

  PageTitle1 := InitTextHandle;
  PageText1  := InitTextHandle;
  PageHint1  := InitTextHandle;

  PageTitle2 := InitTextHandle;
  PageText2  := InitTextHandle;
  PageHint2  := InitTextHandle;

  for i := 1 to 2 do
    Btn[i] := InitButtonHandle;

  ExitForm          := InitMsgFormHandle;
  ExitFormTitleBar  := InitWinTitleBarHandle;
  ExitFormLabel1    := InitLabelHandle;
  ExitFormLabel2    := InitLabelHandle;
  ExitFormYesBtn    := InitButtonHandle;
  ExitFormNoBtn     := InitButtonHandle;
  ExitFormBottomBar := InitStatusBarHandle;
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

procedure Page2EnterFinished(Sender: TObject);
begin
  CurrentPage := 2;
  PageAnimating := False;
end;

procedure Page1LeaveFinished(Sender: TObject);
begin
  FMXLayer3D[1].Visible(False);

  FMXLayer3D[2].RotationAngleX(0);
  FMXLayer3D[2].RotationAngleY(270);
  FMXLayer3D[2].Visible(True);

  FMXFloatAnimation[2].SetValues(270, 360);
  FMXFloatAnimation[2].OnFinish(@Page2EnterFinished);
  FMXFloatAnimation[2].Start;
end;

procedure GoToPage2;
begin
  if PageAnimating then
    Exit;

  if CurrentPage = 2 then
    Exit;

  PageAnimating := True;

  FMXLayer3D[1].RotationAngleX(0);
  FMXLayer3D[1].RotationAngleY(0);
  FMXLayer3D[1].Visible(True);

  FMXLayer3D[2].Visible(False);

  FMXFloatAnimation[1].SetValues(0, 90);
  FMXFloatAnimation[1].OnFinish(@Page1LeaveFinished);
  FMXFloatAnimation[1].Start;
end;

procedure Page1EnterFinished(Sender: TObject);
begin
  CurrentPage := 1;
  PageAnimating := False;
end;

procedure Page2LeaveFinished(Sender: TObject);
begin
  FMXLayer3D[2].Visible(False);

  FMXLayer3D[1].RotationAngleX(0);
  FMXLayer3D[1].RotationAngleY(90);
  FMXLayer3D[1].Visible(True);

  FMXFloatAnimation[1].SetValues(90, 0);
  FMXFloatAnimation[1].OnFinish(@Page1EnterFinished);
  FMXFloatAnimation[1].Start;
end;

procedure GoToPage1;
begin
  if PageAnimating then
    Exit;

  if CurrentPage = 1 then
    Exit;

  PageAnimating := True;

  FMXLayer3D[2].RotationAngleX(0);
  FMXLayer3D[2].RotationAngleY(360);
  FMXLayer3D[2].Visible(True);

  FMXLayer3D[1].Visible(False);

  FMXFloatAnimation[2].SetValues(360, 270);
  FMXFloatAnimation[2].OnFinish(@Page2LeaveFinished);
  FMXFloatAnimation[2].Start;
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

    TObject(Btn[1].GetObject):
      GoToPage2;

    TObject(Btn[2].GetObject):
      GoToPage1;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALCornflowerBlue, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);
  FMXForm.SetCursor(ExtractAndLoad('Dark.ani'));

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  FMXViewport3D.FCreate(FormLayer.Handle);
  FMXViewport3D.Align(Client);
  FMXViewport3D.UsingDesignCamera(True);
  FMXViewport3D.Multisample(msFourSamples);
  FMXViewport3D.Color(ALNull);

  FMXLayer3D[1].FCreate(FMXViewport3D.Handle);
  FMXLayer3D[1].Projection(pjScreen);
  FMXLayer3D[1].FillColor($FFFAEBD7);
  FMXLayer3D[1].ZWrite(False);
  FMXLayer3D[1].Align(Client);

  FMXLayer3D[2].FCreate(FMXViewport3D.Handle);
  FMXLayer3D[2].Projection(pjScreen);
  FMXLayer3D[2].FillColor($FF00CED1);
  FMXLayer3D[2].ZWrite(False);
  FMXLayer3D[2].Align(Client);

  PageTitle1.FCreate(FMXLayer3D[1].Handle);
  PageTitle1.SetBounds(50, 95, 540, 55);
  PageTitle1.FontSetting('Segoe UI Variable Display Semib', 30, $FFFFFFFF);
  PageTitle1.Text('FMXBridge');

  PageText1.FCreate(FMXLayer3D[1].Handle);
  PageText1.SetBounds(52, 160, 540, 80);
  PageText1.FontSetting('Segoe UI Variable Text SemiBold', 18, $FF8CA9C7);
  PageText1.Text('3D User Interface');

  PageHint1.FCreate(FMXLayer3D[1].Handle);
  PageHint1.SetBounds(52, 230, 540, 55);
  PageHint1.FontSetting('Segoe UI', 14, $FF66788E);
  PageHint1.Text('Real-time page transition using TLayer3D');

  Btn[1].FCreate(FMXLayer3D[1].Handle);
  Btn[1].SetBounds(450, 365, 125, 34);
  Btn[1].Text('Next  >');
  Btn[1].OnClick(@CommonOnClick);
  Btn[1].SetHint('Next page');

  PageTitle2.FCreate(FMXLayer3D[2].Handle);
  PageTitle2.SetBounds(50, 95, 540, 55);
  PageTitle2.FontSetting('Segoe UI Variable Display Semib', 30, $FFFFFFFF);
  PageTitle2.Text('3D Interface');

  PageText2.FCreate(FMXLayer3D[2].Handle);
  PageText2.SetBounds(50, 160, 540, 80);
  PageText2.FontSetting('Segoe UI Variable Text SemiBold', 18, $FFCC9AB8);
  PageText2.Text('Hardware accelerated');

  PageHint2.FCreate(FMXLayer3D[2].Handle);
  PageHint2.SetBounds(50, 230, 540, 55);
  PageHint2.FontSetting('Segoe UI', 14, $FF806A7C);
  PageHint2.Text('TLayer3D  +  TFloatAnimation  +  3D rotation');

  Btn[2].FCreate(FMXLayer3D[2].Handle);
  Btn[2].SetBounds(65, 365, 125, 34);
  Btn[2].Text('<  Back');
  Btn[2].OnClick(@CommonOnClick);
  Btn[2].SetHint('Previous page');

  FMXFloatAnimation[1].FCreate(FMXLayer3D[1].Handle);
  FMXFloatAnimation[1].Enabled(False);
  FMXFloatAnimation[1].PropertyName('RotationAngle.Y');
  FMXFloatAnimation[1].AnimationType(atIn, 0.5, 0, False, False, False);
  FMXFloatAnimation[1].StartFromCurrent(False);
  FMXFloatAnimation[1].SetValues(0, 0);

  FMXFloatAnimation[2].FCreate(FMXLayer3D[2].Handle);
  FMXFloatAnimation[2].Enabled(False);
  FMXFloatAnimation[2].PropertyName('RotationAngle.Y');
  FMXFloatAnimation[2].AnimationType(atIn, 0.5, 0, False, False, False);
  FMXFloatAnimation[2].StartFromCurrent(False);
  FMXFloatAnimation[2].SetValues(0, 0);

  FMXLayer3D[1].RotationAngleX(0);
  FMXLayer3D[1].RotationAngleY(0);
  FMXLayer3D[1].Visible(True);

  FMXLayer3D[2].RotationAngleX(0);
  FMXLayer3D[2].RotationAngleY(270);
  FMXLayer3D[2].Visible(False);

  CurrentPage := 1;
  PageAnimating := False;

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, ALCornflowerBlue, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($800E192B);

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
