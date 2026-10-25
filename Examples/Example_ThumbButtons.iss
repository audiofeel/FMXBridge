[Setup]
AppName=Example_ThumbButtons
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
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Music\music1.ogg"; Flags: dontcopy nocompression

[Code]
#include "Modules\FMXBridgeHandle.iss"

const
  PageCount = 5;
  DemoMaxThumbButtons = 7;

var
  TextColor             : TAlphaColor;

  FMXForm               : FForm;
  FormLayer             : FLayout;
  TitleBar              : FWinTitleBar;
  Heading               : FLabel;
  PageText              : FLabel;
  InfoText              : FLabel;
  CountText             : FLabel;
  SelectedText          : FLabel;
  FooterText            : FLabel;

  ThumbButtons          : FThumbButtons;
  BASSPlayer            : FBASSPlayer;
  AudioReady            : Boolean;
  ThumbPrev             : Integer;
  ThumbPlay             : Integer;
  ThumbNext             : Integer;
  ThumbIcon             : Integer;
  ThumbNoBackground     : Integer;
  ThumbDismiss          : Integer;
  ThumbAction           : Integer;

  SelectPrevSlotBtn     : FButton;
  SelectNextSlotBtn     : FButton;
  ResetSelectedBtn      : FButton;
  ToggleEnabledBtn      : FButton;
  ToggleVisibleBtn      : FButton;
  ChangeHintBtn         : FButton;
  ToggleIconGlyphBtn    : FButton;
  ToggleGlyphColorBtn   : FButton;
  ToggleDismissBtn      : FButton;
  ToggleNoBackgroundBtn : FButton;
  ResetAllBtn           : FButton;

  PageIndex             : Integer;
  SelectedThumb         : Integer;

  ThumbEnabled          : array[0..6] of Boolean;
  ThumbVisible          : array[0..6] of Boolean;
  ThumbDismissState     : array[0..6] of Boolean;
  ThumbNoBackgroundFlag : array[0..6] of Boolean;
  ThumbIconMode         : array[0..6] of Boolean;
  ThumbSystemGlyphColor : array[0..6] of Boolean;
  ThumbHintRevision     : array[0..6] of Integer;
  ThumbClickCount       : array[0..6] of Integer;
  ThumbHints            : array[0..6] of String;

procedure FMXInit;
begin
  if IsWinDark then
    TextColor := $FFFFFFFF
  else
    TextColor := $FF000000;

  FMXForm               := InitFormHandle;
  FormLayer             := InitLayoutHandle;
  TitleBar              := InitWinTitleBarHandle;
  Heading               := InitLabelHandle;
  PageText              := InitLabelHandle;
  InfoText              := InitLabelHandle;
  CountText             := InitLabelHandle;
  SelectedText          := InitLabelHandle;
  FooterText            := InitLabelHandle;

  ThumbButtons          := InitThumbButtons;
  BASSPlayer            := InitBASSPlayer;
  AudioReady            := False;

  SelectPrevSlotBtn     := InitButtonHandle;
  SelectNextSlotBtn     := InitButtonHandle;
  ResetSelectedBtn      := InitButtonHandle;
  ToggleEnabledBtn      := InitButtonHandle;
  ToggleVisibleBtn      := InitButtonHandle;
  ChangeHintBtn         := InitButtonHandle;
  ToggleIconGlyphBtn    := InitButtonHandle;
  ToggleGlyphColorBtn   := InitButtonHandle;
  ToggleDismissBtn      := InitButtonHandle;
  ToggleNoBackgroundBtn := InitButtonHandle;
  ResetAllBtn           := InitButtonHandle;

  PageIndex := 1;
  SelectedThumb := 0;
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

function YesNo(Value: Boolean): String;
begin
  if Value then
    Result := 'YES'
  else
    Result := 'NO';
end;

function DefaultHint(Index: Integer): String;
begin
  if Index = ThumbPrev then
    Result := 'Previous page'
  else if Index = ThumbPlay then
  begin
    if not AudioReady then
      Result := 'Audio unavailable'
    else if BASSPlayer.IsPlaying then
      Result := 'Pause playback'
    else if BASSPlayer.IsPaused then
      Result := 'Resume playback'
    else
      Result := 'Play playback';
  end
  else if Index = ThumbNext then
    Result := 'Next page'
  else if Index = ThumbIcon then
    Result := 'Icon / glyph switch test'
  else if Index = ThumbNoBackground then
    Result := 'NoBackground flag test'
  else if Index = ThumbDismiss then
    Result := 'DismissOnClick flag test'
  else
    Result := 'Custom action / click counter';
end;

function GlyphForButton(Index: Integer): String;
begin
  if Index = ThumbPrev then
    Result := #$E76B                 // Back / previous
  else if Index = ThumbPlay then
  begin
    if AudioReady then
    begin
      if BASSPlayer.IsPlaying then
        Result := #$E769            // Pause
      else
        Result := #$E768;           // Play / resume
    end
    else
      Result := #$E768;             // Play fallback if audio is unavailable
  end
  else if Index = ThumbNext then
    Result := #$E76C                 // Forward / next
  else if Index = ThumbIcon then
    Result := #$E721                 // Search / test icon
  else if Index = ThumbNoBackground then
    Result := #$E713                 // Settings
  else if Index = ThumbDismiss then
    Result := #$E8BB                 // Close
  else
    Result := #$E946;                // Info / action
end;

function IsNavigationAllowed(Index: Integer): Boolean;
begin
  Result := True;

  if (Index = ThumbPrev) and (PageIndex <= 1) then
    Result := False
  else if (Index = ThumbNext) and (PageIndex >= PageCount) then
    Result := False;
end;

procedure ApplyEnabledState(Index: Integer);
begin
  ThumbButtons.Enabled(Index,
    ThumbEnabled[Index] and IsNavigationAllowed(Index));
end;

procedure ApplyIconOrGlyph(Index: Integer);
var
  GlyphColor: TAlphaColor;
begin
  if ThumbIconMode[Index] then
    ThumbButtons.SetIcon(Index, ExtractAndLoad('setup.ico'))
  else
  begin
    if ThumbSystemGlyphColor[Index] then
      GlyphColor := 0  // Use the Windows taskbar theme's default glyph color.
    else
      GlyphColor := $FF42A5F5;

    ThumbButtons.SetGlyph(Index, GlyphForButton(Index),
      'Segoe MDL2 Assets', GlyphColor);
  end;
end;

procedure ApplyThumbState(Index: Integer);
begin
  ApplyIconOrGlyph(Index);
  ThumbButtons.SetHint(Index, ThumbHints[Index]);
  ApplyEnabledState(Index);
  ThumbButtons.Visible(Index, ThumbVisible[Index]);
  ThumbButtons.DismissOnClick(Index, ThumbDismissState[Index]);
  ThumbButtons.NoBackground(Index, ThumbNoBackgroundFlag[Index]);
end;

procedure UpdatePage;
begin
  PageText.Text(Format('PAGE %d / %d', [PageIndex, PageCount]));

  ApplyEnabledState(ThumbPrev);
  ApplyEnabledState(ThumbNext);

  CountText.Text(Format(
    'FThumbButtons.Count = %d   |   Windows thumbnail toolbar limit = %d', [ThumbButtons.Count, DemoMaxThumbButtons]));
end;

procedure UpdateSelectedInfo;
var
  EffectiveEnabled: Boolean;
  DisplayMode: String;
begin
  if (SelectedThumb < 0) or (SelectedThumb >= ThumbButtons.Count) then
    Exit;

  EffectiveEnabled := ThumbEnabled[SelectedThumb] and
    IsNavigationAllowed(SelectedThumb);

  if ThumbIconMode[SelectedThumb] then
    DisplayMode := 'ICON'
  else
    DisplayMode := 'GLYPH';

  SelectedText.Text(Format(
    'Selected slot: %d / %d   |   Enabled: %s (effective: %s)   |   Visible: %s   |   Mode: %s   |   System glyph color: %s' + #13#10 +
    'DismissOnClick: %s   |   NoBackground: %s   |   Hint revisions: %d   |   Clicks: %d', [SelectedThumb + 1, ThumbButtons.Count,
     YesNo(ThumbEnabled[SelectedThumb]), YesNo(EffectiveEnabled),
     YesNo(ThumbVisible[SelectedThumb]), DisplayMode,
     YesNo(ThumbSystemGlyphColor[SelectedThumb]),
     YesNo(ThumbDismissState[SelectedThumb]),
     YesNo(ThumbNoBackgroundFlag[SelectedThumb]),
     ThumbHintRevision[SelectedThumb], ThumbClickCount[SelectedThumb]]));
end;

procedure SetInfo(const S: String);
begin
  InfoText.Text(S);
  Log('ThumbButtons demo: ' + S);
end;

procedure UpdatePlayButton;
begin
  if not AudioReady then
    ThumbHints[ThumbPlay] := 'Audio unavailable'
  else if BASSPlayer.IsPlaying then
    ThumbHints[ThumbPlay] := 'Pause playback'
  else if BASSPlayer.IsPaused then
    ThumbHints[ThumbPlay] := 'Resume playback'
  else
    ThumbHints[ThumbPlay] := 'Play playback';

  ApplyIconOrGlyph(ThumbPlay);
  ThumbButtons.SetHint(ThumbPlay, ThumbHints[ThumbPlay]);
end;

procedure TogglePlayback;
begin
  if not AudioReady then
  begin
    SetInfo('BASS could not initialize music1.ogg; other thumbnail-button features remain testable.');
    Exit;
  end;

  if BASSPlayer.IsPlaying then
    BASSPlayer.Pause
  else if BASSPlayer.IsPaused then
    BASSPlayer.Resume
  else
    BASSPlayer.Play;

  UpdatePlayButton;

  if BASSPlayer.IsPlaying then
    SetInfo('BASSPlayer is playing music1.ogg. Click the thumbnail Play/Pause button to pause.')
  else if BASSPlayer.IsPaused then
    SetInfo('BASSPlayer is paused. Click the thumbnail Play/Resume button to continue.')
  else
    SetInfo('BASSPlayer is stopped. Click the thumbnail Play button to start.');
end;

procedure ResetThumbState(Index: Integer);
begin
  ThumbEnabled[Index] := True;
  ThumbVisible[Index] := True;
  ThumbDismissState[Index] := (Index = ThumbDismiss);
  ThumbNoBackgroundFlag[Index] := (Index = ThumbNoBackground);
  ThumbIconMode[Index] := (Index = ThumbIcon);
  ThumbSystemGlyphColor[Index] := True;
  ThumbHintRevision[Index] := 0;
  ThumbHints[Index] := DefaultHint(Index);

  ApplyThumbState(Index);
end;

procedure UpdateSelection;
begin
  UpdateSelectedInfo;

  SelectPrevSlotBtn.Enabled(SelectedThumb > 0);
  SelectNextSlotBtn.Enabled(SelectedThumb < ThumbButtons.Count - 1);

  if ThumbIconMode[SelectedThumb] then
    ToggleIconGlyphBtn.Text('Switch to Glyph')
  else
    ToggleIconGlyphBtn.Text('Switch to Icon');

  ToggleEnabledBtn.Text('Toggle Enabled: ' + YesNo(ThumbEnabled[SelectedThumb]));
  ToggleVisibleBtn.Text('Toggle Visible: ' + YesNo(ThumbVisible[SelectedThumb]));
  ToggleDismissBtn.Text('Toggle Dismiss: ' + YesNo(ThumbDismissState[SelectedThumb]));
  ToggleNoBackgroundBtn.Text('Toggle NoBG: ' + YesNo(ThumbNoBackgroundFlag[SelectedThumb]));

  if ThumbSystemGlyphColor[SelectedThumb] then
    ToggleGlyphColorBtn.Text('Glyph color: System')
  else
    ToggleGlyphColorBtn.Text('Glyph color: Accent');
end;

procedure SelectPreviousSlot;
begin
  if SelectedThumb > 0 then
    SelectedThumb := SelectedThumb - 1;
  UpdateSelection;
end;

procedure SelectNextSlot;
begin
  if SelectedThumb < ThumbButtons.Count - 1 then
    SelectedThumb := SelectedThumb + 1;
  UpdateSelection;
end;

procedure ChangeSelectedHint;
begin
  ThumbHintRevision[SelectedThumb] := ThumbHintRevision[SelectedThumb] + 1;
  ThumbHints[SelectedThumb] := Format('%s (hint revision %d)', [DefaultHint(SelectedThumb), ThumbHintRevision[SelectedThumb]]);
  ThumbButtons.SetHint(SelectedThumb, ThumbHints[SelectedThumb]);
  SetInfo(Format('SetHint called for slot %d. Hover the taskbar button to inspect its updated tooltip.', [SelectedThumb + 1]));
  UpdateSelection;
end;

procedure ToggleSelectedIconGlyph;
begin
  ThumbIconMode[SelectedThumb] := not ThumbIconMode[SelectedThumb];
  ApplyIconOrGlyph(SelectedThumb);

  if ThumbIconMode[SelectedThumb] then
    SetInfo(Format('SetIcon: slot %d now uses Files\setup.ico.', [SelectedThumb + 1]))
  else
    SetInfo(Format('SetGlyph: slot %d now uses a Segoe MDL2 Assets glyph.', [SelectedThumb + 1]));

  UpdateSelection;
end;

procedure ToggleSelectedGlyphColor;
begin
  // A glyph is needed to make the color change visible.
  ThumbIconMode[SelectedThumb] := False;
  ThumbSystemGlyphColor[SelectedThumb] := not ThumbSystemGlyphColor[SelectedThumb];
  ApplyIconOrGlyph(SelectedThumb);

  if ThumbSystemGlyphColor[SelectedThumb] then
    SetInfo('SetGlyph called with color=0: the module chooses a glyph color from the Windows light/dark theme setting.')
  else
    SetInfo('SetGlyph called with explicit accent color $FF42A5F5.');

  UpdateSelection;
end;

procedure ToggleSelectedEnabled;
begin
  ThumbEnabled[SelectedThumb] := not ThumbEnabled[SelectedThumb];
  ApplyEnabledState(SelectedThumb);
  SetInfo(Format('Enabled(%d, %s) called.', [SelectedThumb, YesNo(ThumbEnabled[SelectedThumb])]));
  UpdateSelection;
end;

procedure ToggleSelectedVisible;
begin
  ThumbVisible[SelectedThumb] := not ThumbVisible[SelectedThumb];
  ThumbButtons.Visible(SelectedThumb, ThumbVisible[SelectedThumb]);
  SetInfo(Format('Visible(%d, %s) called. Use Reset Selected Slot to restore a hidden button.', [SelectedThumb, YesNo(ThumbVisible[SelectedThumb])]));
  UpdateSelection;
end;

procedure ToggleSelectedDismiss;
begin
  ThumbDismissState[SelectedThumb] := not ThumbDismissState[SelectedThumb];
  ThumbButtons.DismissOnClick(SelectedThumb, ThumbDismissState[SelectedThumb]);
  SetInfo(Format('DismissOnClick(%d, %s) called.', [SelectedThumb, YesNo(ThumbDismissState[SelectedThumb])]));
  UpdateSelection;
end;

procedure ToggleSelectedNoBackground;
begin
  ThumbNoBackgroundFlag[SelectedThumb] := not ThumbNoBackgroundFlag[SelectedThumb];
  ThumbButtons.NoBackground(SelectedThumb, ThumbNoBackgroundFlag[SelectedThumb]);
  SetInfo(Format('NoBackground(%d, %s) called.', [SelectedThumb, YesNo(ThumbNoBackgroundFlag[SelectedThumb])]));
  UpdateSelection;
end;

procedure ResetSelected;
begin
  ResetThumbState(SelectedThumb);
  UpdatePage;
  SetInfo(Format('Slot %d restored to its demo default state.', [SelectedThumb + 1]));
  UpdateSelection;
end;

procedure ResetAll;
var
  I: Integer;
begin
  for I := 0 to ThumbButtons.Count - 1 do
    ResetThumbState(I);

  PageIndex := 1;
  UpdatePlayButton;

  UpdatePage;
  SetInfo('All seven slots restored to default. Click counters are retained for diagnostics.');
  UpdateSelection;
end;

procedure ThumbButtonClick(const Index: Integer);
begin
  if (Index < 0) or (Index >= ThumbButtons.Count) then
    Exit;

  ThumbClickCount[Index] := ThumbClickCount[Index] + 1;

  case Index of
    0:
      begin
        if PageIndex > 1 then
          PageIndex := PageIndex - 1;
        UpdatePage;
        SetInfo(Format('Thumbnail callback received index %d: previous page action. Current page: %d.', [Index, PageIndex]));
      end;

    1:
      begin
        TogglePlayback;
        if AudioReady then
        begin
          if BASSPlayer.IsPlaying then
            SetInfo(Format('Thumbnail callback index %d: BASS is PLAYING; click count %d.', [Index, ThumbClickCount[Index]]))
          else if BASSPlayer.IsPaused then
            SetInfo(Format('Thumbnail callback index %d: BASS is PAUSED; click count %d.', [Index, ThumbClickCount[Index]]))
          else
            SetInfo(Format('Thumbnail callback index %d: BASS is STOPPED; click count %d.', [Index, ThumbClickCount[Index]]));
        end
        else
          SetInfo(Format('Thumbnail callback index %d received, but BASS initialization failed.', [Index]));
      end;

    2:
      begin
        if PageIndex < PageCount then
          PageIndex := PageIndex + 1;
        UpdatePage;
        SetInfo(Format('Thumbnail callback received index %d: next page action. Current page: %d.', [Index, PageIndex]));
      end;

    3:
      begin
        ThumbIconMode[Index] := not ThumbIconMode[Index];
        ApplyIconOrGlyph(Index);
        SetInfo('Icon/Glyph test button clicked. Its icon presentation has been switched.');
      end;

    4:
      begin
        ThumbNoBackgroundFlag[Index] := not ThumbNoBackgroundFlag[Index];
        ThumbButtons.NoBackground(Index, ThumbNoBackgroundFlag[Index]);
        SetInfo(Format('NoBackground test clicked: flag is now %s.', [YesNo(ThumbNoBackgroundFlag[Index])]));
      end;

    5:
      SetInfo('DismissOnClick test clicked. If enabled, Windows dismisses the thumbnail toolbar after the click.');

    6:
      begin
        ThumbHintRevision[Index] := ThumbHintRevision[Index] + 1;
        ThumbHints[Index] := Format('Custom action / click counter (click %d)', [ThumbClickCount[Index]]);
        ThumbButtons.SetHint(Index, ThumbHints[Index]);
        SetInfo(Format('Custom action callback received index %d. Its tooltip was updated.', [Index]));
      end;
  end;

  CountText.Text(Format(
    'FThumbButtons.Count = %d   |   Last callback index = %d   |   Click count = %d', [ThumbButtons.Count, Index, ThumbClickCount[Index]]));

  UpdateSelection;
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of
    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(SelectPrevSlotBtn.GetObject):
      SelectPreviousSlot;

    TObject(SelectNextSlotBtn.GetObject):
      SelectNextSlot;

    TObject(ResetSelectedBtn.GetObject):
      ResetSelected;

    TObject(ToggleEnabledBtn.GetObject):
      ToggleSelectedEnabled;

    TObject(ToggleVisibleBtn.GetObject):
      ToggleSelectedVisible;

    TObject(ChangeHintBtn.GetObject):
      ChangeSelectedHint;

    TObject(ToggleIconGlyphBtn.GetObject):
      ToggleSelectedIconGlyph;

    TObject(ToggleGlyphColorBtn.GetObject):
      ToggleSelectedGlyphColor;

    TObject(ToggleDismissBtn.GetObject):
      ToggleSelectedDismiss;

    TObject(ToggleNoBackgroundBtn.GetObject):
      ToggleSelectedNoBackground;

    TObject(ResetAllBtn.GetObject):
      ResetAll;
  end;
end;

procedure CreateThumbButtons;
var
  I: Integer;
begin
  // Keep the same HWND and creation order as the known-working example.
  if not ThumbButtons.FCreate(FMXForm.HandleHWND) then
  begin
    SetInfo('ERROR: FThumbButtons.FCreate failed. Check HWND and subclass initialization.');
    Exit;
  end;

  ThumbButtons.OnClick(@ThumbButtonClick);

  ThumbPrev := ThumbButtons.AddButton('Previous page');
  ThumbPlay := ThumbButtons.AddButton('Play playback');
  ThumbNext := ThumbButtons.AddButton('Next page');
  ThumbIcon := ThumbButtons.AddButton('Icon / glyph switch test');
  ThumbNoBackground := ThumbButtons.AddButton('NoBackground flag test');
  ThumbDismiss := ThumbButtons.AddButton('DismissOnClick flag test');
  ThumbAction := ThumbButtons.AddButton('Custom action / click counter');

  for I := 0 to ThumbButtons.Count - 1 do
    ResetThumbState(I);

  // Ensure the key visual features are enabled by default for immediate testing.
  ThumbIconMode[ThumbIcon] := True;
  ThumbButtons.SetIcon(ThumbIcon, ExtractAndLoad('setup.ico'));

  ThumbNoBackgroundFlag[ThumbNoBackground] := True;
  ThumbButtons.NoBackground(ThumbNoBackground, True);

  ThumbDismissState[ThumbDismiss] := True;
  ThumbButtons.DismissOnClick(ThumbDismiss, True);

  UpdatePage;
  UpdateSelection;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, IsWinDark, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), ALDeepSkyBlue);
  FMXForm.Caption('FMXBridge ThumbButtons - Full API Demo');

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, IsWinDark);
  TitleBar.SetColor(0);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Heading.FCreate(FormLayer.Handle);
  Heading.SetBounds(20, 42, 730, 24);
  Heading.Text('Taskbar Thumbnail Toolbar | Full Feature Test');
  Heading.FontSetting('Segoe UI Variable Display', 16, TextColor);
  Heading.TextSetting(False, txLeading, txCenter);

  PageText.FCreate(FormLayer.Handle);
  PageText.SetBounds(20, 70, 730, 50);
  PageText.Text('PAGE 1 / 5');
  PageText.FontSetting('Segoe UI Variable Display', 38, TextColor);
  PageText.TextSetting(False, txCenter, txCenter);

  InfoText.FCreate(FormLayer.Handle);
  InfoText.SetBounds(20, 124, 730, 38);
  InfoText.Text('Hover over this window icon on the taskbar. Use its thumbnail buttons to test callbacks.');
  InfoText.FontSetting('Segoe UI', 10, TextColor);
  InfoText.TextSetting(True, txCenter, txCenter);

  CountText.FCreate(FormLayer.Handle);
  CountText.SetBounds(20, 166, 730, 22);
  CountText.Text('FThumbButtons.Count = 0');
  CountText.FontSetting('Consolas', 10, TextColor);
  CountText.TextSetting(False, txLeading, txCenter);

  SelectedText.FCreate(FormLayer.Handle);
  SelectedText.SetBounds(20, 190, 730, 48);
  SelectedText.Text('Selected slot state');
  SelectedText.FontSetting('Consolas', 9, TextColor);
  SelectedText.TextSetting(True, txLeading, txCenter);

  SelectPrevSlotBtn.FCreate(FormLayer.Handle);
  SelectPrevSlotBtn.SetBounds(20, 250, 230, 30);
  SelectPrevSlotBtn.Text('Select previous slot');
  SelectPrevSlotBtn.FontSetting('Segoe UI', 10, TextColor);
  SelectPrevSlotBtn.StyleLookUp('buttonstyle_accent');
  SelectPrevSlotBtn.OnClick(@CommonOnClick);

  SelectNextSlotBtn.FCreate(FormLayer.Handle);
  SelectNextSlotBtn.SetBounds(265, 250, 230, 30);
  SelectNextSlotBtn.Text('Select next slot');
  SelectNextSlotBtn.FontSetting('Segoe UI', 10, TextColor);
  SelectNextSlotBtn.StyleLookUp('buttonstyle_accent');
  SelectNextSlotBtn.OnClick(@CommonOnClick);

  ResetSelectedBtn.FCreate(FormLayer.Handle);
  ResetSelectedBtn.SetBounds(510, 250, 230, 30);
  ResetSelectedBtn.Text('Reset selected slot');
  ResetSelectedBtn.FontSetting('Segoe UI', 10, TextColor);
  ResetSelectedBtn.StyleLookUp('buttonstyle_accent');
  ResetSelectedBtn.OnClick(@CommonOnClick);

  ToggleEnabledBtn.FCreate(FormLayer.Handle);
  ToggleEnabledBtn.SetBounds(20, 286, 230, 30);
  ToggleEnabledBtn.Text('Toggle Enabled');
  ToggleEnabledBtn.FontSetting('Segoe UI', 10, TextColor);
  ToggleEnabledBtn.StyleLookUp('buttonstyle_accent');
  ToggleEnabledBtn.OnClick(@CommonOnClick);

  ToggleVisibleBtn.FCreate(FormLayer.Handle);
  ToggleVisibleBtn.SetBounds(265, 286, 230, 30);
  ToggleVisibleBtn.Text('Toggle Visible');
  ToggleVisibleBtn.FontSetting('Segoe UI', 10, TextColor);
  ToggleVisibleBtn.StyleLookUp('buttonstyle_accent');
  ToggleVisibleBtn.OnClick(@CommonOnClick);

  ChangeHintBtn.FCreate(FormLayer.Handle);
  ChangeHintBtn.SetBounds(510, 286, 230, 30);
  ChangeHintBtn.Text('Change Hint');
  ChangeHintBtn.FontSetting('Segoe UI', 10, TextColor);
  ChangeHintBtn.StyleLookUp('buttonstyle_accent');
  ChangeHintBtn.OnClick(@CommonOnClick);

  ToggleIconGlyphBtn.FCreate(FormLayer.Handle);
  ToggleIconGlyphBtn.SetBounds(20, 322, 230, 30);
  ToggleIconGlyphBtn.Text('Switch Icon / Glyph');
  ToggleIconGlyphBtn.FontSetting('Segoe UI', 10, TextColor);
  ToggleIconGlyphBtn.StyleLookUp('buttonstyle_accent');
  ToggleIconGlyphBtn.OnClick(@CommonOnClick);

  ToggleGlyphColorBtn.FCreate(FormLayer.Handle);
  ToggleGlyphColorBtn.SetBounds(265, 322, 230, 30);
  ToggleGlyphColorBtn.Text('Cycle Glyph Color');
  ToggleGlyphColorBtn.FontSetting('Segoe UI', 10, TextColor);
  ToggleGlyphColorBtn.StyleLookUp('buttonstyle_accent');
  ToggleGlyphColorBtn.OnClick(@CommonOnClick);

  ToggleDismissBtn.FCreate(FormLayer.Handle);
  ToggleDismissBtn.SetBounds(510, 322, 230, 30);
  ToggleDismissBtn.Text('Toggle DismissOnClick');
  ToggleDismissBtn.FontSetting('Segoe UI', 10, TextColor);
  ToggleDismissBtn.StyleLookUp('buttonstyle_accent');
  ToggleDismissBtn.OnClick(@CommonOnClick);

  ToggleNoBackgroundBtn.FCreate(FormLayer.Handle);
  ToggleNoBackgroundBtn.SetBounds(20, 358, 230, 30);
  ToggleNoBackgroundBtn.Text('Toggle NoBackground');
  ToggleNoBackgroundBtn.FontSetting('Segoe UI', 10, TextColor);
  ToggleNoBackgroundBtn.StyleLookUp('buttonstyle_accent');
  ToggleNoBackgroundBtn.OnClick(@CommonOnClick);

  ResetAllBtn.FCreate(FormLayer.Handle);
  ResetAllBtn.SetBounds(265, 358, 230, 30);
  ResetAllBtn.Text('Reset all slots');
  ResetAllBtn.FontSetting('Segoe UI', 10, TextColor);
  ResetAllBtn.StyleLookUp('buttonstyle_accent');
  ResetAllBtn.OnClick(@CommonOnClick);

  FooterText.FCreate(FormLayer.Handle);
  FooterText.SetBounds(20, 402, 730, 62);
  FooterText.Text(
    'API covered: FCreate, AddButton, SetIcon, SetGlyph, SetHint, Enabled, Visible, ' +
    'DismissOnClick, NoBackground, Count and OnClick.' + #13#10 +
    'Slot 5 starts with NoBackground; slot 6 starts with DismissOnClick. Callback indexes are zero-based.' + #13#10 +
    'Play/Pause operates on music1.ogg; Previous/Next navigate demo pages.');
  FooterText.FontSetting('Segoe UI', 9, TextColor);
  FooterText.TextSetting(True, txLeading, txLeading);

  AudioReady := BASSPlayer.FCreate(
    FMXForm.HandleHWND, ExtractAndLoad('music1.ogg'), True);

  if AudioReady then
    BASSPlayer.Volume(90)
  else
    InfoText.Text('BASS initialization failed; the thumbnail toolbar API tests are still available.');
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(780, 485);
  FMXDesigning;
  CreateThumbButtons;
  FMXForm.Show;
  SetInfo('Ready. Seven thumbnail buttons registered; use taskbar hover to test every callback and property.');
  UpdatePage;
  UpdateSelection;
end;
