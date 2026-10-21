[Setup]
AppName=FMXBridge_CopyMoveFiles
AppVersion=1.0
CreateAppDir=no
AppCopyright=audiofeel
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

Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  Text1            : FText;
  CopyBtn          : FButton;
  MoveBtn          : FButton;

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
  CopyBtn          := InitButtonHandle;
  MoveBtn          := InitButtonHandle;

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
var
  SourceDir, DestDir: WideString;
  Masks: WideString;
  Count: Integer;
begin
  case Sender of

    TObject(TitleBar.GetObjectCloseBtn):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

    TObject(CopyBtn.GetObject):
    begin
      SourceDir := ExpandConstant('{src}\GameData');
      DestDir   := ExpandConstant('{src}\Backup');
      Masks     := '*.txt|*.pdf|*.bin';
      Count     := CopyFiles(SourceDir, DestDir, Masks, True);

      if Count > 0 then
        MsgBox(IntToStr(Count) + ' файлов скопировано в ' + DestDir, mbInformation, MB_OK)
      else
        MsgBox('Файлы для копирования не найдены.', mbInformation, MB_OK);

      MoveBtn.Enabled(True);
      CopyBtn.Enabled(False);
    end;

    TObject(MoveBtn.GetObject):
    begin
      SourceDir := ExpandConstant('{src}\Backup');
      DestDir   := ExpandConstant('{src}\GameData');
      Masks     := '*.txt|*.pdf|*.bin';
      Count     := MoveFiles(SourceDir, DestDir, Masks, True);

      if Count > 0 then
        MsgBox(IntToStr(Count) + ' файлов перемещено в ' + DestDir, mbInformation, MB_OK)
      else
        MsgBox('Файлы для перемещения не найдены.', mbInformation, MB_OK);

      MoveBtn.Enabled(False);
      CopyBtn.Enabled(True);
    end;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALAzure, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Text1.FCreate(FormLayer.Handle);
  Text1.SetBounds(0, 140, 640, 98);
  Text1.FontSetting('Segoe UI Variable Display', 16, $FFFFFFFF);
  Text1.TextSetting(False, txCenter, txCenter);
  Text1.Text('');

  CopyBtn.FCreate(FormLayer.Handle);
  CopyBtn.SetBounds(30, 60, 96, 27);
  CopyBtn.Text('Copy Files');
  CopyBtn.OnClick(@CommonOnClick);

  MoveBtn.FCreate(FormLayer.Handle);
  MoveBtn.SetBounds(30, 100, 96, 27);
  MoveBtn.Text('Move Files');
  MoveBtn.OnClick(@CommonOnClick);
  MoveBtn.Enabled(False);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, ALAzure, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, False);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display', 20, $FF767676);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text', 15, $FF767676);
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
