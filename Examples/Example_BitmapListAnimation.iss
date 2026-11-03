
[Setup]
AppName=FMXBridge_BitmapListAnimation
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

Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy
Source: "Files\Images\wallpapers10.jpg"; Flags: dontcopy
Source: "Files\BitmapListAnimation\*"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm               : FForm;
  FormLayer             : FLayout;
  TitleBar              : FWinTitleBar;

  Image1                : FImage;
  BitmapListAnimation1  : FBitmapListAnimation;
  Image2                : FImage;
  BitmapListAnimation2  : FBitmapListAnimation;

  ExitForm              : FMsgForm;
  ExitFormTitleBar      : FWinTitleBar;
  ExitFormLabel1        : FLabel;
  ExitFormLabel2        : FLabel;
  ExitFormYesBtn        : FButton;
  ExitFormNoBtn         : FButton;
  ExitFormBottomBar     : FStatusBar;

procedure FMXInit;
begin
  FMXForm               := InitFormHandle;
  FormLayer             := InitLayoutHandle;
  TitleBar              := InitWinTitleBarHandle;

  Image1                := InitImageHandle;
  BitmapListAnimation1  := InitBitmapListAnimation;
  Image2                := InitImageHandle;
  BitmapListAnimation2  := InitBitmapListAnimation;

  ExitForm              := InitMsgFormHandle;
  ExitFormTitleBar      := InitWinTitleBarHandle;
  ExitFormLabel1        := InitLabelHandle;
  ExitFormLabel2        := InitLabelHandle;
  ExitFormYesBtn        := InitButtonHandle;
  ExitFormNoBtn         := InitButtonHandle;
  ExitFormBottomBar     := InitStatusBarHandle;
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

    TObject(TitleBar.GetObjectCloseBtn):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, ExtractAndLoad('wallpapers10.jpg'), True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($800E192B);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Image1.FCreate(FormLayer.Handle);
  Image1.LoadPicture(ExtractAndLoad('SplashAnimated.png'), iwStretch);
  Image1.SetBounds(135, 70, 395, 130);

  BitmapListAnimation1.FCreate(Image1.Handle);
  BitmapListAnimation1.AnimationType(atIn, 2.0, 0.0, False, False, True);
  BitmapListAnimation1.PropertyName('Bitmap');
  BitmapListAnimation1.SetImage(ExtractAndLoad('SplashAnimated.png'), 8, 2);
  BitmapListAnimation1.AniFrameRate(6);

  Image2.FCreate(FormLayer.Handle);
  Image2.LoadPicture(ExtractAndLoad('EqualizerLight.png'), iwStretch);
  Image2.SetBounds(295, 340, 112, 42);

  BitmapListAnimation2.FCreate(Image2.Handle);
  BitmapListAnimation2.AnimationType(atInOut, 2.0, 0.0, False, False, True);
  BitmapListAnimation2.PropertyName('Bitmap');
  BitmapListAnimation2.SetImage(ExtractAndLoad('EqualizerLight.png'), 8, 1);
  BitmapListAnimation2.AniFrameRate(6);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, ExtractAndLoad('wallpapers10.jpg'), True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($FF0E192B);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
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
  EmptyWizardForm(700, 466);

  FMXDesigning;
  FMXForm.Show;

  BitmapListAnimation1.Start;
  BitmapListAnimation2.Start;
end;
