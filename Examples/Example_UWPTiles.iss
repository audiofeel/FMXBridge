[Setup]
AppId=FMXBridge_UWPTiles
AppName=FMXBridge_UWPTiles
AppVersion=1.0
CreateAppDir=no
AppCopyright=audiofeel
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
Source: "Files\UWP\*"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm           : FForm;
  FormLayer         : FLayout;
  TitleBar          : FWinTitleBar;

  UWPTiles          : FUWPTiles;
  Tile              : array [1..9] of NativeInt;

  ExitForm          : FMsgForm;
  ExitFormLbl1      : FLabel;
  ExitFormLbl1Shadow: FShadowEffect;
  ExitFormLbl2      : FLabel;
  ExitFormLbl2Shadow: FShadowEffect;
  ExitFormYesBtn    : FButton;
  ExitFormNoBtn     : FButton;

procedure FMXInit;
begin
  FMXForm           := InitFormHandle;
  FormLayer         := InitLayoutHandle;
  TitleBar          := InitWinTitleBarHandle;

  UWPTiles          := InitUWPTilesHandle;

  ExitForm          := InitMsgFormHandle;
  ExitFormLbl1      := InitLabelHandle;
  ExitFormLbl1Shadow:= InitShadowEffect;
  ExitFormLbl2      := InitLabelHandle;
  ExitFormLbl2Shadow:= InitShadowEffect;
  ExitFormYesBtn    := InitButtonHandle;
  ExitFormNoBtn     := InitButtonHandle;
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

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectCloseBtn),
    TObject(UWPTiles.TileGetObject(Tile[7])):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlurForm(WizardForm.Handle, ColorSetOpacity($FF000000, 0.56), True);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  UWPTiles.FCreate(FormLayer.Handle);
  UWPTiles.SetBounds(76, 78, 700, 370);
  UWPTiles.Offset(3, 3);

  Tile[1]:= UWPTiles.AddTile(ExtractAndLoad('cpp.png'), 'Install Tile', 'When you ready, click install to continue the installation.', 197, 107, True);
  Tile[2]:= UWPTiles.AddTile('', '', '', 197, 107, True);
  Tile[3]:= UWPTiles.AddTile(ExtractAndLoad('Exit.png'), 'UWP Title 3', 'BorderColor', 197, 107, True);
  Tile[4]:= UWPTiles.AddTile(ExtractAndLoad('Install.png'), 'UWP Title 4', 'BorderThickness', 197, 107, True);
  Tile[5]:= UWPTiles.AddTile(ExtractAndLoad('Uninstall.png'), 'UWP Title 5', 'CornerStyle', 197, 107, True);
  Tile[6]:= UWPTiles.AddTile(ExtractAndLoad('cpp.png'), 'UWP Title 6', 'FontSetting', 197, 107, True);
  Tile[7]:= UWPTiles.AddTile(ExtractAndLoad('delphi.png'), 'UWP Title 7', 'OnClick', 197, 107, True);
  Tile[8]:= UWPTiles.AddTile(ExtractAndLoad('Exit.png'), 'UWP Title 8', 'FillColor', 197, 107, True);
  Tile[9]:= UWPTiles.AddTile(ExtractAndLoad('Install.png'), 'UWP Title 9', 'UWP Sub-Title 9', 197, 107, True);

  UWPTiles.TileFillPicture(Tile[2], ExtractAndLoad('tile.png'), wmTileStretch);
  UWPTiles.TileBorderColor(Tile[3], $FF3DFA85);
  UWPTiles.TileBorderThickness(Tile[4], 3);
  UWPTiles.TileCornerStyle(Tile[5], 0, 0, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  UWPTiles.TileTitleFontSetting(Tile[6], 'Segoe UI Bold', 16, $FFADFF2F);
  UWPTiles.TileTextFontSetting(Tile[6], 'Segoe UI', 14, $FFFF69B4);
  UWPTiles.TileOnClick(Tile[7], @CommonOnClick);
  UWPTiles.TileFillColor(Tile[8], $80000000);

  ExitForm.FCreateBlurForm(FMXForm.HandleHWND, ColorSetOpacity($FF000000, 0.56), True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(210);
  ExitForm.Width(500);

  ExitFormLbl1.FCreate(ExitForm.Handle);
  ExitFormLbl1.SetBounds(20, 20, 370, 28);
  ExitFormLbl1.FontSetting('Segoe UI', 20, $FFFF0000);
  ExitFormLbl1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLbl1.TextSetting(False, txLeading, txLeading);

  ExitFormLbl1Shadow.FCreate(ExitFormLbl1.Handle);
  ExitFormLbl1Shadow.ShadowColor($FFFFFFFF);

  ExitFormLbl2.FCreate(ExitForm.Handle);
  ExitFormLbl2.SetBounds(30, 68, 370, 45);
  ExitFormLbl2.FontSetting('Segoe UI', 16, $FFFFFFFF);
  ExitFormLbl2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLbl2.TextSetting(False, txLeading, txCenter);

  ExitFormLbl2Shadow.FCreate(ExitFormLbl2.Handle);
  ExitFormLbl2Shadow.ShadowColor($FFFF0000);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(254, 164, 100, 25);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(366, 164, 100, 25);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(760, 480);
  FMXDesigning;
  FMXForm.Show;
end;
