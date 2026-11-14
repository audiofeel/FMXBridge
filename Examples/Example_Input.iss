[Setup]
AppName=FMXBridge_Input
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

Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

const
  ACT_MOVE_UP    = 1001;
  ACT_MOVE_DOWN  = 1002;
  ACT_MOVE_LEFT  = 1003;
  ACT_MOVE_RIGHT = 1004;
  ACT_JUMP       = 1005;
  ACT_INTERACT   = 1006;
  ACT_DODGE      = 1007;
  ACT_SPECIAL    = 1008;
  ACT_PAUSE      = 1009;

  CColorBackground = $FF101722;
  CColorPanel      = $FF172231;
  CColorPanelLine  = $FF2A3A50;
  CColorText       = $FFEAF0F8;
  CColorMuted      = $FF91A0B4;
  CColorAccent     = $FF55C7F4;
  CColorActive     = $FF72E0A2;
  CColorInactive   = $FF536278;

  XboxGreen  = $FF2F9D58;
  XboxRed    = $FFC94747;
  XboxBlue   = $FF287DCA;
  XboxYellow = $FFC6A638;
  XboxGrey   = $FF40516A;

type
  TInputRow = record
    Action: Integer;
    ActionLabel: FLabel;
    MappingLabel: FLabel;
    RebindButton: FButton;
    Glyph: FEllipse;
    GlyphLabel: FLabel;
  end;

var
  FMXForm: FForm;
  FormLayer: FLayout;
  TitleBar: FWinTitleBar;
  InputService: FInput;

  HeaderTitle: FLabel;
  HeaderSubtitle: FLabel;
  DeviceTitle: FLabel;
  DeviceCombo: FComboBox;
  RescanButton: FButton;
  PresetButton: FButton;
  StatusLabel: FLabel;
  LeftPanel: FRoundRect;
  RightPanel: FRoundRect;
  MappingTitle: FLabel;
  LiveTitle: FLabel;
  LiveActionLabel: FLabel;
  ActionCountLabel: FLabel;
  LiveHintLabel: FLabel;
  RumbleTitle: FLabel;
  RumbleInfoLabel: FLabel;
  RumbleLowButton: FButton;
  RumbleHighButton: FButton;
  RumbleBothButton: FButton;
  RumbleStopButton: FButton;
  ProfileTitle: FLabel;
  ProfileSaveButton: FButton;
  ProfileLoadButton: FButton;
  InputEnabledButton: FButton;
  CancelCaptureButton: FButton;
  FooterLabel: FLabel;

  InputRows: array [0..8] of TInputRow;
  ControllerIDs: array [0..31] of WideString;
  ControllerNames: array [0..31] of WideString;
  ControllerDeviceIndexes: array [0..31] of Integer;
  ControllerCount: Integer;
  SelectedDeviceID: WideString;
  SelectedDeviceName: WideString;
  SelectedDeviceIndex: Integer;
  CapturingRow: Integer;
  ActionCount: Integer;
  ProfilePath: String;
  ProfileViewPath: String;
  RowMappings: array [0..8] of String;
  RowGlyphs: array [0..8] of String;

function ActionCaption(Index: Integer): String;
begin
  case Index of
    0: Result := 'MOVE UP';
    1: Result := 'MOVE DOWN';
    2: Result := 'MOVE LEFT';
    3: Result := 'MOVE RIGHT';
    4: Result := 'JUMP';
    5: Result := 'INTERACT';
    6: Result := 'DODGE';
    7: Result := 'SPECIAL';
    8: Result := 'PAUSE';
  else
    Result := 'ACTION';
  end;
end;

function ActionCode(Index: Integer): Integer;
begin
  case Index of
    0: Result := ACT_MOVE_UP;
    1: Result := ACT_MOVE_DOWN;
    2: Result := ACT_MOVE_LEFT;
    3: Result := ACT_MOVE_RIGHT;
    4: Result := ACT_JUMP;
    5: Result := ACT_INTERACT;
    6: Result := ACT_DODGE;
    7: Result := ACT_SPECIAL;
    8: Result := ACT_PAUSE;
  else
    Result := -1;
  end;
end;

function IsXboxDevice(const DeviceID: WideString): Boolean;
begin
  Result := Pos('windows:xinput:slot:', DeviceID) = 1;
end;

procedure SetStatus(const Value: String);
begin
  StatusLabel.Text(Value);
end;

procedure SetRowMapping(Index: Integer; const Mapping, GlyphText: String);
var
  GlyphColor: TAlphaColor;
begin
  RowMappings[Index] := Mapping;
  RowGlyphs[Index] := GlyphText;

  case GlyphText of
    'A': GlyphColor := XboxGreen;
    'B': GlyphColor := XboxRed;
    'X': GlyphColor := XboxBlue;
    'Y': GlyphColor := XboxYellow;
  else
    GlyphColor := XboxGrey;
  end;

  InputRows[Index].MappingLabel.Text(Mapping);
  InputRows[Index].GlyphLabel.Text(GlyphText);
  InputRows[Index].Glyph.FillColor(GlyphColor);
  InputRows[Index].Glyph.StrokeColor(GlyphColor);
end;

procedure SetAllRowsUnassigned(const GlyphText: String);
var
  I: Integer;
begin
  for I := 0 to 8 do
    SetRowMapping(I, 'NOT MAPPED', GlyphText);
end;

function XboxButtonName(Code: Integer): String;
begin
  case Code of
    0: Result := 'D-PAD UP';
    1: Result := 'D-PAD DOWN';
    2: Result := 'D-PAD LEFT';
    3: Result := 'D-PAD RIGHT';
    4: Result := 'MENU / START';
    5: Result := 'VIEW / BACK';
    6: Result := 'LEFT STICK PRESS';
    7: Result := 'RIGHT STICK PRESS';
    8: Result := 'LEFT BUMPER';
    9: Result := 'RIGHT BUMPER';
    12: Result := 'A';
    13: Result := 'B';
    14: Result := 'X';
    15: Result := 'Y';
  else
    Result := 'BUTTON ' + IntToStr(Code);
  end;
end;

function XboxButtonGlyph(Code: Integer): String;
begin
  case Code of
    0..3: Result := 'DP';
    4: Result := 'ST';
    5: Result := 'BK';
    6: Result := 'LS';
    7: Result := 'RS';
    8: Result := 'LB';
    9: Result := 'RB';
    12: Result := 'A';
    13: Result := 'B';
    14: Result := 'X';
    15: Result := 'Y';
  else
    Result := 'BTN';
  end;
end;

function XboxAxisName(Code, Direction: Integer): String;
begin
  case Code of
    0:
      if Direction < 0 then Result := 'LEFT STICK LEFT'
      else Result := 'LEFT STICK RIGHT';
    1:
      if Direction > 0 then Result := 'LEFT STICK UP'
      else Result := 'LEFT STICK DOWN';
    2:
      if Direction < 0 then Result := 'RIGHT STICK LEFT'
      else Result := 'RIGHT STICK RIGHT';
    3:
      if Direction > 0 then Result := 'RIGHT STICK UP'
      else Result := 'RIGHT STICK DOWN';
    4: Result := 'LEFT TRIGGER';
    5: Result := 'RIGHT TRIGGER';
  else
    Result := 'AXIS ' + IntToStr(Code);
  end;
end;

function XboxAxisGlyph(Code: Integer): String;
begin
  case Code of
    0, 1: Result := 'LS';
    2, 3: Result := 'RS';
    4: Result := 'LT';
    5: Result := 'RT';
  else
    Result := 'AX';
  end;
end;

function FindElementName(const DeviceID: WideString; Kind, Code: Integer): String;
var
  D, E: Integer;
begin
  Result := '';
  for D := 0 to InputService.DeviceCount - 1 do
    if InputService.DeviceID(D) = DeviceID then
    begin
      for E := 0 to InputService.ElementCount(D) - 1 do
        if (InputService.ElementKind(D, E) = Kind) and
           (InputService.ElementCode(D, E) = Code) then
        begin
          Result := InputService.ElementName(D, E);
          Exit;
        end;
      Exit;
    end;
end;

function CapturedMappingText(const DeviceID: WideString; Kind, Code,
  Direction: Integer): String;
var
  ElementText: String;
begin
  if IsXboxDevice(DeviceID) then
  begin
    case Kind of
      1: Result := XboxButtonName(Code);
      2: Result := XboxAxisName(Code, Direction);
      3: Result := 'D-PAD HAT ' + IntToStr(Direction);
    else
      Result := 'INPUT ' + IntToStr(Code);
    end;
    Exit;
  end;

  ElementText := FindElementName(DeviceID, Kind, Code);
  if ElementText = '' then
    ElementText := 'ELEMENT ' + IntToStr(Code);

  case Kind of
    2:
      if Direction > 0 then Result := ElementText + ' (+)'
      else Result := ElementText + ' (-)';
    3: Result := ElementText + ' / HAT ' + IntToStr(Direction);
  else
    Result := ElementText;
  end;
end;

function CapturedGlyphText(const DeviceID: WideString; Kind, Code: Integer): String;
begin
  if not IsXboxDevice(DeviceID) then
  begin
    Result := 'DI';
    Exit;
  end;

  case Kind of
    1: Result := XboxButtonGlyph(Code);
    2: Result := XboxAxisGlyph(Code);
    3: Result := 'DP';
  else
    Result := 'IN';
  end;
end;

procedure UpdateRumbleControls;
var
  CanRumble: Boolean;
begin
  CanRumble := (SelectedDeviceID <> '') and
    InputService.IsEnabled and not InputService.Capturing and
    (SelectedDeviceIndex >= 0) and
    InputService.DeviceAvailable(SelectedDeviceIndex) and
    InputService.DeviceRumbleSupported(SelectedDeviceIndex);

  RumbleLowButton.Enabled(CanRumble);
  RumbleHighButton.Enabled(CanRumble);
  RumbleBothButton.Enabled(CanRumble);
  RumbleStopButton.Enabled(CanRumble);

  if CanRumble then
    RumbleInfoLabel.Text('Vibration is available on this controller.')
  else
    RumbleInfoLabel.Text('Vibration is not reported by this device/backend.');
end;

procedure ApplyXboxPreset;
var
  OK: Boolean;
begin
  if (SelectedDeviceID = '') or not IsXboxDevice(SelectedDeviceID) then
  begin
    SetStatus('The Xbox preset requires an XInput controller.');
    Exit;
  end;

  InputService.CancelCapture;
  CapturingRow := -1;
  InputService.ClearBindings;
  OK := True;

  { XInput axes: 0=LeftX, 1=LeftY. Positive LeftY is stick-up. }
  OK := InputService.BindAxis(ACT_MOVE_UP, SelectedDeviceID, 1, 1,
    0, 0.55, 0.35) and OK;
  OK := InputService.BindAxis(ACT_MOVE_DOWN, SelectedDeviceID, 1, -1,
    0, 0.55, 0.35) and OK;
  OK := InputService.BindAxis(ACT_MOVE_LEFT, SelectedDeviceID, 0, -1,
    0, 0.55, 0.35) and OK;
  OK := InputService.BindAxis(ACT_MOVE_RIGHT, SelectedDeviceID, 0, 1,
    0, 0.55, 0.35) and OK;

  { XInput button bits: A=12, B=13, X=14, Y=15, Start=4. }
  OK := InputService.Bind(ACT_JUMP, SelectedDeviceID, 1, 12, 0) and OK;
  OK := InputService.Bind(ACT_INTERACT, SelectedDeviceID, 1, 14, 0) and OK;
  OK := InputService.Bind(ACT_DODGE, SelectedDeviceID, 1, 13, 0) and OK;
  OK := InputService.Bind(ACT_SPECIAL, SelectedDeviceID, 1, 15, 0) and OK;
  OK := InputService.Bind(ACT_PAUSE, SelectedDeviceID, 1, 4, 0) and OK;

  SetRowMapping(0, 'LEFT STICK UP', 'LS');
  SetRowMapping(1, 'LEFT STICK DOWN', 'LS');
  SetRowMapping(2, 'LEFT STICK LEFT', 'LS');
  SetRowMapping(3, 'LEFT STICK RIGHT', 'LS');
  SetRowMapping(4, 'A', 'A');
  SetRowMapping(5, 'X', 'X');
  SetRowMapping(6, 'B', 'B');
  SetRowMapping(7, 'Y', 'Y');
  SetRowMapping(8, 'MENU / START', 'ST');

  UpdateRumbleControls;
  if OK then
    SetStatus('Xbox preset applied. Use REMAP to change any action.')
  else
    SetStatus('Preset error: ' + InputService.LastError);
end;

procedure SelectController;
var
  I: Integer;
begin
  I := DeviceCombo.GetItemIndex;
  if (I < 0) or (I >= ControllerCount) then
  begin
    SelectedDeviceID := '';
    SelectedDeviceName := '';
    SelectedDeviceIndex := -1;
    InputService.ClearBindings;
    SetAllRowsUnassigned('--');
    UpdateRumbleControls;
    Exit;
  end;

  SelectedDeviceID := ControllerIDs[I];
  SelectedDeviceName := ControllerNames[I];
  SelectedDeviceIndex := ControllerDeviceIndexes[I];

  if IsXboxDevice(SelectedDeviceID) then
    ApplyXboxPreset
  else
  begin
    InputService.CancelCapture;
    CapturingRow := -1;
    InputService.ClearBindings;
    SetAllRowsUnassigned('DI');
    SetStatus('DirectInput controller selected. Assign its controls with REMAP.');
  end;

  UpdateRumbleControls;
end;

procedure RefreshControllers;
var
  I: Integer;
  DisplayName: String;
begin
  if not InputService.Refresh then
  begin
    SetStatus('Device refresh failed: ' + InputService.LastError);
    Exit;
  end;

  DeviceCombo.BeginUpdate;
  try
    DeviceCombo.Clear;
    ControllerCount := 0;

    for I := 0 to InputService.DeviceCount - 1 do
      if (InputService.DeviceKind(I) = 1) and
         (InputService.DeviceAvailable(I)) then
      begin
        if ControllerCount < 32 then
        begin
          ControllerIDs[ControllerCount] := InputService.DeviceID(I);
          ControllerNames[ControllerCount] := InputService.DeviceName(I);
          ControllerDeviceIndexes[ControllerCount] := I;

          DisplayName := InputService.DeviceName(I);
          if IsXboxDevice(InputService.DeviceID(I)) then
            DisplayName := DisplayName + '  /  XINPUT'
          else
            DisplayName := DisplayName + '  /  DIRECTINPUT';

          DeviceCombo.AddItem(DisplayName);
          Inc(ControllerCount);
        end;
      end;
  finally
    DeviceCombo.EndUpdate;
  end;

  if ControllerCount = 0 then
  begin
    SelectedDeviceID := '';
    SelectedDeviceName := '';
    SelectedDeviceIndex := -1;
    InputService.ClearBindings;
    SetAllRowsUnassigned('--');
    SetStatus('No available gamepad found. Connect one and press RESCAN.');
    UpdateRumbleControls;
    Exit;
  end;

  DeviceCombo.SetItemIndex(0);
  SelectController;
end;

procedure StartCapture(Index: Integer);
begin
  if SelectedDeviceID = '' then
  begin
    SetStatus('Select an available controller first.');
    Exit;
  end;

  if not InputService.IsEnabled then
  begin
    SetStatus('Input is disabled. Enable input before remapping.');
    Exit;
  end;

  if InputService.BeginCapture(InputRows[Index].Action, SelectedDeviceID, False) then
  begin
    CapturingRow := Index;
    UpdateRumbleControls;
    SetStatus('Waiting for ' + ActionCaption(Index) + ': press a button or move a stick.');
  end
  else
    SetStatus('Cannot start capture: ' + InputService.LastError);
end;

procedure InputPoll(Sender: TObject);
var
  I: Integer;
  DeviceID: WideString;
  Kind, Code, Direction: Integer;
  MappingText, GlyphText: String;
begin
  if InputService = nil then
    Exit;

  if (CapturingRow >= 0) and InputService.HasCaptured then
  begin
    DeviceID := InputService.CapturedDeviceID;
    Kind := InputService.CapturedKind;
    Code := InputService.CapturedCode;
    Direction := InputService.CapturedDirection;

    MappingText := CapturedMappingText(DeviceID, Kind, Code, Direction);
    GlyphText := CapturedGlyphText(DeviceID, Kind, Code);

    { AcceptCaptured adds a binding. RemoveBindings is required for true remapping. }
    InputService.RemoveBindings(InputRows[CapturingRow].Action);
    if InputService.AcceptCaptured then
    begin
      SetRowMapping(CapturingRow, MappingText, GlyphText);
      SetStatus(ActionCaption(CapturingRow) + ' is now mapped to ' + MappingText + '.');
    end
    else
      SetStatus('Could not accept captured input: ' + InputService.LastError);

    CapturingRow := -1;
    UpdateRumbleControls;
  end;

  for I := 0 to 8 do
  begin
    if InputService.IsPressed(InputRows[I].Action) then
      InputRows[I].ActionLabel.Color(CColorActive)
    else
      InputRows[I].ActionLabel.Color(CColorText);

    if InputService.WasPressed(InputRows[I].Action) then
    begin
      Inc(ActionCount);
      LiveActionLabel.Text('LAST ACTION  /  ' + ActionCaption(I));
      ActionCountLabel.Text('TRIGGERS: ' + IntToStr(ActionCount));
    end;
  end;
end;

procedure SaveProfile;
var
  I: Integer;
  DisplayData: String;
begin
  if not InputService.SaveProfile(ProfilePath) then
  begin
    SetStatus('Profile save failed: ' + InputService.LastError);
    Exit;
  end;

  DisplayData := '';
  for I := 0 to 8 do
    DisplayData := DisplayData + RowMappings[I] + '|' + RowGlyphs[I] + #13#10;

  if SaveStringToFile(ProfileViewPath, DisplayData, False) then
    SetStatus('Profile saved. The profile file is in the Inno Setup temporary folder.')
  else
    SetStatus('Bindings saved, but the display-label sidecar could not be saved.');
end;

procedure RestoreProfileLabels;
var
  Data: AnsiString;
  Line, MappingText, GlyphText: String;
  I, P: Integer;
begin
  if not LoadStringFromFile(ProfileViewPath, Data) then
    Exit;

  for I := 0 to 8 do
  begin
    P := Pos(#13#10, Data);
    if P > 0 then
    begin
      Line := Copy(Data, 1, P - 1);
      Delete(Data, 1, P + 1);
    end
    else
    begin
      Line := Data;
      Data := '';
    end;

    P := Pos('|', Line);
    if P > 0 then
    begin
      MappingText := Copy(Line, 1, P - 1);
      GlyphText := Copy(Line, P + 1, Length(Line));
      SetRowMapping(I, MappingText, GlyphText);
    end;
  end;
end;

procedure LoadProfile;
begin
  if not FileExists(ProfilePath) then
  begin
    SetStatus('No saved profile in this Setup session. Save a profile first.');
    Exit;
  end;

  InputService.CancelCapture;
  CapturingRow := -1;
  UpdateRumbleControls;

  if InputService.LoadProfile(ProfilePath) then
  begin
    RestoreProfileLabels;
    SetStatus('Profile loaded. Saved action bindings have been restored.');
  end
  else
    SetStatus('Profile load failed: ' + InputService.LastError);
end;

procedure CommonOnClick(Sender: TObject);
var
  I: Integer;
begin
  if Sender = TObject(TitleBar.GetObjectMinBtn) then
    FMXForm.Minimize
  else if Sender = TObject(TitleBar.GetObjectCloseBtn) then
    WizardForm.Close
  else if Sender = TObject(RescanButton.GetObject) then
    RefreshControllers
  else if Sender = TObject(PresetButton.GetObject) then
    ApplyXboxPreset
  else if Sender = TObject(RumbleLowButton.GetObject) then
  begin
    if InputService.SetRumble(SelectedDeviceID, 52000, 0, 450) then
      SetStatus('Low-frequency motor pulse sent.')
    else
      SetStatus(InputService.LastError);
  end
  else if Sender = TObject(RumbleHighButton.GetObject) then
  begin
    if InputService.SetRumble(SelectedDeviceID, 0, 52000, 450) then
      SetStatus('High-frequency motor pulse sent.')
    else
      SetStatus(InputService.LastError);
  end
  else if Sender = TObject(RumbleBothButton.GetObject) then
  begin
    if InputService.SetRumble(SelectedDeviceID, 50000, 32000, 550) then
      SetStatus('Both vibration motors activated.')
    else
      SetStatus(InputService.LastError);
  end
  else if Sender = TObject(RumbleStopButton.GetObject) then
  begin
    InputService.StopRumble(SelectedDeviceID);
    SetStatus('Vibration stopped.');
  end
  else if Sender = TObject(ProfileSaveButton.GetObject) then
    SaveProfile
  else if Sender = TObject(ProfileLoadButton.GetObject) then
    LoadProfile
  else if Sender = TObject(InputEnabledButton.GetObject) then
  begin
    InputService.Enabled(not InputService.IsEnabled);
    if InputService.IsEnabled then
    begin
      InputEnabledButton.Text('DISABLE INPUT');
      UpdateRumbleControls;
      SetStatus('Input polling is enabled.');
    end
    else
    begin
      InputEnabledButton.Text('ENABLE INPUT');
      CapturingRow := -1;
      UpdateRumbleControls;
      SetStatus('Input is disabled. Existing bindings are preserved.');
    end;
  end
  else if Sender = TObject(CancelCaptureButton.GetObject) then
  begin
    InputService.CancelCapture;
    CapturingRow := -1;
    UpdateRumbleControls;
    SetStatus('Input capture cancelled.');
  end
  else
    for I := 0 to 8 do
      if Sender = TObject(InputRows[I].RebindButton.GetObject) then
      begin
        StartCapture(I);
        Break;
      end;
end;

procedure DeviceComboOnChange(Sender: TObject);
begin
  SelectController;
end;

procedure FMXInit;
var
  I: Integer;
begin
  FMXForm := InitFormHandle;
  FormLayer := InitLayoutHandle;
  TitleBar := InitWinTitleBarHandle;
  InputService := InitInput;

  HeaderTitle := InitLabelHandle;
  HeaderSubtitle := InitLabelHandle;
  DeviceTitle := InitLabelHandle;
  DeviceCombo := InitComboBoxHandle;
  RescanButton := InitButtonHandle;
  PresetButton := InitButtonHandle;
  StatusLabel := InitLabelHandle;
  LeftPanel := InitRoundRectHandle;
  RightPanel := InitRoundRectHandle;
  MappingTitle := InitLabelHandle;
  LiveTitle := InitLabelHandle;
  LiveActionLabel := InitLabelHandle;
  ActionCountLabel := InitLabelHandle;
  LiveHintLabel := InitLabelHandle;
  RumbleTitle := InitLabelHandle;
  RumbleInfoLabel := InitLabelHandle;
  RumbleLowButton := InitButtonHandle;
  RumbleHighButton := InitButtonHandle;
  RumbleBothButton := InitButtonHandle;
  RumbleStopButton := InitButtonHandle;
  ProfileTitle := InitLabelHandle;
  ProfileSaveButton := InitButtonHandle;
  ProfileLoadButton := InitButtonHandle;
  InputEnabledButton := InitButtonHandle;
  CancelCaptureButton := InitButtonHandle;
  FooterLabel := InitLabelHandle;

  for I := 0 to 8 do
  begin
    InputRows[I].Action := ActionCode(I);
    InputRows[I].ActionLabel := InitLabelHandle;
    InputRows[I].MappingLabel := InitLabelHandle;
    InputRows[I].RebindButton := InitButtonHandle;
    InputRows[I].Glyph := InitEllipseHandle;
    InputRows[I].GlyphLabel := InitLabelHandle;
  end;

  ControllerCount := 0;
  SelectedDeviceIndex := -1;
  CapturingRow := -1;
  ActionCount := 0;
  ProfilePath := ExpandConstant('{tmp}\FMXBridge_Input_Profile.json');
  ProfileViewPath := ExpandConstant('{tmp}\FMXBridge_Input_Profile.txt');
end;

procedure FMXDesigning;
var
  I, Y: Integer;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF111B29);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  LeftPanel.FCreate(FormLayer.Handle);
  LeftPanel.SetBounds(20, 190, 630, 472);
  LeftPanel.FillColor(CColorPanel);
  LeftPanel.StrokeColor(CColorPanelLine);
  LeftPanel.StrokeSetting(1, scFlat, sdSolid, sjMiter);
  LeftPanel.HitTest(False);

  RightPanel.FCreate(FormLayer.Handle);
  RightPanel.SetBounds(666, 190, 314, 472);
  RightPanel.FillColor(CColorPanel);
  RightPanel.StrokeColor(CColorPanelLine);
  RightPanel.StrokeSetting(1, scFlat, sdSolid, sjMiter);
  RightPanel.HitTest(False);

  HeaderTitle.FCreate(FormLayer.Handle);
  HeaderTitle.SetBounds(24, 48, 600, 32);
  HeaderTitle.Text('INPUT LAB');
  HeaderTitle.FontSetting('Segoe UI Variable Display Semib', 24, CColorText);
  HeaderTitle.TextSetting(False, txLeading, txCenter);
  HeaderTitle.HitTest(False);

  HeaderSubtitle.FCreate(FormLayer.Handle);
  HeaderSubtitle.SetBounds(26, 82, 720, 20);
  HeaderSubtitle.Text('GAMEPAD CONFIGURATION  /  XINPUT + DIRECTINPUT  /  LIVE REMAPPING');
  HeaderSubtitle.FontSetting('Segoe UI Variable Text', 11, CColorMuted);
  HeaderSubtitle.TextSetting(False, txLeading, txCenter);
  HeaderSubtitle.HitTest(False);

  DeviceTitle.FCreate(FormLayer.Handle);
  DeviceTitle.SetBounds(24, 116, 85, 30);
  DeviceTitle.Text('DEVICE');
  DeviceTitle.FontSetting('Segoe UI Variable Text Semib', 10, CColorMuted);
  DeviceTitle.TextSetting(False, txLeading, txCenter);
  DeviceTitle.HitTest(False);

  DeviceCombo.FCreate(FormLayer.Handle);
  DeviceCombo.SetBounds(105, 114, 465, 34);
  DeviceCombo.SetDropDownCount(8);
  DeviceCombo.FontSetting('Segoe UI Variable Text', 11, CColorText);
  DeviceCombo.OnChange(@DeviceComboOnChange);

  RescanButton.FCreate(FormLayer.Handle);
  RescanButton.SetBounds(580, 114, 94, 34);
  RescanButton.Text('RESCAN');
  RescanButton.FontSetting('Segoe UI Variable Text Semib', 10, CColorText);
  RescanButton.TextSetting(False, txCenter, txCenter);
  RescanButton.OnClick(@CommonOnClick);

  PresetButton.FCreate(FormLayer.Handle);
  PresetButton.SetBounds(684, 114, 142, 34);
  PresetButton.Text('XBOX PRESET');
  PresetButton.FontSetting('Segoe UI Variable Text Semib', 10, CColorText);
  PresetButton.TextSetting(False, txCenter, txCenter);
  PresetButton.OnClick(@CommonOnClick);

  CancelCaptureButton.FCreate(FormLayer.Handle);
  CancelCaptureButton.SetBounds(836, 114, 144, 34);
  CancelCaptureButton.Text('CANCEL CAPTURE');
  CancelCaptureButton.FontSetting('Segoe UI Variable Text Semib', 10, CColorText);
  CancelCaptureButton.TextSetting(False, txCenter, txCenter);
  CancelCaptureButton.OnClick(@CommonOnClick);

  StatusLabel.FCreate(FormLayer.Handle);
  StatusLabel.SetBounds(24, 151, 950, 26);
  StatusLabel.Text('Looking for game controllers...');
  StatusLabel.FontSetting('Segoe UI Variable Text', 11, CColorAccent);
  StatusLabel.TextSetting(False, txLeading, txCenter);
  StatusLabel.HitTest(False);

  MappingTitle.FCreate(FormLayer.Handle);
  MappingTitle.SetBounds(42, 201, 520, 28);
  MappingTitle.Text('ACTION MAPPING');
  MappingTitle.FontSetting('Segoe UI Variable Display Semib', 16, CColorText);
  MappingTitle.TextSetting(False, txLeading, txCenter);
  MappingTitle.HitTest(False);

  for I := 0 to 8 do
  begin
    Y := 229 + I * 46;

    InputRows[I].Glyph.FCreate(FormLayer.Handle);
    InputRows[I].Glyph.SetBounds(42, Y + 3, 32, 32);
    InputRows[I].Glyph.FillColor(XboxGrey);
    InputRows[I].Glyph.StrokeColor(XboxGrey);
    InputRows[I].Glyph.StrokeSetting(0, scFlat, sdSolid, sjMiter);
    InputRows[I].Glyph.HitTest(False);

    InputRows[I].GlyphLabel.FCreate(FormLayer.Handle);
    InputRows[I].GlyphLabel.SetBounds(42, Y + 3, 32, 32);
    InputRows[I].GlyphLabel.Text('--');
    InputRows[I].GlyphLabel.FontSetting('Segoe UI Variable Text Semib', 9, CColorText);
    InputRows[I].GlyphLabel.TextSetting(False, txCenter, txCenter);
    InputRows[I].GlyphLabel.HitTest(False);

    InputRows[I].ActionLabel.FCreate(FormLayer.Handle);
    InputRows[I].ActionLabel.SetBounds(88, Y + 1, 158, 36);
    InputRows[I].ActionLabel.Text(ActionCaption(I));
    InputRows[I].ActionLabel.FontSetting('Segoe UI Variable Text Semib', 12, CColorText);
    InputRows[I].ActionLabel.TextSetting(False, txLeading, txCenter);
    InputRows[I].ActionLabel.HitTest(False);

    InputRows[I].MappingLabel.FCreate(FormLayer.Handle);
    InputRows[I].MappingLabel.SetBounds(252, Y + 1, 205, 36);
    InputRows[I].MappingLabel.Text('NOT MAPPED');
    InputRows[I].MappingLabel.FontSetting('Segoe UI Variable Text', 11, CColorMuted);
    InputRows[I].MappingLabel.TextSetting(False, txLeading, txCenter);
    InputRows[I].MappingLabel.HitTest(False);

    InputRows[I].RebindButton.FCreate(FormLayer.Handle);
    InputRows[I].RebindButton.SetBounds(500, Y + 3, 116, 30);
    InputRows[I].RebindButton.Text('REMAP');
    InputRows[I].RebindButton.FontSetting('Segoe UI Variable Text Semib', 10, CColorText);
    InputRows[I].RebindButton.TextSetting(False, txCenter, txCenter);
    InputRows[I].RebindButton.OnClick(@CommonOnClick);
  end;

  LiveTitle.FCreate(FormLayer.Handle);
  LiveTitle.SetBounds(688, 201, 270, 28);
  LiveTitle.Text('LIVE INPUT');
  LiveTitle.FontSetting('Segoe UI Variable Display Semib', 16, CColorText);
  LiveTitle.TextSetting(False, txLeading, txCenter);
  LiveTitle.HitTest(False);

  LiveActionLabel.FCreate(FormLayer.Handle);
  LiveActionLabel.SetBounds(690, 245, 266, 32);
  LiveActionLabel.Text('LAST ACTION  /  --');
  LiveActionLabel.FontSetting('Segoe UI Variable Text Semib', 12, CColorAccent);
  LiveActionLabel.TextSetting(False, txLeading, txCenter);
  LiveActionLabel.HitTest(False);

  ActionCountLabel.FCreate(FormLayer.Handle);
  ActionCountLabel.SetBounds(690, 281, 266, 25);
  ActionCountLabel.Text('TRIGGERS: 0');
  ActionCountLabel.FontSetting('Segoe UI Variable Text', 11, CColorMuted);
  ActionCountLabel.TextSetting(False, txLeading, txCenter);
  ActionCountLabel.HitTest(False);

  LiveHintLabel.FCreate(FormLayer.Handle);
  LiveHintLabel.SetBounds(690, 314, 266, 48);
  LiveHintLabel.Text('Press a mapped control. The active action lights up in the list.');
  LiveHintLabel.FontSetting('Segoe UI Variable Text', 10, CColorMuted);
  LiveHintLabel.TextSetting(True, txLeading, txLeading);
  LiveHintLabel.HitTest(False);

  RumbleTitle.FCreate(FormLayer.Handle);
  RumbleTitle.SetBounds(690, 376, 260, 24);
  RumbleTitle.Text('CONTROLLER VIBRATION');
  RumbleTitle.FontSetting('Segoe UI Variable Text Semib', 11, CColorText);
  RumbleTitle.TextSetting(False, txLeading, txCenter);
  RumbleTitle.HitTest(False);

  RumbleInfoLabel.FCreate(FormLayer.Handle);
  RumbleInfoLabel.SetBounds(690, 402, 268, 30);
  RumbleInfoLabel.Text('Checking vibration support...');
  RumbleInfoLabel.FontSetting('Segoe UI Variable Text', 9, CColorMuted);
  RumbleInfoLabel.TextSetting(False, txLeading, txCenter);
  RumbleInfoLabel.HitTest(False);

  RumbleLowButton.FCreate(FormLayer.Handle);
  RumbleLowButton.SetBounds(690, 438, 124, 30);
  RumbleLowButton.Text('LOW MOTOR');
  RumbleLowButton.FontSetting('Segoe UI Variable Text Semib', 9, CColorText);
  RumbleLowButton.TextSetting(False, txCenter, txCenter);
  RumbleLowButton.OnClick(@CommonOnClick);

  RumbleHighButton.FCreate(FormLayer.Handle);
  RumbleHighButton.SetBounds(824, 438, 132, 30);
  RumbleHighButton.Text('HIGH MOTOR');
  RumbleHighButton.FontSetting('Segoe UI Variable Text Semib', 9, CColorText);
  RumbleHighButton.TextSetting(False, txCenter, txCenter);
  RumbleHighButton.OnClick(@CommonOnClick);

  RumbleBothButton.FCreate(FormLayer.Handle);
  RumbleBothButton.SetBounds(690, 475, 124, 30);
  RumbleBothButton.Text('BOTH MOTORS');
  RumbleBothButton.FontSetting('Segoe UI Variable Text Semib', 9, CColorText);
  RumbleBothButton.TextSetting(False, txCenter, txCenter);
  RumbleBothButton.OnClick(@CommonOnClick);

  RumbleStopButton.FCreate(FormLayer.Handle);
  RumbleStopButton.SetBounds(824, 475, 132, 30);
  RumbleStopButton.Text('STOP RUMBLE');
  RumbleStopButton.FontSetting('Segoe UI Variable Text Semib', 9, CColorText);
  RumbleStopButton.TextSetting(False, txCenter, txCenter);
  RumbleStopButton.OnClick(@CommonOnClick);

  ProfileTitle.FCreate(FormLayer.Handle);
  ProfileTitle.SetBounds(690, 526, 260, 24);
  ProfileTitle.Text('INPUT PROFILE');
  ProfileTitle.FontSetting('Segoe UI Variable Text Semib', 11, CColorText);
  ProfileTitle.TextSetting(False, txLeading, txCenter);
  ProfileTitle.HitTest(False);

  ProfileSaveButton.FCreate(FormLayer.Handle);
  ProfileSaveButton.SetBounds(690, 555, 124, 30);
  ProfileSaveButton.Text('SAVE PROFILE');
  ProfileSaveButton.FontSetting('Segoe UI Variable Text Semib', 9, CColorText);
  ProfileSaveButton.TextSetting(False, txCenter, txCenter);
  ProfileSaveButton.OnClick(@CommonOnClick);

  ProfileLoadButton.FCreate(FormLayer.Handle);
  ProfileLoadButton.SetBounds(824, 555, 132, 30);
  ProfileLoadButton.Text('LOAD PROFILE');
  ProfileLoadButton.FontSetting('Segoe UI Variable Text Semib', 9, CColorText);
  ProfileLoadButton.TextSetting(False, txCenter, txCenter);
  ProfileLoadButton.OnClick(@CommonOnClick);

  InputEnabledButton.FCreate(FormLayer.Handle);
  InputEnabledButton.SetBounds(690, 600, 266, 32);
  InputEnabledButton.Text('DISABLE INPUT');
  InputEnabledButton.FontSetting('Segoe UI Variable Text Semib', 10, CColorText);
  InputEnabledButton.TextSetting(False, txCenter, txCenter);
  InputEnabledButton.OnClick(@CommonOnClick);

  FooterLabel.FCreate(FormLayer.Handle);
  FooterLabel.SetBounds(24, 674, 950, 22);
  FooterLabel.Text('Xbox button prompts are drawn with FMX shapes. No external controller artwork is required.');
  FooterLabel.FontSetting('Segoe UI Variable Text', 9, CColorMuted);
  FooterLabel.TextSetting(False, txLeading, txCenter);
  FooterLabel.HitTest(False);
end;

function InitializeSetup(): Boolean;
begin
  FMXInit;
  Result := True;
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(1000, 710);
  FMXDesigning;
  FMXForm.Show;

  RefreshControllers;
  if not InputService.StartPolling(16, @InputPoll) then
    SetStatus('Input polling could not start: ' + InputService.LastError);
end;

procedure DeinitializeSetup();
begin
  if InputService <> nil then
  begin
    InputService.StopPolling;
    InputService.StopRumble(SelectedDeviceID);
    InputService.Shutdown;
  end;
  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;
