
unit FMXBridge.Skia;

interface

uses
  System.SysUtils, System.UITypes, System.Types, System.Classes,
  System.Skia, System.Math.Vectors,
  FMX.Skia, FMX.Types, FMX.Graphics;

// =============================================================================
// FSkLabelFontStyle
// =============================================================================
type
  FSkLabelFontStyle = interface(IUnknown)
    ['{4B68DB89-ADBB-4821-82D6-5C0F910C864D}']
    procedure FontName(const FontName: WideString); stdcall;
    procedure FontSize(FSize: Single); stdcall;
    procedure FontColor(FColor: TAlphaColor); stdcall;
    procedure FontWeight(FWeight: TFontWeight); stdcall;
    procedure FontSlant(FSlant: TFontSlant); stdcall;
    procedure FontStretch(FStretch: TFontStretch); stdcall;
    procedure BackgroundColor(FColor: TAlphaColor); stdcall;
    procedure Decorations(FDecorations: TSkTextDecorations); stdcall;
    procedure DecorationStyle(FStyle: TSkTextDecorationStyle); stdcall;
    procedure DecorationColor(FColor: TAlphaColor); stdcall;
    procedure DecorationStrokeColor(FStrokeColor: TAlphaColor); stdcall;
    procedure DecorationThickness(FThickness: Single); stdcall;
    procedure Cursor(ACursor: TCursor); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
  end;

  TFSkLabelFontStyle = class(TInterfacedObject, FSkLabelFontStyle)
  private
    FFontName: WideString;
    FFontSize: Single;
    FFontColor: TAlphaColor;
    FFontWeight: TFontWeight;
    FFontSlant: TFontSlant;
    FFontStretch: TFontStretch;
    FBackgroundColor: TAlphaColor;
    FDecorationsSet: TSkTextDecorations;
    FDecorationStyle: TSkTextDecorationStyle;
    FDecorationColor: TAlphaColor;
    FDecorationStrokeColor: TAlphaColor;
    FDecorationThickness: Single;
    FCursor: TCursor;
    FOnClick: TNotifyEvent;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    procedure FontName(const FontName: WideString); stdcall;
    procedure FontSize(FSize: Single); stdcall;
    procedure FontColor(FColor: TAlphaColor); stdcall;
    procedure FontWeight(FWeight: TFontWeight); stdcall;
    procedure FontSlant(FSlant: TFontSlant); stdcall;
    procedure FontStretch(FStretch: TFontStretch); stdcall;
    procedure BackgroundColor(FColor: TAlphaColor); stdcall;
    procedure Decorations(FDecorations: TSkTextDecorations); stdcall;
    procedure DecorationStyle(FStyle: TSkTextDecorationStyle); stdcall;
    procedure DecorationColor(FColor: TAlphaColor); stdcall;
    procedure DecorationStrokeColor(FStrokeColor: TAlphaColor); stdcall;
    procedure DecorationThickness(FThickness: Single); stdcall;
    procedure Cursor(ACursor: TCursor); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FSkLabel
// =============================================================================
type
  FSkLabel = interface(IUnknown)
    ['{2F250C9A-76B5-4FB9-A45A-724C95F7885D}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure AutoSize(FAutoSize: Boolean); stdcall;
    procedure MaxLines(FValue: Integer); stdcall;
    procedure Text(const FText: WideString;
      TextStyle: FSkLabelFontStyle); stdcall;
    procedure TextSetting(FHorzAlign: TSkTextHorzAlign;
      FVertAlign: TTextAlign; FHeightMultiplier, FLetterSpacing:
      Single; FTrimming: TTextTrimming); stdcall;
    procedure Words(const FWord: WideString;
      WordsStyle: FSkLabelFontStyle); stdcall;
    procedure ChangeWords(FWordIndex: Integer;
      const FNewWord: WideString; WordsStyle: FSkLabelFontStyle); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSkLabel = class(TInterfacedObject, FSkLabel)
  private
    ControlSkLabel: TSkLabel;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure AutoSize(FAutoSize: Boolean); stdcall;
    procedure MaxLines(FValue: Integer); stdcall;
    procedure Text(const FText: WideString;
      TextStyle: FSkLabelFontStyle); stdcall;
    procedure TextSetting(FHorzAlign: TSkTextHorzAlign;
      FVertAlign: TTextAlign; FHeightMultiplier, FLetterSpacing:
      Single; FTrimming: TTextTrimming); stdcall;
    procedure Words(const FWord: WideString;
      WordsStyle: FSkLabelFontStyle); stdcall;
    procedure ChangeWords(FWordIndex: Integer;
      const FNewWord: WideString; WordsStyle: FSkLabelFontStyle); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSkAnimatedPaintBox
// =============================================================================
type
  FSkAnimatedPaintBox = interface(IUnknown)
    ['{A0B81E31-DBD3-42E4-87BB-5429874F354B}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadShader(const FShaderFile: WideString); stdcall;
    procedure RunAnim; stdcall;
    procedure StopAnim; stdcall;
    procedure InteractWithMouse(FValue: Boolean); stdcall;
    procedure RoundRect(XRadius, YRadius: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
    function SetUniformFloat(const UniformName: WideString; Value: Single): Boolean; stdcall;
    function SetUniformFloat2(const UniformName: WideString; X, Y: Single): Boolean; stdcall;
    function SetUniformFloat3(const UniformName: WideString; X, Y, Z: Single): Boolean; stdcall;
    function SetUniformFloat4(const UniformName: WideString; X, Y, Z, W: Single): Boolean; stdcall;
  end;

  TFSkAnimatedPaintBox = class(TInterfacedObject, FSkAnimatedPaintBox)
  private
    ControlSkAnimPaintBox: TSkAnimatedPaintBox;
    FBuilder: ISkRuntimeShaderBuilder;
    FPaint: ISkPaint;
    FRoundRect: Boolean;
    FRadiusX: Single;
    FRadiusY: Single;
    FLastAnimationTime: Double;
    FHasLastAnimationTime: Boolean;
    procedure OnAnimDrawAdapter(ASender: TObject; const ACanvas: ISkCanvas;
      const ADest: TRectF; const AProgress: Double; const AOpacity: Single);
    procedure OnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    function CanSetUniform(const UniformName: string;
      UniformType: TSkRuntimeEffectUniformType): Boolean;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadShader(const FShaderFile: WideString); stdcall;
    procedure RunAnim; stdcall;
    procedure StopAnim; stdcall;
    procedure InteractWithMouse(FValue: Boolean); stdcall;
    procedure RoundRect(XRadius, YRadius: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
    function SetUniformFloat(const UniformName: WideString; Value: Single): Boolean; stdcall;
    function SetUniformFloat2(const UniformName: WideString; X, Y: Single): Boolean; stdcall;
    function SetUniformFloat3(const UniformName: WideString; X, Y, Z: Single): Boolean; stdcall;
    function SetUniformFloat4(const UniformName: WideString; X, Y, Z, W: Single): Boolean; stdcall;
  end;

// =============================================================================
// FSkAnimatedImage
// =============================================================================
type
  FSkAnimatedImage = interface(IUnknown)
    ['{715AEC8C-29A9-4E00-A76D-5DAF2DE2150B}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadAnimImage(const FAnimImage: WideString); stdcall;
    procedure WrapMode(FWrapMode: TSkAnimatedImageWrapMode); stdcall;
    procedure RunAnim; stdcall;
    procedure LoopAnim(FValue: Boolean); stdcall;
    procedure ProgressAnim(FValue: Double); stdcall;
    procedure SpeedAnim(FValue: Single); stdcall;
    procedure StopAnim; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSkAnimatedImage = class(TInterfacedObject, FSkAnimatedImage)
  private
    ControlSkAnimImage: TSkAnimatedImage;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadAnimImage(const FAnimImage: WideString); stdcall;
    procedure WrapMode(FWrapMode: TSkAnimatedImageWrapMode); stdcall;
    procedure RunAnim; stdcall;
    procedure LoopAnim(FValue: Boolean); stdcall;
    procedure ProgressAnim(FValue: Double); stdcall;
    procedure SpeedAnim(FValue: Single); stdcall;
    procedure StopAnim; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSkSvg
// =============================================================================
type
  FSkSvg = interface(IUnknown)
    ['{F446CEE9-B714-4101-91D0-4606198A9931}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadSvgFile(const FSvgFile: WideString); stdcall;
    procedure WrapMode(FWrapMode: TSkSvgWrapMode); stdcall;
    procedure GrayScale(FValue: Boolean); stdcall;
    procedure OverrideColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSkSvg = class(TInterfacedObject, FSkSvg)
  private
    ControlSkSvg: TSkSvg;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadSvgFile(const FSvgFile: WideString); stdcall;
    procedure WrapMode(FWrapMode: TSkSvgWrapMode); stdcall;
    procedure GrayScale(FValue: Boolean); stdcall;
    procedure OverrideColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSkPaint
// =============================================================================
type
  FSkPaint = interface(IUnknown)
    ['{C49BB164-B684-4826-88F9-669470C0C0F9}']
    procedure FCreate; stdcall;
    procedure FCreate2(FPaintStyle: TSkPaintStyle); stdcall;
    procedure AntiAlias(FValue: Boolean); stdcall;
    procedure SetARGB(const A, R, G, B: Byte); stdcall;
    procedure ColorFilter(FColorFilter: NativeInt); stdcall;
    procedure PathEffect(FPathEffect: NativeInt); stdcall;
    procedure Dither(FValue: Boolean); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure PaintStyle(FStyle: TSkPaintStyle); stdcall;
    procedure Shader(FShader: NativeInt); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure StrokeCap(FCap: TSkStrokeCap); stdcall;
    procedure StrokeJoin(FJoin: TSkStrokeJoin); stdcall;
    procedure StrokeMiter(FMiter: Single); stdcall;
    procedure StrokeWidth(FWidth: Single); stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkPaint = class(TInterfacedObject, FSkPaint)
  private
    FPaint: ISkPaint;
  public
    procedure FCreate; stdcall;
    procedure FCreate2(FPaintStyle: TSkPaintStyle); stdcall;
    procedure AntiAlias(FValue: Boolean); stdcall;
    procedure SetARGB(const A, R, G, B: Byte); stdcall;
    procedure ColorFilter(FColorFilter: NativeInt); stdcall;
    procedure PathEffect(FPathEffect: NativeInt); stdcall;
    procedure Dither(FValue: Boolean); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure PaintStyle(FStyle: TSkPaintStyle); stdcall;
    procedure Shader(FShader: NativeInt); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure StrokeCap(FCap: TSkStrokeCap); stdcall;
    procedure StrokeJoin(FJoin: TSkStrokeJoin); stdcall;
    procedure StrokeMiter(FMiter: Single); stdcall;
    procedure StrokeWidth(FWidth: Single); stdcall;
    function Handle: NativeInt; stdcall;
  end;

// ==================================================
// FSkPaintBox
// ==================================================
type
  FSkPaintBox = Interface(IUnknown)
    ['{2D32408F-B123-47FE-BCEE-973C0A2D0C49}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure Translate(FDeltaX, FDeltaY: Single); stdcall;
    procedure Rotate(FDegrees: Single); stdcall;
    procedure AddDrawRect(FLeft, FTop, FWidth, FHeight: Single;
      FPaint: NativeInt); stdcall;
    procedure AddDrawRoundRect(FLeft, FTop, FWidth, FHeight, FRadiusX,
      FRadiusY: Single; FPaint: NativeInt); stdcall;
    procedure AddDrawRoundRect2(FRoundRect: NativeInt;
      FPaint: NativeInt); stdcall;
    procedure AddDrawCircle(CenterX, CenterY, FRadius: Single;
      FPaint: NativeInt); stdcall;
    procedure AddDrawArc(FLeft, FTop, FWidth, FHeight, FStartAngle,
      FSweepAngle: Single; FUseCenter: Boolean; FPaint: NativeInt); stdcall;
    procedure AddDrawPath(FPath: NativeInt; FPaint: NativeInt); stdcall;
    procedure AddDrawTextBlob(FTextBlob: NativeInt; X, Y: Single;
      FPaint: NativeInt); stdcall;
    procedure AddDrawParagraph(FParagraph: NativeInt; X, Y: Single); stdcall;
    procedure AddDrawSimpleText(const FText: WideString;
      X, Y: Single; FFont: NativeInt; FPaint: NativeInt); stdcall;
    procedure AddDrawImage(FImage, FPaint: NativeInt;
      X, Y: Single); stdcall;
    procedure AddDrawImageRect(FImage, FPaint: NativeInt;
      DestLeft, DestTop, DestRight, DestBottom: Single;
        Constraint: TSkSrcRectConstraint); stdcall;
    procedure AddDrawImageRect2(FImage, FPaint: NativeInt;
      SrcLeft, SrcTop, SrcRight, SrcBottom,
        DestLeft, DestTop, DestRight, DestBottom: Single;
          Constraint: TSkSrcRectConstraint); stdcall;
    procedure AddDrawImageNine(FImage, FPaint: NativeInt;
      CenterLeft, CenterTop, CenterRight, CenterBottom: Integer;
        DestLeft, DestTop, DestRight, DestBottom: Single;
          FilterMode: TSkFilterMode); stdcall;
    procedure DoDrawing; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FAngle: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enable(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FValue: Boolean); stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetOpacity: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
    procedure ClearCommands; stdcall;
  end;

  TSkDrawCommandType = (dctRect, dctRoundRect, dctRoundRect2,
    dctCircle, dctArc, dctPath, dctTextBlob, dctParagraph, dctSimpleText,
    dctImage, dctImageRect, dctImageRect2, dctImageNine);

  TSkDrawCommand = record
    CommandType: TSkDrawCommandType;

    X: Single;
    Y: Single;
    Width: Single;
    Height: Single;

    RadiusX: Single;
    RadiusY: Single;

    CenterX: Single;
    CenterY: Single;
    Radius: Single;

    StartAngle: Single;
    SweepAngle: Single;
    UseCenter: Boolean;

    Path: ISkPath;
    RoundRect: ISkRoundRect;
    Image: ISkImage;
    TextBlob: ISkTextBlob;

    Paragraph: ISkParagraph;

    Text: string;
    Font: ISkFont;

    Paint: ISkPaint;

    SrcRect: TRectF;
    DestRect: TRectF;
    CenterRect: TRect;

    FilterMode: TSkFilterMode;
    Constraint: TSkSrcRectConstraint;
  end;

  TFSkPaintBox = class(TInterfacedObject, FSkPaintBox)
  private
    FPaintBox: TSkPaintBox;
    FCommands: TArray<TSkDrawCommand>;

    procedure Draw(ASender: TObject; const ACanvas: ISkCanvas;
      const ADest: TRectF; const AOpacity: Single);
    procedure AddCommand(const ACommand: TSkDrawCommand);
  public
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure Translate(FDeltaX, FDeltaY: Single); stdcall;
    procedure Rotate(FDegrees: Single); stdcall;
    procedure AddDrawRect(FLeft, FTop, FWidth, FHeight: Single;
      FPaint: NativeInt); stdcall;
    procedure AddDrawRoundRect(FLeft, FTop, FWidth, FHeight, FRadiusX,
      FRadiusY: Single; FPaint: NativeInt); stdcall;
    procedure AddDrawRoundRect2(FRoundRect: NativeInt;
      FPaint: NativeInt); stdcall;
    procedure AddDrawCircle(CenterX, CenterY, FRadius: Single;
      FPaint: NativeInt); stdcall;
    procedure AddDrawArc(FLeft, FTop, FWidth, FHeight, FStartAngle,
      FSweepAngle: Single; FUseCenter: Boolean; FPaint: NativeInt); stdcall;
    procedure AddDrawPath(FPath: NativeInt; FPaint: NativeInt); stdcall;
    procedure AddDrawTextBlob(FTextBlob: NativeInt; X, Y: Single;
      FPaint: NativeInt); stdcall;
    procedure AddDrawParagraph(FParagraph: NativeInt; X, Y: Single); stdcall;
    procedure AddDrawSimpleText(const FText: WideString;
      X, Y: Single; FFont: NativeInt; FPaint: NativeInt); stdcall;
    procedure AddDrawImage(FImage, FPaint: NativeInt;
      X, Y: Single); stdcall;
    procedure AddDrawImageRect(FImage, FPaint: NativeInt;
      DestLeft, DestTop, DestRight, DestBottom: Single;
        Constraint: TSkSrcRectConstraint); stdcall;
    procedure AddDrawImageRect2(FImage, FPaint: NativeInt;
      SrcLeft, SrcTop, SrcRight, SrcBottom,
        DestLeft, DestTop, DestRight, DestBottom: Single;
          Constraint: TSkSrcRectConstraint); stdcall;
    procedure AddDrawImageNine(FImage, FPaint: NativeInt;
      CenterLeft, CenterTop, CenterRight, CenterBottom: Integer;
        DestLeft, DestTop, DestRight, DestBottom: Single;
          FilterMode: TSkFilterMode); stdcall;
    procedure DoDrawing; stdcall;
    procedure ClearCommands; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FAngle: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enable(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FValue: Boolean); stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetOpacity: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSkShader
// =============================================================================
type
  FSkShader = interface(IUnknown)
    ['{88042197-8BFB-4701-A9D4-27E892714B75}']
    procedure MakeColor(FColor: TAlphaColor); stdcall;
    procedure MakeGradientLinear(X1, Y1, X2, Y2: Single;
      FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode); stdcall;
    procedure MakeGradientRadial(X, Y, FRadius: Single;
      FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode); stdcall;
    procedure MakeGradientSweep(X, Y: Single;
      FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode); stdcall;
    procedure MakeGradientTwoPointConical(X1, Y1, FRadius1: Single;
      X2, Y2, FRadius2: Single; FColor1, FColor2: TAlphaColor;
      FTileMode: TSkTileMode); stdcall;
    procedure MakeImage(FImage:  NativeInt;
      FTileModeX, FTileModeY: TSkTileMode); stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkShader = class(TInterfacedObject, FSkShader)
  private
    FShader: ISkShader;
  public
    procedure MakeColor(FColor: TAlphaColor); stdcall;
    procedure MakeGradientLinear(X1, Y1, X2, Y2: Single;
      FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode); stdcall;
    procedure MakeGradientRadial(X, Y, FRadius: Single;
      FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode); stdcall;
    procedure MakeGradientSweep(X, Y: Single;
      FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode); stdcall;
    procedure MakeGradientTwoPointConical(X1, Y1, FRadius1: Single;
      X2, Y2, FRadius2: Single; FColor1, FColor2: TAlphaColor;
      FTileMode: TSkTileMode); stdcall;
    procedure MakeImage(FImage:  NativeInt;
      FTileModeX, FTileModeY: TSkTileMode); stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// FSkPathBuilder
// =============================================================================
type
  FSkPathBuilder = Interface(IUnknown)
    ['{9ADEEE45-6086-49DD-AFC0-823EC5BE5018}']
    procedure FCreate; stdcall;
    procedure FCreate2(SkPathFillTypes: TSkPathFillType); stdcall;
    procedure AddArc(X, Y, FWidth, FHeight,
      FStartAngle, FSweepAngle: Single); stdcall;
    procedure AddCircle(CenterX, CenterY, FRadius: Single;
      SkPathDirection: TSkPathDirection); stdcall;
    procedure AddOval(X, Y, FWidth, FHeight: Single;
      SkPathDirection: TSkPathDirection); stdcall;
    procedure AddRect(X, Y, FWidth, FHeight: Single;
      SkPathDirection: TSkPathDirection); stdcall;
    procedure AddRoundRect(FRoundRect: NativeInt;
      SkPathDirection: TSkPathDirection); stdcall;
    procedure AddPolygon(FPolygon: NativeInt; IsClosed: Boolean); stdcall;
    procedure AddPath(FPath: NativeInt); stdcall;
    procedure ArcTo(X1, Y1, X2, Y2, FRadius: Single); stdcall;
    procedure ArcTo2(X, Y, FWidth, FHeight, FStartAngle,
      FSweepAngle: Single; FForceMoveTo: Boolean); stdcall;
    procedure ConicTo(X1, Y1, X2, Y2, FWeight: Single); stdcall;
    procedure CubicTo(X1, Y1, X2, Y2, X3, Y3: Single); stdcall;
    procedure LineTo(X, Y: Single); stdcall;
    procedure MoveTo(X, Y: Single); stdcall;
    procedure Offset(FDeltaX, FDeltaY: Single); stdcall;
    procedure QuadTo(X1, Y1, X2, Y2: Single); stdcall;
    procedure RConicTo(X1, Y1, X2, Y2, FWeight: Single); stdcall;
    procedure RCubicTo(X1, Y1, X2, Y2, X3, Y3: Single); stdcall;
    procedure RLineTo(X, Y: Single); stdcall;
    procedure RQuadTo(X1, Y1, X2, Y2: Single); stdcall;
    procedure Reset; stdcall;
    procedure PathFillType(SkPathFillTypes: TSkPathFillType); stdcall;
    procedure ToggleInverseFillType; stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkPathBuilder = class(TInterfacedObject, FSkPathBuilder)
  private
    FBuilder: ISkPathBuilder;
    FPath: ISkPath;
  public
    procedure FCreate; stdcall;
    procedure FCreate2(SkPathFillTypes: TSkPathFillType); stdcall;
    procedure AddArc(X, Y, FWidth, FHeight,
      FStartAngle, FSweepAngle: Single); stdcall;
    procedure AddCircle(CenterX, CenterY, FRadius: Single;
      SkPathDirection: TSkPathDirection); stdcall;
    procedure AddOval(X, Y, FWidth, FHeight: Single;
      SkPathDirection: TSkPathDirection); stdcall;
    procedure AddRect(X, Y, FWidth, FHeight: Single;
      SkPathDirection: TSkPathDirection); stdcall;
    procedure AddRoundRect(FRoundRect: NativeInt;
      SkPathDirection: TSkPathDirection); stdcall;
    procedure AddPolygon(FPolygon: NativeInt; IsClosed: Boolean); stdcall;
    procedure AddPath(FPath: NativeInt); stdcall;
    procedure ArcTo(X1, Y1, X2, Y2, FRadius: Single); stdcall;
    procedure ArcTo2(X, Y, FWidth, FHeight, FStartAngle,
      FSweepAngle: Single; FForceMoveTo: Boolean); stdcall;
    procedure ConicTo(X1, Y1, X2, Y2, FWeight: Single); stdcall;
    procedure CubicTo(X1, Y1, X2, Y2, X3, Y3: Single); stdcall;
    procedure LineTo(X, Y: Single); stdcall;
    procedure MoveTo(X, Y: Single); stdcall;
    procedure Offset(FDeltaX, FDeltaY: Single); stdcall;
    procedure QuadTo(X1, Y1, X2, Y2: Single); stdcall;
    procedure RConicTo(X1, Y1, X2, Y2, FWeight: Single); stdcall;
    procedure RCubicTo(X1, Y1, X2, Y2, X3, Y3: Single); stdcall;
    procedure RLineTo(X, Y: Single); stdcall;
    procedure RQuadTo(X1, Y1, X2, Y2: Single); stdcall;
    procedure Reset; stdcall;
    procedure PathFillType(SkPathFillTypes: TSkPathFillType); stdcall;
    procedure ToggleInverseFillType; stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// FSkRoundRect
// =============================================================================
type
  FSkRoundRect = Interface(IUnknown)
    ['{2FFC738F-D78B-40E8-B33A-46C6F71400E1}']
    procedure FCreate; stdcall;
    procedure Deflate(FDeltaX, FDeltaY: Single); stdcall;
    procedure Inflate(FDeltaX, FDeltaY: Single); stdcall;
    procedure Offset(FDeltaX, FDeltaY: Single); stdcall;
    procedure SetOval(X, Y, FWidth, FHeight: Single); stdcall;
    procedure SetRect(X, Y, FWidth, FHeight: Single); stdcall;
    procedure SetRect2(X, Y, FWidth, FHeight,
      FRadiusX, FRadiusY: Single); stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkRoundRect = class(TInterfacedObject, FSkRoundRect)
  private
    FRoundRect: ISkRoundRect;
  public
    procedure FCreate; stdcall;
    procedure Deflate(FDeltaX, FDeltaY: Single); stdcall;
    procedure Inflate(FDeltaX, FDeltaY: Single); stdcall;
    procedure Offset(FDeltaX, FDeltaY: Single); stdcall;
    procedure SetOval(X, Y, FWidth, FHeight: Single); stdcall;
    procedure SetRect(X, Y, FWidth, FHeight: Single); stdcall;
    procedure SetRect2(X, Y, FWidth, FHeight,
      FRadiusX, FRadiusY: Single); stdcall;
    function Handle: NativeInt; stdcall;
  end;

// ==================================================
// FSkImage
// ==================================================
type
  FSkImage = Interface(IUnknown)
    ['{0703E29B-6813-4160-BF53-34AB4B1B33AC}']
    procedure FCreate(const FImageFile: WideString); stdcall;
    function EncodeToFile(const FOutImgFile: WideString;
      FEncodedImagesFormat: TSkEncodedImageFormat;
      FQuality: Integer): Boolean; stdcall;
    function MakeNonTextureImage: NativeInt; stdcall;
    function MakeRasterImage: NativeInt; stdcall;
    function MakeRawShader(FTileModeX, FTileModeY: TSkTileMode)
      : NativeInt; stdcall;
    function MakeShader(FTileModeX, FTileModeY: TSkTileMode): NativeInt; stdcall;
    function IsAlphaOnly: Boolean; stdcall;
    function IsOpaque: Boolean; stdcall;
    function IsTextureBacked: Boolean; stdcall;
    function GetHeight: Integer; stdcall;
    function GetWidth: Integer; stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkImage = class(TInterfacedObject, FSkImage)
  private
    FImage: ISkImage;
    FTempImage: ISkImage;
    FTempShader: ISkShader;
  public
    procedure FCreate(const FImageFile: WideString); stdcall;
    function EncodeToFile(const FOutImgFile: WideString;
      FEncodedImagesFormat: TSkEncodedImageFormat;
      FQuality: Integer): Boolean; stdcall;
    function MakeNonTextureImage: NativeInt; stdcall;
    function MakeRasterImage: NativeInt; stdcall;
    function MakeRawShader(FTileModeX, FTileModeY: TSkTileMode)
      : NativeInt; stdcall;
    function MakeShader(FTileModeX, FTileModeY: TSkTileMode): NativeInt; stdcall;
    function IsAlphaOnly: Boolean; stdcall;
    function IsOpaque: Boolean; stdcall;
    function IsTextureBacked: Boolean; stdcall;
    function GetHeight: Integer; stdcall;
    function GetWidth: Integer; stdcall;
    function Handle: NativeInt; stdcall;
  end;

// ==================================================
// FSkTypeface
// ==================================================
type
  TSkFontsStyle = (fskfsNormal, fskfsBold, fskfsItalic, fskfsBoldItalic);

  FSkTypeface = Interface(IUnknown)
    ['{BF34108B-AEF1-4674-BF85-D4397E2CF0A0}']
    procedure FCreateDefault; stdcall;
    procedure FCreateFromName(const FontName: WideString;
      SkFontsStyle: TSkFontsStyle); stdcall;
    procedure FCreateFromFile(const FontFile: WideString;
      const ATTCIndex: Integer); stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkTypeface = class(TInterfacedObject, FSkTypeface)
  private
    FTypeface: ISkTypeface;
  public
    procedure FCreateDefault; stdcall;
    procedure FCreateFromName(const FontName: WideString;
      SkFontsStyle: TSkFontsStyle); stdcall;
    procedure FCreateFromFile(const FontFile: WideString;
      const ATTCIndex: Integer); stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// FSkFont
// =============================================================================
type
  FSkFont = Interface(IUnknown)
    ['{F7B8C6F7-EB2C-42C8-9C39-5293AE7F5ADF}']
    procedure FCreate(FTypeface: NativeInt; FSize: Single); stdcall;
    procedure BaselineSnap(FValue: Boolean); stdcall;
    procedure Edging(FValue: TSkFontEdging); stdcall;
    procedure Hinting(FValue: TSkFontHinting); stdcall;
    procedure LinearMetrics(FValue: Boolean); stdcall;
    procedure Subpixel(FValue: Boolean); stdcall;
    procedure Size(FValue: Single); stdcall;
    procedure ScaleX(FValue: Single); stdcall;
    procedure SkewX(FValue: Single); stdcall;
    function GetSize: Single; stdcall;
    function GetScaleX: Single; stdcall;
    function GetSkewX: Single; stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkFont = class(TInterfacedObject, FSkFont)
  private
    FFont: ISkFont;
  public
    procedure FCreate(FTypeface: NativeInt; FSize: Single); stdcall;
    procedure BaselineSnap(FValue: Boolean); stdcall;
    procedure Edging(FValue: TSkFontEdging); stdcall;
    procedure Hinting(FValue: TSkFontHinting); stdcall;
    procedure LinearMetrics(FValue: Boolean); stdcall;
    procedure Subpixel(FValue: Boolean); stdcall;
    procedure Size(FValue: Single); stdcall;
    procedure ScaleX(FValue: Single); stdcall;
    procedure SkewX(FValue: Single); stdcall;
    function GetSize: Single; stdcall;
    function GetScaleX: Single; stdcall;
    function GetSkewX: Single; stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// FSkTextBlob
// =============================================================================
type
  FSkTextBlob = Interface(IUnknown)
    ['{990380E1-26C6-4A82-BE65-272C639A2507}']
    procedure MakeFromText(const FText: WideString; FFont: NativeInt); stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkTextBlob = class(TInterfacedObject, FSkTextBlob)
  private
    FTextBlob: ISkTextBlob;
  public
    procedure MakeFromText(const FText: WideString; FFont: NativeInt); stdcall;
    function Handle: NativeInt; stdcall;
  end;

// ==================================================
// FSkColorFilter
// ==================================================
type
  FSkColorFilter = Interface(IUnknown)
    ['{A33F1B77-148E-4883-BACA-748CBBAD637D}']
    procedure MakeBlend(FColor: TAlphaColor; BlendsMode: TSkBlendMode); stdcall;
    procedure MakeCompose(FOuter, FInner: NativeInt); stdcall;
    procedure MakeLighting(FMultiply, FAdd: TAlphaColor); stdcall;
    procedure MakeLinearToSRGBGamma; stdcall;
    procedure MakeLumaColor; stdcall;
    procedure MakeOverdraw(FColors: TSkOverdrawColor); stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkColorFilter = class(TInterfacedObject, FSkColorFilter)
  private
    FColorFilter: ISkColorFilter;
  public
    procedure MakeBlend(FColor: TAlphaColor; BlendsMode: TSkBlendMode); stdcall;
    procedure MakeCompose(FOuter, FInner: NativeInt); stdcall;
    procedure MakeLighting(FMultiply, FAdd: TAlphaColor); stdcall;
    procedure MakeLinearToSRGBGamma; stdcall;
    procedure MakeLumaColor; stdcall;
    procedure MakeOverdraw(FColors: TSkOverdrawColor); stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// FSkPathEffect
// =============================================================================
type
  TSingleArr = Array of Single;

  FSkPathEffect = Interface(IUnknown)
    ['{1AAA71FB-15D3-4500-BE00-86F1A2EC3F6F}']
    procedure Make1DPath(FPath: NativeInt; FAdvance, FPhase: Single;
      FStyle: TSkPathEffect1DStyle); stdcall;
    procedure MakeCompose(FOuter, FInner: NativeInt); stdcall;
    procedure MakeCorner(FRadius: Single); stdcall;
    procedure MakeDash(const FIntervals: TSingleArr; FPhase: Single); stdcall;
    procedure MakeDiscrete(FSegLength, FDeviation: Single;
      FSeedAssist: Cardinal); stdcall;
    procedure MakeMerge(FEffect1, FEffect2: NativeInt;
      FOp: TSkPathOp); stdcall;
    procedure MakeStroke(FWidth: Single; FJoin: TSkStrokeJoin;
      FCap: TSkStrokeCap; FMiter: Single); stdcall;
    procedure MakeStrokeAndFill; stdcall;
    procedure MakeSum(FEffect1, FEffect2: NativeInt); stdcall;
    procedure MakeTranslate(FDeltaX, FDeltaY: Single); stdcall;
    procedure MakeTrim(FStart, FStop: Single;
      FMode: TSkPathEffectTrimMode); stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkPathEffect = class(TInterfacedObject, FSkPathEffect)
  private
    FPathEffect: ISkPathEffect;
  public
    procedure Make1DPath(FPath: NativeInt; FAdvance, FPhase: Single;
      FStyle: TSkPathEffect1DStyle); stdcall;
    procedure MakeCompose(FOuter, FInner: NativeInt); stdcall;
    procedure MakeCorner(FRadius: Single); stdcall;
    procedure MakeDash(const FIntervals: TSingleArr; FPhase: Single); stdcall;
    procedure MakeDiscrete(FSegLength, FDeviation: Single;
      FSeedAssist: Cardinal); stdcall;
    procedure MakeMerge(FEffect1, FEffect2: NativeInt;
      FOp: TSkPathOp); stdcall;
    procedure MakeStroke(FWidth: Single; FJoin: TSkStrokeJoin;
      FCap: TSkStrokeCap; FMiter: Single); stdcall;
    procedure MakeStrokeAndFill; stdcall;
    procedure MakeSum(FEffect1, FEffect2: NativeInt); stdcall;
    procedure MakeTranslate(FDeltaX, FDeltaY: Single); stdcall;
    procedure MakeTrim(FStart, FStop: Single;
      FMode: TSkPathEffectTrimMode); stdcall;
    function Handle: NativeInt; stdcall;
  end;

// ==================================================
// FSkShaper
// ==================================================
type
  FSkShaper = Interface(IUnknown)
    ['{FB101C17-655A-4416-A142-EE9AEC2CFBD6}']
    procedure FCreate; stdcall;
    procedure Shape(const FText: WideString; FFont: NativeInt;
      FLeftToRight: Boolean; FWidth: Single); stdcall;
    procedure Shape2(const FText: WideString; FFont: NativeInt;
      FLeftToRight: Boolean; FWidth: Single; FOffsetX, FOffsetY: Single;
      var FEndPointX, FEndPointY: Single); stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkShaper = class(TInterfacedObject, FSkShaper)
  private
    FShaper: ISkShaper;
    FTextBlob: ISkTextBlob;
  public
    procedure FCreate; stdcall;
    procedure Shape(const FText: WideString; FFont: NativeInt;
      FLeftToRight: Boolean; FWidth: Single); stdcall;
    procedure Shape2(const FText: WideString; FFont: NativeInt;
      FLeftToRight: Boolean; FWidth: Single; FOffsetX, FOffsetY: Single;
      var FEndPointX, FEndPointY: Single); stdcall;
    function Handle: NativeInt; stdcall;
  end;

// ==================================================
// FSkParagraphStyle
// ==================================================
type
  FSkParagraphStyle = Interface(IUnknown)
    ['{1AA04254-5770-49F3-8C2F-E40911FBF550}']
    procedure FCreate; stdcall;
    procedure DisableHinting; stdcall;
    procedure Ellipsis(const FValue: WideString); stdcall;
    procedure Height(FValue: Single); stdcall;
    procedure MaxLines(FValue: Integer); stdcall;
    procedure StrutStyle(FValue: NativeInt); stdcall;
    procedure TextAlign(FValue: TSkTextAlign); stdcall;
    procedure TextDirection(FValue: TSkTextDirection); stdcall;
    procedure TextHeightBehaviors(FValue: TSkTextHeightBehaviors); stdcall;
    procedure TextStyle(FValue: NativeInt); stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkParagraphStyle = class(TInterfacedObject, FSkParagraphStyle)
  private
    FStyle: ISkParagraphStyle;
  public
    procedure FCreate; stdcall;
    procedure DisableHinting; stdcall;
    procedure Ellipsis(const FValue: WideString); stdcall;
    procedure Height(FValue: Single); stdcall;
    procedure MaxLines(FValue: Integer); stdcall;
    procedure StrutStyle(FValue: NativeInt); stdcall;
    procedure TextAlign(FValue: TSkTextAlign); stdcall;
    procedure TextDirection(FValue: TSkTextDirection); stdcall;
    procedure TextHeightBehaviors(FValue: TSkTextHeightBehaviors); stdcall;
    procedure TextStyle(FValue: NativeInt); stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// FSkTextStyle
// =============================================================================
type
  FSkTextStyle = Interface(IUnknown)
    ['{F06B36B2-CCB6-42B4-9DF3-8A7F4143B1CA}']
    procedure FCreate; stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure FontSize(FValue: Single); stdcall;
    procedure FontStyle(FFontWeight: TFontWeight; FFontWidth: TSkFontWidth;
      FFontSlant: TFontSlant); stdcall;
    procedure ClearFontFamilies; stdcall;
    procedure AddFontFamily(const FFontFamily: WideString); stdcall;
    procedure LetterSpacing(FValue: Single); stdcall;
    procedure WordSpacing(FValue: Single); stdcall;
    procedure Locale(const FValue: WideString); stdcall;
    procedure HeightMultiplier(FValue: Single); stdcall;
    procedure HalfLeading(FValue: Boolean); stdcall;
    procedure Decorations(FValue: Cardinal); stdcall;
    procedure DecorationColor(FColor: TAlphaColor); stdcall;
    procedure DecorationStyle(FValue: TSkTextDecorationStyle); stdcall;
    procedure DecorationThickness(FValue: Single); stdcall;
    procedure ClearBackgroundColor; stdcall;
    procedure ClearForegroundColor; stdcall;
    procedure ResetFontFeatures; stdcall;
    procedure ResetShadows; stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkTextStyle = class(TInterfacedObject, FSkTextStyle)
  private
    FTextStyle: ISkTextStyle;
    FFontFamilies: TArray<string>;
  public
    procedure FCreate; stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure FontSize(FValue: Single); stdcall;
    procedure FontStyle(FFontWeight: TFontWeight; FFontWidth: TSkFontWidth;
      FFontSlant: TFontSlant); stdcall;
    procedure ClearFontFamilies; stdcall;
    procedure AddFontFamily(const FFontFamily: WideString); stdcall;
    procedure LetterSpacing(FValue: Single); stdcall;
    procedure WordSpacing(FValue: Single); stdcall;
    procedure Locale(const FValue: WideString); stdcall;
    procedure HeightMultiplier(FValue: Single); stdcall;
    procedure HalfLeading(FValue: Boolean); stdcall;
    procedure Decorations(FValue: Cardinal); stdcall;
    procedure DecorationColor(FColor: TAlphaColor); stdcall;
    procedure DecorationStyle(FValue: TSkTextDecorationStyle); stdcall;
    procedure DecorationThickness(FValue: Single); stdcall;
    procedure ClearBackgroundColor; stdcall;
    procedure ClearForegroundColor; stdcall;
    procedure ResetFontFeatures; stdcall;
    procedure ResetShadows; stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// FSkParagraphBuilder
// =============================================================================
type
  FSkParagraphBuilder = Interface(IUnknown)
    ['{73F4AF2D-E844-48B1-B9D8-933ECF4FA653}']
    procedure FCreate(FParagraphStyle: NativeInt); stdcall;
    procedure PushStyle(FTextStyle: NativeInt); stdcall;
    procedure Pop; stdcall;
    procedure AddText(const FText: WideString); stdcall;
    procedure Build; stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkParagraphBuilder = class(TInterfacedObject, FSkParagraphBuilder)
  private
    FBuilder: ISkParagraphBuilder;
    FParagraph: ISkParagraph;
  public
    procedure FCreate(FParagraphStyle: NativeInt); stdcall;
    procedure PushStyle(FTextStyle: NativeInt); stdcall;
    procedure Pop; stdcall;
    procedure AddText(const FText: WideString); stdcall;
    procedure Build; stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// FSkParagraph
// =============================================================================
type
  FSkParagraph = Interface(IUnknown)
    ['{BC918D4C-8D5B-44CD-8E02-269EF3B3DAF0}']
    procedure FCreate(FParagraphBuilder: NativeInt); stdcall;
    procedure Layout(FWidth: Single); stdcall;
    function ToPath: NativeInt; stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFSkParagraph = class(TInterfacedObject, FSkParagraph)
  private
    FParagraph: ISkParagraph;
    FPath: ISkPath;
  public
    procedure FCreate(FParagraphBuilder: NativeInt); stdcall;
    procedure Layout(FWidth: Single); stdcall;
    function ToPath: NativeInt; stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// FPolygon
// =============================================================================
type
  FPolygon = Interface(IUnknown)
    ['{C0528FFC-42A2-44E6-BBB4-FFB7B67BC2B3}']
    procedure SetLen(FLength: Integer); stdcall;
    procedure AddValue(FIndex: Integer; FV1, FV2: Single); stdcall;
    function GetLen: Integer; stdcall;
    function Handle: NativeInt; stdcall;
  end;

  TFPolygon = class(TInterfacedObject, FPolygon)
  private
    FPolygon: TPolygon;
  public
    procedure SetLen(FLength: Integer); stdcall;
    procedure AddValue(FIndex: Integer; FV1, FV2: Single); stdcall;
    function GetLen: Integer; stdcall;
    function Handle: NativeInt; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitSkLabelFontStyle: FSkLabelFontStyle; stdcall;
function InitSkLabel: FSkLabel; stdcall;
function InitSkAnimatedPaintBox: FSkAnimatedPaintBox; stdcall;
function InitSkAnimatedImage: FSkAnimatedImage; stdcall;
function InitSkSvg: FSkSvg; stdcall;
function InitSkPaint: FSkPaint; stdcall;
function InitSkPaintBox: FSkPaintBox; stdcall;
function InitSkShader: FSkShader; stdcall;
function InitSkPathBuilder: FSkPathBuilder; stdcall;
function InitSkRoundRect: FSkRoundRect; stdcall;
function InitSkImage: FSkImage; stdcall;
function InitSkTypeface: FSkTypeface; stdcall;
function InitSkFont: FSkFont; stdcall;
function InitSkTextBlob: FSkTextBlob; stdcall;
function InitSkColorFilter: FSkColorFilter; stdcall;
function InitSkPathEffect: FSkPathEffect; stdcall;
function InitSkShaper: FSkShaper; stdcall;
function InitSkParagraphStyle: FSkParagraphStyle; stdcall;
function InitSkTextStyle: FSkTextStyle; stdcall;
function InitSkParagraphBuilder: FSkParagraphBuilder; stdcall;
function InitSkParagraph: FSkParagraph; stdcall;
function InitPolygon: FPolygon; stdcall;
procedure InstallSkiaFonts(FontFile: WideString); stdcall;

implementation

uses
  System.IOUtils, System.Math,
  Winapi.Windows;

function FontWeightToSkia(AValue: Integer): Integer;
begin
  case AValue of
    0: Result := 100;
    1: Result := 200;
    2: Result := 300;
    3: Result := 350;
    4: Result := 400;
    5: Result := 500;
    6: Result := 600;
    7: Result := 700;
    8: Result := 800;
    9: Result := 900;
    10: Result := 1000;
  else
    Result := 400;
  end;
end;

function FontSlantToSkia(AValue: Integer): TSkFontSlant;
begin
  case AValue of
    0: Result := TSkFontSlant.Upright;
    1: Result := TSkFontSlant.Italic;
    2: Result := TSkFontSlant.Oblique;
  else
    Result := TSkFontSlant.Upright;
  end;
end;

// =============================================================================
// FSkLabelFontStyle
// =============================================================================
constructor TFSkLabelFontStyle.Create;
begin
  inherited;
  FFontSize := 14;
  FFontColor := TAlphaColorRec.Black;
  FFontWeight := TFontWeight.Regular;
  FDecorationsSet := [];
  FDecorationStyle := TSkTextDecorationStyle.Solid;
  FDecorationColor := TAlphaColorRec.Null;
  FDecorationStrokeColor := TAlphaColorRec.Null;
  FDecorationThickness := 1;
  FCursor := crDefault;
  FOnClick := nil;
end;

destructor TFSkLabelFontStyle.Destroy;
begin
  inherited;
end;

procedure TFSkLabelFontStyle.FontName(const FontName: WideString);
begin
  FFontName := FontName;
end;

procedure TFSkLabelFontStyle.FontSize(FSize: Single);
begin
  FFontSize := FSize;
end;

procedure TFSkLabelFontStyle.FontColor(FColor: TAlphaColor);
begin
  FFontColor := TAlphaColor(FColor);
end;

procedure TFSkLabelFontStyle.FontWeight(FWeight: TFontWeight);
begin
  FFontWeight := FWeight;
end;

procedure TFSkLabelFontStyle.FontSlant(FSlant: TFontSlant);
begin
  FFontSlant := FSlant;
end;

procedure TFSkLabelFontStyle.FontStretch(FStretch: TFontStretch);
begin
  FFontStretch := FStretch;
end;

procedure TFSkLabelFontStyle.BackgroundColor(FColor: TAlphaColor);
begin
  FBackgroundColor := TAlphaColor(FColor);
end;

procedure TFSkLabelFontStyle.Decorations(FDecorations: TSkTextDecorations);
begin
  FDecorationsSet := FDecorations;
end;

procedure TFSkLabelFontStyle.DecorationStyle(FStyle: TSkTextDecorationStyle);
begin
  FDecorationStyle := FStyle;
end;

procedure TFSkLabelFontStyle.DecorationColor(FColor: TAlphaColor);
begin
  FDecorationColor := TAlphaColor(FColor);
end;

procedure TFSkLabelFontStyle.DecorationStrokeColor(FStrokeColor: TAlphaColor);
begin
  FDecorationStrokeColor := TAlphaColor(FStrokeColor);
end;

procedure TFSkLabelFontStyle.DecorationThickness(FThickness: Single);
begin
  FDecorationThickness := FThickness;
end;

procedure TFSkLabelFontStyle.Cursor(ACursor: TCursor);
begin
  FCursor := ACursor;
end;

procedure TFSkLabelFontStyle.OnClick(Event: TNotifyEvent);
begin
  FOnClick := Event;
end;

// =============================================================================
// FSkLabel
// =============================================================================
procedure TFSkLabel.FCreate(FParent: TFmxObject);
begin
  ControlSkLabel := TSkLabel.Create(nil);
  ControlSkLabel.Parent := FParent;
end;

procedure TFSkLabel.Left(FLeft: Single);
begin
  ControlSkLabel.Position.X := FLeft;
end;

procedure TFSkLabel.Top(FTop: Single);
begin
  ControlSkLabel.Position.Y := FTop;
end;

procedure TFSkLabel.Height(FHeight: Single);
begin
  ControlSkLabel.Size.Height := FHeight;
end;

procedure TFSkLabel.Width(FWidth: Single);
begin
  ControlSkLabel.Size.Width := FWidth;
end;

procedure TFSkLabel.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlSkLabel.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSkLabel.Position(X, Y: Single);
begin
  ControlSkLabel.Position.X := X;
  ControlSkLabel.Position.Y := Y;
end;

procedure TFSkLabel.Align(Al: TAlignLayout);
begin
  ControlSkLabel.Align := Al;
end;

procedure TFSkLabel.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSkLabel.Margins.Left := FLeft;
  ControlSkLabel.Margins.Top := FTop;
  ControlSkLabel.Margins.Right := FRight;
  ControlSkLabel.Margins.Bottom := FBottom;
end;

procedure TFSkLabel.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSkLabel.Padding.Left := FLeft;
  ControlSkLabel.Padding.Top := FTop;
  ControlSkLabel.Padding.Right := FRight;
  ControlSkLabel.Padding.Bottom := FBottom;
end;

procedure TFSkLabel.SetHint(const FText: WideString);
begin
  ControlSkLabel.ShowHint := True;
  ControlSkLabel.Hint := FText;
end;

procedure TFSkLabel.SetClipChildren(FValue: Boolean);
begin
  ControlSkLabel.ClipChildren := FValue;
end;

procedure TFSkLabel.SetClipParent(FValue: Boolean);
begin
  ControlSkLabel.ClipParent := FValue;
end;

procedure TFSkLabel.BringToFront;
begin
  ControlSkLabel.BringToFront;
end;

procedure TFSkLabel.SendToBack;
begin
  ControlSkLabel.SendToBack;
end;

procedure TFSkLabel.SetTag(FTag: Integer);
begin
  ControlSkLabel.Tag := FTag;
end;

procedure TFSkLabel.AutoSize(FAutoSize: Boolean);
begin
  ControlSkLabel.AutoSize := FAutoSize;
end;

procedure TFSkLabel.MaxLines(FValue: Integer);
begin
  ControlSkLabel.TextSettings.MaxLines := FValue;
end;

procedure TFSkLabel.Text(const FText: WideString;
  TextStyle: FSkLabelFontStyle);
var
  S: TFSkLabelFontStyle;
begin
  if ControlSkLabel = nil then
    Exit;

  if TextStyle = nil then
  begin
    ControlSkLabel.BeginUpdate;
    try
      ControlSkLabel.Text := FText;
    finally
      ControlSkLabel.EndUpdate;
    end;
    ControlSkLabel.Repaint;
    Exit;
  end;

  S := TextStyle as TFSkLabelFontStyle;

  ControlSkLabel.StyledSettings := [];

  ControlSkLabel.BeginUpdate;
  try
    ControlSkLabel.Text := FText;

    ControlSkLabel.TextSettings.Font.BeginUpdate;
    try
      ControlSkLabel.TextSettings.Font.Families := S.FFontName;
      ControlSkLabel.TextSettings.Font.Size := S.FFontSize;
      ControlSkLabel.TextSettings.Font.Weight := S.FFontWeight;
      ControlSkLabel.TextSettings.Font.Slant := S.FFontSlant;
      ControlSkLabel.TextSettings.Font.Stretch := S.FFontStretch;
    finally
      ControlSkLabel.TextSettings.Font.EndUpdate;
    end;

    ControlSkLabel.TextSettings.FontColor := TAlphaColor(S.FFontColor);
    ControlSkLabel.TextSettings.Decorations.Decorations := S.FDecorationsSet;
    ControlSkLabel.TextSettings.Decorations.Style := S.FDecorationStyle;
    ControlSkLabel.TextSettings.Decorations.Color := S.FDecorationColor;
    ControlSkLabel.TextSettings.Decorations.StrokeColor := S.FDecorationStrokeColor;
    ControlSkLabel.TextSettings.Decorations.Thickness := S.FDecorationThickness;

    ControlSkLabel.Cursor := S.FCursor;
    if Assigned(S.FOnClick) then
      ControlSkLabel.OnClick := S.FOnClick;

  finally
    ControlSkLabel.EndUpdate;
  end;

  ControlSkLabel.Repaint;
end;

procedure TFSkLabel.TextSetting(FHorzAlign: TSkTextHorzAlign;
  FVertAlign: TTextAlign; FHeightMultiplier, FLetterSpacing:
  Single; FTrimming: TTextTrimming);
begin
  ControlSkLabel.TextSettings.HorzAlign := FHorzAlign;
  ControlSkLabel.TextSettings.VertAlign := FVertAlign;
  ControlSkLabel.TextSettings.HeightMultiplier := FHeightMultiplier;
  ControlSkLabel.TextSettings.Trimming := FTrimming;
end;

procedure TFSkLabel.Words(const FWord: WideString;
  WordsStyle: FSkLabelFontStyle);
var
  S: TFSkLabelFontStyle;
  NewItem: TSkLabel.TCustomWordsItem;
begin
  if ControlSkLabel = nil then
    Exit;

  S := WordsStyle as TFSkLabelFontStyle;

  ControlSkLabel.StyledSettings := [];

  NewItem := ControlSkLabel.Words.Add;

  NewItem.BeginUpdate;
  try
    NewItem.Text := FWord;

    NewItem.Font.BeginUpdate;
    try
      NewItem.Font.Families := S.FFontName;
      NewItem.Font.Size := S.FFontSize;
      NewItem.Font.Weight := S.FFontWeight;
      NewItem.Font.Slant := S.FFontSlant;
      NewItem.Font.Stretch := S.FFontStretch;
    finally
      NewItem.Font.EndUpdate;
    end;

      NewItem.FontColor := TAlphaColor(S.FFontColor);
      NewItem.BackgroundColor := S.FBackgroundColor;
      NewItem.Decorations.Decorations := S.FDecorationsSet;
      NewItem.Decorations.Style := S.FDecorationStyle;
      NewItem.Decorations.Color := S.FDecorationColor;
      NewItem.Decorations.StrokeColor := S.FDecorationStrokeColor;
      NewItem.Decorations.Thickness := S.FDecorationThickness;
      NewItem.Cursor := S.FCursor;
      NewItem.OnClick := S.FOnClick;

    finally
      NewItem.EndUpdate;
  end;

  ControlSkLabel.Repaint;
end;

procedure TFSkLabel.ChangeWords(FWordIndex: Integer;
      const FNewWord: WideString; WordsStyle: FSkLabelFontStyle);
var
  S: TFSkLabelFontStyle;
  TargetItem: TSkLabel.TCustomWordsItem;
begin
  if (ControlSkLabel = nil) or (FWordIndex < 0) or
       (FWordIndex >= ControlSkLabel.Words.Count) then Exit;

  TargetItem := ControlSkLabel.Words[FWordIndex];

  if WordsStyle = nil then
  begin
    TargetItem.BeginUpdate;
    try
      TargetItem.Text := FNewWord;
    finally
      TargetItem.EndUpdate;
    end;
    ControlSkLabel.Repaint;
    Exit;
  end;

  S := WordsStyle as TFSkLabelFontStyle;

  TargetItem.BeginUpdate;
  try
    TargetItem.Text := FNewWord;

    TargetItem.Font.BeginUpdate;
    try
      TargetItem.Font.Families := S.FFontName;
      TargetItem.Font.Size := S.FFontSize;
      TargetItem.Font.Weight := S.FFontWeight;
      TargetItem.Font.Slant := S.FFontSlant;
      TargetItem.Font.Stretch := S.FFontStretch;
    finally
      TargetItem.Font.EndUpdate;
    end;

    TargetItem.FontColor := TAlphaColor(S.FFontColor);
    TargetItem.BackgroundColor := S.FBackgroundColor;
    TargetItem.Decorations.Decorations := S.FDecorationsSet;
    TargetItem.Decorations.Style := S.FDecorationStyle;
    TargetItem.Decorations.Color := S.FDecorationColor;
    TargetItem.Decorations.StrokeColor := S.FDecorationStrokeColor;
    TargetItem.Decorations.Thickness := S.FDecorationThickness;
    TargetItem.Cursor := S.FCursor;
    TargetItem.OnClick := S.FOnClick;

  finally
    TargetItem.EndUpdate;
  end;

  ControlSkLabel.Repaint;
end;

procedure TFSkLabel.Opacity(FOpacity: Single);
begin
  ControlSkLabel.Opacity := FOpacity;
end;

procedure TFSkLabel.RotationAngle(FValue: Single);
begin
  ControlSkLabel.RotationAngle := FValue;
end;

procedure TFSkLabel.RotationCenter(X, Y: Single);
begin
  ControlSkLabel.RotationCenter.X := X;
  ControlSkLabel.RotationCenter.Y := Y;
end;

procedure TFSkLabel.Enabled(FEnabled: Boolean);
begin
  ControlSkLabel.Enabled := FEnabled;
end;

procedure TFSkLabel.Visible(FVisible: Boolean);
begin
  ControlSkLabel.Visible := FVisible;
end;

procedure TFSkLabel.HitTest(FEnabled: Boolean);
begin
  ControlSkLabel.HitTest := FEnabled;
end;

function TFSkLabel.IsVisible: Boolean;
begin
  Result := ControlSkLabel.Visible;
end;

function TFSkLabel.GetTag: Integer;
begin
  Result := ControlSkLabel.Tag;
end;

function TFSkLabel.GetLeft: Single;
begin
  Result := ControlSkLabel.Position.X;
end;

function TFSkLabel.GetTop: Single;
begin
  Result := ControlSkLabel.Position.Y;
end;

function TFSkLabel.GetHeight: Single;
begin
  Result := ControlSkLabel.Height;
end;

function TFSkLabel.GetWidth: Single;
begin
  Result := ControlSkLabel.Width;
end;

function TFSkLabel.GetObject: TFmxObject;
begin
  Result := ControlSkLabel;
end;

procedure TFSkLabel.OnClick(Event: TNotifyEvent);
begin
  ControlSkLabel.OnClick := Event;
end;

procedure TFSkLabel.OnMouseDown(Event: TMouseEvent);
begin
  ControlSkLabel.OnMouseDown := Event;
end;

procedure TFSkLabel.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSkLabel.OnMouseEnter := Event;
end;

procedure TFSkLabel.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSkLabel.OnMouseLeave := Event;
end;

procedure TFSkLabel.OnMouseUp(Event: TMouseEvent);
begin
  ControlSkLabel.OnMouseUp := Event;
end;

function TFSkLabel.Handle: TFmxObject;
begin
  Result := ControlSkLabel;
end;

// =============================================================================
// FSkAnimatedPaintBox
// =============================================================================
procedure TFSkAnimatedPaintBox.FCreate(FParent: TFmxObject);
begin
  ControlSkAnimPaintBox := TSkAnimatedPaintBox.Create(nil);
  ControlSkAnimPaintBox.Parent := TFmxObject(FParent);

  ControlSkAnimPaintBox.Animation.Enabled := False;
  ControlSkAnimPaintBox.Animation.Stop;
  ControlSkAnimPaintBox.OnAnimationDraw := OnAnimDrawAdapter;
  ControlSkAnimPaintBox.OnMouseMove := OnMouseMove;
end;

procedure TFSkAnimatedPaintBox.Cursor(FCursor: TCursor);
begin
  ControlSkAnimPaintBox.Cursor := TCursor(FCursor);
end;

procedure TFSkAnimatedPaintBox.Left(FLeft: Single);
begin
  ControlSkAnimPaintBox.Position.X := FLeft;
end;

procedure TFSkAnimatedPaintBox.Top(FTop: Single);
begin
  ControlSkAnimPaintBox.Position.Y := FTop;
end;

procedure TFSkAnimatedPaintBox.Height(FHeight: Single);
begin
  ControlSkAnimPaintBox.Size.Height := FHeight;
end;

procedure TFSkAnimatedPaintBox.Width(FWidth: Single);
begin
  ControlSkAnimPaintBox.Size.Width := FWidth;
end;

procedure TFSkAnimatedPaintBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlSkAnimPaintBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSkAnimatedPaintBox.Position(X, Y: Single);
begin
  ControlSkAnimPaintBox.Position.X := X;
  ControlSkAnimPaintBox.Position.Y := Y;
end;

procedure TFSkAnimatedPaintBox.Align(Al: TAlignLayout);
begin
  ControlSkAnimPaintBox.Align := TAlignLayout(Al);
end;

procedure TFSkAnimatedPaintBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSkAnimPaintBox.Margins.Left := FLeft;
  ControlSkAnimPaintBox.Margins.Top := FTop;
  ControlSkAnimPaintBox.Margins.Right := FRight;
  ControlSkAnimPaintBox.Margins.Bottom := FBottom;
end;

procedure TFSkAnimatedPaintBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSkAnimPaintBox.Padding.Left := FLeft;
  ControlSkAnimPaintBox.Padding.Top := FTop;
  ControlSkAnimPaintBox.Padding.Right := FRight;
  ControlSkAnimPaintBox.Padding.Bottom := FBottom;
end;

procedure TFSkAnimatedPaintBox.SetHint(const FText: WideString);
begin
  ControlSkAnimPaintBox.ShowHint := True;
  ControlSkAnimPaintBox.Hint := string(FText);
end;

procedure TFSkAnimatedPaintBox.SetClipChildren(FValue: Boolean);
begin
  ControlSkAnimPaintBox.ClipChildren := FValue;
end;

procedure TFSkAnimatedPaintBox.SetClipParent(FValue: Boolean);
begin
  ControlSkAnimPaintBox.ClipParent := FValue;
end;

procedure TFSkAnimatedPaintBox.BringToFront;
begin
  ControlSkAnimPaintBox.BringToFront;
end;

procedure TFSkAnimatedPaintBox.SendToBack;
begin
  ControlSkAnimPaintBox.SendToBack;
end;

procedure TFSkAnimatedPaintBox.SetTag(FTag: Integer);
begin
  ControlSkAnimPaintBox.Tag := FTag;
end;

procedure TFSkAnimatedPaintBox.OnAnimDrawAdapter(ASender: TObject;
  const ACanvas: ISkCanvas; const ADest: TRectF; const AProgress: Double;
  const AOpacity: Single);
var
  Time, TimeDelta: Double;
  W, H: Single;
begin
  if not Assigned(FBuilder) or not Assigned(FPaint) then
    Exit;

  Time := ControlSkAnimPaintBox.Animation.CurrentTime;

  if FBuilder.Effect.UniformExists('iTime') and
    (FBuilder.Effect.UniformTypeCountByName['iTime'] = 1) and
    (FBuilder.Effect.UniformTypeByName['iTime'] =
      TSkRuntimeEffectUniformType.Float) then
    FBuilder.SetUniform('iTime', Time);

  if FBuilder.Effect.UniformExists('iTimeDelta') and
    (FBuilder.Effect.UniformTypeCountByName['iTimeDelta'] = 1) and
    (FBuilder.Effect.UniformTypeByName['iTimeDelta'] =
      TSkRuntimeEffectUniformType.Float) then
  begin
    if FHasLastAnimationTime then
    begin
      TimeDelta := Time - FLastAnimationTime;
      if TimeDelta < 0 then
        TimeDelta := 0;
    end
    else
      TimeDelta := 0;

    FBuilder.SetUniform('iTimeDelta', TimeDelta);
  end;

  FLastAnimationTime := Time;
  FHasLastAnimationTime := True;

  if FBuilder.Effect.UniformExists('iResolution') and
    (FBuilder.Effect.UniformTypeCountByName['iResolution'] = 1) then
  begin
    W := Max(ADest.Width, 1);
    H := Max(ADest.Height, 1);

    case FBuilder.Effect.UniformTypeByName['iResolution'] of
      TSkRuntimeEffectUniformType.Float2:
        FBuilder.SetUniform('iResolution', TPointF.Create(W, H));

      TSkRuntimeEffectUniformType.Float3:
        FBuilder.SetUniform('iResolution', [W, H, 0]);

      TSkRuntimeEffectUniformType.Int2:
        FBuilder.SetUniform('iResolution',
          TSkRuntimeEffectInt2.Create(Integer(Round(W)), Integer(Round(H))));

      TSkRuntimeEffectUniformType.Int3:
        FBuilder.SetUniform('iResolution',
          TSkRuntimeEffectInt3.Create(Integer(Round(W)), Integer(Round(H)), 0));
    end;
  end;

  FPaint.Shader := FBuilder.MakeShader;

  if FRoundRect then
    ACanvas.DrawRoundRect(ADest, FRadiusX, FRadiusY, FPaint)
  else
    ACanvas.DrawRect(ADest, FPaint);
end;

procedure TFSkAnimatedPaintBox.LoadShader(const FShaderFile: WideString);
var
  Code, Err: string;
  LEffect: ISkRuntimeEffect;
  w, h: Single;
begin
  if not Assigned(ControlSkAnimPaintBox) then
    Exit;

  Code := TFile.ReadAllText(string(FShaderFile), TEncoding.UTF8);

  Err := '';

  LEffect := TSkRuntimeEffect.MakeForShader(Code, Err);

  // Error log
  {TFile.WriteAllText(
    TPath.Combine(TPath.GetTempPath, 'SynthwaveShader.log'),
    'Effect nil: ' + BoolToStr(LEffect = nil, True) +
    sLineBreak +
    'Compiler error: ' + Err,
    TEncoding.UTF8
  );}

  if LEffect = nil then
    raise Exception.Create('SkSL error: ' + Err);

  FBuilder := TSkRuntimeShaderBuilder.Create(LEffect);
  FPaint := TSkPaint.Create;
  FPaint.AntiAlias := True;

  FHasLastAnimationTime := False;

  w := Max(ControlSkAnimPaintBox.Width, 1);
  h := Max(ControlSkAnimPaintBox.Height, 1);

  if FBuilder.Effect.UniformExists('iResolution') and
    (FBuilder.Effect.UniformTypeCountByName['iResolution'] = 1) then
  begin
    case FBuilder.Effect.UniformTypeByName['iResolution'] of
      TSkRuntimeEffectUniformType.Float2:
        FBuilder.SetUniform('iResolution', TPointF.Create(w, h));

      TSkRuntimeEffectUniformType.Float3:
        FBuilder.SetUniform('iResolution', [w, h, 0]);

      TSkRuntimeEffectUniformType.Int2:
        FBuilder.SetUniform('iResolution',
          TSkRuntimeEffectInt2.Create(Integer(Round(w)), Integer(Round(h))));

      TSkRuntimeEffectUniformType.Int3:
        FBuilder.SetUniform('iResolution',
          TSkRuntimeEffectInt3.Create(Integer(Round(w)), Integer(Round(h)), 0));
    end;
  end;

  if FBuilder.Effect.UniformExists('iMouse') and
    (FBuilder.Effect.UniformTypeCountByName['iMouse'] = 1) then
  begin
    case FBuilder.Effect.UniformTypeByName['iMouse'] of
      TSkRuntimeEffectUniformType.Float2:
        FBuilder.SetUniform('iMouse', TPointF.Create(0, 0));

      TSkRuntimeEffectUniformType.Float4:
        FBuilder.SetUniform('iMouse', [0, 0, 0, 0]);
    end;
  end;

  if FBuilder.Effect.UniformExists('iTime') and
    (FBuilder.Effect.UniformTypeCountByName['iTime'] = 1) and
    (FBuilder.Effect.UniformTypeByName['iTime'] =
      TSkRuntimeEffectUniformType.Float) then
    FBuilder.SetUniform('iTime', 0.0);

  if FBuilder.Effect.UniformExists('iTimeDelta') and
    (FBuilder.Effect.UniformTypeCountByName['iTimeDelta'] = 1) and
    (FBuilder.Effect.UniformTypeByName['iTimeDelta'] =
      TSkRuntimeEffectUniformType.Float) then
    FBuilder.SetUniform('iTimeDelta', 0.0);

  FPaint.Shader := FBuilder.MakeShader;

  ControlSkAnimPaintBox.Repaint;
end;


function TFSkAnimatedPaintBox.CanSetUniform(const UniformName: string;
  UniformType: TSkRuntimeEffectUniformType): Boolean;
begin
  Result := False;

  if (FBuilder = nil) or (ControlSkAnimPaintBox = nil) or
    (UniformName = '') then
    Exit;

  // These uniforms are supplied internally by the draw and mouse callbacks.
  if (UniformName = 'iResolution') or (UniformName = 'iTime') or
    (UniformName = 'iTimeDelta') or (UniformName = 'iMouse') then
    Exit;

  if not FBuilder.Effect.UniformExists(UniformName) then
    Exit;

  // These setters accept one scalar/vector value, not an array uniform.
  if FBuilder.Effect.UniformTypeCountByName[UniformName] <> 1 then
    Exit;

  Result := FBuilder.Effect.UniformTypeByName[UniformName] = UniformType;
end;

function TFSkAnimatedPaintBox.SetUniformFloat(
  const UniformName: WideString; Value: Single): Boolean;
var
  LName: string;
begin
  LName := string(UniformName);
  Result := CanSetUniform(LName, TSkRuntimeEffectUniformType.Float);
  if not Result then
    Exit;

  FBuilder.SetUniform(LName, Value);
  ControlSkAnimPaintBox.Repaint;
end;

function TFSkAnimatedPaintBox.SetUniformFloat2(
  const UniformName: WideString; X, Y: Single): Boolean;
var
  LName: string;
begin
  LName := string(UniformName);
  Result := CanSetUniform(LName, TSkRuntimeEffectUniformType.Float2);
  if not Result then
    Exit;

  FBuilder.SetUniform(LName, TPointF.Create(X, Y));
  ControlSkAnimPaintBox.Repaint;
end;

function TFSkAnimatedPaintBox.SetUniformFloat3(
  const UniformName: WideString; X, Y, Z: Single): Boolean;
var
  LName: string;
begin
  LName := string(UniformName);
  Result := CanSetUniform(LName, TSkRuntimeEffectUniformType.Float3);
  if not Result then
    Exit;

  FBuilder.SetUniform(LName, [X, Y, Z]);
  ControlSkAnimPaintBox.Repaint;
end;

function TFSkAnimatedPaintBox.SetUniformFloat4(
  const UniformName: WideString; X, Y, Z, W: Single): Boolean;
var
  LName: string;
begin
  LName := string(UniformName);
  Result := CanSetUniform(LName, TSkRuntimeEffectUniformType.Float4);
  if not Result then
    Exit;

  FBuilder.SetUniform(LName, [X, Y, Z, W]);
  ControlSkAnimPaintBox.Repaint;
end;

procedure TFSkAnimatedPaintBox.RunAnim;
begin
  FHasLastAnimationTime := False;

  if Assigned(ControlSkAnimPaintBox) and
    Assigned(ControlSkAnimPaintBox.Animation) then
  begin
    ControlSkAnimPaintBox.Animation.Duration := MaxSingle;
    ControlSkAnimPaintBox.Animation.Loop := True;
    ControlSkAnimPaintBox.Animation.Enabled := True;
    ControlSkAnimPaintBox.Animation.Start;
  end;
end;

procedure TFSkAnimatedPaintBox.StopAnim;
begin
  FHasLastAnimationTime := False;

  if Assigned(ControlSkAnimPaintBox) and
    Assigned(ControlSkAnimPaintBox.Animation) then
  begin
    ControlSkAnimPaintBox.Animation.Stop;
    ControlSkAnimPaintBox.Animation.Enabled := False;
  end;
end;

procedure TFSkAnimatedPaintBox.InteractWithMouse(FValue: Boolean);
begin
  if FValue then
    ControlSkAnimPaintBox.OnMouseMove := OnMouseMove
  else
    ControlSkAnimPaintBox.OnMouseMove := nil;
  ControlSkAnimPaintBox.HitTest := FValue;
end;

procedure TFSkAnimatedPaintBox.OnMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Single);
begin
  if not Assigned(FBuilder) or not Assigned(ControlSkAnimPaintBox) then
    Exit;

  if not FBuilder.Effect.UniformExists('iMouse') or
    (FBuilder.Effect.UniformTypeCountByName['iMouse'] <> 1) then
    Exit;

  case FBuilder.Effect.UniformTypeByName['iMouse'] of
    TSkRuntimeEffectUniformType.Float2:
      begin
        FBuilder.SetUniform('iMouse', TPointF.Create(X, Y));
        ControlSkAnimPaintBox.Repaint;
      end;

    TSkRuntimeEffectUniformType.Float4:
      begin
        FBuilder.SetUniform('iMouse', [X, Y, 0, IfThen(ssLeft in Shift, 1, 0)]);
        ControlSkAnimPaintBox.Repaint;
      end;
  end;
end;

procedure TFSkAnimatedPaintBox.RoundRect(XRadius, YRadius: Single);
begin
  FRoundRect := True;
  FRadiusX := XRadius;
  FRadiusY := YRadius;

  if Assigned(ControlSkAnimPaintBox) then
    ControlSkAnimPaintBox.Repaint;
end;

procedure TFSkAnimatedPaintBox.Opacity(FOpacity: Single);
begin
  ControlSkAnimPaintBox.Opacity := FOpacity;
end;

procedure TFSkAnimatedPaintBox.RotationAngle(FValue: Single);
begin
  ControlSkAnimPaintBox.RotationAngle := FValue;
end;

procedure TFSkAnimatedPaintBox.RotationCenter(X, Y: Single);
begin
  ControlSkAnimPaintBox.RotationCenter.X := X;
  ControlSkAnimPaintBox.RotationCenter.Y := Y;
end;

procedure TFSkAnimatedPaintBox.Enabled(FEnabled: Boolean);
begin
  ControlSkAnimPaintBox.Enabled := FEnabled;
end;

procedure TFSkAnimatedPaintBox.Visible(FVisible: Boolean);
begin
  ControlSkAnimPaintBox.Visible := FVisible;
end;

function TFSkAnimatedPaintBox.IsVisible: Boolean;
begin
  Result := ControlSkAnimPaintBox.Visible;
end;

function TFSkAnimatedPaintBox.GetTag: Integer;
begin
  Result := ControlSkAnimPaintBox.Tag;
end;

function TFSkAnimatedPaintBox.GetLeft: Single;
begin
  Result := ControlSkAnimPaintBox.Position.X;
end;

function TFSkAnimatedPaintBox.GetTop: Single;
begin
  Result := ControlSkAnimPaintBox.Position.Y;
end;

function TFSkAnimatedPaintBox.GetHeight: Single;
begin
  Result := ControlSkAnimPaintBox.Size.Height;
end;

function TFSkAnimatedPaintBox.GetWidth: Single;
begin
  Result := ControlSkAnimPaintBox.Size.Width;
end;

function TFSkAnimatedPaintBox.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlSkAnimPaintBox);
end;

procedure TFSkAnimatedPaintBox.OnClick(Event: TNotifyEvent);
begin
  ControlSkAnimPaintBox.OnClick := TNotifyEvent(Event);
end;

procedure TFSkAnimatedPaintBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlSkAnimPaintBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFSkAnimatedPaintBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSkAnimPaintBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSkAnimatedPaintBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSkAnimPaintBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFSkAnimatedPaintBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlSkAnimPaintBox.OnMouseUp := TMouseEvent(Event);
end;

function TFSkAnimatedPaintBox.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlSkAnimPaintBox);
end;

// =============================================================================
// FSkAnimatedImage
// =============================================================================
procedure TFSkAnimatedImage.FCreate(FParent: TFmxObject);
begin
  ControlSkAnimImage := TSkAnimatedImage.Create(nil);
  ControlSkAnimImage.Parent := FParent;
  ControlSkAnimImage.Animation.Enabled := False;
end;

procedure TFSkAnimatedImage.Cursor(FCursor: TCursor);
begin
  ControlSkAnimImage.Cursor := FCursor;
end;

procedure TFSkAnimatedImage.Left(FLeft: Single);
begin
  ControlSkAnimImage.Position.X := FLeft;
end;

procedure TFSkAnimatedImage.Top(FTop: Single);
begin
  ControlSkAnimImage.Position.Y := FTop;
end;

procedure TFSkAnimatedImage.Height(FHeight: Single);
begin
  ControlSkAnimImage.Size.Height := FHeight;
end;

procedure TFSkAnimatedImage.Width(FWidth: Single);
begin
  ControlSkAnimImage.Size.Width := FWidth;
end;

procedure TFSkAnimatedImage.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlSkAnimImage.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSkAnimatedImage.Position(X, Y: Single);
begin
  ControlSkAnimImage.Position.X := X;
  ControlSkAnimImage.Position.Y := Y;
end;

procedure TFSkAnimatedImage.Align(Al: TAlignLayout);
begin
  ControlSkAnimImage.Align := Al;
end;

procedure TFSkAnimatedImage.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSkAnimImage.Margins.Left := FLeft;
  ControlSkAnimImage.Margins.Top := FTop;
  ControlSkAnimImage.Margins.Right := FRight;
  ControlSkAnimImage.Margins.Bottom := FBottom;
end;

procedure TFSkAnimatedImage.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSkAnimImage.Padding.Left := FLeft;
  ControlSkAnimImage.Padding.Top := FTop;
  ControlSkAnimImage.Padding.Right := FRight;
  ControlSkAnimImage.Padding.Bottom := FBottom;
end;

procedure TFSkAnimatedImage.SetHint(const FText: WideString);
begin
  ControlSkAnimImage.ShowHint := True;
  ControlSkAnimImage.Hint := FText;
end;

procedure TFSkAnimatedImage.SetClipChildren(FValue: Boolean);
begin
  ControlSkAnimImage.ClipChildren := FValue;
end;

procedure TFSkAnimatedImage.SetClipParent(FValue: Boolean);
begin
  ControlSkAnimImage.ClipParent := FValue;
end;

procedure TFSkAnimatedImage.BringToFront;
begin
  ControlSkAnimImage.BringToFront;
end;

procedure TFSkAnimatedImage.SendToBack;
begin
  ControlSkAnimImage.SendToBack;
end;

procedure TFSkAnimatedImage.SetTag(FTag: Integer);
begin
  ControlSkAnimImage.Tag := FTag;
end;

procedure TFSkAnimatedImage.LoadAnimImage(const FAnimImage: WideString);
begin
  if not Assigned(ControlSkAnimImage) then
    Exit;

  ControlSkAnimImage.LoadFromFile(FAnimImage);

  if Assigned(ControlSkAnimImage.Animation) then
  begin
    with ControlSkAnimImage.Animation do
    begin
      Enabled := False;
      Progress := 0;
    end;
  end;
end;

procedure TFSkAnimatedImage.WrapMode(FWrapMode: TSkAnimatedImageWrapMode);
begin
  if Assigned(ControlSkAnimImage) then
    ControlSkAnimImage.WrapMode := FWrapMode;

  ControlSkAnimImage.Repaint;
end;

procedure TFSkAnimatedImage.RunAnim;
begin
  if Assigned(ControlSkAnimImage.Animation) then
    ControlSkAnimImage.Animation.Start;
end;

procedure TFSkAnimatedImage.LoopAnim(FValue: Boolean);
begin
  if Assigned(ControlSkAnimImage.Animation) then
    ControlSkAnimImage.Animation.Loop := FValue;
end;

procedure TFSkAnimatedImage.ProgressAnim(FValue: Double);
begin
  if Assigned(ControlSkAnimImage.Animation) then
    ControlSkAnimImage.Animation.Progress := FValue;
end;

procedure TFSkAnimatedImage.SpeedAnim(FValue: Single);
begin
  if Assigned(ControlSkAnimImage.Animation) then
    ControlSkAnimImage.Animation.Speed := FValue;
end;

procedure TFSkAnimatedImage.StopAnim;
begin
  if Assigned(ControlSkAnimImage.Animation) then
    ControlSkAnimImage.Animation.Stop;
end;

procedure TFSkAnimatedImage.Opacity(FOpacity: Single);
begin
  ControlSkAnimImage.Opacity := FOpacity;
end;

procedure TFSkAnimatedImage.RotationAngle(FValue: Single);
begin
  ControlSkAnimImage.RotationAngle := FValue;
end;

procedure TFSkAnimatedImage.RotationCenter(X, Y: Single);
begin
  ControlSkAnimImage.RotationCenter.X := X;
  ControlSkAnimImage.RotationCenter.Y := Y;
end;

procedure TFSkAnimatedImage.Enabled(FEnabled: Boolean);
begin
  ControlSkAnimImage.Enabled := FEnabled;
end;

procedure TFSkAnimatedImage.Visible(FVisible: Boolean);
begin
  ControlSkAnimImage.Visible := FVisible;
end;

procedure TFSkAnimatedImage.HitTest(FEnabled: Boolean);
begin
  ControlSkAnimImage.HitTest := FEnabled;
end;

function TFSkAnimatedImage.IsVisible: Boolean;
begin
  Result := ControlSkAnimImage.Visible;
end;

function TFSkAnimatedImage.GetTag: Integer;
begin
  Result := ControlSkAnimImage.Tag;
end;

function TFSkAnimatedImage.GetLeft: Single;
begin
  Result := ControlSkAnimImage.Position.X;
end;

function TFSkAnimatedImage.GetTop: Single;
begin
  Result := ControlSkAnimImage.Position.Y;
end;

function TFSkAnimatedImage.GetHeight: Single;
begin
  Result := ControlSkAnimImage.Height;
end;

function TFSkAnimatedImage.GetWidth: Single;
begin
  Result := ControlSkAnimImage.Width;
end;

function TFSkAnimatedImage.GetObject: TFmxObject;
begin
  Result := ControlSkAnimImage;
end;

procedure TFSkAnimatedImage.OnClick(Event: TNotifyEvent);
begin
  ControlSkAnimImage.OnClick := Event;
end;

procedure TFSkAnimatedImage.OnMouseDown(Event: TMouseEvent);
begin
  ControlSkAnimImage.OnMouseDown := Event;
end;

procedure TFSkAnimatedImage.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSkAnimImage.OnMouseEnter := Event;
end;

procedure TFSkAnimatedImage.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSkAnimImage.OnMouseLeave := Event;
end;

procedure TFSkAnimatedImage.OnMouseUp(Event: TMouseEvent);
begin
  ControlSkAnimImage.OnMouseUp := Event;
end;

function TFSkAnimatedImage.Handle: TFmxObject;
begin
  Result := ControlSkAnimImage;
end;

// =============================================================================
// FSkSvg
// =============================================================================
procedure TFSkSvg.FCreate(FParent: TFmxObject);
begin
  ControlSkSvg := TSkSvg.Create(nil);
  ControlSkSvg.Parent := FParent;
end;

procedure TFSkSvg.Cursor(FCursor: TCursor);
begin
  ControlSkSvg.Cursor := FCursor;
end;

procedure TFSkSvg.Left(FLeft: Single);
begin
  ControlSkSvg.Position.X := FLeft;
end;

procedure TFSkSvg.Top(FTop: Single);
begin
  ControlSkSvg.Position.Y := FTop;
end;

procedure TFSkSvg.Height(FHeight: Single);
begin
  ControlSkSvg.Size.Height := FHeight;
end;

procedure TFSkSvg.Width(FWidth: Single);
begin
  ControlSkSvg.Size.Width := FWidth;
end;

procedure TFSkSvg.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlSkSvg.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSkSvg.Position(X, Y: Single);
begin
  ControlSkSvg.Position.X := X;
  ControlSkSvg.Position.Y := Y;
end;

procedure TFSkSvg.Align(Al: TAlignLayout);
begin
  ControlSkSvg.Align := Al;
end;

procedure TFSkSvg.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSkSvg.Margins.Left := FLeft;
  ControlSkSvg.Margins.Top := FTop;
  ControlSkSvg.Margins.Right := FRight;
  ControlSkSvg.Margins.Bottom := FBottom;
end;

procedure TFSkSvg.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSkSvg.Padding.Left := FLeft;
  ControlSkSvg.Padding.Top := FTop;
  ControlSkSvg.Padding.Right := FRight;
  ControlSkSvg.Padding.Bottom := FBottom;
end;

procedure TFSkSvg.SetHint(const FText: WideString);
begin
  ControlSkSvg.ShowHint := True;
  ControlSkSvg.Hint := FText;
end;

procedure TFSkSvg.SetClipChildren(FValue: Boolean);
begin
  ControlSkSvg.ClipChildren := FValue;
end;

procedure TFSkSvg.SetClipParent(FValue: Boolean);
begin
  ControlSkSvg.ClipParent := FValue;
end;

procedure TFSkSvg.BringToFront;
begin
  ControlSkSvg.BringToFront;
end;

procedure TFSkSvg.SendToBack;
begin
  ControlSkSvg.SendToBack;
end;

procedure TFSkSvg.SetTag(FTag: Integer);
begin
  ControlSkSvg.Tag := FTag;
end;

procedure TFSkSvg.LoadSvgFile(const FSvgFile: WideString);
var
  SvgText: string;
begin
  if not FileExists(FSvgFile) then
    raise Exception.Create('SVG file not found: ' + FSvgFile);

  SvgText := TFile.ReadAllText(FSvgFile, TEncoding.UTF8);

  ControlSkSvg.Svg.Source := SvgText;
end;

procedure TFSkSvg.WrapMode(FWrapMode: TSkSvgWrapMode);
begin
  if Assigned(ControlSkSvg) then
    ControlSkSvg.Svg.WrapMode := FWrapMode;
end;

procedure TFSkSvg.GrayScale(FValue: Boolean);
begin
  if Assigned(ControlSkSvg) then
    ControlSkSvg.Svg.GrayScale := FValue;
end;

procedure TFSkSvg.OverrideColor(FColor: TAlphaColor);
begin
  if Assigned(ControlSkSvg) then
    ControlSkSvg.Svg.OverrideColor := TAlphaColor(FColor);
end;

procedure TFSkSvg.Opacity(FOpacity: Single);
begin
  ControlSkSvg.Opacity := FOpacity;
end;

procedure TFSkSvg.RotationAngle(FValue: Single);
begin
  ControlSkSvg.RotationAngle := FValue;
end;

procedure TFSkSvg.RotationCenter(X, Y: Single);
begin
  ControlSkSvg.RotationCenter.X := X;
  ControlSkSvg.RotationCenter.Y := Y;
end;

procedure TFSkSvg.Enabled(FEnabled: Boolean);
begin
  ControlSkSvg.Enabled := FEnabled;
end;

procedure TFSkSvg.Visible(FVisible: Boolean);
begin
  ControlSkSvg.Visible := FVisible;
end;

procedure TFSkSvg.HitTest(FEnabled: Boolean);
begin
  ControlSkSvg.HitTest := FEnabled;
end;

function TFSkSvg.IsVisible: Boolean;
begin
  Result := ControlSkSvg.Visible;
end;

function TFSkSvg.GetTag: Integer;
begin
  Result := ControlSkSvg.Tag;
end;

function TFSkSvg.GetLeft: Single;
begin
  Result := ControlSkSvg.Position.X;
end;

function TFSkSvg.GetTop: Single;
begin
  Result := ControlSkSvg.Position.Y;
end;

function TFSkSvg.GetHeight: Single;
begin
  Result := ControlSkSvg.Height;
end;

function TFSkSvg.GetWidth: Single;
begin
  Result := ControlSkSvg.Width;
end;

function TFSkSvg.GetObject: TFmxObject;
begin
  Result := ControlSkSvg;
end;

procedure TFSkSvg.OnClick(Event: TNotifyEvent);
begin
  ControlSkSvg.OnClick := Event;
end;

procedure TFSkSvg.OnMouseDown(Event: TMouseEvent);
begin
  ControlSkSvg.OnMouseDown := Event;
end;

procedure TFSkSvg.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSkSvg.OnMouseEnter := Event;
end;

procedure TFSkSvg.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSkSvg.OnMouseLeave := Event;
end;

procedure TFSkSvg.OnMouseUp(Event: TMouseEvent);
begin
  ControlSkSvg.OnMouseUp := Event;
end;

function TFSkSvg.Handle: TFmxObject;
begin
  Result := ControlSkSvg;
end;

// =============================================================================
// FSkPaint
// =============================================================================
procedure TFSkPaint.FCreate;
begin
  FPaint := TSkPaint.Create;
end;

procedure TFSkPaint.FCreate2(FPaintStyle: TSkPaintStyle);
begin
  FPaint := TSkPaint.Create(FPaintStyle);
end;

procedure TFSkPaint.AntiAlias(FValue: Boolean);
begin
  FPaint.AntiAlias := FValue;
end;

procedure TFSkPaint.SetARGB(const A, R, G, B: Byte);
begin
  FPaint.SetARGB(A, R, G, B);
end;

procedure TFSkPaint.ColorFilter(FColorFilter: NativeInt);
begin
  if FColorFilter = 0 then
  begin
    FPaint.ColorFilter := nil;
    Exit;
  end;

  FPaint.ColorFilter := ISkColorFilter(Pointer(FColorFilter));
end;

procedure TFSkPaint.PathEffect(FPathEffect: NativeInt);
begin
  if FPathEffect = 0 then
  begin
    FPaint.PathEffect := nil;
    Exit;
  end;

  FPaint.PathEffect := ISkPathEffect(Pointer(FPathEffect));
end;

procedure TFSkPaint.Dither(FValue: Boolean);
begin
  FPaint.Dither := FValue;
end;

procedure TFSkPaint.Color(FColor: TAlphaColor);
begin
  FPaint.Color := FColor;
end;

procedure TFSkPaint.PaintStyle(FStyle: TSkPaintStyle);
begin
  FPaint.Style := FStyle;
end;

procedure TFSkPaint.Shader(FShader: NativeInt);
begin
  if FShader = 0 then
  begin
    FPaint.Shader := nil;
    Exit;
  end;

  FPaint.Shader := ISkShader(Pointer(FShader));
end;

procedure TFSkPaint.Opacity(FOpacity: Single);
begin
  FPaint.AlphaF := FOpacity;
end;

procedure TFSkPaint.StrokeCap(FCap: TSkStrokeCap);
begin
  FPaint.StrokeCap := FCap;
end;

procedure TFSkPaint.StrokeJoin(FJoin: TSkStrokeJoin);
begin
  FPaint.StrokeJoin := FJoin;
end;

procedure TFSkPaint.StrokeMiter(FMiter: Single);
begin
  FPaint.StrokeMiter := FMiter;
end;

procedure TFSkPaint.StrokeWidth(FWidth: Single);
begin
  FPaint.StrokeWidth := FWidth;
end;

function TFSkPaint.Handle: NativeInt;
begin
  Result := NativeInt(Pointer(FPaint));
end;

// =============================================================================
// FSkPaintBox
// =============================================================================
procedure TFSkPaintBox.FCreate(FParent: TFmxObject);
begin
  FPaintBox := TSkPaintBox.Create(nil);
  FPaintBox.Stored := False;
  FPaintBox.Parent := FParent;
  FPaintBox.OnDraw := Draw;
end;

destructor TFSkPaintBox.Destroy;
begin
  FCommands := nil;
  FPaintBox.Free;
  FPaintBox := nil;

  inherited;
end;

procedure TFSkPaintBox.Draw(ASender: TObject; const ACanvas: ISkCanvas;
  const ADest: TRectF; const AOpacity: Single);
var
  LCommand: TSkDrawCommand;
begin
  for LCommand in FCommands do
  begin
    case LCommand.CommandType of

      dctParagraph:
        begin
          if Assigned(LCommand.Paragraph) then
            LCommand.Paragraph.Paint(ACanvas, LCommand.X, LCommand.Y);
        end;

      dctRect:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawRect(TRectF.Create(LCommand.X, LCommand.Y,
              LCommand.X + LCommand.Width, LCommand.Y + LCommand.Height),
            LCommand.Paint);
        end;

      dctRoundRect:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawRoundRect(TRectF.Create(LCommand.X, LCommand.Y,
              LCommand.X + LCommand.Width, LCommand.Y + LCommand.Height),
            LCommand.RadiusX, LCommand.RadiusY, LCommand.Paint);
        end;

      dctRoundRect2:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawRoundRect(LCommand.RoundRect, LCommand.Paint);
        end;

      dctCircle:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawCircle(LCommand.CenterX, LCommand.CenterY,
            LCommand.Radius, LCommand.Paint);
        end;

      dctArc:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawArc(TRectF.Create(LCommand.X, LCommand.Y,
              LCommand.X + LCommand.Width, LCommand.Y + LCommand.Height),
            LCommand.StartAngle, LCommand.SweepAngle,
            LCommand.UseCenter, LCommand.Paint);
        end;

      dctPath:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawPath(LCommand.Path, LCommand.Paint);
        end;

      dctTextBlob:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawTextBlob(LCommand.TextBlob, LCommand.X, LCommand.Y,
            LCommand.Paint);
        end;

      dctSimpleText:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawSimpleText(LCommand.Text, LCommand.X, LCommand.Y,
            LCommand.Font, LCommand.Paint);
        end;

      dctImage:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawImage(LCommand.Image, LCommand.X, LCommand.Y,
            LCommand.Paint);
        end;

      dctImageRect:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawImageRect(LCommand.Image, LCommand.DestRect,
            LCommand.Paint, TSkSrcRectConstraint(LCommand.Constraint));
        end;

      dctImageRect2:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawImageRect(LCommand.Image, LCommand.SrcRect,
            LCommand.DestRect, LCommand.Paint,
            TSkSrcRectConstraint(LCommand.Constraint));
        end;

      dctImageNine:
        begin
          if not Assigned(LCommand.Paint) then
            Continue;

          ACanvas.DrawImageNine(LCommand.Image, LCommand.CenterRect,
            LCommand.DestRect, TSkFilterMode(LCommand.FilterMode),
            LCommand.Paint);
        end;

    end;
  end;
end;

procedure TFSkPaintBox.AddCommand(const ACommand: TSkDrawCommand);
var
  LIndex: Integer;
begin
  LIndex := Length(FCommands);
  SetLength(FCommands, LIndex + 1);
  FCommands[LIndex] := ACommand;
end;

procedure TFSkPaintBox.Left(FLeft: Single);
begin
  FPaintBox.Position.X := FLeft;
end;

procedure TFSkPaintBox.Top(FTop: Single);
begin
  FPaintBox.Position.Y := FTop;
end;

procedure TFSkPaintBox.Height(FHeight: Single);
begin
  FPaintBox.Height := FHeight;
end;

procedure TFSkPaintBox.Width(FWidth: Single);
begin
  FPaintBox.Width := FWidth;
end;

procedure TFSkPaintBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  FPaintBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSkPaintBox.Align(Al: TAlignLayout);
begin
  FPaintBox.Align := Al;
end;

procedure TFSkPaintBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FPaintBox.Margins.Left := FLeft;
  FPaintBox.Margins.Top := FTop;
  FPaintBox.Margins.Right := FRight;
  FPaintBox.Margins.Bottom := FBottom;
end;

procedure TFSkPaintBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FPaintBox.Padding.Left := FLeft;
  FPaintBox.Padding.Top := FTop;
  FPaintBox.Padding.Right := FRight;
  FPaintBox.Padding.Bottom := FBottom;
end;

procedure TFSkPaintBox.SetHint(const FText: WideString);
begin
  FPaintBox.ShowHint := True;
  FPaintBox.Hint := FText;
end;

procedure TFSkPaintBox.Translate(FDeltaX, FDeltaY: Single);
begin
  FPaintBox.Position.X := FPaintBox.Position.X + FDeltaX;

  FPaintBox.Position.Y := FPaintBox.Position.Y + FDeltaY;
end;

procedure TFSkPaintBox.Rotate(FDegrees: Single);
begin
  FPaintBox.RotationAngle := FPaintBox.RotationAngle + FDegrees;
end;

procedure TFSkPaintBox.AddDrawRect(FLeft, FTop, FWidth, FHeight: Single;
  FPaint: NativeInt);
var
  LCommand: TSkDrawCommand;
begin
  LCommand.CommandType := dctRect;
  LCommand.X := FLeft;
  LCommand.Y := FTop;
  LCommand.Width := FWidth;
  LCommand.Height := FHeight;
  LCommand.RadiusX := 0;
  LCommand.RadiusY := 0;
  LCommand.CenterX := 0;
  LCommand.CenterY := 0;
  LCommand.Radius := 0;
  LCommand.StartAngle := 0;
  LCommand.SweepAngle := 0;
  LCommand.UseCenter := False;
  LCommand.Paint := ISKPaint(Pointer(FPaint));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawRoundRect(FLeft, FTop, FWidth, FHeight,
  FRadiusX, FRadiusY: Single; FPaint: NativeInt);
var
  LCommand: TSkDrawCommand;
begin
  LCommand.CommandType := dctRoundRect;
  LCommand.X := FLeft;
  LCommand.Y := FTop;
  LCommand.Width := FWidth;
  LCommand.Height := FHeight;
  LCommand.RadiusX := FRadiusX;
  LCommand.RadiusY := FRadiusY;
  LCommand.CenterX := 0;
  LCommand.CenterY := 0;
  LCommand.Radius := 0;
  LCommand.StartAngle := 0;
  LCommand.SweepAngle := 0;
  LCommand.UseCenter := False;
  LCommand.Paint := ISKPaint(Pointer(FPaint));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawRoundRect2(FRoundRect: NativeInt;
  FPaint: NativeInt);
var
  LCommand: TSkDrawCommand;
begin
  if (FRoundRect = 0) or (FPaint = 0) then
    Exit;

  LCommand.CommandType := dctRoundRect2;
  LCommand.X := 0;
  LCommand.Y := 0;
  LCommand.Width := 0;
  LCommand.Height := 0;
  LCommand.RadiusX := 0;
  LCommand.RadiusY := 0;
  LCommand.CenterX := 0;
  LCommand.CenterY := 0;
  LCommand.Radius := 0;
  LCommand.StartAngle := 0;
  LCommand.SweepAngle := 0;
  LCommand.UseCenter := False;
  LCommand.Path := nil;
  LCommand.RoundRect := ISkRoundRect(Pointer(FRoundRect));
  LCommand.Paint := ISkPaint(Pointer(FPaint));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawCircle(CenterX, CenterY, FRadius: Single;
  FPaint: NativeInt);
var
  LCommand: TSkDrawCommand;
begin
  LCommand.CommandType := dctCircle;
  LCommand.X := 0;
  LCommand.Y := 0;
  LCommand.Width := 0;
  LCommand.Height := 0;
  LCommand.RadiusX := 0;
  LCommand.RadiusY := 0;
  LCommand.CenterX := CenterX;
  LCommand.CenterY := CenterY;
  LCommand.Radius := FRadius;
  LCommand.StartAngle := 0;
  LCommand.SweepAngle := 0;
  LCommand.UseCenter := False;
  LCommand.Paint := ISKPaint(Pointer(FPaint));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawArc(FLeft, FTop, FWidth, FHeight,
  FStartAngle, FSweepAngle: Single; FUseCenter: Boolean; FPaint: NativeInt);
var
  LCommand: TSkDrawCommand;
begin
  LCommand.CommandType := dctArc;
  LCommand.X := FLeft;
  LCommand.Y := FTop;
  LCommand.Width := FWidth;
  LCommand.Height := FHeight;
  LCommand.RadiusX := 0;
  LCommand.RadiusY := 0;
  LCommand.CenterX := 0;
  LCommand.CenterY := 0;
  LCommand.Radius := 0;
  LCommand.StartAngle := FStartAngle;
  LCommand.SweepAngle := FSweepAngle;
  LCommand.UseCenter := FUseCenter;
  LCommand.Paint := ISkPaint(Pointer(FPaint));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawPath(FPath: NativeInt; FPaint: NativeInt);
var
  LCommand: TSkDrawCommand;
begin
  if (FPath = 0) or (FPaint = 0) then
    Exit;

  LCommand.CommandType := dctPath;
  LCommand.X := 0;
  LCommand.Y := 0;
  LCommand.Width := 0;
  LCommand.Height := 0;
  LCommand.RadiusX := 0;
  LCommand.RadiusY := 0;
  LCommand.CenterX := 0;
  LCommand.CenterY := 0;
  LCommand.Radius := 0;
  LCommand.StartAngle := 0;
  LCommand.SweepAngle := 0;
  LCommand.UseCenter := False;
  LCommand.Path := ISkPath(Pointer(FPath));
  LCommand.Paint := ISkPaint(Pointer(FPaint));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawTextBlob(FTextBlob: NativeInt; X, Y: Single;
  FPaint: NativeInt);
var
  LCommand: TSkDrawCommand;
begin
  if (FTextBlob = 0) or (FPaint = 0) then
    Exit;

  LCommand.CommandType := dctTextBlob;
  LCommand.X := X;
  LCommand.Y := Y;
  LCommand.TextBlob := ISkTextBlob(Pointer(FTextBlob));
  LCommand.Paint := ISkPaint(Pointer(FPaint));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawParagraph(FParagraph: NativeInt; X, Y: Single);
var
  LCommand: TSkDrawCommand;
begin
  if FParagraph = 0 then
    Exit;

  LCommand.CommandType := dctParagraph;
  LCommand.X := X;
  LCommand.Y := Y;
  LCommand.Paragraph := ISkParagraph(Pointer(FParagraph));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawSimpleText(const FText: WideString;
  X, Y: Single; FFont: NativeInt; FPaint: NativeInt);
var
  LCommand: TSkDrawCommand;
begin
  if (FFont = 0) or (FPaint = 0) then
    Exit;

  LCommand.CommandType := dctSimpleText;
  LCommand.X := X;
  LCommand.Y := Y;
  LCommand.Text := FText;
  LCommand.Font := ISkFont(Pointer(FFont));
  LCommand.Paint := ISkPaint(Pointer(FPaint));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawImage(FImage, FPaint: NativeInt; X, Y: Single);
var
  LCommand: TSkDrawCommand;
begin
  if (FImage = 0) or (FPaint = 0) then
    Exit;

  LCommand.CommandType := dctImage;
  LCommand.X := X;
  LCommand.Y := Y;
  LCommand.Image := ISkImage(Pointer(FImage));
  LCommand.Paint := ISkPaint(Pointer(FPaint));

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawImageRect(FImage, FPaint: NativeInt; DestLeft,
  DestTop, DestRight, DestBottom: Single; Constraint: TSkSrcRectConstraint);
var
  LCommand: TSkDrawCommand;
begin
  if (FImage = 0) or (FPaint = 0) then
    Exit;

  LCommand.CommandType := dctImageRect;
  LCommand.Image := ISkImage(Pointer(FImage));
  LCommand.Paint := ISkPaint(Pointer(FPaint));
  LCommand.DestRect := TRectF.Create(DestLeft, DestTop, DestRight, DestBottom);
  LCommand.Constraint := Constraint;

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawImageRect2(FImage, FPaint: NativeInt; SrcLeft,
  SrcTop, SrcRight, SrcBottom, DestLeft, DestTop, DestRight, DestBottom: Single;
    Constraint: TSkSrcRectConstraint);
var
  LCommand: TSkDrawCommand;
begin
  if (FImage = 0) or (FPaint = 0) then
    Exit;

  LCommand.CommandType := dctImageRect2;
  LCommand.Image := System.Skia.ISkImage(Pointer(FImage));
  LCommand.Paint := System.Skia.ISkPaint(Pointer(FPaint));
  LCommand.SrcRect := TRectF.Create(SrcLeft, SrcTop, SrcRight, SrcBottom);
  LCommand.DestRect := TRectF.Create(DestLeft, DestTop, DestRight, DestBottom);
  LCommand.Constraint := Constraint;

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.AddDrawImageNine(FImage, FPaint: NativeInt; CenterLeft,
  CenterTop, CenterRight, CenterBottom: Integer; DestLeft, DestTop, DestRight,
    DestBottom: Single; FilterMode: TSkFilterMode);
var
  LCommand: TSkDrawCommand;
begin
  if (FImage = 0) or (FPaint = 0) then
    Exit;

  LCommand.CommandType := dctImageNine;
  LCommand.Image := System.Skia.ISkImage(Pointer(FImage));
  LCommand.Paint := System.Skia.ISkPaint(Pointer(FPaint));
  LCommand.CenterRect := TRect.Create(CenterLeft, CenterTop,
    CenterRight, CenterBottom);
  LCommand.DestRect := TRectF.Create(DestLeft, DestTop, DestRight, DestBottom);
  LCommand.FilterMode := FilterMode;

  AddCommand(LCommand);
end;

procedure TFSkPaintBox.DoDrawing;
begin
  if Assigned(FPaintBox) then
    FPaintBox.Redraw;
end;

procedure TFSkPaintBox.ClearCommands;
begin
  FCommands := nil;
end;

procedure TFSkPaintBox.Opacity(FOpacity: Single);
begin
  FPaintBox.Opacity := FOpacity;
end;

procedure TFSkPaintBox.RotationAngle(FAngle: Single);
begin
  FPaintBox.RotationAngle := FAngle;
end;

procedure TFSkPaintBox.RotationCenter(X, Y: Single);
begin
  FPaintBox.RotationCenter.X := X;
  FPaintBox.RotationCenter.Y := Y;
end;

procedure TFSkPaintBox.Enable(FEnabled: Boolean);
begin
  FPaintBox.Enabled := FEnabled;
end;

procedure TFSkPaintBox.Visible(FVisible: Boolean);
begin
  FPaintBox.Visible := FVisible;
end;

procedure TFSkPaintBox.HitTest(FValue: Boolean);
begin
  FPaintBox.HitTest := FValue;
end;

function TFSkPaintBox.GetLeft: Single;
begin
  Result := FPaintBox.Position.X;
end;

function TFSkPaintBox.GetTop: Single;
begin
  Result := FPaintBox.Position.Y;
end;

function TFSkPaintBox.GetWidth: Single;
begin
  Result := FPaintBox.Width;
end;

function TFSkPaintBox.GetHeight: Single;
begin
  Result := FPaintBox.Height;
end;

function TFSkPaintBox.GetOpacity: Single;
begin
  Result := FPaintBox.Opacity;
end;

function TFSkPaintBox.GetObject: TFmxObject;
begin
  Result := FPaintBox;
end;

function TFSkPaintBox.Handle: TFmxObject;
begin
  Result := FPaintBox;
end;

// =============================================================================
// FSkShader
// =============================================================================
procedure TFSkShader.MakeColor(FColor: TAlphaColor);
begin
  FShader := TSkShader.MakeColor(FColor);
end;

procedure TFSkShader.MakeGradientLinear(X1, Y1, X2, Y2: Single;
  FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode);
begin
  FShader := TSkShader.MakeGradientLinear(PointF(X1, Y1), PointF(X2, Y2),
    FColor1, FColor2, FTileMode);
end;

procedure TFSkShader.MakeGradientRadial(X, Y, FRadius: Single;
  FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode);
begin
  FShader := TSkShader.MakeGradientRadial(PointF(X, Y), FRadius,
    FColor1, FColor2, FTileMode);
end;

procedure TFSkShader.MakeGradientSweep(X, Y: Single;
  FColor1, FColor2: TAlphaColor; FTileMode: TSkTileMode);
begin
  FShader := TSkShader.MakeGradientSweep(PointF(X, Y),
    FColor1, FColor2, FTileMode);
end;

procedure TFSkShader.MakeGradientTwoPointConical(X1, Y1, FRadius1: Single;
  X2, Y2, FRadius2: Single; FColor1, FColor2: TAlphaColor;
  FTileMode: TSkTileMode);
begin
  FShader := TSkShader.MakeGradientTwoPointConical(PointF(X1, Y1),
    FRadius1, PointF(X2, Y2), FRadius2, FColor1, FColor2, FTileMode);
end;

procedure TFSkShader.MakeImage(FImage: NativeInt;
  FTileModeX, FTileModeY: TSkTileMode);
var
  LImage: ISkImage;
begin
  if FImage = 0 then
  begin
    FShader := nil;
    Exit;
  end;

  LImage := ISkImage(Pointer(FImage));

  FShader := LImage.MakeShader(FTileModeX, FTileModeY);
end;

function TFSkShader.Handle: NativeInt;
begin
  Result := NativeInt(Pointer(FShader));
end;

// =============================================================================
// FSkPathBuilder
// =============================================================================
procedure TFSkPathBuilder.FCreate;
begin
  FBuilder := TSkPathBuilder.Create;
end;

procedure TFSkPathBuilder.FCreate2(SkPathFillTypes: TSkPathFillType);
begin
  FBuilder := TSkPathBuilder.Create(SkPathFillTypes);
end;

procedure TFSkPathBuilder.AddArc(X, Y, FWidth, FHeight,
  FStartAngle, FSweepAngle: Single);
begin
  FBuilder.AddArc(TRectF.Create(X, Y, X + FWidth, Y + FHeight),
    FStartAngle, FSweepAngle);
end;

procedure TFSkPathBuilder.AddCircle(CenterX, CenterY, FRadius: Single;
  SkPathDirection: TSkPathDirection);
begin
  FBuilder.AddCircle(PointF(CenterX, CenterY), FRadius, SkPathDirection);
end;

procedure TFSkPathBuilder.AddOval(X, Y, FWidth, FHeight: Single;
  SkPathDirection: TSkPathDirection);
begin
  FBuilder.AddOval(TRectF.Create(X, Y, X + FWidth, Y + FHeight),
    SkPathDirection);
end;

procedure TFSkPathBuilder.AddRect(X, Y, FWidth, FHeight: Single;
  SkPathDirection: TSkPathDirection);
begin
  FBuilder.AddRect(TRectF.Create(X, Y, X + FWidth, Y + FHeight),
    SkPathDirection);
end;

procedure TFSkPathBuilder.AddRoundRect(FRoundRect: NativeInt;
  SkPathDirection: TSkPathDirection);
begin
  if FRoundRect = 0 then
    Exit;

  FBuilder.AddRoundRect(ISkRoundRect(Pointer(FRoundRect)), SkPathDirection);
end;

procedure TFSkPathBuilder.AddPolygon(FPolygon: NativeInt; IsClosed: Boolean);
var
  LPolygon: ^TPolygon;
begin
  if FPolygon = 0 then
    Exit;

  LPolygon := Pointer(FPolygon);

  if Length(LPolygon^) = 0 then
    Exit;

  FBuilder.AddPolygon(LPolygon^, IsClosed);
end;

procedure TFSkPathBuilder.AddPath(FPath: NativeInt);
begin
  if FPath = 0 then
    Exit;

  FBuilder.AddPath(ISkPath(Pointer(FPath)));
end;

procedure TFSkPathBuilder.ArcTo(X1, Y1, X2, Y2, FRadius: Single);
begin
  FBuilder.ArcTo(PointF(X1, Y1), PointF(X2, Y2), FRadius);
end;

procedure TFSkPathBuilder.ArcTo2(X, Y, FWidth, FHeight,
  FStartAngle, FSweepAngle: Single; FForceMoveTo: Boolean);
begin
  FBuilder.ArcTo(TRectF.Create(X, Y, X + FWidth, Y + FHeight),
    FStartAngle, FSweepAngle, FForceMoveTo);
end;

procedure TFSkPathBuilder.ConicTo(X1, Y1, X2, Y2, FWeight: Single);
begin
  FBuilder.ConicTo(X1, Y1, X2, Y2, FWeight);
end;

procedure TFSkPathBuilder.CubicTo(X1, Y1, X2, Y2, X3, Y3: Single);
begin
  FBuilder.CubicTo(X1, Y1, X2, Y2, X3, Y3);
end;

procedure TFSkPathBuilder.LineTo(X, Y: Single);
begin
  FBuilder.LineTo(X, Y);
end;

procedure TFSkPathBuilder.MoveTo(X, Y: Single);
begin
  FBuilder.MoveTo(X, Y);
end;

procedure TFSkPathBuilder.Offset(FDeltaX, FDeltaY: Single);
begin
  FBuilder.Offset(FDeltaX, FDeltaY);
end;

procedure TFSkPathBuilder.QuadTo(X1, Y1, X2, Y2: Single);
begin
  FBuilder.QuadTo(X1, Y1, X2, Y2);
end;

procedure TFSkPathBuilder.RConicTo(X1, Y1, X2, Y2, FWeight: Single);
begin
  FBuilder.RConicTo(X1, Y1, X2, Y2, FWeight);
end;

procedure TFSkPathBuilder.RCubicTo(X1, Y1, X2, Y2, X3, Y3: Single);
begin
  FBuilder.RCubicTo(X1, Y1, X2, Y2, X3, Y3);
end;

procedure TFSkPathBuilder.RLineTo(X, Y: Single);
begin
  FBuilder.RLineTo(X, Y);
end;

procedure TFSkPathBuilder.RQuadTo(X1, Y1, X2, Y2: Single);
begin
  FBuilder.RQuadTo(X1, Y1, X2, Y2);
end;

procedure TFSkPathBuilder.Reset;
begin
  FBuilder.Reset;
end;

procedure TFSkPathBuilder.PathFillType(SkPathFillTypes: TSkPathFillType);
begin
  FBuilder.FillType :=  SkPathFillTypes;
end;

procedure TFSkPathBuilder.ToggleInverseFillType;
begin
  FBuilder.ToggleInverseFillType;
end;

function TFSkPathBuilder.Handle: NativeInt;
begin
  FPath := FBuilder.Snapshot;
  Result := NativeInt(Pointer(FPath));
end;

// =============================================================================
// FSkRoundRect
// =============================================================================
procedure TFSkRoundRect.FCreate;
begin
  FRoundRect := TSkRoundRect.Create;
end;

procedure TFSkRoundRect.Deflate(FDeltaX, FDeltaY: Single);
begin
  FRoundRect.Deflate(FDeltaX, FDeltaY);
end;

procedure TFSkRoundRect.Inflate(FDeltaX, FDeltaY: Single);
begin
  FRoundRect.Inflate(FDeltaX, FDeltaY);
end;

procedure TFSkRoundRect.Offset(FDeltaX, FDeltaY: Single);
begin
  FRoundRect.Offset(FDeltaX, FDeltaY);
end;

procedure TFSkRoundRect.SetOval(X, Y, FWidth, FHeight: Single);
begin
  FRoundRect.SetOval(TRectF.Create(X, Y, X + FWidth, Y + FHeight));
end;

procedure TFSkRoundRect.SetRect(X, Y, FWidth, FHeight: Single);
begin
  FRoundRect.SetRect(TRectF.Create(X, Y, X + FWidth, Y + FHeight));
end;

procedure TFSkRoundRect.SetRect2(X, Y, FWidth, FHeight,
  FRadiusX, FRadiusY: Single);
begin
  FRoundRect.SetRect(TRectF.Create(X, Y,  X + FWidth, Y + FHeight),
    FRadiusX, FRadiusY);
end;

function TFSkRoundRect.Handle: NativeInt;
begin
  if not Assigned(FRoundRect) then
    Exit(0);

  Result := NativeInt(Pointer(FRoundRect));
end;

// =============================================================================
// FSkImage
// =============================================================================
procedure TFSkImage.FCreate(const FImageFile: WideString);
begin
  FImage := TSkImage.MakeFromEncodedFile(FImageFile);
end;

function TFSkImage.EncodeToFile(const FOutImgFile: WideString;
  FEncodedImagesFormat: TSkEncodedImageFormat; FQuality: Integer): Boolean;
begin
  Result := FImage.EncodeToFile(FOutImgFile, FEncodedImagesFormat, FQuality);
end;

function TFSkImage.MakeNonTextureImage: NativeInt;
begin
  FTempImage := FImage.MakeNonTextureImage;

  if not Assigned(FTempImage) then
    Exit(0);

  Result := NativeInt(Pointer(FTempImage));
end;

function TFSkImage.MakeRasterImage: NativeInt;
begin
  FTempImage := FImage.MakeRasterImage;

  if not Assigned(FTempImage) then
    Exit(0);

  Result := NativeInt(Pointer(FTempImage));
end;

function TFSkImage.MakeRawShader(FTileModeX,
  FTileModeY: TSkTileMode): NativeInt;
begin
  FTempShader := FImage.MakeRawShader(FTileModeX, FTileModeY);

  if not Assigned(FTempShader) then
    Exit(0);

  Result := NativeInt(Pointer(FTempShader));
end;

function TFSkImage.MakeShader(FTileModeX, FTileModeY: TSkTileMode): NativeInt;
begin
  FTempShader := FImage.MakeShader(FTileModeX, FTileModeY);

  if not Assigned(FTempShader) then
    Exit(0);

  Result := NativeInt(Pointer(FTempShader));
end;

function TFSkImage.IsAlphaOnly: Boolean;
begin
  Result := FImage.IsAlphaOnly;
end;

function TFSkImage.IsOpaque: Boolean;
begin
  Result := FImage.IsOpaque;
end;

function TFSkImage.IsTextureBacked: Boolean;
begin
  Result := FImage.IsTextureBacked;
end;

function TFSkImage.GetHeight: Integer;
begin
  Result := FImage.Height;
end;

function TFSkImage.GetWidth: Integer;
begin
  Result := FImage.Width;
end;

function TFSkImage.Handle: NativeInt;
begin
  if not Assigned(FImage) then
    Exit(0);

  Result := NativeInt(Pointer(FImage));
end;

// =============================================================================
// FSkTypeface
// =============================================================================
procedure TFSkTypeface.FCreateDefault;
begin
  FTypeface := TSkTypeface.MakeDefault;
end;

procedure TFSkTypeface.FCreateFromName(const FontName: WideString;
  SkFontsStyle: TSkFontsStyle);
begin
  case SkFontsStyle of
    fskfsNormal:
      FTypeface := TSkTypeface.MakeFromName(FontName,
        System.Skia.TSkFontStyle.Normal);

    fskfsBold:
      FTypeface := TSkTypeface.MakeFromName(FontName,
        System.Skia.TSkFontStyle.Bold);

    fskfsItalic:
      FTypeface := TSkTypeface.MakeFromName(FontName,
        System.Skia.TSkFontStyle.Italic);

    fskfsBoldItalic:
      FTypeface := TSkTypeface.MakeFromName(FontName,
        System.Skia.TSkFontStyle.BoldItalic);
  end;
end;

procedure TFSkTypeface.FCreateFromFile(const FontFile: WideString;
  const ATTCIndex: Integer);
begin
  FTypeface := TSkTypeface.MakeFromFile(FontFile, ATTCIndex);
end;

function TFSkTypeface.Handle: NativeInt;
begin
  if not Assigned(FTypeface) then
    Exit(0);

  Result := NativeInt(Pointer(FTypeface));
end;

// =============================================================================
// FSkFont
// =============================================================================
procedure TFSkFont.FCreate(FTypeface: NativeInt; FSize: Single);
var
  LTypeface: ISkTypeface;
begin
  if FTypeface = 0 then
    FFont := TSkFont.Create(nil, FSize)
  else
  begin
    LTypeface := ISkTypeface(Pointer(FTypeface));

    FFont := TSkFont.Create(LTypeface, FSize);
  end;
end;

procedure TFSkFont.BaselineSnap(FValue: Boolean);
begin
  FFont.BaselineSnap := FValue;
end;

procedure TFSkFont.Edging(FValue: TSkFontEdging);
begin
  FFont.Edging := FValue;
end;

procedure TFSkFont.Hinting(FValue: TSkFontHinting);
begin
  FFont.Hinting := FValue;
end;

procedure TFSkFont.LinearMetrics(FValue: Boolean);
begin
  FFont.LinearMetrics := FValue;
end;

procedure TFSkFont.Subpixel(FValue: Boolean);
begin
  FFont.Subpixel := FValue;
end;

procedure TFSkFont.Size(FValue: Single);
begin
  FFont.Size := FValue;
end;

procedure TFSkFont.ScaleX(FValue: Single);
begin
  FFont.ScaleX := FValue;
end;

procedure TFSkFont.SkewX(FValue: Single);
begin
  FFont.SkewX := FValue;
end;

function TFSkFont.GetSize: Single;
begin
  Result := FFont.Size;
end;

function TFSkFont.GetScaleX: Single;
begin
  Result := FFont.ScaleX;
end;

function TFSkFont.GetSkewX: Single;
begin
  Result := FFont.SkewX;
end;

function TFSkFont.Handle: NativeInt;
begin
  if not Assigned(FFont) then
    Exit(0);

  Result := NativeInt(Pointer(FFont));
end;

// =============================================================================
// FSkTextBlob
// =============================================================================
procedure TFSkTextBlob.MakeFromText(const FText: WideString; FFont: NativeInt);
var
  LFont: ISkFont;
begin
  if FFont = 0 then
  begin
    FTextBlob := nil;
    Exit;
  end;

  LFont := ISkFont(Pointer(FFont));

  FTextBlob := TSkTextBlob.MakeFromText(FText, LFont);
end;

function TFSkTextBlob.Handle: NativeInt;
begin
  if not Assigned(FTextBlob) then
    Exit(0);

  Result := NativeInt(Pointer(FTextBlob));
end;

// =============================================================================
// FSkColorFilter
// =============================================================================
procedure TFSkColorFilter.MakeBlend(FColor: TAlphaColor;
  BlendsMode: TSkBlendMode);
begin
  FColorFilter := TSkColorFilter.MakeBlend(FColor, BlendsMode);
end;

procedure TFSkColorFilter.MakeCompose(FOuter, FInner: NativeInt);
var
  LOuter: System.Skia.ISkColorFilter;
  LInner: System.Skia.ISkColorFilter;
begin
  if (FOuter = 0) or (FInner = 0) then
  begin
    FColorFilter := nil;
    Exit;
  end;

  LOuter := System.Skia.ISkColorFilter(Pointer(FOuter));
  LInner := System.Skia.ISkColorFilter(Pointer(FInner));

  FColorFilter := TSkColorFilter.MakeCompose(LOuter, LInner);
end;

procedure TFSkColorFilter.MakeLighting(FMultiply, FAdd: TAlphaColor);
begin
  FColorFilter := TSkColorFilter.MakeLighting(FMultiply, FAdd);
end;

procedure TFSkColorFilter.MakeLinearToSRGBGamma;
begin
  FColorFilter := TSkColorFilter.MakeLinearToSRGBGamma;
end;

procedure TFSkColorFilter.MakeLumaColor;
begin
  FColorFilter := TSkColorFilter.MakeLumaColor;
end;

procedure TFSkColorFilter.MakeOverdraw(FColors: TSkOverdrawColor);
var
  LColors: TSkOverdrawColor;
  I: Integer;
begin
  for I := 0 to 5 do
    LColors[I] := FColors[I];

  FColorFilter := TSkColorFilter.MakeOverdraw(LColors);
end;

function TFSkColorFilter.Handle: NativeInt;
begin
  if not Assigned(FColorFilter) then
    Exit(0);

  Result := NativeInt(Pointer(FColorFilter));
end;

// =============================================================================
// FSkPathEffect
// =============================================================================
procedure TFSkPathEffect.Make1DPath(FPath: NativeInt; FAdvance, FPhase: Single;
  FStyle: TSkPathEffect1DStyle);
var
  LPath: ISkPath;
begin
  if FPath = 0 then
  begin
    FPathEffect := nil;
    Exit;
  end;

  LPath := ISkPath(Pointer(FPath));

  FPathEffect := TSkPathEffect.Make1DPath(LPath, FAdvance, FPhase, FStyle);
end;

procedure TFSkPathEffect.MakeCompose(FOuter, FInner: NativeInt);
var
  LOuter: ISkPathEffect;
  LInner: ISkPathEffect;
begin
  if (FOuter = 0) or (FInner = 0) then
  begin
    FPathEffect := nil;
    Exit;
  end;

  LOuter := ISkPathEffect(Pointer(FOuter));
  LInner := ISkPathEffect(Pointer(FInner));

  FPathEffect := TSkPathEffect.MakeCompose(LOuter, LInner);
end;

procedure TFSkPathEffect.MakeCorner(FRadius: Single);
begin
  FPathEffect := TSkPathEffect.MakeCorner(FRadius);
end;

procedure TFSkPathEffect.MakeDash(const FIntervals: TSingleArr; FPhase: Single);
var
  LIntervals: TArray<Single>;
  I: Integer;
begin
  SetLength(LIntervals, Length(FIntervals));

  for I := 0 to High(FIntervals) do
    LIntervals[I] := FIntervals[I];

  FPathEffect := TSkPathEffect.MakeDash(LIntervals, FPhase);
end;

procedure TFSkPathEffect.MakeDiscrete(FSegLength, FDeviation: Single;
  FSeedAssist: Cardinal);
begin
  FPathEffect := TSkPathEffect.MakeDiscrete(FSegLength, FDeviation,
    FSeedAssist);
end;

procedure TFSkPathEffect.MakeMerge(FEffect1, FEffect2: NativeInt;
  FOp: TSkPathOp);
var
  LEffect1: ISkPathEffect;
  LEffect2: ISkPathEffect;
begin
  if (FEffect1 = 0) or (FEffect2 = 0) then
  begin
    FPathEffect := nil;
    Exit;
  end;

  LEffect1 := ISkPathEffect(Pointer(FEffect1));
  LEffect2 := ISkPathEffect(Pointer(FEffect2));

  FPathEffect := TSkPathEffect.MakeMerge(LEffect1, LEffect2, FOp);
end;

procedure TFSkPathEffect.MakeStroke(FWidth: Single; FJoin: TSkStrokeJoin;
  FCap: TSkStrokeCap; FMiter: Single);
begin
  FPathEffect := TSkPathEffect.MakeStroke(FWidth, FJoin, FCap, FMiter);
end;

procedure TFSkPathEffect.MakeStrokeAndFill;
begin
  FPathEffect := TSkPathEffect.MakeStrokeAndFill;
end;

procedure TFSkPathEffect.MakeSum(FEffect1, FEffect2: NativeInt);
var
  LEffect1: ISkPathEffect;
  LEffect2: ISkPathEffect;
begin
  if (FEffect1 = 0) or (FEffect2 = 0) then
  begin
    FPathEffect := nil;
    Exit;
  end;

  LEffect1 := ISkPathEffect(Pointer(FEffect1));
  LEffect2 := ISkPathEffect(Pointer(FEffect2));

  FPathEffect := TSkPathEffect.MakeSum(LEffect1, LEffect2);
end;

procedure TFSkPathEffect.MakeTranslate(FDeltaX, FDeltaY: Single);
begin
  FPathEffect := TSkPathEffect.MakeTranslate(FDeltaX, FDeltaY);
end;

procedure TFSkPathEffect.MakeTrim(FStart, FStop: Single;
  FMode: TSkPathEffectTrimMode);
begin
  FPathEffect := TSkPathEffect.MakeTrim(FStart, FStop, FMode);
end;

function TFSkPathEffect.Handle: NativeInt;
begin
  if not Assigned(FPathEffect) then
    Exit(0);

  Result := NativeInt(Pointer(FPathEffect));
end;

// =============================================================================
// FSkShaper
// =============================================================================
procedure TFSkShaper.FCreate;
begin
  FShaper := TSkShaper.Create;
end;

procedure TFSkShaper.Shape(const FText: WideString; FFont: NativeInt;
  FLeftToRight: Boolean; FWidth: Single);
var
  LFont: ISkFont;
begin
  if FFont = 0 then
  begin
    FTextBlob := nil;
    Exit;
  end;

  LFont := System.Skia.ISkFont(Pointer(FFont));

  FTextBlob := FShaper.Shape(FText, LFont, FLeftToRight, FWidth);
end;

procedure TFSkShaper.Shape2(const FText: WideString; FFont: NativeInt;
  FLeftToRight: Boolean; FWidth: Single; FOffsetX, FOffsetY: Single;
    var FEndPointX, FEndPointY: Single);
var
  LFont: ISkFont;
  LEndPoint: TPointF;
begin
  if FFont = 0 then
  begin
    FTextBlob := nil;
    FEndPointX := 0;
    FEndPointY := 0;
    Exit;
  end;

  LFont := ISkFont(Pointer(FFont));

  FTextBlob := FShaper.Shape(FText, LFont, FLeftToRight, FWidth,
    TPointF.Create(FOffsetX, FOffsetY), LEndPoint);

  FEndPointX := LEndPoint.X;
  FEndPointY := LEndPoint.Y;
end;

function TFSkShaper.Handle: NativeInt;
begin
  if not Assigned(FTextBlob) then
    Exit(0);

  Result := NativeInt(Pointer(FTextBlob));
end;

// =============================================================================
// FSkParagraphStyle
// =============================================================================
procedure TFSkParagraphStyle.FCreate;
begin
  FStyle := TSkParagraphStyle.Create;
end;

procedure TFSkParagraphStyle.DisableHinting;
begin
  FStyle.DisableHinting;
end;

procedure TFSkParagraphStyle.Ellipsis(const FValue: WideString);
begin
  FStyle.Ellipsis := FValue;
end;

procedure TFSkParagraphStyle.Height(FValue: Single);
begin
  FStyle.Height := FValue;
end;

procedure TFSkParagraphStyle.MaxLines(FValue: Integer);
begin
  if FValue < 0 then
    FValue := 0;

  FStyle.MaxLines := NativeUInt(FValue);
end;

procedure TFSkParagraphStyle.StrutStyle(FValue: NativeInt);
begin
  if FValue = 0 then
  begin
    FStyle.StrutStyle := nil;
    Exit;
  end;

  FStyle.StrutStyle := ISkStrutStyle(Pointer(FValue));
end;

procedure TFSkParagraphStyle.TextAlign(FValue: TSkTextAlign);
begin
  FStyle.TextAlign := TSkTextAlign(FValue);
end;

procedure TFSkParagraphStyle.TextDirection(FValue: TSkTextDirection);
begin
  FStyle.TextDirection := TSkTextDirection(FValue);
end;

procedure TFSkParagraphStyle.TextHeightBehaviors(FValue: TSkTextHeightBehaviors);
begin
  FStyle.TextHeightBehaviors := TSkTextHeightBehaviors(FValue);
end;

procedure TFSkParagraphStyle.TextStyle(FValue: NativeInt);
begin
  if FValue = 0 then
  begin
    FStyle.TextStyle := nil;
    Exit;
  end;

  FStyle.TextStyle := ISkTextStyle(Pointer(FValue));
end;

function TFSkParagraphStyle.Handle: NativeInt;
begin
  if not Assigned(FStyle) then
    Exit(0);

  Result := NativeInt(Pointer(FStyle));
end;

// =============================================================================
// FSkTextStyle
// =============================================================================
procedure TFSkTextStyle.FCreate;
begin
  FTextStyle := TSkTextStyle.Create;
end;

procedure TFSkTextStyle.Color(FColor: TAlphaColor);
begin
  FTextStyle.Color := FColor;
end;

procedure TFSkTextStyle.FontSize(FValue: Single);
begin
  FTextStyle.FontSize := FValue;
end;

procedure TFSkTextStyle.FontStyle(FFontWeight: TFontWeight;
  FFontWidth: TSkFontWidth; FFontSlant: TFontSlant);
var
  LStyle: TSkFontStyle;
begin
  LStyle := TSkFontStyle.Create(
    TSkFontWeight(FontWeightToSkia(Ord(FFontWeight))),
    FFontWidth,
    FontSlantToSkia(Ord(FFontSlant)));

  FTextStyle.FontStyle := LStyle;
end;

procedure TFSkTextStyle.ClearFontFamilies;
begin
  SetLength(FFontFamilies, 0);
  FTextStyle.FontFamilies := nil;
end;

procedure TFSkTextStyle.AddFontFamily(const FFontFamily: WideString);
begin
  if FFontFamily = '' then
    Exit;

  SetLength(FFontFamilies, Length(FFontFamilies) + 1);

  FFontFamilies[High(FFontFamilies)] := FFontFamily;

  FTextStyle.FontFamilies := FFontFamilies;
end;

procedure TFSkTextStyle.LetterSpacing(FValue: Single);
begin
  FTextStyle.LetterSpacing := FValue;
end;

procedure TFSkTextStyle.WordSpacing(FValue: Single);
begin
  FTextStyle.WordSpacing := FValue;
end;

procedure TFSkTextStyle.Locale(const FValue: WideString);
begin
  FTextStyle.Locale := FValue;
end;

procedure TFSkTextStyle.HeightMultiplier(FValue: Single);
begin
  FTextStyle.HeightMultiplier := FValue;
end;

procedure TFSkTextStyle.HalfLeading(FValue: Boolean);
begin
  FTextStyle.HalfLeading := FValue;
end;

procedure TFSkTextStyle.Decorations(FValue: Cardinal);
begin
  FTextStyle.Decorations := TSkTextDecorations(Byte(FValue));
end;

procedure TFSkTextStyle.DecorationColor(FColor: TAlphaColor);
begin
  FTextStyle.DecorationColor := FColor;
end;

procedure TFSkTextStyle.DecorationStyle(FValue: TSkTextDecorationStyle);
begin
  FTextStyle.DecorationStyle := TSkTextDecorationStyle(FValue);
end;

procedure TFSkTextStyle.DecorationThickness(FValue: Single);
begin
  FTextStyle.DecorationThickness := FValue;
end;

procedure TFSkTextStyle.ClearBackgroundColor;
begin
  FTextStyle.ClearBackgroundColor;
end;

procedure TFSkTextStyle.ClearForegroundColor;
begin
  FTextStyle.ClearForegroundColor;
end;

procedure TFSkTextStyle.ResetFontFeatures;
begin
  FTextStyle.ResetFontFeatures;
end;

procedure TFSkTextStyle.ResetShadows;
begin
  FTextStyle.ResetShadows;
end;

function TFSkTextStyle.Handle: NativeInt;
begin
  if not Assigned(FTextStyle) then
    Exit(0);

  Result := NativeInt(Pointer(FTextStyle));
end;

// =============================================================================
// FSkParagraphBuilder
// =============================================================================
procedure TFSkParagraphBuilder.FCreate(FParagraphStyle: NativeInt);
var
  LParagraphStyle: ISkParagraphStyle;
begin
  FBuilder := nil;
  FParagraph := nil;

  if (FParagraphStyle = 0) then
    Exit;

  LParagraphStyle := ISkParagraphStyle(Pointer(FParagraphStyle));

  FBuilder := TSkParagraphBuilder.Create(LParagraphStyle);
end;

procedure TFSkParagraphBuilder.PushStyle(FTextStyle: NativeInt);
var
  LTextStyle: ISkTextStyle;
begin
  if not Assigned(FBuilder) then
    Exit;

  if FTextStyle = 0 then
    Exit;

  LTextStyle := ISkTextStyle(Pointer(FTextStyle));

  FBuilder.PushStyle(LTextStyle);
end;

procedure TFSkParagraphBuilder.Pop;
begin
  if Assigned(FBuilder) then
    FBuilder.Pop;
end;

procedure TFSkParagraphBuilder.AddText(const FText: WideString);
begin
  if not Assigned(FBuilder) then
    Exit;

  FBuilder.AddText(FText);
end;

procedure TFSkParagraphBuilder.Build;
begin
  FParagraph := nil;

  if not Assigned(FBuilder) then
    Exit;

  FParagraph := FBuilder.Build;
end;

function TFSkParagraphBuilder.Handle: NativeInt;
begin
  if not Assigned(FBuilder) then
    Exit(0);

  Result := NativeInt(Pointer(FBuilder));
end;

// =============================================================================
// FSkParagraph
// =============================================================================
procedure TFSkParagraph.FCreate(FParagraphBuilder: NativeInt);
var
  LBuilder: ISkParagraphBuilder;
begin
  FParagraph := nil;

  if FParagraphBuilder = 0 then
    Exit;

  LBuilder := ISkParagraphBuilder(Pointer(FParagraphBuilder));

  FParagraph := LBuilder.Build;
end;

procedure TFSkParagraph.Layout(FWidth: Single);
begin
  if Assigned(FParagraph) then
    FParagraph.Layout(FWidth);
end;

function TFSkParagraph.ToPath: NativeInt;
begin
  FPath := nil;

  if not Assigned(FParagraph) then
    Exit(0);

  FPath := FParagraph.ToPath;

  if not Assigned(FPath) then
    Exit(0);

  Result := NativeInt(Pointer(FPath));
end;

function TFSkParagraph.Handle: NativeInt;
begin
  if not Assigned(FParagraph) then
    Exit(0);

  Result := NativeInt(Pointer(FParagraph));
end;

// =============================================================================
// FPolygon
// =============================================================================
procedure TFPolygon.SetLen(FLength: Integer);
begin
  if FLength < 0 then
    FLength := 0;

  SetLength(FPolygon, FLength);
end;

procedure TFPolygon.AddValue(FIndex: Integer; FV1, FV2: Single);
begin
  if (FIndex < 0) or (FIndex >= Length(FPolygon)) then
    Exit;

  FPolygon[FIndex] := TPointF.Create(FV1, FV2);
end;

function TFPolygon.GetLen: Integer;
begin
  Result := Length(FPolygon);
end;

function TFPolygon.Handle: NativeInt;
begin
  Result := NativeInt(@FPolygon);
end;

// =============================================================================
// InstallSkiaFonts
// =============================================================================
var
  GSkiaTypefaces: TArray<ISkTypeface>;

procedure InstallSkiaFonts(FontFile: WideString);
var
  FileName: string;
  TF: ISkTypeface;
begin
  FileName := ExpandFileName(string(FontFile));

  if not FileExists(FileName) then
    Exit;

  TSkDefaultProviders.RegisterTypeface(FileName);

  TF := TSkTypeface.MakeFromFile(FileName);
  if TF <> nil then
  begin
    SetLength(GSkiaTypefaces, Length(GSkiaTypefaces) + 1);
    GSkiaTypefaces[High(GSkiaTypefaces)] := TF;
  end;
end;

// =============================================================================
// Exports
// =============================================================================
function InitSkLabelFontStyle: FSkLabelFontStyle;
begin
  Result := TFSkLabelFontStyle.Create;
end;

function InitSkLabel: FSkLabel;
begin
  Result := TFSkLabel.Create;
end;

function InitSkAnimatedPaintBox: FSkAnimatedPaintBox;
begin
  Result := TFSkAnimatedPaintBox.Create;
end;

function InitSkAnimatedImage: FSkAnimatedImage;
begin
  Result := TFSkAnimatedImage.Create;
end;

function InitSkSvg: FSkSvg;
begin
  Result := TFSkSvg.Create;
end;

function InitSkPaint: FSkPaint;
begin
  Result := TFSkPaint.Create;
end;

function InitSkPaintBox: FSkPaintBox;
begin
  Result := TFSkPaintBox.Create;
end;

function InitSkShader: FSkShader;
begin
  Result := TFSkShader.Create;
end;

function InitSkPathBuilder: FSkPathBuilder;
begin
  Result := TFSkPathBuilder.Create;
end;

function InitSkRoundRect: FSkRoundRect;
begin
  Result := TFSkRoundRect.Create;
end;

function InitSkImage: FSkImage;
begin
  Result := TFSkImage.Create;
end;

function InitSkTypeface: FSkTypeface;
begin
  Result := TFSkTypeface.Create;
end;

function InitSkFont: FSkFont;
begin
  Result := TFSkFont.Create;
end;

function InitSkTextBlob: FSkTextBlob;
begin
  Result := TFSkTextBlob.Create;
end;

function InitSkColorFilter: FSkColorFilter;
begin
  Result := TFSkColorFilter.Create;
end;

function InitSkPathEffect: FSkPathEffect;
begin
  Result := TFSkPathEffect.Create;
end;

function InitSkShaper: FSkShaper;
begin
  Result := TFSkShaper.Create;
end;

function InitSkParagraphStyle: FSkParagraphStyle;
begin
  Result := TFSkParagraphStyle.Create;
end;

function InitSkTextStyle: FSkTextStyle;
begin
  Result := TFSkTextStyle.Create;
end;

function InitSkParagraphBuilder: FSkParagraphBuilder;
begin
  Result := TFSkParagraphBuilder.Create;
end;

function InitSkParagraph: FSkParagraph;
begin
  Result := TFSkParagraph.Create;
end;

function InitPolygon: FPolygon;
begin
  Result := TFPolygon.Create;
end;

exports
  InitSkLabelFontStyle,
  InitSkLabel,
  InitSkAnimatedPaintBox,
  InitSkAnimatedImage,
  InitSkSvg,
  InitSkPaint,
  InitSkPaintBox,
  InitSkShader,
  InitSkPathBuilder,
  InitSkRoundRect,
  InitSkImage,
  InitSkTypeface,
  InitSkFont,
  InitSkTextBlob,
  InitSkColorFilter,
  InitSkPathEffect,
  InitSkShaper,
  InitSkParagraphStyle,
  InitSkTextStyle,
  InitSkParagraphBuilder,
  InitSkParagraph,
  InitPolygon,
  InstallSkiaFonts;

end.
