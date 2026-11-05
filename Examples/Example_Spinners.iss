[Setup]
AppName=FMXBridge_Spinners
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
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  Spinner: array [1..16] of FSpinner;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  for i:= 1 to 16 do Spinner[i]:= InitSpinnerHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormTitleBar := InitWinTitleBarHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitButtonHandle;
  ExitFormNoBtn    := InitButtonHandle;
  ExitFormBottomBar:= InitStatusBarHandle;
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

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FF5F9EA0, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF0E192B);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  { 1 }
  Spinner[1].FCreate(FormLayer.Handle);
  Spinner[1].SetBounds(60, 60, 60);

  Spinner[2].FCreate(FormLayer.Handle);
  Spinner[2].SetBounds(Spinner[1].GetLeft + Spinner[1].GetWidth + 60, 60, 60);
  Spinner[2].Kind(Arcs);

  Spinner[3].FCreate(FormLayer.Handle);
  Spinner[3].SetBounds(Spinner[2].GetLeft + Spinner[2].GetWidth + 60, 60, 60);
  Spinner[3].Kind(DoubleBounce);

  Spinner[4].FCreate(FormLayer.Handle);
  Spinner[4].SetBounds(Spinner[3].GetLeft + Spinner[3].GetWidth + 60, 60, 60);
  Spinner[4].Kind(FlipPlane);

  Spinner[5].FCreate(FormLayer.Handle);
  Spinner[5].SetBounds(Spinner[4].GetLeft + Spinner[4].GetWidth + 60, 60, 60);
  Spinner[5].Kind(Pulse);

  { 2 }
  Spinner[6].FCreate(FormLayer.Handle);
  Spinner[6].SetBounds(60, 180, 60);
  Spinner[6].Kind(ArcsRing);

  Spinner[7].FCreate(FormLayer.Handle);
  Spinner[7].SetBounds(Spinner[6].GetLeft + Spinner[6].GetWidth + 60, 180, 60);
  Spinner[7].Kind(Ring);

  Spinner[8].FCreate(FormLayer.Handle);
  Spinner[8].SetBounds(Spinner[7].GetLeft + Spinner[7].GetWidth + 60, 180, 60);
  Spinner[8].Kind(ThreeDots);

  Spinner[9].FCreate(FormLayer.Handle);
  Spinner[9].SetBounds(Spinner[8].GetLeft + Spinner[8].GetWidth + 60, 180, 60);
  Spinner[9].Kind(Wave);

  Spinner[10].FCreate(FormLayer.Handle);
  Spinner[10].SetBounds(Spinner[9].GetLeft + Spinner[9].GetWidth + 60, 180, 60);
  Spinner[10].Kind(BallClipRotate);

  { 3 }
  Spinner[11].FCreate(FormLayer.Handle);
  Spinner[11].SetBounds(60, 300, 60);
  Spinner[11].Kind(BallClipRotatePulse);

  Spinner[12].FCreate(FormLayer.Handle);
  Spinner[12].SetBounds(Spinner[11].GetLeft + Spinner[11].GetWidth + 60, 300, 60);
  Spinner[12].Kind(BallClipRotateMultiple);

  Spinner[13].FCreate(FormLayer.Handle);
  Spinner[13].SetBounds(Spinner[12].GetLeft + Spinner[12].GetWidth + 60, 300, 60);
  Spinner[13].Kind(BallScaleRipple);

  Spinner[14].FCreate(FormLayer.Handle);
  Spinner[14].SetBounds(Spinner[13].GetLeft + Spinner[13].GetWidth + 60, 300, 60);
  Spinner[14].Kind(InnerLineSpinFade);

  Spinner[15].FCreate(FormLayer.Handle);
  Spinner[15].SetBounds(Spinner[14].GetLeft + Spinner[14].GetWidth + 60, 300, 60);
  Spinner[15].Kind(LineScalePulseOut);

  { 4 }
  Spinner[16].FCreate(FormLayer.Handle);
  Spinner[16].SetBounds(Spinner[12].GetLeft + Spinner[12].GetWidth + 60, 420, 60);
  Spinner[16].Kind(LineScalePulseOutRapid);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, $FF5F9EA0, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($FF0E192B);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FFF5F5F5);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FFF5F5F5);
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
  EmptyWizardForm(670, 520);
  FMXDesigning;
  FMXForm.Show;

  Spinner[1].Start;
  Spinner[2].Start;
  Spinner[3].Start;
  Spinner[4].Start;
  Spinner[5].Start;
  Spinner[6].Start;
  Spinner[7].Start;
  Spinner[8].Start;
  Spinner[9].Start;
  Spinner[10].Start;
  Spinner[11].Start;
  Spinner[12].Start;
  Spinner[13].Start;
  Spinner[14].Start;
  Spinner[15].Start;
  Spinner[16].Start;
end;
