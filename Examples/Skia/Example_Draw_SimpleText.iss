
[Setup]
AppName=FMXBridge_Draw_SimpleText
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

  SkTypeface        : FSkTypeface;
  SkFont1, SkFont2  : FSkFont;
  SkTextBlob1, SkTextBlob2: FSkTextBlob;
  SkPaint1, SkPaint2, SkPaint3: FSkPaint;
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

procedure SkDrawSimpleText;
begin
  SkTypeface := InitSkTypeface;
  SkTypeface.FCreateFromName('Monospace', skfsNormal);

  SkFont1 := InitSkFont;
  SkFont1.FCreate(SkTypeface.Handle, 64);
  SkFont1.Edging(skfeAntiAlias);

  SkFont2 := InitSkFont;
  SkFont2.FCreate(SkTypeface.Handle, 64);
  SkFont2.ScaleX(1.5);
  SkFont2.Edging(skfeAntiAlias);

  SkTextBlob1 := InitSkTextBlob;
  SkTextBlob1.MakeFromText('Skia1', SkFont1.Handle);

  SkTextBlob2 := InitSkTextBlob;
  SkTextBlob2.MakeFromText('Skia3', SkFont2.Handle);

  SkPaint1 := InitSkPaint;
  SkPaint1.FCreate;
  SkPaint1.AntiAlias(True);
  SkPaint1.SetARGB($FF, $42, $85, $F4);

  SkPaint2 := InitSkPaint;
  SkPaint2.FCreate2(skpsStroke);
  SkPaint2.AntiAlias(True);
  SkPaint2.SetARGB($FF, $DB, $44, $37);
  SkPaint2.StrokeWidth(3);

  SkPaint3 := InitSkPaint;
  SkPaint3.FCreate;
  SkPaint3.AntiAlias(True);
  SkPaint3.SetARGB($FF, $0F, $9D, $58);

  SkPaintBox := InitSkPaintBox;
  SkPaintBox.FCreate(FMXForm.Handle);
  SkPaintBox.SetBounds(20, 40, 256, 256);
  SkPaintBox.AddDrawTextBlob(SkTextBlob1.Handle, 200, 84, SkPaint1.Handle);
  SkPaintBox.AddDrawSimpleText('Skia2', 200, 174, SkFont1.Handle, SkPaint2.Handle);
  SkPaintBox.AddDrawTextBlob(SkTextBlob2.Handle, 200, 264, SkPaint3.Handle);

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

  SkDrawSimpleText;

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
