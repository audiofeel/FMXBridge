unit FMXBridge.AudioPlayer;

interface

uses
  System.SysUtils, System.Classes, System.SyncObjs,
  System.UITypes, System.Generics.Collections,
  FMX.Controls, FMX.Types,
  FMXAudio.Types, FMXAudio.Sources,
  FMXAudio.Sources.MP3, FMXAudio.Audio.PCM;

// =============================================================================
// FAudioPlayer and spectrum implementation
// =============================================================================
type
  TSpectrumSnapshot = record
    SamplePosition: Int64;
    Levels: TArray<Byte>;
  end;

  TAudioSpectrumAnalyzer = class
  private
    FLock: TCriticalSection;

    FWorkLock: TCriticalSection;
    FEnabled: Boolean;
    FBandCount: Integer;
    FConfigVersion: Cardinal;
    FPlayheadSample: Int64;

    FSampleRate: Integer;
    FInputRing: TArray<Single>;
    FWindow: TArray<Double>;
    FFFTReal: TArray<Double>;
    FFFTImag: TArray<Double>;
    FSmoothedLevels: TArray<Single>;
    FInputWrite: Integer;
    FInputCount: Integer;
    FSamplesSinceFFT: Integer;
    FWorkConfigVersion: Cardinal;
    FWorkEnabled: Boolean;
    FWorkBandCount: Integer;

    FHistory: array [0 .. 63] of TSpectrumSnapshot;
    FHistoryWrite: Integer;
    FHistoryCount: Integer;
    FOnUpdate: TNotifyEvent;

    procedure ClearHistoryLocked;
    procedure AllocateWorkBuffers;
    procedure ReleaseWorkBuffers;
    procedure ResetWorkState;
    procedure ReadConfiguration(out Enabled: Boolean; out BandCount: Integer;
      out ConfigVersion: Cardinal);
    procedure Calculate(BandCount: Integer; out Levels: TArray<Byte>);
    procedure FFT;
    procedure PublishSnapshot(SamplePosition: Int64; const Levels: TArray<Byte>;
      ConfigVersion: Cardinal);
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetEnabled(Value: Boolean);
    function GetEnabled: Boolean;
    procedure SetBandCount(Count: Integer);
    function GetBandCount: Integer;
    function GetBandLevel(Index: Integer): Integer;
    function GetLevelsSnapshot: TArray<Byte>;
    procedure PushSamples(const Samples: TArray<SmallInt>;
      Channels, SampleRate: Integer; StartSamplePosition: Int64);
    procedure SetPlayheadSample(SamplePosition: Int64);
    procedure Reset;
    property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  end;

  TSpectrumBarStyle = (sbsSquare, sbsRounded, sbsSegmented);

  TAudioSpectrumView = class(TControl)
  private
    FAnalyzer: TAudioSpectrumAnalyzer;
    FRequestedActive: Boolean;
    FDisplayLevels: TArray<Single>;
    FBarWidth: Single;
    FBarSpacing: Single;
    FBarRadius: Single;
    FBarStyle: TSpectrumBarStyle;
    FFirstColor: TAlphaColor;
    FLastColor: TAlphaColor;
    FCustomColors: array [0 .. 127] of TAlphaColor;
    FHasCustomColor: array [0 .. 127] of Boolean;
    FOnDestroyed: TNotifyEvent;
    procedure SetBarWidth(Value: Single);
    procedure SetBarSpacing(Value: Single);
    procedure SetBarRadius(Value: Single);
    procedure SetBarStyle(Value: TSpectrumBarStyle);
    procedure SetFirstColor(Value: TAlphaColor);
    procedure SetLastColor(Value: TAlphaColor);
    function BandColor(Index, Count: Integer): TAlphaColor;
    procedure ResizeDisplayLevels(Count: Integer);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent; Analyzer: TAudioSpectrumAnalyzer);
      reintroduce;
    destructor Destroy; override;
    procedure SetActive(Value: Boolean);
    procedure RefreshSpectrum;
    procedure SetBandColor(Index: Integer; Color: TAlphaColor);
    property OnDestroyed: TNotifyEvent read FOnDestroyed write FOnDestroyed;
  published
    property BarWidth: Single read FBarWidth write SetBarWidth;
    property BarSpacing: Single read FBarSpacing write SetBarSpacing;
    property BarRadius: Single read FBarRadius write SetBarRadius;
    property BarStyle: TSpectrumBarStyle read FBarStyle write SetBarStyle;
    property FirstColor: TAlphaColor read FFirstColor write SetFirstColor;
    property LastColor: TAlphaColor read FLastColor write SetLastColor;
  end;

  FAudioSpectrum = interface(IUnknown)
    ['{D7520A34-61CB-4310-B1AF-8E3ABBA8D91C}']
    procedure SetEnabled(Value: Boolean); stdcall;
    function GetEnabled: Boolean; stdcall;
    procedure SetBandCount(Count: Integer); stdcall;
    function GetBandCount: Integer; stdcall;
    function GetBandLevel(Index: Integer): Integer; stdcall;
    procedure CreateView(Parent: TFmxObject;
      Left, Top, Width, Height: Single); stdcall;
    procedure SetViewActive(Value: Boolean); stdcall;
    procedure SetViewBarWidth(Value: Single); stdcall;
    procedure SetViewBarSpacing(Value: Single); stdcall;
    procedure SetViewBarRadius(Value: Single); stdcall;
    procedure SetViewBarStyle(FStyle: TSpectrumBarStyle); stdcall;
    procedure SetViewColors(FirstColor, LastColor: TAlphaColor); stdcall;
    procedure SetViewBandColor(Index: Integer; Color: TAlphaColor); stdcall;
  end;

  FAudioPlayer = interface(IUnknown)
    ['{C25A7AE4-56FA-4A92-B7A1-6A4E5C1D6E8B}']
    procedure OpenFile(const FileName: WideString;
      AutoPlay, Loop: Boolean); stdcall;
    procedure OpenFolder(const FolderName: WideString;
      AutoPlay, Loop: Boolean); stdcall;
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Resume; stdcall;
    procedure Stop; stdcall;
    procedure Next; stdcall;
    procedure Previous; stdcall;
    procedure ShutDown; stdcall;
    procedure Volume(Value: Single); stdcall;
    function IsPlaying: Boolean; stdcall;
    function IsPaused: Boolean; stdcall;
    function GetState: Integer; stdcall;
    function GetPositionMs: Integer; stdcall;
    function GetDurationMs: Integer; stdcall;
    function GetOpening: Boolean; stdcall;
    function GetCurrentFile: WideString; stdcall;
    function GetErrorText: WideString; stdcall;
  end;

  TAudioPlayerCommandKind = (pcOpenFile, pcOpenFolder, pcPlay, pcPause,
    pcResume, pcStop, pcNext, pcPrevious);

  TAudioPlayerCommand = record
    Kind: TAudioPlayerCommandKind;
    FileName: string;
    Flag: Boolean;
    Loop: Boolean;
  end;

  TFAudioPlayer = class(TInterfacedObject, FAudioPlayer, FAudioSpectrum)
  private
    FLock: TCriticalSection;
    FWake: TEvent;
    FCommands: TQueue<TAudioPlayerCommand>;
    FWorker: TThread;
    FShutDown: Boolean;
    FOpening: Boolean;
    FState: TPlayerState;
    FCurrentFile: string;
    FLastError: string;
    FPositionMs: Int64;
    FDurationMs: Int64;
    FVolume: Single;
    FSpectrum: TAudioSpectrumAnalyzer;
    FSpectrumView: TAudioSpectrumView;
    FViewActive: Boolean;
    FSpectrumRefreshQueued: Integer;
    procedure SpectrumViewDestroyed(Sender: TObject);
    procedure SpectrumSnapshotReady(Sender: TObject);
    procedure QueueSpectrumRefresh;
    procedure FeedSpectrum(const Samples: TArray<SmallInt>;
      Channels, SampleRate: Integer; StartSamplePosition: Int64);
    procedure SetSpectrumPlayhead(SamplePosition: Int64);
    procedure ResetSpectrum;
    function QueueCommand(const Command: TAudioPlayerCommand): Boolean;
    function PopCommand(out Command: TAudioPlayerCommand): Boolean;
    function ReadVolume: Single;
    procedure PublishOpenStarted(const FileName: string);
    procedure PublishOpened(DurationUs: Int64; AutoPlay: Boolean);
    procedure PublishPosition(PositionMs: Int64);
    procedure PublishProgress(PositionMs: Int64);
    procedure PublishState(AState: TPlayerState);
    procedure PublishError(E: Exception);
    procedure SetLastError(const Value: string);
    function ReadState: TPlayerState;
  public
    constructor Create;
    destructor Destroy; override;

    procedure OpenFile(const FileName: WideString;
      AutoPlay, Loop: Boolean); stdcall;
    procedure OpenFolder(const FolderName: WideString;
      AutoPlay, Loop: Boolean); stdcall;
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Resume; stdcall;
    procedure Stop; stdcall;
    procedure Next; stdcall;
    procedure Previous; stdcall;
    procedure ShutDown; stdcall;
    procedure Volume(Value: Single); stdcall;
    function IsPlaying: Boolean; stdcall;
    function IsPaused: Boolean; stdcall;
    function GetState: Integer; stdcall;
    function GetPositionMs: Integer; stdcall;
    function GetDurationMs: Integer; stdcall;
    function GetOpening: Boolean; stdcall;
    function GetCurrentFile: WideString; stdcall;
    function GetErrorText: WideString; stdcall;

    procedure SetEnabled(Value: Boolean); stdcall;
    function GetEnabled: Boolean; stdcall;
    procedure SetBandCount(Count: Integer); stdcall;
    function GetBandCount: Integer; stdcall;
    function GetBandLevel(Index: Integer): Integer; stdcall;
    procedure CreateView(Parent: TFmxObject;
      Left, Top, Width, Height: Single); stdcall;
    procedure SetViewActive(Value: Boolean); stdcall;
    procedure SetViewBarWidth(Value: Single); stdcall;
    procedure SetViewBarSpacing(Value: Single); stdcall;
    procedure SetViewBarRadius(Value: Single); stdcall;
    procedure SetViewBarStyle(FStyle: TSpectrumBarStyle); stdcall;
    procedure SetViewColors(FirstColor, LastColor: TAlphaColor); stdcall;
    procedure SetViewBandColor(Index: Integer; Color: TAlphaColor); stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitAudioPlayer: FAudioPlayer; stdcall;
function InitAudioPlayerSpectrum(const Player: FAudioPlayer)
  : FAudioSpectrum; stdcall;

implementation

uses
  Winapi.Windows,
  System.Math, System.Types,
  FMX.Graphics;

type
  TAudioWorker = class(TThread)
  private
    FOwner: TFAudioPlayer;
    procedure ProcessCommand(const Command: TAudioPlayerCommand;
      var Stream: TFileStream; var Source: IAudioSource;
      var Output: TPCMAudioOutput; var Pending: TAudioFrame;
      var Playlist: TStringList; var PlaylistIndex: Integer;
      var PlaylistMode: Boolean; var HasPending, Playing, SourceEOF,
      OutputFlushed, LoopEnabled: Boolean; var SampleRate, Channels: Integer;
      var BaseSamplePosition: Int64);
    procedure LoadTrack(const FileName: string; AutoPlay: Boolean;
      var Stream: TFileStream; var Source: IAudioSource;
      var Output: TPCMAudioOutput; var Pending: TAudioFrame;
      var HasPending, Playing, SourceEOF, OutputFlushed: Boolean;
      var SampleRate, Channels: Integer; var BaseSamplePosition: Int64);
    procedure UpdateProgress(Output: TPCMAudioOutput; SampleRate: Integer;
      BaseSamplePosition: Int64);
    procedure ResetSource(var Stream: TFileStream; var Source: IAudioSource;
      var Output: TPCMAudioOutput; var Pending: TAudioFrame;
      var HasPending: Boolean);
    procedure MarkWorkerError(E: Exception; var Output: TPCMAudioOutput;
      var Playing: Boolean);
  protected
    procedure Execute; override;
  public
    constructor Create(AOwner: TFAudioPlayer);
  end;

const
  SpectrumFFTSize = 4096;
  SpectrumFFTBinCount = SpectrumFFTSize div 2;
  SpectrumHopSize = 1024;
  SpectrumHistorySize = 64;
  SpectrumMinBandCount = 4;
  SpectrumMaxBandCount = 128;
  SpectrumMinHz = 40.0;
  SpectrumMaxHz = 16000.0;
  SpectrumFloorDB = -60.0;

constructor TAudioSpectrumAnalyzer.Create;
var
  I: Integer;
begin
  inherited Create;
  FLock := TCriticalSection.Create;
  FWorkLock := TCriticalSection.Create;
  FEnabled := False;
  FBandCount := 16;
  FConfigVersion := 1;
  FPlayheadSample := 0;
  FSampleRate := 0;
  FInputWrite := 0;
  FInputCount := 0;
  FSamplesSinceFFT := 0;
  FWorkConfigVersion := 0;
  FWorkEnabled := False;
  FWorkBandCount := FBandCount;
  FHistoryWrite := 0;
  FHistoryCount := 0;
  for I := 0 to High(FHistory) do
  begin
    FHistory[I].SamplePosition := -1;
    FHistory[I].Levels := nil;
  end;
end;

destructor TAudioSpectrumAnalyzer.Destroy;
begin
  FWorkLock.Acquire;
  try
    ReleaseWorkBuffers;
  finally
    FWorkLock.Release;
  end;
  FWorkLock.Free;
  FLock.Free;
  inherited Destroy;
end;

procedure TAudioSpectrumAnalyzer.ClearHistoryLocked;
var
  I: Integer;
begin
  FHistoryWrite := 0;
  FHistoryCount := 0;
  FPlayheadSample := 0;
  for I := 0 to High(FHistory) do
  begin
    FHistory[I].SamplePosition := -1;
    FHistory[I].Levels := nil;
  end;
end;

procedure TAudioSpectrumAnalyzer.AllocateWorkBuffers;
var
  I: Integer;
begin
  if Length(FInputRing) <> SpectrumFFTSize then
    SetLength(FInputRing, SpectrumFFTSize);
  if Length(FWindow) <> SpectrumFFTSize then
  begin
    SetLength(FWindow, SpectrumFFTSize);
    for I := 0 to SpectrumFFTSize - 1 do
      FWindow[I] := 0.5 - 0.5 * Cos(2.0 * Pi * I / (SpectrumFFTSize - 1));
  end;
  if Length(FFFTReal) <> SpectrumFFTSize then
    SetLength(FFFTReal, SpectrumFFTSize);
  if Length(FFFTImag) <> SpectrumFFTSize then
    SetLength(FFFTImag, SpectrumFFTSize);
  if Length(FSmoothedLevels) <> FWorkBandCount then
    SetLength(FSmoothedLevels, FWorkBandCount);
end;

procedure TAudioSpectrumAnalyzer.ReleaseWorkBuffers;
begin
  SetLength(FInputRing, 0);
  SetLength(FWindow, 0);
  SetLength(FFFTReal, 0);
  SetLength(FFFTImag, 0);
  SetLength(FSmoothedLevels, 0);
  FSampleRate := 0;
  FInputWrite := 0;
  FInputCount := 0;
  FSamplesSinceFFT := 0;
end;

procedure TAudioSpectrumAnalyzer.ResetWorkState;
var
  I: Integer;
begin
  FInputWrite := 0;
  FInputCount := 0;
  FSamplesSinceFFT := 0;
  FSampleRate := 0;
  for I := 0 to High(FInputRing) do
    FInputRing[I] := 0;
  for I := 0 to High(FSmoothedLevels) do
    FSmoothedLevels[I] := 0;
end;

procedure TAudioSpectrumAnalyzer.ReadConfiguration(out Enabled: Boolean;
  out BandCount: Integer; out ConfigVersion: Cardinal);
begin
  FLock.Acquire;
  try
    Enabled := FEnabled;
    BandCount := FBandCount;
    ConfigVersion := FConfigVersion;
  finally
    FLock.Release;
  end;
end;

procedure TAudioSpectrumAnalyzer.SetEnabled(Value: Boolean);
begin
  FLock.Acquire;
  try
    if FEnabled = Value then
      Exit;
    FEnabled := Value;
    Inc(FConfigVersion);
    ClearHistoryLocked;
  finally
    FLock.Release;
  end;
end;

function TAudioSpectrumAnalyzer.GetEnabled: Boolean;
begin
  FLock.Acquire;
  try
    Result := FEnabled;
  finally
    FLock.Release;
  end;
end;

procedure TAudioSpectrumAnalyzer.SetBandCount(Count: Integer);
begin
  Count := EnsureRange(Count, SpectrumMinBandCount, SpectrumMaxBandCount);
  FLock.Acquire;
  try
    if FBandCount = Count then
      Exit;
    FBandCount := Count;
    Inc(FConfigVersion);
    ClearHistoryLocked;
  finally
    FLock.Release;
  end;
end;

function TAudioSpectrumAnalyzer.GetBandCount: Integer;
begin
  FLock.Acquire;
  try
    Result := FBandCount;
  finally
    FLock.Release;
  end;
end;

function TAudioSpectrumAnalyzer.GetLevelsSnapshot: TArray<Byte>;
var
  I, Idx, BestIdx: Integer;
  BestPosition: Int64;
begin
  Result := nil;
  FLock.Acquire;
  try
    if not FEnabled or (FHistoryCount = 0) then
      Exit;

    BestIdx := -1;
    BestPosition := Low(Int64);
    for I := 0 to FHistoryCount - 1 do
    begin
      Idx := (FHistoryWrite - FHistoryCount + I + SpectrumHistorySize)
        mod SpectrumHistorySize;
      if (FHistory[Idx].SamplePosition <= FPlayheadSample) and
        (FHistory[Idx].SamplePosition >= BestPosition) then
      begin
        BestPosition := FHistory[Idx].SamplePosition;
        BestIdx := Idx;
      end;
    end;

    if BestIdx >= 0 then
      Result := FHistory[BestIdx].Levels;
  finally
    FLock.Release;
  end;
end;

function TAudioSpectrumAnalyzer.GetBandLevel(Index: Integer): Integer;
var
  Levels: TArray<Byte>;
begin
  Result := 0;
  Levels := GetLevelsSnapshot;
  if (Index >= 0) and (Index < Length(Levels)) then
    Result := Levels[Index];
end;

procedure TAudioSpectrumAnalyzer.SetPlayheadSample(SamplePosition: Int64);
begin
  if SamplePosition < 0 then
    SamplePosition := 0;
  FLock.Acquire;
  try
    FPlayheadSample := SamplePosition;
  finally
    FLock.Release;
  end;
end;

procedure TAudioSpectrumAnalyzer.Reset;
begin
  FLock.Acquire;
  try
    Inc(FConfigVersion);
    ClearHistoryLocked;
  finally
    FLock.Release;
  end;
end;

procedure TAudioSpectrumAnalyzer.PushSamples(const Samples: TArray<SmallInt>;
  Channels, SampleRate: Integer; StartSamplePosition: Int64);
var
  FrameCount, FrameIndex, SampleIndex: Integer;
  Mono: Single;
  CurrentSamplePosition: Int64;
  Enabled: Boolean;
  BandCount: Integer;
  ConfigVersion: Cardinal;
  Levels: TArray<Byte>;
begin
  if (Channels < 1) or (Channels > 2) or (SampleRate <= 0) or
    (Length(Samples) < Channels) then
    Exit;

  FWorkLock.Acquire;
  try
    ReadConfiguration(Enabled, BandCount, ConfigVersion);

    if ConfigVersion <> FWorkConfigVersion then
    begin
      FWorkConfigVersion := ConfigVersion;
      FWorkEnabled := Enabled;
      FWorkBandCount := BandCount;
      ResetWorkState;
      if FWorkEnabled then
        AllocateWorkBuffers
      else
        ReleaseWorkBuffers;
    end;

    if not Enabled then
      Exit;

    if Length(FInputRing) <> SpectrumFFTSize then
      AllocateWorkBuffers;

    if (FSampleRate <> 0) and (FSampleRate <> SampleRate) then
    begin
      ResetWorkState;
      FLock.Acquire;
      try
        ClearHistoryLocked;
      finally
        FLock.Release;
      end;
    end;
    FSampleRate := SampleRate;

    FrameCount := Length(Samples) div Channels;
    for FrameIndex := 0 to FrameCount - 1 do
    begin
      SampleIndex := FrameIndex * Channels;
      if Channels = 1 then
        Mono := Samples[SampleIndex] / 32768.0
      else
        Mono := (Samples[SampleIndex] + Samples[SampleIndex + 1]) /
          (2.0 * 32768.0);

      FInputRing[FInputWrite] := Mono;
      Inc(FInputWrite);
      if FInputWrite >= SpectrumFFTSize then
        FInputWrite := 0;
      if FInputCount < SpectrumFFTSize then
        Inc(FInputCount);
      Inc(FSamplesSinceFFT);

      if (FInputCount = SpectrumFFTSize) and
        (FSamplesSinceFFT >= SpectrumHopSize) then
      begin
        CurrentSamplePosition := StartSamplePosition + FrameIndex;
        Calculate(BandCount, Levels);
        FSamplesSinceFFT := 0;
        PublishSnapshot(CurrentSamplePosition, Levels, ConfigVersion);
      end;
    end;
  finally
    FWorkLock.Release;
  end;
end;

procedure TAudioSpectrumAnalyzer.FFT;
var
  I, J, M, MMax, IStep: Integer;
  Theta, WTemp, WPr, WPi, WR, WI, TempR, TempI, Temp: Double;
begin
  J := 0;
  for I := 1 to SpectrumFFTSize - 1 do
  begin
    M := SpectrumFFTSize shr 1;
    while (M >= 1) and (J >= M) do
    begin
      Dec(J, M);
      M := M shr 1;
    end;
    Inc(J, M);

    if I < J then
    begin
      TempR := FFFTReal[I];
      FFFTReal[I] := FFFTReal[J];
      FFFTReal[J] := TempR;
      TempI := FFFTImag[I];
      FFFTImag[I] := FFFTImag[J];
      FFFTImag[J] := TempI;
    end;
  end;

  MMax := 1;
  while SpectrumFFTSize > MMax do
  begin
    IStep := MMax shl 1;
    Theta := -2.0 * Pi / IStep;
    WTemp := Sin(Theta / 2.0);
    WPr := -2.0 * WTemp * WTemp;
    WPi := Sin(Theta);
    WR := 1.0;
    WI := 0.0;

    for M := 0 to MMax - 1 do
    begin
      I := M;
      while I < SpectrumFFTSize do
      begin
        J := I + MMax;
        TempR := WR * FFFTReal[J] - WI * FFFTImag[J];
        TempI := WR * FFFTImag[J] + WI * FFFTReal[J];
        FFFTReal[J] := FFFTReal[I] - TempR;
        FFFTImag[J] := FFFTImag[I] - TempI;
        FFFTReal[I] := FFFTReal[I] + TempR;
        FFFTImag[I] := FFFTImag[I] + TempI;
        Inc(I, IStep);
      end;

      Temp := WR;
      WR := WR * WPr - WI * WPi + WR;
      WI := WI * WPr + Temp * WPi + WI;
    end;
    MMax := IStep;
  end;
end;

procedure TAudioSpectrumAnalyzer.Calculate(BandCount: Integer;
  out Levels: TArray<Byte>);
var
  I, BandIndex, StartBin, EndBin, BinIndex: Integer;
  DataIndex: Integer;
  LowHz, HighHz, NyquistHz: Double;
  Peak, Magnitude, DB, Target, Current: Double;
begin
  Levels := nil;
  if not FWorkEnabled or (Length(FInputRing) <> SpectrumFFTSize) or
    (Length(FFFTReal) <> SpectrumFFTSize) or (FSampleRate <= 0) or
    (BandCount <= 0) then
    Exit;

  for I := 0 to SpectrumFFTSize - 1 do
  begin
    DataIndex := (FInputWrite + I) mod SpectrumFFTSize;
    FFFTReal[I] := FInputRing[DataIndex] * FWindow[I];
    FFFTImag[I] := 0.0;
  end;

  FFT;
  NyquistHz := Min(SpectrumMaxHz, FSampleRate * 0.5 * 0.98);
  if NyquistHz <= SpectrumMinHz then
    Exit;

  if Length(FSmoothedLevels) <> BandCount then
    SetLength(FSmoothedLevels, BandCount);
  SetLength(Levels, BandCount);

  for BandIndex := 0 to BandCount - 1 do
  begin
    LowHz := SpectrumMinHz * Power(NyquistHz / SpectrumMinHz,
      BandIndex / BandCount);
    HighHz := SpectrumMinHz * Power(NyquistHz / SpectrumMinHz,
      (BandIndex + 1) / BandCount);

    StartBin := EnsureRange(Integer(Floor(LowHz * SpectrumFFTSize / FSampleRate)
      ), 1, SpectrumFFTBinCount - 1);
    EndBin := EnsureRange(Integer(Ceil(HighHz * SpectrumFFTSize / FSampleRate)),
      StartBin, SpectrumFFTBinCount - 1);

    Peak := 0.0;
    for BinIndex := StartBin to EndBin do
    begin
      Magnitude := Sqrt(Sqr(FFFTReal[BinIndex]) + Sqr(FFFTImag[BinIndex])) *
        (4.0 / SpectrumFFTSize);
      if Magnitude > Peak then
        Peak := Magnitude;
    end;

    if Peak > 0.0 then
      DB := 20.0 * Log10(Peak)
    else
      DB := SpectrumFloorDB;
    if DB < SpectrumFloorDB then
      DB := SpectrumFloorDB;
    if DB > 0.0 then
      DB := 0.0;

    Target := (DB - SpectrumFloorDB) * (100.0 / -SpectrumFloorDB);
    Current := FSmoothedLevels[BandIndex];
    if Target > Current then
      Current := Current + (Target - Current) * 0.62
    else
      Current := Current + (Target - Current) * 0.20;
    FSmoothedLevels[BandIndex] := EnsureRange(Current, 0.0, 100.0);
    Levels[BandIndex] := Byte(Round(FSmoothedLevels[BandIndex]));
  end;
end;

procedure TAudioSpectrumAnalyzer.PublishSnapshot(SamplePosition: Int64;
  const Levels: TArray<Byte>; ConfigVersion: Cardinal);
var
  SnapshotIndex: Integer;
Published
  : Boolean;
  begin
  if Length(Levels) = 0 then Exit;

Published
  := False;
  FLock.Acquire;
  try
  if FEnabled and (FConfigVersion = ConfigVersion) and
    (FBandCount = Length(Levels)) then
  begin SnapshotIndex := FHistoryWrite;
  FHistory[SnapshotIndex].SamplePosition := SamplePosition;
  FHistory[SnapshotIndex].Levels := Levels;
  Inc(FHistoryWrite);
  if FHistoryWrite >= SpectrumHistorySize then FHistoryWrite := 0;
  if FHistoryCount < SpectrumHistorySize then Inc(FHistoryCount);
Published
  := True;
  end;
  finally FLock.Release;
  end;

  if Published and Assigned(FOnUpdate) then FOnUpdate(Self);
  end;

  function BlendSpectrumColor(A, B: TAlphaColor; Amount: Single): TAlphaColor;
var
  AAlpha, ARed, AGreen, ABlue: Integer;
  BAlpha, BRed, BGreen, BBlue: Integer;
  Alpha, Red, Green, Blue: Integer;
begin
  Amount := EnsureRange(Amount, 0.0, 1.0);
  AAlpha := (A shr 24) and $FF;
  ARed := (A shr 16) and $FF;
  AGreen := (A shr 8) and $FF;
  ABlue := A and $FF;
  BAlpha := (B shr 24) and $FF;
  BRed := (B shr 16) and $FF;
  BGreen := (B shr 8) and $FF;
  BBlue := B and $FF;
  Alpha := Round(AAlpha + (BAlpha - AAlpha) * Amount);
  Red := Round(ARed + (BRed - ARed) * Amount);
  Green := Round(AGreen + (BGreen - AGreen) * Amount);
  Blue := Round(ABlue + (BBlue - ABlue) * Amount);
  Result := TAlphaColor((Alpha shl 24) or (Red shl 16) or (Green shl 8)
    or Blue);
end;

constructor TAudioSpectrumView.Create(AOwner: TComponent;
  Analyzer: TAudioSpectrumAnalyzer);
begin
  inherited Create(AOwner);
  FAnalyzer := Analyzer;
  FRequestedActive := False;
  FBarWidth := 2.0;
  FBarSpacing := 1.0;
  FBarRadius := 0.0;
  FBarStyle := sbsSquare;
  FFirstColor := TAlphaColor($FFDA8740);
  FLastColor := TAlphaColor($FF58B8BF);
  Width := 86;
  Height := 51;
  HitTest := False;
  CanFocus := False;
end;

destructor TAudioSpectrumView.Destroy;
begin
  FAnalyzer := nil;
  if Assigned(FOnDestroyed) then
    FOnDestroyed(Self);
  FOnDestroyed := nil;
  inherited Destroy;
end;

procedure TAudioSpectrumView.ResizeDisplayLevels(Count: Integer);
begin
  if Count < 0 then
    Count := 0;
  if Length(FDisplayLevels) <> Count then
  begin
    SetLength(FDisplayLevels, Count);
    if Count > 0 then
      FillChar(FDisplayLevels[0], Count * SizeOf(Single), 0);
  end;
end;

procedure TAudioSpectrumView.SetActive(Value: Boolean);
begin
  if FRequestedActive = Value then
  begin
    if Value then
      RefreshSpectrum;
    Exit;
  end;

  FRequestedActive := Value;
  if Value then
    RefreshSpectrum;
end;

procedure TAudioSpectrumView.RefreshSpectrum;
var
  Levels: TArray<Byte>;
  I, Count: Integer;
  Changed: Boolean;
begin
  if not FRequestedActive or (FAnalyzer = nil) then
    Exit;

  Levels := FAnalyzer.GetLevelsSnapshot;
  Count := Length(Levels);
  Changed := Count <> Length(FDisplayLevels);
  if not Changed then
    for I := 0 to Count - 1 do
      if FDisplayLevels[I] <> Levels[I] then
      begin
        Changed := True;
        Break;
      end;

  if not Changed then
    Exit;

  ResizeDisplayLevels(Count);
  for I := 0 to Count - 1 do
    FDisplayLevels[I] := Levels[I];
  Repaint;
end;

procedure TAudioSpectrumView.SetBarWidth(Value: Single);
begin
  if Value < 0.5 then
    Value := 0.5;
  if SameValue(FBarWidth, Value, 0.01) then
    Exit;
  FBarWidth := Value;
  Repaint;
end;

procedure TAudioSpectrumView.SetBarSpacing(Value: Single);
begin
  if Value < 0 then
    Value := 0;
  if SameValue(FBarSpacing, Value, 0.01) then
    Exit;
  FBarSpacing := Value;
  Repaint;
end;

procedure TAudioSpectrumView.SetBarRadius(Value: Single);
begin
  if Value < 0 then
    Value := 0;
  if SameValue(FBarRadius, Value, 0.01) then
    Exit;
  FBarRadius := Value;
  Repaint;
end;

procedure TAudioSpectrumView.SetBarStyle(Value: TSpectrumBarStyle);
begin
  if FBarStyle = Value then
    Exit;
  FBarStyle := Value;
  Repaint;
end;

procedure TAudioSpectrumView.SetFirstColor(Value: TAlphaColor);
begin
  if FFirstColor = Value then
    Exit;
  FFirstColor := Value;
  Repaint;
end;

procedure TAudioSpectrumView.SetLastColor(Value: TAlphaColor);
begin
  if FLastColor = Value then
    Exit;
  FLastColor := Value;
  Repaint;
end;

procedure TAudioSpectrumView.SetBandColor(Index: Integer; Color: TAlphaColor);
begin
  if (Index < 0) or (Index > High(FCustomColors)) then
    Exit;
  if FHasCustomColor[Index] and (FCustomColors[Index] = Color) then
    Exit;
  FCustomColors[Index] := Color;
  FHasCustomColor[Index] := True;
  Repaint;
end;

function TAudioSpectrumView.BandColor(Index, Count: Integer): TAlphaColor;
begin
  if (Index >= 0) and (Index <= High(FCustomColors)) and FHasCustomColor[Index]
  then
    Exit(FCustomColors[Index]);
  if Count <= 1 then
    Result := FFirstColor
  else
    Result := BlendSpectrumColor(FFirstColor, FLastColor, Index / (Count - 1));
end;

procedure TAudioSpectrumView.Paint;
var
  I, J, Count: Integer;
  TotalWidth, X, BarWidth, Gap: Single;
  BarHeight, Level: Single;
  R: TRectF;
  Radius, SegmentHeight, SegmentGap, Y: Single;
  BarColorValue: TAlphaColor;
begin
  inherited Paint;
  if (Width <= 0) or (Height <= 0) or (FAnalyzer = nil) then
    Exit;
  Count := Length(FDisplayLevels);
  if Count = 0 then
    Exit;

  BarWidth := FBarWidth;
  Gap := FBarSpacing;
  TotalWidth := Count * BarWidth + Max(0, Count - 1) * Gap;
  if TotalWidth > Width then
  begin
    Gap := 0;
    BarWidth := Width / Count;
    TotalWidth := Width;
  end;
  X := (Width - TotalWidth) * 0.5;

  for I := 0 to Count - 1 do
  begin
    Level := EnsureRange(FDisplayLevels[I] / 100.0, 0.0, 1.0);
    BarHeight := Max(1.0, Height * Level);
    BarColorValue := BandColor(I, Count);
    Canvas.Fill.Color := BarColorValue;
    case FBarStyle of
      sbsSquare:
        Radius := 0;
      sbsRounded, sbsSegmented:
        Radius := Min(FBarRadius, BarWidth * 0.5);
    else
      Radius := 0;
    end;

    if FBarStyle = sbsSegmented then
    begin
      SegmentHeight := 3.0;
      SegmentGap := 2.0;
      J := 0;
      Y := Height;
      while (Y > Height - BarHeight) and (J < 64) do
      begin
        R := TRectF.Create(X, Max(0.0, Y - SegmentHeight), X + BarWidth, Y);
        R := Canvas.AlignToPixel(R);
        Canvas.FillRect(R, Radius, Radius, AllCorners, AbsoluteOpacity,
          TCornerType.Round);
        Y := Y - SegmentHeight - SegmentGap;
        Inc(J);
      end;
    end
    else
    begin
      R := TRectF.Create(X, Height - BarHeight, X + BarWidth, Height);
      R := Canvas.AlignToPixel(R);
      Canvas.FillRect(R, Radius, Radius, AllCorners, AbsoluteOpacity,
        TCornerType.Round);
    end;
    X := X + BarWidth + Gap;
  end;
end;

procedure CollectAudioFiles(const Folder: string; Files: TStringList);
var
  Search: TSearchRec;
  SearchResult: Integer;
  FullName: string;
  Attributes: DWORD;
begin
  SearchResult := System.SysUtils.FindFirst(IncludeTrailingPathDelimiter(Folder)
    + '*', faAnyFile, Search);
  if SearchResult <> 0 then
    Exit;

  try
    repeat
      if (Search.Name <> '.') and (Search.Name <> '..') then
      begin
        FullName := IncludeTrailingPathDelimiter(Folder) + Search.Name;

        if (Search.Attr and faDirectory) <> 0 then
        begin
          Attributes := Winapi.Windows.GetFileAttributes(PChar(FullName));

          if (Attributes <> INVALID_FILE_ATTRIBUTES) and
            ((Attributes and FILE_ATTRIBUTE_REPARSE_POINT) = 0) then
            CollectAudioFiles(FullName, Files);
        end
        else if SameText(ExtractFileExt(Search.Name), '.mp3') then
          Files.Add(FullName);
      end;

      SearchResult := System.SysUtils.FindNext(Search);
    until SearchResult <> 0;
  finally
    System.SysUtils.FindClose(Search);
  end;
end;

// =============================================================================
// TFAudioPlayer
// =============================================================================
constructor TFAudioPlayer.Create;
begin
  inherited Create;

  FLock := TCriticalSection.Create;
  FWake := TEvent.Create(nil, False, False, '');
  FCommands := TQueue<TAudioPlayerCommand>.Create;
  FState := TPlayerState.Closed;
  FVolume := 0.95;
  FSpectrum := TAudioSpectrumAnalyzer.Create;
  FSpectrum.OnUpdate := SpectrumSnapshotReady;
  FSpectrumView := nil;
  FViewActive := False;
  FSpectrumRefreshQueued := 0;
  FWorker := TAudioWorker.Create(Self);
  FWorker.Start;
end;

destructor TFAudioPlayer.Destroy;
begin
  ShutDown;
  if FSpectrumView <> nil then
  begin
    FSpectrumView.OnDestroyed := nil;
    FreeAndNil(FSpectrumView);
  end;
  if FSpectrum <> nil then
    FSpectrum.OnUpdate := nil;
  FreeAndNil(FSpectrum);
  FCommands.Free;
  FWake.Free;
  FLock.Free;

  inherited Destroy;
end;

procedure TFAudioPlayer.ShutDown;
var
  Worker: TThread;
begin
  FLock.Acquire;
  try
    if FShutDown then
      Exit;

    FShutDown := True;
    FOpening := False;
    FState := TPlayerState.Closed;
    FLastError := 'Audio player is shut down';
    FCommands.Clear;
    Worker := FWorker;
  finally
    FLock.Release;
  end;
  if Worker <> nil then
  begin
    Worker.Terminate;
    FWake.SetEvent;
    Worker.WaitFor;
    TThread.RemoveQueuedEvents(Worker);
    InterlockedExchange(FSpectrumRefreshQueued, 0);
    FLock.Acquire;
    try
      if FWorker = Worker then
        FWorker := nil;
    finally
      FLock.Release;
    end;
    Worker.Free;
  end;

  if FSpectrumView <> nil then
    FSpectrumView.SetActive(False);
  FViewActive := False;
  if FSpectrum <> nil then
    FSpectrum.SetEnabled(False);
end;

function TFAudioPlayer.QueueCommand(const Command: TAudioPlayerCommand)
  : Boolean;
begin
  Result := False;
  FLock.Acquire;
  try
    if FShutDown then
    begin
      FLastError := 'Audio player is shut down';
      Exit;
    end;

    FLastError := '';
    FCommands.Enqueue(Command);

    if Command.Kind in [pcOpenFile, pcOpenFolder] then
    begin
      FOpening := True;

      if Command.Kind = pcOpenFolder then
        FCurrentFile := ''
      else
        FCurrentFile := Command.FileName;

      FPositionMs := 0;
      FDurationMs := 0;
      FState := TPlayerState.Closed;
    end;
    Result := True;
  finally
    FLock.Release;
  end;
  if Result then
    FWake.SetEvent;
end;

function TFAudioPlayer.PopCommand(out Command: TAudioPlayerCommand): Boolean;
begin
  FLock.Acquire;
  try
    Result := FCommands.Count > 0;
    if Result then
      Command := FCommands.Dequeue;
  finally
    FLock.Release;
  end;
end;

function TFAudioPlayer.ReadVolume: Single;
begin
  FLock.Acquire;
  try
    Result := FVolume;
  finally
    FLock.Release;
  end;
end;

procedure TFAudioPlayer.PublishOpenStarted(const FileName: string);
begin
  FLock.Acquire;
  try
    FCurrentFile := FileName;
    FOpening := True;
    FState := TPlayerState.Closed;
    FPositionMs := 0;
    FDurationMs := 0;
    FLastError := '';
  finally
    FLock.Release;
  end;
end;

procedure TFAudioPlayer.PublishOpened(DurationUs: Int64; AutoPlay: Boolean);
begin
  FLock.Acquire;
  try
    FOpening := False;
    FDurationMs := DurationUs div 1000;
    FPositionMs := 0;

    if AutoPlay then
      FState := TPlayerState.Playing
    else
      FState := TPlayerState.Ready;

    FLastError := '';
  finally
    FLock.Release;
  end;
end;

procedure TFAudioPlayer.PublishPosition(PositionMs: Int64);
begin
  FLock.Acquire;
  try
    if PositionMs < 0 then
      PositionMs := 0;

    if (FDurationMs > 0) and (PositionMs > FDurationMs) then
      PositionMs := FDurationMs;

    FPositionMs := PositionMs;
  finally
    FLock.Release;
  end;
end;

procedure TFAudioPlayer.PublishProgress(PositionMs: Int64);
begin
  PublishPosition(PositionMs);
end;

procedure TFAudioPlayer.PublishState(AState: TPlayerState);
begin
  FLock.Acquire;
  try
    FState := AState;
    FOpening := False;

    if AState = TPlayerState.Ended then
      FPositionMs := FDurationMs;

  finally
    FLock.Release;
  end;
end;

procedure TFAudioPlayer.PublishError(E: Exception);
begin
  FLock.Acquire;
  try
    FOpening := False;

    if E <> nil then
      FLastError := E.ClassName + ': ' + E.Message;

    FState := TPlayerState.Failed;
  finally
    FLock.Release;
  end;
end;

procedure TFAudioPlayer.SetLastError(const Value: string);
begin
  FLock.Acquire;
  try
    FLastError := Value;
  finally
    FLock.Release;
  end;
end;

function TFAudioPlayer.ReadState: TPlayerState;
begin
  FLock.Acquire;
  try
    Result := FState;
  finally
    FLock.Release;
  end;
end;

procedure TFAudioPlayer.OpenFile(const FileName: WideString;
  AutoPlay, Loop: Boolean);
var
  Command: TAudioPlayerCommand;
begin
  if Trim(string(FileName)) = '' then
  begin
    SetLastError('Audio file name is empty');
    Exit;
  end;

  Command := Default (TAudioPlayerCommand);
  Command.Kind := pcOpenFile;
  Command.FileName := string(FileName);
  Command.Flag := AutoPlay;
  Command.Loop := Loop;
  QueueCommand(Command);
end;

procedure TFAudioPlayer.OpenFolder(const FolderName: WideString;
  AutoPlay, Loop: Boolean);
var
  Command: TAudioPlayerCommand;
  Folder: string;
begin
  Folder := Trim(string(FolderName));

  if Folder = '' then
  begin
    SetLastError('Audio folder name is empty');
    Exit;
  end;

  if not DirectoryExists(Folder) then
  begin
    SetLastError('Audio folder does not exist: ' + Folder);
    Exit;
  end;

  Command := Default (TAudioPlayerCommand);
  Command.Kind := pcOpenFolder;
  Command.FileName := Folder;
  Command.Flag := AutoPlay;
  Command.Loop := Loop;
  QueueCommand(Command);
end;

procedure TFAudioPlayer.Play;
var
  Command: TAudioPlayerCommand;
begin
  Command := Default (TAudioPlayerCommand);
  Command.Kind := pcPlay;
  QueueCommand(Command);
end;

procedure TFAudioPlayer.Pause;
var
  Command: TAudioPlayerCommand;
begin
  Command := Default (TAudioPlayerCommand);
  Command.Kind := pcPause;
  QueueCommand(Command);
end;

procedure TFAudioPlayer.Stop;
var
  Command: TAudioPlayerCommand;
begin
  Command := Default (TAudioPlayerCommand);
  Command.Kind := pcStop;
  QueueCommand(Command);
end;

procedure TFAudioPlayer.Resume;
var
  Command: TAudioPlayerCommand;
begin
  Command := Default (TAudioPlayerCommand);
  Command.Kind := pcResume;
  QueueCommand(Command);
end;

procedure TFAudioPlayer.Volume(Value: Single);
begin
  FLock.Acquire;
  try
    if FShutDown then
    begin
      FLastError := 'Audio player is shut down';
      Exit;
    end;
    if IsNan(Value) or IsInfinite(Value) or (Value < 0) or (Value > 1) then
    begin
      FLastError := 'Volume must be in range 0..1';
      Exit;
    end;
    FVolume := Value;
    FLastError := '';
  finally
    FLock.Release;
  end;
end;

function TFAudioPlayer.GetState: Integer;
begin
  FLock.Acquire;
  try
    Result := Ord(FState);
  finally
    FLock.Release;
  end;
end;

function TFAudioPlayer.GetPositionMs: Integer;
begin
  FLock.Acquire;
  try
    Result := Integer(EnsureRange(FPositionMs, Int64(0), Int64(High(Integer))));
  finally
    FLock.Release;
  end;
end;

function TFAudioPlayer.GetDurationMs: Integer;
begin
  FLock.Acquire;
  try
    Result := Integer(EnsureRange(FDurationMs, Int64(0), Int64(High(Integer))));
  finally
    FLock.Release;
  end;
end;

function TFAudioPlayer.GetOpening: Boolean;
begin
  FLock.Acquire;
  try
    Result := FOpening;
  finally
    FLock.Release;
  end;
end;

function TFAudioPlayer.GetCurrentFile: WideString;
begin
  FLock.Acquire;
  try
    Result := FCurrentFile;
  finally
    FLock.Release;
  end;
end;

function TFAudioPlayer.GetErrorText: WideString;
begin
  FLock.Acquire;
  try
    Result := FLastError;
  finally
    FLock.Release;
  end;
end;

procedure TFAudioPlayer.SetEnabled(Value: Boolean);
begin
  if FSpectrum <> nil then
    FSpectrum.SetEnabled(Value);
  if FSpectrumView <> nil then
  begin
    FSpectrumView.RefreshSpectrum;
    FSpectrumView.SetActive(FViewActive);
  end;
end;

function TFAudioPlayer.GetEnabled: Boolean;
begin
  if FSpectrum <> nil then
    Result := FSpectrum.GetEnabled
  else
    Result := False;
end;

procedure TFAudioPlayer.SetBandCount(Count: Integer);
begin
  if FSpectrum <> nil then
    FSpectrum.SetBandCount(Count);
  if FSpectrumView <> nil then
    FSpectrumView.RefreshSpectrum;
end;

function TFAudioPlayer.GetBandCount: Integer;
begin
  if FSpectrum <> nil then
    Result := FSpectrum.GetBandCount
  else
    Result := 0;
end;

function TFAudioPlayer.GetBandLevel(Index: Integer): Integer;
begin
  if FSpectrum <> nil then
    Result := FSpectrum.GetBandLevel(Index)
  else
    Result := 0;
end;

procedure TFAudioPlayer.SpectrumViewDestroyed(Sender: TObject);
begin
  if FSpectrumView = Sender then
    FSpectrumView := nil;
end;

procedure TFAudioPlayer.SpectrumSnapshotReady(Sender: TObject);
begin
  QueueSpectrumRefresh;
end;

procedure TFAudioPlayer.QueueSpectrumRefresh;
var
  Worker: TThread;
begin
  FLock.Acquire;
  try
    if FShutDown or (FWorker = nil) then
      Exit;
    Worker := FWorker;
  finally
    FLock.Release;
  end;

  if InterlockedCompareExchange(FSpectrumRefreshQueued, 1, 0) <> 0 then
    Exit;

  TThread.Queue(Worker, procedure
    begin
      InterlockedExchange(FSpectrumRefreshQueued, 0);
      if not FShutDown and (FSpectrumView <> nil) then
        FSpectrumView.RefreshSpectrum;
    end);
end;

procedure TFAudioPlayer.CreateView(Parent: TFmxObject;
Left, Top, Width, Height: Single);
begin
  if Parent = nil then
    Exit;

  if FSpectrumView = nil then
  begin
    FSpectrumView := TAudioSpectrumView.Create(nil, FSpectrum);
    FSpectrumView.OnDestroyed := SpectrumViewDestroyed;
  end;

  FSpectrumView.Parent := Parent;
  FSpectrumView.Align := TAlignLayout.None;
  FSpectrumView.SetBounds(Left, Top, Width, Height);
  FSpectrumView.RefreshSpectrum;
  FSpectrumView.SetActive(FViewActive);
end;

procedure TFAudioPlayer.SetViewActive(Value: Boolean);
begin
  FViewActive := Value;
  if FSpectrumView <> nil then
    FSpectrumView.SetActive(Value);
end;

procedure TFAudioPlayer.SetViewBarWidth(Value: Single);
begin
  if FSpectrumView <> nil then
    FSpectrumView.BarWidth := Value;
end;

procedure TFAudioPlayer.SetViewBarSpacing(Value: Single);
begin
  if FSpectrumView <> nil then
    FSpectrumView.BarSpacing := Value;
end;

procedure TFAudioPlayer.SetViewBarRadius(Value: Single);
begin
  if FSpectrumView <> nil then
    FSpectrumView.BarRadius := Value;
end;

procedure TFAudioPlayer.SetViewBarStyle(FStyle: TSpectrumBarStyle);
begin
  if FSpectrumView = nil then
    Exit;

  FSpectrumView.BarStyle := FStyle;
end;

procedure TFAudioPlayer.SetViewColors(FirstColor, LastColor: TAlphaColor);
begin
  if FSpectrumView <> nil then
  begin
    FSpectrumView.FirstColor := TAlphaColor(FirstColor);
    FSpectrumView.LastColor := TAlphaColor(LastColor);
  end;
end;

procedure TFAudioPlayer.SetViewBandColor(Index: Integer; Color: TAlphaColor);
begin
  if FSpectrumView <> nil then
    FSpectrumView.SetBandColor(Index, TAlphaColor(Color));
end;

procedure TFAudioPlayer.FeedSpectrum(const Samples: TArray<SmallInt>;
Channels, SampleRate: Integer; StartSamplePosition: Int64);
begin
  if FSpectrum <> nil then
    FSpectrum.PushSamples(Samples, Channels, SampleRate, StartSamplePosition);
end;

procedure TFAudioPlayer.SetSpectrumPlayhead(SamplePosition: Int64);
begin
  if FSpectrum <> nil then
    FSpectrum.SetPlayheadSample(SamplePosition);
end;

procedure TFAudioPlayer.ResetSpectrum;
begin
  if FSpectrum <> nil then
    FSpectrum.Reset;
end;

procedure TFAudioPlayer.Next;
var
  Command: TAudioPlayerCommand;
begin
  Command := Default (TAudioPlayerCommand);
  Command.Kind := pcNext;
  QueueCommand(Command);
end;

procedure TFAudioPlayer.Previous;
var
  Command: TAudioPlayerCommand;
begin
  Command := Default (TAudioPlayerCommand);
  Command.Kind := pcPrevious;
  QueueCommand(Command);
end;

function TFAudioPlayer.IsPlaying: Boolean;
begin
  Result := ReadState = TPlayerState.Playing;
end;

function TFAudioPlayer.IsPaused: Boolean;
begin
  Result := ReadState = TPlayerState.Paused;
end;

// =============================================================================
// TMP3Worker
// =============================================================================
constructor TAudioWorker.Create(AOwner: TFAudioPlayer);
begin
  inherited Create(True);

  FreeOnTerminate := False;
  FOwner := AOwner;
end;

procedure TAudioWorker.ResetSource(var Stream: TFileStream;
var Source: IAudioSource; var Output: TPCMAudioOutput; var Pending: TAudioFrame;
var HasPending: Boolean);
begin
  FreeAndNil(Output);
  Source := nil;
  FreeAndNil(Stream);
  Pending := Default (TAudioFrame);
  HasPending := False;
end;

procedure TAudioWorker.UpdateProgress(Output: TPCMAudioOutput;
SampleRate: Integer; BaseSamplePosition: Int64);
var
  Played: Int64;
begin
  if (Output = nil) or (SampleRate <= 0) then
    Exit;

  if Output.PlayedFrames(Played) then
  begin
    FOwner.SetSpectrumPlayhead(BaseSamplePosition + Played);
    FOwner.PublishProgress((BaseSamplePosition + Played) * 1000 div SampleRate);
  end;
end;

procedure TAudioWorker.MarkWorkerError(E: Exception;
var Output: TPCMAudioOutput; var Playing: Boolean);
begin
  Playing := False;
  FreeAndNil(Output);
  FOwner.ResetSpectrum;
  FOwner.PublishError(E);
end;

procedure TAudioWorker.LoadTrack(const FileName: string; AutoPlay: Boolean;
var Stream: TFileStream; var Source: IAudioSource; var Output: TPCMAudioOutput;
var Pending: TAudioFrame; var HasPending, Playing, SourceEOF,
  OutputFlushed: Boolean; var SampleRate, Channels: Integer;
var BaseSamplePosition: Int64);
begin
  ResetSource(Stream, Source, Output, Pending, HasPending);
  Playing := False;
  SourceEOF := False;
  OutputFlushed := False;
  SampleRate := 0;
  Channels := 0;
  BaseSamplePosition := 0;
  FOwner.ResetSpectrum;
  FOwner.PublishOpenStarted(FileName);
  try
    Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    Source := TAudioSourceRegistry.Open(Stream);

    if not Source.ReadFrame(Pending) then
      raise EPlayerFormat.Create('The audio file contains no decoded frames');

    HasPending := True;
    SampleRate := Pending.SampleRate;
    Channels := Pending.Channels;
    BaseSamplePosition := Pending.SamplePosition;

    if (SampleRate <= 0) or not(Channels in [1, 2]) then
      raise EPlayerFormat.Create('Unsupported audio PCM format');

    Playing := AutoPlay;
    FOwner.PublishOpened(Source.GetDuration, AutoPlay);
  except
    ResetSource(Stream, Source, Output, Pending, HasPending);
    Playing := False;
    SourceEOF := False;
    OutputFlushed := False;
    raise;
  end;
end;

procedure TAudioWorker.ProcessCommand(const Command: TAudioPlayerCommand;
var Stream: TFileStream; var Source: IAudioSource; var Output: TPCMAudioOutput;
var Pending: TAudioFrame; var Playlist: TStringList; var PlaylistIndex: Integer;
var PlaylistMode: Boolean; var HasPending, Playing, SourceEOF, OutputFlushed,
  LoopEnabled: Boolean; var SampleRate, Channels: Integer;
var BaseSamplePosition: Int64);
var
  WasPlaying, WasPaused: Boolean;
  TrackState: TPlayerState;
  NextIndex: Integer;
  AutoPlayTrack: Boolean;
begin
  case Command.Kind of
    pcOpenFile, pcOpenFolder:
      begin
        Playing := False;
        SourceEOF := False;
        OutputFlushed := False;
        LoopEnabled := Command.Loop;
        Playlist.Clear;
        PlaylistIndex := -1;
        PlaylistMode := Command.Kind = pcOpenFolder;

        try
          if PlaylistMode then
          begin
            CollectAudioFiles(Command.FileName, Playlist);
            Playlist.Sort;
            if Playlist.Count = 0 then
              raise EPlayerError.Create
                ('No supported audio files found in folder: ' +
                Command.FileName);

            PlaylistIndex := 0;
            LoadTrack(Playlist[PlaylistIndex], Command.Flag, Stream, Source,
              Output, Pending, HasPending, Playing, SourceEOF, OutputFlushed,
              SampleRate, Channels, BaseSamplePosition);
          end
          else
            LoadTrack(Command.FileName, Command.Flag, Stream, Source, Output,
              Pending, HasPending, Playing, SourceEOF, OutputFlushed,
              SampleRate, Channels, BaseSamplePosition);
        except
          on E: Exception do
          begin
            ResetSource(Stream, Source, Output, Pending, HasPending);
            Playing := False;
            SourceEOF := False;
            LoopEnabled := False;
            Playlist.Clear;
            PlaylistIndex := -1;
            PlaylistMode := False;
            FOwner.PublishError(E);
          end;
        end;
      end;

    pcPlay:
      begin
        if Source = nil then
        begin
          FOwner.SetLastError
            ('Open an audio file or folder before calling Play');
          Exit;
        end;

        if SourceEOF then
        begin
          if PlaylistMode and (Playlist.Count > 0) then
          begin
            PlaylistIndex := 0;
            LoadTrack(Playlist[PlaylistIndex], True, Stream, Source, Output,
              Pending, HasPending, Playing, SourceEOF, OutputFlushed,
              SampleRate, Channels, BaseSamplePosition);
          end
          else
          begin
            FreeAndNil(Output);
            FOwner.ResetSpectrum;
            Source.Seek(0);

            if not Source.ReadFrame(Pending) then
              raise EPlayerFormat.Create
                ('The audio file contains no decoded frames');

            HasPending := True;
            BaseSamplePosition := Pending.SamplePosition;
            SourceEOF := False;
            OutputFlushed := False;
          end;
        end;
        Playing := True;

        if Output <> nil then
          Output.SetPaused(False);

        FOwner.PublishState(TPlayerState.Playing);
      end;

    pcPause:
      begin
        if Playing then
        begin
          UpdateProgress(Output, SampleRate, BaseSamplePosition);
          Playing := False;

          if Output <> nil then
            Output.SetPaused(True);
          FOwner.PublishState(TPlayerState.Paused);
        end;
      end;

    pcResume:
      begin
        if (Source = nil) or (FOwner.GetState <> Ord(TPlayerState.Paused)) then
          Exit;

        Playing := True;

        if Output <> nil then
          Output.SetPaused(False);

        FOwner.PublishState(TPlayerState.Playing);
      end;

    pcStop:
      begin
        if Source <> nil then
        begin
          Playing := False;
          FreeAndNil(Output);
          FOwner.ResetSpectrum;
          Source.Seek(0);

          if not Source.ReadFrame(Pending) then
            raise EPlayerFormat.Create
              ('The audio file contains no decoded frames');

          HasPending := True;
          BaseSamplePosition := Pending.SamplePosition;
          SourceEOF := False;
          OutputFlushed := False;
          FOwner.PublishPosition(0);
          FOwner.PublishState(TPlayerState.Ready);
        end;
      end;

    pcNext, pcPrevious:
      begin
        if (not PlaylistMode) or (Playlist.Count = 0) then
          Exit;

        TrackState := FOwner.ReadState;
        WasPlaying := Playing;
        WasPaused := TrackState = TPlayerState.Paused;
        AutoPlayTrack := WasPlaying or (TrackState = TPlayerState.Ended);

        if Command.Kind = pcNext then
        begin
          if PlaylistIndex + 1 < Playlist.Count then
            NextIndex := PlaylistIndex + 1
          else if LoopEnabled then
            NextIndex := 0
          else
            Exit;
        end
        else
        begin
          if PlaylistIndex > 0 then
            NextIndex := PlaylistIndex - 1
          else if LoopEnabled then
            NextIndex := Playlist.Count - 1
          else
            Exit;
        end;

        PlaylistIndex := NextIndex;
        LoadTrack(Playlist[PlaylistIndex], AutoPlayTrack, Stream, Source,
          Output, Pending, HasPending, Playing, SourceEOF, OutputFlushed,
          SampleRate, Channels, BaseSamplePosition);

        if WasPaused then
          FOwner.PublishState(TPlayerState.Paused);
      end;
  end;
end;

procedure TAudioWorker.Execute;
var
  Stream: TFileStream;
  Source: IAudioSource;
  Output: TPCMAudioOutput;
  Pending: TAudioFrame;
  Playlist: TStringList;
  PlaylistIndex: Integer;
  PlaylistMode: Boolean;
  HasPending, Playing, SourceEOF, OutputFlushed, LoopEnabled: Boolean;
  SampleRate, Channels: Integer;
  BaseSamplePosition: Int64;
  Command: TAudioPlayerCommand;
  I: Integer;
  Volume: Single;
begin
  Stream := nil;
  Source := nil;
  Output := nil;
  Pending := Default (TAudioFrame);
  Playlist := TStringList.Create;
  PlaylistIndex := -1;
  PlaylistMode := False;
  HasPending := False;
  Playing := False;
  SourceEOF := False;
  OutputFlushed := False;
  LoopEnabled := False;
  SampleRate := 0;
  Channels := 0;
  BaseSamplePosition := 0;
  try
    while not Terminated do
    begin
      while FOwner.PopCommand(Command) do
      begin
        try
          ProcessCommand(Command, Stream, Source, Output, Pending, Playlist,
            PlaylistIndex, PlaylistMode, HasPending, Playing, SourceEOF,
            OutputFlushed, LoopEnabled, SampleRate, Channels,
            BaseSamplePosition);
        except
          on E: Exception do
            MarkWorkerError(E, Output, Playing);
        end;
        if Terminated then
          Break;
      end;
      if Terminated then
        Break;

      if Output <> nil then
        UpdateProgress(Output, SampleRate, BaseSamplePosition);

      if Playing and (Source <> nil) then
      begin
        try
          if SourceEOF then
          begin
            if Output <> nil then
            begin
              if not OutputFlushed then
              begin
                Output.Flush;
                OutputFlushed := True;
              end;
              if Output.BufferedFrames > 0 then
              begin
                FOwner.FWake.WaitFor(5);
                Continue;
              end;
              UpdateProgress(Output, SampleRate, BaseSamplePosition);
            end;

            FreeAndNil(Output);
            OutputFlushed := False;

            if PlaylistMode and (Playlist.Count > 0) and
              ((PlaylistIndex + 1 < Playlist.Count) or LoopEnabled) then
            begin
              if PlaylistIndex + 1 < Playlist.Count then
                Inc(PlaylistIndex)
              else
                PlaylistIndex := 0;
              LoadTrack(Playlist[PlaylistIndex], True, Stream, Source, Output,
                Pending, HasPending, Playing, SourceEOF, OutputFlushed,
                SampleRate, Channels, BaseSamplePosition);
              FOwner.PublishState(TPlayerState.Playing);
            end
            else if LoopEnabled and not PlaylistMode then
            begin
              FOwner.ResetSpectrum;
              Source.Seek(0);
              if not Source.ReadFrame(Pending) then
                raise EPlayerFormat.Create
                  ('The audio file contains no decoded frames');
              HasPending := True;
              BaseSamplePosition := Pending.SamplePosition;
              SourceEOF := False;
              OutputFlushed := False;
              FOwner.PublishPosition(0);
              FOwner.PublishState(TPlayerState.Playing);
            end
            else
            begin
              Playing := False;
              FOwner.PublishState(TPlayerState.Ended);
            end;
          end
          else
          begin
            if Output = nil then
            begin
              Output := TPCMAudioOutput.Create;
              Output.Open(SampleRate, Channels);
            end;

            if Output.BufferedFrames > SampleRate div 3 then
            begin
              FOwner.FWake.WaitFor(5);
              Continue;
            end;

            if not HasPending then
            begin
              if Source.ReadFrame(Pending) then
                HasPending := True
              else
              begin
                SourceEOF := True;
                if not OutputFlushed then
                begin
                  Output.Flush;
                  OutputFlushed := True;
                end;
              end;
            end;

            if HasPending then
            begin
              if (Pending.SampleRate <> SampleRate) or
                (Pending.Channels <> Channels) then
                raise EPlayerFormat.Create
                  ('The audio source changed its PCM format during playback');
              Volume := FOwner.ReadVolume;
              if Volume < 1 then
                for I := 0 to High(Pending.Samples) do
                  Pending.Samples[I] :=
                    SmallInt(Round(Pending.Samples[I] * Volume));

              FOwner.FeedSpectrum(Pending.Samples, Channels, SampleRate,
                Pending.SamplePosition);
              Output.Write(Pending);
              HasPending := False;
            end;
          end;
        except
          on E: Exception do
            MarkWorkerError(E, Output, Playing);
        end;
      end;
      FOwner.FWake.WaitFor(5);
    end;
  finally
    ResetSource(Stream, Source, Output, Pending, HasPending);
    Playlist.Free;
  end;
end;

// =============================================================================
// Exports
// =============================================================================
function InitAudioPlayer: FAudioPlayer; stdcall;
begin
  Result := TFAudioPlayer.Create;
end;

function InitAudioPlayerSpectrum(const Player: FAudioPlayer)
  : FAudioSpectrum; stdcall;
begin
  Result := nil;

  if Player <> nil then
    Supports(Player, FAudioSpectrum, Result);
end;

exports
  InitAudioPlayer,
  InitAudioPlayerSpectrum;

end.
