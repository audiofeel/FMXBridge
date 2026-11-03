
unit FMXBridge.Animations;

interface

uses
  System.Classes, System.Types, System.UITypes,
  FMX.Types, FMX.Objects, FMX.Ani, FMX.Controls, FMX.Graphics;

// =============================================================================
// FAnimation
// =============================================================================
type
  TFMXAnimationClock = class(TAnimation)
  protected
    procedure ProcessAnimation; override;
  end;

  FAnimation = interface(IUnknown)
    ['{C31A4F72-9B5D-4D64-8F2A-7D0D7A4C91E3}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Duration(FDuration: Single); stdcall;
    procedure Delay(FDelay: Single); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure AutoReverse(FAutoReverse: Boolean); stdcall;
    procedure Inverse(FInverse: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Pause(FPause: Boolean); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    function IsRunning: Boolean; stdcall;
    function IsPaused: Boolean; stdcall;
    function GetCurrentTime: Single; stdcall;
    function GetNormalizedTime: Single; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure StopAtCurrent; stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
    function GetObject: TFmxObject; stdcall;
  end;

  TFAnimation = class(TInterfacedObject, FAnimation)
  private
    ControlAnim: TFMXAnimationClock;
  public
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Duration(FDuration: Single); stdcall;
    procedure Delay(FDelay: Single); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure AutoReverse(FAutoReverse: Boolean); stdcall;
    procedure Inverse(FInverse: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Pause(FPause: Boolean); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    function IsRunning: Boolean; stdcall;
    function IsPaused: Boolean; stdcall;
    function GetCurrentTime: Single; stdcall;
    function GetNormalizedTime: Single; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure StopAtCurrent; stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
    function GetObject: TFmxObject; stdcall;
  end;

// =============================================================================
// FPathAnimation
// =============================================================================
type
  FPathAnimation = interface(IUnknown)
    ['{5C684A9F-B12B-4A46-BEAE-26BD5D89F208}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
      FDuration, FDelay: Single; FInverse, FAutoReverse,
       FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure Rotate(FRotate: Boolean); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure PathData(const FPathData: WideString); stdcall;
    procedure DataBoundsMode(FBoundsMode: TBoundsMode); stdcall;
    procedure DataStyleLookup(FStyle: WideString); stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

  TFPathAnimation = class(TInterfacedObject, FPathAnimation)
  private
    ControlPathAnim: TPathAnimation;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
      FDuration, FDelay: Single; FInverse, FAutoReverse,
       FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure Rotate(FRotate: Boolean); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure PathData(const FPathData: WideString); stdcall;
    procedure DataBoundsMode(FBoundsMode: TBoundsMode); stdcall;
    procedure DataStyleLookup(FStyle: WideString); stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FFloatAnimation
// =============================================================================
type
  FFloatAnimation = interface(IUnknown)
    ['{80273C7F-C33A-4B55-9529-2314CC63B5E9}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetValues(FStartValue, FStopValue: Single); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

  TFFloatAnimation = class(TInterfacedObject, FFloatAnimation)
  private
    ControlFloatAnim: TFloatAnimation;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetValues(FStartValue, FStopValue: Single); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FFloatKeyAnimation
// =============================================================================
type
  FFloatKeyAnimation = interface(IUnknown)
    ['{68E7F942-6528-4811-91B3-1213C49DA328}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure AddKeys(Key, Value: Single); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

  TFFloatKeyAnimation = class(TInterfacedObject, FFloatKeyAnimation)
  private
    ControlFloatKeyAnim: TFloatKeyAnimation;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure AddKeys(Key, Value: Single); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FColorAnimation
// =============================================================================
type
  FColorAnimation = interface(IUnknown)
    ['{4771276E-71BC-4EDE-9727-1981A39B6849}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetColors(FStartColor, FStopColor: TAlphaColor); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

  TFColorAnimation = class(TInterfacedObject, FColorAnimation)
  private
    ControlColorAnim: TColorAnimation;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetColors(FStartColor, FStopColor: TAlphaColor); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FColorKeyAnimation
// =============================================================================
type
  FColorKeyAnimation = interface(IUnknown)
    ['{C5B6DEA8-D369-4D1B-8A07-5DAED7F8804A}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure AddKeys(Key: Single; FColor: TAlphaColor); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

  TFColorKeyAnimation = class(TInterfacedObject, FColorKeyAnimation)
  private
    ControlColorKeyAnim: TColorKeyAnimation;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure AddKeys(Key: Single; FColor: TAlphaColor); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FRectAnimation
// =============================================================================
type
  FRectAnimation = interface(IUnknown)
    ['{DCCC6D31-4455-4EF7-B2CB-E0EA1D6C7E7F}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetValues(FStartValue, FStopValue: TRect); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

  TFRectAnimation = class(TInterfacedObject, FRectAnimation)
  private
    ControlRectAnim: TRectAnimation;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetValues(FStartValue, FStopValue: TRect); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FGradientAnimation
// =============================================================================
type
  FGradientAnimation = interface(IUnknown)
    ['{066A78DF-C19F-4AA0-9859-1FB3E0809341}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure StartColors(FColor1, FColor2: TAlphaColor); stdcall;
    procedure StopColors(FColor1, FColor2: TAlphaColor); stdcall;
    procedure StartPoints(FOffset1, FOffset2: Single); stdcall;
    procedure StopPoints(FOffset1, FOffset2: Single); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

  TFGradientAnimation = class(TInterfacedObject, FGradientAnimation)
  private
    ControlGradientAnim: TGradientAnimation;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure StartColors(FColor1, FColor2: TAlphaColor); stdcall;
    procedure StopColors(FColor1, FColor2: TAlphaColor); stdcall;
    procedure StartPoints(FOffset1, FOffset2: Single); stdcall;
    procedure StopPoints(FOffset1, FOffset2: Single); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure StartFromCurrent(FEnabled: Boolean); stdcall;
    procedure StopAtCurrent; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FBitmapAnimation
// =============================================================================
type
  FBitmapAnimation = interface(IUnknown)
    ['{19DA6572-6F98-4501-BFBA-2BB0B8D44679}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetImages(const FStartImage, FStopImage: WideString); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

  TFBitmapAnimation = class(TInterfacedObject, FBitmapAnimation)
  private
    ControlBitmapAnim: TBitmapAnimation;
    FStart: TImage;
    FStop: TImage;
  public
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetImages(const FStartImage, FStopImage: WideString); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FBitmapListAnimation
// =============================================================================
type
  FBitmapListAnimation = interface(IUnknown)
    ['{1AB22ACC-4B19-4A0C-93A9-48246331DBA5}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetImage(const FImage: WideString;
        FCount, FRowCount: Integer); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure AniFrameRate(FFrameRate: Integer); stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

  TFBitmapListAnimation = class(TInterfacedObject, FBitmapListAnimation)
  private
    ControlBitmapListAnim: TBitmapListAnimation;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure PropertyName(const FPropertyName: WideString); stdcall;
    procedure SetImage(const FImage: WideString;
        FCount, FRowCount: Integer); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure AniFrameRate(FFrameRate: Integer); stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Trigger(const FTrigger: WideString); stdcall;
    procedure TriggerInverse(const FTrigger: WideString); stdcall;
    procedure OnProcess(Event: TNotifyEvent); stdcall;
    procedure OnFinish(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitAnimation: FAnimation; stdcall;
function InitPathAnimation: FPathAnimation; stdcall;
function InitFloatAnimation: FFloatAnimation; stdcall;
function InitFloatKeyAnimation: FFloatKeyAnimation; stdcall;
function InitColorAnimation: FColorAnimation; stdcall;
function InitColorKeyAnimation: FColorKeyAnimation; stdcall;
function InitRectAnimation: FRectAnimation; stdcall;
function InitGradientAnimation: FGradientAnimation; stdcall;
function InitBitmapAnimation: FBitmapAnimation; stdcall;
function InitBitmapListAnimation: FBitmapListAnimation; stdcall;

function FMXAnimateFloat(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue, FDuration, FDelay: Single;
  FAnimationType: TAnimationType;
  FInterpolation: TInterpolationType): Boolean; stdcall;
function FMXAnimateFloatWait(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue, FDuration: Single;
  FAnimationType: TAnimationType;
  FInterpolation: TInterpolationType): Boolean; stdcall;
function FMXAnimateInt(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue: Integer;
  FDuration: Single; FAnimationType: TAnimationType;
  FInterpolation: TInterpolationType): Boolean; stdcall;
function FMXAnimateIntWait(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue: Integer;
  FDuration: Single; FAnimationType: TAnimationType;
  FInterpolation: TInterpolationType): Boolean; stdcall;
function FMXAnimateColor(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue: TAlphaColor;
  FDuration: Single; FAnimationType: TAnimationType;
  FInterpolation: TInterpolationType): Boolean; stdcall;
function FMXStopPropertyAnimation(const Target: TFmxObject;
  const FPropertyName: WideString): Boolean; stdcall;

implementation

uses
  System.SysUtils, System.Math;

// =============================================================================
// TFAnimation
// =============================================================================
procedure TFMXAnimationClock.ProcessAnimation;
begin
// TO DO
end;

destructor TFAnimation.Destroy;
begin
  if Assigned(ControlAnim) then
  begin
    ControlAnim.Stop;
    ControlAnim.Parent := nil;
    FreeAndNil(ControlAnim);
  end;

  inherited;
end;

procedure TFAnimation.FCreate(FParent: TFmxObject);
begin
  ControlAnim := TFMXAnimationClock.Create(nil);
  ControlAnim.Parent := TFmxObject(FParent);
end;

procedure TFAnimation.Duration(FDuration: Single);
begin
  ControlAnim.Duration := Max(0.0, FDuration);
end;

procedure TFAnimation.Delay(FDelay: Single);
begin
  ControlAnim.Delay := Max(0.0, FDelay);
end;

procedure TFAnimation.Loop(FLoop: Boolean);
begin
  ControlAnim.Loop := FLoop;
end;

procedure TFAnimation.AutoReverse(FAutoReverse: Boolean);
begin
  ControlAnim.AutoReverse := FAutoReverse;
end;

procedure TFAnimation.Inverse(FInverse: Boolean);
begin
  ControlAnim.Inverse := FInverse;
end;

procedure TFAnimation.Enabled(FEnabled: Boolean);
begin
  ControlAnim.Enabled := FEnabled;
end;

procedure TFAnimation.Pause(FPause: Boolean);
begin
  ControlAnim.Pause := FPause;
end;

procedure TFAnimation.AnimationType(FAnimationType: TAnimationType);
begin
  ControlAnim.AnimationType := TAnimationType(FAnimationType);
end;

procedure TFAnimation.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlAnim.Interpolation := TInterpolationType(FInterpolation);
end;

function TFAnimation.IsRunning: Boolean;
begin
  Result := ControlAnim.Running;
end;

function TFAnimation.IsPaused: Boolean;
begin
  Result := ControlAnim.Pause;
end;

function TFAnimation.GetCurrentTime: Single;
begin
  Result := ControlAnim.CurrentTime;
end;

function TFAnimation.GetNormalizedTime: Single;
begin
  Result := ControlAnim.NormalizedTime;
end;

procedure TFAnimation.Start;
begin
  ControlAnim.Start;
end;

procedure TFAnimation.Stop;
begin
  ControlAnim.Stop;
end;

procedure TFAnimation.StopAtCurrent;
begin
  ControlAnim.StopAtCurrent;
end;

procedure TFAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlAnim.OnFinish := TNotifyEvent(Event);
end;

function TFAnimation.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlAnim);
end;

// =============================================================================
// TFPathAnimation
// =============================================================================
procedure TFPathAnimation.FCreate(FParent: TFmxObject);
begin
  ControlPathAnim := TPathAnimation.Create(nil);
  ControlPathAnim.Parent := TFmxObject(FParent);
end;

procedure TFPathAnimation.AnimationType(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  ControlPathAnim.AnimationType := TAnimationType(FAnimationType);
  ControlPathAnim.Duration := FDuration;
  ControlPathAnim.Delay := FDelay;
  ControlPathAnim.Inverse := FInverse;
  ControlPathAnim.AutoReverse := FAutoReverse;
  ControlPathAnim.Loop := FLoop;
end;

procedure TFPathAnimation.Enabled(FEnabled: Boolean);
begin
  ControlPathAnim.Enabled := FEnabled;
end;

procedure TFPathAnimation.Loop(FLoop: Boolean);
begin
  ControlPathAnim.Loop := FLoop;
end;

procedure TFPathAnimation.Rotate(FRotate: Boolean);
begin
  ControlPathAnim.Rotate := FRotate;
end;

procedure TFPathAnimation.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlPathAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFPathAnimation.PathData(const FPathData: WideString);
begin
  ControlPathAnim.Path.Data := string(FPathData);
end;

procedure TFPathAnimation.DataBoundsMode(FBoundsMode: TBoundsMode);
begin
  ControlPathAnim.Path.BoundsMode := TBoundsMode(FBoundsMode);
end;

procedure TFPathAnimation.DataStyleLookup(FStyle: WideString);
begin
  ControlPathAnim.Path.StyleLookUp := string(FStyle);
end;

procedure TFPathAnimation.Start;
begin
  ControlPathAnim.Start;
end;

procedure TFPathAnimation.Stop;
begin
  ControlPathAnim.Stop;
end;

procedure TFPathAnimation.Trigger(const FTrigger: WideString);
begin
  ControlPathAnim.Trigger := string(FTrigger);
end;

procedure TFPathAnimation.TriggerInverse(const FTrigger: WideString);
begin
  ControlPathAnim.TriggerInverse := string(FTrigger);
end;

procedure TFPathAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlPathAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFPathAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlPathAnim.OnFinish := TNotifyEvent(Event);
end;

// =============================================================================
// TFFloatAnimation
// =============================================================================
procedure TFFloatAnimation.FCreate(FParent: TFmxObject);
begin
  ControlFloatAnim := TFloatAnimation.Create(nil);
  ControlFloatAnim.Parent := TFmxObject(FParent);
end;

procedure TFFloatAnimation.AnimationType(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  ControlFloatAnim.AnimationType := TAnimationType(FAnimationType);
  ControlFloatAnim.Duration := FDuration;
  ControlFloatAnim.Delay := FDelay;
  ControlFloatAnim.Inverse := FInverse;
  ControlFloatAnim.AutoReverse := FAutoReverse;
  ControlFloatAnim.Loop := FLoop;
end;

procedure TFFloatAnimation.Enabled(FEnabled: Boolean);
begin
  ControlFloatAnim.Enabled := FEnabled;
end;

procedure TFFloatAnimation.Loop(FLoop: Boolean);
begin
  ControlFloatAnim.Loop := FLoop;
end;

procedure TFFloatAnimation.PropertyName(const FPropertyName: WideString);
begin
  ControlFloatAnim.PropertyName := string(FPropertyName);
end;

procedure TFFloatAnimation.SetValues(FStartValue, FStopValue: Single);
begin
  ControlFloatAnim.StartValue := FStartValue;
  ControlFloatAnim.StopValue := FStopValue;
end;

procedure TFFloatAnimation.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlFloatAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFFloatAnimation.StartFromCurrent(FEnabled: Boolean);
begin
  ControlFloatAnim.StartFromCurrent := FEnabled;
end;

procedure TFFloatAnimation.StopAtCurrent;
begin
  ControlFloatAnim.StopAtCurrent;
end;

procedure TFFloatAnimation.Start;
begin
  ControlFloatAnim.Start;
end;

procedure TFFloatAnimation.Stop;
begin
  ControlFloatAnim.Stop;
end;

procedure TFFloatAnimation.Trigger(const FTrigger: WideString);
begin
  ControlFloatAnim.Trigger := string(FTrigger);
end;

procedure TFFloatAnimation.TriggerInverse(const FTrigger: WideString);
begin
  ControlFloatAnim.TriggerInverse := string(FTrigger);
end;

procedure TFFloatAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlFloatAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFFloatAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlFloatAnim.OnFinish := TNotifyEvent(Event);
end;

// =============================================================================
// TFFloatKeyAnimation
// =============================================================================
procedure TFFloatKeyAnimation.FCreate(FParent: TFmxObject);
begin
  ControlFloatKeyAnim := TFloatKeyAnimation.Create(nil);
  ControlFloatKeyAnim.Parent := TFmxObject(FParent);
end;

procedure TFFloatKeyAnimation.AnimationType(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  ControlFloatKeyAnim.AnimationType := TAnimationType(FAnimationType);
  ControlFloatKeyAnim.Duration := FDuration;
  ControlFloatKeyAnim.Delay := FDelay;
  ControlFloatKeyAnim.Inverse := FInverse;
  ControlFloatKeyAnim.AutoReverse := FAutoReverse;
  ControlFloatKeyAnim.Loop := FLoop;
end;

procedure TFFloatKeyAnimation.Enabled(FEnabled: Boolean);
begin
  ControlFloatKeyAnim.Enabled := FEnabled;
end;

procedure TFFloatKeyAnimation.Loop(FLoop: Boolean);
begin
  ControlFloatKeyAnim.Loop := FLoop;
end;

procedure TFFloatKeyAnimation.PropertyName(const FPropertyName: WideString);
begin
  ControlFloatKeyAnim.PropertyName := string(FPropertyName);
end;

procedure TFFloatKeyAnimation.AddKeys(Key, Value: Single);
var
  KeyFrame: TFloatKey;
begin
  KeyFrame := TFloatKey(ControlFloatKeyAnim.Keys.Add);
  KeyFrame.Key := Key;
  KeyFrame.Value := Value;
end;

procedure TFFloatKeyAnimation.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlFloatKeyAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFFloatKeyAnimation.StartFromCurrent(FEnabled: Boolean);
begin
  ControlFloatKeyAnim.StartFromCurrent := FEnabled;
end;

procedure TFFloatKeyAnimation.StopAtCurrent;
begin
  ControlFloatKeyAnim.StopAtCurrent;
end;

procedure TFFloatKeyAnimation.Start;
begin
  ControlFloatKeyAnim.Start;
end;

procedure TFFloatKeyAnimation.Stop;
begin
  ControlFloatKeyAnim.Stop;
end;

procedure TFFloatKeyAnimation.Trigger(const FTrigger: WideString);
begin
  ControlFloatKeyAnim.Trigger := string(FTrigger);
end;

procedure TFFloatKeyAnimation.TriggerInverse(const FTrigger: WideString);
begin
  ControlFloatKeyAnim.TriggerInverse := string(FTrigger);
end;

procedure TFFloatKeyAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlFloatKeyAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFFloatKeyAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlFloatKeyAnim.OnFinish := TNotifyEvent(Event);
end;

// =============================================================================
// TFColorAnimation
// =============================================================================
procedure TFColorAnimation.FCreate(FParent: TFmxObject);
begin
  ControlColorAnim := TColorAnimation.Create(nil);
  ControlColorAnim.Parent := TFmxObject(FParent);
end;

procedure TFColorAnimation.AnimationType(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  ControlColorAnim.AnimationType := TAnimationType(FAnimationType);
  ControlColorAnim.Duration := FDuration;
  ControlColorAnim.Delay := FDelay;
  ControlColorAnim.Inverse := FInverse;
  ControlColorAnim.AutoReverse := FAutoReverse;
  ControlColorAnim.Loop := FLoop;
end;

procedure TFColorAnimation.Enabled(FEnabled: Boolean);
begin
  ControlColorAnim.Enabled := FEnabled;
end;

procedure TFColorAnimation.Loop(FLoop: Boolean);
begin
  ControlColorAnim.Loop := FLoop;
end;

procedure TFColorAnimation.PropertyName(const FPropertyName: WideString);
begin
  ControlColorAnim.PropertyName := string(FPropertyName);
end;

procedure TFColorAnimation.SetColors(FStartColor, FStopColor: TAlphaColor);
begin
  ControlColorAnim.StartValue := TAlphaColor(FStartColor);
  ControlColorAnim.StopValue := TAlphaColor(FStopColor);
end;

procedure TFColorAnimation.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlColorAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFColorAnimation.StartFromCurrent(FEnabled: Boolean);
begin
  ControlColorAnim.StartFromCurrent := FEnabled;
end;

procedure TFColorAnimation.StopAtCurrent;
begin
  ControlColorAnim.StopAtCurrent;
end;

procedure TFColorAnimation.Start;
begin
  ControlColorAnim.Start;
end;

procedure TFColorAnimation.Stop;
begin
  ControlColorAnim.Stop;
end;

procedure TFColorAnimation.Trigger(const FTrigger: WideString);
begin
  ControlColorAnim.Trigger := string(FTrigger);
end;

procedure TFColorAnimation.TriggerInverse(const FTrigger: WideString);
begin
  ControlColorAnim.TriggerInverse := string(FTrigger);
end;

procedure TFColorAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlColorAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFColorAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlColorAnim.OnFinish := TNotifyEvent(Event);
end;

// =============================================================================
// TFColorKeyAnimation
// =============================================================================
procedure TFColorKeyAnimation.FCreate(FParent: TFmxObject);
begin
  ControlColorKeyAnim := TColorKeyAnimation.Create(nil);
  ControlColorKeyAnim.Parent := TFmxObject(FParent);
end;

procedure TFColorKeyAnimation.AnimationType(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  ControlColorKeyAnim.AnimationType := TAnimationType(FAnimationType);
  ControlColorKeyAnim.Duration := FDuration;
  ControlColorKeyAnim.Delay := FDelay;
  ControlColorKeyAnim.Inverse := FInverse;
  ControlColorKeyAnim.AutoReverse := FAutoReverse;
  ControlColorKeyAnim.Loop := FLoop;
end;

procedure TFColorKeyAnimation.Enabled(FEnabled: Boolean);
begin
  ControlColorKeyAnim.Enabled := FEnabled;
end;

procedure TFColorKeyAnimation.Loop(FLoop: Boolean);
begin
  ControlColorKeyAnim.Loop := FLoop;
end;

procedure TFColorKeyAnimation.PropertyName(const FPropertyName: WideString);
begin
  ControlColorKeyAnim.PropertyName := string(FPropertyName);
end;

procedure TFColorKeyAnimation.AddKeys(Key: Single; FColor: TAlphaColor);
var
  KeyFrame: TColorKey;
begin
  KeyFrame := TColorKey(ControlColorKeyAnim.Keys.Add);
  KeyFrame.Key := Key;
  KeyFrame.Value := TAlphaColor(FColor);
end;

procedure TFColorKeyAnimation.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlColorKeyAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFColorKeyAnimation.StartFromCurrent(FEnabled: Boolean);
begin
  ControlColorKeyAnim.StartFromCurrent := FEnabled;
end;

procedure TFColorKeyAnimation.StopAtCurrent;
begin
  ControlColorKeyAnim.StopAtCurrent;
end;

procedure TFColorKeyAnimation.Start;
begin
  ControlColorKeyAnim.Start;
end;

procedure TFColorKeyAnimation.Stop;
begin
  ControlColorKeyAnim.Stop;
end;

procedure TFColorKeyAnimation.Trigger(const FTrigger: WideString);
begin
  ControlColorKeyAnim.Trigger := string(FTrigger);
end;

procedure TFColorKeyAnimation.TriggerInverse(const FTrigger: WideString);
begin
  ControlColorKeyAnim.TriggerInverse := string(FTrigger);
end;

procedure TFColorKeyAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlColorKeyAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFColorKeyAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlColorKeyAnim.OnFinish := TNotifyEvent(Event);
end;

// =============================================================================
// TFRectAnimation
// =============================================================================
procedure TFRectAnimation.FCreate(FParent: TFmxObject);
begin
  ControlRectAnim := TRectAnimation.Create(nil);
  ControlRectAnim.Parent := TFmxObject(FParent);
end;

procedure TFRectAnimation.AnimationType(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  ControlRectAnim.AnimationType := TAnimationType(FAnimationType);
  ControlRectAnim.Duration := FDuration;
  ControlRectAnim.Delay := FDelay;
  ControlRectAnim.Inverse := FInverse;
  ControlRectAnim.AutoReverse := FAutoReverse;
  ControlRectAnim.Loop := FLoop;
end;

procedure TFRectAnimation.Enabled(FEnabled: Boolean);
begin
  ControlRectAnim.Enabled := FEnabled;
end;

procedure TFRectAnimation.Loop(FLoop: Boolean);
begin
  ControlRectAnim.Loop := FLoop;
end;

procedure TFRectAnimation.PropertyName(const FPropertyName: WideString);
begin
  ControlRectAnim.PropertyName := string(FPropertyName);
end;

procedure TFRectAnimation.SetValues(FStartValue, FStopValue: TRect);
var
  rStart, rStop: TRectF;
begin
  rStart := TRectF.Create(FStartValue.Left, FStartValue.Top, FStartValue.Right,
    FStartValue.Bottom);
  rStop := TRectF.Create(FStopValue.Left, FStopValue.Top, FStopValue.Right,
    FStopValue.Bottom);

  ControlRectAnim.StartValue.Rect := rStart;
  ControlRectAnim.StopValue.Rect := rStop;
end;

procedure TFRectAnimation.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlRectAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFRectAnimation.StartFromCurrent(FEnabled: Boolean);
begin
  ControlRectAnim.StartFromCurrent := FEnabled;
end;

procedure TFRectAnimation.StopAtCurrent;
begin
  ControlRectAnim.StopAtCurrent;
end;

procedure TFRectAnimation.Start;
begin
  ControlRectAnim.Start;
end;

procedure TFRectAnimation.Stop;
begin
  ControlRectAnim.Stop;
end;

procedure TFRectAnimation.Trigger(const FTrigger: WideString);
begin
  ControlRectAnim.Trigger := string(FTrigger);
end;

procedure TFRectAnimation.TriggerInverse(const FTrigger: WideString);
begin
  ControlRectAnim.TriggerInverse := string(FTrigger);
end;

procedure TFRectAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlRectAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFRectAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlRectAnim.OnFinish := TNotifyEvent(Event);
end;

// =============================================================================
// TFGradientAnimation
// =============================================================================
procedure TFGradientAnimation.FCreate(FParent: TFmxObject);
begin
  ControlGradientAnim := TGradientAnimation.Create(nil);
  ControlGradientAnim.Parent := TFmxObject(FParent);
end;

procedure TFGradientAnimation.AnimationType(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  ControlGradientAnim.AnimationType := TAnimationType(FAnimationType);
  ControlGradientAnim.Duration := FDuration;
  ControlGradientAnim.Delay := FDelay;
  ControlGradientAnim.Inverse := FInverse;
  ControlGradientAnim.AutoReverse := FAutoReverse;
  ControlGradientAnim.Loop := FLoop;
end;

procedure TFGradientAnimation.Enabled(FEnabled: Boolean);
begin
  ControlGradientAnim.Enabled := FEnabled;
end;

procedure TFGradientAnimation.Loop(FLoop: Boolean);
begin
  ControlGradientAnim.Loop := FLoop;
end;

procedure TFGradientAnimation.PropertyName(const FPropertyName: WideString);
begin
  ControlGradientAnim.PropertyName := string(FPropertyName);
end;

procedure TFGradientAnimation.StartColors(FColor1, FColor2: TAlphaColor);
begin
  ControlGradientAnim.StartValue.Points.Clear;

  with TGradientPoint(ControlGradientAnim.StartValue.Points.Add) do
  begin
    Offset := 0.0;
    Color  := TAlphaColor(FColor1);
  end;

  with TGradientPoint(ControlGradientAnim.StartValue.Points.Add) do
  begin
    Offset := 1.0;
    Color  := TAlphaColor(FColor2);
  end;
end;

procedure TFGradientAnimation.StopColors(FColor1, FColor2: TAlphaColor);
begin
  ControlGradientAnim.StopValue.Points.Clear;

  with TGradientPoint(ControlGradientAnim.StopValue.Points.Add) do
  begin
    Offset := 0.0;
    Color  := TAlphaColor(FColor1);
  end;

  with TGradientPoint(ControlGradientAnim.StopValue.Points.Add) do
  begin
    Offset := 1.0;
    Color  := TAlphaColor(FColor2);
  end;
end;

procedure TFGradientAnimation.StartPoints(FOffset1, FOffset2: Single);
begin
  ControlGradientAnim.StartValue.StartPosition.Point :=
    TPointF.Create(FOffset1, FOffset2);
end;

procedure TFGradientAnimation.StopPoints(FOffset1, FOffset2: Single);
begin
  ControlGradientAnim.StopValue.StopPosition.Point :=
    TPointF.Create(FOffset1, FOffset2);
end;

procedure TFGradientAnimation.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlGradientAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFGradientAnimation.StartFromCurrent(FEnabled: Boolean);
begin
  ControlGradientAnim.StartFromCurrent := FEnabled;
end;

procedure TFGradientAnimation.StopAtCurrent;
begin
  ControlGradientAnim.StopAtCurrent;
end;

procedure TFGradientAnimation.Start;
begin
  ControlGradientAnim.Start;
end;

procedure TFGradientAnimation.Stop;
begin
  ControlGradientAnim.Stop;
end;

procedure TFGradientAnimation.Trigger(const FTrigger: WideString);
begin
  ControlGradientAnim.Trigger := string(FTrigger);
end;

procedure TFGradientAnimation.TriggerInverse(const FTrigger: WideString);
begin
  ControlGradientAnim.TriggerInverse := string(FTrigger);
end;

procedure TFGradientAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlGradientAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFGradientAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlGradientAnim.OnFinish := TNotifyEvent(Event);
end;

// =============================================================================
// TFBitmapAnimation
// =============================================================================
procedure TFBitmapAnimation.FCreate(FParent: TFmxObject);
begin
  ControlBitmapAnim := TBitmapAnimation.Create(nil);
  ControlBitmapAnim.Parent := TFmxObject(FParent);
end;

procedure TFBitmapAnimation.AnimationType(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  ControlBitmapAnim.AnimationType := TAnimationType(FAnimationType);
  ControlBitmapAnim.Duration := FDuration;
  ControlBitmapAnim.Delay := FDelay;
  ControlBitmapAnim.Inverse := FInverse;
  ControlBitmapAnim.AutoReverse := FAutoReverse;
  ControlBitmapAnim.Loop := FLoop;
end;

procedure TFBitmapAnimation.Enabled(FEnabled: Boolean);
begin
  ControlBitmapAnim.Enabled := FEnabled;
end;

procedure TFBitmapAnimation.PropertyName(const FPropertyName: WideString);
begin
  ControlBitmapAnim.PropertyName := string(FPropertyName);
end;

destructor TFBitmapAnimation.Destroy;
begin
  FreeAndNil(ControlBitmapAnim);
  FreeAndNil(FStart);
  FreeAndNil(FStop);
  inherited;
end;

procedure TFBitmapAnimation.SetImages(const FStartImage,
  FStopImage: WideString);
begin
  ControlBitmapAnim.StartValue.LoadFromfile(string(FStartImage));
  ControlBitmapAnim.StopValue.LoadFromfile(string(FStopImage));
end;

procedure TFBitmapAnimation.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlBitmapAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFBitmapAnimation.Trigger(const FTrigger: WideString);
begin
  ControlBitmapAnim.Trigger := string(FTrigger);
end;

procedure TFBitmapAnimation.TriggerInverse(const FTrigger: WideString);
begin
  ControlBitmapAnim.TriggerInverse := string(FTrigger);
end;

procedure TFBitmapAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlBitmapAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFBitmapAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlBitmapAnim.OnFinish := TNotifyEvent(Event);
end;

// =============================================================================
// TFBitmapListAnimation
// =============================================================================
procedure TFBitmapListAnimation.FCreate(FParent: TFmxObject);
begin
  ControlBitmapListAnim := TBitmapListAnimation.Create(nil);
  ControlBitmapListAnim.Parent := TFmxObject(FParent);
end;

procedure TFBitmapListAnimation.AnimationType(FAnimationType: TAnimationType;
  FDuration, FDelay: Single; FInverse, FAutoReverse, FLoop: Boolean);
begin
  ControlBitmapListAnim.AnimationType := TAnimationType(FAnimationType);
  ControlBitmapListAnim.Duration := FDuration;
  ControlBitmapListAnim.Delay := FDelay;
  ControlBitmapListAnim.Inverse := FInverse;
  ControlBitmapListAnim.AutoReverse := FAutoReverse;
  ControlBitmapListAnim.Loop := FLoop;
end;

procedure TFBitmapListAnimation.Enabled(FEnabled: Boolean);
begin
  ControlBitmapListAnim.Enabled := FEnabled;
end;

procedure TFBitmapListAnimation.PropertyName(const FPropertyName: WideString);
begin
  ControlBitmapListAnim.PropertyName := string(FPropertyName);
end;

procedure TFBitmapListAnimation.SetImage(const FImage: WideString;
  FCount, FRowCount: Integer);
var
  Bitmap: FMX.Graphics.TBitmap;
begin
  if FImage = '' then
    Exit;

  Bitmap := FMX.Graphics.TBitmap.Create;
  try
    Bitmap.LoadFromfile(string(FImage));

    ControlBitmapListAnim.AnimationBitmap.Assign(Bitmap);
    ControlBitmapListAnim.AnimationCount := FCount;
    ControlBitmapListAnim.AnimationRowCount := FRowCount;
  finally
    Bitmap.Free;
  end;
end;

procedure TFBitmapListAnimation.Interpolation(FInterpolation
  : TInterpolationType);
begin
  ControlBitmapListAnim.Interpolation := TInterpolationType(FInterpolation);
end;

procedure TFBitmapListAnimation.AniFrameRate(FFrameRate: Integer);
begin
  if ControlBitmapListAnim.AnimationCount > 0 then
    ControlBitmapListAnim.Duration :=
      ControlBitmapListAnim.AnimationCount / FFrameRate
  else
    ControlBitmapListAnim.Duration := 1
end;

procedure TFBitmapListAnimation.Start;
begin
  ControlBitmapListAnim.Start;
end;

procedure TFBitmapListAnimation.Stop;
begin
  ControlBitmapListAnim.Stop;
end;

procedure TFBitmapListAnimation.Trigger(const FTrigger: WideString);
begin
  ControlBitmapListAnim.Trigger := string(FTrigger);
end;

procedure TFBitmapListAnimation.TriggerInverse(const FTrigger: WideString);
begin
  ControlBitmapListAnim.TriggerInverse := string(FTrigger);
end;

procedure TFBitmapListAnimation.OnProcess(Event: TNotifyEvent);
begin
  ControlBitmapListAnim.OnProcess := TNotifyEvent(Event);
end;

procedure TFBitmapListAnimation.OnFinish(Event: TNotifyEvent);
begin
  ControlBitmapListAnim.OnFinish := TNotifyEvent(Event);
end;

// =============================================================================
// GlobalAnimateFloat
// =============================================================================
function FMXAnimateFloat(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue, FDuration, FDelay: Single;
  FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
var
  PropertyName: string;
begin
  Result := False;

  if not Assigned(Target) then
    Exit;

  try
    PropertyName := FPropertyName;

    TAnimator.AnimateFloatDelay(Target, PropertyName, FNewValue,
      FDuration, FDelay, FAnimationType, FInterpolation);

    Result := True;
  except
    Result := False;
  end;
end;

// =============================================================================
// GlobalAnimateFloatWait
// =============================================================================
function FMXAnimateFloatWait(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue, FDuration: Single;
  FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
var
  PropertyName: string;
begin
  Result := False;

  if not Assigned(Target) then
    Exit;

  try
    PropertyName := FPropertyName;

    TAnimator.AnimateFloatWait(Target, PropertyName, FNewValue,
      FDuration, FAnimationType, FInterpolation);

    Result := True;
  except
    Result := False;
  end;
end;

// =============================================================================
// GlobalAnimateInt
// =============================================================================
function FMXAnimateInt(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue: Integer; FDuration: Single;
  FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
var
  PropertyName: string;
begin
  Result := False;

  if not Assigned(Target) then
    Exit;

  try
    PropertyName := FPropertyName;

    TAnimator.AnimateInt(Target, PropertyName, FNewValue, FDuration,
      FAnimationType, FInterpolation);

    Result := True;
  except
    Result := False;
  end;
end;

// =============================================================================
// GlobalAnimateIntWait
// =============================================================================
function FMXAnimateIntWait(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue: Integer; FDuration: Single;
  FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
var
  PropertyName: string;
begin
  Result := False;

  if not Assigned(Target) then
    Exit;

  try
    PropertyName := FPropertyName;

    TAnimator.AnimateIntWait(Target, PropertyName, FNewValue,
      FDuration, FAnimationType, FInterpolation);

    Result := True;
  except
    Result := False;
  end;
end;

// =============================================================================
// GlobalAnimateColor
// =============================================================================
function FMXAnimateColor(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue: TAlphaColor; FDuration: Single;
  FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
var
  PropertyName: string;
begin
  Result := False;

  if not Assigned(Target) then
    Exit;

  try
    PropertyName := FPropertyName;

    TAnimator.AnimateColor(Target, PropertyName, FNewValue,
      FDuration, FAnimationType, FInterpolation);

    Result := True;
  except
    Result := False;
  end;
end;

// =============================================================================
// GlobalStopPropertyAnimation
// =============================================================================
function FMXStopPropertyAnimation(const Target: TFmxObject;
  const FPropertyName: WideString): Boolean;
var
  PropertyName: string;
begin
  Result := False;

  if not Assigned(Target) then
    Exit;

  try
    PropertyName := FPropertyName;

    TAnimator.StopPropertyAnimation(Target, PropertyName);

    Result := True;
  except
    Result := False;
  end;
end;

// =============================================================================
// Exports
// =============================================================================
function InitAnimation: FAnimation;
begin
  Result := TFAnimation.Create;
end;

function InitPathAnimation: FPathAnimation;
begin
  Result := TFPathAnimation.Create;
end;

function InitFloatAnimation: FFloatAnimation;
begin
  Result := TFFloatAnimation.Create;
end;

function InitFloatKeyAnimation: FFloatKeyAnimation;
begin
  Result := TFFloatKeyAnimation.Create;
end;

function InitColorAnimation: FColorAnimation;
begin
  Result := TFColorAnimation.Create;
end;

function InitColorKeyAnimation: FColorKeyAnimation;
begin
  Result := TFColorKeyAnimation.Create;
end;

function InitRectAnimation: FRectAnimation;
begin
  Result := TFRectAnimation.Create;
end;

function InitGradientAnimation: FGradientAnimation;
begin
  Result := TFGradientAnimation.Create;
end;

function InitBitmapAnimation: FBitmapAnimation;
begin
  Result := TFBitmapAnimation.Create;
end;

function InitBitmapListAnimation: FBitmapListAnimation;
begin
  Result := TFBitmapListAnimation.Create;
end;

exports
  InitAnimation,
  InitPathAnimation,
  InitFloatAnimation,
  InitFloatKeyAnimation,
  InitColorAnimation,
  InitColorKeyAnimation,
  InitRectAnimation,
  InitGradientAnimation,
  InitBitmapAnimation,
  InitBitmapListAnimation,
  FMXAnimateFloat,
  FMXAnimateFloatWait,
  FMXAnimateInt,
  FMXAnimateIntWait,
  FMXAnimateColor,
  FMXStopPropertyAnimation;

end.
