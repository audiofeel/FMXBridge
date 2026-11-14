[Setup]
AppName=FMXBridge_SkiaShowcase
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
//SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\sk4d_x64.dll";      DestName: "sk4d.dll";      Flags: dontcopy
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\sk4d_x86.dll";      DestName: "sk4d.dll";      Flags: dontcopy
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"
#include "Modules\FMXSkiaHandle.iss"

var
  FMXForm             : FForm;
  FormLayer           : FLayout;
  WinTB               : FWinTitleBar;

  SkPaintBox          : FSkPaintBox;

  SkBgPaint           : FSkPaint;
  SkCardPaint         : FSkPaint;
  SkCardLinePaint     : FSkPaint;
  SkGlowPaint1        : FSkPaint;
  SkGlowPaint2        : FSkPaint;
  SkGlowPaint3        : FSkPaint;
  SkRingPaint         : FSkPaint;
  SkRibbonPaint1      : FSkPaint;
  SkRibbonPaint2      : FSkPaint;
  SkArcPaint          : FSkPaint;
  SkShapePaint1       : FSkPaint;
  SkShapePaint2       : FSkPaint;
  SkShapePaint3       : FSkPaint;
  SkShapePaint4       : FSkPaint;
  SkEffectPaint1      : FSkPaint;
  SkEffectPaint2      : FSkPaint;
  SkEffectPaint3      : FSkPaint;
  SkEffectPaint4      : FSkPaint;
  SkTextPaintMuted    : FSkPaint;
  SkTextPaintBright   : FSkPaint;
  SkTextPaintMint     : FSkPaint;

  SkBgShader          : FSkShader;
  SkGlowShader1       : FSkShader;
  SkGlowShader2       : FSkShader;
  SkGlowShader3       : FSkShader;
  SkRingShader        : FSkShader;
  SkRibbonShader1     : FSkShader;
  SkRibbonShader2     : FSkShader;
  SkShapeShader1      : FSkShader;
  SkShapeShader2      : FSkShader;
  SkEffectShader      : FSkShader;

  SkPathBuilder       : FSkPathBuilder;
  SkPolygon           : FPolygon;
  SkPathEffect1       : FSkPathEffect;
  SkPathEffect2       : FSkPathEffect;
  SkPathEffect3       : FSkPathEffect;
  SkPathEffect4       : FSkPathEffect;

  SkTypeface          : FSkTypeface;
  SkFontSmall         : FSkFont;
  SkFontMedium        : FSkFont;

  SkParagraphStyle    : FSkParagraphStyle;
  SkTextStyle         : FSkTextStyle;
  SkParagraphBuilder  : FSkParagraphBuilder;
  SkParagraph         : FSkParagraph;

procedure FMXInit;
begin
  FMXForm   := InitFormHandle;
  FormLayer := InitLayoutHandle;
  WinTB     := InitWinTitleBarHandle;
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
    TObject(WinTB.GetObjectMinBtn):
      FMXForm.Minimize;

    TObject(WinTB.GetObjectCloseBtn):
      WizardForm.Close;
  end;
end;

procedure CreateTypography;
begin
  SkTypeface := InitSkTypeface;
  SkTypeface.FCreateDefault;

  SkFontSmall := InitSkFont;
  SkFontSmall.FCreate(SkTypeface.Handle, 12);

  SkFontMedium := InitSkFont;
  SkFontMedium.FCreate(SkTypeface.Handle, 15);

  SkTextPaintMuted := InitSkPaint;
  SkTextPaintMuted.FCreate;
  SkTextPaintMuted.AntiAlias(True);
  SkTextPaintMuted.Color($FF8295B2);

  SkTextPaintBright := InitSkPaint;
  SkTextPaintBright.FCreate;
  SkTextPaintBright.AntiAlias(True);
  SkTextPaintBright.Color($FFF0F5FF);

  SkTextPaintMint := InitSkPaint;
  SkTextPaintMint.FCreate;
  SkTextPaintMint.AntiAlias(True);
  SkTextPaintMint.Color($FF65E6C4);

end;

procedure DrawHeaderText;
begin
  SkParagraphStyle := InitSkParagraphStyle;
  SkParagraphStyle.FCreate;
  SkParagraphStyle.MaxLines(2);
  SkParagraphStyle.Ellipsis('...');

  SkTextStyle := InitSkTextStyle;
  SkTextStyle.FCreate;
  SkTextStyle.Color($FF8EA4C3);
  SkTextStyle.FontSize(13);
  SkTextStyle.FontStyle(fwMedium, skfwNormal, tfsRegular);

  SkParagraphBuilder := InitSkParagraphBuilder;
  SkParagraphBuilder.FCreate(SkParagraphStyle.Handle);
  SkParagraphBuilder.PushStyle(SkTextStyle.Handle);
  SkParagraphBuilder.AddText('FMXBRIDGE  /  GRAPHICS LAB' + #10);

  SkTextStyle.Color($FFF1F5FF);
  SkTextStyle.FontSize(31);
  SkTextStyle.FontStyle(fwLight, skfwNormal, tfsRegular);
  SkParagraphBuilder.PushStyle(SkTextStyle.Handle);
  SkParagraphBuilder.AddText('SKIA ');

  SkTextStyle.Color($FF65E6C4);
  SkTextStyle.FontSize(31);
  SkTextStyle.FontStyle(fwMedium, skfwNormal, tfsRegular);
  SkParagraphBuilder.PushStyle(SkTextStyle.Handle);
  SkParagraphBuilder.AddText('SHOWCASE');

  SkParagraph := InitSkParagraph;
  SkParagraph.FCreate(SkParagraphBuilder.Handle);
  SkParagraph.Layout(690);

  SkPaintBox.AddDrawParagraph(SkParagraph.Handle, 48, 24);
  SkPaintBox.AddDrawSimpleText(
    'PATHS  /  SHADERS  /  EFFECTS  /  TYPOGRAPHY',
    52, 112, SkFontSmall.Handle, SkTextPaintMuted.Handle);
end;

function BuildStarPath(CX, CY, Radius: Single): NativeInt;
var
  I: Integer;
  A: Double;
  R: Single;
begin
  SkPolygon := InitPolygon;
  SkPolygon.SetLen(10);

  for I := 0 to 9 do
  begin
    A := -Pi / 2 + I * Pi / 5;
    if (I mod 2) = 0 then
      R := Radius
    else
      R := Radius * 0.43;

    SkPolygon.AddValue(I, CX + R * Cos(A), CY + R * Sin(A));
  end;

  SkPathBuilder := InitSkPathBuilder;
  SkPathBuilder.FCreate;
  SkPathBuilder.AddPolygon(SkPolygon.Handle, True);
  Result := SkPathBuilder.Handle;
end;

procedure DrawBackgroundAndCards;
begin
  SkBgShader := InitSkShader;
  SkBgShader.MakeGradientLinear(0, 0, 1120, 728,
    $FF111D31, $FF090F1A, sktmClamp);

  SkBgPaint := InitSkPaint;
  SkBgPaint.FCreate;
  SkBgPaint.AntiAlias(True);
  SkBgPaint.Shader(SkBgShader.Handle);
  SkPaintBox.AddDrawRect(0, 0, 1120, 728, SkBgPaint.Handle);

  SkCardPaint := InitSkPaint;
  SkCardPaint.FCreate;
  SkCardPaint.AntiAlias(True);
  SkCardPaint.Color($E8152338);

  SkCardLinePaint := InitSkPaint;
  SkCardLinePaint.FCreate2(skpsStroke);
  SkCardLinePaint.AntiAlias(True);
  SkCardLinePaint.StrokeWidth(1);
  SkCardLinePaint.Color($FF2A3D58);

  SkPaintBox.AddDrawRoundRect(38, 145, 700, 425, 22, 22, SkCardPaint.Handle);
  SkPaintBox.AddDrawRoundRect(38, 145, 700, 425, 22, 22, SkCardLinePaint.Handle);
  SkPaintBox.AddDrawRoundRect(758, 145, 324, 425, 22, 22, SkCardPaint.Handle);
  SkPaintBox.AddDrawRoundRect(758, 145, 324, 425, 22, 22, SkCardLinePaint.Handle);
  SkPaintBox.AddDrawRoundRect(38, 590, 1044, 105, 20, 20, SkCardPaint.Handle);
  SkPaintBox.AddDrawRoundRect(38, 590, 1044, 105, 20, 20, SkCardLinePaint.Handle);

  SkPaintBox.AddDrawSimpleText('PATH EFFECTS', 786, 180,
    SkFontMedium.Handle, SkTextPaintBright.Handle);
  SkPaintBox.AddDrawSimpleText('Same geometry, different treatment', 786, 202,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);
end;

procedure DrawHeroArtwork;
begin
  { Soft radial light behind the central geometry }
  SkGlowShader1 := InitSkShader;
  SkGlowShader1.MakeGradientRadial(390, 365, 245,
    $FF255EA2, $00101D30, sktmClamp);

  SkGlowPaint1 := InitSkPaint;
  SkGlowPaint1.FCreate;
  SkGlowPaint1.AntiAlias(True);
  SkGlowPaint1.Shader(SkGlowShader1.Handle);
  SkPaintBox.AddDrawCircle(390, 365, 245, SkGlowPaint1.Handle);

  SkGlowShader2 := InitSkShader;
  SkGlowShader2.MakeGradientRadial(220, 345, 155,
    $FF087F91, $00101D30, sktmClamp);

  SkGlowPaint2 := InitSkPaint;
  SkGlowPaint2.FCreate;
  SkGlowPaint2.AntiAlias(True);
  SkGlowPaint2.Shader(SkGlowShader2.Handle);
  SkPaintBox.AddDrawCircle(220, 345, 155, SkGlowPaint2.Handle);

  SkGlowShader3 := InitSkShader;
  SkGlowShader3.MakeGradientRadial(570, 330, 150,
    $FF7E3F91, $00101D30, sktmClamp);

  SkGlowPaint3 := InitSkPaint;
  SkGlowPaint3.FCreate;
  SkGlowPaint3.AntiAlias(True);
  SkGlowPaint3.Shader(SkGlowShader3.Handle);
  SkPaintBox.AddDrawCircle(570, 330, 150, SkGlowPaint3.Handle);

  { EvenOdd fill: a gradient ring with a transparent center }
  SkPathBuilder := InitSkPathBuilder;
  SkPathBuilder.FCreate2(skpfEvenOdd);
  SkPathBuilder.AddCircle(390, 365, 150, skpdCW);
  SkPathBuilder.AddCircle(390, 365, 112, skpdCW);

  SkRingShader := InitSkShader;
  SkRingShader.MakeGradientRadial(390, 365, 160,
    $FF75E6FF, $FF805BFA, sktmClamp);

  SkRingPaint := InitSkPaint;
  SkRingPaint.FCreate;
  SkRingPaint.AntiAlias(True);
  SkRingPaint.Shader(SkRingShader.Handle);
  SkPaintBox.AddDrawPath(SkPathBuilder.Handle, SkRingPaint.Handle);

  { Wide flowing ribbon }
  SkPathBuilder := InitSkPathBuilder;
  SkPathBuilder.FCreate;
  SkPathBuilder.MoveTo(70, 405);
  SkPathBuilder.CubicTo(175, 205, 275, 490, 410, 295);
  SkPathBuilder.CubicTo(520, 135, 620, 425, 710, 250);

  SkRibbonShader1 := InitSkShader;
  SkRibbonShader1.MakeGradientLinear(70, 200, 710, 430,
    $FF55E4D1, $FF8F74FF, sktmClamp);

  SkRibbonPaint1 := InitSkPaint;
  SkRibbonPaint1.FCreate2(skpsStroke);
  SkRibbonPaint1.AntiAlias(True);
  SkRibbonPaint1.StrokeCap(skscRound);
  SkRibbonPaint1.StrokeJoin(sksjRound);
  SkRibbonPaint1.StrokeWidth(25);
  SkRibbonPaint1.Shader(SkRibbonShader1.Handle);
  SkPaintBox.AddDrawPath(SkPathBuilder.Handle, SkRibbonPaint1.Handle);

  { Second, thinner curve }
  SkPathBuilder := InitSkPathBuilder;
  SkPathBuilder.FCreate;
  SkPathBuilder.MoveTo(85, 285);
  SkPathBuilder.CubicTo(215, 455, 295, 190, 425, 390);
  SkPathBuilder.CubicTo(535, 545, 610, 235, 700, 335);

  SkRibbonShader2 := InitSkShader;
  SkRibbonShader2.MakeGradientLinear(80, 460, 700, 250,
    $FFFFCB71, $FFFF6C9B, sktmClamp);

  SkRibbonPaint2 := InitSkPaint;
  SkRibbonPaint2.FCreate2(skpsStroke);
  SkRibbonPaint2.AntiAlias(True);
  SkRibbonPaint2.StrokeCap(skscRound);
  SkRibbonPaint2.StrokeJoin(sksjRound);
  SkRibbonPaint2.StrokeWidth(11);
  SkRibbonPaint2.Shader(SkRibbonShader2.Handle);
  SkPaintBox.AddDrawPath(SkPathBuilder.Handle, SkRibbonPaint2.Handle);

  { Fine orbit arcs and simple geometric accents }
  SkArcPaint := InitSkPaint;
  SkArcPaint.FCreate2(skpsStroke);
  SkArcPaint.AntiAlias(True);
  SkArcPaint.StrokeWidth(2);
  SkArcPaint.Color($8877DDF5);
  SkPaintBox.AddDrawArc(220, 195, 340, 340, -35, 105, False, SkArcPaint.Handle);
  SkPaintBox.AddDrawArc(220, 195, 340, 340, 145, 92, False, SkArcPaint.Handle);

  SkShapeShader1 := InitSkShader;
  SkShapeShader1.MakeGradientRadial(250, 265, 34,
    $FFFFD27A, $FFEA6F95, sktmClamp);
  SkShapePaint1 := InitSkPaint;
  SkShapePaint1.FCreate;
  SkShapePaint1.AntiAlias(True);
  SkShapePaint1.Shader(SkShapeShader1.Handle);
  SkPaintBox.AddDrawCircle(250, 265, 34, SkShapePaint1.Handle);

  SkShapeShader2 := InitSkShader;
  SkShapeShader2.MakeGradientRadial(570, 455, 26,
    $FF72E8CE, $FF2679B5, sktmClamp);
  SkShapePaint2 := InitSkPaint;
  SkShapePaint2.FCreate;
  SkShapePaint2.AntiAlias(True);
  SkShapePaint2.Shader(SkShapeShader2.Handle);
  SkPaintBox.AddDrawCircle(570, 455, 26, SkShapePaint2.Handle);

  SkShapePaint3 := InitSkPaint;
  SkShapePaint3.FCreate;
  SkShapePaint3.AntiAlias(True);
  SkShapePaint3.Color($FF182A42);
  SkPaintBox.AddDrawRoundRect(95, 475, 105, 25, 12, 12, SkShapePaint3.Handle);
  SkPaintBox.AddDrawRoundRect(210, 475, 105, 25, 12, 12, SkShapePaint3.Handle);
  SkPaintBox.AddDrawRoundRect(325, 475, 105, 25, 12, 12, SkShapePaint3.Handle);

  SkShapePaint4 := InitSkPaint;
  SkShapePaint4.FCreate2(skpsStroke);
  SkShapePaint4.AntiAlias(True);
  SkShapePaint4.StrokeWidth(2);
  SkShapePaint4.Color($FF65E6C4);
  SkPaintBox.AddDrawCircle(108, 487, 4, SkShapePaint4.Handle);
  SkPaintBox.AddDrawCircle(223, 487, 4, SkShapePaint4.Handle);
  SkPaintBox.AddDrawCircle(338, 487, 4, SkShapePaint4.Handle);

  SkPaintBox.AddDrawSimpleText('LINEAR GRADIENT', 122, 491,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);
  SkPaintBox.AddDrawSimpleText('RADIAL LIGHT', 237, 491,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);
  SkPaintBox.AddDrawSimpleText('EVEN-ODD FILL', 352, 491,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);

  { Keep the hero labels above the artwork layers }
  SkPaintBox.AddDrawSimpleText('FLUID PATHS', 66, 180,
    SkFontSmall.Handle, SkTextPaintMint.Handle);
  SkPaintBox.AddDrawSimpleText('A study in curves, light and layered color', 66, 202,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);
end;

procedure DrawPathEffects;
begin
  { 1. Normal path }
  SkEffectPaint1 := InitSkPaint;
  SkEffectPaint1.FCreate2(skpsStroke);
  SkEffectPaint1.AntiAlias(True);
  SkEffectPaint1.StrokeWidth(3.5);
  SkEffectPaint1.Color($FF61DFF2);
  SkPaintBox.AddDrawPath(BuildStarPath(840, 290, 48), SkEffectPaint1.Handle);

  { 2. Discrete path effect }
  SkPathEffect1 := InitSkPathEffect;
  SkPathEffect1.MakeDiscrete(7, 3.5, 125);

  SkEffectPaint2 := InitSkPaint;
  SkEffectPaint2.FCreate2(skpsStroke);
  SkEffectPaint2.PathEffect(SkPathEffect1.Handle);
  SkEffectPaint2.AntiAlias(True);
  SkEffectPaint2.StrokeWidth(3.5);
  SkEffectPaint2.Color($FFFFC96F);
  SkPaintBox.AddDrawPath(BuildStarPath(1000, 290, 48), SkEffectPaint2.Handle);

  { 3. Rounded corners }
  SkPathEffect2 := InitSkPathEffect;
  SkPathEffect2.MakeCorner(13);

  SkEffectPaint3 := InitSkPaint;
  SkEffectPaint3.FCreate2(skpsStroke);
  SkEffectPaint3.PathEffect(SkPathEffect2.Handle);
  SkEffectPaint3.AntiAlias(True);
  SkEffectPaint3.StrokeWidth(3.5);
  SkEffectPaint3.Color($FFB99AFF);
  SkPaintBox.AddDrawPath(BuildStarPath(840, 445, 48), SkEffectPaint3.Handle);

  { 4. Sum of two discrete effects }
  SkPathEffect3 := InitSkPathEffect;
  SkPathEffect3.MakeDiscrete(8, 2.0, 271);

  SkPathEffect4 := InitSkPathEffect;
  SkPathEffect4.MakeDiscrete(8, 2.0, 913);

  SkEffectShader := InitSkShader;
  SkEffectShader.MakeGradientLinear(950, 380, 1050, 500,
    $FF6BE5B8, $FF5B9CFA, sktmClamp);

  SkEffectPaint4 := InitSkPaint;
  SkEffectPaint4.FCreate2(skpsStroke);
  SkPathEffect2 := InitSkPathEffect;
  SkPathEffect2.MakeSum(SkPathEffect3.Handle, SkPathEffect4.Handle);
  SkEffectPaint4.PathEffect(SkPathEffect2.Handle);
  SkEffectPaint4.AntiAlias(True);
  SkEffectPaint4.StrokeWidth(3.5);
  SkEffectPaint4.Shader(SkEffectShader.Handle);
  SkPaintBox.AddDrawPath(BuildStarPath(1000, 445, 48), SkEffectPaint4.Handle);

  SkPaintBox.AddDrawSimpleText('NORMAL', 810, 355,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);
  SkPaintBox.AddDrawSimpleText('DISCRETE', 960, 355,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);
  SkPaintBox.AddDrawSimpleText('CORNERS', 810, 510,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);
  SkPaintBox.AddDrawSimpleText('SUM', 984, 510,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);
end;

procedure DrawMultiStyleParagraph;
begin
  SkParagraphStyle := InitSkParagraphStyle;
  SkParagraphStyle.FCreate;
  SkParagraphStyle.MaxLines(2);
  SkParagraphStyle.Ellipsis('...');

  SkTextStyle := InitSkTextStyle;
  SkTextStyle.FCreate;
  SkTextStyle.Color($FF8295B2);
  SkTextStyle.FontSize(15);
  SkTextStyle.FontStyle(fwLight, skfwNormal, tfsRegular);

  SkParagraphBuilder := InitSkParagraphBuilder;
  SkParagraphBuilder.FCreate(SkParagraphStyle.Handle);
  SkParagraphBuilder.PushStyle(SkTextStyle.Handle);
  SkParagraphBuilder.AddText('ONE CANVAS. ');

  SkTextStyle.Color($FF65E6C4);
  SkTextStyle.FontSize(22);
  SkTextStyle.FontStyle(fwMedium, skfwNormal, tfsRegular);
  SkParagraphBuilder.PushStyle(SkTextStyle.Handle);
  SkParagraphBuilder.AddText('MANY POSSIBILITIES');

  SkTextStyle.Color($FF8295B2);
  SkTextStyle.FontSize(15);
  SkTextStyle.FontStyle(fwLight, skfwNormal, tfsRegular);
  SkParagraphBuilder.PushStyle(SkTextStyle.Handle);
  SkParagraphBuilder.AddText('  /  paths, shaders, effects and rich typography');

  SkParagraph := InitSkParagraph;
  SkParagraph.FCreate(SkParagraphBuilder.Handle);
  SkParagraph.Layout(930);
  SkPaintBox.AddDrawParagraph(SkParagraph.Handle, 66, 620);

  SkPaintBox.AddDrawSimpleText(
    'SKIA4DELPHI  +  FMXBRIDGE', 68, 666,
    SkFontSmall.Handle, SkTextPaintMuted.Handle);
  SkPaintBox.AddDrawSimpleText(
    'VECTOR DRAWING', 812, 666,
    SkFontSmall.Handle, SkTextPaintMint.Handle);
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FF090F1A, '', True);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  WinTB.FCreate(FormLayer.Handle, True);
  WinTB.MinimizeBtnOnClick(@CommonOnClick);
  WinTB.CloseBtnOnClick(@CommonOnClick);

  SkPaintBox := InitSkPaintBox;
  SkPaintBox.FCreate(FormLayer.Handle);
  SkPaintBox.SetBounds(0, 32, 1120, 728);

  CreateTypography;
  DrawBackgroundAndCards;
  DrawHeaderText;
  DrawHeroArtwork;
  DrawPathEffects;
  DrawMultiStyleParagraph;

  SkPaintBox.DoDrawing;
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(1120, 760);
  FMXDesigning;
  FMXForm.Show;
end;
