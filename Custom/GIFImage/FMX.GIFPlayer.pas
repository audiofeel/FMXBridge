
unit FMX.GIFPlayer;

interface

uses
  System.Classes, System.SysUtils,
  FMX.Types, FMX.Objects,
  FMX.GIFDecoder;

type
  TGIFImage = class(TImage)
  private
    FDecoder: TGIFDecoder;
    FCompositor: TGIFCompositor;
    FTimer: TTimer;
    FLoop: Boolean;
    FSpeed: Single;
    FActiveFrame: Integer;
    FPlaying: Boolean;
    procedure SetActiveFrame(const AValue: Integer);
    procedure SetSpeed(const AValue: Single);
    procedure SetActiveFrameInternal(const AValue: Integer;
      const AUpdateTimer: Boolean);
    procedure TimerTimer(Sender: TObject);
    procedure UpdateTimerInterval(const AElapsedMilliseconds: Int64 = 0);
    function GetFrameCount: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadFromFile(const AFileName: string);
    procedure Play;
    procedure Pause;
    procedure Stop;

    property FrameCount: Integer read GetFrameCount;
    property IsPlaying: Boolean read FPlaying;
  published
    property ClipChildren default False;
    property ClipParent default False;
    property ActiveFrame: Integer read FActiveFrame write SetActiveFrame
      default 0;
    property Loop: Boolean read FLoop write FLoop default True;
    property Speed: Single read FSpeed write SetSpeed;
  end;

implementation

uses
  System.Diagnostics, System.Types;

constructor TGIFImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FLoop := True;
  FSpeed := 1.0;
  FActiveFrame := 0;

  WrapMode := TImageWrapMode.Fit;
  ClipChildren := False;
  ClipParent := False;

  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.OnTimer := TimerTimer;
end;

destructor TGIFImage.Destroy;
begin
  FTimer.Enabled := False;
  FTimer.OnTimer := nil;
  FreeAndNil(FTimer);

  FreeAndNil(FCompositor);
  FreeAndNil(FDecoder);

  inherited Destroy;
end;

procedure TGIFImage.LoadFromFile(const AFileName: string);
var
  LDecoder: TGIFDecoder;
  LCompositor: TGIFCompositor;
  LDirtyRect: TRect;
begin
  LDecoder := TGIFDecoder.Create;
  LCompositor := nil;
  try
    LDecoder.LoadFromFile(AFileName);
    LCompositor := TGIFCompositor.Create(LDecoder);

    FTimer.Enabled := False;
    FPlaying := False;

    if not LCompositor.RenderFrame(0, Bitmap, LDirtyRect) then
      raise EFMXBridgeGIFError.Create('Unable to map GIF bitmap');

    FreeAndNil(FCompositor);
    FreeAndNil(FDecoder);

    FDecoder := LDecoder;
    LDecoder := nil;

    FCompositor := LCompositor;
    LCompositor := nil;

    FActiveFrame := 0;
    Repaint;
  finally
    LCompositor.Free;
    LDecoder.Free;
  end;
end;

procedure TGIFImage.Play;
begin
  if (FDecoder = nil) or (FDecoder.FrameCount <= 1) or FPlaying then
    Exit;

  if not FLoop and (FActiveFrame >= FDecoder.FrameCount - 1) then
    SetActiveFrame(0);

  FPlaying := True;
  UpdateTimerInterval;
  FTimer.Enabled := True;
end;

procedure TGIFImage.Pause;
begin
  FTimer.Enabled := False;
  FPlaying := False;
end;

procedure TGIFImage.Stop;
begin
  Pause;

  if FDecoder <> nil then
    SetActiveFrame(0);
end;

procedure TGIFImage.SetActiveFrame(const AValue: Integer);
begin
  SetActiveFrameInternal(AValue, True);
end;

procedure TGIFImage.SetActiveFrameInternal(const AValue: Integer;
  const AUpdateTimer: Boolean);
var
  LIndex: Integer;
  LDirtyRect: TRect;
begin
  if FDecoder = nil then
  begin
    if AValue < 0 then
      FActiveFrame := 0
    else
      FActiveFrame := AValue;
    Exit;
  end;

  LIndex := AValue;
  if LIndex < 0 then
    LIndex := 0
  else if LIndex >= FDecoder.FrameCount then
    LIndex := FDecoder.FrameCount - 1;

  if LIndex = FActiveFrame then
    Exit;

  if not FCompositor.RenderFrame(LIndex, Bitmap, LDirtyRect) then
    Exit;

  FActiveFrame := LIndex;
  Repaint;

  if AUpdateTimer and FPlaying then
    UpdateTimerInterval;
end;

procedure TGIFImage.SetSpeed(const AValue: Single);
begin
  if AValue <= 0 then
    FSpeed := 1.0
  else
    FSpeed := AValue;

  if FPlaying then
    UpdateTimerInterval;
end;

procedure TGIFImage.TimerTimer(Sender: TObject);
var
  LStopWatch: TStopwatch;
begin
  if not FPlaying or (FDecoder = nil) then
    Exit;

  LStopWatch := TStopwatch.StartNew;
  if FActiveFrame >= FDecoder.FrameCount - 1 then
  begin
    if FLoop then
      SetActiveFrameInternal(0, False)
    else
      Pause;
  end
  else
    SetActiveFrameInternal(FActiveFrame + 1, False);
  LStopWatch.Stop;

  if FPlaying then
    UpdateTimerInterval(LStopWatch.ElapsedMilliseconds);
end;

procedure TGIFImage.UpdateTimerInterval
  (const AElapsedMilliseconds: Int64);
var
  LInterval: Double;
begin
  if (FDecoder = nil) or (FDecoder.FrameCount = 0) then
    Exit;

  LInterval := FDecoder.FrameDelay[FActiveFrame] / FSpeed -
    AElapsedMilliseconds;

  if LInterval < 1 then
    LInterval := 1;

  if LInterval >= High(Cardinal) then
    FTimer.Interval := High(Cardinal)
  else
    FTimer.Interval := Cardinal(Round(LInterval));
end;

function TGIFImage.GetFrameCount: Integer;
begin
  if FDecoder = nil then
    Result := 0
  else
    Result := FDecoder.FrameCount;
end;

end.
