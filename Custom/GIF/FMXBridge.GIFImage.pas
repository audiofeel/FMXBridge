unit FMXBridge.GIFImage;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Math,
  Winapi.Windows,
  FMX.Types,
  FMX.Objects,
  FMX.Graphics,
  FMXBridge.GIF.Types,
  FMXBridge.GIF.Worker,
  FMXBridge.GIF.Animation;

type
  TGIFImage = class(TImage)
  private
    FClock: TGIFAnimationClock;
    FFrameQueue: IGIFFrameQueue;
    FFileName: string;
    FGeneration: Cardinal;
    FFrameCount: Integer;
    FFrameIndex: Integer;
    FCanvasWidth: Integer;
    FCanvasHeight: Integer;
    FAutoPlay: Boolean;
    FLoop: Boolean;
    FSpeed: Single;
    FReady: Boolean;
    FLoading: Boolean;
    FPlaying: Boolean;
    FStartPlayingAfterLoad: Boolean;
    FPendingFrameIndex: Integer;
    FNextFrameTime: UInt64;
    FQPCFrequency: Int64;
    FRemainingFrameTime: UInt64;
    FProgress: Single;
    FErrorMessage: string;
    FOnReady: TNotifyEvent;
    FOnError: TNotifyEvent;
    FOnFrame: TNotifyEvent;
    FOnStop: TNotifyEvent;
    FOnProgress: TNotifyEvent;
    procedure AnimationTick(Sender: TObject);
    procedure StartWorkerAtFrame(AFrameIndex: Integer;
      AResumePlayback: Boolean);
    procedure CancelWorker;
    procedure HandlePacketError(const APacket: TGIFFramePacket);
    procedure HandleCompleted;
    procedure InstallFrame(const AFrame: TGIFComposedFrame);
    procedure SetAutoPlay(AValue: Boolean);
    procedure SetLoop(AValue: Boolean);
    procedure SetSpeed(AValue: Single);
    procedure SetActiveFrame(AValue: Integer);
    function GetIsPlaying: Boolean;
    function GetProgress: Single;
    function GetEffectiveDelay(const AFrame: TGIFComposedFrame): UInt64;
    function GetNow: UInt64;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadFromFile(const AFileName: string);
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure Clear;
    property IsReady: Boolean read FReady;
    property IsLoading: Boolean read FLoading;
    property IsPlaying: Boolean read GetIsPlaying;
    property FrameCount: Integer read FFrameCount;
    property ActiveFrame: Integer read FFrameIndex write SetActiveFrame;
    property Progress: Single read GetProgress;
    property ErrorMessage: string read FErrorMessage;
  published
    property AutoPlay: Boolean read FAutoPlay write SetAutoPlay default True;
    property Loop: Boolean read FLoop write SetLoop default True;
    property Speed: Single read FSpeed write SetSpeed;
    property OnReady: TNotifyEvent read FOnReady write FOnReady;
    property OnError: TNotifyEvent read FOnError write FOnError;
    property OnFrame: TNotifyEvent read FOnFrame write FOnFrame;
    property OnStop: TNotifyEvent read FOnStop write FOnStop;
    property OnProgress: TNotifyEvent read FOnProgress write FOnProgress;
  end;

implementation

constructor TGIFImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FAutoPlay := True;
  FLoop := True;
  FSpeed := 1.0;
  FFrameCount := 0;
  FFrameIndex := -1;
  FPendingFrameIndex := -1;
  FProgress := 0;
  FGeneration := 0;
  FQPCFrequency := 0;
  QueryPerformanceFrequency(FQPCFrequency);

  FClock := TGIFAnimationClock.Create(Self);
  FClock.Parent := Self;
  FClock.OnTick := AnimationTick;
end;

destructor TGIFImage.Destroy;
begin
  if Assigned(FClock) then
  begin
    FClock.StopClock;
    FClock.OnTick := nil;
  end;

  CancelWorker;
  inherited Destroy;
end;

procedure TGIFImage.Loaded;
begin
  inherited;
end;

function TGIFImage.GetNow: UInt64;
var
  Counter: Int64;
begin
  if FQPCFrequency > 0 then
  begin
    QueryPerformanceCounter(Counter);
    Result := (UInt64(Counter) * 1000) div UInt64(FQPCFrequency);
  end
  else
    Result := GetTickCount64;
end;

function TGIFImage.GetIsPlaying: Boolean;
begin
  Result := FPlaying;
end;

function TGIFImage.GetProgress: Single;
begin
  Result := FProgress;
end;

function TGIFImage.GetEffectiveDelay(
  const AFrame: TGIFComposedFrame): UInt64;
var
  Delay: Cardinal;
begin
  Delay := AFrame.DelayMS;

  // Zero-delay intermediate frames are composed but not presented.
  // A zero-delay final frame receives one display interval.
  if Delay = 0 then
  begin
    if AFrame.Index < FFrameCount - 1 then
      Exit(0);
    Delay := 10;
  end;

  Result := UInt64(Max(1, Round(Delay / FSpeed)));
end;

procedure TGIFImage.CancelWorker;
begin
  if FFrameQueue <> nil then
  begin
    FFrameQueue.Cancel;
    FFrameQueue := nil;
  end;
end;

procedure TGIFImage.StartWorkerAtFrame(AFrameIndex: Integer;
  AResumePlayback: Boolean);
begin
  CancelWorker;

  Inc(FGeneration);

  FFrameQueue := TGIFFrameQueue.Create(1);
  FFrameQueue.SetLoop(FLoop);

  FLoading := True;
  FReady := False;
  FPlaying := False;
  FStartPlayingAfterLoad := AResumePlayback;
  FRemainingFrameTime := 0;
  FErrorMessage := '';

  if AFrameIndex < 0 then
    AFrameIndex := 0;

  TGIFDecodeThread.Create(FFileName, FGeneration, AFrameIndex, FFrameQueue);
  FClock.StartClock;
end;

procedure TGIFImage.LoadFromFile(const AFileName: string);
begin
  FFileName := AFileName;

  FFrameCount := 0;
  FFrameIndex := -1;
  FCanvasWidth := 0;
  FCanvasHeight := 0;
  FProgress := 0;
  FPendingFrameIndex := -1;
  FErrorMessage := '';

  Bitmap.SetSize(0, 0);
  Repaint;

  StartWorkerAtFrame(0, FAutoPlay);
end;

procedure TGIFImage.Clear;
begin
  CancelWorker;

  FClock.StopClock;

  Inc(FGeneration);

  FFileName := '';
  FFrameCount := 0;
  FFrameIndex := -1;
  FCanvasWidth := 0;
  FCanvasHeight := 0;
  FProgress := 0;
  FPendingFrameIndex := -1;
  FLoading := False;
  FReady := False;
  FPlaying := False;
  FStartPlayingAfterLoad := False;
  FRemainingFrameTime := 0;
  FErrorMessage := '';

  Bitmap.SetSize(0, 0);
  Repaint;
end;

procedure TGIFImage.Play;
begin
  if FLoading and not FReady then
  begin
    FStartPlayingAfterLoad := True;
    FClock.StartClock;
    Exit;
  end;

  if not FReady then
    Exit;

  if FPlaying then
    Exit;

  FPlaying := True;
  FNextFrameTime := GetNow + FRemainingFrameTime;
  FRemainingFrameTime := 0;
  FClock.StartClock;
end;

procedure TGIFImage.Pause;
var
  NowValue: UInt64;
begin
  if FLoading and not FReady then
  begin
    FStartPlayingAfterLoad := False;
    FClock.StartClock;
    Exit;
  end;

  if not FPlaying then
    Exit;

  NowValue := GetNow;

  if FNextFrameTime > NowValue then
    FRemainingFrameTime := FNextFrameTime - NowValue
  else
    FRemainingFrameTime := 0;

  FPlaying := False;
  FClock.StopClock;
end;

procedure TGIFImage.Stop;
begin
  Pause;
end;

procedure TGIFImage.SetAutoPlay(AValue: Boolean);
begin
  if FAutoPlay = AValue then
    Exit;

  FAutoPlay := AValue;

  if not FReady then
    FStartPlayingAfterLoad := FAutoPlay
  else if FAutoPlay then
    Play
  else
    Pause;
end;

procedure TGIFImage.SetLoop(AValue: Boolean);
begin
  if FLoop = AValue then
    Exit;

  FLoop := AValue;

  if FFrameQueue <> nil then
    FFrameQueue.SetLoop(AValue)
  else if AValue and FReady and (FFileName <> '') then
    StartWorkerAtFrame(0, FPlaying);
end;

procedure TGIFImage.SetSpeed(AValue: Single);
var
  NowValue: UInt64;
  Remaining: UInt64;
begin
  if AValue <= 0 then
    AValue := 1.0
  else
    AValue := Max(0.1, AValue);

  if SameValue(FSpeed, AValue, 0.0001) then
    Exit;

  if FPlaying then
  begin
    NowValue := GetNow;

    if FNextFrameTime > NowValue then
      Remaining := FNextFrameTime - NowValue
    else
      Remaining := 0;

    if FSpeed > 0 then
      Remaining := Round(Remaining * FSpeed / AValue);

    FNextFrameTime := NowValue + Remaining;
  end
  else if FRemainingFrameTime > 0 then
    FRemainingFrameTime := Round(FRemainingFrameTime * FSpeed / AValue);

  FSpeed := AValue;
end;

procedure TGIFImage.SetActiveFrame(AValue: Integer);
begin
  if AValue < 0 then
    AValue := 0;

  if FFrameCount <= 0 then
  begin
    FPendingFrameIndex := AValue;
    Exit;
  end;

  if AValue >= FFrameCount then
    AValue := FFrameCount - 1;

  if (AValue = FFrameIndex) and FReady then
    Exit;

  StartWorkerAtFrame(AValue, FPlaying);
end;

procedure TGIFImage.HandlePacketError(const APacket: TGIFFramePacket);
begin
  FLoading := False;
  FPlaying := False;
  FErrorMessage := APacket.ErrorMessage;

  FClock.StopClock;
  CancelWorker;

  if Assigned(FOnError) then
    FOnError(Self);
end;

procedure TGIFImage.HandleCompleted;
begin
  FLoading := False;
  FPlaying := False;
  FRemainingFrameTime := 0;
  FClock.StopClock;

  CancelWorker;

  if Assigned(FOnStop) then
    FOnStop(Self);
end;

procedure TGIFImage.InstallFrame(const AFrame: TGIFComposedFrame);
var
  Data: TBitmapData;
  Source: PByte;
  Dest: PByte;
  X, Y: Integer;
  RowBytes: Integer;
begin
  if (FCanvasWidth <= 0) or (FCanvasHeight <= 0) then
    raise EGIFDecodeError.Create('GIF canvas dimensions are not initialized');

  RowBytes := FCanvasWidth * 4;

  if Length(AFrame.Pixels) <> RowBytes * FCanvasHeight then
    raise EGIFDecodeError.Create('GIF composed frame buffer size is invalid');

  if (Bitmap.Width <> FCanvasWidth) or (Bitmap.Height <> FCanvasHeight) then
    Bitmap.SetSize(FCanvasWidth, FCanvasHeight);

  if not Bitmap.Map(TMapAccess.Write, Data) then
    raise EGIFDecodeError.Create('FMX could not map the GIF bitmap');

  try
    if (Data.Width <> FCanvasWidth) or (Data.Height <> FCanvasHeight) or
       (Data.Pitch < RowBytes) then
      raise EGIFDecodeError.Create('FMX returned an incompatible GIF bitmap layout');

    case Data.PixelFormat of
      TPixelFormat.BGRA:
        begin
          for Y := 0 to FCanvasHeight - 1 do
          begin
            Source := @AFrame.Pixels[Y * RowBytes];
            Dest := PByte(Data.Data) + Y * Data.Pitch;
            Move(Source^, Dest^, RowBytes);
          end;
        end;

      TPixelFormat.RGBA:
        begin
          for Y := 0 to FCanvasHeight - 1 do
          begin
            Source := @AFrame.Pixels[Y * RowBytes];
            Dest := PByte(Data.Data) + Y * Data.Pitch;

            for X := 0 to FCanvasWidth - 1 do
            begin
              Dest[0] := Source[2];
              Dest[1] := Source[1];
              Dest[2] := Source[0];
              Dest[3] := Source[3];

              Inc(Source, 4);
              Inc(Dest, 4);
            end;
          end;
        end;
    else
      raise EGIFDecodeError.CreateFmt(
        'Unsupported FMX bitmap pixel format: %d', [Ord(Data.PixelFormat)]);
    end;
  finally
    Bitmap.Unmap(Data);
  end;

  Repaint;
end;

procedure TGIFImage.AnimationTick(Sender: TObject);
var
  Packet: TGIFFramePacket;
  NowValue: UInt64;
  Delay: UInt64;
  CurrentGeneration: Cardinal;
begin
  if FFrameQueue = nil then
  begin
    FClock.StopClock;
    Exit;
  end;

  CurrentGeneration := FGeneration;

  // First frame: keep the clock alive only until a usable frame is available.
  if not FReady then
  begin
    while FFrameQueue.TryPop(Packet) do
    begin
      if Packet.Generation <> CurrentGeneration then
        Continue;

      case Packet.Kind of
        gfpkFrame:
          begin
            FFrameCount := Packet.FrameCount;
            FCanvasWidth := Packet.CanvasWidth;
            FCanvasHeight := Packet.CanvasHeight;

            if FPendingFrameIndex >= 0 then
            begin
              if FPendingFrameIndex >= FFrameCount then
                FPendingFrameIndex := FFrameCount - 1;

              StartWorkerAtFrame(FPendingFrameIndex, FStartPlayingAfterLoad);
              FPendingFrameIndex := -1;
              Exit;
            end;

            Delay := GetEffectiveDelay(Packet.Frame);

            if Delay = 0 then
            begin
              FProgress := Max(FProgress,
                (Packet.Frame.Index + 1) * 100.0 / FFrameCount);
              if Assigned(FOnProgress) then
                FOnProgress(Self);
              if CurrentGeneration <> FGeneration then
                Exit;
              Continue;
            end;

            try
              InstallFrame(Packet.Frame);
            except
              on E: Exception do
              begin
                Packet.Kind := gfpkError;
                Packet.ErrorMessage := E.ClassName + ': ' + E.Message;
                HandlePacketError(Packet);
                Exit;
              end;
            end;

            FFrameIndex := Packet.Frame.Index;
            FReady := True;
            FLoading := False;
            FProgress := Max(FProgress,
              (FFrameIndex + 1) * 100.0 / FFrameCount);

            FRemainingFrameTime := Delay;

            if FStartPlayingAfterLoad then
            begin
              FPlaying := True;
              FNextFrameTime := GetNow + FRemainingFrameTime;
              FRemainingFrameTime := 0;
            end
            else
              FPlaying := False;

            if Assigned(FOnProgress) then
              FOnProgress(Self);
            if CurrentGeneration <> FGeneration then
              Exit;

            if Assigned(FOnReady) then
              FOnReady(Self);
            if CurrentGeneration <> FGeneration then
              Exit;

            if FPlaying then
              FClock.StartClock
            else
              FClock.StopClock;

            Exit;
          end;

        gfpkCompleted:
          begin
            HandleCompleted;
            Exit;
          end;

        gfpkError:
          begin
            HandlePacketError(Packet);
            Exit;
          end;
      end;
    end;

    Exit;
  end;

  if not FPlaying then
    Exit;

  NowValue := GetNow;

  while NowValue >= FNextFrameTime do
  begin
    if not FFrameQueue.TryPop(Packet) then
      Break;

    if Packet.Generation <> CurrentGeneration then
      Continue;

    case Packet.Kind of
      gfpkFrame:
        begin
          Delay := GetEffectiveDelay(Packet.Frame);

          // Zero-delay intermediate frames are already included in the
          // compositor state. Skip their presentation and fetch the next one.
          if Delay = 0 then
          begin
            FProgress := Max(FProgress,
              (Packet.Frame.Index + 1) * 100.0 / FFrameCount);
            if Assigned(FOnProgress) then
              FOnProgress(Self);
            if CurrentGeneration <> FGeneration then
              Exit;
            Continue;
          end;

          try
            InstallFrame(Packet.Frame);
          except
            on E: Exception do
            begin
              Packet.Kind := gfpkError;
              Packet.ErrorMessage := E.ClassName + ': ' + E.Message;
              HandlePacketError(Packet);
              Exit;
            end;
          end;

          FFrameIndex := Packet.Frame.Index;
          FNextFrameTime := FNextFrameTime + Delay;
          FProgress := Max(FProgress,
            (FFrameIndex + 1) * 100.0 / FFrameCount);

          if Assigned(FOnProgress) then
            FOnProgress(Self);
          if (CurrentGeneration <> FGeneration) or not FPlaying then
            Exit;

          if Assigned(FOnFrame) then
            FOnFrame(Self);

          if (CurrentGeneration <> FGeneration) or not FPlaying then
            Exit;
        end;

      gfpkCompleted:
        begin
          HandleCompleted;
          Exit;
        end;

      gfpkError:
        begin
          HandlePacketError(Packet);
          Exit;
        end;
    end;
  end;
end;

end.
