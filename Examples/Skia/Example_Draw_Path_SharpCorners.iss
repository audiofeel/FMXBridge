
[Setup]
AppName=FMXBridge_Draw_Path_SharpCorners
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

const
  VerticesCount = 7;

var
  FMXForm           : FForm;
  FormLayer         : FLayout;
  WinTB             : FWinTitleBar;

  SkPathBuilder     : FSkPathBuilder;
  Polygon           : FPolygon;
  SkPaint           : FSkPaint;
  SkPathEffect      : FSkPathEffect;
  SkPaintBox        : FSkPaintBox;
  LS                : Single;

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

function Min(A, B: Single): Single;
begin
  if A >= B then
    Result := A
  else 
    Result := B;
end;

function HeptagonPath(const FLeft, FRight, FTop, FBottom: Single): NativeInt;
var
  LRadius: Single;
  LVertexAngle: Double;
  I: Integer;
begin
  LRadius := 0.45 * Min(FRight - FLeft, FBottom - FTop);
  LVertexAngle := -0.5 * Pi;

  Polygon := InitPolygon;
  Polygon.SetLen(VerticesCount);

  for I := 0 to VerticesCount - 1 do
  begin
    Polygon.AddValue(I, LRadius * Cos(LVertexAngle), LRadius * Sin(LVertexAngle));
    LVertexAngle := LVertexAngle + (2 * Pi / VerticesCount);
  end;

  SkPathBuilder := InitSkPathBuilder;
  SkPathBuilder.FCreate;
  SkPathBuilder.AddPolygon(Polygon.Handle, True);
  SkPathBuilder.Offset((FLeft + FRight) / 2, (FTop + FBottom) / 2);

  Result := SkPathBuilder.Handle;
end;

procedure SkPathAndEffectsRoundupSharpCorner;
begin
  LS := 0.1;

  SkPathEffect := InitSkPathEffect;
  SkPathEffect.MakeCorner(LS * Min(336, 336) / 4);

  SkPaint := InitSkPaint;
  SkPaint.FCreate2(skpsStroke);
  SkPaint.PathEffect(SkPathEffect.Handle);
  SkPaint.AntiAlias(True);
  SkPaint.StrokeWidth(6);
  SkPaint.Color(AlIndigo);

  SkPaintBox := InitSkPaintBox;
  SkPaintBox.FCreate(FormLayer.Handle);
  SkPaintBox.SetBounds(151, 69, 336, 336);
  SkPaintBox.AddDrawPath(HeptagonPath(0, 336, 0, 336), SkPaint.Handle);

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

  SkPathAndEffectsRoundupSharpCorner;

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
