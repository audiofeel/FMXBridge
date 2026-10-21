[Setup]
AppName=FMXBridge_PageControl
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
Source: "Files\Images\hero.jpg"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm               : FForm;
  FormLayer             : FLayout;
  TitleBar              : FWinTitleBar;

  Dir                   : TPageDirection;

  PageControl           : FPageControl;

  Page1                 : FPageItem;
  Page1Text             : array [1..3] of FShadowText;

  Page2                 : FPageItem;
  Page2Text             : array [1..3] of FShadowText;
  Page2DirEdit          : FEdit;
  DesktopIconCheckBox   : FCheckBox;
  StartMenuIconCheckBox : FCheckBox;

  Page3                 : FPageItem;
  Page3Text             : array [1..4] of FShadowText;
  CompoCheckBox         : array [1..4] of FCheckBox;

  NextBtn               : FButton;
  BackBtn               : FButton;
  DirBtn                : FButton;

  ExitForm              : FMsgForm;
  ExitFormLabel1        : FLabel;
  ExitFormLabel2        : FLabel;
  ExitFormYesBtn        : FButton;
  ExitFormNoBtn         : FButton;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm               := InitFormHandle;
  FormLayer             := InitLayoutHandle;
  TitleBar              := InitWinTitleBarHandle;

  PageControl           := InitPageControlHandle;

  Page1                 := InitPageItemHandle;
  for i:= 1 to 3 do Page1Text[i]:= InitShadowTextHandle;

  Page2                 := InitPageItemHandle;
  for i:= 1 to 3 do Page2Text[i]:= InitShadowTextHandle;
  Page2DirEdit          := InitEditHandle;
  DesktopIconCheckBox   := InitCheckBoxHandle;
  StartMenuIconCheckBox := InitCheckBoxHandle;

  Page3                 := InitPageItemHandle;
  for i:= 1 to 4 do Page3Text[i]:= InitShadowTextHandle;
  for i:= 1 to 4 do CompoCheckBox[i]:= InitCheckBoxHandle;

  NextBtn               := InitButtonHandle;
  BackBtn               := InitButtonHandle;
  DirBtn                := InitButtonHandle;

  ExitForm              := InitMsgFormHandle;
  ExitFormLabel1        := InitLabelHandle;
  ExitFormLabel2        := InitLabelHandle;
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

    TObject(NextBtn.GetObject):
      PageControl.NextPage(pmNormal);

    TObject(BackBtn.GetObject):
      PageControl.BackPage(pmReverse);

  end;
end;

procedure ChangeDirection(Sender: TObject);
begin
  case Dir of
    pdNone:
    begin
      Dir:= pdHorizontal;
      PageControl.Duration(0.8);
      PageControl.Interpolation(itBack);
      DirBtn.Text('Horizontal Direction');
    end;

    pdHorizontal:
    begin
      Dir:= pdVertical;
      DirBtn.Text('Vertical Direction');
    end;

    pdVertical:
    begin
      Dir:= pdFade;
      PageControl.Duration(0.3);
      PageControl.Interpolation(itLinear);
      DirBtn.Text('Fade Direction');
    end;

    pdFade:
    begin
      Dir:= pdNone;
      DirBtn.Text('None Direction');
    end;
  end;

  PageControl.Direction(Dir);
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, ExtractAndLoad('hero.jpg'), True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  PageControl.FCreate(FormLayer.Handle);
  PageControl.SetBounds(20, 75, 760, 310);
  PageControl.Duration(0.8);
  PageControl.Direction(Dir);
  PageControl.Interpolation(itBack);

  Page1.FCreate(PageControl.Handle); 

  Page1Text[1].FCreate(Page1.Handle);
  Page1Text[1].SetBounds(0, 0, 760, 42);
  Page1Text[1].FontSetting('Segoe UI', VCLFontSizeToFMX(16), $FFFFFFFF);
  Page1Text[1].ShadowColor($FF000000);
  Page1Text[1].ShadowOffset(1, 1);
  Page1Text[1].TextSetting(False, txLeading, txLeading);
  Page1Text[1].Text('Welcome to Corepack Installer Wizard');

  Page1Text[2].FCreate(Page1.Handle);
  Page1Text[2].SetBounds(0, 29, 760, 100);
  Page1Text[2].FontSetting('Segoe UI', VCLFontSizeToFMX(11), $FFDCDCDC);
  Page1Text[2].ShadowColor($FF000000);
  Page1Text[2].ShadowOffset(1, 1);
  Page1Text[2].TextSetting(True, txLeading, txLeading);
  Page1Text[2].Text('You are installing {#SetupSetting('AppName')} on your computer.' + #13 +
                    'It is highly recommended to' + #13 +
                    '   • Disable the AV Before Installation' + #13 +
                    '   • Close all Other Programs and Apps' + #13 +
                    '   • Restart Before Installation may get faster Installation.');

  Page1Text[3].FCreate(Page1.Handle);
  Page1Text[3].SetBounds(0, 282, 760, 22);
  Page1Text[3].FontSetting('Segoe UI Light', VCLFontSizeToFMX(13), $FFFFFFFF);
  Page1Text[3].ShadowColor($FF000000);
  Page1Text[3].ShadowOffset(1, 1);
  Page1Text[3].TextSetting(True, txLeading, txLeading);
  Page1Text[3].Text(AnsiLowerCase('When ready click Next to continue with installation or close to exit installation.'));

  Page2.FCreate(PageControl.Handle);

  Page2Text[1].FCreate(Page2.Handle);
  Page2Text[1].SetBounds(0, 0, 760, 42);
  Page2Text[1].FontSetting('Segoe UI', VCLFontSizeToFMX(16), $FFFFFFFF);
  Page2Text[1].ShadowColor($FF000000);
  Page2Text[1].ShadowOffset(1, 1);
  Page2Text[1].TextSetting(False, txLeading, txLeading);
  Page2Text[1].Text('Select the destination of the product you are installing');

  Page2Text[2].FCreate(Page2.Handle);
  Page2Text[2].SetBounds(0, 29, 760, 100);
  Page2Text[2].FontSetting('Segoe UI', VCLFontSizeToFMX(11), $FFDCDCDC);
  Page2Text[2].ShadowColor($FF000000);
  Page2Text[2].ShadowOffset(1, 1);
  Page2Text[2].TextSetting(True, txLeading, txLeading);
  Page2Text[2].Text('You can select a different directory by clicking the browse button.' + #13#10 +
                    'Make sure you have enough space before installing.');
  
  Page2Text[3].FCreate(Page2.Handle);
  Page2Text[3].SetBounds(0, 107, 760, 20);
  Page2Text[3].FontSetting('Segoe UI', VCLFontSizeToFMX(10), $FFFFFFFF);
  Page2Text[3].ShadowColor($FF000000);
  Page2Text[3].ShadowOffset(1, 1);
  Page2Text[3].TextSetting(True, txLeading, txLeading);
  Page2Text[3].Text('%1 is required from selected drive');

  Page2DirEdit.FCreate(Page2.Handle);
  Page2DirEdit.SetBounds(0, 79, 450, 24);
  Page2DirEdit.Text(WizardForm.DirEdit.Text);

  DesktopIconCheckBox.FCreate(Page2.Handle);
  DesktopIconCheckBox.SetBounds(20, 138, 195, 16);
  DesktopIconCheckBox.SetChecked(True);
  DesktopIconCheckBox.Text('Desktop Shortcut');

  StartMenuIconCheckBox.FCreate(Page2.Handle);
  StartMenuIconCheckBox.SetBounds(20, 163, 195, 16);
  StartMenuIconCheckBox.SetChecked(True);
  StartMenuIconCheckBox.Text('Startmenu Shortcut');

  Page3.FCreate(PageControl.Handle);

  Page3Text[1].FCreate(Page3.Handle);
  Page3Text[1].SetBounds(0, 0, 760, 42);
  Page3Text[1].FontSetting('Segoe UI', VCLFontSizeToFMX(16), $FFFFFFFF);
  Page3Text[1].ShadowColor($FF000000);
  Page3Text[1].ShadowOffset(1, 1);
  Page3Text[1].TextSetting(False, txLeading, txLeading);
  Page3Text[1].Text('Select the Component uou want to install,');

  Page3Text[2].FCreate(Page3.Handle);
  Page3Text[2].SetBounds(0, 29, 760, 100);
  Page3Text[2].FontSetting('Segoe UI', VCLFontSizeToFMX(11), $FFDCDCDC);
  Page3Text[2].ShadowColor($FF000000);
  Page3Text[2].ShadowOffset(1, 1);
  Page3Text[2].TextSetting(True, txLeading, txLeading);
  Page3Text[2].Text('Selected Component only be installed in your PC,' + #13#10 +
                    'So Clear out the Component you don''t want to install' + #13#10 +
                    'Also select required component');

  Page3Text[3].FCreate(Page3.Handle);
  Page3Text[3].SetBounds(0, 282, 760, 22);
  Page3Text[3].FontSetting('Segoe UI', VCLFontSizeToFMX(12), $FFDCDCDC);
  Page3Text[3].ShadowColor($FF000000);
  Page3Text[3].ShadowOffset(1, 1);
  Page3Text[3].TextSetting(True, txLeading, txLeading);
  Page3Text[3].Text('Current selection requires at least %1 of disk space.');

  CompoCheckBox[1].FCreate(Page3.Handle);
  CompoCheckBox[1].SetBounds(20, 140, 235, 17);
  CompoCheckBox[1].Text('Hungarian Language Pack');

  CompoCheckBox[2].FCreate(Page3.Handle);
  CompoCheckBox[2].SetBounds(20, 160, 235, 17);
  CompoCheckBox[2].Text('Italian Full Language Pack');

  CompoCheckBox[3].FCreate(Page3.Handle);
  CompoCheckBox[3].SetBounds(20, 180, 235, 17);
  CompoCheckBox[3].Text('Norwegian Language Pack');

  CompoCheckBox[4].FCreate(Page3.Handle);
  CompoCheckBox[4].SetBounds(20, 200, 235, 17);
  CompoCheckBox[4].Text('Polish Language Pack');

  NextBtn.FCreate(FormLayer.Handle);
  NextBtn.SetBounds(660, 400, 100, 26);
  NextBtn.Text('Next>>>');
  NextBtn.OnClick(@CommonOnClick);

  BackBtn.FCreate(FormLayer.Handle);
  BackBtn.SetBounds(550, 400, 100, 26);
  BackBtn.Text('<<<Back');
  BackBtn.OnClick(@CommonOnClick);

  DirBtn.FCreate(FormLayer.Handle);
  DirBtn.SetBounds(25, 400, 120, 26);
  DirBtn.Text('None Direction');
  DirBtn.OnClick(@ChangeDirection);

  ExitForm.FCreateBlankForm(FMXForm.Handlehwnd, $FFF2680B, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(180);
  ExitForm.Width(370);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(25, 25, 320, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI', 18, $FFF5F5F5);
  ExitFormLabel1.TextSetting(False, txLeading, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(25, 63, 320, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI', 14, $FF767676);
  ExitFormLabel2.TextSetting(False, txLeading, txCenter);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(190, 130, 56, 26);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(260, 130, 82, 26);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(800, 450);
  FMXDesigning;

  FMXForm.Show;
end;
