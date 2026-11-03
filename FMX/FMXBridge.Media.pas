
unit FMXBridge.Media;

interface

uses
  FMX.Media, FMX.Types;

// =============================================================================
// FMediaPlayer
// =============================================================================
type
  FMediaPlayer = interface(IUnknown)
    ['{94F5C2EF-067D-49A4-9924-68DBDEB007A1}']
    procedure FCreate(FParent: TFmxObject; const FVideoFile: WideString;
      Loop: Boolean); stdcall;
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
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Stop; stdcall;
    procedure Resume; stdcall;
    procedure Volume(FValue: Single); stdcall;
    procedure Loop(FValue: Boolean); stdcall;
    function IsPlaying: Boolean; stdcall;
    function IsStopped: Boolean; stdcall;
    function IsPaused: Boolean; stdcall;
    function GetVolume: Single; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
  end;

type
  TPlayerState = (psStopped, psPlaying, psPaused);

  TFMediaPlayer = class(TInterfacedObject, FMediaPlayer)
  private
    Player: TMediaPlayer;
    PlayerControl: TMediaPlayerControl;
    FLooping: Boolean;
    FState: TPlayerState;
    FVolume: Single;
    FTimer: TTimer;
    procedure CheckLoop(Sender: TObject);
  public
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject; const FVideoFile: WideString;
      Loop: Boolean); stdcall;
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
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Stop; stdcall;
    procedure Resume; stdcall;
    procedure Volume(FValue: Single); stdcall;
    procedure Loop(FValue: Boolean); stdcall;
    function IsPlaying: Boolean; stdcall;
    function IsStopped: Boolean; stdcall;
    function IsPaused: Boolean; stdcall;
    function GetVolume: Single; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitMediaPlayer: FMediaPlayer; stdcall;

implementation

// =============================================================================
// FMediaPlayer
// =============================================================================
procedure TFMediaPlayer.FCreate(FParent: TFmxObject;
  const FVideoFile: WideString; Loop: Boolean);
begin
  Player := TMediaPlayer.Create(nil);
  Player.Volume := 1;

  FLooping := Loop;
  FState := psStopped;

  PlayerControl := TMediaPlayerControl.Create(nil);
  PlayerControl.Parent := FParent;
  PlayerControl.MediaPlayer := Player;

  if FVideoFile <> '' then
    Player.FileName := string(FVideoFile);

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 300;
  FTimer.Enabled := FLooping;
  FTimer.OnTimer := CheckLoop;
end;

destructor TFMediaPlayer.Destroy;
begin
  if Assigned(FTimer) then
  begin
    FTimer.Enabled := False;
    FTimer.OnTimer := nil;
    FTimer.Free;
  end;

  if Assigned(PlayerControl) then
  begin
    PlayerControl.MediaPlayer := nil;
    PlayerControl.Free;
    PlayerControl := nil;
  end;

  if Assigned(Player) then
  begin
    Player.Stop;
    Player.Free;
    Player := nil;
  end;

  inherited;
end;

procedure TFMediaPlayer.CheckLoop(Sender: TObject);
begin
  if not Assigned(Player) then Exit;

  if not FLooping then Exit;

  if FState <> psPlaying then Exit;

  if (Player.State = TMediaState.Stopped) then
  begin
    Player.CurrentTime := 0;
    Player.Play;
  end;
end;

procedure TFMediaPlayer.Left(FLeft: Single);
begin
  PlayerControl.Position.X := FLeft;
end;

procedure TFMediaPlayer.Top(FTop: Single);
begin
  PlayerControl.Position.Y := FTop;
end;

procedure TFMediaPlayer.Height(FHeight: Single);
begin
  PlayerControl.Size.Height := FHeight;
end;

procedure TFMediaPlayer.Width(FWidth: Single);
begin
  PlayerControl.Size.Width := FWidth;
end;

procedure TFMediaPlayer.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  PlayerControl.Position.X := FLeft;
  PlayerControl.Position.Y := FTop;
  PlayerControl.Size.Height := FHeight;
  PlayerControl.Size.Width := FWidth;
end;

procedure TFMediaPlayer.Position(X, Y: Single);
begin
  PlayerControl.Position.X := X;
  PlayerControl.Position.Y := Y;
end;

procedure TFMediaPlayer.Align(Al: TAlignLayout);
begin
  PlayerControl.Align := TAlignLayout(Al);
end;

procedure TFMediaPlayer.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  PlayerControl.Margins.Left := FLeft;
  PlayerControl.Margins.Top := FTop;
  PlayerControl.Margins.Right := FRight;
  PlayerControl.Margins.Bottom := FBottom;
end;

procedure TFMediaPlayer.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  PlayerControl.Padding.Left := FLeft;
  PlayerControl.Padding.Top := FTop;
  PlayerControl.Padding.Right := FRight;
  PlayerControl.Padding.Bottom := FBottom;
end;

procedure TFMediaPlayer.BringToFront;
begin
  PlayerControl.BringToFront;
end;

procedure TFMediaPlayer.SendToBack;
begin
  PlayerControl.SendToBack;
end;

procedure TFMediaPlayer.VideoFile(const FVideoFile: WideString);
begin
  if Assigned(Player) then
  begin
    Player.Clear;
    Player.FileName := string(FVideoFile);
  end;
end;

procedure TFMediaPlayer.Play;
begin
  if not Assigned(Player) then
    Exit;

  if FState = psPlaying then
    Exit;

  if FState = psStopped then
    Player.CurrentTime := 0;

  Player.Volume := FVolume;
  Player.Play;

  FState := psPlaying;

  if Assigned(FTimer) then
    FTimer.Enabled := FLooping;
end;

procedure TFMediaPlayer.Pause;
begin
  if Assigned(Player) and (FState = psPlaying) then
  begin
    Player.Stop;

    if Assigned(FTimer) then
      FTimer.Enabled := False;

    FState := psPaused;
  end;
end;

procedure TFMediaPlayer.Stop;
begin
  if Assigned(Player) then
  begin
    Player.Stop;
    Player.CurrentTime := 0;

    if Assigned(FTimer) then
      FTimer.Enabled := False;

    FState := psStopped;
  end;
end;

procedure TFMediaPlayer.Resume;
begin
  if Assigned(Player) and (FState = psPaused) then
  begin
    Player.Play;

    if Assigned(FTimer) and FLooping then
      FTimer.Enabled := True;

    FState := psPlaying;
  end;
end;

procedure TFMediaPlayer.Volume(FValue: Single);
begin
  if Assigned(Player) then
  begin
    if FValue < 0 then
      FValue := 0;
    if FValue > 1 then
      FValue := 1;

    FVolume := Ln(1 + 50 * FValue) / Ln(51); // 9;10
    Player.Volume := FVolume;
  end;
end;

procedure TFMediaPlayer.Loop(FValue: Boolean);
begin
  FLooping := FValue;

  if Assigned(FTimer) then
    FTimer.Enabled := FLooping and (FState = psPlaying);
end;

function TFMediaPlayer.IsPlaying: Boolean;
begin
  Result := FState = psPlaying;
end;

function TFMediaPlayer.IsStopped: Boolean;
begin
  Result := FState = psStopped;
end;

function TFMediaPlayer.IsPaused: Boolean;
begin
  Result := FState = psPaused;
end;

function TFMediaPlayer.GetVolume: Single;
begin
  if Assigned(Player) then
    Result := Player.Volume
  else
    Result := 1;
end;

function TFMediaPlayer.GetLeft: Single;
begin
  Result := PlayerControl.Position.X;
end;

function TFMediaPlayer.GetTop: Single;
begin
  Result := PlayerControl.Position.Y;
end;

function TFMediaPlayer.GetHeight: Single;
begin
  Result := PlayerControl.Size.Height;
end;

function TFMediaPlayer.GetWidth: Single;
begin
  Result := PlayerControl.Size.Width;
end;

// =============================================================================
// Exports
// =============================================================================
function InitMediaPlayer: FMediaPlayer;
begin
  Result := TFMediaPlayer.Create;
end;

exports
  InitMediaPlayer;

end.