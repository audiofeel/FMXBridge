unit FMXBridge.GIF.Player;

interface

uses
  System.Classes,
  System.SysUtils,
  System.UITypes,
  FMX.Types,
  FMX.Objects,
  FMX.Graphics,
  FMX.Ani,
  FMXBridge.GIF.Decoder;

type
  TFMXBridgeGIFImage = class(TImage)
  private
    FDecoder: TGIFDecoder;
    FCompositor: TGIFCompositor;
    FAnimation: TFloatAnimation;
    FAnimationValue: Single;
    FAnimationStartFrame: Integer;
    FLoop: Boolean;
    FSpeed: Single;
    FActiveFrame: Integer;
    FPlaying: Boolean;

    procedure SetActiveFrame(const AValue: Integer);
    procedure SetSpeed(const AValue: Single);
    procedure StartAnimation(const AStartFrame: Integer);
    procedure AnimationProcess(Sender: TObject);
    procedure AnimationFinish(Sender: TObject);
    procedure RenderFrame(const AIndex: Integer);
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
    property AnimationValue: Single read FAnimationValue write FAnimationValue;
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

  FAnimation := TFloatAnimation.Create(Self);
  FAnimation.Parent := Self;
  FAnimation.PropertyName := 'AnimationValue';
  FAnimation.StartValue := 0;
  FAnimation.StopValue := 1;
  FAnimation.OnProcess := AnimationProcess;
  FAnimation.OnFinish := AnimationFinish;
end;

destructor TFMXBridgeGIFImage.Destroy;
begin
  FPlaying := False;

  if FAnimation <> nil then
  begin
    FAnimation.Stop;
    FAnimation.OnProcess := nil;
    FAnimation.OnFinish := nil;
    FreeAndNil(FAnimation);
  end;

  FreeAndNil(FCompositor);
  FreeAndNil(FDecoder);

  inherited Destroy;
end;

procedure TFMXBridgeGIFImage.LoadFromFile(const AFileName: string);
var
  LDecoder: TGIFDecoder;
  LCompositor: TGIFCompositor;
begin
  Pause;

  LDecoder := TGIFDecoder.Create;
  LCompositor := nil;
  try
    LDecoder.LoadFromFile(AFileName);
    LCompositor := TGIFCompositor.Create(LDecoder);

    FreeAndNil(FCompositor);
    FreeAndNil(FDecoder);

    FDecoder := LDecoder;
    LDecoder := nil;

    FCompositor := LCompositor;
    LCompositor := nil;

    FActiveFrame := -1;
    RenderFrame(0);
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
    RenderFrame(0);

  FPlaying := True;
  StartAnimation(FActiveFrame);
end;

procedure TFMXBridgeGIFImage.Pause;
begin
  FPlaying := False;
  FAnimation.Stop;
end;

procedure TFMXBridgeGIFImage.Stop;
begin
  Pause;

  if FDecoder <> nil then
    RenderFrame(0);
end;

procedure TFMXBridgeGIFImage.SetActiveFrame(const AValue: Integer);
var
  LIndex: Integer;
  LWasPlaying: Boolean;
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

  LWasPlaying := FPlaying;
  if LWasPlaying then
    FAnimation.Stop;

  RenderFrame(LIndex);

  if LWasPlaying then
    StartAnimation(FActiveFrame);
end;

procedure TFMXBridgeGIFImage.SetSpeed(const AValue: Single);
begin
  if AValue <= 0 then
    FSpeed := 1.0
  else
    FSpeed := AValue;

  if FPlaying then
  begin
    FAnimation.Stop;
    StartAnimation(FActiveFrame);
  end;
end;

procedure TFMXBridgeGIFImage.StartAnimation(const AStartFrame: Integer);
var
  I: Integer;
  LDurationMS: Double;
begin
  if FDecoder = nil then
    Exit;

  FAnimationStartFrame := AStartFrame;
  LDurationMS := 0;

  for I := AStartFrame to FDecoder.FrameCount - 1 do
    LDurationMS := LDurationMS + FDecoder.FrameDelay[I];

  FAnimation.Duration := LDurationMS / (1000.0 * FSpeed);
  FAnimation.Start;
end;

procedure TFMXBridgeGIFImage.AnimationProcess(Sender: TObject);
var
  LElapsedMS: Double;
  LDelayMS: Cardinal;
  LIndex: Integer;
begin
  if not FPlaying or (FDecoder = nil) then
    Exit;

  LElapsedMS := FAnimation.CurrentTime * 1000.0 * FSpeed;
  LIndex := FAnimationStartFrame;

  while LIndex < FDecoder.FrameCount do
  begin
    LDelayMS := FDecoder.FrameDelay[LIndex];
    if LElapsedMS < LDelayMS then
      Break;

    LElapsedMS := LElapsedMS - LDelayMS;
    Inc(LIndex);
  end;

  if LIndex >= FDecoder.FrameCount then
    LIndex := FDecoder.FrameCount - 1;

  if LIndex <> FActiveFrame then
    RenderFrame(LIndex);
end;

procedure TFMXBridgeGIFImage.AnimationFinish(Sender: TObject);
begin
  if not FPlaying or (FDecoder = nil) then
    Exit;

  if FActiveFrame <> FDecoder.FrameCount - 1 then
    RenderFrame(FDecoder.FrameCount - 1);

  if FLoop then
  begin
    RenderFrame(0);
    StartAnimation(0);
  end
  else
    FPlaying := False;
end;

procedure TFMXBridgeGIFImage.RenderFrame(const AIndex: Integer);
var
  LPixels: TArray<TAlphaColor>;
begin
  LPixels := FCompositor.RenderFrame(AIndex);
  UpdateBitmap(LPixels);
  FActiveFrame := AIndex;
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
