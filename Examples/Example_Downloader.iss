[Setup]
AppName=FMXBridge_Downloader
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
Source: "Files\Images\wallpapers10.jpg"; Flags: dontcopy
Source: "Files\Images\wallpapers7.jpg"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

const
  DKB = 1024;
  DMB = DKB * 1024;

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  PBar             : FProgressBar;
  PText            : array[1..4] of FText;
  PButton          : array[1..2] of FButton;

  NetHTTPClient    : FNetHTTPClient;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

  DownloadCancel   : Boolean;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  PBar             := InitProgressBarHandle;
  for i:= 1 to 4 do PText[i]:= InitTextHandle;
  for i:= 1 to 2 do PButton[i]:= InitButtonHandle;

  NetHTTPClient    := InitNetHTTPClient;

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
  Confirm:= False;
end;

function FMXBridgeDownloadCallback(const FUrl, FOutfile: WideString; const ProgressCurrent, ProgressMax, SpeedKBps: Int64): Boolean;
begin
  PText[1].Text('Веб-адрес: ' + FUrl);
  PText[2].Text('Файл: ' + FOutfile);
  PText[3].Text(Format('%0.1d%%',[(ProgressCurrent * 100) / ProgressMax]));
  PText[4].Text(Format('Загружено: %0.1d Мб из %0.1d Мб,  Скорость: %0.1d КБ/Сек', [ProgressCurrent / DMB, ProgressMax / DMB, SpeedKBps / DKB]));

  PText[3].Left(PText[2].GetLeft + PText[2].GetWidth + 10);

  PBar.Max(ProgressMax);
  PBar.Value(ProgressCurrent);

  Result:= DownloadCancel;
end;

procedure DownloadBtnOnClick(Sender: TObject);
var
  surl, soutput, s: WideString;
begin
  PButton[1].Enabled(False);

  s:= AddBackslash(ExpandConstant('{src}\MyDownloads'));
  ForceDirectories(s);

  DownloadCancel:= False;

  FMXForm.Caption('{#SetupSetting('AppName')}' + ' - Пожалуйста ждите ...');
  surl:= 'https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_IA64.exe';
  soutput:= s + 'vc_redist_x64_2008.exe';

  NetHTTPClient.DownloadStart(surl, soutput, @FMXBridgeDownloadCallback);

  if DownloadCancel then
  begin
    PButton[1].Enabled(True)
    Exit;
  end;

  surl:= 'https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe';
  soutput:= s + 'vc_redist_x64_2015.exe';

  NetHTTPClient.DownloadStart(surl, soutput, @FMXBridgeDownloadCallback);

  PButton[1].Enabled(True);
end;

procedure DownloadStopBtnOnClick(Sender: TObject);
begin
  DownloadCancel:= True;
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectCloseBtn):
    begin
      ExitForm.Show;
      DownloadCancel:= True;
    end;

    TObject(ExitFormYesBtn.GetObject):
    begin
      NetHTTPClient.DownloadStop;
      WizardForm.CancelButton.OnClick(nil);
    end;

    TObject(ExitFormNoBtn.GetObject):
    begin
      ExitForm.Close;
      DownloadCancel:= False;
    end;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, ExtractAndLoad('wallpapers10.jpg'), True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF0E192B);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  PText[1].FCreate(FormLayer.Handle);
  PText[1].SetBounds(60, 75, 520, 20);
  PText[1].Text('Веб-адрес:');
  PText[1].TextSetting(False, txLeading, txLeading);
  PText[1].FontSetting('Segoe UI Variable Text', 12, $FFFFFFFF);

  PText[2].FCreate(FormLayer.Handle);
  PText[2].SetBounds(60, 100, 520, 20);
  PText[2].Text('Файл:');
  PText[2].TextSetting(False, txLeading, txLeading);
  PText[2].FontSetting('Segoe UI Variable Text', 12, $FFFFFFFF);

  PBar.FCreate(FormLayer.Handle);
  PBar.SetBounds(60, 130, 520, 20);

  PText[3].FCreate(PBar.Handle);
  PText[3].Align(Center);
  PText[3].Text('0%');
  PText[3].TextSetting(False, txCenter, txCenter);
  PText[3].FontSetting('Segoe UI Variable Text Semibold', 12, $FFFFFFFF);

  PText[4].FCreate(FormLayer.Handle);
  PText[4].SetBounds(60, 160, 520, 20);
  PText[4].Text('Загружено: 0.0 Мб из 0.0 Мб,  Скорость: 0.0 КБ/Сек');
  PText[4].TextSetting(False, txLeading, txLeading);
  PText[4].FontSetting('Segoe UI Variable Text', 12, $FFFFFFFF);

  PButton[1].FCreate(FormLayer.Handle);
  PButton[1].left(60);
  PButton[1].top(210);
  PButton[1].Text('Загрузить');
  PButton[1].OnClick(@DownloadBtnOnClick);

  PButton[2].FCreate(FormLayer.Handle);
  PButton[2].left(PButton[1].GetLeft + PButton[1].GetWidth + 10);
  PButton[2].top(210);
  PButton[2].Text('Отменить');
  PButton[2].OnClick(@DownloadStopBtnOnClick);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, ExtractAndLoad('wallpapers7.jpg'), True);
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
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FF7CFC00);
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
  EmptyWizardForm(640, 450);
  FMXDesigning;
  FMXForm.Show;
end;
