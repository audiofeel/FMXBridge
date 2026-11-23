
unit FMXBridge.VideoBackground;

interface

uses
  FMX.Types, FMX.Objects, FMX.VideoPlayer;

// =============================================================================
// FVideoBackground
// =============================================================================
type
  FVideoBackground = interface(IUnknown)
    ['{08056C83-279E-47FF-B550-31DCB506BEFB}']
    procedure FCreate(FParent: TFmxObject;
      const FVideoFile: WideString; Loop: Boolean); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure VideoFile(const FVideoFile: WideString); stdcall;
    procedure MaxOutputSize(W, H: Integer); stdcall;
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Stop; stdcall;
    procedure Volume(FValue: Single); stdcall;
    procedure Loop(FValue: Boolean); stdcall;
    function GetLoop: Boolean; stdcall;
    function GetVolume: Single; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

type
  TFVideoBackground = class;

  TVideoBackgroundImage = class(TImage)
  private
    FNotifier: TFVideoBackground;
  public
    destructor Destroy; override;
  end;

  TFVideoBackground = class(TInterfacedObject, FVideoBackground)
  private
    FImage: TVideoBackgroundImage;
    FPlayer: TVideoPlayer;

    procedure CheckCreated;
    procedure ImageDestroyed(AImage: TVideoBackgroundImage);

  public
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject;
      const FVideoFile: WideString; Loop: Boolean); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure VideoFile(const FVideoFile: WideString); stdcall;
    procedure MaxOutputSize(W, H: Integer); stdcall;
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Stop; stdcall;
    procedure Volume(FValue: Single); stdcall;
    procedure Loop(FValue: Boolean); stdcall;
    function GetLoop: Boolean; stdcall;
    function GetVolume: Single; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitVideoBackground: FVideoBackground; stdcall;

implementation

uses
  System.SysUtils;

// TVideoBackgroundImage -------------------------------------------------------
destructor TVideoBackgroundImage.Destroy;
var
  Owner: TFVideoBackground;
begin
  Owner := FNotifier;
  FNotifier := nil;

  if Owner <> nil then
    Owner.ImageDestroyed(Self);

  inherited;
end;

// =============================================================================
// TFVideoBackground
// =============================================================================
destructor TFVideoBackground.Destroy;
begin
  if FImage <> nil then
    FImage.FNotifier := nil;

  FreeAndNil(FPlayer);
  FreeAndNil(FImage);

  inherited;
end;

procedure TFVideoBackground.CheckCreated;
begin
  if (FImage = nil) or (FPlayer = nil) then
    raise Exception.Create(
      'VideoBackground is not initialized. Call FCreate first.');
end;

procedure TFVideoBackground.ImageDestroyed(AImage: TVideoBackgroundImage);
begin
  if FImage = AImage then
  begin
    FImage := nil;

    FreeAndNil(FPlayer);
  end;
end;

// Create ----------------------------------------------------------------------
procedure TFVideoBackground.FCreate(FParent: TFmxObject;
  const FVideoFile: WideString; Loop: Boolean);
begin
  if FImage <> nil then
    raise Exception.Create('VideoBackground already created.');

  if FParent = nil then
    raise Exception.Create('VideoBackground parent is nil.');

  FImage := TVideoBackgroundImage.Create(nil);
  FImage.FNotifier := Self;

  try
    FImage.Parent := FParent;
    FImage.Align := TAlignLayout.Contents;
    FImage.WrapMode := TImageWrapMode.Fit;
    FImage.HitTest := False;
    FImage.SendToBack;

    FPlayer := TVideoPlayer.Create(FImage);
    FPlayer.Loop := Loop;

    if FVideoFile <> '' then
      FPlayer.Open(string(FVideoFile));

  except
    FreeAndNil(FPlayer);

    if FImage <> nil then
    begin
      FImage.FNotifier := nil;
      FreeAndNil(FImage);
    end;

    raise;
  end;
end;

// Media -----------------------------------------------------------------------
procedure TFVideoBackground.VideoFile(const FVideoFile: WideString);
begin
  CheckCreated;
  FPlayer.Open(string(FVideoFile));
end;

procedure TFVideoBackground.Play;
begin
  CheckCreated;
  FPlayer.Play;
end;

procedure TFVideoBackground.Pause;
begin
  CheckCreated;
  FPlayer.Pause;
end;

procedure TFVideoBackground.Stop;
begin
  CheckCreated;
  FPlayer.Stop;
end;

procedure TFVideoBackground.Volume(FValue: Single);
begin
  CheckCreated;
  FPlayer.Volume := FValue;
end;

function TFVideoBackground.GetVolume: Single;
begin
  CheckCreated;
  Result := FPlayer.Volume;
end;

procedure TFVideoBackground.Loop(FValue: Boolean);
begin
  CheckCreated;
  FPlayer.Loop := FValue;
end;

function TFVideoBackground.GetLoop: Boolean;
begin
  CheckCreated;
  Result := FPlayer.Loop;
end;

procedure TFVideoBackground.MaxOutputSize(W, H: Integer);
begin
  CheckCreated;
  FPlayer.SetMaxOutput(W, H);
end;

// Geometry --------------------------------------------------------------------
procedure TFVideoBackground.Left(FLeft: Single);
begin
  CheckCreated;
  FImage.Left := FLeft;
end;

procedure TFVideoBackground.Top(FTop: Single);
begin
  CheckCreated;
  FImage.Top := FTop;
end;

procedure TFVideoBackground.Height(FHeight: Single);
begin
  CheckCreated;
  FImage.Size.Height := FHeight;
end;

procedure TFVideoBackground.Width(FWidth: Single);
begin
  CheckCreated;
  FImage.Size.Width := FWidth;
end;

procedure TFVideoBackground.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  CheckCreated;
  FImage.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFVideoBackground.Position(X, Y: Single);
begin
  CheckCreated;
  FImage.Position.X := X;
  FImage.Position.Y := Y;
end;

procedure TFVideoBackground.Align(Al: TAlignLayout);
begin
  CheckCreated;
  FImage.Align := Al;
end;

procedure TFVideoBackground.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  CheckCreated;

  FImage.Margins.Left := FLeft;
  FImage.Margins.Top := FTop;
  FImage.Margins.Right := FRight;
  FImage.Margins.Bottom := FBottom;
end;

procedure TFVideoBackground.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  CheckCreated;

  FImage.Padding.Left := FLeft;
  FImage.Padding.Top := FTop;
  FImage.Padding.Right := FRight;
  FImage.Padding.Bottom := FBottom;
end;

// Z-order ---------------------------------------------------------------------
procedure TFVideoBackground.BringToFront;
begin
  CheckCreated;
  FImage.BringToFront;
end;

procedure TFVideoBackground.SendToBack;
begin
  CheckCreated;
  FImage.SendToBack;
end;

// Getters ---------------------------------------------------------------------
function TFVideoBackground.GetLeft: Single;
begin
  CheckCreated;
  Result := FImage.Left;
end;

function TFVideoBackground.GetTop: Single;
begin
  CheckCreated;
  Result := FImage.Top;
end;

function TFVideoBackground.GetWidth: Single;
begin
  CheckCreated;
  Result := FImage.Size.Width;
end;

function TFVideoBackground.GetHeight: Single;
begin
  CheckCreated;
  Result := FImage.Size.Height;
end;

function TFVideoBackground.Handle: TFmxObject;
begin
  Result := FImage;
end;

// =============================================================================
// Export
// =============================================================================
function InitVideoBackground: FVideoBackground;
begin
  Result := TFVideoBackground.Create;
end;

exports
  InitVideoBackground;

end.
