[Setup]
AppName=FMXBridge_TaskbarProgress
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

Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;
  Taskbar          : FThumbButtons;

  InfoText         : FText;
  StatusText       : FText;

  Btn25            : FButton;
  Btn50            : FButton;
  Btn75            : FButton;
  BtnIndeterminate : FButton;
  BtnError         : FButton;
  BtnPaused        : FButton;
  BtnClear         : FButton;
  BtnSimulate      : FButton;

procedure SleepWin(Milliseconds: Cardinal);
  external 'Sleep@kernel32.dll stdcall';

procedure FMXInit;
begin
  FMXForm   := InitFormHandle;
  FormLayer := InitLayoutHandle;
  TitleBar  := InitWinTitleBarHandle;
  Taskbar   := InitThumbButtons;

  InfoText   := InitTextHandle;
  StatusText := InitTextHandle;

  Btn25            := InitButtonHandle;
  Btn50            := InitButtonHandle;
  Btn75            := InitButtonHandle;
  BtnIndeterminate := InitButtonHandle;
  BtnError         := InitButtonHandle;
  BtnPaused        := InitButtonHandle;
  BtnClear         := InitButtonHandle;
  BtnSimulate      := InitButtonHandle;
end;

function InitializeSetup(): Boolean;
begin
  FMXInit;
  Result := True;
end;

procedure SetStatus(const AText: String);
begin
  StatusText.Text(AText);
end;

procedure ReportResult(const ADescription: String; const ASuccess: Boolean);
begin
  if ASuccess then
    SetStatus(ADescription + ' - успешно')
  else
    SetStatus(ADescription + ' - ошибка вызова API');
end;

procedure SetNormalProgress(const AValue: Cardinal);
var
  Success: Boolean;
begin
  Success := Taskbar.SetProgressState(TBPF_NORMAL);
  if Success then
    Success := Taskbar.SetProgressValue(AValue, 100);

  ReportResult('Обычный прогресс: ' + IntToStr(AValue) + '%', Success);
end;

procedure CommonOnClick(Sender: TObject);
var
  Success: Boolean;
  I: Integer;
begin
  case Sender of
    TObject(TitleBar.GetObjectMinBtn):
      FMXForm.Minimize;

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.Close;

    TObject(Btn25.GetObject):
      SetNormalProgress(25);

    TObject(Btn50.GetObject):
      SetNormalProgress(50);

    TObject(Btn75.GetObject):
      SetNormalProgress(75);

    TObject(BtnIndeterminate.GetObject):
      ReportResult('Неопределённый прогресс',
        Taskbar.SetProgressState(TBPF_INDETERMINATE));

    TObject(BtnError.GetObject):
    begin
      Success := Taskbar.SetProgressValue(65, 100);
      if Success then
        Success := Taskbar.SetProgressState(TBPF_ERROR);
      ReportResult('Режим ошибки', Success);
    end;

    TObject(BtnPaused.GetObject):
    begin
      Success := Taskbar.SetProgressValue(65, 100);
      if Success then
        Success := Taskbar.SetProgressState(TBPF_PAUSED);
      ReportResult('Режим паузы', Success);
    end;

    TObject(BtnClear.GetObject):
      ReportResult('Сброс прогресса', Taskbar.ClearProgress);

    TObject(BtnSimulate.GetObject):
    begin
      Success := Taskbar.SetProgressState(TBPF_NORMAL);
      if not Success then
      begin
        ReportResult('Имитация прогресса', False);
        Exit;
      end;

      for I := 0 to 100 do
      begin
        Success := Taskbar.SetProgressValue(Cardinal(I), 100);
        if not Success then
          Break;

        if (I mod 10) = 0 then
          SetStatus('Имитация прогресса: ' + IntToStr(I) + '%');

        ProcessMessages;
        SleepWin(30);
      end;

      ReportResult('Имитация прогресса 0–100%', Success);
    end;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALCornsilk, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), ALCoral);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($40000000);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  InfoText.FCreate(FormLayer.Handle);
  InfoText.SetBounds(38, 66, 664, 48);
  InfoText.Text('Проверка индикатора прогресса на кнопке этого FMX-окна в панели задач Windows.');
  InfoText.TextSetting(True, txLeading, txCenter);
  InfoText.FontSetting('Segoe UI Variable Small', 14, ALDarkBlue);

  Btn25.FCreate(FormLayer.Handle);
  Btn25.SetBounds(38, 132, 205, 36);
  Btn25.Text('Обычный: 25%');
  Btn25.StyleLookUp('buttonstyle_accent');
  Btn25.OnClick(@CommonOnClick);

  Btn50.FCreate(FormLayer.Handle);
  Btn50.SetBounds(267, 132, 205, 36);
  Btn50.Text('Обычный: 50%');
  Btn50.StyleLookUp('buttonstyle_accent');
  Btn50.OnClick(@CommonOnClick);

  Btn75.FCreate(FormLayer.Handle);
  Btn75.SetBounds(496, 132, 205, 36);
  Btn75.Text('Обычный: 75%');
  Btn75.StyleLookUp('buttonstyle_accent');
  Btn75.OnClick(@CommonOnClick);

  BtnIndeterminate.FCreate(FormLayer.Handle);
  BtnIndeterminate.SetBounds(38, 181, 205, 36);
  BtnIndeterminate.Text('Неопределённый');
  BtnIndeterminate.StyleLookUp('buttonstyle_accent');
  BtnIndeterminate.OnClick(@CommonOnClick);

  BtnError.FCreate(FormLayer.Handle);
  BtnError.SetBounds(267, 181, 205, 36);
  BtnError.Text('Ошибка: 65%');
  BtnError.StyleLookUp('buttonstyle_accent');
  BtnError.OnClick(@CommonOnClick);

  BtnPaused.FCreate(FormLayer.Handle);
  BtnPaused.SetBounds(496, 181, 205, 36);
  BtnPaused.Text('Пауза: 65%');
  BtnPaused.StyleLookUp('buttonstyle_accent');
  BtnPaused.OnClick(@CommonOnClick);

  BtnClear.FCreate(FormLayer.Handle);
  BtnClear.SetBounds(38, 230, 205, 36);
  BtnClear.Text('Очистить');
  BtnClear.StyleLookUp('buttonstyle_accent');
  BtnClear.OnClick(@CommonOnClick);

  BtnSimulate.FCreate(FormLayer.Handle);
  BtnSimulate.SetBounds(267, 230, 205, 36);
  BtnSimulate.Text('Имитация 0–100%');
  BtnSimulate.StyleLookUp('buttonstyle_accent');
  BtnSimulate.OnClick(@CommonOnClick);

  StatusText.FCreate(FormLayer.Handle);
  StatusText.SetBounds(38, 292, 664, 34);
  StatusText.Text('Готово. Выберите режим проверки.');
  StatusText.TextSetting(True, txLeading, txCenter);
  StatusText.FontSetting('Segoe UI Variable Small', 14, ALDarkBlue);

  if Taskbar.FCreate(FMXForm.HandleHWND) then
    SetStatus('FThumbButtons привязан к HWND FMX-формы. Готово к проверке.')
  else
    SetStatus('Ошибка: FThumbButtons не удалось привязать к HWND FMX-формы.');
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(740, 390);

  FMXDesigning;
  FMXForm.Show;
end;

procedure DeinitializeSetup();
begin
  if Taskbar <> nil then
  begin
    Taskbar.ClearProgress;
    Taskbar := nil;
  end;

  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;
