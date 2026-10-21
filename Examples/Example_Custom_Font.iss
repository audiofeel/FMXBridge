
#define MyFont1 "cuphead.ttf"
#define MyFont1Name "Chailce Noggin Regular"

#define MyFont2 "me123.ttf"
#define MyFont2Name "Mass Effect Game 123"

[Setup]
AppName=FMXBridge_Custom Font
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[CustomMessages]
Text1=Welcome
Text2=Welcome to the Blank Form Test demo.
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
Source: "Files\Fonts\{#MyFont1}"; Flags: dontcopy
Source: "Files\Fonts\{#MyFont2}"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  Text1            : FText;
  Text1Shadow      : FShadowEffect;
  Text2            : FText;
  Text2Shadow      : FShadowEffect;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  Text1            := InitTextHandle;
  Text1Shadow      := InitShadowEffect;
  Text2            := InitTextHandle;
  Text2Shadow      := InitShadowEffect;

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
  AddFontResource(ExtractAndLoad('{#MyFont1}'));
  AddFontResource(ExtractAndLoad('{#MyFont2}'));

  FMXInit;
  Result:= True;
end;

procedure DeinitializeSetup();
begin
  RemoveFontResource(ExpandConstant('{tmp}\{#MyFont1}'));
  RemoveFontResource(ExpandConstant('{tmp}\{#MyFont2}'));

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
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btMain, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);
  FMXForm.ChangeBorderColor($FFFF8C00);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Text1.FCreate(FormLayer.Handle);
  Text1.SetBounds(0, 125, 690, 74);
  Text1.Text(CustomMessage('Text1'));
  Text1.FontSetting('{#MyFont1Name}', 54, ALWhite);
  Text1.TextSetting(False, txCenter, txLeading);

  Text1Shadow.FCreate(Text1.Handle);
  Text1Shadow.ShadowColor($FFFF8C00);

  Text2.FCreate(FormLayer.Handle);
  Text2.SetBounds(0, Text1.GetTop + 90, 690, 40);
  Text2.Text(CustomMessage('Text2'));
  Text2.FontSetting('{#MyFont2Name}', 18, ALWhite);
  Text2.TextSetting(False, txCenter, txLeading);

  Text2Shadow.FCreate(Text2.Handle);
  Text2Shadow.ShadowColor($FFFF8C00);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btMain, True, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);
  ExitForm.ChangeBorderColor($FFFF8C00);

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
  EmptyWizardForm(690, 480);
  FMXDesigning;
  FMXForm.Show;
end;
