
[Setup]
AppName=FMXBridge_Draw_SimpleShapes
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

  SkPaint1          : FSkPaint;
  SkPaint2          : FSkPaint;
  SkPaint3          : FSkPaint;
  SkPaint4          : FSkPaint;
  SkPaintBox        : FSkPaintBox;
  SkOval            : FSkRoundRect;

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

procedure SkDrawSimpleShapes;
begin
  SkPaint1 := InitSkPaint;
  SkPaint1.FCreate;
  SkPaint1.AntiAlias(True);
  SkPaint1.Color($FF4285F4);

  SkPaint2 := InitSkPaint;
  SkPaint2.FCreate;
  SkPaint2.AntiAlias(True);
  SkPaint2.Color($FFDB4437);

  SkPaint3 := InitSkPaint;
  SkPaint3.FCreate2(skpsStroke);
  SkPaint3.AntiAlias(True);
  SkPaint3.StrokeWidth(4);
  SkPaint3.Color($FFF4B400);

  SkPaint4 := InitSkPaint;
  SkPaint4.FCreate;
  SkPaint4.AntiAlias(True);
  SkPaint4.Color($FF0F9D58);

  SkOval := InitSkRoundRect;
  SkOval.FCreate;
  SkOval.SetOval(156, 150, 100, 160);

  SkPaintBox := InitSkPaintBox;
  SkPaintBox.FCreate(FormLayer.Handle);
  SkPaintBox.SetBounds(10, 40, 256, 256);
  SkPaintBox.AddDrawRect(116, 70, 100, 160, SkPaint1.Handle);
  SkPaintBox.AddDrawRoundRect2(SkOval.Handle, SkPaint2.Handle);
  SkPaintBox.AddDrawRoundRect(260, 120, 100, 160, 10, 10, SkPaint3.Handle);
  SkPaintBox.AddDrawCircle(260, 80, 25, SkPaint4.Handle);
  SkPaintBox.AddDrawArc(370, 55, 100, 100, -90, 265, True, SkPaint4.Handle);

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

  SkDrawSimpleShapes;

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
