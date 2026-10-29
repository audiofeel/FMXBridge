unit FMXAudio.Sources.Convert;

interface

uses
  System.SysUtils,
  FMXAudio.Types,
  FMXAudio.Sources;

type
  TAudioChannelOrder = (Wave, Vorbis, Discrete);

  TConvertedAudioSource = class(TInterfacedObject, IAudioSource, IAudioSourceCancellation)
  private
    FSource: IAudioSource;
    FInputRate, FInputChannels, FRate, FChannels: Integer;
    FInputFrames, FFrames, FPosition, FReadPosition, FBase: Int64;
    FPCM: TArray<Double>;
    FMatrix: TArray<TArray<Double>>;
    FEOF, FAllowShortInput: Boolean;
    FCancel: TAudioCancelCheck;
    FChannelMask: Int64;
    procedure EnsureInput(ThroughFrame: Int64);
    procedure BuildMatrix(Order: TAudioChannelOrder);
  public
    constructor Create(
        const Source: IAudioSource;
        InputRate, InputChannels: Integer;
        InputFrames: Int64;
        Rate, Channels: Integer;
        Frames: Int64;
        Order: TAudioChannelOrder;
        ChannelMask: Int64 = -1;
        AllowShortInput: Boolean = False
    );
    function ReadFrame(out Frame: TAudioFrame): Boolean;
    procedure Seek(Time: Int64);
    function GetDuration: Int64;
    procedure SetCancellation(const Check: TAudioCancelCheck);
  end;

implementation

uses
  System.Math;

constructor TConvertedAudioSource.Create(
    const Source: IAudioSource;
    InputRate, InputChannels: Integer;
    InputFrames: Int64;
    Rate, Channels: Integer;
    Frames: Int64;
    Order: TAudioChannelOrder;
    ChannelMask: Int64;
    AllowShortInput: Boolean
);
begin
  inherited Create;
  FSource := Source;
  FInputRate := InputRate;
  FInputChannels := InputChannels;
  FInputFrames := InputFrames;
  FRate := Rate;
  FChannels := Channels;
  FFrames := Frames;
  FChannelMask := ChannelMask;
  FAllowShortInput := AllowShortInput;
  BuildMatrix(Order);
end;

procedure TConvertedAudioSource.BuildMatrix(Order: TAudioChannelOrder);
var
  i, c: Integer;
  Sum, Norm: Double;

  procedure Route(Index: Integer; Left, Right: Double);
  begin
    if (Index < 0) or (Index >= FInputChannels) then
      Exit;
    if FChannels = 1 then
      FMatrix[0][Index] := (Left + Right) * 0.5
    else
    begin
      FMatrix[0][Index] := Left;
      FMatrix[1][Index] := Right
    end;
  end;

begin
  SetLength(FMatrix, FChannels, FInputChannels);
  if FChannelMask >= 0 then
  begin
    i := 0;
    for var BitIndex := 0 to 17 do
      if FChannelMask and (Cardinal(1) shl BitIndex) <> 0 then
      begin
        if i >= FInputChannels then
          raise EPlayerFormat.Create('Channel mask exceeds input');
        case BitIndex of
          0: Route(i, 1, 0);
          1: Route(i, 0, 1);
          2, 8: Route(i, Sqrt(0.5), Sqrt(0.5));
          3, 11, 13, 16: Route(i, 0.5, 0.5);
          4, 6, 9: Route(i, Sqrt(0.5), 0);
          5, 7, 10: Route(i, 0, Sqrt(0.5));
          12, 15: Route(i, 0.5, 0);
          14, 17: Route(i, 0, 0.5);
        end;
        Inc(i);
      end;
    if (i > FInputChannels) or (FChannelMask shr 18 <> 0) then
      raise EPlayerFormat.Create('Channel mask/input mismatch');
    Norm := 1;
    for c := 0 to FChannels - 1 do
    begin
      Sum := 0;
      for i := 0 to FInputChannels - 1 do
        Sum := Sum + Abs(FMatrix[c, i]);
      Norm := Max(Norm, Sum);
    end;
    for c := 0 to FChannels - 1 do
      for i := 0 to FInputChannels - 1 do
        FMatrix[c, i] := FMatrix[c, i] / Norm;
    Exit;
  end;
  if FInputChannels = 1 then
  begin
    for c := 0 to FChannels - 1 do
      FMatrix[c][0] := 1;
    Exit
  end;
  Route(0, 1, 0);
  Route(1, 0, 1);
  if (FInputChannels <= 2) or (Order = TAudioChannelOrder.Discrete) then
    Exit;
  if Order = TAudioChannelOrder.Vorbis then
  begin
    if FInputChannels = 3 then
    begin
      Route(1, 0.707106781186548, 0.707106781186548);
      Route(2, 0, 1)
    end
    else if FInputChannels = 4 then
    begin
      Route(2, 0.707106781186548, 0);
      Route(3, 0, 0.707106781186548)
    end
    else
    begin
      Route(1, 0.707106781186548, 0.707106781186548);
      Route(2, 0, 1);
      Route(3, 0.707106781186548, 0);
      Route(4, 0, 0.707106781186548);
      case FInputChannels of
        6: Route(5, 0.5, 0.5);
        7:
        begin
          Route(5, 0.5, 0.5);
          Route(6, 0.5, 0.5)
        end;
        8:
        begin
          Route(5, 0.707106781186548, 0);
          Route(6, 0, 0.707106781186548);
          Route(7, 0.5, 0.5)
        end;
      end;
    end;
  end
  else
    case FInputChannels of
      3: Route(2, 0.707106781186548, 0.707106781186548);
      4:
      begin
        Route(2, 0.707106781186548, 0);
        Route(3, 0, 0.707106781186548)
      end;
      5:
      begin
        Route(2, 0.707106781186548, 0.707106781186548);
        Route(3, 0.707106781186548, 0);
        Route(4, 0, 0.707106781186548)
      end;
    else
      Route(2, 0.707106781186548, 0.707106781186548);
      Route(3, 0.5, 0.5);
      if FInputChannels = 7 then
      begin
        Route(4, 0.5, 0.5);
        Route(5, 0.707106781186548, 0);
        Route(6, 0, 0.707106781186548)
      end
      else
      begin
        Route(4, 0.707106781186548, 0);
        Route(5, 0, 0.707106781186548);
        Route(6, 0.707106781186548, 0);
        Route(7, 0, 0.707106781186548)
      end;
    end;
  Norm := 1;
  for c := 0 to FChannels - 1 do
  begin
    Sum := 0;
    for i := 0 to FInputChannels - 1 do
      Sum := Sum + Abs(FMatrix[c][i]);
    Norm := Max(Norm, Sum)
  end;
  for c := 0 to FChannels - 1 do
    for i := 0 to FInputChannels - 1 do
      FMatrix[c][i] := FMatrix[c][i] / Norm;
end;

procedure TConvertedAudioSource.EnsureInput(ThroughFrame: Int64);
var
  Frame: TAudioFrame;
  Offset, i, c, Ch, Skip: Integer;
  Needed: Int64;
  Sum: Double;
begin
  while (FReadPosition <= ThroughFrame) and not FEOF do
  begin
    if Assigned(FCancel) and FCancel() then
      raise EAudioReadCancelled.Create('Audio conversion cancelled');
    if not FSource.ReadFrame(Frame) then
    begin
      FEOF := True;
      if FAllowShortInput then
      begin
        FInputFrames := FReadPosition;
        FFrames := RescaleTime(FReadPosition, FInputRate, FRate);
      end
      else if FReadPosition < FInputFrames then
        raise EPlayerFormat.Create('Truncated source while converting');
      Break
    end;
    if (Frame.SampleRate <> FInputRate)
        or (Frame.Channels <> FInputChannels)
        or (Frame.SamplePosition <> FReadPosition) then
      raise EPlayerFormat.Create('Discontinuous source while converting');
    Needed := Max(Int64(0), RescaleTime(FPosition, FRate, FInputRate) - 32);
    Skip := Min(Int64(Frame.Frames), Max(Int64(0), Needed - FReadPosition));
    if Length(FPCM) = 0 then
      FBase := FReadPosition + Skip;
    Offset := Length(FPCM);
    SetLength(FPCM, Offset + (Frame.Frames - Skip) * FChannels);
    for i := Skip to Frame.Frames - 1 do
      for c := 0 to FChannels - 1 do
      begin
        Sum := 0;
        for Ch := 0 to FInputChannels - 1 do
          Sum := Sum + Frame.Samples[i * FInputChannels + Ch] * FMatrix[c][Ch];
        FPCM[Offset + (i - Skip) * FChannels + c] := Sum;
      end;
    Inc(FReadPosition, Frame.Frames);
  end;
end;

function TConvertedAudioSource.ReadFrame(out Frame: TAudioFrame): Boolean;
const
  RADIUS = 32;
var
  i, c, k, Count, Drop, Remaining: Integer;
  Position, Fraction, X, Weight, Sum, WeightSum: Double;
  Center, Index, Keep: Int64;
  Direct: Boolean;
begin
  Frame := Default(TAudioFrame);
  Result := False;
  if FPosition >= FFrames then
    Exit;
  Count := Min(Int64(1024), FFrames - FPosition);
  Direct := FRate = FInputRate;
  EnsureInput(Min(FInputFrames - 1, RescaleTime(FPosition + Count, FRate, FInputRate) + RADIUS));
  Count := Min(Int64(Count), Max(Int64(0), FFrames - FPosition));
  if Count = 0 then
    Exit;
  Frame.SampleRate := FRate;
  Frame.Channels := FChannels;
  Frame.SamplePosition := FPosition;
  Frame.PTS := RescaleTime(FPosition, FRate, PLAYER_TIME_BASE);
  Frame.Frames := Count;
  SetLength(Frame.Samples, Count * FChannels);
  for i := 0 to Count - 1 do
  begin
    Position := (FPosition + i) * Double(FInputRate) / FRate;
    Center := Floor(Position);
    Fraction := Position - Center;
    for c := 0 to FChannels - 1 do
    begin
      if Direct then
        Sum := FPCM[(Center - FBase) * FChannels + c]
      else
      begin
        Sum := 0;
        WeightSum := 0;
        for k := -RADIUS + 1 to RADIUS do
        begin
          X := k - Fraction;
          if Abs(X) < 1E-12 then
            Weight := 1
          else
            Weight := Sin(Pi * X) / (Pi * X);
          Weight := Weight * (0.5 + 0.5 * Cos(Pi * X / RADIUS));
          WeightSum := WeightSum + Weight;
          Index := Center + k;
          if (Index >= 0) and (Index < FInputFrames) then
            Sum := Sum + FPCM[(Index - FBase) * FChannels + c] * Weight;
        end;
        Sum := Sum / WeightSum;
      end;
      Frame.Samples[i * FChannels + c] := Round(EnsureRange(Sum, -32768.0, 32767.0));
    end;
  end;
  Inc(FPosition, Count);
  Keep := Max(Int64(0), RescaleTime(FPosition, FRate, FInputRate) - RADIUS);
  Drop := Max(Int64(0), Min(Keep - FBase, FReadPosition - FBase));
  if Drop > 0 then
  begin
    Remaining := Length(FPCM) - Drop * FChannels;
    if Remaining > 0 then
      Move(FPCM[Drop * FChannels], FPCM[0], Remaining * SizeOf(Double));
    SetLength(FPCM, Remaining);
    Inc(FBase, Drop);
  end;
  Result := True;
end;

procedure TConvertedAudioSource.Seek(Time: Int64);
begin
  FPosition := RescaleTime(EnsureRange(Time, Int64(0), GetDuration), PLAYER_TIME_BASE, FRate);
  if Time >= GetDuration then
    FPosition := FFrames;
  FPCM := nil;
  FBase := 0;
  FReadPosition := 0;
  FEOF := False;
  FSource.Seek(0);
end;

function TConvertedAudioSource.GetDuration: Int64;
begin
  Result := RescaleTime(FFrames, FRate, PLAYER_TIME_BASE)
end;

procedure TConvertedAudioSource.SetCancellation(const Check: TAudioCancelCheck);
var
  Control: IAudioSourceCancellation;
begin
  FCancel := Check;
  if Supports(FSource, IAudioSourceCancellation, Control) then
    Control.SetCancellation(Check);
end;

end.
