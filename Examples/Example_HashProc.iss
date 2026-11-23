
[Setup]
AppName=Example_HashProc
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy
Source: "Hash\Hash.blake3_256"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm   : FForm;
  FormLayer : FLayout;
  TitleBar  : FWinTitleBar;

  PageLayout           : FLayout;
  PageTitle            : FLabel;
  PageSubtitle         : FLabel;
  StatusLabel          : FLabel;
  CurrentFileCaption   : FLabel;
  CurrentFileLabel     : FLabel;
  CurrentProgressLabel : FLabel;
  VerifyPB1            : FProgressBar;
  TotalProgressLabel   : FLabel;
  VerifyPB2            : FProgressBar;
  SummaryLabel         : FLabel;
  VerifyMemo           : FMemo;

  StartButton  : FButton;
  PauseButton  : FButton;
  ResumeButton : FButton;
  CancelButton : FButton;

  Hash            : FHashProc;
  OKCount         : Integer;
  BadCount        : Integer;
  MissingCount    : Integer;
  ErrorCount      : Integer;
  HashRunning     : Boolean;
  HashPaused      : Boolean;
  CancelRequested : Boolean;
  CancelAll       : Boolean;

procedure FMXInit;
begin
  FMXForm   := InitFormHandle;
  FormLayer := InitLayoutHandle;
  TitleBar  := InitWinTitleBarHandle;

  PageLayout           := InitLayoutHandle;
  PageTitle            := InitLabelHandle;
  PageSubtitle         := InitLabelHandle;
  StatusLabel          := InitLabelHandle;
  CurrentFileCaption   := InitLabelHandle;
  CurrentFileLabel     := InitLabelHandle;
  CurrentProgressLabel := InitLabelHandle;
  VerifyPB1            := InitProgressBarHandle;
  TotalProgressLabel   := InitLabelHandle;
  VerifyPB2            := InitProgressBarHandle;
  SummaryLabel         := InitLabelHandle;
  VerifyMemo           := InitMemoHandle;

  StartButton  := InitButtonHandle;
  PauseButton  := InitButtonHandle;
  ResumeButton := InitButtonHandle;
  CancelButton := InitButtonHandle;
end;

function InitializeSetup(): Boolean;
begin
  FMXInit;
  Result := True;
end;

procedure DeinitializeSetup;
begin
  if Hash <> nil then
    Hash.Shutdown;

  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;

procedure StopHashVerification; forward;

procedure CommonOnClick(Sender: TObject);
begin
  if Sender = TObject(TitleBar.GetObjectMinBtn) then
    FMXForm.Minimize
  else
  if Sender = TObject(TitleBar.GetObjectCloseBtn) then
  begin
    if HashRunning then
      StopHashVerification
    else
      WizardForm.Close;
  end;
end;

procedure UpdateHashButtons;
begin
  StartButton.Enabled(not HashRunning);
  PauseButton.Enabled(HashRunning and not HashPaused);
  ResumeButton.Enabled(HashRunning and HashPaused);
  CancelButton.Enabled(HashRunning and not CancelRequested);
end;

procedure UpdateHashSummary(TotalFiles, FileCounted: Integer);
begin
  SummaryLabel.Text('Файлов: ' + IntToStr(FileCounted) + ' / ' + IntToStr(TotalFiles) +
                    '    OK: ' + IntToStr(OKCount) +
                    '    Не совпадает: ' + IntToStr(BadCount) +
                    '    Ошибки: ' + IntToStr(ErrorCount) +
                    '    Нет файла: ' + IntToStr(MissingCount));
end;

function VerifyHashCallback(FileName: WideString; FileSize, FileProgress, TotalProgress: Extended; TotalFiles, FileCounted, StatusCode: Integer): Boolean;
var
  ErrorText: String;
begin
  case StatusCode of
    FHASH_STATUS_OK:
    begin
      Inc(OKCount);
      VerifyMemo.AddLine(ExtractFileName(FileName) + '  -  OK');
    end;

    FHASH_STATUS_MISMATCH:
    begin
      Inc(BadCount);
      VerifyMemo.AddLine(ExtractFileName(FileName) + '  -  НЕ СОВПАДАЕТ');
    end;

    FHASH_STATUS_MISSING:
    begin
      Inc(MissingCount);
      VerifyMemo.AddLine(ExtractFileName(FileName) + '  -  ФАЙЛ НЕ НАЙДЕН');
    end;

    FHASH_STATUS_PROGRESS:
      ;
  else
  begin
    Inc(ErrorCount);
    ErrorText := Hash.GetCurrentFileErrorMessage;
    if ErrorText = '' then
      ErrorText := Hash.GetErrorMessage;
      VerifyMemo.AddLine(ExtractFileName(FileName) + '  -  ОШИБКА: ' + ErrorText);
    end;
  end;

  CurrentFileLabel.Text(ExtractFileName(FileName));
  CurrentProgressLabel.Text('Текущий файл: ' + IntToStr(Round(FileProgress)) + '%');
  VerifyPB1.Value(Single(FileProgress));

  TotalProgressLabel.Text('Общий прогресс: ' + IntToStr(Round(TotalProgress)) + '%');
  VerifyPB2.Value(Single(TotalProgress));

  UpdateHashSummary(TotalFiles, FileCounted);

  Result := CancelAll;
end;

procedure StartHashVerification;
var
  Code: Integer;
begin
  if HashRunning then
    Exit;

  if Hash = nil then
    Hash := InitHashProc;

  OKCount := 0;
  BadCount := 0;
  MissingCount := 0;
  ErrorCount := 0;
  CancelAll := False;
  CancelRequested := False;
  HashPaused := False;
  HashRunning := True;

  VerifyMemo.Clear;
  VerifyMemo.AddLine('Проверка контрольных сумм BLAKE3-256');
  VerifyMemo.AddLine('Манифест: Hash.blake3_256');
  VerifyMemo.AddLine('');

  CurrentFileLabel.Text('Ожидание первого файла...');
  CurrentProgressLabel.Text('Текущий файл: 0%');
  TotalProgressLabel.Text('Общий прогресс: 0%');
  VerifyPB1.Value(0);
  VerifyPB2.Value(0);
  UpdateHashSummary(0, 0);

  StatusLabel.Text('Проверка выполняется...');
  UpdateHashButtons;

  Code := Hash.VerifyManifest(ExtractAndLoad('Hash.blake3_256'), ExpandConstant('{win}\Fonts'), @VerifyHashCallback);

  HashRunning := False;
  HashPaused := False;
  UpdateHashButtons;

  if CancelRequested then
  begin
    StatusLabel.Text('Проверка отменена пользователем.');
    VerifyMemo.AddLine('');
    VerifyMemo.AddLine('Проверка отменена пользователем.');
  end
  else
  if Code < FHASH_OK then
  begin
    StatusLabel.Text('Проверка завершилась с ошибкой.');
    VerifyMemo.AddLine('');
    VerifyMemo.AddLine('ОШИБКА: ' + Hash.GetErrorMessage);
    MsgBox(Hash.GetErrorMessage, mbError, MB_OK);
  end
  else
  begin
    StatusLabel.Text('Проверка завершена.');
    VerifyMemo.AddLine('');
    VerifyMemo.AddLine('Проверка завершена.');
  end;
end;

procedure PauseHashVerification;
begin
  if (Hash = nil) or not HashRunning or HashPaused then
    Exit;

  Hash.Pause;
  HashPaused := True;
  StatusLabel.Text('Проверка приостановлена.');
  UpdateHashButtons;
end;

procedure ResumeHashVerification;
begin
  if (Hash = nil) or not HashRunning or not HashPaused then
    Exit;

  Hash.Resume;
  HashPaused := False;
  StatusLabel.Text('Проверка выполняется...');
  UpdateHashButtons;
end;

procedure StopHashVerification;
begin
  if (Hash = nil) or not HashRunning or CancelRequested then
    Exit;

  CancelRequested := True;
  CancelAll := True;
  Hash.Stop;
  StatusLabel.Text('Остановка проверки...');
  CancelButton.Enabled(False);
  PauseButton.Enabled(False);
  ResumeButton.Enabled(False);
end;

procedure HashPageButtonClick(Sender: TObject);
begin
  if Sender = TObject(StartButton.GetObject) then
    StartHashVerification
  else
  if Sender = TObject(PauseButton.GetObject) then
    PauseHashVerification
  else
  if Sender = TObject(ResumeButton.GetObject) then
    ResumeHashVerification
  else
  if Sender = TObject(CancelButton.GetObject) then
    StopHashVerification;
end;

procedure SetupLabel(Control: FLabel; X, Y, W, H: Integer; const TextValue: String; FontSize: Single; FontColor: Cardinal);
begin
  Control.FCreate(PageLayout.Handle);
  Control.SetBounds(X, Y, W, H);
  Control.Text(TextValue);
  Control.FontSetting('Consolas', FontSize, FontColor);
  Control.TextSetting(False, txLeading, txLeading);
end;

procedure SetupButton(Control: FButton; X, Y, W, H: Integer; const TextValue: String);
begin
  Control.FCreate(PageLayout.Handle);
  Control.SetBounds(X, Y, W, H);
  Control.Text(TextValue);
  Control.FontSetting('Consolas', 12, $FFFFFFFF);
  Control.TextSetting(False, txCenter, txCenter);
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FFFF7F50, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);
  FMXForm.Caption('FMXBridge - проверка контрольных сумм');

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.Height(36);
  TitleBar.SetColor($800E192B);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  PageLayout.FCreate(FormLayer.Handle);
  PageLayout.SetBounds(24, 44, 752, 424);

  SetupLabel(PageTitle, 0, 0, 752, 28, 'Проверка целостности файлов', 19, $FFFFFFFF);
  SetupLabel(PageSubtitle, 0, 30, 752, 22, 'BLAKE3-256  |  Сверка файлов с контрольными суммами из манифеста', 10, $FFE0E6EF);
  SetupLabel(StatusLabel, 0, 58, 752, 20, 'Ожидание запуска проверки', 13, $FFFFD18A);
  SetupLabel(CurrentFileCaption, 0, 88, 752, 18, 'Текущий файл', 11, $FFE0E6EF);
  SetupLabel(CurrentFileLabel, 0, 108, 752, 18, '—', 11, $FFFFFFFF);
  SetupLabel(CurrentProgressLabel, 0, 128, 752, 17, 'Текущий файл: 0%', 11, $FFE0E6EF);

  VerifyPB1.FCreate(PageLayout.Handle);
  VerifyPB1.SetBounds(0, 147, 752, 14);
  VerifyPB1.Min(0);
  VerifyPB1.Max(100);
  VerifyPB1.Value(0);

  SetupLabel(TotalProgressLabel, 0, 174, 752, 18, 'Общий прогресс: 0%', 12, $FFE0E6EF);

  VerifyPB2.FCreate(PageLayout.Handle);
  VerifyPB2.SetBounds(0, 194, 752, 14);
  VerifyPB2.Min(0);
  VerifyPB2.Max(100);
  VerifyPB2.Value(0);

  SetupLabel(SummaryLabel, 0, 219, 752, 20, 'Файлов: 0 / 0    OK: 0    Не совпадает: 0    Ошибки: 0    Нет файла: 0', 11, $FFFFFFFF);

  VerifyMemo.FCreate(PageLayout.Handle);
  VerifyMemo.SetBounds(0, 247, 752, 123);
  VerifyMemo.FontSetting('Consolas', 12, $FFE6EDF3);
  VerifyMemo.ReadOnly(True);
  VerifyMemo.AutoHide(False);
  VerifyMemo.ShowScrollBars(True);
  VerifyMemo.TextPrompt('Здесь будет журнал проверки файлов...');
  VerifyMemo.AddLine('Журнал проверки готов. Нажмите «Старт» для начала.');

  SetupButton(StartButton, 344, 382, 94, 36, 'Старт');
  SetupButton(PauseButton, 446, 382, 94, 36, 'Пауза');
  SetupButton(ResumeButton, 548, 382, 94, 36, 'Продолжить');
  SetupButton(CancelButton, 650, 382, 102, 36, 'Отмена');

  StartButton.OnClick(@HashPageButtonClick);
  PauseButton.OnClick(@HashPageButtonClick);
  ResumeButton.OnClick(@HashPageButtonClick);
  CancelButton.OnClick(@HashPageButtonClick);

  PauseButton.Enabled(False);
  ResumeButton.Enabled(False);
  CancelButton.Enabled(False);
end;

procedure InitializeWizard;
begin
  EmptyWizardForm(800, 480);

  FMXDesigning;
  FMXForm.Show;
end;
