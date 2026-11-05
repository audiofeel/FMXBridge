[Setup]
AppName=FMXBridge_Path
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

const
  PathCount = 6;

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  PathData         : array [1..PathCount] of String;
  Path             : array [1..PathCount] of FPath;

  PosX             : array [1..PathCount] of Integer;
  PosY             : array [1..PathCount] of Integer;

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

  for i:= 1 to PathCount do Path[i]:= InitPathHandle;

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

procedure InitPositions;
begin
  PosX[1]:= 40;  PosY[1]:= 90;
  PosX[2]:= 240; PosY[2]:= 90;
  PosX[3]:= 440; PosY[3]:= 90;
  PosX[4]:= 40;  PosY[4]:= 250;
  PosX[5]:= 240; PosY[5]:= 250;
  PosX[6]:= 440; PosY[6]:= 250;
end;

procedure FMXDesigning;
var
  i: Integer;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, '', True);
  FMXForm.GradientFormColors(TAlphaColor($FF000000 or Random($00FFFFFF)), TAlphaColor($00FFFFFF or Random($FF000000)), gsRadial);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  PathData[1] :=
    'M 249.2 123.1 ' +
    'c 18.9 -33.9 -4.2 -74.7 -42.9 -78.6 l -14.1 -1.4 ' +
    'c -10.2 -1.02 -19.4 -5.4 -27.1 -14 ' +
    'c -26.5 -29.8 -76.1 -22.4 -92.4 13.3 ' +
    'c -3.9 8.7 -11.1 15.7 -20.2 19.6 l -19.8 8.6 ' +
    'c -31.6 13.8 -42.4 52.1 -22.4 79.5 l 12.6 17.2 ' +
    'c 2.7 3.7 4.7 7.9 5.9 12.3 l 6.2 23 ' +
    'c 8.5 31.5 44.3 48.6 75.6 35.3 l 2.6 -1.1 ' +
    'c 7.9 -3.3 16.9 -4.1 25.4 -2.3 l 41 9.1 ' +
    'c 39.9 8.8 75.1 -25.7 66.2 -63.9 l -5.1 -22.1 ' +
    'c -2.1 -8.9 -0.7 -18.3 3.7 -26.5 l 4.6 -8.3 z';

  PathData[2] :=
    'M 150 100 c 40 -60 120 -60 160 0 c 40 60 -20 140 -80 160 c -60 20 -140 -20 -120 -100 c 20 -80 60 -100 40 -60 z';

  PathData[3] :=
    'M 100 120 c -40 0 -60 -40 -20 -60 c 10 -40 80 -40 100 0 c 40 -20 80 40 40 60 c -20 40 -100 40 -120 0 z';

  PathData[4] :=
    'M 150 150 c 40 0 60 40 20 80 c -40 40 -120 0 -100 -60 c 20 -60 100 -80 140 -20';

  PathData[5] :=
    'M 120 80 c 80 -40 140 40 100 100 c -40 60 -120 80 -160 20 c -40 -60 20 -120 60 -120 z';

  PathData[6] :=
    'M 200 150 c -50 -70 -150 -50 -180 20 c -30 70 40 140 120 120 c 80 -20 120 -80 60 -140 z';

  InitPositions;

  for i:= 1 to PathCount do
  begin
    Path[i].FCreate(FormLayer.Handle);
    Path[i].SetBounds(PosX[i], PosY[i], 165, 165);
    Path[i].DataStr(PathData[i]);
    Path[i].DataWrapMode(pwmStretch);
    Path[i].FillGradient(TAlphaColor($FF000000 or Random($00FFFFFF)), TAlphaColor($00FFFFFF or Random($FF000000)), gsLinear);
  end;

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, '', True);
  ExitForm.GradientFormColors(TAlphaColor($FF000000 or Random($00FFFFFF)), TAlphaColor($00FFFFFF or Random($FF000000)), gsLinear);
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
