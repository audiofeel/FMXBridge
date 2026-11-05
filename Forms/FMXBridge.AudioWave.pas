
unit FMXBridge.AudioWave;

interface

uses
  Winapi.Windows, Winapi.MMSystem, System.Classes;

// =============================================================================
// WavePlayer
// =============================================================================
type
  WAVEFORMATEX = record
    wFormatTag: Word;
    nChannels: Word;
    nSamplesPerSec: DWORD;
    nAvgBytesPerSec: DWORD;
    nBlockAlign: Word;
    wBitsPerSample: Word;
    cbSize: Word;
  end;

  TWavePlayer = class;

  TWaveCallback = class
  public
    class procedure WaveOutProc(hwo: HWAVEOUT; uMsg: UINT;
      dwInstance: DWORD_PTR; dwParam1: DWORD_PTR; dwParam2: DWORD_PTR); static;
  end;

  TWavePlayer = class
  private
    FWave: HWAVEOUT;
    FHeader: WAVEHDR;
    FFormat: WAVEFORMATEX;

    FData: Pointer;
    FDataSize: Cardinal;

    FLoop: Boolean;
    FPlaying: Boolean;
    FOpened: Boolean;
    FClosing: Boolean;

    procedure OpenDevice;
    procedure CloseDevice;
    procedure StartBuffer;

    function ClearWaveHeader: Boolean;
    function ReadChunk(Stream: TStream; out ChunkID: DWORD;
      out ChunkSize: DWORD): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function LoadFromFile(const FileName: string): Boolean;
    procedure Play;
    procedure Stop;
    procedure Unload;
    function IsPlaying: Boolean;
    property Loop: Boolean read FLoop write FLoop;
  end;

implementation

uses
  System.SysUtils;

const
  FOURCC_RIFF = $46464952;
  FOURCC_WAVE = $45564157;
  FOURCC_FMT  = $20746D66;
  FOURCC_DATA = $61746164;

class procedure TWaveCallback.WaveOutProc(hwo: HWAVEOUT; uMsg: UINT;
  dwInstance: DWORD_PTR; dwParam1: DWORD_PTR; dwParam2: DWORD_PTR);
var
  Player: TWavePlayer;
begin
  if uMsg <> WOM_DONE then
    Exit;

  Player := TWavePlayer(dwInstance);

  if not Assigned(Player) then
    Exit;

  if Player.FClosing then
    Exit;

  Player.FPlaying := False;

  if Player.FLoop then
  begin
    Player.StartBuffer;
  end;
end;

constructor TWavePlayer.Create;
begin
  inherited;

  FWave := 0;
  FData := nil;
  FDataSize := 0;

  FLoop := False;
  FPlaying := False;
  FOpened := False;
  FClosing := False;

  ZeroMemory(@FHeader, SizeOf(FHeader));
  ZeroMemory(@FFormat, SizeOf(FFormat));
end;

destructor TWavePlayer.Destroy;
begin
  Unload;

  inherited;
end;

procedure TWavePlayer.OpenDevice;
var
  Res: MMRESULT;
begin
  if FOpened then
    Exit;

  Res := waveOutOpen(@FWave, WAVE_MAPPER, @FFormat,
         DWORD_PTR(@TWaveCallback.WaveOutProc),
         DWORD_PTR(Self), CALLBACK_FUNCTION);

  if Res <> MMSYSERR_NOERROR then
    FWave := 0
  else
    FOpened := True;
end;

procedure TWavePlayer.CloseDevice;
begin
  if not FOpened then
    Exit;

  waveOutReset(FWave);

  if FHeader.dwFlags and WHDR_PREPARED <> 0 then
    waveOutUnprepareHeader(FWave, @FHeader, SizeOf(FHeader));

  waveOutClose(FWave);

  FWave := 0;
  FOpened := False;
end;

procedure TWavePlayer.StartBuffer;
var
  Res: MMRESULT;
begin
  if not FOpened then
    Exit;

  ZeroMemory(@FHeader, SizeOf(FHeader));

  FHeader.lpData := FData;
  FHeader.dwBufferLength := FDataSize;

  Res := waveOutPrepareHeader(FWave, @FHeader, SizeOf(FHeader));

  if Res <> MMSYSERR_NOERROR then
    Exit;

  Res := waveOutWrite(FWave, @FHeader, SizeOf(FHeader));

  if Res = MMSYSERR_NOERROR then
    FPlaying := True;
end;

function TWavePlayer.ClearWaveHeader: Boolean;
begin
  ZeroMemory(@FHeader, SizeOf(FHeader));
  ZeroMemory(@FFormat, SizeOf(FFormat));

  if Assigned(FData) then
  begin
    FreeMem(FData);
    FData := nil;
  end;

  FDataSize := 0;

  Result := True;
end;

function TWavePlayer.ReadChunk(Stream: TStream; out ChunkID: DWORD;
  out ChunkSize: DWORD): Boolean;
begin
  Result :=
    (Stream.Read(ChunkID, SizeOf(DWORD)) = SizeOf(DWORD)) and
    (Stream.Read(ChunkSize, SizeOf(DWORD)) = SizeOf(DWORD));
end;

function TWavePlayer.LoadFromFile(const FileName: string): Boolean;
var
  FS: TFileStream;

  ChunkID: DWORD;
  ChunkSize: DWORD;
  WaveID: DWORD;

  FmtLoaded: Boolean;
  DataLoaded: Boolean;
begin
  Result := False;

  if not FileExists(FileName) then
    Exit;

  Unload;

  FS := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try

    if FS.Read(ChunkID,4) <> 4 then
      Exit;

    if ChunkID <> FOURCC_RIFF then
      Exit;

    if FS.Seek(4, soCurrent) = -1 then
      Exit;

    if FS.Read(WaveID,4) <> 4 then
      Exit;

    if WaveID <> FOURCC_WAVE then
      Exit;

    FmtLoaded := False;
    DataLoaded := False;

    while FS.Position < FS.Size do
    begin
      if not ReadChunk(FS, ChunkID, ChunkSize) then
        Break;

      case ChunkID of

        FOURCC_FMT:
        begin
          if ChunkSize < 16 then
            Exit;

          ZeroMemory(@FFormat, SizeOf(FFormat));

          FS.ReadBuffer(FFormat, 16);

          if ChunkSize > 16 then
            FS.Seek(ChunkSize-16, soCurrent);

          if FFormat.wFormatTag <> WAVE_FORMAT_PCM then
            Exit;

          FmtLoaded := True;
        end;

        FOURCC_DATA:
        begin
          GetMem(FData,ChunkSize);

          FS.ReadBuffer(FData^,ChunkSize);

          FDataSize := ChunkSize;

          DataLoaded := True;
        end;
      else
        FS.Seek(ChunkSize, soCurrent);
      end;

      if Odd(ChunkSize) then
        FS.Seek(1, soCurrent);
    end;
    Result := FmtLoaded and DataLoaded;

    if not Result then
      Unload;
  finally
    FS.Free;
  end;
end;

procedure TWavePlayer.Play;
begin
  if FPlaying then
    Stop;

  if not Assigned(FData) then
    Exit;

  OpenDevice;

  StartBuffer;
end;

procedure TWavePlayer.Stop;
begin
  if not FOpened then
    Exit;

  waveOutReset(FWave);

  FPlaying := False;
end;

procedure TWavePlayer.Unload;
begin
  FClosing := True;

  Stop;
  CloseDevice;
  ClearWaveHeader;

  FClosing := False;
end;

function TWavePlayer.IsPlaying: Boolean;
begin
  Result := FPlaying;
end;

end.
