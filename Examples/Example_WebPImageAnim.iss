[Setup]
AppName=FMXBridge_WebPImageAnim
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

Source: "Files\WebP\*"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  WebPImage        : FWebPImage;
  WebPImageAnim    : FWebPImage;
  Button           : FButton;
  SpeedButton      : FSpeedButton;
  CornerButton     : FCornerButton;
  ImageList        : FImageList;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  WebPImage        := InitWebPImageHandle;
  WebPImageAnim    := InitWebPImageHandle;
  Button           := InitButtonHandle;
  SpeedButton      := InitSpeedButtonHandle;
  CornerButton     := InitCornerButtonHandle;
  ImageList        := InitImageListHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormTitleBar := InitWinTitleBarHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitButtonHandle;
  ExitFormNoBtn    := InitButtonHandle;
  ExitFormBottomBar:= InitStatusBarHandle;
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

    TObject(TitleBar.GetObjectCloseBtn):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

    TObject(Button.GetObject):
      WebPImageAnim.Play;

    TObject(SpeedButton.GetObject):
      WebPImageAnim.Pause;

    TObject(CornerButton.GetObject):
      WebPImageAnim.Stop;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btMain, False, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  { Image List}
  ImageList.FCreate(FormLayer.Handle);
  ImageList.Clear;
  ImageList.AddImage(ExtractAndLoad('button1.webp'));
  ImageList.AddImage(ExtractAndLoad('button2.webp'));
  ImageList.AddImage(ExtractAndLoad('button3.webp'));

  { WebP Image}
  WebPImage.FCreate(FormLayer.Handle);
  WebPImage.SetBounds(30, 40, 600, 422);
  WebPImage.LoadPicture(ExtractAndLoad('prehistoric.webp'), iwStretch);

  { WebP Image Anim }
  WebPImageAnim.FCreate(FormLayer.Handle);
  WebPImageAnim.SetBounds(195, 0, 250, 250);
  WebPImageAnim.LoadPicture(ExtractAndLoad('rocket.webp'), iwOriginal);
  WebPImageAnim.SetAutoPlay(False);
  WebPImageAnim.HitTest(False);

  { Button }
  Button.FCreate(FormLayer.Handle);
  Button.SetBounds(60, 480, 160, 35);
  Button.Text('Start WebPAnim');
  Button.FontSetting('Bahnschrift', 15, $FFF5F5F5);
  Button.OnClick(@CommonOnClick);

  Button.Images(ImageList.Handle);
  Button.ImageIndex(1);

  { Speed Button }
  SpeedButton.FCreate(FormLayer.Handle);
  SpeedButton.SetBounds(250, 480, 160, 35);
  SpeedButton.Text('Pause WebPAnim');
  SpeedButton.FontSetting('Bahnschrift', 15, $FF363636);
  SpeedButton.OnClick(@CommonOnClick);

  SpeedButton.Images(ImageList.Handle);
  SpeedButton.ImageIndex(2);

  { Corner Button }
  CornerButton.FCreate(FormLayer.Handle);
  CornerButton.SetBounds(440, 480, 160, 35);
  CornerButton.CornerStyle(17, 17, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  CornerButton.Text('Stop WebPAnim');
  CornerButton.FontSetting('Bahnschrift', 15, $FFF5F5F5)
  CornerButton.OnClick(@CommonOnClick);

  CornerButton.Images(ImageList.Handle);
  CornerButton.ImageIndex(0);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btTabbed, False, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, False);
  ExitFormTitleBar.CloseBtnEnabled(False);
  ExitForm.AddMouseDownControls(ExitFormTitleBar.Handle);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FFF5F5F5);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FF767676);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Height(54);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(383, 207, 46, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(442, 207, 72, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(660, 530);
  FMXDesigning;
  FMXForm.Show;
end;
