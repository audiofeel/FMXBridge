
unit FMXBridge.PicShow;

interface

uses
  System.Classes, System.Types, System.Generics.Collections, System.UITypes,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Ani;

// -----------------------------------------------------------------------------
// Effects
// -----------------------------------------------------------------------------
type
  TEffectProc = procedure(Canvas: TCanvas; Source, Destination: TBitmap;
    Progress: Single; const Bounds: TRectF);

  TEffect = record
    Name: string;
    Proc: TEffectProc;
  end;

procedure RegisterEffect(const Name: string; Proc: TEffectProc);
function GetEffect(const Name: string): TEffectProc;
function GetRandomEffect: TEffectProc;
function GetEffectCount: Integer;
function GetEffectName(Index: Integer): string;

// -----------------------------------------------------------------------------
// TPicShow
// -----------------------------------------------------------------------------
type
  TPicShow = class(TControl)
  private
    FImages: TObjectList<TBitmap>;
    FCurrentIndex: Integer;
    FNextIndex: Integer;
    FSource: TBitmap;
    FDestination: TBitmap;
    FEffect: TEffectProc;
    FProgress: Single;
    FDuration: Single;
    FDelay: Single;
    FTransitioning: Boolean;
    FRunning: Boolean;
    FRandomEffect: Boolean;
    FAnimationValue: Single;
    FAnimation: TFloatAnimation;
    FTransitionStarted: Boolean;
    FBorderColor: TAlphaColor;
    FBorderThickness: Single;
    procedure BeginTransition;
    procedure AnimationProcess(Sender: TObject);
    procedure AnimationFinish(Sender: TObject);
  published
    property AnimationValue: Single read FAnimationValue write FAnimationValue;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AddImage(Bitmap: TBitmap);
    procedure AddFromFile(const FileName: string);
    procedure Clear;
    procedure Start;
    procedure Stop;
    property Effect: TEffectProc read FEffect write FEffect;
    property RandomEffect: Boolean read FRandomEffect write FRandomEffect;
    property Duration: Single read FDuration write FDuration;
    property Delay: Single read FDelay write FDelay;
    property BorderColor: TAlphaColor read FBorderColor write FBorderColor;
    property BorderThickness: Single read FBorderThickness
      write FBorderThickness;
  end;

// =============================================================================
// FPicShow
// =============================================================================
  FPicShow = interface(IUnknown)
    ['{2534887D-0D33-408C-AFFB-69691B2837FD}']
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
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure AddImage(const FileName: WideString); stdcall;
    procedure Clear; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure SetDelay(FValue: Single); stdcall;
    procedure SetDuration(FValue: Single); stdcall;
    procedure SetEffect(const EffectName: WideString); stdcall;
    procedure SetRandom(FValue: Boolean); stdcall;
    procedure SetBorder(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function GetEffectsCount: Integer; stdcall;
    function GetEffectsName(FIndex: Integer): WideString; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFPicShow = class(TInterfacedObject, FPicShow)
  private
    ControlPicShow: TPicShow;
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
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure AddImage(const FileName: WideString); stdcall;
    procedure Clear; stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure SetDelay(FValue: Single); stdcall;
    procedure SetDuration(FValue: Single); stdcall;
    procedure SetEffect(const EffectName: WideString); stdcall;
    procedure SetRandom(FValue: Boolean); stdcall;
    procedure SetBorder(FColor: TAlphaColor; FThickness: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function GetEffectsCount: Integer; stdcall;
    function GetEffectsName(FIndex: Integer): WideString; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitPicShowHandle: FPicShow; stdcall;

implementation

uses
  System.SysUtils,
  PicShowEffects;

// -----------------------------------------------------------------------------
// Effects
// -----------------------------------------------------------------------------
var
  FEffects: TList<TEffect>;

procedure RegisterEffect(const Name: string; Proc: TEffectProc);
var
  Effect: TEffect;
begin
  Effect.Name := Name;
  Effect.Proc := Proc;

  FEffects.Add(Effect);
end;

function GetEffect(const Name: string): TEffectProc;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to FEffects.Count - 1 do
  begin
    if SameText(FEffects[I].Name, Name) then
    begin
      Result := FEffects[I].Proc;
      Exit;
    end;
  end;
end;

function GetRandomEffect: TEffectProc;
begin
  if FEffects.Count = 0 then
    Exit(nil);

  Result := FEffects[Random(FEffects.Count)].Proc;
end;

function GetEffectCount: Integer;
begin
  Result := FEffects.Count;
end;

function GetEffectName(Index: Integer): string;
begin
  Result := '';

  if (Index >= 0) and (Index < FEffects.Count) then
    Result := FEffects[Index].Name;
end;

// -----------------------------------------------------------------------------
// TPicShow
// -----------------------------------------------------------------------------
constructor TPicShow.Create(AOwner: TComponent);
begin
  inherited;

  FImages := TObjectList<TBitmap>.Create(True);
  FCurrentIndex := -1;
  FNextIndex := -1;
  FDuration := 1;
  FDelay := 3;
  FBorderColor := TAlphaColorRec.Null;
  FBorderThickness := 0;

  FAnimation := TFloatAnimation.Create(Self);
  FAnimation.Parent := Self;
  FAnimation.PropertyName := 'AnimationValue';
  FAnimation.StartValue := 0;
  FAnimation.StopValue := 1;
  FAnimation.Duration := FDelay + FDuration;
  FAnimation.OnProcess := AnimationProcess;
  FAnimation.OnFinish := AnimationFinish;
end;

destructor TPicShow.Destroy;
begin
  FAnimation.Free;
  FImages.Free;

  inherited;
end;

procedure TPicShow.BeginTransition;
begin
  FNextIndex := FCurrentIndex + 1;

  if FNextIndex >= FImages.Count then
    FNextIndex := 0;

  FSource := FImages[FCurrentIndex];
  FDestination := FImages[FNextIndex];

  if FRandomEffect then
    FEffect := GetRandomEffect();

  FProgress := 0;
  FTransitioning := True;
end;

procedure TPicShow.Paint;
begin
  if FImages.Count = 0 then
    Exit;

  if FTransitioning then
  begin
    if Assigned(FEffect) then
      FEffect(Canvas, FSource, FDestination, FProgress, LocalRect);
  end
  else
  begin
    Canvas.DrawBitmap(FImages[FCurrentIndex], FImages[FCurrentIndex].BoundsF,
      LocalRect, AbsoluteOpacity, False);
  end;

  if FBorderThickness > 0 then
  begin
    Canvas.Fill.Kind := TBrushKind.Solid;
    Canvas.Fill.Color := FBorderColor;

    Canvas.FillRect(RectF(0, 0, Width, FBorderThickness), 0, 0, [],
      AbsoluteOpacity);
    Canvas.FillRect(RectF(0, Height - FBorderThickness, Width, Height), 0, 0, [],
      AbsoluteOpacity);
    Canvas.FillRect(RectF(0, FBorderThickness, FBorderThickness,
      Height - FBorderThickness), 0, 0, [], AbsoluteOpacity);
    Canvas.FillRect(RectF(Width - FBorderThickness, FBorderThickness, Width,
      Height - FBorderThickness), 0, 0, [], AbsoluteOpacity);
  end;
end;

procedure TPicShow.AddImage(Bitmap: TBitmap);
var
  CopyBitmap: TBitmap;
begin
  CopyBitmap := TBitmap.Create;
  CopyBitmap.Assign(Bitmap);

  FImages.Add(CopyBitmap);

  if FCurrentIndex = -1 then
    FCurrentIndex := 0;

  Repaint;
end;

procedure TPicShow.AddFromFile(const FileName: string);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    B.LoadThumbnailFromFile(FileName, Width, Height, False);

    AddImage(B);
  finally
    B.Free;
  end;
end;

procedure TPicShow.Clear;
begin
  FImages.Clear;
  FEffect := nil;

  FCurrentIndex := -1;
  FNextIndex := -1;

  Stop;

  Repaint;
end;

procedure TPicShow.Start;
begin
  if FImages.Count < 2 then
    Exit;

  FRunning := True;
  FTransitionStarted := False;

  FAnimation.Duration := FDelay + FDuration;
  FAnimation.Start;
end;

procedure TPicShow.AnimationProcess(Sender: TObject);
var
  Time: Single;
begin
  if not FRunning then
    Exit;

  Time := FAnimation.CurrentTime;

  if Time < FDelay then
    Exit;

  if not FTransitionStarted then
  begin
    BeginTransition;
    FTransitionStarted := True;
  end;

  FProgress := (Time - FDelay) / FDuration;

  if FProgress > 1 then
    FProgress := 1;

  Repaint;
end;

procedure TPicShow.AnimationFinish(Sender: TObject);
begin
  if not FRunning then
    Exit;

  FCurrentIndex := FNextIndex;

  FTransitioning := False;
  FTransitionStarted := False;

  FAnimation.Start;
end;

procedure TPicShow.Stop;
begin
  FRunning := False;

  FAnimation.Stop;

  FTransitioning := False;
  FTransitionStarted := False;

  Repaint;
end;

// =============================================================================
// FPicShow
// =============================================================================
procedure TFPicShow.FCreate(FParent: TFmxObject);
begin
  ControlPicShow := TPicShow.Create(nil);
  ControlPicShow.Parent := TFmxObject(FParent);
end;

procedure TFPicShow.Left(FLeft: Single);
begin
  ControlPicShow.Position.X := FLeft;
end;

procedure TFPicShow.Top(FTop: Single);
begin
  ControlPicShow.Position.Y := FTop;
end;

procedure TFPicShow.Height(FHeight: Single);
begin
  ControlPicShow.Size.Height := FHeight;
end;

procedure TFPicShow.Width(FWidth: Single);
begin
  ControlPicShow.Size.Width := FWidth;
end;

procedure TFPicShow.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlPicShow.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFPicShow.Position(X, Y: Single);
begin
  ControlPicShow.Position.X := X;
  ControlPicShow.Position.Y := Y;
end;

procedure TFPicShow.Align(Al: TAlignLayout);
begin
  ControlPicShow.Align := TAlignLayout(Al);
end;

procedure TFPicShow.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPicShow.Margins.Left := FLeft;
  ControlPicShow.Margins.Top := FTop;
  ControlPicShow.Margins.Right := FRight;
  ControlPicShow.Margins.Bottom := FBottom;
end;

procedure TFPicShow.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPicShow.Padding.Left := FLeft;
  ControlPicShow.Padding.Top := FTop;
  ControlPicShow.Padding.Right := FRight;
  ControlPicShow.Padding.Bottom := FBottom;
end;

procedure TFPicShow.BringToFront;
begin
  ControlPicShow.BringToFront;
end;

procedure TFPicShow.SendToBack;
begin
  ControlPicShow.SendToBack;
end;

procedure TFPicShow.AddImage(const FileName: WideString);
begin
  if Assigned(ControlPicShow) then
    ControlPicShow.AddFromFile(string(FileName));
end;

procedure TFPicShow.Clear;
begin
  if Assigned(ControlPicShow) then
    ControlPicShow.Clear;
end;

procedure TFPicShow.Start;
begin
  if Assigned(ControlPicShow) then
    ControlPicShow.Start;
end;

procedure TFPicShow.Stop;
begin
  if Assigned(ControlPicShow) then
    ControlPicShow.Stop;
end;

procedure TFPicShow.SetDelay(FValue: Single);
begin
  ControlPicShow.Delay := FValue;
end;

procedure TFPicShow.SetDuration(FValue: Single);
begin
  ControlPicShow.Duration := FValue;
end;

procedure TFPicShow.SetEffect(const EffectName: WideString);
begin
  ControlPicShow.Effect := GetEffect(string(EffectName));
end;

procedure TFPicShow.SetRandom(FValue: Boolean);
begin
  ControlPicShow.RandomEffect := FValue;
end;

procedure TFPicShow.SetBorder(FColor: TAlphaColor; FThickness: Single);
begin
  ControlPicShow.BorderColor := TAlphaColor(FColor);
  ControlPicShow.BorderThickness := FThickness;
end;

procedure TFPicShow.Opacity(FOpacity: Single);
begin
  ControlPicShow.Opacity := FOpacity;
end;

procedure TFPicShow.RotationAngle(FValue: Single);
begin
  ControlPicShow.RotationAngle := FValue;
end;

procedure TFPicShow.RotationCenter(X, Y: Single);
begin
  ControlPicShow.RotationCenter.X := X;
  ControlPicShow.RotationCenter.Y := Y;
end;

procedure TFPicShow.Enabled(FEnabled: Boolean);
begin
  ControlPicShow.Enabled := FEnabled;
end;

procedure TFPicShow.Visible(FVisible: Boolean);
begin
  ControlPicShow.Visible := FVisible;
end;

procedure TFPicShow.HitTest(FEnabled: Boolean);
begin
  ControlPicShow.HitTest := FEnabled;
end;

function TFPicShow.GetEffectsCount: Integer;
begin
  Result := GetEffectCount;
end;

function TFPicShow.GetEffectsName(FIndex: Integer): WideString;
begin
  Result := GetEffectName(FIndex);
end;

function TFPicShow.IsVisible: Boolean;
begin
  Result := ControlPicShow.Visible;
end;

function TFPicShow.GetLeft: Single;
begin
  Result := ControlPicShow.Position.X;
end;

function TFPicShow.GetTop: Single;
begin
  Result := ControlPicShow.Position.Y;
end;

function TFPicShow.GetHeight: Single;
begin
  Result := ControlPicShow.Size.Height;
end;

function TFPicShow.GetWidth: Single;
begin
  Result := ControlPicShow.Size.Width;
end;

function TFPicShow.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlPicShow);
end;

function TFPicShow.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlPicShow);
end;

// =============================================================================
// Exports
// =============================================================================
function InitPicShowHandle: FPicShow;
begin
  RegisterAllEffects;

  Result := TFPicShow.Create;
end;

exports
  InitPicShowHandle;

initialization
  Randomize;
  FEffects := TList<TEffect>.Create;

finalization
  FEffects.Free;

end.
