
//#define PlayList

[Setup]
AppName=FMXBridge_BASSPlayer
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

Source: "Files\Music\*"; Flags: dontcopy nocompression
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"
var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  Noise            : FImage;
  TitleBar         : FWinTitleBar;
  Line             : FLine;

  BASSPlayer       : FBASSPlayer;

  Title            : FLabel;

  Picture          : FRectangle;
  Artist           : FLabel;
  Folder           : FButton;

  PositionChanging : Boolean;
  PositionTrack    : FTrackbar;
  PositionText     : FLabel;
  DurationText     : FLabel;

  PlayBtn          : FLabel;
  PlayBtnEffect    : FFillRGBEffect;
  NextBtn          : FLabel;
  NextBtnEffect    : FFillRGBEffect;
  PrevBtn          : FLabel;
  PrevBtnEffect    : FFillRGBEffect;

  VolumeTrack      : FTrackbar;
  VolumeText       : FLabel;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  Noise            := InitImageHandle;
  TitleBar         := InitWinTitleBarHandle;
  Line             := InitLineHandle;

  BASSPlayer       := InitBASSPlayer;

  Title            := InitLabelHandle;

  Picture          := InitRectangleHandle;
  Artist           := InitLabelHandle;
  Folder           := InitButtonHandle;

  PositionChanging := False;
  PositionTrack    := InitTrackbarHandle;
  PositionText     := InitLabelHandle;
  DurationText     := InitLabelHandle;

  PlayBtn          := InitLabelHandle;
  PlayBtnEffect    := InitFillRGBEffect;
  NextBtn          := InitLabelHandle;
  NextBtnEffect    := InitFillRGBEffect;
  PrevBtn          := InitLabelHandle;
  PrevBtnEffect    := InitFillRGBEffect;

  VolumeTrack      := InitTrackbarHandle;
  VolumeText       := InitLabelHandle;
end;

function InitializeSetup(): Boolean;
begin
  AddFontResource(ExtractAndLoad('MediaPlayerIcons.ttf'));

  FMXInit;
  Result := True;
end;

procedure DeinitializeSetup();
begin
  RemoveFontResource(ExpandConstant('{tmp}\MediaPlayerIcons.ttf'));

  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm:= False;
end;

procedure CommonOnClick(Sender: TObject);
var
  NewDir: WideString;
begin
  case Sender of

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(PlayBtn.GetObject):
    begin
      if BASSPlayer.IsPlaying then
      begin
        BASSPlayer.Pause;
        PlayBtn.Text(#$F5B0);
      end
      else if BASSPlayer.IsPaused then
      begin
        BASSPlayer.Resume;
        PlayBtn.Text(#$E62E);
      end
      else
      begin
        BASSPlayer.Play;
        PlayBtn.Text(#$E62E);
      end;
    end;

    TObject(NextBtn.GetObject):
      BASSPlayer.Next;

    TObject(PrevBtn.GetObject):
      BASSPlayer.Previous;

    TObject(Folder.GetObject):
    begin
      if BrowseDialog('Browse For Folder Music', NewDir) then
        BASSPlayer.SetFolder(AddBackslash(NewDir));
     end;

  end;
end;

procedure PositionTracking(Sender: TObject);
begin
  if PositionChanging then
    Exit;

  BASSPlayer.SetPosition(Round(PositionTrack.GetValue));
end;

procedure PositionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  P: Double;
  Value: Integer;
begin
  if Button <> mbLeft then
    Exit;

  P:= X / PositionTrack.GetWidth;

  if P < 0 then
    P:= 0;

  if P > 1 then
    P:= 1;

  Value:= Round(P * 100);

  PositionTrack.Value(PositionTrack.GetValue);

  BASSPlayer.SetPosition(Value);
end;

procedure VolumeChange(Sender: TObject);
var
  Vol: Integer;
begin
  Vol:= Round(VolumeTrack.GetValue);

  BASSPlayer.Volume(Vol);

  case Vol of
    0:
      VolumeText.Text(#$E74F);

    1..20:
      VolumeText.Text(#$E992);

    21..45:
      VolumeText.Text(#$E993);

    46..75:
      VolumeText.Text(#$E994);

    76..100:
      VolumeText.Text(#$E767);
  end;
end;

procedure BASSProgress(const Percent: Single; const Duration, Position, CurrentFile: WideString);
begin
  PositionChanging:= True;

  try
    PositionTrack.Value(Percent);
  finally
    PositionChanging:= False;
  end;

  PositionText.Text(Position);
  DurationText.Text(Duration);
  Artist.Text(ChangeFileExt(ExtractFileName(CurrentFile), ''));
end;

procedure CreateBASSPlayer;
begin
#ifdef PlayList
  if BASSPlayer.FCreateList(FMXForm.HandleHWND, ExpandConstant('C:\Users\{username}\Music'), True) then
#else
  if BASSPlayer.FCreate(FMXForm.HandleHWND, ExtractAndLoad('music1.ogg'), True) then
#endif
  begin
    BASSPlayer.Volume(50);
    BASSPlayer.OnProgress(@BASSProgress);

    Title.FCreate(FormLayer.Handle);
    Title.SetBounds(20, 70, 254, 20);
    Title.Text('Now playing');
    Title.FontSetting('Consolas', 13, $FFFFFFFF);

    Picture.FCreate(FormLayer.Handle);
    Picture.SetBounds(20, 119, 254, 61);
    Picture.FillColor($19000000);
    Picture.StrokeColor($50FFFFFF);
    Picture.StrokeSetting(1, scRound, sdSolid, sjMiter);
    Picture.CornerStyle(6, 6, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

    Artist.FCreate(Picture.Handle);
    Artist.AutoSize(False);
    Artist.SetBounds(10, 5, 240, 50);
    Artist.Text('');
    Artist.FontSetting('Consolas', 12, $FFFFFFFF);
    Artist.TextSetting(True, txLeading, txCenter);
    Artist.Trimming(txNone);

    Folder.FCreate(FormLayer.Handle);
    Folder.SetBounds(193, 67, 80, 25);
    Folder.Text(CnvtUTF32ToUTF16('U+1F4C1') + ' Folder');
    Folder.OnClick(@CommonOnClick);
  #ifndef PlayList
    Folder.Enabled(False);
  #endif

    PositionText.FCreate(FormLayer.Handle);
    PositionText.AutoSize(True);
    PositionText.Position(20, 210);
    PositionText.Text('00:00');
    PositionText.FontSetting('Consolas', 13, $FFFFFFFF);
    PositionText.TextSetting(False, txLeading, txLeading);

    DurationText.FCreate(FormLayer.Handle);
    DurationText.AutoSize(True);
    DurationText.Position(237, 210);
    DurationText.Text('00:00');
    DurationText.FontSetting('Consolas', 13, $FFFFFFFF);
    DurationText.TextSetting(False, txTrailing, txLeading);

    PositionTrack.FCreate(FormLayer.Handle);
    PositionTrack.SetBounds(16, 243, 262, 16);
    PositionTrack.Value(0);
    PositionTrack.Max(99);
    PositionTrack.Frequency(0.1);
    PositionTrack.OnTracking(@PositionTracking);
    PositionTrack.OnMouseDown(@PositionMouseDown);

    PlayBtn.FCreate(FormLayer.Handle);
    PlayBtn.SetBounds(139, 288, 22, 22);
    PlayBtn.Text(#$F5B0);
    PlayBtn.FontSetting('Media Player Fluent Icons', 16, $FFFFFFFF);
    PlayBtn.HitTest(True);
    PlayBtn.OnClick(@CommonOnClick);
    PlayBtnEffect.FCreate(PlayBtn.Handle);
    PlayBtnEffect.Enabled(False);
    PlayBtnEffect.Color($FFD35222);
    PlayBtnEffect.Trigger('IsMouseOver=true');

    NextBtn.FCreate(FormLayer.Handle);
    NextBtn.SetBounds(PlayBtn.GetLeft + PlayBtn.GetWidth + 40, 288, 22, 22);
    NextBtn.Text(#$E623);
    NextBtn.FontSetting('Media Player Fluent Icons', 16, $FFFFFFFF);
    NextBtn.HitTest(True);
    NextBtn.OnClick(@CommonOnClick);
    NextBtnEffect.FCreate(NextBtn.Handle);
    NextBtnEffect.Enabled(False);
    NextBtnEffect.Color($FFD35222);
    NextBtnEffect.Trigger('IsMouseOver=true');
  #ifndef PlayList
    NextBtn.Enabled(False);
  #endif

    PrevBtn.FCreate(FormLayer.Handle);
    PrevBtn.SetBounds(PlayBtn.GetLeft - PlayBtn.GetWidth - 40, 288, 22, 22);
    PrevBtn.Text(#$E622);
    PrevBtn.FontSetting('Media Player Fluent Icons', 16, $FFFFFFFF);
    PrevBtn.HitTest(True);
    PrevBtn.OnClick(@CommonOnClick);
    PrevBtnEffect.FCreate(PrevBtn.Handle);
    PrevBtnEffect.Enabled(False);
    PrevBtnEffect.Color($FFD35222);
    PrevBtnEffect.Trigger('IsMouseOver=true');
  #ifndef PlayList
    PrevBtn.Enabled(False);
  #endif

    VolumeText.FCreate(FormLayer.Handle);
    VolumeText.SetBounds(20, 328, 23, 23);
    VolumeText.Text(#$E994);
    VolumeText.FontSetting('Media Player Fluent Icons', 16, $FFFFFFFF);

    VolumeTrack.FCreate(FormLayer.Handle);
    VolumeTrack.SetBounds(44, 324, 205, 20);
    VolumeTrack.Value(50);
    VolumeTrack.OnChange(@VolumeChange);

    BASSPlayer.SetSpectrum(FormLayer.Handle, 20, 355, 50);
    BASSPlayer.BarColor($FFD35222);
    BASSPlayer.BarWidth(14);
    BASSPlayer.BarSpacing(2);
    BASSPlayer.BarRadius(1.5);

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btAcrylic, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), $FFD35222);
  FMXForm.Caption('FMXBridge BASSPlayer');

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  Noise.FCreate(FormLayer.Handle);
  Noise.Align(Contents);
  Noise.LoadPicture(ExtractAndLoad('noise.png'), iwTile);
  Noise.Opacity(0.03);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor(0);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Line.FCreate(FormLayer.Handle);
  Line.Align(Top)
  Line.Height(1);
  Line.StrokeColor($50FFFFFF);
  Line.StrokeSetting(1, scRound, sdSolid, sjMiter);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(294, 426);
  FMXDesigning;

  CreateBASSPlayer;

  FMXForm.Show;
end;
