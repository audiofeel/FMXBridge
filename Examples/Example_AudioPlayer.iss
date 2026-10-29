[Setup]
AppName=FMXBridge_AudioPlayer
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
//SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\Fonts\MediaPlayerIcons.ttf"; Flags: dontcopy nocompression
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

const
  CAccent = $FFFFB454;
  CBackground = $FF111925;
  CPanel = $FF172232;
  CPanelLight = $FF202D40;
  CBorder = $FF2B3A50;
  CText = $FFF4F6FA;
  CMuted = $FF9AA9BD;
  CProgressBack = $FF29374A;
  CSpectrumBarCount = 24;
  CSpectrumBarWidth = 2.0;
  CSpectrumBarSpacing = 1.0;

var
  FMXForm: FForm;
  FormLayer: FLayout;
  TitleBar: FWinTitleBar;

  AudioPlayer: FAudioPlayer;
  Spectrum: FAudioSpectrum;
  PlayerTimer: FTimer;

  BrandLabel: FLabel;
  EditionLabel: FLabel;
  FooterLabel: FLabel;
  CardTitle: FLabel;
  CardSubtitle: FLabel;
  StatusLabel: FLabel;
  PositionText: FLabel;
  DurationText: FLabel;
  VolumeIcon: FLabel;
  VolumeText: FLabel;
  ArtIcon: FLabel;

  OpenFileIcon: FLabel;
  OpenFileText: FLabel;
  OpenFolderIcon: FLabel;
  OpenFolderText: FLabel;

  PreviousIcon: FLabel;
  PlayIcon: FLabel;
  StopIcon: FLabel;
  NextIcon: FLabel;

  NowPlayingCard: FRectangle;
  ArtPanel: FRectangle;
  ProgressBarTrack: FRectangle;
  ProgressBarFill: FRectangle;
  OpenFileCard: FRectangle;
  OpenFolderCard: FRectangle;
  PreviousPlate: FRectangle;
  PlayPlate: FRectangle;
  StopPlate: FRectangle;
  NextPlate: FRectangle;
  TopAccent: FRectangle;
  VolumeDivider: FRectangle;
  VolumeTrack: FTrackBar;

procedure FMXInit;
begin
  FMXForm := InitFormHandle;
  FormLayer := InitLayoutHandle;
  TitleBar := InitWinTitleBarHandle;

  AudioPlayer := InitAudioPlayer;
  Spectrum := InitAudioPlayerSpectrum(AudioPlayer);
  PlayerTimer := InitTimer;

  BrandLabel := InitLabelHandle;
  EditionLabel := InitLabelHandle;
  FooterLabel := InitLabelHandle;
  CardTitle := InitLabelHandle;
  CardSubtitle := InitLabelHandle;
  StatusLabel := InitLabelHandle;
  PositionText := InitLabelHandle;
  DurationText := InitLabelHandle;
  VolumeIcon := InitLabelHandle;
  VolumeText := InitLabelHandle;
  ArtIcon := InitLabelHandle;

  OpenFileIcon := InitLabelHandle;
  OpenFileText := InitLabelHandle;
  OpenFolderIcon := InitLabelHandle;
  OpenFolderText := InitLabelHandle;

  PreviousIcon := InitLabelHandle;
  PlayIcon := InitLabelHandle;
  StopIcon := InitLabelHandle;
  NextIcon := InitLabelHandle;

  NowPlayingCard := InitRectangleHandle;
  ArtPanel := InitRectangleHandle;
  ProgressBarTrack := InitRectangleHandle;
  ProgressBarFill := InitRectangleHandle;
  OpenFileCard := InitRectangleHandle;
  OpenFolderCard := InitRectangleHandle;
  PreviousPlate := InitRectangleHandle;
  PlayPlate := InitRectangleHandle;
  StopPlate := InitRectangleHandle;
  NextPlate := InitRectangleHandle;
  TopAccent := InitRectangleHandle;
  VolumeDivider := InitRectangleHandle;

  VolumeTrack := InitTrackBarHandle;
end;

function InitializeSetup(): Boolean;
begin
  AddFontResource(ExtractAndLoad('MediaPlayerIcons.ttf'));
  FMXInit;
  Result := True;
end;

procedure DeinitializeSetup();
begin
  if PlayerTimer <> nil then
    PlayerTimer.Enabled(False);
  if Spectrum <> nil then
  begin
    Spectrum.SetViewActive(False);
    Spectrum.SetEnabled(False);
  end;
  if AudioPlayer <> nil then
    AudioPlayer.ShutDown;

  // The two interface references point to the same COM object.
  Spectrum := nil;
  AudioPlayer := nil;
  RemoveFontResource(ExpandConstant('{tmp}\MediaPlayerIcons.ttf'));
  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;

function TwoDigits(Value: Integer): String;
begin
  Result := IntToStr(Value);
  if Length(Result) < 2 then
    Result := '0' + Result;
end;

function FormatTime(Milliseconds: Integer): String;
var
  TotalSeconds: Integer;
begin
  if Milliseconds < 0 then
    Milliseconds := 0;

  TotalSeconds := Milliseconds div 1000;
  if TotalSeconds >= 3600 then
    Result := IntToStr(TotalSeconds div 3600) + ':' +
      TwoDigits((TotalSeconds div 60) mod 60) + ':' +
      TwoDigits(TotalSeconds mod 60)
  else
    Result := TwoDigits(TotalSeconds div 60) + ':' +
      TwoDigits(TotalSeconds mod 60);
end;

procedure SetVolumeIcon(Value: Single);
begin
  if Value <= 0.001 then
    VolumeIcon.Text(#$E995)
  else if Value <= 0.33 then
    VolumeIcon.Text(#$E992)
  else if Value <= 0.66 then
    VolumeIcon.Text(#$E993)
  else
    VolumeIcon.Text(#$E994);
end;

procedure VolumeChange(Sender: TObject);
var
  Value: Single;
begin
  if AudioPlayer = nil then
    Exit;

  Value := VolumeTrack.GetValue;
  AudioPlayer.Volume(Value);
  SetVolumeIcon(Value);
  VolumeText.Text(IntToStr(Round(Value * 100)) + '%');
end;

procedure UpdatePlayerUI(Sender: TObject);
var
  CurrentFile: WideString;
  ErrorText: WideString;
  PositionMs: Integer;
  DurationMs: Integer;
  ProgressWidth: Integer;
begin
  if AudioPlayer = nil then
    Exit;

  CurrentFile := AudioPlayer.GetCurrentFile;
  ErrorText := AudioPlayer.GetErrorText;
  PositionMs := AudioPlayer.GetPositionMs;
  DurationMs := AudioPlayer.GetDurationMs;

  if CurrentFile = '' then
    CardTitle.Text('Choose a soundtrack')
  else
    CardTitle.Text(ChangeFileExt(ExtractFileName(CurrentFile), ''));

  if ErrorText <> '' then
    StatusLabel.Text('ERROR  /  ' + ErrorText)
  else if AudioPlayer.GetOpening then
    StatusLabel.Text('OPENING AUDIO SOURCE')
  else if AudioPlayer.IsPlaying then
    StatusLabel.Text('NOW PLAYING  /  BACKGROUND AUDIO')
  else if AudioPlayer.IsPaused then
    StatusLabel.Text('PAUSED  /  READY TO RESUME')
  else if CurrentFile <> '' then
    StatusLabel.Text('READY  /  PRESS PLAY')
  else
    StatusLabel.Text('IDLE  /  NO TRACK LOADED');

  if CurrentFile = '' then
    CardSubtitle.Text('FMXBRIDGE  /  AMBIENT PLAYER')
  else
    CardSubtitle.Text('LOCAL AUDIO  /  ' + ExtractFileExt(CurrentFile));

  if AudioPlayer.IsPlaying then
    PlayIcon.Text(#$F5B0)
  else
    PlayIcon.Text(#$E62E);

  PositionText.Text(FormatTime(PositionMs));
  DurationText.Text(FormatTime(DurationMs));

  ProgressWidth := 0;
  if DurationMs > 0 then
    ProgressWidth := Round((PositionMs * 272.0) / DurationMs);
  if ProgressWidth < 0 then
    ProgressWidth := 0;
  if ProgressWidth > 272 then
    ProgressWidth := 272;
  if (PositionMs > 0) and (ProgressWidth = 0) then
    ProgressWidth := 1;

  // This is display-only progress. There is intentionally no seek trackbar.
  ProgressBarFill.SetBounds(136, 165, ProgressWidth, 4);

  // The visualization animation only runs while audio is actually playing.
  if Spectrum <> nil then
    Spectrum.SetViewActive(AudioPlayer.IsPlaying and Spectrum.GetEnabled);
end;

procedure CommonOnClick(Sender: TObject);
var
  NewDir: WideString;
  InitialDir: WideString;
  FileName: WideString;
begin
  case Sender of
    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(OpenFileIcon.GetObject), TObject(OpenFileText.GetObject):
    begin
      InitialDir := '';
      FileName := '';
      if OpenDialog('Select an audio file', 'mp3',
        'MP3 audio files (*.mp3)|*.mp3|All files (*.*)|*.*',
        InitialDir, FileName) then
        AudioPlayer.OpenFile(FileName, True, False);
    end;

    TObject(OpenFolderIcon.GetObject), TObject(OpenFolderText.GetObject):
    begin
      NewDir := '';
      if BrowseDialog('Select a folder containing MP3 files', NewDir) then
        AudioPlayer.OpenFolder(NewDir, True, False);
    end;

    TObject(PreviousIcon.GetObject):
      AudioPlayer.Previous;

    TObject(PlayIcon.GetObject):
    begin
      if AudioPlayer.IsPlaying then
        AudioPlayer.Pause
      else if AudioPlayer.IsPaused then
        AudioPlayer.Resume
      else
        AudioPlayer.Play;
    end;

    TObject(StopIcon.GetObject):
      AudioPlayer.Stop;

    TObject(NextIcon.GetObject):
      AudioPlayer.Next;
  end;

  UpdatePlayerUI(nil);
end;

procedure CreateRoundedPanel(Panel: FRectangle; X, Y, W, H: Integer;
  Fill, Border: Integer; Radius: Integer);
begin
  Panel.FCreate(FormLayer.Handle);
  Panel.SetBounds(X, Y, W, H);
  Panel.FillColor(Fill);
  Panel.StrokeColor(Border);
  Panel.StrokeSetting(1, scRound, sdSolid, sjMiter);
  Panel.CornerStyle(Radius, Radius, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
end;

procedure CreateSpectrumView;
begin
  if Spectrum = nil then
    Exit;

  Spectrum.SetBandCount(CSpectrumBarCount);
  // One FMX control paints all bars. It refreshes only when a new FFT
  // snapshot is published; there are no per-band controls, timer, or
  // perpetual animation used as a frame clock.
  Spectrum.CreateView(FormLayer.Handle, 32, 122, 86, 49);
  Spectrum.SetViewBarWidth(CSpectrumBarWidth);
  Spectrum.SetViewBarSpacing(CSpectrumBarSpacing);
//  Spectrum.SetViewBarRadius(2);
  Spectrum.SetViewBarStyle(sbsSquare); // Square bars, aligned to the canvas pixel grid
  Spectrum.SetViewColors($FFDA8740, $FF58B8BF);
  Spectrum.SetEnabled(True);
  Spectrum.SetViewActive(False);
end;

procedure CreatePlayerControls;
begin
  // Small wordmark and accent rule.
  BrandLabel.FCreate(FormLayer.Handle);
  BrandLabel.SetBounds(22, 37, 250, 18);
  BrandLabel.AutoSize(False);
  BrandLabel.Text('FMXBRIDGE  /  AUDIO DECK');
  BrandLabel.FontSetting('Segoe UI', 10, CText);
  BrandLabel.TextSetting(True, txLeading, txCenter);

  EditionLabel.FCreate(FormLayer.Handle);
  EditionLabel.SetBounds(286, 37, 132, 18);
  EditionLabel.AutoSize(False);
  EditionLabel.Text('AMBIENT  01');
  EditionLabel.FontSetting('Consolas', 9, CAccent);
  EditionLabel.TextSetting(False, txTrailing, txCenter);

  TopAccent.FCreate(FormLayer.Handle);
  TopAccent.SetBounds(20, 55, 400, 2);
  TopAccent.FillColor(CAccent);
  TopAccent.StrokeColor(CAccent);
  TopAccent.StrokeSetting(0, scRound, sdSolid, sjMiter);

  // Main now-playing card.
  CreateRoundedPanel(NowPlayingCard, 20, 65, 400, 126, CPanel, CBorder, 10);
  CreateRoundedPanel(ArtPanel, 31, 77, 88, 100, $FF1E2B3D, $FF34445A, 8);

  ArtIcon.FCreate(FormLayer.Handle);
  ArtIcon.SetBounds(32, 79, 86, 36);
  ArtIcon.AutoSize(False);
  ArtIcon.Text(#$E93C);
  ArtIcon.FontSetting('Segoe MDL2 Assets', 27, CAccent);
  ArtIcon.TextSetting(False, txCenter, txCenter);
  ArtIcon.HitTest(False);

  CreateSpectrumView;

  CardTitle.FCreate(FormLayer.Handle);
  CardTitle.SetBounds(136, 73, 267, 25);
  CardTitle.AutoSize(False);
  CardTitle.Text('Choose a soundtrack');
  CardTitle.FontSetting('Segoe UI', 15, CText);
  CardTitle.TextSetting(False, txLeading, txCenter);

  CardSubtitle.FCreate(FormLayer.Handle);
  CardSubtitle.SetBounds(136, 99, 267, 18);
  CardSubtitle.AutoSize(False);
  CardSubtitle.Text('FMXBRIDGE  /  AMBIENT PLAYER');
  CardSubtitle.FontSetting('Segoe UI', 9, CMuted);
  CardSubtitle.TextSetting(False, txLeading, txCenter);

  StatusLabel.FCreate(FormLayer.Handle);
  StatusLabel.SetBounds(136, 121, 267, 18);
  StatusLabel.AutoSize(False);
  StatusLabel.Text('IDLE  /  NO TRACK LOADED');
  StatusLabel.FontSetting('Segoe UI', 9, CAccent);
  StatusLabel.TextSetting(False, txLeading, txCenter);

  PositionText.FCreate(FormLayer.Handle);
  PositionText.SetBounds(136, 143, 55, 17);
  PositionText.AutoSize(False);
  PositionText.Text('00:00');
  PositionText.FontSetting('Consolas', 9, CMuted);
  PositionText.TextSetting(False, txLeading, txCenter);

  DurationText.FCreate(FormLayer.Handle);
  DurationText.SetBounds(354, 143, 49, 17);
  DurationText.AutoSize(False);
  DurationText.Text('00:00');
  DurationText.FontSetting('Consolas', 9, CMuted);
  DurationText.TextSetting(False, txTrailing, txCenter);

  CreateRoundedPanel(ProgressBarTrack, 136, 165, 272, 4, CProgressBack, CProgressBack, 2);
  ProgressBarFill.FCreate(FormLayer.Handle);
  ProgressBarFill.SetBounds(136, 165, 0, 4);
  ProgressBarFill.FillColor(CAccent);
  ProgressBarFill.StrokeColor(CAccent);
  ProgressBarFill.StrokeSetting(0, scRound, sdSolid, sjMiter);
  ProgressBarFill.CornerStyle(2, 2, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  // File / folder controls: custom cards with glyphs instead of standard buttons.
  CreateRoundedPanel(OpenFileCard, 20, 202, 194, 40, CPanelLight, CBorder, 8);
  CreateRoundedPanel(OpenFolderCard, 226, 202, 194, 40, CPanelLight, CBorder, 8);

  OpenFileIcon.FCreate(FormLayer.Handle);
  OpenFileIcon.SetBounds(31, 208, 28, 27);
  OpenFileIcon.AutoSize(False);
  OpenFileIcon.Text(#$E8E5);
  OpenFileIcon.FontSetting('Segoe MDL2 Assets', 17, CAccent);
  OpenFileIcon.TextSetting(False, txCenter, txCenter);
  OpenFileIcon.HitTest(True);
  OpenFileIcon.OnClick(@CommonOnClick);

  OpenFileText.FCreate(FormLayer.Handle);
  OpenFileText.SetBounds(63, 208, 138, 27);
  OpenFileText.AutoSize(False);
  OpenFileText.Text('OPEN AUDIO FILE');
  OpenFileText.FontSetting('Segoe UI', 9, CText);
  OpenFileText.TextSetting(False, txLeading, txCenter);
  OpenFileText.HitTest(True);
  OpenFileText.OnClick(@CommonOnClick);

  OpenFolderIcon.FCreate(FormLayer.Handle);
  OpenFolderIcon.SetBounds(237, 208, 28, 27);
  OpenFolderIcon.AutoSize(False);
  OpenFolderIcon.Text(#$E8B7);
  OpenFolderIcon.FontSetting('Segoe MDL2 Assets', 17, CAccent);
  OpenFolderIcon.TextSetting(False, txCenter, txCenter);
  OpenFolderIcon.HitTest(True);
  OpenFolderIcon.OnClick(@CommonOnClick);

  OpenFolderText.FCreate(FormLayer.Handle);
  OpenFolderText.SetBounds(269, 208, 138, 27);
  OpenFolderText.AutoSize(False);
  OpenFolderText.Text('OPEN MUSIC FOLDER');
  OpenFolderText.FontSetting('Segoe UI', 9, CText);
  OpenFolderText.TextSetting(False, txLeading, txCenter);
  OpenFolderText.HitTest(True);
  OpenFolderText.OnClick(@CommonOnClick);

  // Transport: Media Player Fluent Icons for prev/play/next, MDL2 for stop.
  CreateRoundedPanel(PreviousPlate, 123, 255, 42, 42, CPanelLight, CBorder, 21);
  CreateRoundedPanel(PlayPlate, 177, 250, 52, 52, CAccent, CAccent, 26);
  CreateRoundedPanel(StopPlate, 241, 255, 42, 42, CPanelLight, CBorder, 21);
  CreateRoundedPanel(NextPlate, 295, 255, 42, 42, CPanelLight, CBorder, 21);

  PreviousIcon.FCreate(FormLayer.Handle);
  PreviousIcon.SetBounds(123, 255, 42, 42);
  PreviousIcon.AutoSize(False);
  PreviousIcon.Text(#$E622);
  PreviousIcon.FontSetting('Media Player Fluent Icons', 17, CText);
  PreviousIcon.TextSetting(False, txCenter, txCenter);
  PreviousIcon.HitTest(True);
  PreviousIcon.OnClick(@CommonOnClick);

  PlayIcon.FCreate(FormLayer.Handle);
  PlayIcon.SetBounds(177, 250, 52, 52);
  PlayIcon.AutoSize(False);
  PlayIcon.Text(#$E62E);
  PlayIcon.FontSetting('Media Player Fluent Icons', 22, $FF111925);
  PlayIcon.TextSetting(False, txCenter, txCenter);
  PlayIcon.HitTest(True);
  PlayIcon.OnClick(@CommonOnClick);

  StopIcon.FCreate(FormLayer.Handle);
  StopIcon.SetBounds(241, 255, 42, 42);
  StopIcon.AutoSize(False);
  StopIcon.Text(#$E71A);
  StopIcon.FontSetting('Segoe MDL2 Assets', 15, CText);
  StopIcon.TextSetting(False, txCenter, txCenter);
  StopIcon.HitTest(True);
  StopIcon.OnClick(@CommonOnClick);

  NextIcon.FCreate(FormLayer.Handle);
  NextIcon.SetBounds(295, 255, 42, 42);
  NextIcon.AutoSize(False);
  NextIcon.Text(#$E623);
  NextIcon.FontSetting('Media Player Fluent Icons', 17, CText);
  NextIcon.TextSetting(False, txCenter, txCenter);
  NextIcon.HitTest(True);
  NextIcon.OnClick(@CommonOnClick);

  // Volume stays adjustable; playback position is display-only.
  VolumeDivider.FCreate(FormLayer.Handle);
  VolumeDivider.SetBounds(22, 313, 396, 1);
  VolumeDivider.FillColor(CBorder);
  VolumeDivider.StrokeColor(CBorder);
  VolumeDivider.StrokeSetting(0, scRound, sdSolid, sjMiter);

  VolumeIcon.FCreate(FormLayer.Handle);
  VolumeIcon.SetBounds(24, 323, 25, 24);
  VolumeIcon.AutoSize(False);
  VolumeIcon.Text(#$E994);
  VolumeIcon.FontSetting('Segoe MDL2 Assets', 17, CMuted);
  VolumeIcon.TextSetting(False, txCenter, txCenter);
  VolumeIcon.HitTest(False);

  VolumeTrack.FCreate(FormLayer.Handle);
  VolumeTrack.SetBounds(57, 321, 276, 26);
  VolumeTrack.Min(0);
  VolumeTrack.Max(1);
  VolumeTrack.Value(0.72);
  VolumeTrack.Frequency(0.01);
  VolumeTrack.OnChange(@VolumeChange);

  VolumeText.FCreate(FormLayer.Handle);
  VolumeText.SetBounds(351, 323, 65, 24);
  VolumeText.AutoSize(False);
  VolumeText.Text('72%');
  VolumeText.FontSetting('Consolas', 10, CText);
  VolumeText.TextSetting(False, txTrailing, txCenter);

  // Small footer makes it clear that playback progress is display-only.
  FooterLabel.FCreate(FormLayer.Handle);
  FooterLabel.SetBounds(22, 355, 396, 17);
  FooterLabel.AutoSize(False);
  FooterLabel.Text('LOCAL AUDIO  /  READ-ONLY PLAYBACK PROGRESS');
  FooterLabel.FontSetting('Consolas', 8, CMuted);
  FooterLabel.TextSetting(False, txCenter, txCenter);
  FooterLabel.HitTest(False);

  AudioPlayer.Volume(0.72);
  SetVolumeIcon(0.72);

  PlayerTimer.FCreate(FormLayer.Handle);
  PlayerTimer.Interval(250);
  PlayerTimer.OnTimer(@UpdatePlayerUI);
  PlayerTimer.Enabled(True);

  UpdatePlayerUI(nil);
end;

procedure FMXDesigning;
begin
  // Keep the requested Acrylic backdrop. Performance work belongs in the
  // spectrum/audio update path, not in changing the window's visual material.
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btAcrylic, True, True);
  FMXForm.Caption('FMXBridge Audio Deck');

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor(CBackground);
  TitleBar.CloseBtnOnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(440, 382);
  FMXDesigning;
  CreatePlayerControls;
  FMXForm.Show;
end;
