unit FMXAudio.Audio.PCM;

interface

uses
  System.SysUtils, FMXAudio.Types, PCM.Audio, PCM.Audio.Backend;

type
  TPCMAudioBackendFactory = reference to function(const Format: TPCMAudioFormat): IPCMAudioBackend;

  TPCMAudioOutput = class(TInterfacedObject, IAudioOutput, IAudioOutputPlaybackControl, IAudioOutputDrain)
  private
    FAudio: TPCMAudio;
    FRate, FChannels: Integer;
    FPlayed: Int64;
    FLastPlayed: Cardinal;
    FAttackFrames, FAttackPosition: Integer;
    FPending: TArray<SmallInt>;
    FPendingFrames: Integer;
    FBackendFactory: TPCMAudioBackendFactory;
  public
    constructor Create(const BackendFactory: TPCMAudioBackendFactory = nil);
    destructor Destroy; override;
    procedure Open(SampleRate, Channels: Integer);
    procedure Write(const Frame: TAudioFrame);
    procedure Flush;
    procedure Clear;
    function BufferedFrames: Integer;
    function PlayedFrames(out Frames: Int64): Boolean;
    function SetPaused(Value: Boolean): Boolean;
  end;

implementation

uses
  System.Math;

constructor TPCMAudioOutput.Create(const BackendFactory: TPCMAudioBackendFactory);
begin
  inherited Create;
  FBackendFactory := BackendFactory
end;

destructor TPCMAudioOutput.Destroy;
begin
  FAudio.Free;
  inherited
end;

procedure TPCMAudioOutput.Open(SampleRate, Channels: Integer);
var
  Format: TPCMAudioFormat;
begin
  FreeAndNil(FAudio);
  Format.SampleRate := SampleRate;
  Format.Channels := Channels;
  Format.BlockFrames := 1024;
  Format.BlockCount := Max(32, (SampleRate + 1023) div 1024 + 8);
  if Assigned(FBackendFactory) then
    FAudio := TPCMAudio.Create(Format, FBackendFactory(Format))
  else
    FAudio := TPCMAudio.Create(Format);
  if FAudio.Error <> '' then
    raise EPlayerError.Create('PCM audio: ' + FAudio.Error);
  FRate := SampleRate;
  FChannels := Channels;
  FPlayed := 0;
  FLastPlayed := 0;
  FAttackFrames := Max(2, SampleRate div 200); // 5 ms removes the initial sample step.
  FAttackPosition := 0;
  SetLength(FPending, 1024 * Channels);
  FPendingFrames := 0;
end;

procedure TPCMAudioOutput.Write(const Frame: TAudioFrame);
var
  Offset, Count, i, Ch, Index: Integer;
begin
  if (FAudio = nil)
    or (Frame.SampleRate <> FRate)
    or (Frame.Channels <> FChannels)
    or (Frame.Frames < 0)
    or (Length(Frame.Samples) <> Int64(Frame.Frames) * FChannels) then
    raise EPlayerError.Create('Invalid PCM output format');
  Offset := 0;
  while Offset < Frame.Frames do
  begin
    Count := Min(1024 - FPendingFrames, Frame.Frames - Offset);
    Move(Frame.Samples[Offset * FChannels], FPending[FPendingFrames * FChannels], Count * FChannels * SizeOf(SmallInt));
    for i := 0 to Min(Count, FAttackFrames - FAttackPosition) - 1 do
    begin
      for Ch := 0 to FChannels - 1 do
      begin
        Index := (FPendingFrames + i) * FChannels + Ch;
        FPending[Index] := Round(FPending[Index] * (FAttackPosition / (FAttackFrames - 1)));
      end;
      Inc(FAttackPosition);
    end;
    Inc(FPendingFrames, Count);
    if FPendingFrames = 1024 then
      Flush;
    Inc(Offset, Count);
  end;
end;

procedure TPCMAudioOutput.Flush;
var
  Before, After: TPCMAudioQueueState;
begin
  if FPendingFrames = 0 then
    Exit;
  Before := FAudio.QueueState;
  FAudio.Submit(FPending, FPendingFrames);
  After := FAudio.QueueState;
  if FAudio.Error <> '' then
    raise EPlayerError.Create('PCM audio: ' + FAudio.Error);
  if After.DroppedSamples <> Before.DroppedSamples then
    raise EPlayerError.Create('PCM output queue overflow');
  FPendingFrames := 0;
end;

procedure TPCMAudioOutput.Clear;
begin
  if FAudio <> nil then
    FAudio.Clear;
  FPlayed := 0;
  FLastPlayed := 0;
  FAttackPosition := 0;
  FPendingFrames := 0;
end;

function TPCMAudioOutput.SetPaused(Value: Boolean): Boolean;
begin
  Result := (FAudio <> nil) and FAudio.SetPaused(Value)
end;

function TPCMAudioOutput.BufferedFrames: Integer;
begin
  Result := 0;
  if FAudio <> nil then
  begin
    Result := FAudio.QueueState.QueuedBlocks * 1024 + FPendingFrames;
    if FAudio.Error <> '' then
      raise EPlayerError.Create('PCM audio: ' + FAudio.Error);
  end;
end;

function TPCMAudioOutput.PlayedFrames(out Frames: Int64): Boolean;
var
  State: TPCMAudioQueueState;
begin
  Frames := 0;
  Result := False;
  if FAudio = nil then
    Exit;
  State := FAudio.QueueState;
  if FAudio.Error <> '' then
    raise EPlayerError.Create('PCM audio: ' + FAudio.Error);
  if not State.PositionKnown then
    Exit;
  Inc(FPlayed, Int64((UInt64(State.PlayedSamples) + UInt64($100000000) - UInt64(FLastPlayed)) and UInt64($FFFFFFFF)));
  FLastPlayed := State.PlayedSamples;
  Frames := FPlayed;
  Result := True;
end;

end.

