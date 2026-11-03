
[Setup]
AppName=FMXBridge_SkLabel2
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
  Source: "Modules\sk4d_x64.dll";      DestName: "sk4d.dll";      Flags: dontcopy nocompression
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy nocompression
#else
  Source: "Modules\sk4d_x86.dll";      DestName: "sk4d.dll";      Flags: dontcopy nocompression
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy nocompression
#endif

Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"
#include "Modules\FMXSkiaHandle.iss"

var
  FMXForm           : FForm;
  FormLayer         : FLayout;
  WinTB             : FWinTitleBar;

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

procedure Fill_Arr(var Arr: array of string; const Data: array of string);
var
  i: integer;
begin
  SetArrayLength(arr, GetArrayLength(data));
  for i:= 0 to GetArrayLength(data) - 1 do arr[i]:= data[i];
end;

var
  FontWeightName: array of string;

procedure SkLabelFontWeight;
var
  SkLabel1: FSkLabel;
  FontSetting: FSkLabelFontStyle;
  LFontWeight: TFontWeight;
  i: Integer;
begin
  Fill_Arr(FontWeightName, ['Thin', 'UltraLight', 'Light', 'SemiLight', 'Regular', 'Medium', 'Semibold', 'Bold', 'UltraBold', 'Black', 'UltraBlack'])

  FontSetting:= InitSkLabelFontStyle;
  FontSetting.FontSize(26);
  FontSetting.FontColor(AlBlack);

  SkLabel1:= InitSkLabel;
  SkLabel1.FCreate(FormLayer.Handle);
  SkLabel1.Align(Center);

  for i:= 0 to GetArrayLength(FontWeightName) - 1 do
  begin
    LFontWeight:= TFontWeight(Ord(i));
    FontSetting.FontWeight(LFontWeight);

    SkLabel1.Words(FontWeightName[i] +#13#10, FontSetting);
  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlurForm(WizardForm.Handle, $8FFFFFFF, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  WinTB.FCreate(FormLayer.Handle, False);
  WinTB.CloseBtnOnClick(@CommonOnClick);

  SkLabelFontWeight;

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
  EmptyWizardForm(640, 480);
  FMXDesigning;
  FMXForm.Show;
end;
