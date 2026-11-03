[Setup]
AppId=FMXBridge_LocalizeControls
AppName=FMXBridge_LocalizeControls
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

Source: "Files\Cursor\Light.ani"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy
Source: "Modules\Licenses\LICENSE-FMXBridge.txt"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  Edit             : FEdit;
  Memo             : FMemo;

  ExitForm         : FMsgForm;
  ExitFormLayer    : FLayout;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;

  LocalizeControls : WideString;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  Edit             := InitEditHandle;
  Memo             := InitMemoHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormLayer    := InitLayoutHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitButtonHandle;
  ExitFormNoBtn    := InitButtonHandle;
end;

function InitializeSetup(): Boolean;
begin
  if (GetUILanguage and $3FF) = $19 then
    LocalizeControls:= 'ru'
  else
    LocalizeControls:= 'en';

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
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALRosyBrown, '', True);
  FMXForm.SetCursor(ExtractAndLoad('Light.ani'));
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);
  FMXForm.SetContextMenuLanguage(LocalizeControls);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Edit.FCreate(FormLayer.Handle);
  Edit.SetBounds(60, 91, 482, 26);
  Edit.Text(WizardForm.DirEdit.Text);

  Memo.FCreate(FormLayer.Handle);
  Memo.SetBounds(60, 141, 482, 166);
  Memo.LoadFromfile(ExtractAndLoad('LICENSE-FMXBridge.txt'));

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, ALCoral, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(221);
  ExitForm.Width(435);

  ExitFormLayer.FCreate(ExitForm.Handle);
  ExitFormLayer.Align(Contents);
  ExitFormLayer.HitTest(True);
  ExitForm.AddMouseDownControls(ExitFormLayer.Handle);

  ExitFormLabel1.FCreate(ExitFormLayer.Handle);
  ExitFormLabel1.SetBounds(15, 49, 405, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display', 20, ALChartreuse);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitFormLayer.Handle);
  ExitFormLabel2.SetBounds(15, 93, 405, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text', 15, $FF767676);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormYesBtn.FCreate(ExitFormLayer.Handle);
  ExitFormYesBtn.SetBounds(273, 177, 46, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitFormLayer.Handle);
  ExitFormNoBtn.SetBounds(332, 177, 72, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(600, 400);
  FMXDesigning;
  FMXForm.Show;
end;
