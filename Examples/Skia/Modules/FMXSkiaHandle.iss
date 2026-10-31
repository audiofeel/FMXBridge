
// =============================================================================
//  FMXSkia Handle - v3.0.0.0
//  Last Updated : 2026-10-31
//  RAD Studio   : 13.2 Florence
//  Compiler     : 37.0.60952.8797 (RTM Update 2)
// =============================================================================

[Code]

type
// =============================================================================
// FMX SKIA Enumerations
// =============================================================================
  TSingleArr = Array of Single;
  TSkAnimatedImageWrapMode = (skiwFit, skiwFitCrop, skiwOriginal,
    skiwOriginalCenter, skiwPlace, skiwStretch);
  TSkSvgWrapMode = (skwmDefault, skwmFit, skwmFitCrop, skwmOriginal,
    skwmOriginalCenter, skwmPlace, skwmStretch, skwmTile);
  TSkTextHorzAlign = (txhCenter, txhLeading, txhTrailing, txhJustify);
  TFontWeight = (fwThin, fwUltraLight, fwLight, fwSemiLight, fwRegular, 
    fwMedium, fwSemibold, fwBold, fwUltraBold, fwBlack, fwUltraBlack);
  TFontSlant = (tfsRegular, tfsItalic, tfsOblique);
  TFontStretch = (fstUltraCondensed, fstExtraCondensed, fstCondensed,
    fstSemiCondensed, fstRegular, fstSemiExpanded, fstExpanded, 
    fstExtraExpanded, fstUltraExpanded);
  TSkTextDecoration = (txdUnderline, txdOverline, txdLineThrough);
  TSkTextDecorations = set of TSkTextDecoration;
  TSkTextDecorationStyle = (txdsSolid, txdsDouble, txdsDotted, 
    txdsDashed, txdsWavy);
  TSkPaintStyle = (skpsFill, skpsStroke, skpsStrokeAndFill);
  TSkStrokeCap = (skscButt, skscRound, skscSquare);
  TSkStrokeJoin = (sksjMiter, sksjRound, sksjBevel);
  TSkTileMode = (sktmClamp, sktmRepeat, sktmMirror, sktmDecal);
  TSkPathFillType = (skpfWinding, skpfEvenOdd, skpfInverseWinding,
    skpfInverseEvenOdd);
  TSkPathDirection = (skpdCW, skpdCCW);
  TSkEncodedImageFormat = (skifBMP, skifGIF, skifICO, skifJPEG, skifPNG, skifWBMP,
    skifWEBP, skifPKM, skifKTX, skifASTC, skifDNG, skifHEIF,  skifAVIF);
  TSkSrcRectConstraint = (sksrcClose, sksrcFast);
  TSkFilterMode = (skfmNearest, skfmLinear);
  TSkFontsStyle = (skfsNormal, skfsBold, skItalic, skfsBoldItalic);
  TSkFontEdging = (skfeAlias, skfeAntiAlias , skfeSubpixelAntiAlias);
  TSkFontHinting = (skfhNone, skfhSlight, skfhNormal, skfhFull);
  TSkBlendMode = (skbmClear, skbmSrc, skbmDest, skbmSrcOver, skbmDestOver,
    skbmSrcIn, skbmDestIn, skbmSrcOut, skbmDestOut, skbmSrcATop, skbmDestATop,
    skbmXor, skbmPlus, skbmModulate, skbmScreen, skbmOverlay, skbmDarken,
    skbmLighten, skbmColorDodge, skbmColorBurn, skbmHardLight, skbmSoftLight,
    skbmDifference, skbmExclusion, skbmMultiply, skbmHue, skbmSaturation,
    skbmColor, skbmLuminosity);
  TSkOverdrawColor = array[0..5] of Cardinal;
  TSkPathEffect1DStyle = (skpesTranslate, skpesRotate, skpesMorph);
  TSkPathOp = (skpoDifference, skpoIntersect, skpoUnion, skpoXor,
    skpoReverseDifference);
  TSkPathEffectTrimMode = (skpetNormal, skpetInverted);
  TSkTextAlign = (sktaLeft, sktaRight, sktaCenter, sktaJustify,
    sktaStart, sktaTerminate);
  TSkTextDirection = (sktdRightToLeft, sktdLeftToRight);
  TSkTextHeightBehavior = (skthbDisableFirstAscent, skthbDisableLastDescent);
  TSkTextHeightBehaviors = set of TSkTextHeightBehavior;
  TSkFontWidth = (skfwUltraCondensed, skfwExtraCondensed, skfwCondensed,
    skfwSemiCondensed, skfwNormal, skfwSemiExpanded, skfwExpanded, 
    skfwExtraExpanded, skfwUltraExpanded);

// =============================================================================
// FSkLabelFontStyle
// =============================================================================
type
  FSkLabelFontStyle = interface(IUnknown)
    '{4B68DB89-ADBB-4821-82D6-5C0F910C864D}'
    procedure FontName(const FontName: WideString);
    procedure FontSize(FSize: Single);
    procedure FontColor(FColor: TAlphaColor);
    procedure FontWeight(FWeight: TFontWeight);
    procedure FontSlant(FSlant: TFontSlant);
    procedure FontStretch(FStretch: TFontStretch);
    procedure BackgroundColor(FColor: TAlphaColor);
    procedure Decorations(FDecorations: TSkTextDecorations);
    procedure DecorationStyle(FStyle: TSkTextDecorationStyle);
    procedure DecorationColor(FColor: TAlphaColor);
    procedure DecorationStrokeColor(FStrokeColor: TAlphaColor);
    procedure DecorationThickness(FThickness: Single);
    procedure Cursor(ACursor: TCursor);
    procedure OnClick(Event: TNotifyEvent);
  end;

// =============================================================================
// FSkLabel
// =============================================================================
type
  FSkLabel = interface(IUnknown)
    '{2F250C9A-76B5-4FB9-A45A-724C95F7885D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AutoSize(FAutoSize: Boolean);
    procedure MaxLines(FValue: Integer);
    procedure Text(const FText: WideString;
      TextStyle: FSkLabelFontStyle);
    procedure TextSetting(FHorzAlign: TSkTextHorzAlign;
      FVertAlign: TTextAlign; FHeightMultiplier, FLetterSpacing:
      Single; FTrimming: TTextTrimming);
    procedure Words(const FWord: WideString;
      WordsStyle: FSkLabelFontStyle);
    procedure ChangeWords(FWordIndex: Integer;
      const FNewWord: WideString; WordsStyle: FSkLabelFontStyle);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSkAnimatedPaintBox
// =============================================================================
type
  FSkAnimatedPaintBox = interface(IUnknown)
    '{A0B81E31-DBD3-42E4-87BB-5429874F354B}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure LoadShader(const FShaderFile: WideString);
    procedure RunAnim;
    procedure StopAnim;
    procedure InteractWithMouse(FValue: Boolean);
    procedure RoundRect(XRadius, YRadius: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEvent);
    function Handle: TFmxObject;
    function SetUniformFloat(const UniformName: WideString; Value: Single): Boolean;
    function SetUniformFloat2(const UniformName: WideString; X, Y: Single): Boolean;
    function SetUniformFloat3(const UniformName: WideString; X, Y, Z: Single): Boolean;
    function SetUniformFloat4(const UniformName: WideString; X, Y, Z, W: Single): Boolean;
    procedure BeginUniformUpdate;
    procedure EndUniformUpdate;
  end;

// =============================================================================
// FSkAnimatedImage
// =============================================================================
type
  FSkAnimatedImage = interface(IUnknown)
    '{715AEC8C-29A9-4E00-A76D-5DAF2DE2150B}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure LoadAnimImage(const FAnimImage: WideString);
    procedure WrapMode(FWrapMode: TSkAnimatedImageWrapMode);
    procedure RunAnim;
    procedure LoopAnim(FValue: Boolean);
    procedure ProgressAnim(FValue: Double);
    procedure SpeedAnim(FValue: Single);
    procedure StopAnim;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSkSvg
// =============================================================================
type
  FSkSvg = interface(IUnknown)
    '{F446CEE9-B714-4101-91D0-4606198A9931}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure LoadSvgFile(const FSvgFile: WideString);
    procedure WrapMode(FWrapMode: TSkSvgWrapMode);
    procedure GrayScale(FValue: Boolean);
    procedure OverrideColor(FColor: TAlphaColor);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSkPaint
// =============================================================================
type
  FSkPaint = interface(IUnknown)
    '{C49BB164-B684-4826-88F9-669470C0C0F9}'
    procedure FCreate;
    procedure FCreate2(FPaintStyle: TSkPaintStyle);
    procedure AntiAlias(FValue: Boolean);
    procedure SetARGB(const A, R, G, B: Byte);
    procedure ColorFilter(FColorFilter: NativeInt);
    procedure PathEffect(FPathEffect: NativeInt);
    procedure Dither(FValue: Boolean);
    procedure Color(FColor: TAlphaColor);
    procedure PaintStyle(FStyle: TSkPaintStyle);
    procedure Shader(FShader: NativeInt);
    procedure Opacity(FOpacity: Single);
    procedure StrokeCap(FCap: TSkStrokeCap);
    procedure StrokeJoin(FJoin: TSkStrokeJoin);
    procedure StrokeMiter(FMiter: Single);
    procedure StrokeWidth(FWidth: Single);
    function Handle: NativeInt;
  end;

// ==================================================
// FSkPaintBox
// ==================================================
type
  FSkPaintBox = Interface(IUnknown)
    '{2D32408F-B123-47FE-BCEE-973C0A2D0C49}'
    procedure FCreate(FParent: TFmxObject);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure Translate(FDeltaX, FDeltaY: Single);
    procedure Rotate(FDegrees: Single);
    procedure AddDrawRect(FLeft, FTop, FWidth, FHeight: Single;
      FPaint: NativeInt);
    procedure AddDrawRoundRect(FLeft, FTop, FWidth, FHeight, FRadiusX,
      FRadiusY: Single; FPaint: NativeInt);
    procedure AddDrawRoundRect2(FRoundRect: NativeInt;
      FPaint: NativeInt);
    procedure AddDrawCircle(CenterX, CenterY, FRadius: Single;
      FPaint: NativeInt);
    procedure AddDrawArc(FLeft, FTop, FWidth, FHeight, FStartAngle,
      FSweepAngle: Single; FUseCenter: Boolean; FPaint: NativeInt);
    procedure AddDrawPath(FPath: NativeInt; FPaint: NativeInt);
    procedure AddDrawTextBlob(FTextBlob: NativeInt; X, Y: Single;
      FPaint: NativeInt);
    procedure AddDrawParagraph(FParagraph: NativeInt; X, Y: Single);
    procedure AddDrawSimpleText(const FText: WideString;
      X, Y: Single; FFont: NativeInt; FPaint: NativeInt);
    procedure AddDrawImage(FImage, FPaint: NativeInt;
      X, Y: Single);
    procedure AddDrawImageRect(FImage, FPaint: NativeInt;
      DestLeft, DestTop, DestRight, DestBottom: Single;
        Constraint: TSkSrcRectConstraint);
    procedure AddDrawImageRect2(FImage, FPaint: NativeInt;
      SrcLeft, SrcTop, SrcRight, SrcBottom,
        DestLeft, DestTop, DestRight, DestBottom: Single;
          Constraint: TSkSrcRectConstraint);
    procedure AddDrawImageNine(FImage, FPaint: NativeInt;
      CenterLeft, CenterTop, CenterRight, CenterBottom: Integer;
        DestLeft, DestTop, DestRight, DestBottom: Single;
          FilterMode: TSkFilterMode);
    procedure DoDrawing;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FAngle: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enable(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FValue: Boolean);
    function GetLeft: Single;
    function GetTop: Single;
    function GetWidth: Single;
    function GetHeight: Single;
    function GetOpacity: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
    procedure ClearCommands;
  end;

// =============================================================================
// FSkShader
// =============================================================================
type
  FSkShader = interface(IUnknown)
    '{88042197-8BFB-4701-A9D4-27E892714B75}'
    procedure MakeColor(FColor: TAlphaColor);
    procedure MakeGradientLinear(X1, Y1, X2, Y2: Single;
      FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode);
    procedure MakeGradientRadial(X, Y, FRadius: Single;
      FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode);
    procedure MakeGradientSweep(X, Y: Single;
      FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode);
    procedure MakeGradientTwoPointConical(X1, Y1, FRadius1: Single;
      X2, Y2, FRadius2: Single; FColor1, FColor2: TAlphaColor;
      FTileMode: TSkTileMode);
    procedure MakeImage(FImage:  NativeInt;
      FTileModeX, FTileModeY: TSkTileMode);
    function Handle: NativeInt;
  end;

// =============================================================================
// FSkPathBuilder
// =============================================================================
type
  FSkPathBuilder = Interface(IUnknown)
    '{9ADEEE45-6086-49DD-AFC0-823EC5BE5018}'
    procedure FCreate;
    procedure FCreate2(SkPathFillTypes: TSkPathFillType);
    procedure AddArc(X, Y, FWidth, FHeight,
      FStartAngle, FSweepAngle: Single);
    procedure AddCircle(CenterX, CenterY, FRadius: Single;
      SkPathDirection: TSkPathDirection);
    procedure AddOval(X, Y, FWidth, FHeight: Single;
      SkPathDirection: TSkPathDirection);
    procedure AddRect(X, Y, FWidth, FHeight: Single;
      SkPathDirection: TSkPathDirection);
    procedure AddRoundRect(FRoundRect: NativeInt;
      SkPathDirection: TSkPathDirection);
    procedure AddPolygon(FPolygon: NativeInt; IsClosed: Boolean);
    procedure AddPath(FPath: NativeInt);
    procedure ArcTo(X1, Y1, X2, Y2, FRadius: Single);
    procedure ArcTo2(X, Y, FWidth, FHeight, FStartAngle,
      FSweepAngle: Single; FForceMoveTo: Boolean);
    procedure ConicTo(X1, Y1, X2, Y2, FWeight: Single);
    procedure CubicTo(X1, Y1, X2, Y2, X3, Y3: Single);
    procedure LineTo(X, Y: Single);
    procedure MoveTo(X, Y: Single);
    procedure Offset(FDeltaX, FDeltaY: Single);
    procedure QuadTo(X1, Y1, X2, Y2: Single);
    procedure RConicTo(X1, Y1, X2, Y2, FWeight: Single);
    procedure RCubicTo(X1, Y1, X2, Y2, X3, Y3: Single);
    procedure RLineTo(X, Y: Single);
    procedure RQuadTo(X1, Y1, X2, Y2: Single);
    procedure Reset;
    procedure PathFillType(SkPathFillTypes: TSkPathFillType);
    procedure ToggleInverseFillType;
    function Handle: NativeInt;
  end;

// =============================================================================
// FSkRoundRect
// =============================================================================
type
  FSkRoundRect = Interface(IUnknown)
    '{2FFC738F-D78B-40E8-B33A-46C6F71400E1}'
    procedure FCreate;
    procedure Deflate(FDeltaX, FDeltaY: Single);
    procedure Inflate(FDeltaX, FDeltaY: Single);
    procedure Offset(FDeltaX, FDeltaY: Single);
    procedure SetOval(X, Y, FWidth, FHeight: Single);
    procedure SetRect(X, Y, FWidth, FHeight: Single);
    procedure SetRect2(X, Y, FWidth, FHeight,
      FRadiusX, FRadiusY: Single);
    function Handle: NativeInt;
  end;

// ==================================================
// FSkImage
// ==================================================
type
  FSkImage = Interface(IUnknown)
    '{0703E29B-6813-4160-BF53-34AB4B1B33AC}'
    procedure FCreate(const FImageFile: WideString);
    function EncodeToFile(const FOutImgFile: WideString;
      FEncodedImagesFormat: TSkEncodedImageFormat;
      FQuality: Integer): Boolean;
    function MakeNonTextureImage: NativeInt;
    function MakeRasterImage: NativeInt;
    function MakeRawShader(FTileModeX, FTileModeY: TSkTileMode)
      : NativeInt;
    function MakeShader(FTileModeX, FTileModeY: TSkTileMode): NativeInt;
    function IsAlphaOnly: Boolean;
    function IsOpaque: Boolean;
    function IsTextureBacked: Boolean;
    function GetHeight: Integer;
    function GetWidth: Integer;
    function Handle: NativeInt;
  end;

// ==================================================
// FSkTypeface
// ==================================================
type
  FSkTypeface = Interface(IUnknown)
    '{BF34108B-AEF1-4674-BF85-D4397E2CF0A0}'
    procedure FCreateDefault;
    procedure FCreateFromName(const FontName: WideString;
      SkFontsStyle: TSkFontsStyle);
    procedure FCreateFromFile(const FontFile: WideString;
      const ATTCIndex: Integer);
    function Handle: NativeInt;
  end;

// =============================================================================
// FSkFont
// =============================================================================
type
  FSkFont = Interface(IUnknown)
    '{F7B8C6F7-EB2C-42C8-9C39-5293AE7F5ADF}'
    procedure FCreate(FTypeface: NativeInt; FSize: Single);
    procedure BaselineSnap(FValue: Boolean);
    procedure Edging(FValue: TSkFontEdging);
    procedure Hinting(FValue: TSkFontHinting);
    procedure LinearMetrics(FValue: Boolean);
    procedure Subpixel(FValue: Boolean);
    procedure Size(FValue: Single);
    procedure ScaleX(FValue: Single);
    procedure SkewX(FValue: Single);
    function GetSize: Single;
    function GetScaleX: Single;
    function GetSkewX: Single;
    function Handle: NativeInt;
  end;

// =============================================================================
// FSkTextBlob
// =============================================================================
type
  FSkTextBlob = Interface(IUnknown)
    '{990380E1-26C6-4A82-BE65-272C639A2507}'
    procedure MakeFromText(const FText: WideString; FFont: NativeInt);
    function Handle: NativeInt;
  end;

// ==================================================
// FSkColorFilter
// ==================================================
type
  FSkColorFilter = Interface(IUnknown)
    '{A33F1B77-148E-4883-BACA-748CBBAD637D}'
    procedure MakeBlend(FColor: TAlphaColor; BlendsMode: TSkBlendMode);
    procedure MakeCompose(FOuter, FInner: NativeInt);
    procedure MakeLighting(FMultiply, FAdd: TAlphaColor);
    procedure MakeLinearToSRGBGamma;
    procedure MakeLumaColor;
    procedure MakeOverdraw(FColors: TSkOverdrawColor);
    function Handle: NativeInt;
  end;

// =============================================================================
// FSkPathEffect
// =============================================================================
type
  FSkPathEffect = Interface(IUnknown)
    '{1AAA71FB-15D3-4500-BE00-86F1A2EC3F6F}'
    procedure Make1DPath(FPath: NativeInt; FAdvance, FPhase: Single;
      FStyle: TSkPathEffect1DStyle);
    procedure MakeCompose(FOuter, FInner: NativeInt);
    procedure MakeCorner(FRadius: Single);
    procedure MakeDash(const FIntervals: TSingleArr; FPhase: Single);
    procedure MakeDiscrete(FSegLength, FDeviation: Single;
      FSeedAssist: Cardinal);
    procedure MakeMerge(FEffect1, FEffect2: NativeInt;
      FOp: TSkPathOp);
    procedure MakeStroke(FWidth: Single; FJoin: TSkStrokeJoin;
      FCap: TSkStrokeCap; FMiter: Single);
    procedure MakeStrokeAndFill;
    procedure MakeSum(FEffect1, FEffect2: NativeInt);
    procedure MakeTranslate(FDeltaX, FDeltaY: Single);
    procedure MakeTrim(FStart, FStop: Single;
      FMode: TSkPathEffectTrimMode);
    function Handle: NativeInt;
  end;

// ==================================================
// FSkShaper
// ==================================================
type
  FSkShaper = Interface(IUnknown)
    '{FB101C17-655A-4416-A142-EE9AEC2CFBD6}'
    procedure FCreate;
    procedure Shape(const FText: WideString; FFont: NativeInt;
      FLeftToRight: Boolean; FWidth: Single);
    procedure Shape2(const FText: WideString; FFont: NativeInt;
      FLeftToRight: Boolean; FWidth: Single; FOffsetX, FOffsetY: Single;
      var FEndPointX, FEndPointY: Single);
    function Handle: NativeInt;
  end;

// ==================================================
// FSkParagraphStyle
// ==================================================
type
  FSkParagraphStyle = Interface(IUnknown)
    '{1AA04254-5770-49F3-8C2F-E40911FBF550}'
    procedure FCreate;
    procedure DisableHinting;
    procedure Ellipsis(const FValue: WideString);
    procedure Height(FValue: Single);
    procedure MaxLines(FValue: Integer);
    procedure StrutStyle(FValue: NativeInt);
    procedure TextAlign(FValue: TSkTextAlign);
    procedure TextDirection(FValue: TSkTextDirection);
    procedure TextHeightBehaviors(FValue: TSkTextHeightBehaviors);
    procedure TextStyle(FValue: NativeInt);
    function Handle: NativeInt;
  end;

// =============================================================================
// FSkTextStyle
// =============================================================================
type
  FSkTextStyle = Interface(IUnknown)
    '{F06B36B2-CCB6-42B4-9DF3-8A7F4143B1CA}'
    procedure FCreate;
    procedure Color(FColor: TAlphaColor);
    procedure FontSize(FValue: Single);
    procedure FontStyle(FFontWeight: TFontWeight; FFontWidth: TSkFontWidth;
      FFontSlant: TFontSlant);
    procedure ClearFontFamilies;
    procedure AddFontFamily(const FFontFamily: WideString);
    procedure LetterSpacing(FValue: Single);
    procedure WordSpacing(FValue: Single);
    procedure Locale(const FValue: WideString);
    procedure HeightMultiplier(FValue: Single);
    procedure HalfLeading(FValue: Boolean);
    procedure Decorations(FValue: Cardinal);
    procedure DecorationColor(FColor: TAlphaColor);
    procedure DecorationStyle(FValue: TSkTextDecorationStyle);
    procedure DecorationThickness(FValue: Single);
    procedure ClearBackgroundColor;
    procedure ClearForegroundColor;
    procedure ResetFontFeatures;
    procedure ResetShadows;
    function Handle: NativeInt;
  end;

// =============================================================================
// FSkParagraphBuilder
// =============================================================================
type
  FSkParagraphBuilder = Interface(IUnknown)
    '{73F4AF2D-E844-48B1-B9D8-933ECF4FA653}'
    procedure FCreate(FParagraphStyle: NativeInt);
    procedure PushStyle(FTextStyle: NativeInt);
    procedure Pop;
    procedure AddText(const FText: WideString);
    procedure Build;
    function Handle: NativeInt;
  end;

// =============================================================================
// FSkParagraph
// =============================================================================
type
  FSkParagraph = Interface(IUnknown)
    '{BC918D4C-8D5B-44CD-8E02-269EF3B3DAF0}'
    procedure FCreate(FParagraphBuilder: NativeInt);
    procedure Layout(FWidth: Single);
    function ToPath: NativeInt;
    function Handle: NativeInt;
  end;

// =============================================================================
// FPolygon
// =============================================================================
type
  FPolygon = Interface(IUnknown)
    '{C0528FFC-42A2-44E6-BBB4-FFB7B67BC2B3}'
    procedure SetLen(FLength: Integer);
    procedure AddValue(FIndex: Integer; FV1, FV2: Single);
    function GetLen: Integer;
    function Handle: NativeInt;
  end;

// =============================================================================
// Imports
// =============================================================================
procedure sk4d_graphics_init();
  external 'sk4d_graphics_init@files:sk4d.dll cdecl';
function InitSkLabelFontStyle: FSkLabelFontStyle;
  external 'InitSkLabelFontStyle@files:FMXBridge.dll stdcall delayload';
function InitSkLabel: FSkLabel;
  external 'InitSkLabel@files:FMXBridge.dll stdcall delayload';
function InitSkAnimatedPaintBox: FSkAnimatedPaintBox;
  external 'InitSkAnimatedPaintBox@files:FMXBridge.dll stdcall delayload';
function InitSkAnimatedImage: FSkAnimatedImage;
  external 'InitSkAnimatedImage@files:FMXBridge.dll stdcall delayload';
function InitSkSvg: FSkSvg;
  external 'InitSkSvg@files:FMXBridge.dll stdcall delayload';
function InitSkPaint: FSkPaint;
  external 'InitSkPaint@files:FMXBridge.dll stdcall delayload';
function InitSkPaintBox: FSkPaintBox;
  external 'InitSkPaintBox@files:FMXBridge.dll stdcall delayload';
function InitSkShader: FSkShader;
  external 'InitSkShader@files:FMXBridge.dll stdcall delayload';
function InitSkPathBuilder: FSkPathBuilder;
  external 'InitSkPathBuilder@files:FMXBridge.dll stdcall delayload';
function InitSkRoundRect: FSkRoundRect;
  external 'InitSkRoundRect@files:FMXBridge.dll stdcall delayload';
function InitSkImage: FSkImage;
  external 'InitSkImage@files:FMXBridge.dll stdcall delayload';
function InitSkTypeface: FSkTypeface;
  external 'InitSkTypeface@files:FMXBridge.dll stdcall delayload';
function InitSkFont: FSkFont;
  external 'InitSkFont@files:FMXBridge.dll stdcall delayload';
function InitSkTextBlob: FSkTextBlob;
  external 'InitSkTextBlob@files:FMXBridge.dll stdcall delayload';
function InitSkColorFilter: FSkColorFilter;
  external 'InitSkColorFilter@files:FMXBridge.dll stdcall delayload';
function InitSkPathEffect: FSkPathEffect;
  external 'InitSkPathEffect@files:FMXBridge.dll stdcall delayload';
function InitSkShaper: FSkShaper;
  external 'InitSkShaper@files:FMXBridge.dll stdcall delayload';
function InitSkParagraphStyle: FSkParagraphStyle;
  external 'InitSkParagraphStyle@files:FMXBridge.dll stdcall delayload';
function InitSkTextStyle: FSkTextStyle;
  external 'InitSkTextStyle@files:FMXBridge.dll stdcall delayload';
function InitSkParagraphBuilder: FSkParagraphBuilder;
  external 'InitSkParagraphBuilder@files:FMXBridge.dll stdcall delayload';
function InitSkParagraph: FSkParagraph;
  external 'InitSkParagraph@files:FMXBridge.dll stdcall delayload';
function InitPolygon: FPolygon;
  external 'InitPolygon@files:FMXBridge.dll stdcall delayload';
procedure InstallSkiaFonts(FontFile: WideString);
  external 'InstallSkiaFonts@files:FMXBridge.dll stdcall delayload';
