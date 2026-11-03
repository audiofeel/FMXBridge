
#define ShaderFile    "synthwave.sksl"
#define AnimImageFile "check.json"
//Cyber Fuji 2020
[Setup]
AppName=FMXBridge_AnimatedImage
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
  Source: "Modules\sk4d_x64.dll";      DestName: "sk4d.dll";      Flags: dontcopy
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\sk4d_x86.dll";      DestName: "sk4d.dll";      Flags: dontcopy
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\Shaders\{#ShaderFile}"; Flags: dontcopy
Source: "Files\AnimatedImages\{#AnimImageFile}"; Flags: dontcopy
Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"
#include "Modules\FMXSkiaHandle.iss"

var
  FMXForm           : FForm;
  FormLayer         : FLayout;
  WinTB             : FWinTitleBar;
  Text1, Text2      : FText;

  SkAnimatedPaintBox: FSkAnimatedPaintBox;
  SkAnimatedImage   : FSkAnimatedImage;

  ExitForm          : FMsgForm;
  ExitFormTitleBar  : FWinTitleBar;
  ExitFormLabel1    : FLabel;
  ExitFormLabel2    : FLabel;
  ExitFormYesBtn    : FButton;
  ExitFormNoBtn     : FButton;

procedure FMXInit;
begin
  FMXForm           := InitFormHandle;
  FormLayer         := InitLayoutHandle;
  WinTB             := InitWinTitleBarHandle;
  Text1             := InitTextHandle;
  Text2             := InitTextHandle;

  SkAnimatedPaintBox:= InitSkAnimatedPaintBox;
  SkAnimatedImage   := InitSkAnimatedImage;

  ExitForm          := InitMsgFormHandle;
  ExitFormTitleBar  := InitWinTitleBarHandle;
  ExitFormLabel1    := InitLabelHandle;
  ExitFormLabel2    := InitLabelHandle;
  ExitFormYesBtn    := InitButtonHandle;
  ExitFormNoBtn     := InitButtonHandle;
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

    TObject(WinTB.GetObjectCloseBtn):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FF171D25, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  WinTB.FCreate(FormLayer.Handle, True);
  WinTB.CloseBtnOnClick(@CommonOnClick);

  SkAnimatedPaintBox.FCreate(FormLayer.Handle);
  SkAnimatedPaintBox.Align(Client);
  SkAnimatedPaintBox.LoadShader(ExtractAndLoad('{#ShaderFile}'));
  SkAnimatedPaintBox.InteractWithMouse(True);

  SkAnimatedImage.FCreate(FormLayer.Handle);
  SkAnimatedImage.SetBounds(490, 146, 200, 200);
  SkAnimatedImage.LoadAnimImage(ExtractAndLoad('{#AnimImageFile}'));
  SkAnimatedImage.WrapMode(skiwStretch);
  SkAnimatedImage.LoopAnim(False);
//  SkAnimatedImage.ProgressAnim(0.4);
//  SkAnimatedImage.SpeedAnim(0.5);
//  SkAnimatedImage.StopAnim;

  Text1.FCreate(FormLayer.Handle);
  Text1.SetBounds(200, 200, 502, 50);
  Text1.TextSetting(False, txLeading, txCenter);
  Text1.FontSetting('Segoe UI', 50, ALWhite);
  Text1.Text('Welcome');
  Text1.HitTest(False);

  Text2.FCreate(FormLayer.Handle);
  Text2.SetBounds(Text1.GetLeft + 10, Text1.GetTop + 56, 495, 30);
  Text2.TextSetting(False, txLeading, txCenter);
  Text2.FontSetting('Segoe UI', 16, ALWhite);
  Text2.Text('Welcome to the Skia Test demo.');
  Text2.HitTest(False);

  ExitForm.FCreateBlurForm(FMXForm.HandleHWND, $8FFFFFFF, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, False);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 59, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FF464646);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 103, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FF565656);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(290, 191, 99, 31);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.StyleLookUp('buttonstyle_accent');
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(400, 191, 99, 31);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.StyleLookUp('buttonstyle_accent');
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(900, 550);
  FMXDesigning;
  FMXForm.Show;

  SkAnimatedPaintBox.RunAnim;
  SkAnimatedImage.RunAnim;
end;
