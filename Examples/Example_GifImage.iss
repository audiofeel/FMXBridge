[Setup]
AppName=FMXBridge_GifImage
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

Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy
Source: "Files\GIF\1.gif"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  GifImageAnim     : FGifImage;
  ButtonPlay       : FButton;
  ButtonPause      : FButton;
  ButtonStop       : FButton;

  ExitForm         : FMsgForm;
  ExitFormLayer    : FLayout;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  GifImageAnim     := InitGifImageHandle;
  ButtonPlay       := InitButtonHandle;
  ButtonPause      := InitButtonHandle;
  ButtonStop       := InitButtonHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormLayer    := InitLayoutHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitButtonHandle;
  ExitFormNoBtn    := InitButtonHandle;
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

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectMinBtn):
      FMXForm.Minimize;

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.Close;

    TObject(ButtonPlay.GetObject):
      GifImageAnim.Play;

    TObject(ButtonPause.GetObject):
      GifImageAnim.Pause;

    TObject(ButtonStop.GetObject):
      GifImageAnim.Stop;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btAcrylic, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($1A000000);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  { Gif Image Anim }
  GifImageAnim.FCreate(FormLayer.Handle);
  GifImageAnim.SetBounds(0, 30, 636, 400);
  GifImageAnim.LoadFromFile(ExtractAndLoad('1.gif'));

  { ButtonPlay }
  ButtonPlay.FCreate(FormLayer.Handle);
  ButtonPlay.SetBounds(60, 445, 160, 32);
  ButtonPlay.Text('Start GifAnim');
  ButtonPlay.FontSetting('Bahnschrift', 15, $FFF5F5F5);
  ButtonPlay.OnClick(@CommonOnClick);

  { ButtonPause }
  ButtonPause.FCreate(FormLayer.Handle);
  ButtonPause.SetBounds(250, 445, 160, 32);
  ButtonPause.Text('Pause GifAnim');
  ButtonPause.FontSetting('Bahnschrift', 15, $FFF5F5F5);
  ButtonPause.OnClick(@CommonOnClick);

  { ButtonStop }
  ButtonStop.FCreate(FormLayer.Handle);
  ButtonStop.SetBounds(440, 445, 160, 32);
  ButtonStop.Text('Stop GifAnim');
  ButtonStop.FontSetting('Bahnschrift', 15, $FFF5F5F5)
  ButtonStop.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(636, 495);
  FMXDesigning;
  FMXForm.Show;
end;
