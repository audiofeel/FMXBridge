
unit FMXBridge.Effects;

interface

uses
  System.UITypes,
  FMX.Types, FMX.Effects, FMX.Filter.Effects;

// =============================================================================
// FShadowEffect
// =============================================================================
type
  FShadowEffect = interface(IUnknown)
    ['{CDE4ADAE-F250-4745-9BDE-E7FAD6416F10}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Direction(FDirection: Single); stdcall;
    procedure Distance(FDistance: Single); stdcall;
    procedure ShadowColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Softness(FSoftness: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFShadowEffect = class(TInterfacedObject, FShadowEffect)
  private
    ControlShadow: TShadowEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Direction(FDirection: Single); stdcall;
    procedure Distance(FDistance: Single); stdcall;
    procedure ShadowColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Softness(FSoftness: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBlurEffect
// =============================================================================
type
  FBlurEffect = interface(IUnknown)
    ['{79647B4E-3AC3-4799-B85C-3F0B6502BD50}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Softness(FSoftness: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBlurEffect = class(TInterfacedObject, FBlurEffect)
  private
    ControlBlur: TBlurEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Softness(FSoftness: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FGlowEffect
// =============================================================================
type
  FGlowEffect = interface(IUnknown)
    ['{D1162019-9C6F-4D48-89B2-19A98DBAD4CB}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure GlowColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Softness(FSoftness: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFGlowEffect = class(TInterfacedObject, FGlowEffect)
  private
    ControlGlow: TGlowEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure GlowColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Softness(FSoftness: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FInnerGlowEffect
// =============================================================================
type
  FInnerGlowEffect = interface(IUnknown)
    ['{4226FD5D-3B2F-4616-B9A6-46EFDA4BE943}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure GlowColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Softness(FSoftness: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFInnerGlowEffect = class(TInterfacedObject, FInnerGlowEffect)
  private
    ControlInnerGlow: TInnerGlowEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure GlowColor(FColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Softness(FSoftness: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBevelEffect
// =============================================================================
type
  FBevelEffect = interface(IUnknown)
    ['{B1A02D1C-912B-4FEE-A06C-2F6FB13E153F}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Direction(FDirection: Single); stdcall;
    procedure Size(FSize: Integer); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBevelEffect = class(TInterfacedObject, FBevelEffect)
  private
    ControlBevel: TBevelEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Direction(FDirection: Single); stdcall;
    procedure Size(FSize: Integer); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FReflectionEffect
// =============================================================================
type
  FReflectionEffect = interface(IUnknown)
    ['{93F6A9A9-A175-43DC-9FF6-F8678F671E0F}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Length(FLength: Single); stdcall;
    procedure Offset(FOffset: Integer); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    function GetOpacity: Single; stdcall;
  end;

  TFReflectionEffect = class(TInterfacedObject, FReflectionEffect)
  private
    ControlReflection: TReflectionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Length(FLength: Single); stdcall;
    procedure Offset(FOffset: Integer); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    function GetOpacity: Single; stdcall;
  end;

// =============================================================================
// FRippleEffect
// =============================================================================
type
  FRippleEffect = interface(IUnknown)
    ['{67158629-EDF1-4689-897B-5C3553DE6F18}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Amplitude(FValue: Single); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure Frequency(FValue: Single); stdcall;
    procedure Phase(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFRippleEffect = class(TInterfacedObject, FRippleEffect)
  private
    ControlRipple: TRippleEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Amplitude(FValue: Single); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure Frequency(FValue: Single); stdcall;
    procedure Phase(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FSwirlEffect
// =============================================================================
type
  FSwirlEffect = interface(IUnknown)
    ['{1868E8EB-BCC9-480A-9613-6BDF936B16EA}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure SpiralStrength(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFSwirlEffect = class(TInterfacedObject, FSwirlEffect)
  private
    ControlSwirl: TSwirlEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure SpiralStrength(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FMagnifyEffect
// =============================================================================
type
  FMagnifyEffect = interface(IUnknown)
    ['{E47FE9A7-A6C4-4210-B1EE-3C045CDBCECE}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure Radius(FValue: Single); stdcall;
    procedure Magnification(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFMagnifyEffect = class(TInterfacedObject, FMagnifyEffect)
  private
    ControlMagnify: TMagnifyEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure Radius(FValue: Single); stdcall;
    procedure Magnification(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FSmoothMagnifyEffect
// =============================================================================
type
  FSmoothMagnifyEffect = interface(IUnknown)
    ['{C75C12ED-031E-41BD-923B-05CBD2D4317E}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure InnerRadius(FValue: Single); stdcall;
    procedure OuterRadius(FValue: Single); stdcall;
    procedure Magnification(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFSmoothMagnifyEffect = class(TInterfacedObject, FSmoothMagnifyEffect)
  private
    ControlSmoothMagnify: TSmoothMagnifyEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure InnerRadius(FValue: Single); stdcall;
    procedure OuterRadius(FValue: Single); stdcall;
    procedure Magnification(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBandsEffect
// =============================================================================
type
  FBandsEffect = interface(IUnknown)
    ['{1F2253DF-BBEA-40B2-A494-8BBD0CCF3115}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BandDensity(FValue: Single); stdcall;
    procedure BandIntensity(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBandsEffect = class(TInterfacedObject, FBandsEffect)
  private
    ControlBands: TBandsEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BandDensity(FValue: Single); stdcall;
    procedure BandIntensity(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FWaveEffect
// =============================================================================
type
  FWaveEffect = interface(IUnknown)
    ['{B39BD52E-7964-4FA7-AE1E-6C1C01C68563}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Time(FValue: Single); stdcall;
    procedure WaveSize(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFWaveEffect = class(TInterfacedObject, FWaveEffect)
  private
    ControlWave: TWaveEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Time(FValue: Single); stdcall;
    procedure WaveSize(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FWrapEffect
// =============================================================================
type
  FWrapEffect = interface(IUnknown)
    ['{217D506E-C0CE-45F3-9379-3EE279181AE2}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure LeftStart(FValue: Single); stdcall;
    procedure LeftControl1(FValue: Single); stdcall;
    procedure LeftControl2(FValue: Single); stdcall;
    procedure LeftEnd(FValue: Single); stdcall;
    procedure RightStart(FValue: Single); stdcall;
    procedure RightControl1(FValue: Single); stdcall;
    procedure RightControl2(FValue: Single); stdcall;
    procedure RightEnd(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFWrapEffect = class(TInterfacedObject, FWrapEffect)
  private
    ControlWrap: TWrapEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure LeftStart(FValue: Single); stdcall;
    procedure LeftControl1(FValue: Single); stdcall;
    procedure LeftControl2(FValue: Single); stdcall;
    procedure LeftEnd(FValue: Single); stdcall;
    procedure RightStart(FValue: Single); stdcall;
    procedure RightControl1(FValue: Single); stdcall;
    procedure RightControl2(FValue: Single); stdcall;
    procedure RightEnd(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBandedSwirlEffect
// =============================================================================
type
  FBandedSwirlEffect = interface(IUnknown)
    ['{253C5D42-C080-4727-BBE4-3EEAA71D9798}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure Bands(FValue: Single); stdcall;
    procedure Strength(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBandedSwirlEffect = class(TInterfacedObject, FBandedSwirlEffect)
  private
    ControlBandedSwirl: TBandedSwirlEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure Bands(FValue: Single); stdcall;
    procedure Strength(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FPinchEffect
// =============================================================================
type
  FPinchEffect = interface(IUnknown)
    ['{41C195FC-49BA-4E15-B50F-4A23ADE0C115}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure Radius(FValue: Single); stdcall;
    procedure Strength(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFPinchEffect = class(TInterfacedObject, FPinchEffect)
  private
    ControlPinch: TPinchEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure AspectRatio(FValue: Single); stdcall;
    procedure Radius(FValue: Single); stdcall;
    procedure Strength(FValue: Single); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FTilerEffect
// =============================================================================
type
  FTilerEffect = interface(IUnknown)
    ['{F6E71122-420D-4B57-A2EA-3AA6E75E6CFB}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure VerticalTileCount(FValue: Single); stdcall;
    procedure VerticalOffset(FValue: Single); stdcall;
    procedure HorizontalTileCount(FValue: Single); stdcall;
    procedure HorizontalOffset(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFTilerEffect = class(TInterfacedObject, FTilerEffect)
  private
    ControlTiler: TTilerEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure VerticalTileCount(FValue: Single); stdcall;
    procedure VerticalOffset(FValue: Single); stdcall;
    procedure HorizontalTileCount(FValue: Single); stdcall;
    procedure HorizontalOffset(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FPixelateEffect
// =============================================================================
type
  FPixelateEffect = interface(IUnknown)
    ['{5292163A-216C-496F-BB6D-C3FCB308325D}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlockCount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFPixelateEffect = class(TInterfacedObject, FPixelateEffect)
  private
    ControlPixelate: TPixelateEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlockCount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FEmbossEffect
// =============================================================================
type
  FEmbossEffect = interface(IUnknown)
    ['{D8E2C1B7-3571-46FA-B0B5-DD4275EEC1BC}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Amount(FValue: Single); stdcall;
    procedure Width(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFEmbossEffect = class(TInterfacedObject, FEmbossEffect)
  private
    ControlEmboss: TEmbossEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Amount(FValue: Single); stdcall;
    procedure Width(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FSharpenEffect
// =============================================================================
type
  FSharpenEffect = interface(IUnknown)
    ['{8520DE1D-23E5-4F46-83DE-B3C7C5B22624}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Amount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFSharpenEffect = class(TInterfacedObject, FSharpenEffect)
  private
    ControlSharpen: TSharpenEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Amount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FToonEffect
// =============================================================================
type
  FToonEffect = interface(IUnknown)
    ['{5FD34163-EC47-42DC-BCCD-559EB3C2AEA3}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Levels(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFToonEffect = class(TInterfacedObject, FToonEffect)
  private
    ControlToon: TToonEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Levels(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FSepiaEffect
// =============================================================================
type
  FSepiaEffect = interface(IUnknown)
    ['{417ED636-BBD9-49F4-94B9-BE26515C9C97}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Amount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFSepiaEffect = class(TInterfacedObject, FSepiaEffect)
  private
    ControlSepia: TSepiaEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Amount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FPaperSketchEffect
// =============================================================================
type
  FPaperSketchEffect = interface(IUnknown)
    ['{94636DD6-2A22-45A7-8C6C-DC6EB6FBFB3F}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure brushSize(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFPaperSketchEffect = class(TInterfacedObject, FPaperSketchEffect)
  private
    ControlPaperSketch: TPaperSketchEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure brushSize(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FPencilStrokeEffect
// =============================================================================
type
  FPencilStrokeEffect = interface(IUnknown)
    ['{32C4D314-5745-4D94-A867-0ABB65B6EEE9}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure brushSize(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFPencilStrokeEffect = class(TInterfacedObject, FPencilStrokeEffect)
  private
    ControlPencilStroke: TPencilStrokeEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure brushSize(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FFillEffect
// =============================================================================
type
  FFillEffect = interface(IUnknown)
    ['{CB29068B-78F7-4F4E-A149-08BDC156A0BD}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFFillEffect = class(TInterfacedObject, FFillEffect)
  private
    ControlFill: TFillEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FFillRGBEffect
// =============================================================================
type
  FFillRGBEffect = interface(IUnknown)
    ['{3323CB91-449F-45B3-81FA-21C5C60A3B66}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFFillRGBEffect = class(TInterfacedObject, FFillRGBEffect)
  private
    ControlFillRGB: TFillRGBEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FNormalBlendEffect
// =============================================================================
type
  FNormalBlendEffect = interface(IUnknown)
    ['{F8833348-1593-46CD-89E6-CAC117E8D164}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFNormalBlendEffect = class(TInterfacedObject, FNormalBlendEffect)
  private
    ControlNormalBlend: TNormalBlendEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FHueAdjustEffect
// =============================================================================
type
  FHueAdjustEffect = interface(IUnknown)
    ['{56D02150-965A-436F-A0C1-E827480F20CA}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Hue(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFHueAdjustEffect = class(TInterfacedObject, FHueAdjustEffect)
  private
    ControlHueAdjust: THueAdjustEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Hue(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FContrastEffect
// =============================================================================
type
  FContrastEffect = interface(IUnknown)
    ['{43B50E8E-F5AD-4CAF-8470-52CBC3EC1FAA}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Contrast(FValue: Single); stdcall;
    procedure Brightness(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFContrastEffect = class(TInterfacedObject, FContrastEffect)
  private
    ControlContrast: TContrastEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Contrast(FValue: Single); stdcall;
    procedure Brightness(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBloomEffect
// =============================================================================
type
  FBloomEffect = interface(IUnknown)
    ['{FA3E4C1B-33B4-416E-8D70-50277A66FE36}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BloomIntensity(FValue: Single); stdcall;
    procedure BaseIntensity(FValue: Single); stdcall;
    procedure BloomSaturation(FValue: Single); stdcall;
    procedure BaseSaturation(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBloomEffect = class(TInterfacedObject, FBloomEffect)
  private
    ControlBloom: TBloomEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BloomIntensity(FValue: Single); stdcall;
    procedure BaseIntensity(FValue: Single); stdcall;
    procedure BloomSaturation(FValue: Single); stdcall;
    procedure BaseSaturation(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FGloomEffect
// =============================================================================
type
  FGloomEffect = interface(IUnknown)
    ['{E7FF9F4F-6553-494F-91BF-6CA92DB99139}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure GloomIntensity(FValue: Single); stdcall;
    procedure GloomSaturation(FValue: Single); stdcall;
    procedure BaseIntensity(FValue: Single); stdcall;
    procedure BaseSaturation(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFGloomEffect = class(TInterfacedObject, FGloomEffect)
  private
    ControlGloom: TGloomEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure GloomIntensity(FValue: Single); stdcall;
    procedure GloomSaturation(FValue: Single); stdcall;
    procedure BaseIntensity(FValue: Single); stdcall;
    procedure BaseSaturation(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FInvertEffect
// =============================================================================
type
  FInvertEffect = interface(IUnknown)
    ['{893386B7-B23F-4029-BD72-C1EC696B7B64}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFInvertEffect = class(TInterfacedObject, FInvertEffect)
  private
    ControlInvert: TInvertEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FMonochromeEffect
// =============================================================================
type
  FMonochromeEffect = interface(IUnknown)
    ['{0F27172A-46F9-4462-BD12-E94F6DFA61A6}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFMonochromeEffect = class(TInterfacedObject, FMonochromeEffect)
  private
    ControlMonochrome: TMonochromeEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FColorKeyAlphaEffect
// =============================================================================
type
  FColorKeyAlphaEffect = interface(IUnknown)
    ['{EC313112-680D-4A69-ADC6-96DA115C5196}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure ColorKey(FColor: TAlphaColor); stdcall;
    procedure Tolerance(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFColorKeyAlphaEffect = class(TInterfacedObject, FColorKeyAlphaEffect)
  private
    ControlColorKeyAlpha: TColorKeyAlphaEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure ColorKey(FColor: TAlphaColor); stdcall;
    procedure Tolerance(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FMaskToAlphaEffect
// =============================================================================
type
  FMaskToAlphaEffect = interface(IUnknown)
    ['{4BEF2DE1-B9E6-4C63-A23A-520CE5E85FDC}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFMaskToAlphaEffect = class(TInterfacedObject, FMaskToAlphaEffect)
  private
    ControlMaskToAlpha: TMaskToAlphaEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBandedSwirlTransitionEffect
// =============================================================================
type
  FBandedSwirlTransitionEffect = interface(IUnknown)
    ['{AF4D3BE7-8F8D-46DC-8F86-45832DCB6593}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure Strength(FValue: Single); stdcall;
    procedure Frequency(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBandedSwirlTransitionEffect = class(TInterfacedObject,
    FBandedSwirlTransitionEffect)
  private
    ControlBandedSwirlTransition: TBandedSwirlTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure Strength(FValue: Single); stdcall;
    procedure Frequency(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBlindTransitionEffect
// =============================================================================
type
  FBlindTransitionEffect = interface(IUnknown)
    ['{DD85B733-3BD1-46F3-A92E-58D96ED07A8C}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure NumberOfBlinds(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBlindTransitionEffect = class(TInterfacedObject, FBlindTransitionEffect)
  private
    ControlBlindTransition: TBlindTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure NumberOfBlinds(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBloodTransitionEffect
// =============================================================================
type
  FBloodTransitionEffect = interface(IUnknown)
    ['{E5A956CC-6D9F-4E3C-BE0B-87402DE3D061}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBloodTransitionEffect = class(TInterfacedObject, FBloodTransitionEffect)
  private
    ControlBloodTransition: TBloodTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FCircleTransitionEffect
// =============================================================================
type
  FCircleTransitionEffect = interface(IUnknown)
    ['{2A1EC12B-908B-410E-9F9A-F7763A22BDE2}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure FuzzyAmount(FValue: Single); stdcall;
    procedure CircleSize(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFCircleTransitionEffect = class(TInterfacedObject, FCircleTransitionEffect)
  private
    ControlCircleTransition: TCircleTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure FuzzyAmount(FValue: Single); stdcall;
    procedure CircleSize(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FMagnifyTransitionEffect
// =============================================================================
type
  FMagnifyTransitionEffect = interface(IUnknown)
    ['{E1996089-D4C9-4B22-915C-04F83EA800B6}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFMagnifyTransitionEffect = class(TInterfacedObject, FMagnifyTransitionEffect)
  private
    ControlMagnifyTransition: TMagnifyTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FCrumpleTransitionEffect
// =============================================================================
type
  FCrumpleTransitionEffect = interface(IUnknown)
    ['{8CEDF9F4-9560-4124-9044-368D9F30A78E}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFCrumpleTransitionEffect = class(TInterfacedObject, FCrumpleTransitionEffect)
  private
    ControlCrumpleTransition: TCrumpleTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FDissolveTransitionEffect
// =============================================================================
type
  FDissolveTransitionEffect = interface(IUnknown)
    ['{851A58BF-0628-40EA-82DC-4F3F00EFA715}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFDissolveTransitionEffect = class(TInterfacedObject,
    FDissolveTransitionEffect)
  private
    ControlDissolveTransition: TDissolveTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FDropTransitionEffect
// =============================================================================
type
  FDropTransitionEffect = interface(IUnknown)
    ['{B85F2878-C1FD-4F6C-A568-23D33306F52A}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFDropTransitionEffect = class(TInterfacedObject, FDropTransitionEffect)
  private
    ControlDropTransition: TDropTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FFadeTransitionEffect
// =============================================================================
type
  FFadeTransitionEffect = interface(IUnknown)
    ['{14AC3864-452F-44C0-807B-2BE8D635D200}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFFadeTransitionEffect = class(TInterfacedObject, FFadeTransitionEffect)
  private
    ControlFadeTransition: TFadeTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBrightTransitionEffect
// =============================================================================
type
  FBrightTransitionEffect = interface(IUnknown)
    ['{3B6732E2-051C-46EB-8308-1C265EBF5B31}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBrightTransitionEffect = class(TInterfacedObject, FBrightTransitionEffect)
  private
    ControlBrightTransition: TBrightTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FPixelateTransitionEffect
// =============================================================================
type
  FPixelateTransitionEffect = interface(IUnknown)
    ['{FD48CBE0-C172-4B94-8815-B289184B6C13}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFPixelateTransitionEffect = class(TInterfacedObject,
    FPixelateTransitionEffect)
  private
    ControlPixelateTransition: TPixelateTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBlurTransitionEffect
// =============================================================================
type
  FBlurTransitionEffect = interface(IUnknown)
    ['{BEB31904-63B1-4B75-AB71-BA6920760233}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBlurTransitionEffect = class(TInterfacedObject, FBlurTransitionEffect)
  private
    ControlBlurTransition: TBlurTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FWiggleTransitionEffect
// =============================================================================
type
  FWiggleTransitionEffect = interface(IUnknown)
    ['{EA4E11FA-D07F-42E2-81B9-F7D74BCC8B80}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFWiggleTransitionEffect = class(TInterfacedObject, FWiggleTransitionEffect)
  private
    ControlWiggleTransition: TWiggleTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FShapeTransitionEffect
// =============================================================================
type
  FShapeTransitionEffect = interface(IUnknown)
    ['{86FCA73D-3F47-4008-BE87-4AF7D77A5B31}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFShapeTransitionEffect = class(TInterfacedObject, FShapeTransitionEffect)
  private
    ControlShapeTransition: TShapeTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FRippleTransitionEffect
// =============================================================================
type
  FRippleTransitionEffect = interface(IUnknown)
    ['{EDA8FDF3-E5D1-4ADA-8049-46EF1AA95F34}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFRippleTransitionEffect = class(TInterfacedObject, FRippleTransitionEffect)
  private
    ControlRippleTransition: TRippleTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FRotateCrumpleTransitionEffect
// =============================================================================
type
  FRotateCrumpleTransitionEffect = interface(IUnknown)
    ['{F52F9F9E-F8B4-43D6-BEB6-DFAC432C9965}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFRotateCrumpleTransitionEffect = class(TInterfacedObject,
    FRotateCrumpleTransitionEffect)
  private
    ControlRotateCrumpleTransition: TRotateCrumpleTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FSaturateTransitionEffect
// =============================================================================
type
  FSaturateTransitionEffect = interface(IUnknown)
    ['{B808B1D7-0974-498D-9035-6109439A68E0}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFSaturateTransitionEffect = class(TInterfacedObject,
    FSaturateTransitionEffect)
  private
    ControlSaturateTransition: TSaturateTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FSlideTransitionEffect
// =============================================================================
type
  FSlideTransitionEffect = interface(IUnknown)
    ['{6402D787-A3FD-4600-9CE3-F8311765AD7D}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure SlideAmount(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFSlideTransitionEffect = class(TInterfacedObject, FSlideTransitionEffect)
  private
    ControlSlideTransition: TSlideTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure SlideAmount(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FSwirlTransitionEffect
// =============================================================================
type
  FSwirlTransitionEffect = interface(IUnknown)
    ['{CDEE2055-9F26-4704-B810-7EE8F5938D9E}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure Strength(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFSwirlTransitionEffect = class(TInterfacedObject, FSwirlTransitionEffect)
  private
    ControlSwirlTransition: TSwirlTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure Strength(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FWaterTransitionEffect
// =============================================================================
type
  FWaterTransitionEffect = interface(IUnknown)
    ['{FC553E7E-0C81-4FE3-BC89-0B7DCC529815}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFWaterTransitionEffect = class(TInterfacedObject, FWaterTransitionEffect)
  private
    ControlWaterTransition: TWaterTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure RandomSeed(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FWaveTransitionEffect
// =============================================================================
type
  FWaveTransitionEffect = interface(IUnknown)
    ['{F0BBEA60-F229-4717-8220-765D321A72CF}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFWaveTransitionEffect = class(TInterfacedObject, FWaveTransitionEffect)
  private
    ControlWaveTransition: TWaveTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FLineTransitionEffect
// =============================================================================
type
  FLineTransitionEffect = interface(IUnknown)
    ['{73A495BF-42D6-4611-A857-664DF43F6A6C}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Origin(X, Y: Single); stdcall;
    procedure Normal(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure FuzzyAmount(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFLineTransitionEffect = class(TInterfacedObject, FLineTransitionEffect)
  private
    ControlLineTransition: TLineTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Origin(X, Y: Single); stdcall;
    procedure Normal(X, Y: Single); stdcall;
    procedure Progress(FValue: Single); stdcall;
    procedure FuzzyAmount(FValue: Single); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FAffineTransformEffect
// =============================================================================
type
  FAffineTransformEffect = interface(IUnknown)
    ['{9265C014-1C8E-4C77-830E-D74912CC449B}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Rotation(FValue: Single); stdcall;
    procedure Scale(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFAffineTransformEffect = class(TInterfacedObject, FAffineTransformEffect)
  private
    ControlAffineTransform: TAffineTransformEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Center(X, Y: Single); stdcall;
    procedure Rotation(FValue: Single); stdcall;
    procedure Scale(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FPerspectiveTransformEffect
// =============================================================================
type
  FPerspectiveTransformEffect = interface(IUnknown)
    ['{4F22CBF0-7ECD-4ADA-B16A-75EC0842C2F9}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure TopLeft(X, Y: Single); stdcall;
    procedure TopRight(X, Y: Single); stdcall;
    procedure BottomRight(X, Y: Single); stdcall;
    procedure BottomLeft(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFPerspectiveTransformEffect = class(TInterfacedObject,
    FPerspectiveTransformEffect)
  private
    ControlPerspectiveTransform: TPerspectiveTransformEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure TopLeft(X, Y: Single); stdcall;
    procedure TopRight(X, Y: Single); stdcall;
    procedure BottomRight(X, Y: Single); stdcall;
    procedure BottomLeft(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FCropEffect
// =============================================================================
type
  FCropEffect = interface(IUnknown)
    ['{AE3FBB53-2047-4091-B1D8-137BBCDBA3E3}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure LeftTop(X, Y: Single); stdcall;
    procedure RightBottom(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFCropEffect = class(TInterfacedObject, FCropEffect)
  private
    ControlCrop: TCropEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure LeftTop(X, Y: Single); stdcall;
    procedure RightBottom(X, Y: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FGaussianBlurEffect
// =============================================================================
type
  FGaussianBlurEffect = interface(IUnknown)
    ['{97663366-6D27-4161-BBF4-9B9DBDF4CC34}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFGaussianBlurEffect = class(TInterfacedObject, FGaussianBlurEffect)
  private
    ControlGaussianBlur: TGaussianBlurEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FBoxBlurEffect
// =============================================================================
type
  FBoxBlurEffect = interface(IUnknown)
    ['{995C1D9B-9674-419D-9D3B-6DA083A2461D}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFBoxBlurEffect = class(TInterfacedObject, FBoxBlurEffect)
  private
    ControlBoxBlur: TBoxBlurEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FDirectionalBlurEffect
// =============================================================================
type
  FDirectionalBlurEffect = interface(IUnknown)
    ['{61D2AF80-C1CF-4618-8F62-42E58BD936B7}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
    procedure Angle(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFDirectionalBlurEffect = class(TInterfacedObject, FDirectionalBlurEffect)
  private
    ControlDirectionalBlur: TDirectionalBlurEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
    procedure Angle(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FRadialBlurEffect
// =============================================================================
type
  FRadialBlurEffect = interface(IUnknown)
    ['{BA4EB61D-571A-4A77-B57A-0F30BDF0BE9D}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFRadialBlurEffect = class(TInterfacedObject, FRadialBlurEffect)
  private
    ControlRadialBlur: TRadialBlurEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure BlurAmount(FValue: Single); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FSwipeTransitionEffect
// =============================================================================
type
  FSwipeTransitionEffect = interface(IUnknown)
    ['{8EAD71DF-4621-443F-B805-D7BDEF63F61F}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure MousePoint(X, Y: Single); stdcall;
    procedure CornerPoint(X, Y: Single); stdcall;
    procedure Deep(FValue: Single); stdcall;
    procedure BackImg(FImage: WideString); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFSwipeTransitionEffect = class(TInterfacedObject, FSwipeTransitionEffect)
  private
    ControlSwipeTransition: TSwipeTransitionEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure MousePoint(X, Y: Single); stdcall;
    procedure CornerPoint(X, Y: Single); stdcall;
    procedure Deep(FValue: Single); stdcall;
    procedure BackImg(FImage: WideString); stdcall;
    procedure SecondImg(FImage: WideString); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// FRasterEffect
// =============================================================================
type
  FRasterEffect = interface(IUnknown)
    ['{C0619EB9-4235-4948-80EA-729F379679A1}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

  TFRasterEffect = class(TInterfacedObject, FRasterEffect)
  private
    ControlRaster: TRasterEffect;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitShadowEffect: FShadowEffect; stdcall;
function InitBlurEffect: FBlurEffect; stdcall;
function InitGlowEffect: FGlowEffect; stdcall;
function InitInnerGlowEffect: FInnerGlowEffect; stdcall;
function InitBevelEffect: FBevelEffect; stdcall;
function InitReflectionEffect: FReflectionEffect; stdcall;
function InitRippleEffect: FRippleEffect; stdcall;
function InitMagnifyEffect: FMagnifyEffect; stdcall;
function InitSmoothMagnifyEffect: FSmoothMagnifyEffect; stdcall;
function InitBandsEffect: FBandsEffect; stdcall;
function InitWaveEffect: FWaveEffect; stdcall;
function InitWrapEffect: FWrapEffect; stdcall;
function InitBandedSwirlEffect: FBandedSwirlEffect; stdcall;
function InitPinchEffect: FPinchEffect; stdcall;
function InitTilerEffect: FTilerEffect; stdcall;
function InitPixelateEffect: FPixelateEffect; stdcall;
function InitEmbossEffect: FEmbossEffect; stdcall;
function InitSharpenEffect: FSharpenEffect; stdcall;
function InitToonEffect: FToonEffect; stdcall;
function InitSepiaEffect: FSepiaEffect; stdcall;
function InitPaperSketchEffect: FPaperSketchEffect; stdcall;
function InitPencilStrokeEffect: FPencilStrokeEffect; stdcall;
function InitFillEffect: FFillEffect; stdcall;
function InitFillRGBEffect: FFillRGBEffect; stdcall;
function InitNormalBlendEffect: FNormalBlendEffect; stdcall;
function InitHueAdjustEffect: FHueAdjustEffect; stdcall;
function InitContrastEffect: FContrastEffect; stdcall;
function InitBloomEffect: FBloomEffect; stdcall;
function InitGloomEffect: FGloomEffect; stdcall;
function InitInvertEffect: FInvertEffect; stdcall;
function InitMonochromeEffect: FMonochromeEffect; stdcall;
function InitColorKeyAlphaEffect: FColorKeyAlphaEffect; stdcall;
function InitMaskToAlphaEffect: FMaskToAlphaEffect; stdcall;
function InitBandedSwirlTransitionEffect: FBandedSwirlTransitionEffect; stdcall;
function InitBlindTransitionEffect: FBlindTransitionEffect; stdcall;
function InitBloodTransitionEffect: FBloodTransitionEffect; stdcall;
function InitCircleTransitionEffect: FCircleTransitionEffect; stdcall;
function InitMagnifyTransitionEffect: FMagnifyTransitionEffect; stdcall;
function InitCrumpleTransitionEffect: FCrumpleTransitionEffect; stdcall;
function InitDissolveTransitionEffect: FDissolveTransitionEffect; stdcall;
function InitDropTransitionEffect: FDropTransitionEffect; stdcall;
function InitFadeTransitionEffect: FFadeTransitionEffect; stdcall;
function InitBrightTransitionEffect: FBrightTransitionEffect; stdcall;
function InitPixelateTransitionEffect: FPixelateTransitionEffect; stdcall;
function InitBlurTransitionEffect: FBlurTransitionEffect; stdcall;
function InitWiggleTransitionEffect: FWiggleTransitionEffect; stdcall;
function InitShapeTransitionEffect: FShapeTransitionEffect; stdcall;
function InitRippleTransitionEffect: FRippleTransitionEffect; stdcall;
function InitRotateCrumpleTransitionEffect
    : FRotateCrumpleTransitionEffect; stdcall;
function InitSaturateTransitionEffect: FSaturateTransitionEffect; stdcall;
function InitSlideTransitionEffect: FSlideTransitionEffect; stdcall;
function InitSwirlTransitionEffect: FSwirlTransitionEffect; stdcall;
function InitWaterTransitionEffect: FWaterTransitionEffect; stdcall;
function InitWaveTransitionEffect: FWaveTransitionEffect; stdcall;
function InitLineTransitionEffect: FLineTransitionEffect; stdcall;
function InitAffineTransformEffect: FAffineTransformEffect; stdcall;
function InitPerspectiveTransformEffect: FPerspectiveTransformEffect; stdcall;
function InitCropEffect: FCropEffect; stdcall;
function InitGaussianBlurEffect: FGaussianBlurEffect; stdcall;
function InitBoxBlurEffect: FBoxBlurEffect; stdcall;
function InitDirectionalBlurEffect: FDirectionalBlurEffect; stdcall;
function InitRadialBlurEffect: FRadialBlurEffect; stdcall;
function InitSwipeTransitionEffect: FSwipeTransitionEffect; stdcall;
function InitRasterEffect: FRasterEffect; stdcall;

implementation

uses
  System.Types, FMX.Ani;

// ===== FShadowEffect =====
procedure TFShadowEffect.FCreate(FParent: TFmxObject);
begin
  ControlShadow := TShadowEffect.Create(nil);
  ControlShadow.Parent := TFmxObject(FParent);
end;

procedure TFShadowEffect.Enabled(FEnabled: Boolean);
begin
  ControlShadow.Enabled := FEnabled;
end;

procedure TFShadowEffect.Direction(FDirection: Single);
begin
  ControlShadow.Direction := FDirection;
end;

procedure TFShadowEffect.Distance(FDistance: Single);
begin
  ControlShadow.Distance := FDistance;
end;

procedure TFShadowEffect.ShadowColor(FColor: TAlphaColor);
begin
  ControlShadow.ShadowColor := TAlphaColor(FColor);
end;

procedure TFShadowEffect.Opacity(FOpacity: Single);
begin
  ControlShadow.Opacity := FOpacity;
end;

procedure TFShadowEffect.Softness(FSoftness: Single);
begin
  ControlShadow.Softness := FSoftness;
end;

procedure TFShadowEffect.Trigger(const FTrigger: WideString);
begin
  ControlShadow.Trigger := string(FTrigger);
end;

// ===== TFBlurEffect =====
procedure TFBlurEffect.FCreate(FParent: TFmxObject);
begin
  ControlBlur := TBlurEffect.Create(nil);
  ControlBlur.Parent := TFmxObject(FParent);
end;

procedure TFBlurEffect.Enabled(FEnabled: Boolean);
begin
  ControlBlur.Enabled := FEnabled;
end;

procedure TFBlurEffect.Softness(FSoftness: Single);
begin
  ControlBlur.Softness := FSoftness;
end;

procedure TFBlurEffect.Trigger(const FTrigger: WideString);
begin
  ControlBlur.Trigger := string(FTrigger);
end;

// ===== TFGlowEffect =====
procedure TFGlowEffect.FCreate(FParent: TFmxObject);
begin
  ControlGlow := TGlowEffect.Create(nil);
  ControlGlow.Parent := TFmxObject(FParent);
end;

procedure TFGlowEffect.Enabled(FEnabled: Boolean);
begin
  ControlGlow.Enabled := FEnabled;
end;

procedure TFGlowEffect.GlowColor(FColor: TAlphaColor);
begin
  ControlGlow.GlowColor := TAlphaColor(FColor);
end;

procedure TFGlowEffect.Opacity(FOpacity: Single);
begin
  ControlGlow.Opacity := FOpacity;
end;

procedure TFGlowEffect.Softness(FSoftness: Single);
begin
  ControlGlow.Softness := FSoftness;
end;

procedure TFGlowEffect.Trigger(const FTrigger: WideString);
begin
  ControlGlow.Trigger := string(FTrigger);
end;

// ===== TFInnerGlowEffect =====
procedure TFInnerGlowEffect.FCreate(FParent: TFmxObject);
begin
  ControlInnerGlow := TInnerGlowEffect.Create(nil);
  ControlInnerGlow.Parent := TFmxObject(FParent);
end;

procedure TFInnerGlowEffect.Enabled(FEnabled: Boolean);
begin
  ControlInnerGlow.Enabled := FEnabled;
end;

procedure TFInnerGlowEffect.GlowColor(FColor: TAlphaColor);
begin
  ControlInnerGlow.GlowColor := TAlphaColor(FColor);
end;

procedure TFInnerGlowEffect.Opacity(FOpacity: Single);
begin
  ControlInnerGlow.Opacity := FOpacity;
end;

procedure TFInnerGlowEffect.Softness(FSoftness: Single);
begin
  ControlInnerGlow.Softness := FSoftness;
end;

procedure TFInnerGlowEffect.Trigger(const FTrigger: WideString);
begin
  ControlInnerGlow.Trigger := string(FTrigger);
end;

// ===== TFBevelEffect =====
procedure TFBevelEffect.FCreate(FParent: TFmxObject);
begin
  ControlBevel := TBevelEffect.Create(nil);
  ControlBevel.Parent := TFmxObject(FParent);
end;

procedure TFBevelEffect.Enabled(FEnabled: Boolean);
begin
  ControlBevel.Enabled := FEnabled;
end;

procedure TFBevelEffect.Direction(FDirection: Single);
begin
  ControlBevel.Direction := FDirection;
end;

procedure TFBevelEffect.Size(FSize: Integer);
begin
  ControlBevel.Size := FSize;
end;

procedure TFBevelEffect.Trigger(const FTrigger: WideString);
begin
  ControlBevel.Trigger := string(FTrigger);
end;

// ===== TFReflectionEffect =====
procedure TFReflectionEffect.FCreate(FParent: TFmxObject);
begin
  ControlReflection := TReflectionEffect.Create(nil);
  ControlReflection.Parent := TFmxObject(FParent);
end;

procedure TFReflectionEffect.Enabled(FEnabled: Boolean);
begin
  ControlReflection.Enabled := FEnabled;
end;

procedure TFReflectionEffect.Length(FLength: Single);
begin
  ControlReflection.Length := FLength;
end;

procedure TFReflectionEffect.Offset(FOffset: Integer);
begin
  ControlReflection.Offset := FOffset;
end;

procedure TFReflectionEffect.Opacity(FOpacity: Single);
begin
  ControlReflection.Opacity := FOpacity;
end;

procedure TFReflectionEffect.Trigger(const FTrigger: WideString);
begin
  ControlReflection.Trigger := string(FTrigger);
end;

function TFReflectionEffect.GetOpacity: Single;
begin
  Result := ControlReflection.Opacity;
end;

// ===== TFRippleEffect =====
procedure TFRippleEffect.FCreate(FParent: TFmxObject);
begin
  ControlRipple := TRippleEffect.Create(nil);
  ControlRipple.Parent := TFmxObject(FParent);
end;

procedure TFRippleEffect.Enabled(FEnabled: Boolean);
begin
  ControlRipple.Enabled := FEnabled;
end;

procedure TFRippleEffect.Amplitude(FValue: Single);
begin
  ControlRipple.Amplitude := FValue;
end;

procedure TFRippleEffect.AspectRatio(FValue: Single);
begin
  ControlRipple.AspectRatio := FValue;
end;

procedure TFRippleEffect.Frequency(FValue: Single);
begin
  ControlRipple.Frequency := FValue;
end;

procedure TFRippleEffect.Phase(FValue: Single);
begin
  ControlRipple.Phase := FValue;
end;

procedure TFRippleEffect.Center(X, Y: Single);
begin
  ControlRipple.Center := PointF(X, Y);
end;

procedure TFRippleEffect.Trigger(const FTrigger: WideString);
begin
  ControlRipple.Trigger := string(FTrigger);
end;

// =====  TFSwirlEffect =====
procedure TFSwirlEffect.FCreate(FParent: TFmxObject);
begin
  ControlSwirl := TSwirlEffect.Create(nil);
  ControlSwirl.Parent := TFmxObject(FParent);
end;

procedure TFSwirlEffect.Enabled(FEnabled: Boolean);
begin
  ControlSwirl.Enabled := FEnabled;
end;

procedure TFSwirlEffect.AspectRatio(FValue: Single);
begin
  ControlSwirl.AspectRatio := FValue;
end;

procedure TFSwirlEffect.SpiralStrength(FValue: Single);
begin
  ControlSwirl.SpiralStrength := FValue;
end;

procedure TFSwirlEffect.Center(X, Y: Single);
begin
  ControlSwirl.Center := PointF(X, Y);
end;

procedure TFSwirlEffect.Trigger(const FTrigger: WideString);
begin
  ControlSwirl.Trigger := string(FTrigger);
end;

// ===== TFMagnifyEffect =====
procedure TFMagnifyEffect.FCreate(FParent: TFmxObject);
begin
  ControlMagnify := TMagnifyEffect.Create(nil);
  ControlMagnify.Parent := TFmxObject(FParent);
end;

procedure TFMagnifyEffect.Enabled(FEnabled: Boolean);
begin
  ControlMagnify.Enabled := FEnabled;
end;

procedure TFMagnifyEffect.AspectRatio(FValue: Single);
begin
  ControlMagnify.AspectRatio := FValue;
end;

procedure TFMagnifyEffect.Radius(FValue: Single);
begin
  ControlMagnify.Radius := FValue;
end;

procedure TFMagnifyEffect.Magnification(FValue: Single);
begin
  ControlMagnify.Magnification := FValue;
end;

procedure TFMagnifyEffect.Center(X, Y: Single);
begin
  ControlMagnify.Center := PointF(X, Y);
end;

procedure TFMagnifyEffect.Trigger(const FTrigger: WideString);
begin
  ControlMagnify.Trigger := string(FTrigger);
end;

// ===== TFSmoothMagnifyEffect =====
procedure TFSmoothMagnifyEffect.FCreate(FParent: TFmxObject);
begin
  ControlSmoothMagnify := TSmoothMagnifyEffect.Create(nil);
  ControlSmoothMagnify.Parent := TFmxObject(FParent);
end;

procedure TFSmoothMagnifyEffect.Enabled(FEnabled: Boolean);
begin
  ControlSmoothMagnify.Enabled := FEnabled;
end;

procedure TFSmoothMagnifyEffect.AspectRatio(FValue: Single);
begin
  ControlSmoothMagnify.AspectRatio := FValue;
end;

procedure TFSmoothMagnifyEffect.InnerRadius(FValue: Single);
begin
  ControlSmoothMagnify.InnerRadius := FValue;
end;

procedure TFSmoothMagnifyEffect.OuterRadius(FValue: Single);
begin
  ControlSmoothMagnify.OuterRadius := FValue;
end;

procedure TFSmoothMagnifyEffect.Magnification(FValue: Single);
begin
  ControlSmoothMagnify.Magnification := FValue;
end;

procedure TFSmoothMagnifyEffect.Center(X, Y: Single);
begin
  ControlSmoothMagnify.Center := PointF(X, Y);
end;

procedure TFSmoothMagnifyEffect.Trigger(const FTrigger: WideString);
begin
  ControlSmoothMagnify.Trigger := string(FTrigger);
end;

// ===== TFBandsEffect =====
procedure TFBandsEffect.FCreate(FParent: TFmxObject);
begin
  ControlBands := TBandsEffect.Create(nil);
  ControlBands.Parent := TFmxObject(FParent);
end;

procedure TFBandsEffect.Enabled(FEnabled: Boolean);
begin
  ControlBands.Enabled := FEnabled;
end;

procedure TFBandsEffect.BandDensity(FValue: Single);
begin
  ControlBands.BandDensity := FValue;
end;

procedure TFBandsEffect.BandIntensity(FValue: Single);
begin
  ControlBands.BandIntensity := FValue;
end;

procedure TFBandsEffect.Trigger(const FTrigger: WideString);
begin
  ControlBands.Trigger := string(FTrigger);
end;

// ===== TFWaveEffect =====
procedure TFWaveEffect.FCreate(FParent: TFmxObject);
begin
  ControlWave := TWaveEffect.Create(nil);
  ControlWave.Parent := TFmxObject(FParent);
end;

procedure TFWaveEffect.Enabled(FEnabled: Boolean);
begin
  ControlWave.Enabled := FEnabled;
end;

procedure TFWaveEffect.Time(FValue: Single);
begin
  ControlWave.Time := FValue;
end;

procedure TFWaveEffect.WaveSize(FValue: Single);
begin
  ControlWave.WaveSize := FValue;
end;

procedure TFWaveEffect.Trigger(const FTrigger: WideString);
begin
  ControlWave.Trigger := string(FTrigger);
end;

// ===== TFWrapEffect =====
procedure TFWrapEffect.FCreate(FParent: TFmxObject);
begin
  ControlWrap := TWrapEffect.Create(nil);
  ControlWrap.Parent := TFmxObject(FParent);
end;

procedure TFWrapEffect.Enabled(FEnabled: Boolean);
begin
  ControlWrap.Enabled := FEnabled;
end;

procedure TFWrapEffect.LeftStart(FValue: Single);
begin
  ControlWrap.LeftStart := FValue;
end;

procedure TFWrapEffect.LeftControl1(FValue: Single);
begin
  ControlWrap.LeftControl1 := FValue;
end;

procedure TFWrapEffect.LeftControl2(FValue: Single);
begin
  ControlWrap.LeftControl2 := FValue;
end;

procedure TFWrapEffect.LeftEnd(FValue: Single);
begin
  ControlWrap.LeftEnd := FValue;
end;

procedure TFWrapEffect.RightStart(FValue: Single);
begin
  ControlWrap.RightStart := FValue;
end;

procedure TFWrapEffect.RightControl1(FValue: Single);
begin
  ControlWrap.RightControl1 := FValue;
end;

procedure TFWrapEffect.RightControl2(FValue: Single);
begin
  ControlWrap.RightControl2 := FValue;
end;

procedure TFWrapEffect.RightEnd(FValue: Single);
begin
  ControlWrap.RightEnd := FValue;
end;

procedure TFWrapEffect.Trigger(const FTrigger: WideString);
begin
  ControlWrap.Trigger := string(FTrigger);
end;

// ===== TFBandedSwirlEffect =====
procedure TFBandedSwirlEffect.FCreate(FParent: TFmxObject);
begin
  ControlBandedSwirl := TBandedSwirlEffect.Create(nil);
  ControlBandedSwirl.Parent := TFmxObject(FParent);
end;

procedure TFBandedSwirlEffect.Enabled(FEnabled: Boolean);
begin
  ControlBandedSwirl.Enabled := FEnabled;
end;

procedure TFBandedSwirlEffect.AspectRatio(FValue: Single);
begin
  ControlBandedSwirl.AspectRatio := FValue;
end;

procedure TFBandedSwirlEffect.Bands(FValue: Single);
begin
  ControlBandedSwirl.Bands := FValue;
end;

procedure TFBandedSwirlEffect.Strength(FValue: Single);
begin
  ControlBandedSwirl.Strength := FValue;
end;

procedure TFBandedSwirlEffect.Center(X, Y: Single);
begin
  ControlBandedSwirl.Center := PointF(X, Y);
end;

procedure TFBandedSwirlEffect.Trigger(const FTrigger: WideString);
begin
  ControlBandedSwirl.Trigger := string(FTrigger);
end;

// ===== TFPinchEffect =====
procedure TFPinchEffect.FCreate(FParent: TFmxObject);
begin
  ControlPinch := TPinchEffect.Create(nil);
  ControlPinch.Parent := TFmxObject(FParent);
end;

procedure TFPinchEffect.Enabled(FEnabled: Boolean);
begin
  ControlPinch.Enabled := FEnabled;
end;

procedure TFPinchEffect.AspectRatio(FValue: Single);
begin
  ControlPinch.AspectRatio := FValue;
end;

procedure TFPinchEffect.Radius(FValue: Single);
begin
  ControlPinch.Radius := FValue;
end;

procedure TFPinchEffect.Strength(FValue: Single);
begin
  ControlPinch.Strength := FValue;
end;

procedure TFPinchEffect.Center(X, Y: Single);
begin
  ControlPinch.Center := PointF(X, Y);
end;

procedure TFPinchEffect.Trigger(const FTrigger: WideString);
begin
  ControlPinch.Trigger := string(FTrigger);
end;

// ===== TFTilerEffect =====
procedure TFTilerEffect.FCreate(FParent: TFmxObject);
begin
  ControlTiler := TTilerEffect.Create(nil);
  ControlTiler.Parent := TFmxObject(FParent);
end;

procedure TFTilerEffect.Enabled(FEnabled: Boolean);
begin
  ControlTiler.Enabled := FEnabled;
end;

procedure TFTilerEffect.VerticalTileCount(FValue: Single);
begin
  ControlTiler.VerticalTileCount := FValue;
end;

procedure TFTilerEffect.VerticalOffset(FValue: Single);
begin
  ControlTiler.VerticalOffset := FValue;
end;

procedure TFTilerEffect.HorizontalTileCount(FValue: Single);
begin
  ControlTiler.HorizontalTileCount := FValue;
end;

procedure TFTilerEffect.HorizontalOffset(FValue: Single);
begin
  ControlTiler.HorizontalOffset := FValue;
end;

procedure TFTilerEffect.Trigger(const FTrigger: WideString);
begin
  ControlTiler.Trigger := string(FTrigger);
end;

// ===== TFPixelateEffect =====
procedure TFPixelateEffect.FCreate(FParent: TFmxObject);
begin
  ControlPixelate := TPixelateEffect.Create(nil);
  ControlPixelate.Parent := TFmxObject(FParent);
end;

procedure TFPixelateEffect.Enabled(FEnabled: Boolean);
begin
  ControlPixelate.Enabled := FEnabled;
end;

procedure TFPixelateEffect.BlockCount(FValue: Single);
begin
  ControlPixelate.BlockCount := FValue;
end;

procedure TFPixelateEffect.Trigger(const FTrigger: WideString);
begin
  ControlPixelate.Trigger := string(FTrigger);
end;

// ===== TFEmbossEffect =====
procedure TFEmbossEffect.FCreate(FParent: TFmxObject);
begin
  ControlEmboss := TEmbossEffect.Create(nil);
  ControlEmboss.Parent := TFmxObject(FParent);
end;

procedure TFEmbossEffect.Enabled(FEnabled: Boolean);
begin
  ControlEmboss.Enabled := FEnabled;
end;

procedure TFEmbossEffect.Amount(FValue: Single);
begin
  ControlEmboss.Amount := FValue;
end;

procedure TFEmbossEffect.Width(FValue: Single);
begin
  ControlEmboss.Width := FValue;
end;

procedure TFEmbossEffect.Trigger(const FTrigger: WideString);
begin
  ControlEmboss.Trigger := string(FTrigger);
end;

// ===== TFSharpenEffect =====
procedure TFSharpenEffect.FCreate(FParent: TFmxObject);
begin
  ControlSharpen := TSharpenEffect.Create(nil);
  ControlSharpen.Parent := TFmxObject(FParent);
end;

procedure TFSharpenEffect.Enabled(FEnabled: Boolean);
begin
  ControlSharpen.Enabled := FEnabled;
end;

procedure TFSharpenEffect.Amount(FValue: Single);
begin
  ControlSharpen.Amount := FValue;
end;

procedure TFSharpenEffect.Trigger(const FTrigger: WideString);
begin
  ControlSharpen.Trigger := string(FTrigger);
end;

// ===== TFToonEffect =====
procedure TFToonEffect.FCreate(FParent: TFmxObject);
begin
  ControlToon := TToonEffect.Create(nil);
  ControlToon.Parent := TFmxObject(FParent);
end;

procedure TFToonEffect.Enabled(FEnabled: Boolean);
begin
  ControlToon.Enabled := FEnabled;
end;

procedure TFToonEffect.Levels(FValue: Single);
begin
  ControlToon.Levels := FValue;
end;

procedure TFToonEffect.Trigger(const FTrigger: WideString);
begin
  ControlToon.Trigger := string(FTrigger);
end;

// ===== TFSepiaEffect =====
procedure TFSepiaEffect.FCreate(FParent: TFmxObject);
begin
  ControlSepia := TSepiaEffect.Create(nil);
  ControlSepia.Parent := TFmxObject(FParent);
end;

procedure TFSepiaEffect.Enabled(FEnabled: Boolean);
begin
  ControlSepia.Enabled := FEnabled;
end;

procedure TFSepiaEffect.Amount(FValue: Single);
begin
  ControlSepia.Amount := FValue;
end;

procedure TFSepiaEffect.Trigger(const FTrigger: WideString);
begin
  ControlSepia.Trigger := string(FTrigger);
end;

// ===== TFPaperSketchEffect =====
procedure TFPaperSketchEffect.FCreate(FParent: TFmxObject);
begin
  ControlPaperSketch := TPaperSketchEffect.Create(nil);
  ControlPaperSketch.Parent := TFmxObject(FParent);
end;

procedure TFPaperSketchEffect.Enabled(FEnabled: Boolean);
begin
  ControlPaperSketch.Enabled := FEnabled;
end;

procedure TFPaperSketchEffect.brushSize(FValue: Single);
begin
  ControlPaperSketch.brushSize := FValue;
end;

procedure TFPaperSketchEffect.Trigger(const FTrigger: WideString);
begin
  ControlPaperSketch.Trigger := string(FTrigger);
end;

// ===== TFPencilStrokeEffect =====
procedure TFPencilStrokeEffect.FCreate(FParent: TFmxObject);
begin
  ControlPencilStroke := TPencilStrokeEffect.Create(nil);
  ControlPencilStroke.Parent := TFmxObject(FParent);
end;

procedure TFPencilStrokeEffect.Enabled(FEnabled: Boolean);
begin
  ControlPencilStroke.Enabled := FEnabled;
end;

procedure TFPencilStrokeEffect.brushSize(FValue: Single);
begin
  ControlPencilStroke.brushSize := FValue;
end;

procedure TFPencilStrokeEffect.Trigger(const FTrigger: WideString);
begin
  ControlPencilStroke.Trigger := string(FTrigger);
end;

// ===== TFillEffect =====
procedure TFFillEffect.FCreate(FParent: TFmxObject);
begin
  ControlFill := TFillEffect.Create(nil);
  ControlFill.Parent := TFmxObject(FParent);
end;

procedure TFFillEffect.Enabled(FEnabled: Boolean);
begin
  ControlFill.Enabled := FEnabled;
end;

procedure TFFillEffect.Color(FColor: TAlphaColor);
begin
  ControlFill.Color := TAlphaColor(FColor);
end;

procedure TFFillEffect.Trigger(const FTrigger: WideString);
begin
  ControlFill.Trigger := string(FTrigger);
end;

// ===== TFFillRGBEffect =====
procedure TFFillRGBEffect.FCreate(FParent: TFmxObject);
begin
  ControlFillRGB := TFillRGBEffect.Create(nil);
  ControlFillRGB.Parent := TFmxObject(FParent);
end;

procedure TFFillRGBEffect.Enabled(FEnabled: Boolean);
begin
  ControlFillRGB.Enabled := FEnabled;
end;

procedure TFFillRGBEffect.Color(FColor: TAlphaColor);
begin
  ControlFillRGB.Color := TAlphaColor(FColor);
end;

procedure TFFillRGBEffect.Trigger(const FTrigger: WideString);
begin
  ControlFillRGB.Trigger := string(FTrigger);
end;

// ===== TFNormalBlendEffect =====
procedure TFNormalBlendEffect.FCreate(FParent: TFmxObject);
begin
  ControlNormalBlend := TNormalBlendEffect.Create(nil);
  ControlNormalBlend.Parent := TFmxObject(FParent);
end;

procedure TFNormalBlendEffect.Enabled(FEnabled: Boolean);
begin
  ControlNormalBlend.Enabled := FEnabled;
end;

procedure TFNormalBlendEffect.Trigger(const FTrigger: WideString);
begin
  ControlNormalBlend.Trigger := string(FTrigger);
end;

// ===== TFHueAdjustEffect =====
procedure TFHueAdjustEffect.FCreate(FParent: TFmxObject);
begin
  ControlHueAdjust := THueAdjustEffect.Create(nil);
  ControlHueAdjust.Parent := TFmxObject(FParent);
end;

procedure TFHueAdjustEffect.Enabled(FEnabled: Boolean);
begin
  ControlHueAdjust.Enabled := FEnabled;
end;

procedure TFHueAdjustEffect.Hue(FValue: Single);
begin
  ControlHueAdjust.Hue := FValue;
end;

procedure TFHueAdjustEffect.Trigger(const FTrigger: WideString);
begin
  ControlHueAdjust.Trigger := string(FTrigger);
end;

// ===== TFContrastEffect =====
procedure TFContrastEffect.FCreate(FParent: TFmxObject);
begin
  ControlContrast := TContrastEffect.Create(nil);
  ControlContrast.Parent := TFmxObject(FParent);
end;

procedure TFContrastEffect.Enabled(FEnabled: Boolean);
begin
  ControlContrast.Enabled := FEnabled;
end;

procedure TFContrastEffect.Contrast(FValue: Single);
begin
  ControlContrast.Contrast := FValue;
end;

procedure TFContrastEffect.Brightness(FValue: Single);
begin
  ControlContrast.Brightness := FValue;
end;

procedure TFContrastEffect.Trigger(const FTrigger: WideString);
begin
  ControlContrast.Trigger := string(FTrigger);
end;

// ===== TFBloomEffect =====
procedure TFBloomEffect.FCreate(FParent: TFmxObject);
begin
  ControlBloom := TBloomEffect.Create(nil);
  ControlBloom.Parent := TFmxObject(FParent);
end;

procedure TFBloomEffect.Enabled(FEnabled: Boolean);
begin
  ControlBloom.Enabled := FEnabled;
end;

procedure TFBloomEffect.BloomIntensity(FValue: Single);
begin
  ControlBloom.BloomIntensity := FValue;
end;

procedure TFBloomEffect.BaseIntensity(FValue: Single);
begin
  ControlBloom.BaseIntensity := FValue;
end;

procedure TFBloomEffect.BloomSaturation(FValue: Single);
begin
  ControlBloom.BloomSaturation := FValue;
end;

procedure TFBloomEffect.BaseSaturation(FValue: Single);
begin
  ControlBloom.BaseSaturation := FValue;
end;

procedure TFBloomEffect.Trigger(const FTrigger: WideString);
begin
  ControlBloom.Trigger := string(FTrigger);
end;

// ===== TFGloomEffect =====
procedure TFGloomEffect.FCreate(FParent: TFmxObject);
begin
  ControlGloom := TGloomEffect.Create(nil);
  ControlGloom.Parent := TFmxObject(FParent);
end;

procedure TFGloomEffect.Enabled(FEnabled: Boolean);
begin
  ControlGloom.Enabled := FEnabled;
end;

procedure TFGloomEffect.GloomIntensity(FValue: Single);
begin
  ControlGloom.GloomIntensity := FValue;
end;

procedure TFGloomEffect.GloomSaturation(FValue: Single);
begin
  ControlGloom.GloomSaturation := FValue;
end;

procedure TFGloomEffect.BaseIntensity(FValue: Single);
begin
  ControlGloom.BaseIntensity := FValue;
end;

procedure TFGloomEffect.BaseSaturation(FValue: Single);
begin
  ControlGloom.BaseSaturation := FValue;
end;

procedure TFGloomEffect.Trigger(const FTrigger: WideString);
begin
  ControlGloom.Trigger := string(FTrigger);
end;

// ===== TFInvertEffect =====
procedure TFInvertEffect.FCreate(FParent: TFmxObject);
begin
  ControlInvert := TInvertEffect.Create(nil);
  ControlInvert.Parent := TFmxObject(FParent);
end;

procedure TFInvertEffect.Enabled(FEnabled: Boolean);
begin
  ControlInvert.Enabled := FEnabled;
end;

procedure TFInvertEffect.Trigger(const FTrigger: WideString);
begin
  ControlInvert.Trigger := string(FTrigger);
end;

// ===== TFMonochromeEffect =====
procedure TFMonochromeEffect.FCreate(FParent: TFmxObject);
begin
  ControlMonochrome := TMonochromeEffect.Create(nil);
  ControlMonochrome.Parent := TFmxObject(FParent);
end;

procedure TFMonochromeEffect.Enabled(FEnabled: Boolean);
begin
  ControlMonochrome.Enabled := FEnabled;
end;

procedure TFMonochromeEffect.Trigger(const FTrigger: WideString);
begin
  ControlMonochrome.Trigger := string(FTrigger);
end;

// ===== TFColorKeyAlphaEffect =====
procedure TFColorKeyAlphaEffect.FCreate(FParent: TFmxObject);
begin
  ControlColorKeyAlpha := TColorKeyAlphaEffect.Create(nil);
  ControlColorKeyAlpha.Parent := TFmxObject(FParent);
end;

procedure TFColorKeyAlphaEffect.Enabled(FEnabled: Boolean);
begin
  ControlColorKeyAlpha.Enabled := FEnabled;
end;

procedure TFColorKeyAlphaEffect.ColorKey(FColor: TAlphaColor);
begin
  ControlColorKeyAlpha.ColorKey := TAlphaColor(FColor);
end;

procedure TFColorKeyAlphaEffect.Tolerance(FValue: Single);
begin
  ControlColorKeyAlpha.Tolerance := FValue;
end;

procedure TFColorKeyAlphaEffect.Trigger(const FTrigger: WideString);
begin
  ControlColorKeyAlpha.Trigger := string(FTrigger);
end;

// ===== TFMaskToAlphaEffect =====
procedure TFMaskToAlphaEffect.FCreate(FParent: TFmxObject);
begin
  ControlMaskToAlpha := TMaskToAlphaEffect.Create(nil);
  ControlMaskToAlpha.Parent := TFmxObject(FParent);
end;

procedure TFMaskToAlphaEffect.Enabled(FEnabled: Boolean);
begin
  ControlMaskToAlpha.Enabled := FEnabled;
end;

procedure TFMaskToAlphaEffect.Trigger(const FTrigger: WideString);
begin
  ControlMaskToAlpha.Trigger := string(FTrigger);
end;

// ===== TFBandedSwirlTransitionEffect =====
procedure TFBandedSwirlTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlBandedSwirlTransition := TBandedSwirlTransitionEffect.Create(nil);
  ControlBandedSwirlTransition.Parent := TFmxObject(FParent);
end;

procedure TFBandedSwirlTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlBandedSwirlTransition.Enabled := FEnabled;
end;

procedure TFBandedSwirlTransitionEffect.Center(X, Y: Single);
begin
  ControlBandedSwirlTransition.Center := PointF(X, Y);
end;

procedure TFBandedSwirlTransitionEffect.Progress(FValue: Single);
begin
  ControlBandedSwirlTransition.Progress := FValue;
end;

procedure TFBandedSwirlTransitionEffect.Strength(FValue: Single);
begin
  ControlBandedSwirlTransition.Strength := FValue;
end;

procedure TFBandedSwirlTransitionEffect.Frequency(FValue: Single);
begin
  ControlBandedSwirlTransition.Frequency := FValue;
end;

procedure TFBandedSwirlTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlBandedSwirlTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFBandedSwirlTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlBandedSwirlTransition.Trigger := string(FTrigger);
end;

// ===== TFBlindTransitionEffect =====
procedure TFBlindTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlBlindTransition := TBlindTransitionEffect.Create(nil);
  ControlBlindTransition.Parent := TFmxObject(FParent);
end;

procedure TFBlindTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlBlindTransition.Enabled := FEnabled;
end;

procedure TFBlindTransitionEffect.Progress(FValue: Single);
begin
  ControlBlindTransition.Progress := FValue;
end;

procedure TFBlindTransitionEffect.NumberOfBlinds(FValue: Single);
begin
  ControlBlindTransition.NumberOfBlinds := FValue;
end;

procedure TFBlindTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlBlindTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFBlindTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlBlindTransition.Trigger := string(FTrigger);
end;

// ===== TFBloodTransitionEffect =====
procedure TFBloodTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlBloodTransition := TBloodTransitionEffect.Create(nil);
  ControlBloodTransition.Parent := TFmxObject(FParent);
end;

procedure TFBloodTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlBloodTransition.Enabled := FEnabled;
end;

procedure TFBloodTransitionEffect.Progress(FValue: Single);
begin
  ControlBloodTransition.Progress := FValue;
end;

procedure TFBloodTransitionEffect.RandomSeed(FValue: Single);
begin
  ControlBloodTransition.RandomSeed := FValue;
end;

procedure TFBloodTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlBloodTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFBloodTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlBloodTransition.Trigger := string(FTrigger);
end;

// ===== TFCircleTransitionEffect =====
procedure TFCircleTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlCircleTransition := TCircleTransitionEffect.Create(nil);
  ControlCircleTransition.Parent := TFmxObject(FParent);
end;

procedure TFCircleTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlCircleTransition.Enabled := FEnabled;
end;

procedure TFCircleTransitionEffect.Center(X, Y: Single);
begin
  ControlCircleTransition.Center := PointF(X, Y);
end;

procedure TFCircleTransitionEffect.Progress(FValue: Single);
begin
  ControlCircleTransition.Progress := FValue;
end;

procedure TFCircleTransitionEffect.FuzzyAmount(FValue: Single);
begin
  ControlCircleTransition.FuzzyAmount := FValue;
end;

procedure TFCircleTransitionEffect.CircleSize(FValue: Single);
begin
  ControlCircleTransition.CircleSize := FValue;
end;

procedure TFCircleTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlCircleTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFCircleTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlCircleTransition.Trigger := string(FTrigger);
end;

// ===== TFMagnifyTransitionEffect =====
procedure TFMagnifyTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlMagnifyTransition := TMagnifyTransitionEffect.Create(nil);
  ControlMagnifyTransition.Parent := TFmxObject(FParent);
end;

procedure TFMagnifyTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlMagnifyTransition.Enabled := FEnabled;
end;

procedure TFMagnifyTransitionEffect.Center(X, Y: Single);
begin
  ControlMagnifyTransition.Center := PointF(X, Y);
end;

procedure TFMagnifyTransitionEffect.Progress(FValue: Single);
begin
  ControlMagnifyTransition.Progress := FValue;
end;

procedure TFMagnifyTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlMagnifyTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFMagnifyTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlMagnifyTransition.Trigger := string(FTrigger);
end;

// ===== TFCrumpleTransitionEffect =====
procedure TFCrumpleTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlCrumpleTransition := TCrumpleTransitionEffect.Create(nil);
  ControlCrumpleTransition.Parent := TFmxObject(FParent);
end;

procedure TFCrumpleTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlCrumpleTransition.Enabled := FEnabled;
end;

procedure TFCrumpleTransitionEffect.Progress(FValue: Single);
begin
  ControlCrumpleTransition.Progress := FValue;
end;

procedure TFCrumpleTransitionEffect.RandomSeed(FValue: Single);
begin
  ControlCrumpleTransition.RandomSeed := FValue;
end;

procedure TFCrumpleTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlCrumpleTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFCrumpleTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlCrumpleTransition.Trigger := string(FTrigger);
end;

// ===== TFDissolveTransitionEffect =====
procedure TFDissolveTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlDissolveTransition := TDissolveTransitionEffect.Create(nil);
  ControlDissolveTransition.Parent := TFmxObject(FParent);
end;

procedure TFDissolveTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlDissolveTransition.Enabled := FEnabled;
end;

procedure TFDissolveTransitionEffect.Progress(FValue: Single);
begin
  ControlDissolveTransition.Progress := FValue;
end;

procedure TFDissolveTransitionEffect.RandomSeed(FValue: Single);
begin
  ControlDissolveTransition.RandomSeed := FValue;
end;

procedure TFDissolveTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlDissolveTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFDissolveTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlDissolveTransition.Trigger := string(FTrigger);
end;

// ===== TFDropTransitionEffect =====
procedure TFDropTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlDropTransition := TDropTransitionEffect.Create(nil);
  ControlDropTransition.Parent := TFmxObject(FParent);
end;

procedure TFDropTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlDropTransition.Enabled := FEnabled;
end;

procedure TFDropTransitionEffect.Progress(FValue: Single);
begin
  ControlDropTransition.Progress := FValue;
end;

procedure TFDropTransitionEffect.RandomSeed(FValue: Single);
begin
  ControlDropTransition.RandomSeed := FValue;
end;

procedure TFDropTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlDropTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFDropTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlDropTransition.Trigger := string(FTrigger);
end;

// ===== TFFadeTransitionEffect =====
procedure TFFadeTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlFadeTransition := TFadeTransitionEffect.Create(nil);
  ControlFadeTransition.Parent := TFmxObject(FParent);
end;

procedure TFFadeTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlFadeTransition.Enabled := FEnabled;
end;

procedure TFFadeTransitionEffect.Progress(FValue: Single);
begin
  ControlFadeTransition.Progress := FValue;
end;

procedure TFFadeTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlFadeTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFFadeTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlFadeTransition.Trigger := string(FTrigger);
end;

// ===== TFBrightTransitionEffect =====
procedure TFBrightTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlBrightTransition := TBrightTransitionEffect.Create(nil);
  ControlBrightTransition.Parent := TFmxObject(FParent);
end;

procedure TFBrightTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlBrightTransition.Enabled := FEnabled;
end;

procedure TFBrightTransitionEffect.Progress(FValue: Single);
begin
  ControlBrightTransition.Progress := FValue;
end;

procedure TFBrightTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlBrightTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFBrightTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlBrightTransition.Trigger := string(FTrigger);
end;

// ===== TFPixelateTransitionEffect =====
procedure TFPixelateTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlPixelateTransition := TPixelateTransitionEffect.Create(nil);
  ControlPixelateTransition.Parent := TFmxObject(FParent);
end;

procedure TFPixelateTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlPixelateTransition.Enabled := FEnabled;
end;

procedure TFPixelateTransitionEffect.Progress(FValue: Single);
begin
  ControlPixelateTransition.Progress := FValue;
end;

procedure TFPixelateTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlPixelateTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFPixelateTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlPixelateTransition.Trigger := string(FTrigger);
end;

// ===== TFBlurTransitionEffect =====
procedure TFBlurTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlBlurTransition := TBlurTransitionEffect.Create(nil);
  ControlBlurTransition.Parent := TFmxObject(FParent);
end;

procedure TFBlurTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlBlurTransition.Enabled := FEnabled;
end;

procedure TFBlurTransitionEffect.Progress(FValue: Single);
begin
  ControlBlurTransition.Progress := FValue;
end;

procedure TFBlurTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlBlurTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFBlurTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlBlurTransition.Trigger := string(FTrigger);
end;

// ===== TFWiggleTransitionEffect =====
procedure TFWiggleTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlWiggleTransition := TWiggleTransitionEffect.Create(nil);
  ControlWiggleTransition.Parent := TFmxObject(FParent);
end;

procedure TFWiggleTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlWiggleTransition.Enabled := FEnabled;
end;

procedure TFWiggleTransitionEffect.Progress(FValue: Single);
begin
  ControlWiggleTransition.Progress := FValue;
end;

procedure TFWiggleTransitionEffect.RandomSeed(FValue: Single);
begin
  ControlWiggleTransition.RandomSeed := FValue;
end;

procedure TFWiggleTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlWiggleTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFWiggleTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlWiggleTransition.Trigger := string(FTrigger);
end;

// ===== TFShapeTransitionEffect =====
procedure TFShapeTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlShapeTransition := TShapeTransitionEffect.Create(nil);
  ControlShapeTransition.Parent := TFmxObject(FParent);
end;

procedure TFShapeTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlShapeTransition.Enabled := FEnabled;
end;

procedure TFShapeTransitionEffect.Progress(FValue: Single);
begin
  ControlShapeTransition.Progress := FValue;
end;

procedure TFShapeTransitionEffect.RandomSeed(FValue: Single);
begin
  ControlShapeTransition.RandomSeed := FValue;
end;

procedure TFShapeTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlShapeTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFShapeTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlShapeTransition.Trigger := string(FTrigger);
end;

// ===== TFRippleTransitionEffect =====
procedure TFRippleTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlRippleTransition := TRippleTransitionEffect.Create(nil);
  ControlRippleTransition.Parent := TFmxObject(FParent);
end;

procedure TFRippleTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlRippleTransition.Enabled := FEnabled;
end;

procedure TFRippleTransitionEffect.Progress(FValue: Single);
begin
  ControlRippleTransition.Progress := FValue;
end;

procedure TFRippleTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlRippleTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFRippleTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlRippleTransition.Trigger := string(FTrigger);
end;

// ===== TFRotateCrumpleTransitionEffect =====
procedure TFRotateCrumpleTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlRotateCrumpleTransition := TRotateCrumpleTransitionEffect.Create(nil);
  ControlRotateCrumpleTransition.Parent := TFmxObject(FParent);
end;

procedure TFRotateCrumpleTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlRotateCrumpleTransition.Enabled := FEnabled;
end;

procedure TFRotateCrumpleTransitionEffect.Progress(FValue: Single);
begin
  ControlRotateCrumpleTransition.Progress := FValue;
end;

procedure TFRotateCrumpleTransitionEffect.RandomSeed(FValue: Single);
begin
  ControlRotateCrumpleTransition.RandomSeed := FValue;
end;

procedure TFRotateCrumpleTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlRotateCrumpleTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFRotateCrumpleTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlRotateCrumpleTransition.Trigger := string(FTrigger);
end;

// ===== TFSaturateTransitionEffect =====
procedure TFSaturateTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlSaturateTransition := TSaturateTransitionEffect.Create(nil);
  ControlSaturateTransition.Parent := TFmxObject(FParent);
end;

procedure TFSaturateTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlSaturateTransition.Enabled := FEnabled;
end;

procedure TFSaturateTransitionEffect.Progress(FValue: Single);
begin
  ControlSaturateTransition.Progress := FValue;
end;

procedure TFSaturateTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlSaturateTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFSaturateTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlSaturateTransition.Trigger := string(FTrigger);
end;

// ===== TFSlideTransitionEffect =====
procedure TFSlideTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlSlideTransition := TSlideTransitionEffect.Create(nil);
  ControlSlideTransition.Parent := TFmxObject(FParent);
end;

procedure TFSlideTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlSlideTransition.Enabled := FEnabled;
end;

procedure TFSlideTransitionEffect.SlideAmount(X, Y: Single);
var
  P: TPointF;
begin
  P := ControlSlideTransition.SlideAmount;
  P.X := X;
  P.Y := Y;
  ControlSlideTransition.SlideAmount := P;
end;

procedure TFSlideTransitionEffect.Progress(FValue: Single);
begin
  ControlSlideTransition.Progress := FValue;
end;

procedure TFSlideTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlSlideTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFSlideTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlSlideTransition.Trigger := string(FTrigger);
end;

// ===== TFSwirlTransitionEffect =====
procedure TFSwirlTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlSwirlTransition := TSwirlTransitionEffect.Create(nil);
  ControlSwirlTransition.Parent := TFmxObject(FParent);
end;

procedure TFSwirlTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlSwirlTransition.Enabled := FEnabled;
end;

procedure TFSwirlTransitionEffect.Progress(FValue: Single);
begin
  ControlSwirlTransition.Progress := FValue;
end;

procedure TFSwirlTransitionEffect.Strength(FValue: Single);
begin
  ControlSwirlTransition.Strength := FValue;
end;

procedure TFSwirlTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlSwirlTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFSwirlTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlSwirlTransition.Trigger := string(FTrigger);
end;

// ===== TFWaterTransitionEffect =====
procedure TFWaterTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlWaterTransition := TWaterTransitionEffect.Create(nil);
  ControlWaterTransition.Parent := TFmxObject(FParent);
end;

procedure TFWaterTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlWaterTransition.Enabled := FEnabled;
end;

procedure TFWaterTransitionEffect.Progress(FValue: Single);
begin
  ControlWaterTransition.Progress := FValue;
end;

procedure TFWaterTransitionEffect.RandomSeed(FValue: Single);
begin
  ControlWaterTransition.RandomSeed := FValue;
end;

procedure TFWaterTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlWaterTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFWaterTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlWaterTransition.Trigger := string(FTrigger);
end;

// ===== TFWaveTransitionEffect =====
procedure TFWaveTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlWaveTransition := TWaveTransitionEffect.Create(nil);
  ControlWaveTransition.Parent := TFmxObject(FParent);
end;

procedure TFWaveTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlWaveTransition.Enabled := FEnabled;
end;

procedure TFWaveTransitionEffect.Progress(FValue: Single);
begin
  ControlWaveTransition.Progress := FValue;
end;

procedure TFWaveTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlWaveTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFWaveTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlWaveTransition.Trigger := string(FTrigger);
end;

// ===== TFLineTransitionEffect =====
procedure TFLineTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlLineTransition := TLineTransitionEffect.Create(nil);
  ControlLineTransition.Parent := TFmxObject(FParent);
end;

procedure TFLineTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlLineTransition.Enabled := FEnabled;
end;

procedure TFLineTransitionEffect.Origin(X, Y: Single);
begin
  ControlLineTransition.Origin := PointF(X, Y);
end;

procedure TFLineTransitionEffect.Normal(X, Y: Single);
begin
  ControlLineTransition.Normal := PointF(X, Y);
end;

procedure TFLineTransitionEffect.Progress(FValue: Single);
begin
  ControlLineTransition.Progress := FValue;
end;

procedure TFLineTransitionEffect.FuzzyAmount(FValue: Single);
begin
  ControlLineTransition.FuzzyAmount := FValue;
end;

procedure TFLineTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlLineTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFLineTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlLineTransition.Trigger := string(FTrigger);
end;

// ===== TFAffineTransformEffect =====
procedure TFAffineTransformEffect.FCreate(FParent: TFmxObject);
begin
  ControlAffineTransform := TAffineTransformEffect.Create(nil);
  ControlAffineTransform.Parent := TFmxObject(FParent);
end;

procedure TFAffineTransformEffect.Enabled(FEnabled: Boolean);
begin
  ControlAffineTransform.Enabled := FEnabled;
end;

procedure TFAffineTransformEffect.Center(X, Y: Single);
begin
  ControlAffineTransform.Center := PointF(X, Y);
end;

procedure TFAffineTransformEffect.Rotation(FValue: Single);
begin
  ControlAffineTransform.Rotation := FValue;
end;

procedure TFAffineTransformEffect.Scale(FValue: Single);
begin
  ControlAffineTransform.Scale := FValue;
end;

procedure TFAffineTransformEffect.Trigger(const FTrigger: WideString);
begin
  ControlAffineTransform.Trigger := string(FTrigger);
end;

// ===== TFPerspectiveTransformEffect =====
procedure TFPerspectiveTransformEffect.FCreate(FParent: TFmxObject);
begin
  ControlPerspectiveTransform := TPerspectiveTransformEffect.Create(nil);
  ControlPerspectiveTransform.Parent := TFmxObject(FParent);
end;

procedure TFPerspectiveTransformEffect.Enabled(FEnabled: Boolean);
begin
  ControlPerspectiveTransform.Enabled := FEnabled;
end;

procedure TFPerspectiveTransformEffect.TopLeft(X, Y: Single);
begin
  ControlPerspectiveTransform.TopLeft := PointF(X, Y);
end;

procedure TFPerspectiveTransformEffect.TopRight(X, Y: Single);
begin
  ControlPerspectiveTransform.TopRight := PointF(X, Y);
end;

procedure TFPerspectiveTransformEffect.BottomRight(X, Y: Single);
begin
  ControlPerspectiveTransform.BottomRight := PointF(X, Y);
end;

procedure TFPerspectiveTransformEffect.BottomLeft(X, Y: Single);
begin
  ControlPerspectiveTransform.BottomLeft := PointF(X, Y);
end;

procedure TFPerspectiveTransformEffect.Trigger(const FTrigger: WideString);
begin
  ControlPerspectiveTransform.Trigger := string(FTrigger);
end;

// ===== TFCropEffect =====
procedure TFCropEffect.FCreate(FParent: TFmxObject);
begin
  ControlCrop := TCropEffect.Create(nil);
  ControlCrop.Parent := TFmxObject(FParent);
end;

procedure TFCropEffect.Enabled(FEnabled: Boolean);
begin
  ControlCrop.Enabled := FEnabled;
end;

procedure TFCropEffect.LeftTop(X, Y: Single);
begin
  ControlCrop.LeftTop := PointF(X, Y);
end;

procedure TFCropEffect.RightBottom(X, Y: Single);
begin
  ControlCrop.RightBottom := PointF(X, Y);
end;

procedure TFCropEffect.Trigger(const FTrigger: WideString);
begin
  ControlCrop.Trigger := string(FTrigger);
end;

// ===== TFGaussianBlurEffect =====
procedure TFGaussianBlurEffect.FCreate(FParent: TFmxObject);
begin
  ControlGaussianBlur := TGaussianBlurEffect.Create(nil);
  ControlGaussianBlur.Parent := TFmxObject(FParent);
end;

procedure TFGaussianBlurEffect.Enabled(FEnabled: Boolean);
begin
  ControlGaussianBlur.Enabled := FEnabled;
end;

procedure TFGaussianBlurEffect.BlurAmount(FValue: Single);
begin
  ControlGaussianBlur.BlurAmount := FValue;
end;

procedure TFGaussianBlurEffect.Trigger(const FTrigger: WideString);
begin
  ControlGaussianBlur.Trigger := string(FTrigger);
end;

// ===== TFBoxBlurEffect =====
procedure TFBoxBlurEffect.FCreate(FParent: TFmxObject);
begin
  ControlBoxBlur := TBoxBlurEffect.Create(nil);
  ControlBoxBlur.Parent := TFmxObject(FParent);
end;

procedure TFBoxBlurEffect.Enabled(FEnabled: Boolean);
begin
  ControlBoxBlur.Enabled := FEnabled;
end;

procedure TFBoxBlurEffect.BlurAmount(FValue: Single);
begin
  ControlBoxBlur.BlurAmount := FValue;
end;

procedure TFBoxBlurEffect.Trigger(const FTrigger: WideString);
begin
  ControlBoxBlur.Trigger := string(FTrigger);
end;

// ===== TFDirectionalBlurEffect =====
procedure TFDirectionalBlurEffect.FCreate(FParent: TFmxObject);
begin
  ControlDirectionalBlur := TDirectionalBlurEffect.Create(nil);
  ControlDirectionalBlur.Parent := TFmxObject(FParent);
end;

procedure TFDirectionalBlurEffect.Enabled(FEnabled: Boolean);
begin
  ControlDirectionalBlur.Enabled := FEnabled;
end;

procedure TFDirectionalBlurEffect.BlurAmount(FValue: Single);
begin
  ControlDirectionalBlur.BlurAmount := FValue;
end;

procedure TFDirectionalBlurEffect.Angle(FValue: Single);
begin
  ControlDirectionalBlur.Angle := FValue;
end;

procedure TFDirectionalBlurEffect.Trigger(const FTrigger: WideString);
begin
  ControlDirectionalBlur.Trigger := string(FTrigger);
end;

// ===== TFRadialBlurEffect =====
procedure TFRadialBlurEffect.FCreate(FParent: TFmxObject);
begin
  ControlRadialBlur := TRadialBlurEffect.Create(nil);
  ControlRadialBlur.Parent := TFmxObject(FParent);
end;

procedure TFRadialBlurEffect.Enabled(FEnabled: Boolean);
begin
  ControlRadialBlur.Enabled := FEnabled;
end;

procedure TFRadialBlurEffect.BlurAmount(FValue: Single);
begin
  ControlRadialBlur.BlurAmount := FValue;
end;

procedure TFRadialBlurEffect.Trigger(const FTrigger: WideString);
begin
  ControlRadialBlur.Trigger := string(FTrigger);
end;

// ===== TFSwipeTransitionEffect =====
procedure TFSwipeTransitionEffect.FCreate(FParent: TFmxObject);
begin
  ControlSwipeTransition := TSwipeTransitionEffect.Create(nil);
  ControlSwipeTransition.Parent := TFmxObject(FParent);
end;

procedure TFSwipeTransitionEffect.Enabled(FEnabled: Boolean);
begin
  ControlSwipeTransition.Enabled := FEnabled;
end;

procedure TFSwipeTransitionEffect.MousePoint(X, Y: Single);
begin
  ControlSwipeTransition.MousePoint := PointF(X, Y);
end;

procedure TFSwipeTransitionEffect.CornerPoint(X, Y: Single);
begin
  ControlSwipeTransition.CornerPoint := PointF(X, Y);
end;

procedure TFSwipeTransitionEffect.Deep(FValue: Single);
begin
  ControlSwipeTransition.Deep := FValue;
end;

procedure TFSwipeTransitionEffect.BackImg(FImage: WideString);
begin
  ControlSwipeTransition.Back.LoadFromfile(string(FImage));
end;

procedure TFSwipeTransitionEffect.SecondImg(FImage: WideString);
begin
  ControlSwipeTransition.Target.LoadFromfile(string(FImage));
end;

procedure TFSwipeTransitionEffect.Trigger(const FTrigger: WideString);
begin
  ControlSwipeTransition.Trigger := string(FTrigger);
end;

// ===== TFRasterEffect =====
procedure TFRasterEffect.FCreate(FParent: TFmxObject);
begin
  ControlRaster := TRasterEffect.Create(nil);
  ControlRaster.Parent := TFmxObject(FParent);
end;

procedure TFRasterEffect.Enabled(FEnabled: Boolean);
begin
  ControlRaster.Enabled := FEnabled;
end;

procedure TFRasterEffect.Trigger(const FTrigger: WideString);
begin
  ControlRaster.Trigger := string(FTrigger);
end;

// ===== Exports =====
function InitShadowEffect: FShadowEffect;
begin
  Result := TFShadowEffect.Create;
end;

function InitBlurEffect: FBlurEffect;
begin
  Result := TFBlurEffect.Create;
end;

function InitGlowEffect: FGlowEffect;
begin
  Result := TFGlowEffect.Create;
end;

function InitInnerGlowEffect: FInnerGlowEffect;
begin
  Result := TFInnerGlowEffect.Create;
end;

function InitBevelEffect: FBevelEffect;
begin
  Result := TFBevelEffect.Create;
end;

function InitReflectionEffect: FReflectionEffect;
begin
  Result := TFReflectionEffect.Create;
end;

function InitRippleEffect: FRippleEffect;
begin
  Result := TFRippleEffect.Create;
end;

function InitMagnifyEffect: FMagnifyEffect;
begin
  Result := TFMagnifyEffect.Create;
end;

function InitSmoothMagnifyEffect: FSmoothMagnifyEffect;
begin
  Result := TFSmoothMagnifyEffect.Create;
end;

function InitBandsEffect: FBandsEffect;
begin
  Result := TFBandsEffect.Create;
end;

function InitWaveEffect: FWaveEffect;
begin
  Result := TFWaveEffect.Create;
end;

function InitWrapEffect: FWrapEffect;
begin
  Result := TFWrapEffect.Create;
end;

function InitBandedSwirlEffect: FBandedSwirlEffect;
begin
  Result := TFBandedSwirlEffect.Create;
end;

function InitPinchEffect: FPinchEffect;
begin
  Result := TFPinchEffect.Create;
end;

function InitTilerEffect: FTilerEffect;
begin
  Result := TFTilerEffect.Create;
end;

function InitPixelateEffect: FPixelateEffect;
begin
  Result := TFPixelateEffect.Create;
end;

function InitEmbossEffect: FEmbossEffect;
begin
  Result := TFEmbossEffect.Create;
end;

function InitSharpenEffect: FSharpenEffect;
begin
  Result := TFSharpenEffect.Create;
end;

function InitToonEffect: FToonEffect;
begin
  Result := TFToonEffect.Create;
end;

function InitSepiaEffect: FSepiaEffect;
begin
  Result := TFSepiaEffect.Create;
end;

function InitPaperSketchEffect: FPaperSketchEffect;
begin
  Result := TFPaperSketchEffect.Create;
end;

function InitPencilStrokeEffect: FPencilStrokeEffect;
begin
  Result := TFPencilStrokeEffect.Create;
end;

function InitFillEffect: FFillEffect;
begin
  Result := TFFillEffect.Create;
end;

function InitFillRGBEffect: FFillRGBEffect;
begin
  Result := TFFillRGBEffect.Create;
end;

function InitNormalBlendEffect: FNormalBlendEffect;
begin
  Result := TFNormalBlendEffect.Create;
end;

function InitHueAdjustEffect: FHueAdjustEffect;
begin
  Result := TFHueAdjustEffect.Create;
end;

function InitContrastEffect: FContrastEffect;
begin
  Result := TFContrastEffect.Create;
end;

function InitBloomEffect: FBloomEffect;
begin
  Result := TFBloomEffect.Create;
end;

function InitGloomEffect: FGloomEffect;
begin
  Result := TFGloomEffect.Create;
end;

function InitInvertEffect: FInvertEffect;
begin
  Result := TFInvertEffect.Create;
end;

function InitMonochromeEffect: FMonochromeEffect;
begin
  Result := TFMonochromeEffect.Create;
end;

function InitColorKeyAlphaEffect: FColorKeyAlphaEffect;
begin
  Result := TFColorKeyAlphaEffect.Create;
end;

function InitMaskToAlphaEffect: FMaskToAlphaEffect;
begin
  Result := TFMaskToAlphaEffect.Create;
end;

function InitBandedSwirlTransitionEffect: FBandedSwirlTransitionEffect;
begin
  Result := TFBandedSwirlTransitionEffect.Create;
end;

function InitBlindTransitionEffect: FBlindTransitionEffect;
begin
  Result := TFBlindTransitionEffect.Create;
end;

function InitBloodTransitionEffect: FBloodTransitionEffect;
begin
  Result := TFBloodTransitionEffect.Create;
end;

function InitCircleTransitionEffect: FCircleTransitionEffect;
begin
  Result := TFCircleTransitionEffect.Create;
end;

function InitMagnifyTransitionEffect: FMagnifyTransitionEffect;
begin
  Result := TFMagnifyTransitionEffect.Create;
end;

function InitCrumpleTransitionEffect: FCrumpleTransitionEffect;
begin
  Result := TFCrumpleTransitionEffect.Create;
end;

function InitDissolveTransitionEffect: FDissolveTransitionEffect;
begin
  Result := TFDissolveTransitionEffect.Create;
end;

function InitDropTransitionEffect: FDropTransitionEffect;
begin
  Result := TFDropTransitionEffect.Create;
end;

function InitFadeTransitionEffect: FFadeTransitionEffect;
begin
  Result := TFFadeTransitionEffect.Create;
end;

function InitBrightTransitionEffect: FBrightTransitionEffect;
begin
  Result := TFBrightTransitionEffect.Create;
end;

function InitPixelateTransitionEffect: FPixelateTransitionEffect;
begin
  Result := TFPixelateTransitionEffect.Create;
end;

function InitBlurTransitionEffect: FBlurTransitionEffect;
begin
  Result := TFBlurTransitionEffect.Create;
end;

function InitWiggleTransitionEffect: FWiggleTransitionEffect;
begin
  Result := TFWiggleTransitionEffect.Create;
end;

function InitShapeTransitionEffect: FShapeTransitionEffect;
begin
  Result := TFShapeTransitionEffect.Create;
end;

function InitRippleTransitionEffect: FRippleTransitionEffect;
begin
  Result := TFRippleTransitionEffect.Create;
end;

function InitRotateCrumpleTransitionEffect: FRotateCrumpleTransitionEffect;
begin
  Result := TFRotateCrumpleTransitionEffect.Create;
end;

function InitSaturateTransitionEffect: FSaturateTransitionEffect;
begin
  Result := TFSaturateTransitionEffect.Create;
end;

function InitSlideTransitionEffect: FSlideTransitionEffect;
begin
  Result := TFSlideTransitionEffect.Create;
end;

function InitSwirlTransitionEffect: FSwirlTransitionEffect;
begin
  Result := TFSwirlTransitionEffect.Create;
end;

function InitWaterTransitionEffect: FWaterTransitionEffect;
begin
  Result := TFWaterTransitionEffect.Create;
end;

function InitWaveTransitionEffect: FWaveTransitionEffect;
begin
  Result := TFWaveTransitionEffect.Create;
end;

function InitLineTransitionEffect: FLineTransitionEffect;
begin
  Result := TFLineTransitionEffect.Create;
end;

function InitAffineTransformEffect: FAffineTransformEffect;
begin
  Result := TFAffineTransformEffect.Create;
end;

function InitPerspectiveTransformEffect: FPerspectiveTransformEffect;
begin
  Result := TFPerspectiveTransformEffect.Create;
end;

function InitCropEffect: FCropEffect;
begin
  Result := TFCropEffect.Create;
end;

function InitGaussianBlurEffect: FGaussianBlurEffect;
begin
  Result := TFGaussianBlurEffect.Create;
end;

function InitBoxBlurEffect: FBoxBlurEffect;
begin
  Result := TFBoxBlurEffect.Create;
end;

function InitDirectionalBlurEffect: FDirectionalBlurEffect;
begin
  Result := TFDirectionalBlurEffect.Create;
end;

function InitRadialBlurEffect: FRadialBlurEffect;
begin
  Result := TFRadialBlurEffect.Create;
end;

function InitSwipeTransitionEffect: FSwipeTransitionEffect;
begin
  Result := TFSwipeTransitionEffect.Create;
end;

function InitRasterEffect: FRasterEffect;
begin
  Result := TFRasterEffect.Create;
end;

exports
  InitShadowEffect,
  InitBlurEffect,
  InitGlowEffect,
  InitInnerGlowEffect,
  InitBevelEffect,
  InitReflectionEffect,
  InitRippleEffect,
  InitMagnifyEffect,
  InitSmoothMagnifyEffect,
  InitBandsEffect,
  InitWaveEffect,
  InitWrapEffect,
  InitBandedSwirlEffect,
  InitPinchEffect,
  InitTilerEffect,
  InitPixelateEffect,
  InitEmbossEffect,
  InitSharpenEffect,
  InitToonEffect,
  InitSepiaEffect,
  InitPaperSketchEffect,
  InitPencilStrokeEffect,
  InitFillEffect,
  InitFillRGBEffect,
  InitNormalBlendEffect,
  InitHueAdjustEffect,
  InitContrastEffect,
  InitBloomEffect,
  InitGloomEffect,
  InitInvertEffect,
  InitMonochromeEffect,
  InitColorKeyAlphaEffect,
  InitMaskToAlphaEffect,
  InitBandedSwirlTransitionEffect,
  InitBlindTransitionEffect,
  InitBloodTransitionEffect,
  InitCircleTransitionEffect,
  InitMagnifyTransitionEffect,
  InitCrumpleTransitionEffect,
  InitDissolveTransitionEffect,
  InitDropTransitionEffect,
  InitFadeTransitionEffect,
  InitBrightTransitionEffect,
  InitPixelateTransitionEffect,
  InitBlurTransitionEffect,
  InitWiggleTransitionEffect,
  InitShapeTransitionEffect,
  InitRippleTransitionEffect,
  InitRotateCrumpleTransitionEffect,
  InitSaturateTransitionEffect,
  InitSlideTransitionEffect,
  InitSwirlTransitionEffect,
  InitWaterTransitionEffect,
  InitWaveTransitionEffect,
  InitLineTransitionEffect,
  InitAffineTransformEffect,
  InitPerspectiveTransformEffect,
  InitCropEffect,
  InitGaussianBlurEffect,
  InitBoxBlurEffect,
  InitDirectionalBlurEffect,
  InitRadialBlurEffect,
  InitSwipeTransitionEffect,
  InitRasterEffect;

end.
