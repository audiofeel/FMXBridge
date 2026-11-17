
[Setup]
AppName=FMXBridge_VideoBackground
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

var
  FMXForm           : FForm;
  FormLayer         : FLayout;
  TitleBar          : FWinTitleBar;

  VideoBackground   : FVideoBackground;

  // Нижняя панель
  ControlPanel      : FRectangle;
  HeaderLabel       : FLabel;
  StatusLabel       : FLabel;

  // Управление воспроизведением
  BtnPlay           : FButton;
  BtnPause          : FButton;
  BtnStop           : FButton;

  // Громкость
  VolumeLabel       : FLabel;
  VolumeValueLabel  : FLabel;
  VolumeTrackbar    : FTrackBar;

  // Повтор
  LoopCheckBox      : FCheckBox;

// Initialization
procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  VideoBackground  := InitVideoBackground;

  ControlPanel     := InitRectangleHandle;
  HeaderLabel      := InitLabelHandle;
  StatusLabel      := InitLabelHandle;

  BtnPlay          := InitButtonHandle;
  BtnPause         := InitButtonHandle;
  BtnStop          := InitButtonHandle;

  VolumeLabel      := InitLabelHandle;
  VolumeValueLabel := InitLabelHandle;
  VolumeTrackbar   := InitTrackBarHandle;

  LoopCheckBox     := InitCheckboxHandle;
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

// Window
procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectMinBtn):
      FMXForm.Minimize;

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.Close;

  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;

// Playback buttons
procedure PlayOnClick(Sender: TObject);
begin
  VideoBackground.Play;
  StatusLabel.Text('PLAY REQUESTED');
end;

procedure PauseOnClick(Sender: TObject);
begin
  VideoBackground.Pause;
  StatusLabel.Text('PAUSED');
end;

procedure StopOnClick(Sender: TObject);
begin
  VideoBackground.Stop;
  StatusLabel.Text('STOPPED');
end;

// Volume
procedure VolumeOnChange(Sender: TObject);
var
  V: Single;
begin
  V:= VolumeTrackbar.GetValue;

  VideoBackground.Volume(V / 100);

  VolumeValueLabel.Text(Format('%.0f%%', [V]));
end;

// Loop
procedure LoopOnChange(Sender: TObject);
begin
  VideoBackground.Loop(LoopCheckBox.IsChecked);
end;

// FMX Helpers
procedure SetupLabel(L: FLabel; const Caption: String; X, Y, W, H: Single; FontSize: Single; FontColor: TAlphaColor; HorzAlign: TTextAlign);
begin
  L.FCreate(ControlPanel.Handle);

  L.SetBounds(X, Y, W, H);
  L.AutoSize(False);
  L.StyledSettings([]);
  L.FontSetting('Segoe UI SemiBold', FontSize, FontColor);
  L.TextSetting(False, HorzAlign, txCenter);
  L.Text(Caption);
  L.HitTest(False);
end;

procedure SetupButton(B: FButton; const Caption: String; X, Y, W, H: Single; Callback: TNotifyEvent);
begin
  B.FCreate(ControlPanel.Handle);

  B.SetBounds(X, Y, W, H);
  B.Text(Caption);
  B.StyledSettings([]);
  B.FontSetting('Segoe UI SemiBold', 9, $FFF0F4F8);
  B.TextSetting(False, txCenter, txCenter);
  B.OnClick(Callback);
end;

// Design
procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FF1A2430, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  // Main FMX layer
  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  // Video background
  VideoBackground.FCreate(FormLayer.Handle, ExpandConstant('{src}\' + 'background.mp4'), True);
  VideoBackground.Align(Contents);
  // Limit CPU readback size while preserving image quality.
  VideoBackground.MaxOutputSize(960, 540);
  VideoBackground.Volume(0.7);
  VideoBackground.SendToBack;

  // Bottom floating control panel
  ControlPanel.FCreate(FormLayer.Handle);
  ControlPanel.Align(Bottom);
  ControlPanel.Height(104);
  ControlPanel.Margins(16, 0, 16, 14);
  ControlPanel.FillColor($801A2430);
  ControlPanel.StrokeColor($50FFFFFF);
  ControlPanel.StrokeSetting(1, scFlat, sdSolid, sjRound);
  ControlPanel.CornerStyle(13, 13, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  // Header
  SetupLabel(HeaderLabel, 'VIDEO BACKGROUND :', 18, 10, 250, 22, 10, $FFEAF1F8, txLeading);
  SetupLabel(StatusLabel, 'STARTING', 142, 10, 120, 22, 9, $FF79C8F2, txLeading);

  // Playback buttons
  SetupButton(BtnPlay, 'PLAY', 18, 46, 92, 36, @PlayOnClick);
  SetupButton(BtnPause, 'PAUSE', 118, 46, 92, 36, @PauseOnClick);
  SetupButton(BtnStop, 'STOP', 218, 46, 92, 36, @StopOnClick);

  // Volume
  SetupLabel(VolumeLabel, 'VOLUME', 308, 49, 65, 30, 9, $FFC2CDD8, txCenter);

  VolumeTrackbar.FCreate(ControlPanel.Handle);
  VolumeTrackbar.SetBounds(370, 52, 176, 34);
  VolumeTrackbar.Min(0);
  VolumeTrackbar.Max(100);
  VolumeTrackbar.Frequency(1);
  VolumeTrackbar.Value(70);
  VolumeTrackbar.OnChange(@VolumeOnChange);

  SetupLabel(VolumeValueLabel, '70%', 535, 49, 55, 30, 9, $FFEAF1F8, txCenter);

  // Loop
  LoopCheckBox.FCreate(ControlPanel.Handle);
  LoopCheckBox.SetBounds(592, 52, 74, 24);
  LoopCheckBox.Text('LOOP');
  LoopCheckBox.StyledSettings([]);
  LoopCheckBox.FontSetting('Segoe UI SemiBold', 9, $FFD6E0EA);
  LoopCheckBox.SetChecked(True);
  LoopCheckBox.OnChange(@LoopOnChange);

  // Title bar
  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($801A2430);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);
end;

// Wizard
procedure InitializeWizard();
begin
  EmptyWizardForm(960, 540);

  FMXDesigning;
  FMXForm.Show;

  VideoBackground.Play;
end;
