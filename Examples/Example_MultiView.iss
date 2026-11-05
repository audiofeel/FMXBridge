[Setup]
AppName=FMXBridge_MultiView
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
Source: "Files\Styles\Win10ModernPurple.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  MultiView        : FMultiView;
  SpBtn            : array [1..5] of FSpeedButton;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FSpeedButton;
  ExitFormNoBtn    : FSpeedButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm   := InitFormHandle;
  FormLayer := InitLayoutHandle;
  TitleBar  := InitWinTitleBarHandle;

  MultiView := InitMultiViewHandle;
  for i:= 1 to 5 do SpBtn[i]:= InitSpeedButtonHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormTitleBar := InitWinTitleBarHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitSpeedButtonHandle;
  ExitFormNoBtn    := InitSpeedButtonHandle;
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
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALPaleVioletRed, '', False);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('Win10ModernPurple.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF000000);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  MultiView.FCreate(FormLayer.Handle);
  MultiView.Mode(mvmNavigationPane);

  SpBtn[1].FCreate(MultiView.Handle);
  SpBtn[1].Align(MostTop);
  SpBtn[1].StayPressed(False);
  SpBtn[1].StyleLookup('detailstoolbuttonmultiview');
  SpBtn[1].Text('Title');
  SpBtn[1].TextSetting(False, txLeading, txCenter);

  SpBtn[5].FCreate(MultiView.Handle);
  SpBtn[5].Align(Bottom);
  SpBtn[5].StayPressed(True);
  SpBtn[5].StyleLookup('settingstoolbuttonmultiview');
  SpBtn[5].Text('Settings');
  SpBtn[5].TextSetting(False, txLeading, txCenter);
  SpBtn[5].GroupName('GRP1');

  SpBtn[4].FCreate(MultiView.Handle);
  SpBtn[4].Align(Top);
  SpBtn[4].StayPressed(True);
  SpBtn[4].StyleLookup('actiontoolbuttonmultiview');
  SpBtn[4].Text('Action');
  SpBtn[4].TextSetting(False, txLeading, txCenter);
  SpBtn[4].GroupName('GRP1');

  SpBtn[3].FCreate(MultiView.Handle);
  SpBtn[3].Align(Top);
  SpBtn[3].StayPressed(True);
  SpBtn[3].StyleLookup('cameratoolbuttonmultiview');
  SpBtn[3].Text('Photos');
  SpBtn[3].TextSetting(False, txLeading, txCenter);
  SpBtn[3].GroupName('GRP1');

  SpBtn[2].FCreate(MultiView.Handle);
  SpBtn[2].Align(Top);
  SpBtn[2].StayPressed(True);
  SpBtn[2].StyleLookup('searchtoolbuttonmultiview');
  SpBtn[2].Text('Search');
  SpBtn[2].TextSetting(False, txLeading, txCenter);
  SpBtn[2].GroupName('GRP1');
  SpBtn[2].Pressed(True);

  MultiView.MasterButton(SpBtn[1].Handle);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, ALPaleVioletRed, '', False);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($FF000000);
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
  ExitFormYesBtn.StyleLookUp('buttonstyle');
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(442, 207, 72, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.StyleLookUp('buttonstyle');
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(640, 480);
  FMXDesigning;
  FMXForm.Show;
end;
