[Setup]
AppName=FMXBridge_DropTarget
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
PrivilegesRequired=lowest
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
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm           : FForm;
  FormLayer         : FLayout;
  TitleBarLayer     : FStatusBar;
  TitleBar          : FWinTitleBar;

  RectStyle         : FRectangle;
  RectStyleIcn      : FImage;
  RectStyleLbl1     : FLabel;
  RectStyleLbl2     : FLabel;
  DropTarget        : FDropTarget;

  PageRect          : FRectangle;
  PageLabel1        : FLabel;
  PageLabel2        : FLabel;
  PageLabel3        : FLabel;

  FormBottomBar     : FStatusBar;
  FormDonateBtn     : FButton;
  FormBackBtn       : FButton;
  FormNextBtn       : FButton;
  FormCancelBtn     : FButton;

  ExitForm          : FMsgForm;
  ExitFormTitleBar  : FWinTitleBar;
  ExitFormLabel1    : FLabel;
  ExitFormLabel2    : FLabel;
  ExitFormYesBtn    : FButton;
  ExitFormNoBtn     : FButton;
  ExitFormBottomBar : FStatusBar;

procedure FMXInit;
begin
  FMXForm           := InitFormHandle;
  FormLayer         := InitLayoutHandle;
  TitleBarLayer     := InitStatusBarHandle;
  TitleBar          := InitWinTitleBarHandle;

  RectStyle         := InitRectangleHandle;
  RectStyleIcn      := InitImageHandle;
  RectStyleLbl1     := InitLabelHandle;
  RectStyleLbl2     := InitLabelHandle;
  DropTarget        := InitDropTargetHandle;

  PageRect          := InitRectangleHandle;
  PageLabel1        := InitLabelHandle;
  PageLabel2        := InitLabelHandle;
  PageLabel3        := InitLabelHandle;

  FormBottomBar     := InitStatusBarHandle;
  FormDonateBtn     := InitButtonHandle;
  FormBackBtn       := InitButtonHandle;
  FormNextBtn       := InitButtonHandle;
  FormCancelBtn     := InitButtonHandle;

  ExitForm          := InitMsgFormHandle;
  ExitFormTitleBar  := InitWinTitleBarHandle;
  ExitFormLabel1    := InitLabelHandle;
  ExitFormLabel2    := InitLabelHandle;
  ExitFormYesBtn    := InitButtonHandle;
  ExitFormNoBtn     := InitButtonHandle;
  ExitFormBottomBar := InitStatusBarHandle;
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

procedure FileDropped(Sender: TObject; const FileName: WideString);
begin
  FMXForm.LoadStyleFromFile(FileName, 0);
  FMXForm.UpdateStyleBook;

  RectStyleLbl2.Text(ExtractFileName(FileName) + #13#10 + 'for Windows 10 and 11');
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBarLayer.FCreate(FormLayer.Handle);
  TitleBarLayer.Align(MostTop);
  TitleBarLayer.Height(31);

  TitleBar.FCreate(TitleBarLayer.Handle, True);
  TitleBar.SetColor(ColorSetOpacity($FF000000, 0.1));
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  RectStyle.FCreate(FormLayer.Handle);
  RectStyle.SetBounds(15, 55, 171, 86);
  RectStyle.FillColor(ColorSetOpacity($FF000000, 0.1));
  RectStyle.StrokeColor($80777777);
  RectStyle.StrokeSetting(0.5, scRound, sdSolid, sjMiter);
  RectStyle.CornerStyle(7, 7, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  RectStyleIcn.FCreate(RectStyle.Handle);
  RectStyleIcn.SetBounds(12, 12, 27, 27);
  RectStyleIcn.LoadPicture(ExtractAndLoad('setup.ico'), iwStretch);

  RectStyleLbl1.FCreate(RectStyle.Handle);
  RectStyleLbl1.SetBounds(47, 11, 116, 27);
  RectStyleLbl1.Text('FMX Style');
  RectStyleLbl1.TextSetting(False, txLeading, txCenter);

  RectStyleLbl2.FCreate(RectStyle.Handle);
  RectStyleLbl2.SetBounds(47, 34, 116, 40);
  RectStyleLbl2.Text('Dark StyleBook' + #13#10 + 'for Windows 10 and 11');
  RectStyleLbl2.TextSetting(True, txLeading, txCenter);
  RectStyleLbl2.FontSetting('Segoe UI', 10, ALWhite);
  RectStyleLbl2.StyledSettings([ssFontColor]);

  DropTarget.FCreate(FormLayer.Handle);
  DropTarget.SetBounds(15, 154, 171, 86);
  DropTarget.Text('Drag .fsf file to' + #13#10+ 'load StyleBook');
  DropTarget.TextSetting(True, txCenter, txCenter);
  DropTarget.Filter('Styles (*.fsf;*.style)|*.fsf;*.style');
  SetFileDropCallback(@FileDropped);

  PageRect.FCreate(FormLayer.Handle);
  PageRect.SetBounds(198, 55, 501, 383);
  PageRect.FillColor(ColorSetOpacity($FF000000, 0.1));
  PageRect.StrokeColor($80777777);
  PageRect.StrokeSetting(0.5, scRound, sdSolid, sjMiter);
  PageRect.CornerStyle(7, 7, [tcTopLeft], ctRound);
  PageRect.Sides([tsTop, tsLeft]);

  PageLabel1.FCreate(PageRect.Handle);
  PageLabel1.SetBounds(26, 22, 430, 48);
  PageLabel1.Text('Welcome to the Counter-Strike: Source' + #13#10 + 'Setup Wizard');
  PageLabel1.TextSetting(True, txLeading, txLeading);
  PageLabel1.FontSetting('Segoe UI Bold', 18, ALWhite);
  PageLabel1.StyledSettings([ssFontColor]);

  PageLabel2.FCreate(PageRect.Handle);
  PageLabel2.SetBounds(26, 86, 330, 75);
  PageLabel2.Text('This will install Counter-Strike: Source on your computer. It is recommended that you close all other applications before continuing.');
  PageLabel2.TextSetting(True, txLeading, txLeading);

  PageLabel3.FCreate(PageRect.Handle);
  PageLabel3.SetBounds(26, 340, 330, 25);
  PageLabel3.Text('Click Next to continue, or Cancel to exit Setup.');
  PageLabel3.TextSetting(False, txLeading, txLeading);

  FormBottomBar.FCreate(FormLayer.Handle);
  FormBottomBar.Height(50);

  FormDonateBtn.FCreate(FormBottomBar.Handle);
  FormDonateBtn.SetBounds(14, 14, 86, 22);
  FormDonateBtn.Text(CnvtUTF32ToUTF16('U+1F4B0') + ' Donate');
  FormDonateBtn.CanFocus(False);
  FormDonateBtn.OnClick(@CommonOnClick);

  FormBackBtn.FCreate(FormBottomBar.Handle);
  FormBackBtn.SetBounds(434, 14, 74, 22);
  FormBackBtn.Text('Back');
  FormBackBtn.OnClick(@CommonOnClick);

  FormNextBtn.FCreate(FormBottomBar.Handle);
  FormNextBtn.SetBounds(FormBackBtn.GetLeft + FormBackBtn.GetWidth + 15, 14, 74, 22);
  FormNextBtn.Text('Next');
  FormNextBtn.OnClick(@CommonOnClick);
  FormNextBtn.SetFocus;

  FormCancelBtn.FCreate(FormBottomBar.Handle);
  FormCancelBtn.SetBounds(FormNextBtn.GetLeft + FormNextBtn.GetWidth + 15, 14, 74, 22);
  FormCancelBtn.Text('Cancel');
  FormCancelBtn.OnClick(@CommonOnClick);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(174);
  ExitForm.Width(365);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(26, 22, 330, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.TextSetting(False, txLeading, txLeading);
  ExitFormLabel1.FontSetting('Segoe UI Bold', 18, ALWhite);
  ExitFormLabel1.StyledSettings([ssFontColor]);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(26, 56, 330, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.TextSetting(False, txLeading, txCenter);
  ExitFormLabel2.FontSetting('Segoe UI', 12, ALWhite);
  ExitFormLabel2.StyledSettings([ssFontColor]);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Height(50);

  ExitFormYesBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormYesBtn.SetBounds(193, 14, 72, 22);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);
  ExitFormYesBtn.SetFocus;

  ExitFormNoBtn.FCreate(ExitFormBottomBar.Handle);
  ExitFormNoBtn.SetBounds(ExitFormYesBtn.GetLeft + ExitFormYesBtn.GetWidth + 15, 14, 72, 22);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(699, 489);
  FMXDesigning;
  FMXForm.Show;
end;
