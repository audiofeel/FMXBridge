
[Setup]
AppName=FMXBridge_Draw_MutiStyleParagraph
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

Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"
#include "Modules\FMXSkiaHandle.iss"

var
  FMXForm           : FForm;
  FormLayer         : FLayout;
  WinTB             : FWinTitleBar;

  SkParagraph       : FSkParagraph;
  SkParagraphBuilder: FSkParagraphBuilder;
  SkTextStyle       : FSkTextStyle;
  SkParagraphStyle  : FSkParagraphStyle;
  SkPaintBox        : FSkPaintBox;

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

procedure SkParagraphMultiStyleText;
begin
  SkParagraphStyle := InitSkParagraphStyle;
  SkParagraphStyle.FCreate;
  SkParagraphStyle.Ellipsis('...');
  SkParagraphStyle.MaxLines(3);

  SkTextStyle := InitSkTextStyle;
  SkTextStyle.FCreate;
  SkTextStyle.Color($FF00BFFF);
  SkTextStyle.FontSize(28);
  SkTextStyle.FontStyle(fwLight, skfwNormal, tfsRegular);

  SkParagraphBuilder := InitSkParagraphBuilder;
  SkParagraphBuilder.FCreate(SkParagraphStyle.Handle);
  SkParagraphBuilder.PushStyle(SkTextStyle.Handle);
  SkParagraphBuilder.AddText('English English ' + CnvtUTF32ToUTF16('U+5B57,U+5178,U+20,U+5B57,U+5178') + ' ' + CnvtUTF32ToUTF16('U+1F604,U+1F605,U+1F606,U+1F602'));

  SkTextStyle.Color(AlCrimson);
  SkTextStyle.FontSize(22);
  SkTextStyle.FontStyle(fwLight, skfwNormal, tfsRegular);

  SkParagraphBuilder.PushStyle(SkTextStyle.Handle);
  SkParagraphBuilder.AddText(' ' + CnvtUTF32ToUTF16('U+633,U+644,U+627,U+645,U+20,U+62F,U+646,U+6CC,U+627,U+21'));

  SkTextStyle.Color(AlBlueviolet);
  SkTextStyle.FontSize(30);
  SkTextStyle.FontStyle(fwMedium, skfwNormal, fsItalic);

  SkParagraphBuilder.PushStyle(SkTextStyle.Handle);
  SkParagraphBuilder.AddText(' World domination is such an ugly phrase - I prefer to call it world optimisation.');

  SkParagraph := InitSkParagraph;
  SkParagraph.FCreate(SkParagraphBuilder.Handle);
  SkParagraph.Layout(512);

  SkPaintBox := InitSkPaintBox;
  SkPaintBox.FCreate(FMXForm.Handle);
  SkPaintBox.SetBounds(60, 80, 620, 556);
  SkPaintBox.AddDrawParagraph(SkParagraph.Handle, 0, 0);
  SkPaintBox.DoDrawing;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlurForm(WizardForm.Handle, $8FFFFFFF, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  WinTB.FCreate(FormLayer.Handle, False);
  WinTB.CloseBtnOnClick(@CommonOnClick);

  SkParagraphMultiStyleText;

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
