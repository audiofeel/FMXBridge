[Setup]
AppName=FMXBridge_GifImage
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
Source: "Files\GIFs\?.gif"; Flags: dontcopy
Source: "Files\Images\OpacityForm.png"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  GifImg: array [1..7] of FGifImage;

  ExitForm         : FMsgForm;
  ExitFormLayer    : FLayout;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  for i:=1 to 7 do GifImg[i]:= InitGifImageHandle;

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
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btAcrylic, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($1A000000);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  GifImg[1].FCreate(FormLayer.Handle);
  GifImg[1].SetBounds(0, 30, 130, 104);
  GifImg[1].LoadFromFile(ExtractAndLoad('1.gif'));

  GifImg[2].FCreate(FormLayer.Handle);
  GifImg[2].SetBounds(550, 35, 80, 26);
  GifImg[2].LoadFromFile(ExtractAndLoad('2.gif'));

  GifImg[3].FCreate(FormLayer.Handle);
  GifImg[3].SetBounds(240, 30, 210, 55);
  GifImg[3].LoadFromFile(ExtractAndLoad('3.gif'));

  GifImg[4].FCreate(FormLayer.Handle);
  GifImg[4].SetBounds(242, 65, 200, 200);
  GifImg[4].LoadFromFile(ExtractAndLoad('4.gif'));

  GifImg[5].FCreate(FormLayer.Handle);
  GifImg[5].SetBounds(430, 70, 167, 132);
  GifImg[5].LoadFromFile(ExtractAndLoad('5.gif'));

  GifImg[6].FCreate(FormLayer.Handle);
  GifImg[6].SetBounds(20, 130, 209, 244);
  GifImg[6].LoadFromFile(ExtractAndLoad('6.gif'));

  GifImg[7].FCreate(FormLayer.Handle);
  GifImg[7].SetBounds(350, 210, 280, 266);
  GifImg[7].LoadFromFile(ExtractAndLoad('7.gif'));

  ExitForm.FCreateImageForm(FMXForm.HandleHWND, 0, ExtractAndLoad('OpacityForm.png'), True);
  ExitForm.Caption(CustomMessage('ExitForm'));
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
  EmptyWizardForm(640, 480);
  FMXDesigning;
  FMXForm.Show;
end;
