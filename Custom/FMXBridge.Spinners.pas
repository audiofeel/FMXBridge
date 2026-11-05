
unit FMXBridge.Spinners;

interface

uses
  System.Classes, System.UITypes, System.Types,
  FMX.Graphics, FMX.Types, FMX.Controls, FMX.Ani;

// -----------------------------------------------------------------------------
// TSpinner
// -----------------------------------------------------------------------------
type
  TSpinnerKind = (Win11, Arcs, DoubleBounce, FlipPlane, Pulse,
    ArcsRing, Ring, ThreeDots, Wave, BallClipRotate, BallClipRotatePulse,
    BallClipRotateMultiple, BallScaleRipple, InnerLineSpinFade,
    LineScalePulseOut, LineScalePulseOutRapid);

  TSpinnerDrawProc = procedure of object;

  TSpinnerBezier = class
  private
    FAx, FBx, FCx: Double;
    FAy, FBy, FCy: Double;

    FX1, FY1: Double;
    FX2, FY2: Double;

    function SampleCurveX(T: Double): Double;
    function SampleCurveY(T: Double): Double;
    function SampleCurveDerivativeX(T: Double): Double;
    function SolveCurveX(X, Epsilon: Double): Double;
  public
    constructor Create(P1X, P1Y, P2X, P2Y: Double);

    procedure SetData(P1X, P1Y, P2X, P2Y: Double);
    function Solve(X, Epsilon: Double): Double;
  end;

type
  TSpinnerAnim = class(TAnimation)
  protected
    procedure ProcessAnimation; override;
  end;

  TSpinner = class(TControl)
  private
    FAnim: TSpinnerAnim;
    FBrush: TBrush;
    FBezier: TSpinnerBezier;

    FKind: TSpinnerKind;
    FDrawProc: TSpinnerDrawProc;

    FColor: TAlphaColor;
    FSpeed: Single;
    FActive: Boolean;

    procedure OnAnim(Sender: TObject);
    procedure SetActive(const Value: Boolean);
    procedure SetColor(const Value: TAlphaColor);
    procedure SetSpeed(const Value: Single);
    procedure SetKind(const Value: TSpinnerKind);
    function GetCellRect(CellWidth, CellHeight: Single;
      Col, Row, ColSpan, RowSpan: Integer): TRectF;
    procedure FillArc(Arc: TPathData; Center: TPointF;
      const Radius, Thickness, AngleStart, AngleSweep, AOpacity: Single);
    procedure DrawWin11;
    procedure DrawArcs;
    procedure DrawDoubleBounce;
    procedure DrawFlipPlane;
    procedure DrawPulse;
    procedure DrawArcsRing;
    procedure DrawRing;
    procedure DrawThreeDots;
    procedure DrawWave;
    procedure DrawBallClipRotate;
    procedure DrawBallClipRotatePulse;
    procedure DrawBallClipRotateMultiple;
    procedure DrawBallScaleRipple;
    procedure DrawInnerLineSpinFade;
    procedure DrawLineScalePulseOut;
    procedure DrawLineScalePulseOutRapid;
    procedure DrawArcSpinner(Center: TPointF; Radius: Single;
      StartAngle, SweepAngle, AOpacity: Single);
    procedure GetWin11Arc(out AStartAngle, ASweepAngle: Single);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Start;
    procedure Stop;
    property KindValue: TSpinnerKind read FKind write SetKind;
  published
    property Active: Boolean read FActive write SetActive default False;
    property Color: TAlphaColor read FColor write SetColor;
    property Speed: Single read FSpeed write SetSpeed;
    property Kind: TSpinnerKind read FKind write SetKind;
  end;

// =============================================================================
// FSpinner
// =============================================================================
  FSpinner = interface(IUnknown)
    ['{7E4C7A2D-3F49-4D72-9E61-8B6A0F4A12D8}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth: Single); stdcall;
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
    procedure Kind(FKind: TSpinnerKind); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Speed(FSpeed: Single); stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FHitTest: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSpinner = class(TInterfacedObject, FSpinner)
  private
    FSpinner: TSpinner;
  public
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth: Single); stdcall;
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
    procedure Kind(FKind: TSpinnerKind); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Speed(FSpeed: Single); stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FHitTest: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
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
// Exports
// =============================================================================
function InitSpinnerHandle: FSpinner; stdcall;

implementation

uses
  System.Math.Vectors, System.Math,
  FMX.Utils;

// -----------------------------------------------------------------------------
// TSpinner
// -----------------------------------------------------------------------------
const
  WinSpinnerBezierEpsilon = 1.0E-5;

  RingCircleSize = 7;

  RingCells: array[0..7, 0..3] of Integer = ((2, 0, 1, 1), (3, 0, 2, 2),
    (4, 2, 1, 1), (3, 3, 2, 2), (2, 4, 1, 1),
    (0, 3, 2, 2), (0, 2, 1, 1), (0, 0, 2, 2));

constructor TSpinnerBezier.Create(P1X, P1Y, P2X, P2Y: Double);
begin
  inherited Create;

  SetData(P1X, P1Y, P2X, P2Y);
end;

procedure TSpinnerBezier.SetData(P1X, P1Y, P2X, P2Y: Double);
begin
  FX1 := P1X;
  FY1 := P1Y;
  FX2 := P2X;
  FY2 := P2Y;

  FCx := 3.0 * P1X;
  FBx := 3.0 * (P2X - P1X) - FCx;
  FAx := 1.0 - FCx - FBx;

  FCy := 3.0 * P1Y;
  FBy := 3.0 * (P2Y - P1Y) - FCy;
  FAy := 1.0 - FCy - FBy;
end;

function TSpinnerBezier.SampleCurveX(T: Double): Double;
begin
  Result := ((FAx * T + FBx) * T + FCx) * T;
end;

function TSpinnerBezier.SampleCurveY(T: Double): Double;
begin
  Result := ((FAy * T + FBy) * T + FCy) * T;
end;

function TSpinnerBezier.SampleCurveDerivativeX(T: Double): Double;
begin
  Result := (3.0 * FAx * T + 2.0 * FBx) * T + FCx;
end;

function TSpinnerBezier.SolveCurveX(X, Epsilon: Double): Double;
var
  T0, T1, T2, X2, D2: Double;
  I: Integer;
begin
  T2 := X;

  for I := 0 to 7 do
  begin
    X2 := SampleCurveX(T2) - X;

    if Abs(X2) < Epsilon then
      Exit(T2);

    D2 := SampleCurveDerivativeX(T2);

    if Abs(D2) < 1.0E-6 then
      Break;

    T2 := T2 - X2 / D2;
  end;

  T0 := 0.0;
  T1 := 1.0;
  T2 := X;

  if T2 < T0 then
    Exit(T0);

  if T2 > T1 then
    Exit(T1);

  while T0 < T1 do
  begin
    X2 := SampleCurveX(T2);

    if Abs(X2 - X) < Epsilon then
      Exit(T2);

    if X > X2 then
      T0 := T2
    else
      T1 := T2;

    T2 := (T1 - T0) * 0.5 + T0;
  end;

  Result := T2;
end;

function TSpinnerBezier.Solve(X, Epsilon: Double): Double;
begin
  Result := SampleCurveY(SolveCurveX(X, Epsilon));
end;

procedure TSpinnerAnim.ProcessAnimation;
begin
//
end;

constructor TSpinner.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Width := 42;
  Height := 42;

  FColor := TAlphaColorRec.White;
  FSpeed := 2.2;
  FActive := False;

  FBrush := TBrush.Create(TBrushKind.Solid, FColor);

  FBezier := TSpinnerBezier.Create(0.42, 0.0, 0.58, 1.0);

  FKind := TSpinnerKind.Win11;
  FDrawProc := DrawWin11;

  FAnim := TSpinnerAnim.Create(Self);
  FAnim.Stored := False;
  FAnim.Loop := True;
  FAnim.Duration := FSpeed;
  FAnim.OnProcess := OnAnim;

  AddObject(FAnim);
end;

destructor TSpinner.Destroy;
begin
  if Assigned(FAnim) then
    FAnim.Stop;

  FBrush.Free;
  FBezier.Free;

  inherited;
end;

procedure TSpinner.OnAnim(Sender: TObject);
begin
  Repaint;
end;

procedure TSpinner.Start;
begin
  if FActive then
    Exit;

  FActive := True;

  FAnim.Start;

  Repaint;
end;

procedure TSpinner.Stop;
begin
  if not FActive then
    Exit;

  FActive := False;

  FAnim.Stop;

  Repaint;
end;

procedure TSpinner.SetActive(const Value: Boolean);
begin
  if FActive = Value then
    Exit;

  if Value then
    Start
  else
    Stop;
end;

procedure TSpinner.SetColor(const Value: TAlphaColor);
begin
  if FColor = Value then
    Exit;

  FColor := Value;
  FBrush.Color := Value;

  Repaint;
end;

procedure TSpinner.SetSpeed(const Value: Single);
begin
  if FSpeed = Value then
    Exit;

  FSpeed := Max(0.01, Value);

  FAnim.Duration := FSpeed;
end;

procedure TSpinner.SetKind(const Value: TSpinnerKind);
begin
  if FKind = Value then
    Exit;

  FKind := Value;

  case FKind of

    Win11:
      FDrawProc := DrawWin11;

    Arcs:
      FDrawProc := DrawArcs;

    DoubleBounce:
      FDrawProc := DrawDoubleBounce;

    FlipPlane:
      FDrawProc := DrawFlipPlane;

    Pulse:
      FDrawProc := DrawPulse;

    ArcsRing:
      FDrawProc := DrawArcsRing;

    Ring:
      FDrawProc := DrawRing;

    ThreeDots:
      FDrawProc := DrawThreeDots;

    Wave:
      FDrawProc := DrawWave;

    BallClipRotate:
      FDrawProc := DrawBallClipRotate;

    BallClipRotatePulse:
      begin
        FDrawProc := DrawBallClipRotatePulse;

        FBezier.SetData(0.09, 0.57, 0.49, 0.90);
      end;

    BallClipRotateMultiple:
      FDrawProc := DrawBallClipRotateMultiple;

    BallScaleRipple:
      begin
        FDrawProc := DrawBallScaleRipple;

        FBezier.SetData(0.21, 0.53, 0.56, 0.80);
      end;

    InnerLineSpinFade:
      begin
        FDrawProc := DrawInnerLineSpinFade;

        FBezier.SetData(0.42, 0.0, 0.58, 1.0);
      end;

    LineScalePulseOut:
      begin
        FDrawProc := DrawLineScalePulseOut;

        FBezier.SetData(0.85, 0.25, 0.37, 0.85);
      end;

    LineScalePulseOutRapid:
      begin
        FDrawProc := DrawLineScalePulseOutRapid;

        FBezier.SetData(0.11, 0.49, 0.38, 0.78);
      end;
  end;

  Repaint;
end;

procedure TSpinner.GetWin11Arc(out AStartAngle, ASweepAngle: Single);
const
  MinArcAngle = 20.0;
  MaxArcAngle = 190.0;
var
  P: Single;
begin
  P := FAnim.NormalizedTime;

  if P < 0.5 then
  begin
    P := P * 2.0;

    AStartAngle := -90.0 + FAnim.NormalizedTime * 900.0;

    ASweepAngle := MinArcAngle + (MaxArcAngle - MinArcAngle) * P;
  end
  else
  begin
    P := (P - 0.5) * 2.0;

    AStartAngle := -90.0 + FAnim.NormalizedTime * 900.0 + 180.0 * P;

    ASweepAngle := MaxArcAngle - (MaxArcAngle - MinArcAngle) * P;
  end;
end;

procedure TSpinner.DrawArcSpinner(Center: TPointF; Radius: Single;
  StartAngle, SweepAngle, AOpacity: Single);
begin
  if SweepAngle <= 0.001 then
    Exit;

  Canvas.Stroke.Kind := TBrushKind.Solid;
  Canvas.Stroke.Color := FColor;
  Canvas.Stroke.Thickness := 6.0;
  Canvas.Stroke.Cap := TStrokeCap.Round;
  Canvas.DrawArc(Center, TPointF.Create(Radius, Radius),
    StartAngle, SweepAngle, AbsoluteOpacity * AOpacity);
end;

procedure TSpinner.DrawWin11;
var
  Center: TPointF;
  StartAngle: Single;
  SweepAngle: Single;
  R: Single;
begin
  Center := LocalRect.CenterPoint;

  R := Min(Width, Height) * 0.4375;

  GetWin11Arc(StartAngle, SweepAngle);

  DrawArcSpinner(Center, R, StartAngle, SweepAngle, 1.0);
end;

procedure TSpinner.FillArc(Arc: TPathData; Center: TPointF;
  const Radius, Thickness, AngleStart, AngleSweep, AOpacity: Single);
begin
  Arc.Clear;
  Arc.AddArc(Center, TPointF.Create(Radius, Radius), AngleStart, AngleSweep);
  Arc.AddArc(Center, TPointF.Create(Radius - Thickness, Radius - Thickness),
    AngleStart + AngleSweep, -AngleSweep);
  Arc.ClosePath;

  Canvas.FillPath(Arc, AbsoluteOpacity * AOpacity, FBrush);
end;

procedure TSpinner.DrawArcs;
var
  Arc: TPathData;
  P: TPointF;
  R: Single;
  T, A: Single;
begin
  T := FAnim.NormalizedTime;

  A := InterpolateSingle(0, 360, T);

  P := LocalRect.CenterPoint;
  R := Min(P.X, P.Y);

  Arc := TPathData.Create;
  try
    FillArc(Arc, P, R, 5, A, 270, 1.0);

    R := R - 5;
    A := 360 - A;

    FillArc(Arc, P, R, 5, A - 165, 210, 0.3);
  finally
    Arc.Free;
  end;
end;

procedure TSpinner.DrawDoubleBounce;
var
  T, S: Single;
  P: TPointF;
  R, R1, R2: Single;
  DR: TRectF;
begin
  T := FAnim.NormalizedTime;

  S := InterpolateSingle(1, 0, T);

  P := LocalRect.CenterPoint;

  R := Min(P.X, P.Y);

  R1 := R * S;
  R2 := R * (1 - S);

  DR := RectF(P.X - R1, P.Y - R1, P.X + R1, P.Y + R1);

  Canvas.FillEllipse(DR, AbsoluteOpacity * 0.3, FBrush);

  DR := RectF(P.X - R2, P.Y - R2, P.X + R2, P.Y + R2);

  Canvas.FillEllipse(DR, AbsoluteOpacity * 0.3, FBrush);
end;

procedure TSpinner.DrawFlipPlane;
  function CalcScale(T: Single): Single;
  begin
    if T < 0.25 then
      Result := InterpolateSingle(1, 0, T / 0.25)
    else if T < 0.5 then
      Result := InterpolateSingle(0, 1, (T - 0.25) / 0.25)
    else
      Result := 1;
  end;
var
  R: TRectF;
  SX, SY: Single;
  T: Single;
begin
  T := FAnim.NormalizedTime;

  SY := CalcScale(T);

  T := T - 0.5;

  if T < 0 then
    T := T + 1;

  SX := CalcScale(T);

  R := RectF(0, 0, Width * SX, Height * SY);
  R := R.CenterAt(RectF(0, 0, Width, Height));

  Canvas.FillRect(R, 0, 0, AllCorners, AbsoluteOpacity, FBrush);
end;

procedure TSpinner.DrawPulse;
var
  T, S: Single;
  P: TPointF;
  R: Single;
  DR: TRectF;
begin
  T := FAnim.NormalizedTime;

  S := InterpolateSingle(0, 1, T);

  P := LocalRect.CenterPoint;

  R := Min(P.X, P.Y) * S;

  DR := RectF(P.X - R, P.Y - R, P.X + R, P.Y + R);

  Canvas.FillEllipse(DR, AbsoluteOpacity * (1 - S), FBrush);
end;

procedure TSpinner.DrawArcsRing;
var
  P: TPointF;
  R: Single;
  StartAngle: Single;
  Path: TPathData;
  I: Integer;
  T: Single;
  O: Single;
begin
  T := FAnim.NormalizedTime;

  P := LocalRect.CenterPoint;

  R := Min(P.X, P.Y);

  StartAngle := -15;

  Path := TPathData.Create;
  try
    for I := 0 to 7 do
    begin
      if T < 0.125 then
        O := InterpolateSingle(1, 0.3, T * 8)
      else
        O := 0.3;

      T := T - 0.125;

      if T < 0 then
        T := T + 1;

      Path.Clear;
      Path.AddArc(P, TPointF.Create(R, R), StartAngle, 30);
      Path.AddArc(P, TPointF.Create(R - 5, R - 5), StartAngle + 30, -30);
      Path.ClosePath;

      Canvas.FillPath(Path, AbsoluteOpacity * O, FBrush);

      StartAngle := StartAngle + 45;
    end;
  finally
    Path.Free;
  end;
end;

procedure TSpinner.DrawRing;
var
  T: Single;
  I: Integer;
  S: Single;
  R, DR: TRectF;
begin
  T := FAnim.NormalizedTime;

  for I := 0 to 7 do
  begin
    if T < 0.4 then
      S := InterpolateSingle(0, 1, T / 0.4)
    else if T < 0.8 then
      S := InterpolateSingle(1, 0, (T - 0.4) / 0.4)
    else
      S := 0;

    R := GetCellRect(Width / 5, Height / 5, RingCells[I, 0],
      RingCells[I, 1], RingCells[I, 2], RingCells[I, 3]);

    DR := RectF(0, 0, RingCircleSize * S, RingCircleSize * S);
    DR := DR.CenterAt(R);

    Canvas.FillEllipse(DR, AbsoluteOpacity, FBrush);

    T := T - 0.125;

    if T < 0 then
      T := T + 1;
  end;
end;

procedure TSpinner.DrawThreeDots;
var
  T, S: Single;
  I: Integer;
  R, DR: TRectF;
  W, H, Space, CR: Single;
begin
  T := FAnim.CurrentTime;

  W := (Width - 10) / 3;
  H := Height;
  Space := 0;

  for I := 0 to 2 do
  begin
    if T < 0.5 then
      S := InterpolateSingle(0, 1, T / 0.5)
    else if T < 0.6 then
      S := 1
    else if T < 1.1 then
      S := InterpolateSingle(1, 0, (T - 0.6) / 0.5)
    else
      S := 0;

    T := T - 0.25;

    if T < 0 then
      T := T + 1.9;

    R := RectF(0, 0, W, H);
    R.Offset(I * W + Space, 0);

    Space := Space + 5;

    CR := Min(W, H) * S;

    DR := RectF(0, 0, CR, CR);

    DR := DR.CenterAt(R);

    Canvas.FillEllipse(DR, AbsoluteOpacity, FBrush);
  end;
end;

procedure TSpinner.DrawWave;
var
  T: Single;
  I: Integer;
  S: Single;
  R: TRectF;
  W, H, Space: Single;
begin
  T := FAnim.NormalizedTime;

  W := (Width - 20) / 5;
  H := Height;
  Space := 0;

  for I := 0 to 4 do
  begin
    if T < 0.1 then
      S := InterpolateSingle(1 / 1.6, 1, T / 0.1)
    else if T < 0.15 then
      S := 1
    else if T < 0.35 then
      S := InterpolateSingle(1, 1 / 1.6, (T - 0.15) / 0.2)
    else
      S := 1 / 1.6;

    T := T - 0.05;

    if T < 0 then
      T := T + 1;

    R := RectF(0, 0, W, H * S);
    R.Offset(I * W + Space, (Height - R.Height) / 2);

    Space := Space + 5;

    Canvas.FillRect(R, 0, 0, AllCorners, AbsoluteOpacity, FBrush);
  end;
end;

procedure TSpinner.DrawBallClipRotate;
var
  Arc: TPathData;
  P: TPointF;
  R, S: Single;
  T, A: Single;
begin
  T := FAnim.NormalizedTime;

  A := InterpolateSingle(0, 360, T);

  if T < 0.5 then
    S := InterpolateSingle(1, 0.6, T / 0.5)
  else
    S := InterpolateSingle(0.6, 1, (T - 0.5) / 0.5);

  P := LocalRect.CenterPoint;

  R := Min(P.X, P.Y) * S;

  Arc := TPathData.Create;
  try
    Arc.AddArc(P, TPointF.Create(R, R), A + 135, 270);
    Arc.AddArc(P, TPointF.Create(R - 2, R - 2), A + 45, -270);
    Arc.ClosePath;

    Canvas.FillPath(Arc, AbsoluteOpacity, FBrush);
  finally
    Arc.Free;
  end;
end;

procedure TSpinner.DrawBallClipRotatePulse;
var
  Arc: TPathData;
  P: TPointF;
  R, S: Single;
  T, A: Single;
  DR: TRectF;
begin
  T := FAnim.NormalizedTime;

  A := InterpolateSingle(0, 360, T);

  if T < 0.5 then
    T := FBezier.Solve(T * 2, WinSpinnerBezierEpsilon)
  else
    T := FBezier.Solve(1 - (T - 0.5) * 2, WinSpinnerBezierEpsilon);

  S := InterpolateSingle(1, 0.6, T);

  P := LocalRect.CenterPoint;

  R := Min(P.X, P.Y) * S;

  Arc := TPathData.Create;
  try
    Arc.AddArc(P, TPointF.Create(R, R), A + 45, 90);
    Arc.AddArc(P, TPointF.Create(R - 2, R - 2), A + 135, -90);
    Arc.ClosePath;

    Canvas.FillPath(Arc, AbsoluteOpacity, FBrush);

    Arc.Clear;
    Arc.AddArc(P, TPointF.Create(R, R), A - 45, -90);
    Arc.AddArc(P, TPointF.Create(R - 2, R - 2), A - 135, 90);
    Arc.ClosePath;

    Canvas.FillPath(Arc, AbsoluteOpacity, FBrush);

    R := (Min(P.X, P.Y) - 9) * S;

    DR := RectF(0, 0, R * 2, R * 2);

    DR := DR.CenterAt(LocalRect);

    Canvas.FillEllipse(DR, AbsoluteOpacity, FBrush);
  finally
    Arc.Free;
  end;
end;

procedure TSpinner.DrawBallClipRotateMultiple;
  procedure CalcAS(T: Single; out A, S: Single);
  begin
    if T < 0.5 then
    begin
      T := FBezier.Solve(T * 2,  WinSpinnerBezierEpsilon);

      A := InterpolateSingle(0, 180, T);

      S := InterpolateSingle(1, 0.6, T);
    end
    else
    begin
      T := FBezier.Solve((T - 0.5) * 2, WinSpinnerBezierEpsilon);

      A := InterpolateSingle(0, 180, T);

      S := InterpolateSingle(0.6, 1, T);
    end;
  end;
var
  Arc: TPathData;
  P: TPointF;
  R, S1, S2: Single;
  T, A1, A2: Single;
begin
  P := LocalRect.CenterPoint;

  T := FAnim.NormalizedTime;

  CalcAS(T, A1, S1);

  T := T * 2 - Trunc(T * 2);

  CalcAS(T, A2, S2);

  Arc := TPathData.Create;
  try
    R := (Min(P.X, P.Y) - 2) * S1;

    FillArc(Arc, P, R + 1, 2, A1 - 45, 90, 1);
    FillArc(Arc, P, R + 1, 2, A1 - 135, -90, 1);

    R := (Min(P.X, P.Y) - 12) * S2;

    A2 := 360 - A2;

    FillArc(Arc, P, R + 1, 2, A2 + 45, 90, 1);
    FillArc(Arc, P, R + 1, 2, A2 - 45, -90, 1);
  finally
    Arc.Free;
  end;
end;

procedure TSpinner.DrawBallScaleRipple;
var
  P: TPointF;
  R: Single;
  T, S, O: Single;
  DR: TRectF;
  Stroke: TStrokeBrush;
begin
  P := LocalRect.CenterPoint;

  R := Min(P.X, P.Y) - 2;

  T := FAnim.NormalizedTime;

  if T < 0.7 then
  begin
    T := FBezier.Solve(T / 0.7, WinSpinnerBezierEpsilon);

    S := InterpolateSingle(0.1, 1, T);

    O := InterpolateSingle(1, 0.7, T);
  end
  else
  begin
    T := FBezier.Solve((T - 0.7) / 0.3, WinSpinnerBezierEpsilon);

    S := 1;

    O := InterpolateSingle(0.7, 0, T);
  end;

  Stroke := TStrokeBrush.Create(TBrushKind.Solid, FColor);

  try
    Stroke.Thickness := 2;

    R := R * S;

    DR := TRectF.Create(PointF(P.X - R - 1, P.Y - R - 1),
      R * 2 + 2, R * 2 + 2);

    Canvas.DrawEllipse(DR, AbsoluteOpacity * O, Stroke);
  finally
    Stroke.Free;
  end;
end;

procedure TSpinner.DrawInnerLineSpinFade;
var
  P: TPointF;
  T, TI, Angle, O: Single;
  Path: TPathData;
  I: Integer;
  DR: TRectF;
  M, M1, M2: TMatrix;
begin
  P := LocalRect.CenterPoint;

  T := FAnim.NormalizedTime;

  for I := 0 to 7 do
  begin
    TI := T + (7 - I) * 0.1;

    if TI > 1 then
      TI := TI - 1;

    if TI < 0.5 then
    begin
      TI := FBezier.Solve(TI * 2, WinSpinnerBezierEpsilon);

      O := InterpolateSingle(1, 0.3, TI);
    end
    else
    begin
      TI := FBezier.Solve((TI - 0.5) * 2, WinSpinnerBezierEpsilon);

      O := InterpolateSingle(0.3, 1, TI);
    end;

    Angle := -I * 45;

    Path := TPathData.Create;
    try
      DR := TRectF.Create(PointF(P.X - 2, P.Y + 11), 5, 16);

      M1 := TMatrix.Identity;
      M1.m31 := -P.X;
      M1.m32 := -P.Y;

      M2 := TMatrix.Identity;
      M2.m31 := P.X;
      M2.m32 := P.Y;

      M := M1 * (TMatrix.CreateRotation(DegToRad(Angle)) * M2);

      Path.AddRectangle(DR, 2, 2, AllCorners);
      Path.ApplyMatrix(M);

      Canvas.FillPath(Path, AbsoluteOpacity * O, FBrush);
    finally
      Path.Free;
    end;
  end;
end;

procedure TSpinner.DrawLineScalePulseOut;
var
  T, TI: Single;
  I: Integer;
  S: Single;
  R: TRectF;
  W, H, Space: Single;
begin
  T := FAnim.NormalizedTime;

  W := (Width - 20) / 5;
  H := Height;
  Space := 0;

  for I := 0 to 4 do
  begin
    case I of
      1, 3:
        TI := T + 0.4 / 0.9;

      0, 4:
        TI := T + 0.2 / 0.9;

    else
      TI := T + 0.6 / 0.9;
    end;

    if TI > 1 then
      TI := TI - 1;

    if TI < 0.5 then
    begin
      TI := FBezier.Solve(TI * 2,  WinSpinnerBezierEpsilon);

      S := InterpolateSingle(1, 0.4, TI);
    end
    else
    begin
      TI := FBezier.Solve((TI - 0.5) * 2, WinSpinnerBezierEpsilon);

      S := InterpolateSingle(0.4, 1, TI);
    end;

    R := RectF(0, 0, 4, H * S);

    R.Offset(I * W + Space, (Height - R.Height) / 2);

    Space := Space + 5;

    Canvas.FillRect(R, 2, 2, AllCorners, AbsoluteOpacity, FBrush);
  end;
end;

procedure TSpinner.DrawLineScalePulseOutRapid;
var
  T, TI: Single;
  I: Integer;
  S: Single;
  R: TRectF;
  W, H, Space: Single;
begin
  T := FAnim.NormalizedTime;

  W := (Width - 20) / 5;
  H := Height;
  Space := 0;

  for I := 0 to 4 do
  begin
    case I of
      1, 3:
        TI := T + 0.25 / 0.9;

      0, 4:
        TI := T;

    else
      TI := T + 0.5 / 0.9;
    end;

    if TI > 1 then
      TI := TI - 1;

    if TI < 0.8 then
    begin
      TI := FBezier.Solve(TI / 0.8, WinSpinnerBezierEpsilon);

      S := InterpolateSingle(1, 0.3, TI);
    end
    else if TI < 0.9 then
    begin
      TI := FBezier.Solve((TI - 0.8) * 10, WinSpinnerBezierEpsilon);

      S := InterpolateSingle(0.3, 1, TI);
    end
    else
      S := 1;

    R := RectF(0, 0, 4, H * S);
    R.Offset(I * W + Space, (Height - R.Height) / 2);

    Space := Space + 5;

    Canvas.FillRect(R, 2, 2, AllCorners, AbsoluteOpacity, FBrush);
  end;
end;

function TSpinner.GetCellRect(CellWidth, CellHeight: Single;
  Col, Row, ColSpan, RowSpan: Integer): TRectF;
var
  R: TRectF;
begin
  R.Left := CellWidth * Col;
  R.Top := CellHeight * Row;
  R.Right := CellWidth * (Col + ColSpan);
  R.Bottom := CellHeight * (Row + RowSpan);

  Result := RectF(0, 0, CellWidth, CellHeight);

  Result.Offset(R.CenterPoint.X - Result.CenterPoint.X,
    R.CenterPoint.Y - Result.CenterPoint.Y);
end;

procedure TSpinner.Paint;
var
  State: TCanvasSaveState;
begin
  inherited;

  if not FActive then
    Exit;

  State := Canvas.SaveState;
  try
    if Assigned(FDrawProc) then
      FDrawProc;
  finally
    Canvas.RestoreState(State);
  end;
end;

destructor TFSpinner.Destroy;
begin
  FSpinner.Free;

  inherited;
end;

// =============================================================================
// FSpinner
// =============================================================================
procedure TFSpinner.FCreate(FParent: TFmxObject);
begin
  FSpinner := TSpinner.Create(nil);
  FSpinner.Parent := TFmxObject(FParent);
end;

procedure TFSpinner.Cursor(FCursor: TCursor);
begin
  FSpinner.Cursor := TCursor(FCursor);
end;

procedure TFSpinner.Left(FLeft: Single);
begin
  FSpinner.Left := FLeft;
end;

procedure TFSpinner.Top(FTop: Single);
begin
  FSpinner.Top := FTop;
end;

procedure TFSpinner.Width(FWidth: Single);
begin
  FSpinner.Size.Width := FWidth;
  FSpinner.Size.Height := FWidth;
end;

procedure TFSpinner.SetBounds(FLeft, FTop, FWidth: Single);
begin
  FSpinner.SetBounds(FLeft, FTop, FWidth, FWidth);
end;

procedure TFSpinner.Position(X, Y: Single);
begin
  FSpinner.Position.X := X;
  FSpinner.Position.Y := Y;
end;

procedure TFSpinner.Align(Al: TAlignLayout);
begin
  FSpinner.Align := TAlignLayout(Al);
end;

procedure TFSpinner.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FSpinner.Margins.Left := FLeft;
  FSpinner.Margins.Top := FTop;
  FSpinner.Margins.Right := FRight;
  FSpinner.Margins.Bottom := FBottom;
end;

procedure TFSpinner.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FSpinner.Padding.Left := FLeft;
  FSpinner.Padding.Top := FTop;
  FSpinner.Padding.Right := FRight;
  FSpinner.Padding.Bottom := FBottom;
end;

procedure TFSpinner.SetHint(const FText: WideString);
begin
  FSpinner.ShowHint := True;
  FSpinner.Hint := string(FText);
end;

procedure TFSpinner.SetClipParent(FValue: Boolean);
begin
  FSpinner.ClipParent := FValue;
end;

procedure TFSpinner.SetClipChildren(FValue: Boolean);
begin
  FSpinner.ClipChildren := FValue;
end;

procedure TFSpinner.BringToFront;
begin
  FSpinner.BringToFront;
end;

procedure TFSpinner.SendToBack;
begin
  FSpinner.SendToBack;
end;

procedure TFSpinner.SetTag(FTag: Integer);
begin
  FSpinner.Tag := FTag;
end;

procedure TFSpinner.Kind(FKind: TSpinnerKind);
begin
  FSpinner.Kind := TSpinnerKind(FKind);
end;

procedure TFSpinner.Color(FColor: TAlphaColor);
begin
  FSpinner.Color := TAlphaColor(FColor);
end;

procedure TFSpinner.Speed(FSpeed: Single);
begin
  FSpinner.Speed := FSpeed;
end;

procedure TFSpinner.Start;
begin
  FSpinner.Start;
end;

procedure TFSpinner.Stop;
begin
  FSpinner.Stop;
end;

procedure TFSpinner.Opacity(FOpacity: Single);
begin
  FSpinner.Opacity := FOpacity;
end;

procedure TFSpinner.Enabled(FEnabled: Boolean);
begin
  FSpinner.Enabled := FEnabled;
end;

procedure TFSpinner.Visible(FVisible: Boolean);
begin
  FSpinner.Visible := FVisible;
end;

procedure TFSpinner.HitTest(FHitTest: Boolean);
begin
  FSpinner.HitTest := FHitTest;
end;

function TFSpinner.IsVisible: Boolean;
begin
  Result := FSpinner.Visible;
end;

function TFSpinner.GetTag: Integer;
begin
  Result := FSpinner.Tag;
end;

function TFSpinner.GetLeft: Single;
begin
  Result := FSpinner.Left;
end;

function TFSpinner.GetTop: Single;
begin
  Result := FSpinner.Top;
end;

function TFSpinner.GetWidth: Single;
begin
  Result := FSpinner.Width;
end;

function TFSpinner.GetObject: TFmxObject;
begin
  Result := TFmxObject(FSpinner);
end;

procedure TFSpinner.OnClick(Event: TNotifyEvent);
begin
  FSpinner.OnClick := TNotifyEvent(Event);
end;

procedure TFSpinner.OnMouseDown(Event: TMouseEvent);
begin
  FSpinner.OnMouseDown := TMouseEvent(Event);
end;

procedure TFSpinner.OnMouseEnter(Event: TNotifyEvent);
begin
  FSpinner.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSpinner.OnMouseLeave(Event: TNotifyEvent);
begin
  FSpinner.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFSpinner.OnMouseUp(Event: TMouseEvent);
begin
  FSpinner.OnMouseUp := TMouseEvent(Event);
end;

function TFSpinner.Handle: TFmxObject;
begin
  Result := TFmxObject(FSpinner);
end;

// =============================================================================
// Exports
// =============================================================================
function InitSpinnerHandle: FSpinner;
begin
  Result := TFSpinner.Create;
end;

exports
  InitSpinnerHandle;

end.
