#define FontFile "Orbitron-Regular.ttf"

[Setup]
AppId=FMXBridge_Skia_CursorTextGlow
AppName=FMXBridge Skia Cursor Text Glow
AppVersion=1.1
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
  FMXForm          : FForm;
  FormLayer        : FLayout;

  SceneCanvas      : FSkPaintBox;
  TitleCanvas      : FSkPaintBox;
  MouseArea        : FText;

  Typeface         : FSkTypeface;
  TitleFont        : FSkFont;
  InfoFont         : FSkFont;

  FramePaint       : FSkPaint;
  InnerFramePaint  : FSkPaint;
  RulePaint        : FSkPaint;
  AccentPaint      : FSkPaint;
  InfoTextPaint    : FSkPaint;

  TitleShadowPaint : FSkPaint;
  TitleGlowPaint   : FSkPaint;
  TitleTextPaint   : FSkPaint;

  CursorShader     : FSkShader;

  CursorX          : Single;
  CursorY          : Single;
  CursorInside     : Boolean;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;

  SceneCanvas      := InitSkPaintBox;
  TitleCanvas      := InitSkPaintBox;
  MouseArea        := InitTextHandle;

  Typeface         := InitSkTypeface;
  TitleFont        := InitSkFont;
  InfoFont         := InitSkFont;

  FramePaint       := InitSkPaint;
  InnerFramePaint  := InitSkPaint;
  RulePaint        := InitSkPaint;
  AccentPaint      := InitSkPaint;
  InfoTextPaint    := InitSkPaint;

  TitleShadowPaint := InitSkPaint;
  TitleGlowPaint   := InitSkPaint;
  TitleTextPaint   := InitSkPaint;

  CursorShader     := InitSkShader;
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

  // One light field in SceneCanvas coordinates. The paint box applies it
  // to the actual geometry of text, lines, paths and custom borders.
  CursorShader.MakeGradientRadial(
    X, Y, 132, $BFFF3158, $00FF3158, sktmClamp);

  SceneCanvas.SetCursorLightShader(CursorShader.Handle);

  // The heading is outside the general scene pass. Only its OUTER blurred
  // silhouette receives the cursor shader; the white glyph face stays clean.
  TitleGlowPaint.Shader(CursorShader.Handle);

  SceneCanvas.DoDrawing;
  TitleCanvas.DoDrawing;
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

  // Main scene: all paint-backed text and geometry are illuminated together.
  SceneCanvas.FCreate(FormLayer.Handle);
  SceneCanvas.Align(Client);
  SceneCanvas.HitTest(False);

  // Separate title layer: fixed shadow + cursor-lit outer glow + white face.
  TitleCanvas.FCreate(FormLayer.Handle);
  TitleCanvas.Align(Client);
  TitleCanvas.HitTest(False);

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
  FramePaint.Color($FF464A52);
  FramePaint.StrokeWidth(1.2);

  InnerFramePaint.FCreate2(skpsStroke);
  InnerFramePaint.AntiAlias(True);
  InnerFramePaint.Color($FF30343B);
  InnerFramePaint.StrokeWidth(1.0);

  RulePaint.FCreate;
  RulePaint.AntiAlias(True);
  RulePaint.Color($FF3B3F47);

  AccentPaint.FCreate2(skpsStroke);
  AccentPaint.AntiAlias(True);
  AccentPaint.Color($FF555B66);
  AccentPaint.StrokeWidth(1.0);

  InfoTextPaint.FCreate;
  InfoTextPaint.AntiAlias(True);
  InfoTextPaint.Color($FF969BA5);

  // A faint static shadow remains around the heading.
  TitleShadowPaint.FCreate;
  TitleShadowPaint.AntiAlias(True);
  TitleShadowPaint.Color($8A000000);
  TitleShadowPaint.MaskFilter(skbsOuter, 8);

  // The moving red light is filtered through the outer glyph blur only.
  TitleGlowPaint.FCreate;
  TitleGlowPaint.AntiAlias(True);
  TitleGlowPaint.Color($FFFFFFFF);
  TitleGlowPaint.MaskFilter(skbsOuter, 15);

  TitleTextPaint.FCreate;
  TitleTextPaint.AntiAlias(True);
  TitleTextPaint.Color($FFF1F2F5);

  // Main and inner custom frame.
  SceneCanvas.AddDrawRoundRect(
    92, 64, 736, 292, 12, 12, FramePaint.Handle);
  SceneCanvas.AddDrawRoundRect(
    101, 73, 718, 274, 8, 8, InnerFramePaint.Handle);

  // Rules and decorative border segments.
  SceneCanvas.AddDrawRect(132, 260, 656, 1, RulePaint.Handle);
  SceneCanvas.AddDrawRect(132, 278, 656, 1, RulePaint.Handle);
  SceneCanvas.AddDrawRect(132, 102, 1, 22, AccentPaint.Handle);
  SceneCanvas.AddDrawRect(787, 102, 1, 22, AccentPaint.Handle);

  SceneCanvas.AddDrawRect(112, 84, 22, 1, AccentPaint.Handle);
  SceneCanvas.AddDrawRect(112, 84, 1, 22, AccentPaint.Handle);
  SceneCanvas.AddDrawRect(786, 84, 22, 1, AccentPaint.Handle);
  SceneCanvas.AddDrawRect(807, 84, 1, 22, AccentPaint.Handle);
  SceneCanvas.AddDrawRect(112, 336, 22, 1, AccentPaint.Handle);
  SceneCanvas.AddDrawRect(112, 315, 1, 22, AccentPaint.Handle);
  SceneCanvas.AddDrawRect(786, 336, 22, 1, AccentPaint.Handle);
  SceneCanvas.AddDrawRect(807, 315, 1, 22, AccentPaint.Handle);

  // Every text item in this scene shares the same cursor light field.
  SceneCanvas.AddDrawSimpleText(
    'INTERFACE LIGHTING TEST',
    266, 300, InfoFont.Handle, InfoTextPaint.Handle);

  SceneCanvas.AddDrawSimpleText(
    'MOVE THE POINTER OVER TEXT, LINES AND THE FRAME',
    266, 324, InfoFont.Handle, InfoTextPaint.Handle);

  SceneCanvas.AddDrawSimpleText(
    'SKIA  /  ONE CURSOR FIELD  /  MULTIPLE DRAW COMMANDS',
    266, 346, InfoFont.Handle, InfoTextPaint.Handle);

  // Main title treatment: only the halo responds to the cursor.
  TitleCanvas.AddDrawSimpleText(
    'Discover', 265, 220, TitleFont.Handle, TitleShadowPaint.Handle);
  TitleCanvas.AddDrawSimpleText(
    'Discover', 265, 220, TitleFont.Handle, TitleGlowPaint.Handle);
  TitleCanvas.AddDrawSimpleText(
    'Discover', 265, 220, TitleFont.Handle, TitleTextPaint.Handle);

  // Transparent FMX control used only as the mouse-event surface.
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
