[Setup]
AppName=FMXBridge_Splitter
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

Source: "Files\Cursor\Light.cur"; Flags: dontcopy
Source: "Files\Images\wallpapers1.jpg"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  LeftRect         : FRectangle;
  LeftText         : FText;
  Splitter         : FSplitter;
  RightRect        : FRectangle;
  RightText        : FText;

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

  LeftRect         := InitRectangleHandle;
  LeftText         := InitTextHandle;
  Splitter         := InitSplitterHandle;
  RightRect        := InitRectangleHandle;
  RightText        := InitTextHandle;

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
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, '', True);
  FMXForm.SetCursor(ExtractAndLoad('Light.cur'));
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FMXForm.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  LeftRect.FCreate(FormLayer.Handle);
  LeftRect.Align(MostLeft);
  LeftRect.Width(100);
  LeftRect.Margins(5, 5, 5, 5);
  LeftRect.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  LeftRect.StrokeColor(TAlphaColor($00FFFFFF or Random($FF000000)));
  LeftRect.StrokeSetting(2, scRound, sdSolid, sjMiter);
  LeftRect.CornerStyle(8, 8, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  LeftText.FCreate(LeftRect.Handle);
  LeftText.Align(Center);
  LeftText.AutoSize(True);
  LeftText.Text('Left');
  LeftText.FontSetting('Segoe UI Variable Display', 32, TAlphaColor($00FFFFFF or Random($FF000000)));
  LeftText.TextSetting(False, txCenter, txCenter);

  Splitter.FCreate(FormLayer.Handle);
  Splitter.Align(Left);
  Splitter.Width(10);
  Splitter.MinSize(100);

  RightRect.FCreate(FormLayer.Handle);
  RightRect.Align(Client);
  RightRect.Margins(5, 5, 5, 5);
  RightRect.FillColor(TAlphaColor($00FFFFFF or Random($FF000000)));
  RightRect.StrokeColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  RightRect.StrokeSetting(2, scRound, sdSolid, sjMiter);
  RightRect.CornerStyle(8, 8, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  RightText.FCreate(RightRect.Handle);
  RightText.Align(Center);
  RightText.AutoSize(True);
  RightText.Text('Right');
  RightText.FontSetting('Segoe UI Variable Display', 32, TAlphaColor($FF000000 or Random($00FFFFFF)));
  RightText.TextSetting(False, txCenter, txCenter);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, ExtractAndLoad('wallpapers1.jpg'), True);
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
  EmptyWizardForm(800, 450);
  FMXDesigning;
  FMXForm.Show;
end;
