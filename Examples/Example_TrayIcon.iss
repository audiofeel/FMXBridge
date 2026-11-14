[Setup]
AppName=FMXBridge_TrayIcon
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\Setup.ico
SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy
Source: "Files\Setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

const
  SW_RESTORE = 9;

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  Tray             : FTrayIcon;
  TrayEnabled      : Boolean;

  InfoText         : FText;
  StatusText       : FText;

  BtnShow          : FButton;
  BtnHide          : FButton;
  BtnHint          : FButton;
  BtnRecreate      : FButton;

  HintCounter      : Integer;

  MenuOpenIndex    : Integer;
  MenuToggleIndex  : Integer;
  MenuDisabledIndex: Integer;
  MenuExitIndex    : Integer;

  MenuToggleChecked: Boolean;

procedure FMXInit;
begin
  FMXForm     := InitFormHandle;
  FormLayer   := InitLayoutHandle;
  TitleBar    := InitWinTitleBarHandle;

  InfoText    := InitTextHandle;
  StatusText  := InitTextHandle;

  BtnShow     := InitButtonHandle;
  BtnHide     := InitButtonHandle;
  BtnHint     := InitButtonHandle;
  BtnRecreate := InitButtonHandle;

  Tray        := InitTrayIcon;
  TrayEnabled := False;
end;

function InitializeSetup(): Boolean;
begin
  FMXInit;
  Result := True;
end;

procedure DeinitializeSetup();
begin
  if Tray <> nil then
  begin
    Tray.Hide;
    Tray := nil;
  end;

  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;

procedure UpdateStatus(const S: String);
begin
  StatusText.Text(S);
end;

procedure RestoreFMXForm;
begin
  ShowWindow(FMXForm.HandleHWND, SW_RESTORE);
  FMXForm.Show;
end;

procedure TrayEvent(const Event, ItemIndex: Integer);
begin
  case Event of

    TrayEventClick:
    begin
      RestoreFMXForm;
      UpdateStatus('Left click: window restored');
    end;

    TrayEventDoubleClick:
    begin
      RestoreFMXForm;
      UpdateStatus('Double click: window restored');
    end;

    TrayEventRightClick:
      UpdateStatus('Context menu opened');

    TrayEventMenuItemClick:
    begin
      case ItemIndex of

        MenuOpenIndex:
        begin
          RestoreFMXForm;
          UpdateStatus('Menu: Open window');
        end;

        MenuToggleIndex:
        begin
          MenuToggleChecked := not MenuToggleChecked;

          Tray.SetMenuItemChecked(
            MenuToggleIndex, MenuToggleChecked);

          if MenuToggleChecked then
            UpdateStatus('Menu: Checked = True')
          else
            UpdateStatus('Menu: Checked = False');
        end;

        MenuDisabledIndex:
          UpdateStatus('Unexpected: disabled item selected');

        MenuExitIndex:
          WizardForm.Close;

      end;
    end;

  end;
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of
    TObject(TitleBar.GetObjectMinBtn):
    begin
      if TrayEnabled then
        FMXForm.Hide
      else
        FMXForm.Minimize;
    end;

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.Close;

    TObject(BtnShow.GetObject):
    begin
      if Tray.Show then
      begin
        TrayEnabled := True;
        UpdateStatus('Tray icon is visible');
      end else
        UpdateStatus('Show failed. Check icon and HWND.');
    end;

    TObject(BtnHide.GetObject):
    begin
      Tray.Hide;
      TrayEnabled:= False;
      UpdateStatus('Tray icon hidden');
    end;

    TObject(BtnHint.GetObject):
      begin
        Inc(HintCounter);
        Tray.SetHint('FMXBridge TrayIcon Demo - Hint ' + IntToStr(HintCounter));
        UpdateStatus('Tooltip changed: ' + IntToStr(HintCounter));
      end;

    TObject(BtnRecreate.GetObject):
    begin
      Tray.Hide;
      TrayEnabled:= False;

      if Tray.Show then
      begin
        TrayEnabled:= True;
        UpdateStatus('Tray icon registered again');
      end else
        UpdateStatus('Re-registration failed');
    end;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, ALDarkSlateBlue, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), ALSkyBlue);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF101A25);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  InfoText.FCreate(FormLayer.Handle);
  InfoText.SetBounds(34, 78, 560, 56);
  InfoText.Text('FTrayIcon test. Use the buttons below to show, hide and update the notification-area icon. Click the tray icon to test event callbacks.');
  InfoText.FontSetting('Segoe UI', 12, $FFF0F0F0);
  InfoText.TextSetting(True, txLeading, txLeading);

  StatusText.FCreate(FormLayer.Handle);
  StatusText.SetBounds(34, 145, 560, 34);
  StatusText.Text('Status: initializing...');
  StatusText.FontSetting('Segoe UI Semibold', 12, $FF80D8FF);
  StatusText.TextSetting(False, txLeading, txCenter);

  BtnShow.FCreate(FormLayer.Handle);
  BtnShow.SetBounds(44, 215, 250, 38);
  BtnShow.Text('Show tray icon');
  BtnShow.OnClick(@CommonOnClick);

  BtnHide.FCreate(FormLayer.Handle);
  BtnHide.SetBounds(310, 215, 250, 38);
  BtnHide.Text('Hide tray icon');
  BtnHide.OnClick(@CommonOnClick);

  BtnHint.FCreate(FormLayer.Handle);
  BtnHint.SetBounds(44, 270, 250, 38);
  BtnHint.Text('Change tooltip');
  BtnHint.OnClick(@CommonOnClick);

  BtnRecreate.FCreate(FormLayer.Handle);
  BtnRecreate.SetBounds(310, 270, 250, 38);
  BtnRecreate.Text('Re-register icon');
  BtnRecreate.OnClick(@CommonOnClick);

  if not Tray.FCreate(FMXForm.HandleHWND) then
  begin
    UpdateStatus('FTrayIcon.FCreate failed');
    Exit;
  end;

  Tray.OnEvent(@TrayEvent);

  MenuOpenIndex := Tray.AddMenuItem('Open FMXBridge');

  Tray.AddMenuSeparator;

  MenuToggleIndex := Tray.AddMenuItem('Toggle checked state');

  MenuDisabledIndex := Tray.AddMenuItem('Disabled item');
  Tray.SetMenuItemEnabled(MenuDisabledIndex, False);

  Tray.AddMenuSeparator;

  MenuExitIndex := Tray.AddMenuItem('Exit');

  MenuToggleChecked := False;

  Tray.SetHint('FMXBridge TrayIcon Demo');

  if not Tray.SetIcon(ExtractAndLoad('Setup.ico')) then
  begin
    UpdateStatus('SetIcon failed: Setup.ico');
    Exit;
  end;

  UpdateStatus('Tray icon is hidden. Click Show tray icon.');
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(610, 390);

  FMXDesigning;
  FMXForm.Show;
end;
