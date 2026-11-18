unit FMXBridge.GIF.Worker;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  System.SyncObjs,
  Winapi.ActiveX,
  FMXBridge.GIF.Types,
  FMXBridge.GIF.WIC,
  FMXBridge.GIF.Compositor;

type
  IGIFFrameQueue = interface
    ['{D7A48C79-124B-4D71-A5E5-8BC2471EF2C3}']
    procedure Cancel;
    function IsCancelled: Boolean;
    procedure SetLoop(AValue: Boolean);
    function GetLoop: Boolean;
    function Push(const APacket: TGIFFramePacket): Boolean;
    function TryPop(out APacket: TGIFFramePacket): Boolean;
  end;

  TGIFFrameQueue = class(TInterfacedObject, IGIFFrameQueue)
  private
    FQueue: TThreadedQueue<TGIFFramePacket>;
    FCancelled: Integer;
    FLoop: Integer;
  public
    constructor Create(AQueueDepth: Integer = 1);
    destructor Destroy; override;
    procedure Cancel;
    function IsCancelled: Boolean;
    procedure SetLoop(AValue: Boolean);
    function GetLoop: Boolean;
    function Push(const APacket: TGIFFramePacket): Boolean;
    function TryPop(out APacket: TGIFFramePacket): Boolean;
  end;

  TGIFDecodeThread = class(TThread)
  private
    FFileName: string;
    FGeneration: Cardinal;
    FStartFrame: Integer;
    FQueue: IGIFFrameQueue;
    procedure PushError(const AMessage: string);
  protected
    procedure Execute; override;
  public
    constructor Create(const AFileName: string; AGeneration: Cardinal;
      AStartFrame: Integer; const AQueue: IGIFFrameQueue);
  end;

implementation

const
  CQueuePushTimeout = 40;

constructor TGIFFrameQueue.Create(AQueueDepth: Integer);
begin
  inherited Create;

  if AQueueDepth < 1 then
    AQueueDepth := 1;

  FQueue := TThreadedQueue<TGIFFramePacket>.Create(
    AQueueDepth,
    CQueuePushTimeout,
    0
  );

  FCancelled := 0;
  FLoop := 1;
end;

destructor TGIFFrameQueue.Destroy;
begin
  FreeAndNil(FQueue);
  inherited;
end;

procedure TGIFFrameQueue.Cancel;
begin
  TInterlocked.Exchange(FCancelled, 1);
end;

function TGIFFrameQueue.IsCancelled: Boolean;
begin
  Result := TInterlocked.CompareExchange(FCancelled, 0, 0) <> 0;
end;

procedure TGIFFrameQueue.SetLoop(AValue: Boolean);
begin
  TInterlocked.Exchange(FLoop, Ord(AValue));
end;

function TGIFFrameQueue.GetLoop: Boolean;
begin
  Result := TInterlocked.CompareExchange(FLoop, 0, 0) <> 0;
end;

function TGIFFrameQueue.Push(const APacket: TGIFFramePacket): Boolean;
var
  WaitResult: TWaitResult;
begin
  Result := False;

  while not IsCancelled do
  begin
    WaitResult := FQueue.PushItem(APacket);

    if WaitResult = wrSignaled then
      Exit(True);

    if WaitResult <> wrTimeout then
      Exit(False);
  end;
end;

function TGIFFrameQueue.TryPop(out APacket: TGIFFramePacket): Boolean;
begin
  APacket := Default(TGIFFramePacket);
  Result := FQueue.PopItem(APacket) = wrSignaled;
end;

constructor TGIFDecodeThread.Create(const AFileName: string;
  AGeneration: Cardinal; AStartFrame: Integer;
  const AQueue: IGIFFrameQueue);
begin
  inherited Create(True);

  FreeOnTerminate := True;
  FFileName := AFileName;
  FGeneration := AGeneration;
  FStartFrame := Max(0, AStartFrame);
  FQueue := AQueue;

  Start;
end;

procedure TGIFDecodeThread.PushError(const AMessage: string);
var
  Packet: TGIFFramePacket;
begin
  if FQueue = nil then
    Exit;

  Packet := Default(TGIFFramePacket);
  Packet.Kind := gfpkError;
  Packet.Generation := FGeneration;
  Packet.ErrorMessage := AMessage;
  FQueue.Push(Packet);
end;

procedure TGIFDecodeThread.Execute;
var
  Decoder: TGIFWICDecoder;
  Compositor: TGIFCompositor;
  RawFrame: TGIFRawFrame;
  Packet: TGIFFramePacket;
  FrameIndex: Integer;
  FirstOutputFrame: Integer;
  CanvasWidth, CanvasHeight, FrameCount: Integer;
  ComInitialized: Boolean;
  HR: HRESULT;
  ContinueLoop: Boolean;
begin
  Decoder := nil;
  Compositor := nil;
  ComInitialized := False;

  try
    try
      HR := CoInitializeEx(nil, COINIT_MULTITHREADED);
      OleCheck(HR);
      ComInitialized := True;

      Decoder := TGIFWICDecoder.Create;
      Decoder.Open(FFileName);

      CanvasWidth := Decoder.CanvasWidth;
      CanvasHeight := Decoder.CanvasHeight;
      FrameCount := Decoder.FrameCount;

      if FStartFrame >= FrameCount then
        FStartFrame := FrameCount - 1;

      Compositor := TGIFCompositor.Create(
      CanvasWidth,
      CanvasHeight,
      Decoder.BackgroundColor,
      Decoder.BackgroundColorIndex,
      Decoder.HasGlobalPalette
    );

    repeat
        for FrameIndex := 0 to FrameCount - 1 do
        begin
          if Terminated or FQueue.IsCancelled then
            Exit;

          Decoder.DecodeFrame(FrameIndex, RawFrame);

          Packet := Default(TGIFFramePacket);
          Packet.Kind := gfpkFrame;
          Packet.Generation := FGeneration;
          Packet.FrameCount := FrameCount;
          Packet.CanvasWidth := CanvasWidth;
          Packet.CanvasHeight := CanvasHeight;

          Compositor.Compose(RawFrame, FrameIndex, Packet.Frame);

          if FrameIndex >= FirstOutputFrame then
            if not FQueue.Push(Packet) then
              Exit;

          RawFrame := Default(TGIFRawFrame);
          Packet := Default(TGIFFramePacket);
        end;

        ContinueLoop := FQueue.GetLoop;
        if ContinueLoop and not Terminated and not FQueue.IsCancelled then
          Compositor.Reset;
      until not ContinueLoop or Terminated or FQueue.IsCancelled;

      if not Terminated and not FQueue.IsCancelled then
      begin
        Packet := Default(TGIFFramePacket);
        Packet.Kind := gfpkCompleted;
        Packet.Generation := FGeneration;
        Packet.FrameCount := FrameCount;
        Packet.CanvasWidth := CanvasWidth;
        Packet.CanvasHeight := CanvasHeight;
        FQueue.Push(Packet);
      end;

    except
      on E: Exception do
        PushError(E.ClassName + ': ' + E.Message);
    end;
  finally
    // Release every WIC interface before leaving the COM apartment.
    Compositor.Free;
    Decoder.Free;

    if ComInitialized then
      CoUninitialize;
  end;
end;

end.
