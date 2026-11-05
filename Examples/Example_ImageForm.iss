[Setup]
AppName=FMXBridge_ImageForm
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64

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

Source: "Files\Images\OpacityForm.png"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;

  CancelButton     : FButton;
  MinButton        : FButton;
  Text1            : FText;
  Text2            : FText;

  ExitForm         : FMsgForm;
  ExitFormLayer    : FLayout;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;

  CancelButton     := InitButtonHandle;
  MinButton        := InitButtonHandle;
  Text1            := InitTextHandle;
  Text2            := InitTextHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormLayer    := InitLayoutHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitButtonHandle;
  ExitFormNoBtn    := InitButtonHandle;
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

    TObject(CancelButton.GetObject):
      ExitForm.Show;

    TObject(MinButton.GetObject):
      FMXForm.Minimize;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateImageForm(WizardForm.Handle, 0, ExtractAndLoad('OpacityForm.png'), True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  Text1.FCreate(FormLayer.Handle);
  Text1.SetBounds(0, 350, 781, 90);
  Text1.TextSetting(False, txCenter, txLeading);
  Text1.FontSetting('Segoe UI Variable Display', 66, ALMediumSpringGreen);
  Text1.Text('Welcome');
  Text1.HitTest(False);

  Text2.FCreate(FormLayer.Handle);
  Text2.SetBounds(0, 430, 781, 40);
  Text2.TextSetting(False, txCenter, txLeading);
  Text2.FontSetting('Segoe UI Variable Display', 24, ALPaleTurquoise);
  Text2.Text('Welcome to the ImageForm Test demo.');
  Text2.HitTest(False);

  CancelButton.FCreate(FormLayer.Handle);
  CancelButton.SetBounds(750, 170, 60, 68);
  CancelButton.Text('Exit');
  CancelButton.FontSetting('Segoe UI Variable Text Bold', 24, ALPaleTurquoise);
  CancelButton.OnClick(@CommonOnClick);

  MinButton.FCreate(FormLayer.Handle);
  MinButton.SetBounds(680, 170, 60, 68);
  MinButton.Text('Hide');
  MinButton.FontSetting('Segoe UI Variable Text Bold', 24, ALPaleTurquoise);
  MinButton.OnClick(@CommonOnClick);

  ExitForm.FCreateImageForm(FMXForm.HandleHWND, 0, ExtractAndLoad('OpacityForm.png'), True);
  ExitForm.Height(321);
  ExitForm.Width(535);

  ExitFormLayer.FCreate(ExitForm.Handle);
  ExitFormLayer.Align(Contents);
  ExitFormLayer.HitTest(True);
  ExitForm.AddMouseDownControls(ExitFormLayer.Handle);

  ExitFormLabel1.FCreate(ExitFormLayer.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, ALChartreuse);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitFormLayer.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FF767676);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormYesBtn.FCreate(ExitFormLayer.Handle);
  ExitFormYesBtn.SetBounds(333, 237, 46, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitFormLayer.Handle);
  ExitFormNoBtn.SetBounds(392, 237, 72, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(900, 540);
  FMXDesigning;
  FMXForm.Show;
end;
