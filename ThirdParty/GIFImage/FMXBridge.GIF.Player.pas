unit FMXBridge.GIF.Player;

interface

uses
  System.Classes,
  System.SysUtils,
  System.UITypes,
  FMX.Types,
  FMX.Objects,
  FMX.Graphics,
  FMXBridge.GIF.Decoder;

type
  TFMXBridgeGIFImage = class(TImage)
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
    procedure TimerTimer(Sender: TObject);
    procedure UpdateTimerInterval;
    procedure UpdateBitmap(const APixels: TArray<TAlphaColor>);
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
    property ActiveFrame: Integer read FActiveFrame write SetActiveFrame default 0;
    property Loop: Boolean read FLoop write FLoop default True;
    property Speed: Single read FSpeed write SetSpeed;
  end;

implementation

constructor TFMXBridgeGIFImage.Create(AOwner: TComponent);
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

destructor TFMXBridgeGIFImage.Destroy;
begin
  FTimer.Enabled := False;
  FTimer.OnTimer := nil;
  FreeAndNil(FTimer);

  FreeAndNil(FCompositor);
  FreeAndNil(FDecoder);

  inherited Destroy;
end;

procedure TFMXBridgeGIFImage.LoadFromFile(const AFileName: string);
var
  LDecoder: TGIFDecoder;
  LCompositor: TGIFCompositor;
  LFirstFrame: TArray<TAlphaColor>;
begin
  LDecoder := TGIFDecoder.Create;
  LCompositor := nil;
  try
    LDecoder.LoadFromFile(AFileName);
    LCompositor := TGIFCompositor.Create(LDecoder);
    LFirstFrame := LCompositor.RenderFrame(0);

    FTimer.Enabled := False;
    FPlaying := False;

    FreeAndNil(FCompositor);
    FreeAndNil(FDecoder);

    FDecoder := LDecoder;
    LDecoder := nil;

    FCompositor := LCompositor;
    LCompositor := nil;

    FActiveFrame := 0;
    UpdateBitmap(LFirstFrame);
  finally
    LCompositor.Free;
    LDecoder.Free;
  end;
end;

procedure TFMXBridgeGIFImage.Play;
begin
  if (FDecoder = nil) or (FDecoder.FrameCount <= 1) or FPlaying then
    Exit;

  if not FLoop and (FActiveFrame >= FDecoder.FrameCount - 1) then
    SetActiveFrame(0);

  FPlaying := True;
  UpdateTimerInterval;
  FTimer.Enabled := True;
end;

procedure TFMXBridgeGIFImage.Pause;
begin
  FTimer.Enabled := False;
  FPlaying := False;
end;

procedure TFMXBridgeGIFImage.Stop;
begin
  Pause;

  if FDecoder <> nil then
    SetActiveFrame(0);
end;

procedure TFMXBridgeGIFImage.SetActiveFrame(const AValue: Integer);
var
  LIndex: Integer;
  LPixels: TArray<TAlphaColor>;
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

  LPixels := FCompositor.RenderFrame(LIndex);
  UpdateBitmap(LPixels);
  FActiveFrame := LIndex;

  if FPlaying then
    UpdateTimerInterval;
end;

procedure TFMXBridgeGIFImage.SetSpeed(const AValue: Single);
begin
  if AValue <= 0 then
    FSpeed := 1.0
  else
    FSpeed := AValue;

  if FPlaying then
    UpdateTimerInterval;
end;

procedure TFMXBridgeGIFImage.TimerTimer(Sender: TObject);
begin
  if not FPlaying or (FDecoder = nil) then
    Exit;

  if FActiveFrame >= FDecoder.FrameCount - 1 then
  begin
    if FLoop then
      SetActiveFrame(0)
    else
      Pause;
  end
  else
    SetActiveFrame(FActiveFrame + 1);
end;

procedure TFMXBridgeGIFImage.UpdateTimerInterval;
var
  LInterval: Double;
begin
  if (FDecoder = nil) or (FDecoder.FrameCount = 0) then
    Exit;

  LInterval := FDecoder.FrameDelay[FActiveFrame] / FSpeed;

  if LInterval < 1 then
    LInterval := 1;

  if LInterval >= High(Cardinal) then
    FTimer.Interval := High(Cardinal)
  else
    FTimer.Interval := Cardinal(Round(LInterval));
end;

procedure TFMXBridgeGIFImage.UpdateBitmap(
  const APixels: TArray<TAlphaColor>);
var
  LBitmapData: TBitmapData;
  LScanLine: PAlphaColor;
  X, Y: Integer;
  LIndex: Integer;
begin
  if FDecoder = nil then
    Exit;

  if Length(APixels) <> FDecoder.Width * FDecoder.Height then
    Exit;

  if (Bitmap.Width <> FDecoder.Width) or
    (Bitmap.Height <> FDecoder.Height) then
    Bitmap.SetSize(FDecoder.Width, FDecoder.Height);

  if not Bitmap.Map(TMapAccess.Write, LBitmapData) then
    Exit;

  try
    LIndex := 0;
    for Y := 0 to FDecoder.Height - 1 do
    begin
      LScanLine := PAlphaColor(LBitmapData.GetScanLine(Y));
      for X := 0 to FDecoder.Width - 1 do
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

function TFMXBridgeGIFImage.GetFrameCount: Integer;
begin
  if FDecoder = nil then
    Result := 0
  else
    Result := FDecoder.FrameCount;
end;

end.
