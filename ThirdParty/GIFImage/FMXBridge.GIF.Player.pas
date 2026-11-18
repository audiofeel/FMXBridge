unit FMXBridge.GIF.Player;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  System.SysUtils,
  System.Types,
uses System.Messaging  System.SyncObjs,
  System.UITypes,
  FMX.Types,
  FMX.Controls,
  FMX.Objects,
  FMX.Graphics,
  FMX.Platform,
  FMX.DisplayLink,
  FMXBridge.GIF.Decoder;

const
  WM_GIF_RESULT = WM_APP + 103;

type
  TFMXBridgeGIFImage = class;
  TGIFWorkerResultKind = (gwrkLoaded, gwrkFrame);

  TGIFLoadThread = class(TThread)
  private
    FOwner: TFMXBridgeGIFImage;
    FFileName: string;
    FGeneration: Int64;
    FRequestEvent: TEvent;
    FRequestLock: TCriticalSection;
    FHasRequest: Boolean;
    FRequestedFrame: Integer;
    FRequestId: Int64;
    FDecoder: TGIFDecoder;
    FCompositor: TGIFCompositor;
    procedure PostLoaded(const AWidth, AHeight, AFrameCount: Integer;
      const APixels: TArray<TAlphaColor>);
    procedure PostFrame(const AFrameIndex: Integer; const ARequestId: Int64;
      const APixels: TArray<TAlphaColor>);
  protected
    procedure Execute; override;
  public
    constructor Create(AOwner: TFMXBridgeGIFImage; const AFileName: string;
      const AGeneration: Int64);
    destructor Destroy; override;
    procedure RequestFrame(const AFrameIndex: Integer; const ARequestId: Int64);
    function FrameDelay(const AFrameIndex: Integer): Cardinal;
    procedure Wake;
  end;

  TFMXBridgeGIFImage = class(TImage)
  private
    FAutoPlay: Boolean;
    FLoop: Boolean;
    FSpeed: Single;
    FActiveFrame: Integer;
    FFrameCount: Integer;
    FImageWidth: Integer;
    FImageHeight: Integer;
    FLoaded: Boolean;
    FPlaying: Boolean;
    FStartRequested: Boolean;
    FTargetFrame: Integer;
    FNextFrameTime: Double;
    FRequestId: Int64;
    FLatestRequestId: Int64;
    FWorker: TGIFLoadThread;
    FMsgWnd: HWND;
    FResultLock: TCriticalSection;
    FGeneration: Int64;
    FHasPendingResult: Boolean;
    FResultMessagePosted: Boolean;
    FPendingGeneration: Int64;
    FPendingKind: TGIFWorkerResultKind;
    FPendingWidth: Integer;
    FPendingHeight: Integer;
    FPendingFrameCount: Integer;
    FPendingFrameIndex: Integer;
    FPendingRequestId: Int64;
    FPendingPixels: TArray<TAlphaColor>;
    FDisplayLinkService: IFMXDisplayLinkService;
    FDisplayLinkSubscribed: Boolean;
    FFill: TBrush;
    FScreenScale: Single;
    FOnChange: TNotifyEvent;
    FOnPlay: TNotifyEvent;
    FOnStop: TNotifyEvent;
    procedure SetActiveFrame(const AValue: Integer);
    procedure SetIsPlaying(const AValue: Boolean);
    procedure SetSpeed(const AValue: Single);
    procedure SetFill(const AValue: TBrush);
    procedure SetDisplayLinkSubscribed(const AValue: Boolean);
    procedure DisplayLinkUpdated(const ATime, ADeltaTime: Double);
    procedure WndProc(var Msg: Winapi.Messages.TMessage);
    procedure DrawBitmap(const ARect: TRectF; const ABitmap: TBitmap;
      const AOpacity: Single = 1.0);
    procedure PostWorkerLoaded(const AGeneration: Int64;
      const AWidth, AHeight, AFrameCount: Integer;
      const APixels: TArray<TAlphaColor>);
    procedure PostWorkerFrame(const AGeneration: Int64; const AFrameIndex: Integer;
      const ARequestId: Int64; const APixels: TArray<TAlphaColor>);
    procedure ClearPendingResultMessages;
    procedure WorkerLoaded(const AGeneration: Int64;
      const AWidth, AHeight, AFrameCount: Integer;
      const APixels: TArray<TAlphaColor>);
    procedure WorkerFrameReady(const AGeneration: Int64;
      const AFrameIndex: Integer; const ARequestId: Int64;
      const APixels: TArray<TAlphaColor>);
    procedure StopWorker;
    procedure UpdateBitmap(const APixels: TArray<TAlphaColor>);
    procedure DoPlay;
    procedure DoStop;
    procedure DoChange;
    function GetIsEmpty: Boolean;
    function GetIsPlaying: Boolean;
    function GetFrameCount: Integer;
    function IsSpeedStored: Boolean;
    procedure DoFillChanged(Sender: TObject);
  protected
    procedure Paint; override;
    procedure VisibleChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadFromFile(const AFileName: string);
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure SetActiveFrameIndex(const AIndex: Integer);
    property IsEmpty: Boolean read GetIsEmpty;
    property FrameCount: Integer read GetFrameCount;
  published
    property AutoPlay: Boolean read FAutoPlay write FAutoPlay default True;
    property ClipChildren default False;
    property ClipParent default False;
    property ActiveFrame: Integer read FActiveFrame write SetActiveFrame default 0;
    property IsPlaying: Boolean read GetIsPlaying write SetIsPlaying stored False;
    property Loop: Boolean read FLoop write FLoop default True;
    property Speed: Single read FSpeed write SetSpeed stored IsSpeedStored;
    property Fill: TBrush read FFill write SetFill;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnPlay: TNotifyEvent read FOnPlay write FOnPlay;
    property OnStop: TNotifyEvent read FOnStop write FOnStop;
  end;

implementation

uses
  System.Math;

{ TGIFLoadThread }

constructor TGIFLoadThread.Create(AOwner: TFMXBridgeGIFImage;
  const AFileName: string; const AGeneration: Int64);
begin
  inherited Create(True);
  FreeOnTerminate := False;
  FOwner := AOwner;
  FFileName := AFileName;
  FGeneration := AGeneration;
  FRequestEvent := TEvent.Create(nil, False, False, '');
  FRequestLock := TCriticalSection.Create;
  FRequestedFrame := -1;
end;

destructor TGIFLoadThread.Destroy;
begin
  Terminate;
  Wake;
  if Suspended then
    Start;
  WaitFor;
  FreeAndNil(FCompositor);
  FreeAndNil(FDecoder);
  FreeAndNil(FRequestLock);
  FreeAndNil(FRequestEvent);
  inherited;
end;

procedure TGIFLoadThread.Wake;
begin
  if FRequestEvent <> nil then
    FRequestEvent.SetEvent;
end;

function TGIFLoadThread.FrameDelay(const AFrameIndex: Integer): Cardinal;
begin
  if FDecoder = nil then
    Exit(65);
  Result := FDecoder.FrameDelay[AFrameIndex];
end;

procedure TGIFLoadThread.RequestFrame(const AFrameIndex: Integer;
  const ARequestId: Int64);
begin
  if Terminated then
    Exit;

  FRequestLock.Acquire;
  try
    FRequestedFrame := AFrameIndex;
    FRequestId := ARequestId;
    FHasRequest := True;
  finally
    FRequestLock.Release;
  end;

  FRequestEvent.SetEvent;
end;

procedure TGIFLoadThread.PostLoaded(const AWidth, AHeight, AFrameCount: Integer;
  const APixels: TArray<TAlphaColor>);
begin
  if FOwner <> nil then
    FOwner.PostWorkerLoaded(FGeneration, AWidth, AHeight,
      AFrameCount, APixels);
end;

procedure TGIFLoadThread.PostFrame(const AFrameIndex: Integer;
  const ARequestId: Int64; const APixels: TArray<TAlphaColor>);
begin
  if FOwner <> nil then
    FOwner.PostWorkerFrame(FGeneration, AFrameIndex, ARequestId, APixels);
end;

procedure TGIFLoadThread.Execute;
var
  LWidth, LHeight, LFrameCount: Integer;
  LFirstFrame: TArray<TAlphaColor>;
  LTargetFrame: Integer;
  LRequestId: Int64;
  LHasRequest: Boolean;
  LFramePixels: TArray<TAlphaColor>;
begin
  try
    FDecoder := TGIFDecoder.Create;
    FDecoder.LoadFromFile(FFileName);

    FCompositor := TGIFCompositor.Create(FDecoder);
    LFirstFrame := FCompositor.RenderFrame(0);

    LWidth := FDecoder.Width;
    LHeight := FDecoder.Height;
    LFrameCount := FDecoder.FrameCount;

    if Terminated then
      Exit;

    PostLoaded(LWidth, LHeight, LFrameCount, LFirstFrame);
    LFirstFrame := nil;
  except
    Exit;
  end;

  while not Terminated do
  begin
    FRequestEvent.WaitFor(INFINITE);

    if Terminated then
      Break;

    FRequestLock.Acquire;
    try
      LHasRequest := FHasRequest;
      LTargetFrame := FRequestedFrame;
      LRequestId := FRequestId;
      FHasRequest := False;
    finally
      FRequestLock.Release;
    end;

    if not LHasRequest then
      Continue;

    try
      LFramePixels := FCompositor.RenderFrame(LTargetFrame);
      if not Terminated then
      begin
        PostFrame(LTargetFrame, LRequestId, LFramePixels);
        LFramePixels := nil;
      end;
    except
      Break;
    end;
  end;
end;

{ TFMXBridgeGIFImage }

constructor TFMXBridgeGIFImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FResultLock := TCriticalSection.Create;
  try
    FMsgWnd := AllocateHWnd(WndProc);
  except
    FreeAndNil(FResultLock);
    raise;
  end;

  FAutoPlay := True;
  FLoop := True;
  FSpeed := 1.0;
  FActiveFrame := 0;
  FTargetFrame := 0;
  WrapMode := TImageWrapMode.Fit;

  FFill := TBrush.Create(TBrushKind.None, TAlphaColors.White);
  FFill.OnChanged := DoFillChanged;

  FScreenScale := 1.0;
  if Scene <> nil then
    FScreenScale := Scene.GetSceneScale;

  ClipChildren := False;
  ClipParent := False;
  SetAcceptsControls(False);
end;

destructor TFMXBridgeGIFImage.Destroy;
begin
  Stop;
  SetDisplayLinkSubscribed(False);
  FDisplayLinkService := nil;
  StopWorker;

  if FMsgWnd <> 0 then
  begin
    DeallocateHWnd(FMsgWnd);
    FMsgWnd := 0;
  end;
  FreeAndNil(FResultLock);

  if FFill <> nil then
  begin
    FFill.OnChanged := nil;
    FreeAndNil(FFill);
  end;

  inherited;
end;

procedure TFMXBridgeGIFImage.LoadFromFile(const AFileName: string);
var
  LGeneration: Int64;
  LWorker: TGIFLoadThread;
begin
  Stop;
  StopWorker;

  FLoaded := False;
  FFrameCount := 0;
  FImageWidth := 0;
  FImageHeight := 0;
  FActiveFrame := 0;
  FTargetFrame := 0;
  FNextFrameTime := 0;
  Inc(FRequestId);
  FLatestRequestId := FRequestId;
  Bitmap.SetSize(0, 0);
  if Scene <> nil then
    FScreenScale := Scene.GetSceneScale;
  Repaint;
  FStartRequested := False;

  FResultLock.Acquire;
  try
    Inc(FGeneration);
    LGeneration := FGeneration;
    LWorker := TGIFLoadThread.Create(Self, AFileName, LGeneration);
    FWorker := LWorker;
  finally
    FResultLock.Release;
  end;

  LWorker.Start;
end;

procedure TFMXBridgeGIFImage.ClearPendingResultMessages;
var
  LMessage: TMsg;
begin
  FResultLock.Acquire;
  try
    FHasPendingResult := False;
    FResultMessagePosted := False;
    FPendingPixels := nil;
  finally
    FResultLock.Release;
  end;

  if FMsgWnd <> 0 then
    while PeekMessage(LMessage, FMsgWnd, WM_GIF_RESULT, WM_GIF_RESULT,
      PM_REMOVE) do
      ;
end;

procedure TFMXBridgeGIFImage.StopWorker;
var
  LWorker: TGIFLoadThread;
begin
  FResultLock.Acquire;
  try
    LWorker := FWorker;
    FWorker := nil;
  finally
    FResultLock.Release;
  end;

  if LWorker <> nil then
  begin
    LWorker.Terminate;
    LWorker.Wake;
    if LWorker.Suspended then
      LWorker.Start;
    LWorker.WaitFor;
    LWorker.Free;
  end;

  // No worker can post another result after WaitFor.
  ClearPendingResultMessages;
end;

procedure TFMXBridgeGIFImage.PostWorkerLoaded(
  const AGeneration: Int64; const AWidth, AHeight, AFrameCount: Integer;
  const APixels: TArray<TAlphaColor>);
begin
  FResultLock.Acquire;
  try
    if (AGeneration <> FGeneration) or (FWorker = nil) then
      Exit;

    FPendingGeneration := AGeneration;
    FPendingKind := gwrkLoaded;
    FPendingWidth := AWidth;
    FPendingHeight := AHeight;
    FPendingFrameCount := AFrameCount;
    FPendingFrameIndex := -1;
    FPendingRequestId := 0;
    FPendingPixels := APixels;
    FHasPendingResult := True;

    if not FResultMessagePosted then
    begin
      FResultMessagePosted := True;
      if not PostMessage(FMsgWnd, WM_GIF_RESULT, 0, 0) then
      begin
        FResultMessagePosted := False;
        FHasPendingResult := False;
        FPendingPixels := nil;
      end;
    end;
  finally
    FResultLock.Release;
  end;
end;

procedure TFMXBridgeGIFImage.PostWorkerFrame(const AGeneration: Int64;
  const AFrameIndex: Integer; const ARequestId: Int64;
  const APixels: TArray<TAlphaColor>);
begin
  FResultLock.Acquire;
  try
    if (AGeneration <> FGeneration) or (FWorker = nil) then
      Exit;

    FPendingGeneration := AGeneration;
    FPendingKind := gwrkFrame;
    FPendingWidth := 0;
    FPendingHeight := 0;
    FPendingFrameCount := 0;
    FPendingFrameIndex := AFrameIndex;
    FPendingRequestId := ARequestId;
    FPendingPixels := APixels;
    FHasPendingResult := True;

    if not FResultMessagePosted then
    begin
      FResultMessagePosted := True;
      if not PostMessage(FMsgWnd, WM_GIF_RESULT, 0, 0) then
      begin
        FResultMessagePosted := False;
        FHasPendingResult := False;
        FPendingPixels := nil;
      end;
    end;
  finally
    FResultLock.Release;
  end;
end;

procedure TFMXBridgeGIFImage.WndProc(var Msg: Winapi.Messages.TMessage);
var
  LHasResult: Boolean;
  LGeneration: Int64;
  LKind: TGIFWorkerResultKind;
  LWidth, LHeight, LFrameCount, LFrameIndex: Integer;
  LRequestId: Int64;
  LPixels: TArray<TAlphaColor>;
begin
  if Msg.Msg = WM_GIF_RESULT then
  begin
    Msg.Result := 0;

    FResultLock.Acquire;
    try
      LHasResult := FHasPendingResult;
      if LHasResult then
      begin
        LGeneration := FPendingGeneration;
        LKind := FPendingKind;
        LWidth := FPendingWidth;
        LHeight := FPendingHeight;
        LFrameCount := FPendingFrameCount;
        LFrameIndex := FPendingFrameIndex;
        LRequestId := FPendingRequestId;
        LPixels := FPendingPixels;

        FHasPendingResult := False;
        FResultMessagePosted := False;
        FPendingPixels := nil;
      end
      else
        FResultMessagePosted := False;
    finally
      FResultLock.Release;
    end;

    if not LHasResult then
      Exit;

    if LGeneration <> FGeneration then
      Exit;

    case LKind of
      gwrkLoaded:
        WorkerLoaded(LGeneration, LWidth, LHeight, LFrameCount, LPixels);
      gwrkFrame:
        WorkerFrameReady(LGeneration, LFrameIndex, LRequestId, LPixels);
    end;
    Exit;
  end;

  Msg.Result := DefWindowProc(FMsgWnd, Msg.Msg, Msg.WParam, Msg.LParam);
end;

procedure TFMXBridgeGIFImage.WorkerLoaded(const AGeneration: Int64;
  const AWidth, AHeight, AFrameCount: Integer;
  const APixels: TArray<TAlphaColor>);
var
  LInitialFrame: Integer;
begin
  if (AGeneration <> FGeneration) or (FWorker = nil) then
    Exit;

  LInitialFrame := FActiveFrame;
  FImageWidth := AWidth;
  FImageHeight := AHeight;
  FFrameCount := AFrameCount;
  FLoaded := True;
  FActiveFrame := 0;
  FTargetFrame := 0;

  try
    UpdateBitmap(APixels);
  except
    FLoaded := False;
    FStartRequested := False;
    StopWorker;
    Exit;
  end;

  // A static one-frame GIF needs no worker after its bitmap is presented.
  if FFrameCount <= 1 then
    StopWorker;

  if LInitialFrame > 0 then
    SetActiveFrame(LInitialFrame);

  if FStartRequested then
    Play;

  DoChange;

end;

procedure TFMXBridgeGIFImage.WorkerFrameReady(const AGeneration: Int64;
  const AFrameIndex: Integer; const ARequestId: Int64;
  const APixels: TArray<TAlphaColor>);
begin
  if (AGeneration <> FGeneration) or (FWorker = nil) or
    (ARequestId <> FLatestRequestId) then
    Exit;

  try
    UpdateBitmap(APixels);
  except
    Stop;
    StopWorker;
    Exit;
  end;

  FActiveFrame := AFrameIndex;
end;

procedure TFMXBridgeGIFImage.UpdateBitmap(
  const APixels: TArray<TAlphaColor>);
var
  LBitmapData: TBitmapData;
  LScanLine: PAlphaColor;
  X, Y: Integer;
  LIndex: Integer;
begin
  if (FImageWidth <= 0) or (FImageHeight <= 0) or
    (Length(APixels) <> FImageWidth * FImageHeight) then
    Exit;

  if (Bitmap.Width <> FImageWidth) or (Bitmap.Height <> FImageHeight) then
    Bitmap.SetSize(FImageWidth, FImageHeight);

  if not Bitmap.Map(TMapAccess.Write, LBitmapData) then
    Exit;

  try
    LIndex := 0;
    for Y := 0 to FImageHeight - 1 do
    begin
      LScanLine := PAlphaColor(LBitmapData.GetScanLine(Y));
      for X := 0 to FImageWidth - 1 do
      begin
        AlphaColorToPixel(APixels[LIndex], LScanLine, Bitmap.PixelFormat);
        Inc(LScanLine);
        Inc(LIndex);
      end;
    end;
  finally
    Bitmap.Unmap(LBitmapData);
  end;

  Repaint;
end;

procedure TFMXBridgeGIFImage.Play;
begin
  FStartRequested := True;

  if not FLoaded or (FFrameCount <= 1) or
    (csDesigning in ComponentState) then
    Exit;

  if FPlaying then
    Exit;

  try
    SetDisplayLinkSubscribed(True);
  except
    FStartRequested := False;
    Exit;
  end;

  FNextFrameTime := 0;
  FTargetFrame := FActiveFrame;
  FPlaying := True;
  DoPlay;
end;

procedure TFMXBridgeGIFImage.Pause;
begin
  if FPlaying then
    Stop;
end;

procedure TFMXBridgeGIFImage.Stop;
begin
  FStartRequested := False;
  FPlaying := False;
  FNextFrameTime := 0;
  Inc(FRequestId);
  FLatestRequestId := FRequestId;
  SetDisplayLinkSubscribed(False);
  DoStop;
end;

procedure TFMXBridgeGIFImage.SetActiveFrameIndex(const AIndex: Integer);
begin
  SetActiveFrame(AIndex);
end;

procedure TFMXBridgeGIFImage.SetActiveFrame(const AValue: Integer);
var
  LIndex: Integer;
begin
  if not FLoaded then
  begin
    FActiveFrame := Max(0, AValue);
    FTargetFrame := FActiveFrame;
    Exit;
  end;

  LIndex := EnsureRange(AValue, 0, FFrameCount - 1);
  FActiveFrame := LIndex;
  FTargetFrame := LIndex;
  FNextFrameTime := 0;

  Inc(FRequestId);
  FLatestRequestId := FRequestId;
  if FWorker <> nil then
    FWorker.RequestFrame(LIndex, FRequestId);
end;

procedure TFMXBridgeGIFImage.SetIsPlaying(const AValue: Boolean);
begin
  if AValue <> FPlaying then
  begin
    if AValue then
      Play
    else
      Stop;
  end;
end;

procedure TFMXBridgeGIFImage.SetSpeed(const AValue: Single);
begin
  FSpeed := Max(AValue, 0.1);
  FNextFrameTime := 0;
end;

procedure TFMXBridgeGIFImage.SetFill(const AValue: TBrush);
begin
  FFill.Assign(AValue);
end;

procedure TFMXBridgeGIFImage.DoFillChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TFMXBridgeGIFImage.SetDisplayLinkSubscribed(const AValue: Boolean);
begin
  if FDisplayLinkSubscribed = AValue then
    Exit;

  if AValue then
  begin
    if FDisplayLinkService = nil then
    begin
      if not TPlatformServices.Current.SupportsPlatformService(
        IFMXDisplayLinkService, FDisplayLinkService) then
        raise EFMXBridgeGIFError.Create(
          'FMX Display Link Service is not available');
    end;

    FDisplayLinkService.Subscribe(DisplayLinkUpdated);
    FDisplayLinkSubscribed := True;
  end
  else
  begin
    if FDisplayLinkService <> nil then
      FDisplayLinkService.Unsubscribe(DisplayLinkUpdated);
    FDisplayLinkSubscribed := False;
  end;
end;

procedure TFMXBridgeGIFImage.DisplayLinkUpdated(const ATime,
  ADeltaTime: Double);
var
  LNextFrame: Integer;
  LDelay: Double;
begin
  if not FPlaying or not FLoaded or (FFrameCount <= 1) then
    Exit;

  if FNextFrameTime = 0 then
  begin
    if FWorker <> nil then
      LDelay := FWorker.FrameDelay(FTargetFrame) / 1000.0
    else
      LDelay := 0.065;
    if LDelay <= 0 then
      LDelay := 0.065;
    FNextFrameTime := ATime + LDelay / FSpeed;
    Exit;
  end;

  if ATime < FNextFrameTime then
    Exit;

  repeat
    if FTargetFrame >= FFrameCount - 1 then
    begin
      if not FLoop then
      begin
        Stop;
        Exit;
      end;
      LNextFrame := 0;
    end
    else
      LNextFrame := FTargetFrame + 1;

    FTargetFrame := LNextFrame;
    if FWorker <> nil then
      LDelay := FWorker.FrameDelay(FTargetFrame) / 1000.0
    else
      LDelay := 0.065;
    if LDelay <= 0 then
      LDelay := 0.065;
    FNextFrameTime := FNextFrameTime + (LDelay / FSpeed);

    // In non-looping mode the last frame must be submitted at least once,
    // even when this display-link callback arrives late.
    if not FLoop and (FTargetFrame = FFrameCount - 1) then
      Break;
  until ATime < FNextFrameTime;

  Inc(FRequestId);
  FLatestRequestId := FRequestId;
  if FWorker <> nil then
    FWorker.RequestFrame(FTargetFrame, FRequestId);
end;

procedure TFMXBridgeGIFImage.VisibleChanged;
begin
  inherited;

  if not Visible then
  begin
    if FPlaying then
      Stop;
  end
  else if FLoaded and FAutoPlay then
    Play;
end;

procedure TFMXBridgeGIFImage.DrawBitmap(const ARect: TRectF;
  const ABitmap: TBitmap; const AOpacity: Single);
var
  LR, R, IntersectionRect: TRectF;
  I, J: Integer;
begin
  if (ABitmap = nil) or (ABitmap.Width <= 0) or (ABitmap.Height <= 0) then
    Exit;

  if Scene <> nil then
    FScreenScale := Scene.GetSceneScale;

  LR := TRectF.Create(ARect.Left * FScreenScale,
    ARect.Top * FScreenScale, ARect.Right * FScreenScale,
    ARect.Bottom * FScreenScale);

  case WrapMode of
    TImageWrapMode.Original:
      begin
        R := TRectF.Create(ARect.Left, ARect.Top,
          ARect.Left + ABitmap.Width, ARect.Top + ABitmap.Height);
        IntersectRect(IntersectionRect, LR, R);
        if (IntersectionRect.Width <= 0) or (IntersectionRect.Height <= 0) then
          Exit;
        Canvas.DrawBitmap(ABitmap,
          TRectF.Create(0, 0, IntersectionRect.Width, IntersectionRect.Height),
          TRectF.Create(R.Left, R.Top,
            R.Left + IntersectionRect.Width / FScreenScale,
            R.Top + IntersectionRect.Height / FScreenScale),
          AOpacity, DisableInterpolation);
      end;

    TImageWrapMode.Fit:
      begin
        R := TRectF.Create(0, 0,
          ABitmap.Width / ABitmap.BitmapScale,
          ABitmap.Height / ABitmap.BitmapScale);
        R := R.FitInto(ARect).SnapToPixel(Canvas.Scale, False);
        Canvas.DrawBitmap(ABitmap,
          TRectF.Create(0, 0, ABitmap.Width, ABitmap.Height),
          R, AOpacity, DisableInterpolation);
      end;

    TImageWrapMode.Stretch:
      Canvas.DrawBitmap(ABitmap,
        TRectF.Create(0, 0, ABitmap.Width, ABitmap.Height),
        ARect, AOpacity, DisableInterpolation);

    TImageWrapMode.Tile:
      begin
        for I := 0 to Trunc(LR.Width / ABitmap.Width) + 1 do
          for J := 0 to Trunc(LR.Height / ABitmap.Height) + 1 do
          begin
            R := TRectF.Create(0, 0, ABitmap.Width, ABitmap.Height);
            OffsetRect(R, I * ABitmap.Width, J * ABitmap.Height);
            IntersectRect(IntersectionRect, LR, R);
            if (IntersectionRect.Width <= 0) or (IntersectionRect.Height <= 0) then
              Continue;
            Canvas.DrawBitmap(ABitmap,
              TRectF.Create(0, 0, IntersectionRect.Width,
                IntersectionRect.Height),
              TRectF.Create(R.Left / FScreenScale, R.Top / FScreenScale,
                (R.Left + IntersectionRect.Width) / FScreenScale,
                (R.Top + IntersectionRect.Height) / FScreenScale),
              AOpacity, True);
          end;
      end;

    TImageWrapMode.Center:
      begin
        R := TRectF.Create(0, 0,
          ABitmap.Width / ABitmap.BitmapScale,
          ABitmap.Height / ABitmap.BitmapScale);
        R := R.CenterAt(ARect).SnapToPixel(Canvas.Scale, False);
        Canvas.DrawBitmap(ABitmap,
          TRectF.Create(0, 0, ABitmap.Width, ABitmap.Height),
          R, AOpacity, DisableInterpolation);
      end;

    TImageWrapMode.Place:
      begin
        R := TRectF.Create(0, 0,
          ABitmap.Width / ABitmap.BitmapScale,
          ABitmap.Height / ABitmap.BitmapScale);
        R := R.PlaceInto(ARect).SnapToPixel(Canvas.Scale, False);
        Canvas.DrawBitmap(ABitmap,
          TRectF.Create(0, 0, ABitmap.Width, ABitmap.Height),
          R, AOpacity, DisableInterpolation);
      end;
  end;
end;

procedure TFMXBridgeGIFImage.Paint;
var
  LRect: TRectF;
begin
  LRect := LocalRect;

  if FFill.Kind <> TBrushKind.None then
    Canvas.FillRect(LRect, 0, 0, [], AbsoluteOpacity, FFill);

  DrawBitmap(LRect, Bitmap, AbsoluteOpacity);
end;

procedure TFMXBridgeGIFImage.DoPlay;
begin
  if Assigned(FOnPlay) then
    FOnPlay(Self);
end;

procedure TFMXBridgeGIFImage.DoStop;
begin
  if Assigned(FOnStop) then
    FOnStop(Self);
end;

procedure TFMXBridgeGIFImage.DoChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

function TFMXBridgeGIFImage.GetIsEmpty: Boolean;
begin
  Result := not FLoaded or (FFrameCount = 0);
end;

function TFMXBridgeGIFImage.GetIsPlaying: Boolean;
begin
  Result := FPlaying;
end;

function TFMXBridgeGIFImage.GetFrameCount: Integer;
begin
  Result := FFrameCount;
end;

function TFMXBridgeGIFImage.IsSpeedStored: Boolean;
begin
  Result := FSpeed <> 1.0;
end;

end.
