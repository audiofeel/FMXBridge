[Setup]
AppName=FMXBridge_TabControls
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
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  TabControl       : FTabControl;
  TabItem          : array [1..4] of FTabItem;
  Rect             : array [1..4] of FRectangle;

  Text             : FLabel;
  ComboBox         : FComboBox;
  CheckBox         : FCheckBox;
  Btn              : array [1..2] of FButton;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm    := InitFormHandle;
  FormLayer  := InitLayoutHandle;
  TitleBar   := InitWinTitleBarHandle;

  TabControl:= InitTabControlHandle;
  for i:= 1 to 4 do TabItem[i]:= InitTabItemHandle;
  for i:= 1 to 4 do Rect[i]:= InitRectangleHandle;

  Text       := InitLabelHandle;
  ComboBox   := InitComboBoxHandle;
  CheckBox   := InitCheckBoxHandle;
  for i:= 1 to 2 do Btn[i]:= InitButtonHandle;

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
  Confirm := False;
end;

procedure CommonOnClick(Sender: TObject);
var
  Index: Integer;
begin
  case Sender of

    TObject(TitleBar.GetObjectCloseBtn):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

    TObject(Btn[1].GetObject):
    begin
      if TabControl.TransitionRunning then
        TabControl.FinishCurrentTabTransition;

      Index:= TabControl.ActiveTabIndex;

      if Index = 0 then
        TabControl.Last(ttSlide, ttdReversed)
      else
        TabControl.SetActiveTabWithTransition(TabControl.GetTabItem(Index - 1), ttSlide, ttdReversed);
    end;

    TObject(Btn[2].GetObject):
    begin
      if TabControl.TransitionRunning then
        TabControl.FinishCurrentTabTransition;

      Index:= TabControl.ActiveTabIndex;

      if Index = TabControl.TabCount - 1 then
        TabControl.First(ttSlide, ttdReversed)
      else
        TabControl.SetActiveTabWithTransition(TabControl.GetTabItem(Index + 1), ttSlide, ttdNormal);
    end;
  end;
end;

procedure CommonOnChange(Sender: TObject);
var
  i: Integer;
begin
  case Sender of

    TObject(ComboBox.GetObject):
    begin
      case ComboBox.GetItemIndex of
        0: TabControl.TabPosition(tpTop);
        1: TabControl.TabPosition(tpBottom);
        2: TabControl.TabPosition(tpNone);
        3: TabControl.TabPosition(tpDots);
        4: TabControl.TabPosition(tpPlatformDefault);
      end;
    end;

    TObject(CheckBox.GetObject):
      for i:= 1 to 4 do TabItem[i].HitTest(CheckBox.ISChecked);

  end;
end;

procedure FMXDesigning;
var
  i: integer;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALPlum, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF0E192B);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  TabControl.FCreate(FormLayer.Handle);
  TabControl.SetBounds(80, 150, 500, 300);
  TabControl.TabPosition(tpDots);

  for i:= 1 to 4 do
  begin
    TabItem[i].FCreate(TabControl.Handle);
    TabItem[i].Text('Tab ' + IntToStr(i));
    TabItem[i].HitTest(False);

    Rect[i].FCreate(TabItem[i].Handle);
    Rect[i].SetBounds(10, 10, 300, 200);
    Rect[i].FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  end;

  Text.FCreate(FormLayer.Handle);
  Text.Left(80);
  Text.Top(60);
  Text.AutoSize(True);
  Text.Text('Tab Position:');

  ComboBox.FCreate(FormLayer.Handle);
  ComboBox.Left(80);
  ComboBox.Top(80);
  ComboBox.AddItem('Top');
  ComboBox.AddItem('Bottom');
  ComboBox.AddItem('None');
  ComboBox.AddItem('Dots');
  ComboBox.AddItem('PlatformDefault');
  ComboBox.SetItemIndex(1);
  ComboBox.OnChange(@CommonOnChange);

  CheckBox.FCreate(FormLayer.Handle);
  CheckBox.Left(250);
  CheckBox.Top(60);
  CheckBox.Width(200);
  CheckBox.SetChecked(False);
  CheckBox.Text('Enable TabItem HitTest');
  CheckBox.OnChange(@CommonOnChange);

  Btn[1].FCreate(FormLayer.Handle);
  Btn[1].Left(410);
  Btn[1].Top(100);
  Btn[1].Text('Prev');
  Btn[1].OnClick(@CommonOnClick);

  Btn[2].FCreate(FormLayer.Handle);
  Btn[2].Left(500);
  Btn[2].Top(100);
  Btn[2].Text('Next');
  Btn[2].OnClick(@CommonOnClick);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, ALPlum, '', True);
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
  EmptyWizardForm(660, 480);
  FMXDesigning;
  FMXForm.Show;
end;
