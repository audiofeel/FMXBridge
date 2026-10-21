
unit FMXBridge.Bass;

interface

uses
  Winapi.Windows,
  System.Classes, System.UITypes,
  FMX.Types, FMX.Controls,
  DynamicBass;

// =============================================================================
// FBASSPlayer
// =============================================================================
type
  TBASSProgressCallback = procedure(const Percent: Single;
    const Duration, Position, CurrentFile: WideString) of object;

  TFBASSSpectrum = class(TControl)
  private
    FBands: array of Single;
    FBarWidth: Single;
    FBarSpacing: Single;
    FBarColor: TAlphaColor;
    FBarRadius: Single;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetLevels(const Values: array of Single);
    procedure SetBarColor(Value: TAlphaColor);
    procedure SetBarWidth(Value: Single);
    procedure SetBarSpacing(Value: Single);
    procedure SetBarRadius(Value: Single);
  end;

  FBASSPlayer = interface(IUnknown)
    ['{8F3C0DBE-8B8D-4B08-A251-3E011288F4D3}']
    function FCreate(FHandle: HWND; const FileName: WideString;
      Loop: Boolean): Boolean; stdcall;
    function FCreateList(FHandle: HWND; const Folder: WideString;
      Loop: Boolean): Boolean; stdcall;
    function SetFile(const FileName: WideString): Boolean; stdcall;
    function SetFolder(const Folder: WideString): Boolean; stdcall;
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Resume; stdcall;
    procedure Stop; stdcall;
    procedure Next; stdcall;
    procedure Previous; stdcall;
    procedure Volume(FValue: Integer); stdcall;
    procedure Loop(FValue: Boolean); stdcall;
    procedure SetPosition(Percent: Integer); stdcall;
    procedure SeekForward(const Sec: Integer); stdcall;
    procedure SeekBackward(const Sec: Integer); stdcall;
    function IsPlaying: Boolean; stdcall;
    function IsPaused: Boolean; stdcall;
    function GetPercent: Single; stdcall;
    function GetPosition: WideString; stdcall;
    function GetDuration: WideString; stdcall;
    function GetCurrentFile: WideString; stdcall;
    procedure OnProgress(FCallback: TBASSProgressCallback); stdcall;
    procedure SetSpectrum(FParent: TFmxObject;
      FLeft, FTop, FHeight: Single); stdcall;
    procedure BarColor(FColor: TAlphaColor); stdcall;
    procedure BarWidth(FWidth: Single); stdcall;
    procedure BarSpacing(FSpace: Single); stdcall;
    procedure BarRadius(FRadius: Single); stdcall;
  end;

  TFBASSPlayer = class(TInterfacedObject, FBASSPlayer)
  private
    FHandle: HWND;
    FStream: HSTREAM;
    FPlaylist: TStringList;
    FCurrentIndex: Integer;
    FLoop: Boolean;
    FLoopPlaylist: Boolean;
    FCurrentFile: WideString;
    FSyncEnd: HSYNC;
    FProgressCallback: TBASSProgressCallback;
    FTimer: TTimer;
    FSeeking: Boolean;
    FPlaylistMode: Boolean;
    FSpectrum: TFBASSSpectrum;
    FBandCount: Integer;
    FBarWidth: Single;
    FBarSpacing: Single;
    FBarColor: TAlphaColor;
    FBarRadius: Single;
    procedure UpdateSpectrum;
    procedure DoProgress;
    procedure DoEndTrack;
    function LoadCurrentFile: Boolean;
    procedure TimerProc(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;

    function FCreate(FHandle: HWND; const FileName: WideString;
      Loop: Boolean): Boolean; stdcall;
    function FCreateList(FHandle: HWND; const Folder: WideString;
      Loop: Boolean): Boolean; stdcall;
    function SetFile(const FileName: WideString): Boolean; stdcall;
    function SetFolder(const Folder: WideString): Boolean; stdcall;
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Resume; stdcall;
    procedure Stop; stdcall;
    procedure Next; stdcall;
    procedure Previous; stdcall;
    procedure Volume(FValue: Integer); stdcall;
    procedure Loop(FValue: Boolean); stdcall;
    procedure SetPosition(Percent: Integer); stdcall;
    procedure SeekForward(const Sec: Integer); stdcall;
    procedure SeekBackward(const Sec: Integer); stdcall;
    function IsPlaying: Boolean; stdcall;
    function IsPaused: Boolean; stdcall;
    function GetPercent: Single; stdcall;
    function GetPosition: WideString; stdcall;
    function GetDuration: WideString; stdcall;
    function GetCurrentFile: WideString; stdcall;
    procedure OnProgress(FCallback: TBASSProgressCallback); stdcall;
    procedure SetSpectrum(FParent: TFmxObject;
      FLeft, FTop, FHeight: Single); stdcall;
    procedure BarColor(FColor: TAlphaColor); stdcall;
    procedure BarWidth(FWidth: Single); stdcall;
    procedure BarSpacing(FSpace: Single); stdcall;
    procedure BarRadius(FRadius: Single); stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitBASSPlayer: FBASSPlayer; stdcall;

implementation

uses
  System.Types, System.SysUtils, System.Math,
  FMX.Graphics;

// ==================================================
// FBASSPlayer
// ==================================================
function EnsureBASSLoaded: Boolean;
var
  Buffer: array [0..MAX_PATH - 1] of Char;
  ModulePath: string;
  DllName: string;
begin
  if BASS_Handle <> 0 then
    Exit(True);

  SetString(ModulePath, Buffer,
    GetModuleFileName(HInstance, Buffer, Length(Buffer)));

  DllName := ExtractFilePath(ModulePath) + 'bass.dll';

  if not FileExists(DllName) then
  begin
    with TResourceStream.Create(HInstance, 'BASS', RT_RCDATA) do
    try
      SaveToFile(DllName);
    finally
      Free;
    end;
  end;

  Result := Load_BASSDLL(DllName);
end;

procedure EndTrack(Handle: HSYNC; Channel, Data: DWORD; User: Pointer); stdcall;
var
  Player: TFBASSPlayer;
begin
  Player := TFBASSPlayer(User);

  if Assigned(Player) then
    Player.DoEndTrack;
end;

constructor TFBASSPlayer.Create;
begin
  inherited Create;

  FHandle := 0;
  FStream := 0;
  FPlaylist := TStringList.Create;
  FCurrentIndex := -1;
  FLoop := False;
  FLoopPlaylist := False;
  FPlaylistMode := False;
  FCurrentFile := '';
  FSyncEnd := 0;
  FProgressCallback := nil;
  FSeeking := False;

  FSpectrum := nil;

  FBandCount := 16;
  FBarWidth := 5;
  FBarSpacing := 2;
  FBarColor := TAlphaColorRec.Lime;
  FBarRadius := 3;

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 32;
  FTimer.Enabled := False;
  FTimer.OnTimer := TimerProc;
end;

destructor TFBASSPlayer.Destroy;
begin
  FTimer.Enabled := False;

  FreeAndNil(FTimer);

  if FSyncEnd <> 0 then
  begin
    BASS_ChannelRemoveSync(FStream, FSyncEnd);

    FSyncEnd := 0;
  end;

  if FStream <> 0 then
  begin
    BASS_StreamFree(FStream);

    FStream := 0;
  end;

  FreeAndNil(FPlaylist);

  Unload_BASSDLL;

  inherited Destroy;
end;

procedure TFBASSPlayer.UpdateSpectrum;
const
  MinFreq = 50;
  MaxFreq = 20000;
  FFTSize = 4096;
  SampleRate = 44100;
  MinDB = -60;
var
  FFT: array[0..2047] of Single;
  Levels: TArray<Single>;
  I, J: Integer;
  StartBin, EndBin: Integer;
  SumValue: Single;
  DB: Single;
  Freq1, Freq2: Single;
begin
  if not Assigned(FSpectrum) then
    Exit;

  if FStream = 0 then
    Exit;

  FillChar(FFT, SizeOf(FFT), 0);

  BASS_ChannelGetData(FStream, @FFT, BASS_DATA_FFT4096);

  SetLength(Levels, FBandCount);

  for I := 0 to FBandCount - 1 do
  begin
    Freq1 := MinFreq * Power(MaxFreq / MinFreq, I / FBandCount);
    Freq2 := MinFreq * Power(MaxFreq / MinFreq, (I + 1) / FBandCount);

    StartBin := Ceil(Freq1 * FFTSize / SampleRate);

    EndBin := Floor(Freq2 * FFTSize / SampleRate);

    if StartBin < 1 then
      StartBin := 1;

    if EndBin > High(FFT) then
      EndBin := High(FFT);

    if EndBin <= StartBin then
      EndBin := StartBin;

    SumValue := 0;

    for J := StartBin to EndBin do
      SumValue := SumValue + FFT[J] * FFT[J];

    SumValue := Sqrt(SumValue / (EndBin - StartBin + 1));

    if SumValue > 0 then
      DB := 20 * Log10(SumValue)
    else
      DB := MinDB;

    if DB < MinDB then
      DB := MinDB;

    if DB > 0 then
      DB := 0;

    Levels[I] := (DB - MinDB) / (-MinDB);

    if Levels[I] < 0 then
      Levels[I] := 0;

    if Levels[I] > 1 then
      Levels[I] := 1;
  end;

  FSpectrum.SetLevels(Levels);
end;

procedure TFBASSPlayer.TimerProc(Sender: TObject);
begin
  if (FStream <> 0) and IsPlaying and not FSeeking then
    DoProgress;

  UpdateSpectrum;
end;

procedure TFBASSPlayer.DoEndTrack;
begin
  if FLoop then
  begin
    BASS_ChannelSetPosition(FStream, 0, BASS_POS_BYTE);

    Play;

    Exit;
  end;
  Next;
end;

procedure TFBASSPlayer.DoProgress;
begin
  if Assigned(FProgressCallback) then
    FProgressCallback(GetPercent, GetDuration, GetPosition, FCurrentFile);
end;

procedure TFBASSPlayer.OnProgress(FCallback: TBASSProgressCallback);
begin
  FProgressCallback := FCallback;

  FTimer.Enabled := Assigned(FProgressCallback) or Assigned(FSpectrum);
end;

function TFBASSPlayer.FCreate(FHandle: HWND; const FileName: WideString;
  Loop: Boolean): Boolean;
var
  Flags: DWORD;
begin
  Result := False;

  if not EnsureBASSLoaded then
    Exit;

  Self.FHandle := FHandle;

  FPlaylistMode := False;

  if not BASS_Init(-1, 44100, 0, FHandle, nil) then
    Exit;

  FLoop := Loop;

  FCurrentFile := FileName;

  Flags := BASS_UNICODE or BASS_STREAM_PRESCAN;

  FStream := BASS_StreamCreateFile(BASS_FILE_NAME, PWideChar(FileName),
    0, 0, Flags);

  if FStream = 0 then
    Exit;

  FSyncEnd := BASS_ChannelSetSync(FStream, BASS_SYNC_END,
    0, @EndTrack, Self);

  Result := FSyncEnd <> 0;
end;

function TFBASSPlayer.FCreateList(FHandle: HWND; const Folder: WideString;
  Loop: Boolean): Boolean;
var
  SR: TSearchRec;
begin
  Result := False;

  if not EnsureBASSLoaded then
    Exit;

  Self.FHandle := FHandle;

  if not DirectoryExists(Folder) then
    Exit;

  FPlaylistMode := True;

  if not BASS_Init(-1, 44100, 0, FHandle, nil) then
    Exit;

  FPlaylist.Clear;

  if FindFirst(IncludeTrailingPathDelimiter(Folder) + '*.*', faAnyFile, SR) = 0
  then
  begin
    try
      repeat
        if (SR.Attr and faDirectory) = 0 then
        begin
          if SameText(ExtractFileExt(SR.Name), '.mp3') or
             SameText(ExtractFileExt(SR.Name), '.wav') or
             SameText(ExtractFileExt(SR.Name), '.ogg') then
          begin
            FPlaylist.Add(IncludeTrailingPathDelimiter(Folder) + SR.Name);
          end;
        end;
      until FindNext(SR) <> 0;
    finally
      FindClose(SR);
    end;
  end;

  if FPlaylist.Count = 0 then
    Exit;

  FLoopPlaylist := Loop;

  FCurrentIndex := 0;

  Result := LoadCurrentFile;
end;

function TFBASSPlayer.LoadCurrentFile: Boolean;
begin
  Result := False;

  if (FCurrentIndex < 0) or (FCurrentIndex >= FPlaylist.Count) then
    Exit;

  if FSyncEnd <> 0 then
  begin
    BASS_ChannelRemoveSync(FStream, FSyncEnd);
    FSyncEnd := 0;
  end;

  if FStream <> 0 then
  begin
    BASS_StreamFree(FStream);
    FStream := 0;
  end;

  FCurrentFile := FPlaylist[FCurrentIndex];

  FStream := BASS_StreamCreateFile(BASS_FILE_NAME, PWideChar(FCurrentFile),
    0, 0, BASS_UNICODE or BASS_STREAM_PRESCAN);

  if FStream = 0 then
    Exit;

  FSyncEnd := BASS_ChannelSetSync(FStream, BASS_SYNC_END,
    0, @EndTrack, Self);

  Result := FSyncEnd <> 0;

  if Result then
    DoProgress;
end;

function TFBASSPlayer.SetFile(const FileName: WideString): Boolean;
begin
  Result := False;

  if not FileExists(FileName) then
    Exit;

  FPlaylistMode := False;

  if FSyncEnd <> 0 then
  begin
    BASS_ChannelRemoveSync(FStream, FSyncEnd);
    FSyncEnd := 0;
  end;

  if FStream <> 0 then
  begin
    BASS_StreamFree(FStream);
    FStream := 0;
  end;

  FPlaylist.Clear;
  FCurrentIndex := -1;

  FCurrentFile := FileName;

  FStream := BASS_StreamCreateFile(BASS_FILE_NAME, PWideChar(FileName),
    0, 0, BASS_UNICODE or BASS_STREAM_PRESCAN);

  if FStream = 0 then
    Exit;

  FSyncEnd := BASS_ChannelSetSync(FStream, BASS_SYNC_END,
    0, @EndTrack, Self);

  Result := FSyncEnd <> 0;

  if Result then
    DoProgress;
end;

function TFBASSPlayer.SetFolder(const Folder: WideString): Boolean;
var
  SR: TSearchRec;
  WasPlaying: Boolean;
begin
  Result := False;

  if not DirectoryExists(Folder) then
    Exit;

  FPlaylistMode := True;

  WasPlaying := IsPlaying;

  if FSyncEnd <> 0 then
  begin
    BASS_ChannelRemoveSync(FStream, FSyncEnd);
    FSyncEnd := 0;
  end;

  if FStream <> 0 then
  begin
    BASS_ChannelStop(FStream);
    BASS_StreamFree(FStream);
    FStream := 0;
  end;

  FPlaylist.Clear;

  if FindFirst(IncludeTrailingPathDelimiter(Folder) + '*.*', faAnyFile, SR) = 0
  then
  begin
    try
      repeat
        if (SR.Attr and faDirectory) = 0 then
        begin
          if SameText(ExtractFileExt(SR.Name), '.mp3') or
             SameText(ExtractFileExt(SR.Name), '.wav') or
             SameText(ExtractFileExt(SR.Name), '.ogg') then
          begin
            FPlaylist.Add(IncludeTrailingPathDelimiter(Folder) + SR.Name);
          end;
        end;
      until FindNext(SR) <> 0;
    finally
      FindClose(SR);
    end;
  end;

  if FPlaylist.Count = 0 then
    Exit;

  FCurrentIndex := 0;

  Result := LoadCurrentFile;

  if not Result then
    Exit;

  if WasPlaying then
    Play
  else
    DoProgress;
end;

procedure TFBASSPlayer.Play;
begin
  if FStream = 0 then
    Exit;

  BASS_ChannelPlay(FStream, False);

  DoProgress;
end;

procedure TFBASSPlayer.Pause;
begin
  if FStream = 0 then
    Exit;

  BASS_ChannelPause(FStream);

  DoProgress;
end;

procedure TFBASSPlayer.Resume;
begin
  if FStream = 0 then
    Exit;

  BASS_ChannelPlay(FStream, False);

  DoProgress;
end;

procedure TFBASSPlayer.Stop;
begin
  if FStream = 0 then
    Exit;

  BASS_ChannelStop(FStream);

  BASS_ChannelSetPosition(FStream, 0, BASS_POS_BYTE);

  DoProgress;
end;

procedure TFBASSPlayer.Next;
begin
  if not FPlaylistMode then
    Exit;
  if FPlaylist.Count = 0 then
    Exit;

  Inc(FCurrentIndex);

  if FCurrentIndex >= FPlaylist.Count then
  begin
    if FLoopPlaylist then
      FCurrentIndex := 0
    else
    begin
      FCurrentIndex := FPlaylist.Count - 1;
      Exit;
    end;
  end;

  if LoadCurrentFile then
  begin
    DoProgress;
    Play;
  end;
end;

procedure TFBASSPlayer.Previous;
begin
  if not FPlaylistMode then
    Exit;
  if FPlaylist.Count = 0 then
    Exit;

  Dec(FCurrentIndex);

  if FCurrentIndex < 0 then
  begin
    if FLoopPlaylist then
      FCurrentIndex := FPlaylist.Count - 1
    else
    begin
      FCurrentIndex := 0;
      Exit;
    end;
  end;

  if LoadCurrentFile then
    Play;
end;

procedure TFBASSPlayer.Volume(FValue: Integer);
var
  Vol: Single;
begin
  if FStream = 0 then
    Exit;

  FValue := EnsureRange(FValue, 0, 100);

  Vol := FValue / 100;

  BASS_ChannelSetAttribute(FStream, BASS_ATTRIB_VOL, Vol);
end;

procedure TFBASSPlayer.Loop(FValue: Boolean);
begin
  FLoop := FValue;
end;

procedure TFBASSPlayer.SetPosition(Percent: Integer);
var
  LenBytes: QWORD;
  TargetBytes: QWORD;
begin
  if FStream = 0 then
    Exit;

  Percent := EnsureRange(Percent, 0, 100);

  LenBytes := BASS_ChannelGetLength(FStream, BASS_POS_BYTE);
  if LenBytes = QWORD(-1) then
    Exit;

  if Percent = 100 then
    TargetBytes := LenBytes
  else
    TargetBytes := (LenBytes * QWORD(Percent)) div 100;

  FSeeking := True;
  try
    BASS_ChannelSetPosition(FStream, TargetBytes, BASS_POS_BYTE);
  finally
    FSeeking := False;
  end;

  DoProgress;
end;

procedure TFBASSPlayer.SeekForward(const Sec: Integer);
var
  Pos, Len, NewPos: QWORD;
begin
  if FStream = 0 then
    Exit;

  Pos := BASS_ChannelGetPosition(FStream, BASS_POS_BYTE);
  Len := BASS_ChannelGetLength(FStream, BASS_POS_BYTE);

  if (Pos = QWORD(-1)) or (Len = QWORD(-1)) then
    Exit;

  NewPos := Pos + BASS_ChannelSeconds2Bytes(FStream, Sec);

  if NewPos > Len then
    NewPos := Len;

  BASS_ChannelSetPosition(FStream, NewPos, BASS_POS_BYTE);

  DoProgress;
end;

procedure TFBASSPlayer.SeekBackward(const Sec: Integer);
var
  Pos, NewPos: QWORD;
begin
  if FStream = 0 then
    Exit;

  Pos := BASS_ChannelGetPosition(FStream, BASS_POS_BYTE);

  if Pos = QWORD(-1) then
    Exit;

  NewPos := BASS_ChannelSeconds2Bytes(FStream, Sec);

  if Pos > NewPos then
    Pos := Pos - NewPos
  else
    Pos := 0;

  BASS_ChannelSetPosition(FStream, Pos, BASS_POS_BYTE);

  DoProgress;
end;

function TFBASSPlayer.IsPlaying: Boolean;
begin
  Result := False;

  if FStream = 0 then
    Exit;

  Result := BASS_ChannelIsActive(FStream) = BASS_ACTIVE_PLAYING;
end;

function TFBASSPlayer.IsPaused: Boolean;
begin
  Result := False;

  if FStream = 0 then
    Exit;

  Result := BASS_ChannelIsActive(FStream) = BASS_ACTIVE_PAUSED;
end;

function TFBASSPlayer.GetPercent: Single;
var
  Pos, Len: QWORD;
begin
  Result := 0;

  if FStream = 0 then
    Exit;

  Pos := BASS_ChannelGetPosition(FStream, BASS_POS_BYTE);
  Len := BASS_ChannelGetLength(FStream, BASS_POS_BYTE);

  if (Len = 0) or (Len = QWORD(-1)) then
    Exit;

  Result := (Pos / Len) * 100;
end;

function TFBASSPlayer.GetPosition: WideString;
var
  Pos: QWORD;
  Sec: Double;
begin
  Result := '00:00';

  if FStream = 0 then
    Exit;

  Pos := BASS_ChannelGetPosition(FStream, BASS_POS_BYTE);

  Sec := BASS_ChannelBytes2Seconds(FStream, Pos);

  Result := Format('%.2d:%.2d', [Trunc(Sec) div 60, Trunc(Sec) mod 60]);
end;

function TFBASSPlayer.GetDuration: WideString;
var
  Len: QWORD;
  Sec: Double;
begin
  Result := '00:00';

  if FStream = 0 then
    Exit;

  Len := BASS_ChannelGetLength(FStream, BASS_POS_BYTE);

  if Len = QWORD(-1) then
    Exit;

  Sec := BASS_ChannelBytes2Seconds(FStream, Len);

  Result := Format('%.2d:%.2d', [Trunc(Sec) div 60, Trunc(Sec) mod 60]);
end;

function TFBASSPlayer.GetCurrentFile: WideString;
begin
  Result := FCurrentFile;
end;

constructor TFBASSSpectrum.Create(AOwner: TComponent);
begin
  inherited;

  Width := 300;
  Height := 100;

  FBarWidth := 5;
  FBarSpacing := 2;
  FBarColor := TAlphaColorRec.Lime;
  FBarRadius := 3;

  SetLength(FBands, 16);
end;

procedure TFBASSSpectrum.SetLevels(const Values: array of Single);
var
  I: Integer;
begin
  for I := 0 to High(FBands) do
  begin
    if I <= High(Values) then
      FBands[I] := Values[I]
    else
      FBands[I] := 0;

    if FBands[I] > 1 then
      FBands[I] := 1;

    if FBands[I] < 0 then
      FBands[I] := 0;
  end;

  Repaint;
end;

procedure TFBASSSpectrum.Paint;
var
  I: Integer;
  X: Single;
  H: Single;
begin
  inherited;

  Canvas.Fill.Color := FBarColor;

  X := 0;

  for I := 0 to High(FBands) do
  begin
    H := Height * FBands[I];

    if H < 1 then
      H := 1;

    Canvas.FillRect(TRectF.Create(X, Height - H, X + FBarWidth, Height),
      FBarRadius, FBarRadius, AllCorners, AbsoluteOpacity, TCornerType.Round);

    X := X + FBarWidth + FBarSpacing;
  end;
end;

procedure TFBASSSpectrum.SetBarColor(Value: TAlphaColor);
begin
  FBarColor := Value;
  Repaint;
end;

procedure TFBASSSpectrum.SetBarWidth(Value: Single);
begin
  if Value < 1 then
    Value := 1;

  FBarWidth := Value;

  Repaint;
end;

procedure TFBASSSpectrum.SetBarSpacing(Value: Single);
begin
  if Value < 0 then
    Value := 0;

  FBarSpacing := Value;

  Repaint;
end;

procedure TFBASSSpectrum.SetBarRadius(Value: Single);
begin
  if Value < 0 then
    Value := 0;

  FBarRadius := Value;

  Repaint;
end;

procedure TFBASSPlayer.SetSpectrum(FParent: TFmxObject;
  FLeft, FTop, FHeight: Single);
begin
  if Assigned(FSpectrum) then
    Exit;

  FSpectrum := TFBASSSpectrum.Create(nil);
  FSpectrum.Parent := FParent;

  FSpectrum.Position.X := FLeft;
  FSpectrum.Position.Y := FTop;
  FSpectrum.Height := FHeight;

  FSpectrum.SetBarColor(FBarColor);
  FSpectrum.SetBarWidth(FBarWidth);
  FSpectrum.SetBarSpacing(FBarSpacing);
  FSpectrum.SetBarRadius(FBarRadius);
end;

procedure TFBASSPlayer.BarColor(FColor: TAlphaColor);
begin
  FBarColor := FColor;

  if Assigned(FSpectrum) then
    FSpectrum.SetBarColor(FBarColor);
end;

procedure TFBASSPlayer.BarWidth(FWidth: Single);
begin
  FBarWidth := FWidth;

  if Assigned(FSpectrum) then
    FSpectrum.SetBarWidth(FWidth);
end;

procedure TFBASSPlayer.BarSpacing(FSpace: Single);
begin
  FBarSpacing := FSpace;

  if Assigned(FSpectrum) then
    FSpectrum.SetBarSpacing(FSpace);
end;

procedure TFBASSPlayer.BarRadius(FRadius: Single);
begin
  FBarRadius := FRadius;

  if Assigned(FSpectrum) then
    FSpectrum.SetBarRadius(FRadius);
end;

// =============================================================================
// Exports
// =============================================================================
function InitBASSPlayer: FBASSPlayer;
begin
  Result := TFBASSPlayer.Create;
end;

exports
  InitBASSPlayer;

end.
