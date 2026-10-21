[Setup]
AppName=FMXBridge_Tiles
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

Source: "Files\Cursor\Dark.cur"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\WPI.style"; Flags: dontcopy
Source: "Files\WPI\*"; Flags: dontcopy
Source: "Files\Music\music1.ogg"; Flags: dontcopy nocompression

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm         : FForm;
  MusicPlayer     : FBASSPlayer;
  FormLayer       : FLayout;
  FormShadow      : FImage;

  UserPicture     : FRoundRect;
  UserInfo        : FSystemInfo;
  UserText        : FText;

  GameNameText    : FText;
  TitleText       : FText;

  LangButton      : FText;
  InfoButton      : FText;
  WebButton       : FText;
  MusicButton     : FText;

  LauncherTile    : FTile;
  InstallTile     : FTile;
  UnInstallTile   : FTile;
  ExitTile        : FTile;

  MsgForm         : FMsgForm;
  MsgFormLayer    : FLayout;
  MsgFormTitle    : FText;
  MsgFormCaption  : FText;
  MsgFormBtn      : FButton;

  ExitForm        : FMsgForm;
  ExitFormLayer   : FLayout;
  ExitFormTitle   : FText;
  ExitFormCaption : FText;
  ExitFormYesBtn  : FButton;
  ExitFormNoBtn   : FButton;

procedure FMXInit;
begin
  FMXForm         := InitFormHandle;
  MusicPlayer     := InitBASSPlayer;
  FormLayer       := InitLayoutHandle;
  FormShadow      := InitImageHandle;

  UserPicture     := InitRoundRectHandle;
  UserInfo        := InitSystemInfo;
  UserText        := InitTextHandle;

  GameNameText    := InitTextHandle;
  TitleText       := InitTextHandle;

  LangButton      := InitTextHandle;
  InfoButton      := InitTextHandle;
  WebButton       := InitTextHandle;
  MusicButton     := InitTextHandle;

  LauncherTile    := InitTileHandle;
  InstallTile     := InitTileHandle;
  UnInstallTile   := InitTileHandle;
  ExitTile        := InitTileHandle;

  MsgForm         := InitMsgFormHandle;
  MsgFormLayer    := InitLayoutHandle;
  MsgFormTitle    := InitTextHandle;
  MsgFormCaption  := InitTextHandle;
  MsgFormBtn      := InitButtonHandle;

  ExitForm        := InitMsgFormHandle;
  ExitFormLayer   := InitLayoutHandle;
  ExitFormTitle   := InitTextHandle;
  ExitFormCaption := InitTextHandle;
  ExitFormYesBtn  := InitButtonHandle;
  ExitFormNoBtn   := InitButtonHandle;
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
  Confirm:= False;
end;

procedure ShowMessage(Title, Caption: String);
begin
  MsgFormTitle.Text(Title);
  MsgFormCaption.Text(Caption);
  MsgForm.Show;
end;

procedure CommonOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  case Sender of

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

    TObject(MsgFormBtn.GetObject):
      MsgForm.Close;

    TObject(LangButton.GetObject):
      ShowMessage('Language Setting','Sorry, Language function is not available at this movement !');

    TObject(InfoButton.GetObject):
      ShowMessage('Corepack Installer 7.0','For more Repacks, Visit our official site - www.corepacks.com.');

    TObject(WebButton.GetObject):
      ShellExec('open', 'http://facebook.com/CorePack', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);

    TObject(MusicButton.GetObject):
    begin
      if MusicPlayer.IsPaused then
        MusicPlayer.Resume
      else
        MusicPlayer.Pause;
    end;

    TObject(LauncherTile.GetObject):
      ShowMessage('Something Wrong !','Failed to initiate program, '+ #13 + 'Application executable not found.');

    TObject(InstallTile.GetObject):
      ShowMessage('Stray is not installed !','This Program is currently not installed on your PC.');

    TObject(UnInstallTile.GetObject):
      ShowMessage('Failed to initiate uninstaller.','May be uninstaller exe not found.');

    TObject(ExitTile.GetObject):
      ExitForm.Show;

  end;
end;

procedure CommonOnEnter(Sender: TObject);
begin
  case Sender of

    TObject(LangButton.GetObject):
      LangButton.Color($FFF2680B);

    TObject(InfoButton.GetObject):
      InfoButton.Color($FFF2680B);

    TObject(WebButton.GetObject):
      WebButton.Color($FFF2680B);

    TObject(MusicButton.GetObject):
      MusicButton.Color($FFF2680B);

  end;
end;

procedure CommonOnLeave(Sender: TObject);
begin
  case Sender of

    TObject(LangButton.GetObject):
      LangButton.Color(ALWhite);

    TObject(InfoButton.GetObject):
      InfoButton.Color(ALWhite);

    TObject(WebButton.GetObject):
      WebButton.Color(ALWhite);

    TObject(MusicButton.GetObject):
      MusicButton.Color(ALWhite);

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, ExtractAndLoad('Img1.jpg'), True);
  FMXForm.SetCursor(ExtractAndLoad('Dark.cur'));
  FMXForm.LoadStyleFromFile(ExtractAndLoad('WPI.style'), $FFF2680B);
  FMXForm.CanvasQuality(HighQuality);

  FormShadow.FCreate(FMXForm.Handle);
  FormShadow.Align(Contents);
  FormShadow.LoadPicture(ExtractAndLoad('overlay_dark.png'), iwStretch);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.SetBounds(780, 0, 800, 450);
  FormLayer.HitTest(True);
  FMXForm.AddMouseDownControls(FormLayer.Handle);

  UserPicture.FCreate(FormLayer.Handle);
  UserPicture.SetBounds(15, 20, 64, 64);
  UserPicture.FillPicture(ExtractAndLoad('User.jpg'), wmTileStretch);
  UserPicture.HitTest(False);

  UserText.FCreate(FormLayer.Handle);
  UserText.Position(90, 35);
  UserText.AutoSize(True);
  UserText.FontSetting('Segoe UI Light', 22, ALWhite);
  UserText.TextSetting(False, txLeading, txLeading);
  UserText.Text(UserInfo.UserName);
  UserText.HitTest(False);

  GameNameText.FCreate(FormLayer.Handle);
  GameNameText.SetBounds(400, 17, 382, 50);
  GameNameText.FontSetting('Segoe UI', 24, $FFF2680B);
  GameNameText.TextSetting(False, txTrailing, txLeading);
  GameNameText.Text(AnsiUppercase('Stray'));
  GameNameText.HitTest(False);

  LangButton.FCreate(FormLayer.Handle);
  LangButton.Position(35, 110);
  LangButton.AutoSize(True);
  LangButton.FontSetting('Segoe MDL2 Assets', 19, ALWhite);
  LangButton.Text(#$F2B7);
  LangButton.OnMouseEnter(@CommonOnEnter);
  LangButton.OnMouseLeave(@CommonOnLeave);
  LangButton.OnClick(@CommonOnClick);

  InfoButton.FCreate(FormLayer.Handle);
  InfoButton.Position(35, 170);
  InfoButton.AutoSize(True);
  InfoButton.FontSetting('Segoe MDL2 Assets', 19, ALWhite);
  InfoButton.Text(#$ED1E);
  InfoButton.OnMouseEnter(@CommonOnEnter);
  InfoButton.OnMouseLeave(@CommonOnLeave);
  InfoButton.OnClick(@CommonOnClick);

  WebButton.FCreate(FormLayer.Handle);
  WebButton.Position(35, 220);
  WebButton.AutoSize(True);
  WebButton.FontSetting('Segoe MDL2 Assets', 19, ALWhite);
  WebButton.Text(#$E774);
  WebButton.OnMouseEnter(@CommonOnEnter);
  WebButton.OnMouseLeave(@CommonOnLeave);
  WebButton.OnClick(@CommonOnClick);

  MusicPlayer.FCreate(FMXForm.Handle, ExtractAndLoad('music1.ogg'), True);

  MusicButton.FCreate(FormLayer.Handle);
  MusicButton.Position(35, 270);
  MusicButton.AutoSize(True);
  MusicButton.FontSetting('Segoe MDL2 Assets', 19, ALWhite);
  MusicButton.Text(#$E90B);
  MusicButton.OnMouseEnter(@CommonOnEnter);
  MusicButton.OnMouseLeave(@CommonOnLeave);
  MusicButton.OnClick(@CommonOnClick);

  TitleText.FCreate(FormLayer.Handle);
  TitleText.SetBounds(400, 42, 382, 50);
  TitleText.FontSetting('Segoe UI Light', 25, ALWhite);
  TitleText.TextSetting(False, txTrailing, txLeading);
  TitleText.Text('Autorun');
  TitleText.HitTest(False);

  LauncherTile.FCreate(FormLayer.Handle);
  LauncherTile.SetBounds(480, 80, 192, 108);
  LauncherTile.TilePicture(ExtractAndLoad('Tile1_Icon.png'), wmTileStretch);
  LauncherTile.TileThickness(1);
  LauncherTile.TileCurve(6, 6);
  LauncherTile.TextBackColor($FFF2680B);
  LauncherTile.Text('Play');
  LauncherTile.OnClick(@CommonOnClick);

  InstallTile.FCreate(FormLayer.Handle);
  InstallTile.SetBounds(680, 80, 108, 108);
  InstallTile.TileColor($FFF2680B);
  InstallTile.TilePicture(ExtractAndLoad('Install.png'), wmTileStretch);
  InstallTile.TileCurve(6, 6);
  InstallTile.Text('Install');
  InstallTile.OnClick(@CommonOnClick);

  UnInstallTile.FCreate(FormLayer.Handle);
  UnInstallTile.SetBounds(680, 195, 108, 108);
  UnInstallTile.TileColor($FFF2680B);
  UnInstallTile.TilePicture(ExtractAndLoad('UnInstall.png'), wmTileStretch);
  UnInstallTile.TileCurve(6, 6);
  UnInstallTile.Text('UnInstall');
  UnInstallTile.OnClick(@CommonOnClick);

  ExitTile.FCreate(FormLayer.Handle);
  ExitTile.SetBounds(680, 310, 108, 108);
  ExitTile.TileColor($FFF2680B);
  ExitTile.TilePicture(ExtractAndLoad('Exit.png'), wmTileStretch);
  ExitTile.TileCurve(6, 6);
  ExitTile.Text('Exit');
  ExitTile.OnClick(@CommonOnClick);

  MsgForm.FCreateBlurForm(FMXForm.HandleHWND, ColorSetOpacity($FF000000, 0.56), True);
  MsgForm.Height(185);
  MsgForm.Width(515);

  MsgFormLayer.FCreate(MsgForm.Handle);
  MsgFormLayer.Align(Client);
  MsgFormLayer.HitTest(True);
  MsgForm.AddMouseDownControls(MsgFormLayer.Handle);

  MsgFormTitle.FCreate(MsgFormLayer.Handle);
  MsgFormTitle.SetBounds(15, 20, 485, 34);
  MsgFormTitle.FontSetting('Segoe UI Light', 24, $FFF2680B);
  MsgFormTitle.TextSetting(False, txLeading, txLeading);
  MsgFormTitle.Text('Title');
  MsgFormTitle.HitTest(False);

  MsgFormCaption.FCreate(MsgFormLayer.Handle);
  MsgFormCaption.SetBounds(15, 70, 485, 50);
  MsgFormCaption.FontSetting('Segoe UI Light', 15, ALWhite);
  MsgFormCaption.TextSetting(False, txLeading, txLeading);
  MsgFormCaption.Text('Caption');
  MsgFormCaption.HitTest(False);

  MsgFormBtn.FCreate(MsgFormLayer.Handle);
  MsgFormBtn.SetBounds(300, 130, 180, 30);
  MsgFormBtn.Text('Close');
  MsgFormBtn.OnClick(@CommonOnClick);

  ExitForm.FCreateBlurForm(FMXForm.HandleHWND, ColorSetOpacity($FF000000, 0.56), True);
  ExitForm.Height(185);
  ExitForm.Width(515);

  ExitFormLayer.FCreate(ExitForm.Handle);
  ExitFormLayer.Align(Client);
  ExitFormLayer.HitTest(True);
  ExitForm.AddMouseDownControls(ExitFormLayer.Handle);

  ExitFormTitle.FCreate(ExitFormLayer.Handle);
  ExitFormTitle.SetBounds(15, 20, 485, 34);
  ExitFormTitle.FontSetting('Segoe UI Light', 24, $FFF2680B);
  ExitFormTitle.TextSetting(False, txLeading, txLeading);
  ExitFormTitle.Text('Are you sure to close installer ?');
  ExitFormTitle.HitTest(False);

  ExitFormCaption.FCreate(ExitFormLayer.Handle);
  ExitFormCaption.SetBounds(15, 70, 485, 50);
  ExitFormCaption.FontSetting('Segoe UI Light', 15, ALWhite);
  ExitFormCaption.TextSetting(False, txLeading, txLeading);
  ExitFormCaption.Text('This will closes the installer wizard.' + #13#10 + 'The product you are installing would not be installed.');
  ExitFormCaption.HitTest(False);

  ExitFormYesBtn.FCreate(ExitFormLayer.Handle);
  ExitFormYesBtn.SetBounds(110, 130, 180, 30);
  ExitFormYesBtn.Text('Yes');
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitFormLayer.Handle);
  ExitFormNoBtn.SetBounds(300, 130, 180, 30);
  ExitFormNoBtn.Text('No');
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(800, 450);

  FMXDesigning;
  FMXForm.Show;

  FMXAnimateFloatWait(FormLayer.Handle, 'Position.X', 0, 1.0, atOut, itBack);

  MusicPlayer.Play;
end;
