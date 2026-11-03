
[Setup]
AppName=FMXBridge_BlurRectangle
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
Source: "Files\Images\wallpapers1.jpg"; Flags: dontcopy
Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm               : FForm;
  FormLayer             : FLayout;
  TitleBar              : FWinTitleBar;

  TestBlurLight         : FBlurRectangle;
  TestTextLight         : FLabel;
  TestBlurDark          : FBlurRectangle;
  TestTextDark          : FLabel;

  ExitForm              : FMsgForm;
  ExitFormTitleBar      : FWinTitleBar;
  ExitFormLabel1        : FLabel;
  ExitFormLabel2        : FLabel;
  ExitFormBottomBar     : FRectangle;
  ExitFormYesBtn        : FButton;
  ExitFormNoBtn         : FButton;

procedure FMXInit;
begin
  FMXForm               := InitFormHandle;
  FormLayer             := InitLayoutHandle;
  TitleBar              := InitWinTitleBarHandle;

  TestBlurLight         := InitBlurRectangleHandle;
  TestTextLight         := InitLabelHandle;
  TestBlurDark          := InitBlurRectangleHandle;
  TestTextDark          := InitLabelHandle;

  ExitForm              := InitMsgFormHandle;
  ExitFormTitleBar      := InitWinTitleBarHandle;
  ExitFormLabel1        := InitLabelHandle;
  ExitFormLabel2        := InitLabelHandle;
  ExitFormBottomBar     := InitRectangleHandle;
  ExitFormYesBtn        := InitButtonHandle;
  ExitFormNoBtn         := InitButtonHandle;
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
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, ExtractAndLoad('wallpapers1.jpg'), True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), $FF0A6FEC);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($80000000);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  TestBlurLight.FCreate(FormLayer.Handle, False);
  TestBlurLight.SetBounds(100, 110, 500, 110);
  TestBlurLight.StrokeSetting(1, scRound, sdSolid, sjMiter);
  TestBlurLight.CornerStyle(8, 8, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  TestTextLight.FCreate(TestBlurLight.Handle);
  TestTextLight.Align(Client);
  TestTextLight.AutoSize(True);
  TestTextLight.FontSetting('Segoe UI Variable Display', 48, $FF0A6FEC);
  TestTextLight.TextSetting(False, txCenter, txCenter);
  TestTextLight.StyledSettings([ssOther]);
  TestTextLight.Text('Light Blur Rectangle');

  TestBlurDark.FCreate(FormLayer.Handle, True);
  TestBlurDark.SetBounds(100, TestBlurLight.GetTop + TestBlurLight.GetHeight + 20, 500, 110);
  TestBlurDark.StrokeSetting(1, scRound, sdSolid, sjMiter);
  TestBlurDark.CornerStyle(8, 8, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  TestTextDark.FCreate(TestBlurDark.Handle);
  TestTextDark.Align(Client);
  TestTextDark.AutoSize(True);
  TestTextDark.FontSetting('Segoe UI Variable Display', 48, $FF0A6FEC);
  TestTextDark.TextSetting(False, txCenter, txCenter);
  TestTextDark.StyledSettings([ssOther]);
  TestTextDark.Text('Dark Blur Rectangle');

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, ExtractAndLoad('wallpapers1.jpg'), True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($80000000);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FFF5F5F5);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FFF5F5F5);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Align(MostBottom);
  ExitFormBottomBar.Height(54);
  ExitFormBottomBar.FillColor($80000000);

  ExitFormYesBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormYesBtn.SetBounds(310, 13, 92, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.StyleLookUp('buttonstyle_accent');
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormNoBtn.SetBounds(412, 13, 92, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.StyleLookUp('buttonstyle_accent');
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(700, 466);

  FMXDesigning;
  FMXForm.Show;
end;
