[Setup]
AppName=FMXBridge_ExtractIconFromResource
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
Source: "Files\Styles\LightStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  Image            : array [1..6] of FImage;
  ImageIdx         : array [1..6] of Integer;
  ImageFile        : array [1..6] of WideString;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  for i:= 1 to 6 do Image[i]:= InitImageHandle;

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
var
  p, q, i: Integer;
  Module: WideString;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, False, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('LightStyle.fsf'), 0)

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  Module := 'C:\Windows\SystemResources\imageres.dll.mun';

  ImageIdx[1]:= 31;
  ImageIdx[2]:= 27;
  ImageIdx[3]:= 103;
  ImageIdx[4]:= 105;
  ImageIdx[5]:= 175;
  ImageIdx[6]:= 107;

  for i:= 1 to 6 do
  begin
    if i = (6 div 2) + 1 then
    begin
      p:= 0;
      q:= 160;
    end;

    Image[i].FCreate(FormLayer.Handle);
    Image[i].SetBounds(p + 140, q + 130, 256, 256);

    ImageFile[i]:= ExpandConstant('{tmp}\') + IntToStr(i) + '.png';

    if ExtractIconFromResource(Module, ImageFile[i], ImageIdx[i], 64) then  //16 32 48 64 128 256
      Image[i].LoadPicture(ImageFile[i], iwOriginal);

    p:= p + 150;
  end;

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btTabbed, False, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(200);
  ExitForm.Width(400);

  ExitFormTitleBar.FCreate(ExitForm.Handle, False);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 54, 370, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 88, 370, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Height(54);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(250, 164, 46, 22);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(312, 164, 72, 22);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(640, 480);
  FMXDesigning;
  FMXForm.Show;
end;
