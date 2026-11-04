#define FontFile "Orbitron-Regular.ttf"

[Setup]
AppId=FMXBridge_Skia_CursorTextGlow
AppName=FMXBridge Skia Cursor Text Glow
AppVersion=1.0
CreateAppDir=no
Uninstallable=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\sk4d_x64.dll";      DestName: "sk4d.dll";      Flags: dontcopy nocompression
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy nocompression
#else
  Source: "Modules\sk4d_x86.dll";      DestName: "sk4d.dll";      Flags: dontcopy nocompression
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy nocompression
#endif

Source: "Files\Fonts\{#FontFile}"; Flags: dontcopy
Source: "Files\Fonts\OFL.txt"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"
#include "Modules\FMXSkiaHandle.iss"

var
  FMXForm        : FForm;
  FormLayer      : FLayout;

  TextCanvas     : FSkPaintBox;
  MouseArea      : FText;

  Typeface       : FSkTypeface;
  TitleFont      : FSkFont;
  InfoFont       : FSkFont;

  FramePaint     : FSkPaint;
  RulePaint      : FSkPaint;
  BaseTextPaint  : FSkPaint;
  InfoTextPaint  : FSkPaint;
  WideGlowPaint  : FSkPaint;
  CoreGlowPaint  : FSkPaint;

  WideGlowShader : FSkShader;
  CoreGlowShader : FSkShader;

  CursorX        : Single;
  CursorY        : Single;
  CursorInside   : Boolean;

procedure FMXInit;
begin
  FMXForm        := InitFormHandle;
  FormLayer      := InitLayoutHandle;

  TextCanvas     := InitSkPaintBox;
  MouseArea      := InitTextHandle;

  Typeface       := InitSkTypeface;
  TitleFont      := InitSkFont;
  InfoFont       := InitSkFont;

  FramePaint     := InitSkPaint;
  RulePaint      := InitSkPaint;
  BaseTextPaint  := InitSkPaint;
  InfoTextPaint  := InitSkPaint;
  WideGlowPaint  := InitSkPaint;
  CoreGlowPaint  := InitSkPaint;

  WideGlowShader := InitSkShader;
  CoreGlowShader := InitSkShader;
end;

function InitializeSetup(): Boolean;
begin
  FMXInit;
  Result := True;
end;

procedure UpdateCursorGlow;
var
  X, Y: Single;
begin
  if CursorInside then
  begin
    X := CursorX;
    Y := CursorY;
  end
  else
  begin
    X := -1000;
    Y := -1000;
  end;

  // Both gradients are painted through the glyph coverage of DrawSimpleText.
  // The wide pass gives a soft red tint; the core pass creates the hot spot.
  WideGlowShader.MakeGradientRadial(
    X, Y, 118, $72FF244C, $00FF244C, sktmClamp);
  CoreGlowShader.MakeGradientRadial(
    X, Y, 48, $D8FF365D, $00FF365D, sktmClamp);

  WideGlowPaint.Shader(WideGlowShader.Handle);
  CoreGlowPaint.Shader(CoreGlowShader.Handle);

  TextCanvas.DoDrawing;
end;

procedure MouseAreaMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  CursorX := X;
  CursorY := Y;
  CursorInside := True;
  UpdateCursorGlow;
end;

procedure MouseAreaLeave(Sender: TObject);
begin
  CursorInside := False;
  UpdateCursorGlow;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FF17191D, '', False);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  // The drawing surface is pure Skia. Text and gradient paints share
  // the same font metrics and baseline.
  TextCanvas.FCreate(FormLayer.Handle);
  TextCanvas.Align(Client);
  TextCanvas.HitTest(False);

  Typeface.FCreateFromFile(ExtractAndLoad('{#FontFile}'), 0);

  TitleFont.FCreate(Typeface.Handle, 72);
  TitleFont.Edging(skfeAntiAlias);
  TitleFont.Hinting(skfhNormal);
  TitleFont.Subpixel(True);

  InfoFont.FCreate(Typeface.Handle, 13);
  InfoFont.Edging(skfeAntiAlias);
  InfoFont.Hinting(skfhNormal);

  FramePaint.FCreate2(skpsStroke);
  FramePaint.AntiAlias(True);
  FramePaint.Color($FF42454D);
  FramePaint.StrokeWidth(1.0);

  RulePaint.FCreate;
  RulePaint.AntiAlias(True);
  RulePaint.Color($FF34373E);

  BaseTextPaint.FCreate;
  BaseTextPaint.AntiAlias(True);
  BaseTextPaint.Color($FFF1F2F5);

  InfoTextPaint.FCreate;
  InfoTextPaint.AntiAlias(True);
  InfoTextPaint.Color($FF858A94);

  WideGlowPaint.FCreate;
  WideGlowPaint.AntiAlias(True);

  CoreGlowPaint.FCreate;
  CoreGlowPaint.AntiAlias(True);

  // Static drawing commands are added once. Mouse movement only replaces
  // the shader on the two existing paints and requests a redraw.
  TextCanvas.AddDrawRect(92, 64, 736, 292, FramePaint.Handle);
  TextCanvas.AddDrawRect(132, 260, 656, 1, RulePaint.Handle);

  TextCanvas.AddDrawSimpleText(
    'Discover', 265, 220, TitleFont.Handle, BaseTextPaint.Handle);
  TextCanvas.AddDrawSimpleText(
    'Discover', 265, 220, TitleFont.Handle, WideGlowPaint.Handle);
  TextCanvas.AddDrawSimpleText(
    'Discover', 265, 220, TitleFont.Handle, CoreGlowPaint.Handle);

  TextCanvas.AddDrawSimpleText(
    'MOVE THE POINTER OVER THE LETTERS',
    268, 300, InfoFont.Handle, InfoTextPaint.Handle);

  TextCanvas.AddDrawSimpleText(
    'SKIA  /  RADIAL SHADER  /  GLYPH-COVERAGE MASK',
    268, 326, InfoFont.Handle, InfoTextPaint.Handle);

  // Transparent FMX text control is used only as a mouse-event surface.
  // Its coordinates match the Skia canvas because both fill the same parent.
  MouseArea.FCreate(FormLayer.Handle);
  MouseArea.SetBounds(0, 0, 920, 420);
  MouseArea.Text(' ');
  MouseArea.FontSetting('Segoe UI', 1, $00000000);
  MouseArea.TextSetting(False, txLeading, txLeading);
  MouseArea.HitTest(True);
  MouseArea.OnMouseMove(@MouseAreaMove);
  MouseArea.OnMouseLeave(@MouseAreaLeave);
  MouseArea.BringToFront;

  CursorX := -1000;
  CursorY := -1000;
  CursorInside := False;
  UpdateCursorGlow;
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(920, 420);
  FMXDesigning;
  FMXForm.Show;
end;

procedure DeinitializeSetup();
begin
  FMXBridgeShutDown;
end;
