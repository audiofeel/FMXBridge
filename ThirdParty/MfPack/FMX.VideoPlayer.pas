
unit FMX.VideoPlayer;

{$R-}{$Q-}

interface

uses
  System.SysUtils, System.Classes, System.SyncObjs,
  Winapi.Windows, Winapi.Messages, Winapi.D3D11,
  Winapi.MediaFoundationApi.MfApi,
  Winapi.MediaFoundationApi.MfObjects,
  Winapi.MediaFoundationApi.MfMediaEngine,
  FMX.Objects;

const
  D3D11_CREATE_DEVICE_VIDEO_SUPPORT = $00000800;

  WM_VIDEO_FRAME = WM_APP + 101;
  WM_VIDEO_STATE = WM_APP + 102;

type
  TVideoState = (vsIdle, vsLoading, vsReady, vsPlaying, vsPaused,
    vsEnded, vsError);
  TVideoStateEvent = procedure(Sender: TObject; AState: TVideoState) of object;

{ ID3D11Multithread (d3d11_4.h): IID и порядок методов сверены с документацией MS. }
  IVideoD3DMultithread = interface(IUnknown)
    ['{9B7E4E00-342C-4106-A19F-4F2704F689F0}']
    procedure Enter; stdcall;
    procedure Leave; stdcall;
    function SetMultithreadProtected(bMTProtect: BOOL): BOOL; stdcall;
    function GetMultithreadProtected: BOOL; stdcall;
  end;

  TVideoPlayer = class;

  TEngineNotify = class(TInterfacedObject, IMFMediaEngineNotify)
  private
    FLock: TCriticalSection;
    FOwner: TVideoPlayer;
  public
    constructor Create(AOwner: TVideoPlayer);
    destructor Destroy; override;

    procedure Detach;
    function EventNotify(event: DWORD; param1: DWORD_PTR; param2: DWORD)
      : HRESULT; stdcall;
  end;

  TFrameThread = class(TThread)
  private
    FOwner: TVideoPlayer;
    FWake: TEvent;
  protected
    procedure Execute; override;
  public
    constructor Create(AOwner: TVideoPlayer);
    destructor Destroy; override;
    procedure Kick;
  end;

  TVideoPlayer = class
  private
    FImage: TImage;
    FMsgWnd: HWND;
    FMFStarted: Boolean;
    FEngLock: TCriticalSection;
    // сериализует вызовы в Media Engine из UI и рабочего потока
    FFrameLock: TCriticalSection; // защищает FBack/FHasFrame
    FEngine: IMFMediaEngine;
    FNotify: TEngineNotify;
    FNotifyIntf: IMFMediaEngineNotify;
    FDevice: ID3D11Device;
    FCtx: ID3D11DeviceContext;
    FDxgiMgr: IMFDXGIDeviceManager;
    FResetToken: UINT;
    FTex, FStaging: ID3D11Texture2D;
    FTexW, FTexH: Integer;
    FThread: TFrameThread;
    FFront, FBack: TBytes;
    FBackW, FBackH: Integer;
    FHasFrame: Boolean;
    FPending, FForceGrab, FStateInt: Integer;
    FActiveUntil: Cardinal;
    FMaxW, FMaxH: Integer;
    FOnState: TVideoStateEvent;

    procedure WndProc(var Msg: TMessage);
    procedure CreateD3D;
    procedure CreateEngine;
    procedure EnsureTextures(W, H: Integer);
    function CalcOutputSize(out W, H: Integer): Boolean;
    function GrabFrame: Boolean;
    procedure PumpFrame;
    function WantFrames: Boolean;
    procedure PresentFrame;
    procedure EngineEvent(AEvent: DWORD);
    procedure SetState(AState: TVideoState);
    procedure Kick(AMs: Cardinal = 1500);
    procedure RequestFrame;
    function GetState: TVideoState;
    function GetVolume: Single;
    procedure SetVolume(const Value: Single);
    function GetPosition: Double;
    procedure SetPosition(const Value: Double);
    function GetDuration: Double;
    function GetLoop: Boolean;
    procedure SetLoop(const Value: Boolean);
  public
    constructor Create(AImage: TImage);
    destructor Destroy; override;

    procedure Open(const AFileName: string);
    procedure Play;
    procedure Pause;
    procedure Stop;
{ Макс. размер кадра, который читается с GPU. Видео крупнее масштабируется на GPU
  с сохранением пропорций. Ставь ~ размер контрола в пикселях: для 4K-видео в окне
  640x360 с CPU читается 640x360, а не 3840x2160. }
    procedure SetMaxOutput(W, H: Integer);
    property State: TVideoState read GetState;
    property Volume: Single read GetVolume write SetVolume; // 0..1
    property Position: Double read GetPosition write SetPosition; // секунды
    property Duration: Double read GetDuration; // секунды, 0 если неизвестно
    property Loop: Boolean read GetLoop write SetLoop;
    property OnStateChange: TVideoStateEvent read FOnState write FOnState;
  end;

implementation

uses
  System.Math, System.Win.ComObj, System.UITypes, System.Diagnostics,
  Winapi.ActiveX, Winapi.Dwmapi, Winapi.DXGIFormat, Winapi.D3DCommon,
  FMX.Types, FMX.Graphics;

function PathToFileUrl(const APath: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(APath) do
    case APath[I] of
      '\':
        Result := Result + '/';
      ' ':
        Result := Result + '%20';
      '%':
        Result := Result + '%25';
      '#':
        Result := Result + '%23';
      '?':
        Result := Result + '%3F';
    else
      Result := Result + APath[I];
    end;
  if Result.StartsWith('//') then
    Result := 'file:' + Result // UNC
  else
    Result := 'file:///' + Result;
end;

{ TEngineNotify }
constructor TEngineNotify.Create(AOwner: TVideoPlayer);
begin
  inherited Create;

  FLock := TCriticalSection.Create;
  FOwner := AOwner;
end;

destructor TEngineNotify.Destroy;
begin
  FLock.Free;

  inherited;
end;

procedure TEngineNotify.Detach;
begin
  FLock.Enter;
  try
    FOwner := nil;
  finally
    FLock.Leave;
  end;
end;

function TEngineNotify.EventNotify(event: DWORD; param1: DWORD_PTR;
  param2: DWORD): HRESULT;
begin
  { вызывается из рабочего потока Media Foundation: здесь только флаги и PostMessage }
  FLock.Enter;
  try
    if FOwner <> nil then
      FOwner.EngineEvent(event);
  finally
    FLock.Leave;
  end;
  Result := S_OK;
end;

{ TFrameThread }
constructor TFrameThread.Create(AOwner: TVideoPlayer);
begin
  FOwner := AOwner;
  FWake := TEvent.Create(nil, True, False, '');

  inherited Create(False);
end;

destructor TFrameThread.Destroy;
begin
  FWake.Free;

  inherited;
end;

procedure TFrameThread.Kick;
begin
  FWake.SetEvent;
end;

procedure TFrameThread.Execute;
var
  T0: Int64;
begin
  CoInitializeEx(nil, COINIT_MULTITHREADED);
  try
    while not Terminated do
    begin
      if not FOwner.WantFrames then
      begin
        FWake.WaitFor(250);
        FWake.ResetEvent;
        Continue;
      end;
      T0 := TStopwatch.GetTimeStamp;
      FOwner.PumpFrame;
      { аналог DisplayLink: ждём следующий проход DWM (vsync). Если DwmFlush вернулся
        мгновенно или с ошибкой - не крутим поток вхолостую }
      if Failed(DwmFlush) or
        ((TStopwatch.GetTimeStamp - T0) < TStopwatch.Frequency div 500) then
        Sleep(4);
    end;
  finally
    CoUninitialize;
  end;
end;

{ TVideoPlayer }
constructor TVideoPlayer.Create(AImage: TImage);
begin
  inherited Create;

  FImage := AImage;
  FMaxW := 1920;
  FMaxH := 1080;
  FEngLock := TCriticalSection.Create;
  FFrameLock := TCriticalSection.Create;
  FMsgWnd := AllocateHWnd(WndProc); // создаём в UI-потоке
  OleCheck(MFStartup(MF_VERSION, MFSTARTUP_FULL));
  FMFStarted := True;
  CreateD3D;
  CreateEngine;
  FThread := TFrameThread.Create(Self);
end;

destructor TVideoPlayer.Destroy;
begin
  { порядок важен: поток -> уведомления -> движок -> D3D -> окно -> MF.
    Живых потоков после Destroy быть не должно (иначе процесс может не завершиться) }
  if FThread <> nil then
  begin
    FThread.Terminate;
    FThread.Kick;
    FThread.WaitFor;
    FThread.Free;
    FThread := nil;
  end;
  if FNotify <> nil then
    FNotify.Detach;
  if FEngine <> nil then
  begin
    FEngLock.Enter;
    try
      FEngine.Shutdown;
      FEngine := nil;
    finally
      FEngLock.Leave;
    end;
  end;
  FNotify := nil;
  FNotifyIntf := nil;
  FStaging := nil;
  FTex := nil;
  FDxgiMgr := nil;
  FCtx := nil;
  FDevice := nil;
  if FMsgWnd <> 0 then
    DeallocateHWnd(FMsgWnd);
  if FMFStarted then
    MFShutdown;
  FEngLock.Free;
  FFrameLock.Free;

  inherited;
end;

procedure TVideoPlayer.CreateD3D;
var
  FL: D3D_FEATURE_LEVEL;
  MT: IVideoD3DMultithread;
  Flags: UINT;
  hr: HRESULT;
begin
  Flags := D3D11_CREATE_DEVICE_VIDEO_SUPPORT or
    D3D11_CREATE_DEVICE_BGRA_SUPPORT;
  hr := D3D11CreateDevice(nil, D3D_DRIVER_TYPE_HARDWARE, 0, Flags, nil, 0,
    D3D11_SDK_VERSION, FDevice, FL, FCtx);
  if Failed(hr) then // ВМ / нет GPU
    hr := D3D11CreateDevice(nil, D3D_DRIVER_TYPE_WARP, 0, Flags, nil, 0,
      D3D11_SDK_VERSION, FDevice, FL, FCtx);
  OleCheck(hr);

  { Media Foundation работает с устройством из своих потоков - защита обязательна }
  if not Supports(FCtx, IVideoD3DMultithread, MT) then
    raise Exception.Create('ID3D11Multithread is not available');
  MT.SetMultithreadProtected(True);

  OleCheck(MFCreateDXGIDeviceManager(FResetToken, FDxgiMgr));
  OleCheck(FDxgiMgr.ResetDevice(FDevice, FResetToken));
end;

procedure TVideoPlayer.CreateEngine;
var
  Attr: IMFAttributes;
  Factory: IMFMediaEngineClassFactory;
  EngineUnk: IUnknown;
begin
  FNotify := TEngineNotify.Create(Self);
  FNotifyIntf := FNotify;

  OleCheck(MFCreateAttributes(Attr, 3));
  OleCheck(Attr.SetUnknown(MF_MEDIA_ENGINE_DXGI_MANAGER, FDxgiMgr));
  OleCheck(Attr.SetUnknown(MF_MEDIA_ENGINE_CALLBACK, FNotifyIntf));
  OleCheck(Attr.SetUINT32(MF_MEDIA_ENGINE_VIDEO_OUTPUT_FORMAT,
    UINT32(DXGI_FORMAT_B8G8R8A8_UNORM)));

  { нет MF_MEDIA_ENGINE_PLAYBACK_HWND / _VISUAL => frame-server режим }
  OleCheck(CoCreateInstance(CLSID_MFMediaEngineClassFactory, nil,
    CLSCTX_INPROC_SERVER, IID_IMFMediaEngineClassFactory, Factory));
  OleCheck(Factory.CreateInstance(0, Attr, EngineUnk));
  FEngine := EngineUnk as IMFMediaEngine;
end;

procedure TVideoPlayer.EnsureTextures(W, H: Integer);
var
  Desc: D3D11_TEXTURE2D_DESC;
begin
  if (FTex <> nil) and (FStaging <> nil) and (W = FTexW) and (H = FTexH) then
    Exit;
  FTex := nil;
  FStaging := nil;

  FillChar(Desc, SizeOf(Desc), 0);
  Desc.Width := W;
  Desc.Height := H;
  Desc.MipLevels := 1;
  Desc.ArraySize := 1;
  Desc.Format := DXGI_FORMAT_B8G8R8A8_UNORM;
  Desc.SampleDesc.Count := 1;
  Desc.Usage := D3D11_USAGE_DEFAULT;
  Desc.BindFlags := Ord(D3D11_BIND_RENDER_TARGET) or
    Ord(D3D11_BIND_SHADER_RESOURCE);
  OleCheck(FDevice.CreateTexture2D(Desc, nil, FTex));

  Desc.Usage := D3D11_USAGE_STAGING;
  Desc.BindFlags := 0;
  Desc.CPUAccessFlags := Ord(D3D11_CPU_ACCESS_READ);
  OleCheck(FDevice.CreateTexture2D(Desc, nil, FStaging));

  FTexW := W;
  FTexH := H;
end;

function TVideoPlayer.CalcOutputSize(out W, H: Integer): Boolean;
var
  CX, CY: DWORD;
  Scale: Double;
begin
  W := 0;
  H := 0;
  CX := 0;
  CY := 0;
  Result := Succeeded(FEngine.GetNativeVideoSize(CX, CY)) and (CX > 0)
    and (CY > 0);
  if not Result then
    Exit;
  W := CX;
  H := CY;
  if (FMaxW > 0) and (FMaxH > 0) and ((W > FMaxW) or (H > FMaxH)) then
  begin
    Scale := Min(FMaxW / W, FMaxH / H);
    W := Max(2, Round(W * Scale));
    H := Max(2, Round(H * Scale));
  end;
end;

{ рабочий поток, под FEngLock }
function TVideoPlayer.GrabFrame: Boolean;
var
  W, H, Y: Integer;
  R: TRect;
  Mapped: D3D11_MAPPED_SUBRESOURCE;
  Src, Dst: PByte;
begin
  Result := False;
  if not CalcOutputSize(W, H) then
    Exit;
  EnsureTextures(W, H);

  R := Rect(0, 0, W, H);
  if FEngine.TransferVideoFrame(FTex, nil, @R, nil) <> S_OK then
    Exit;

  FCtx.CopyResource(FStaging, FTex);
  if Failed(FCtx.Map(FStaging, 0, D3D11_MAP_READ, 0, Mapped)) then
    Exit;
  try
    FFrameLock.Enter;
    try
      if Length(FBack) <> W * H * 4 then
        SetLength(FBack, W * H * 4);
      Src := Mapped.pData;
      Dst := @FBack[0];
      if Integer(Mapped.RowPitch) = W * 4 then
        Move(Src^, Dst^, W * H * 4)
      else
        for Y := 0 to H - 1 do
        begin
          Move(Src^, Dst^, W * 4);
          Inc(Src, Mapped.RowPitch);
          Inc(Dst, W * 4);
        end;
      FBackW := W;
      FBackH := H;
      FHasFrame := True;
    finally
      FFrameLock.Leave;
    end;
  finally
    FCtx.Unmap(FStaging, 0);
  end;
  Result := True;
end;

{ рабочий поток }
procedure TVideoPlayer.PumpFrame;
var
  Pts: Int64;
  Force: Boolean;
begin
  try
    FEngLock.Enter;
    try
      if FEngine = nil then
        Exit;
      Force := TInterlocked.Exchange(FForceGrab, 0) <> 0;
      Pts := 0;
      { S_OK = есть новый кадр; S_FALSE = нет (Succeeded тут не годится) }
      if (FEngine.OnVideoStreamTick(Pts) = S_OK) or Force then
        if GrabFrame then
          if TInterlocked.Exchange(FPending, 1) = 0 then
            PostMessage(FMsgWnd, WM_VIDEO_FRAME, 0, 0);
    finally
      FEngLock.Leave;
    end;
  except
    { исключения не должны убивать поток; следующий тик попробует снова }
  end;
end;

function TVideoPlayer.WantFrames: Boolean;
begin
  Result := (State = vsPlaying) or (FForceGrab <> 0) or
    (Integer(FActiveUntil - GetTickCount) > 0);
end;

{ UI-поток }
procedure TVideoPlayer.PresentFrame;
var
  W, H, X, Y: Integer;
  Tmp: TBytes;
  Bmp: TBitmap;
  Data: TBitmapData;
  Src: PByte;
begin
  FFrameLock.Enter;
  try
    if not FHasFrame then
      Exit;
    Tmp := FFront;
    FFront := FBack;
    FBack := Tmp;
    W := FBackW;
    H := FBackH;
    FHasFrame := False;
  finally
    FFrameLock.Leave;
  end;

  Bmp := FImage.Bitmap;
  if (Bmp.Width <> W) or (Bmp.Height <> H) then
    Bmp.SetSize(W, H);
  if not Bmp.Map(TMapAccess.Write, Data) then
    Exit;
  try
    Src := @FFront[0];
    if Data.PixelFormat = TPixelFormat.BGRA then
    begin
      if Data.Pitch = W * 4 then
        Move(Src^, Data.Data^, W * H * 4)
      else
        for Y := 0 to H - 1 do
          Move((Src + Y * W * 4)^, (PByte(Data.Data) + Y * Data.Pitch)^, W * 4);
    end
    else
      { на Windows не ожидается; медленный, но корректный путь }
      for Y := 0 to H - 1 do
        for X := 0 to W - 1 do
          Data.SetPixel(X, Y, PAlphaColor(Src + (Y * W + X) * 4)^);
  finally
    Bmp.Unmap(Data);
  end;
  FImage.Repaint;
end;

procedure TVideoPlayer.WndProc(var Msg: TMessage);
begin
  case Msg.Msg of
    WM_VIDEO_FRAME:
      begin
        TInterlocked.Exchange(FPending, 0);
        PresentFrame;
      end;
    WM_VIDEO_STATE:
      if Assigned(FOnState) then
        FOnState(Self, TVideoState(Msg.WParam));
  else
    Msg.Result := DefWindowProc(FMsgWnd, Msg.Msg, Msg.WParam, Msg.LParam);
  end;
end;

{ любой поток, включая поток Media Foundation }
procedure TVideoPlayer.EngineEvent(AEvent: DWORD);
var
  E: Integer;
begin
  E := Integer(AEvent);
  if E = Integer(MF_MEDIA_ENGINE_EVENT_LOADEDMETADATA) then
  begin
    if State = vsLoading then
      SetState(vsReady);
  end
  else if (E = Integer(MF_MEDIA_ENGINE_EVENT_LOADEDDATA)) or
    (E = Integer(MF_MEDIA_ENGINE_EVENT_SEEKED)) then
    RequestFrame
  else if E = Integer(MF_MEDIA_ENGINE_EVENT_PLAYING) then
    SetState(vsPlaying)
  else if E = Integer(MF_MEDIA_ENGINE_EVENT_PAUSE) then
  begin
    if State = vsPlaying then
      SetState(vsPaused);
  end
  else if E = Integer(MF_MEDIA_ENGINE_EVENT_ENDED) then
    SetState(vsEnded)
  else if E = Integer(MF_MEDIA_ENGINE_EVENT_ERROR) then
    SetState(vsError);
end;

procedure TVideoPlayer.SetState(AState: TVideoState);
begin
  if TVideoState(TInterlocked.Exchange(FStateInt, Ord(AState))) <> AState then
    PostMessage(FMsgWnd, WM_VIDEO_STATE, Ord(AState), 0);
  Kick;
end;

procedure TVideoPlayer.Kick(AMs: Cardinal);
begin
  FActiveUntil := GetTickCount + AMs;

  if FThread <> nil then
    FThread.Kick;
end;

procedure TVideoPlayer.RequestFrame;
begin
  TInterlocked.Exchange(FForceGrab, 1);
  Kick;
end;

function TVideoPlayer.GetState: TVideoState;
begin
  Result := TVideoState(FStateInt);
end;

procedure TVideoPlayer.Open(const AFileName: string);
var
  B: WideString;
  Url: PWideChar;
begin
  SetState(vsLoading);
  B := PathToFileUrl(AFileName);
  Url := SysAllocString(PWideChar(B));
  try
    FEngLock.Enter;
    try
      OleCheck(FEngine.SetSource(Url));
    finally
      FEngLock.Leave;
    end;
  finally
    SysFreeString(Url);
  end;
end;

procedure TVideoPlayer.Play;
begin
  FEngLock.Enter;
  try
    { после ENDED Play у Media Engine стартует с начала только после seek }
    if State = vsEnded then
      FEngine.SetCurrentTime(0);
    OleCheck(FEngine.Play);
  finally
    FEngLock.Leave;
  end;
  Kick;
end;

procedure TVideoPlayer.Pause;
begin
  FEngLock.Enter;
  try
    OleCheck(FEngine.Pause);
  finally
    FEngLock.Leave;
  end;
end;

procedure TVideoPlayer.Stop;
begin
  { у IMFMediaEngine нет Stop: пауза + перемотка в начало }
  FEngLock.Enter;
  try
    FEngine.Pause;
    FEngine.SetCurrentTime(0);
  finally
    FEngLock.Leave;
  end;
  SetState(vsPaused);
  RequestFrame;
end;

procedure TVideoPlayer.SetMaxOutput(W, H: Integer);
begin
  FMaxW := W;
  FMaxH := H;
  RequestFrame;
end;

function TVideoPlayer.GetVolume: Single;
begin
  FEngLock.Enter;
  try
    Result := FEngine.GetVolume;
  finally
    FEngLock.Leave;
  end;
end;

procedure TVideoPlayer.SetVolume(const Value: Single);
begin
  FEngLock.Enter;
  try
    FEngine.SetVolume(EnsureRange(Value, 0.0, 1.0));
  finally
    FEngLock.Leave;
  end;
end;

function TVideoPlayer.GetPosition: Double;
begin
  FEngLock.Enter;
  try
    Result := FEngine.GetCurrentTime;
  finally
    FEngLock.Leave;
  end;
end;

procedure TVideoPlayer.SetPosition(const Value: Double);
begin
  FEngLock.Enter;
  try
    FEngine.SetCurrentTime(Value);
  finally
    FEngLock.Leave;
  end;
  RequestFrame;
end;

function TVideoPlayer.GetDuration: Double;
begin
  FEngLock.Enter;
  try
    Result := FEngine.GetDuration;
  finally
    FEngLock.Leave;
  end;
  if IsNan(Result) or IsInfinite(Result) then
    Result := 0;
end;

function TVideoPlayer.GetLoop: Boolean;
begin
  FEngLock.Enter;
  try
    Result := FEngine.GetLoop;
  finally
    FEngLock.Leave;
  end;
end;

procedure TVideoPlayer.SetLoop(const Value: Boolean);
begin
  FEngLock.Enter;
  try
    FEngine.SetLoop(Value);
  finally
    FEngLock.Leave;
  end;
end;

end.
