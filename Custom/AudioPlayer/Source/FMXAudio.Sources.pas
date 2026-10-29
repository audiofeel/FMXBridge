unit FMXAudio.Sources;

interface

uses
  System.SysUtils,
  System.Classes,
  FMXAudio.Types;

type
  EAudioReadCancelled = class(EPlayerError);

  TAudioCancelCheck = reference to function: Boolean;

  // Sources produce interleaved PCM16. All calls belong to one worker thread.
  // Seek and timestamps use microseconds. File adapters need Size/Seek;
  // network adapters report availability separately through IAudioNetworkSource.
  IAudioSource = interface
    ['{A39D2C19-BBDE-4518-8B07-ABAB94B69B27}']
    function ReadFrame(out Frame: TAudioFrame): Boolean;
    procedure Seek(Time: Int64);
    function GetDuration: Int64;
    property Duration: Int64 read GetDuration;
  end;

  // Long decoder prerolls should check cancellation between input packets.
  IAudioSourceCancellation = interface
    ['{9D02FF6F-805A-4261-91EE-1A51934B7BE9}']
    procedure SetCancellation(const Check: TAudioCancelCheck);
  end;

  TAudioSourceProbe = reference to function(const Header: TBytes): Boolean;
  TAudioSourceStreamProbe = reference to function(Stream: TStream): Boolean;
  // Factory borrows Stream. The registry retains it for the source's lifetime.

  TAudioSourceFactory = reference to function(Stream: TStream): IAudioSource;

  TAudioSourceRegistry = class
  public
    class procedure RegisterFormat(
        const Name: string;
        const Probe: TAudioSourceProbe;
        const Factory: TAudioSourceFactory;
        const StreamProbe: TAudioSourceStreamProbe = nil
    ); static;
    class function Open(Stream: TStream; OwnsStream: Boolean = False): IAudioSource; static;
    class function Formats: TArray<string>; static;
  end;

implementation

uses
  System.Generics.Collections;

type
  TRegistration = record
    Name: string;
    Probe: TAudioSourceProbe;
    Factory: TAudioSourceFactory;
    StreamProbe: TAudioSourceStreamProbe;
  end;

  TStreamSource = class(TInterfacedObject, IAudioSource, IAudioSourceCancellation)
  private
    FStream: TStream;
    FOwns: Boolean;
    FSource: IAudioSource;
  public
    constructor Create(Stream: TStream; Owns: Boolean);
    destructor Destroy; override;
    function ReadFrame(out Frame: TAudioFrame): Boolean;
    procedure Seek(Time: Int64);
    function GetDuration: Int64;
    procedure SetCancellation(const Check: TAudioCancelCheck);
  end;

var
  RegistryLock: TObject;
  Registry: TList<TRegistration>;

constructor TStreamSource.Create(Stream: TStream; Owns: Boolean);
begin
  inherited Create;
  FStream := Stream;
  FOwns := Owns;
end;

destructor TStreamSource.Destroy;
begin
  FSource := nil;
  if FOwns then
    FStream.Free;
  inherited;
end;

function TStreamSource.ReadFrame(out Frame: TAudioFrame): Boolean;
begin
  Result := FSource.ReadFrame(Frame);
end;

procedure TStreamSource.Seek(Time: Int64);
begin
  FSource.Seek(Time);
end;

function TStreamSource.GetDuration: Int64;
begin
  Result := FSource.Duration;
end;

procedure TStreamSource.SetCancellation(const Check: TAudioCancelCheck);
var
  Control: IAudioSourceCancellation;
begin
  if Supports(FSource, IAudioSourceCancellation, Control) then
    Control.SetCancellation(Check);
end;

class procedure TAudioSourceRegistry.RegisterFormat(
    const Name: string;
    const Probe: TAudioSourceProbe;
    const Factory: TAudioSourceFactory;
    const StreamProbe: TAudioSourceStreamProbe
);
var
  Item, Existing: TRegistration;
begin
  if (Name = '') or not Assigned(Probe) or not Assigned(Factory) then
    raise EArgumentException.Create('A format needs a name, probe and factory');
  Item.Name := Name;
  Item.Probe := Probe;
  Item.Factory := Factory;
  Item.StreamProbe := StreamProbe;
  TMonitor.Enter(RegistryLock);
  try
    for Existing in Registry do
      if SameText(Existing.Name, Name) then
        raise EArgumentException.Create('Audio format is already registered: ' + Name);
    Registry.Add(Item);
  finally
    TMonitor.Exit(RegistryLock);
  end;
end;

class function TAudioSourceRegistry.Open(Stream: TStream; OwnsStream: Boolean): IAudioSource;
var
  Holder: TStreamSource;
  Header: TBytes;
  Items: TArray<TRegistration>;
  Item: TRegistration;
  Count, ReadCount: Integer;
begin
  if Stream = nil then
    raise EArgumentNilException.Create('Audio stream is nil');
  Holder := TStreamSource.Create(Stream, OwnsStream);
  Result := Holder; // Ownership is established before probing or parsing can fail.
  Stream.Position := 0;
  SetLength(Header, 64);
  Count := 0;
  while Count < Length(Header) do
  begin
    ReadCount := Stream.Read(Header[Count], Length(Header) - Count);
    if ReadCount = 0 then
      Break;
    Inc(Count, ReadCount);
  end;
  SetLength(Header, Count);
  Stream.Position := 0;
  TMonitor.Enter(RegistryLock);
  try
    Items := Registry.ToArray;
  finally
    TMonitor.Exit(RegistryLock);
  end;
  for Item in Items do
    if Item.Probe(Header) then
    begin
      Stream.Position := 0;
      Holder.FSource := Item.Factory(Stream);
      if Holder.FSource = nil then
        raise EPlayerError.Create('Audio source factory returned nil');
      Exit;
    end;
  // Stream probes run only when every cheap signature probe has failed.
  // They must preserve the caller's stream position.
  for Item in Items do
    if Assigned(Item.StreamProbe) and Item.StreamProbe(Stream) then
    begin
      Stream.Position := 0;
      Holder.FSource := Item.Factory(Stream);
      if Holder.FSource = nil then
        raise EPlayerError.Create('Audio source factory returned nil');
      Exit;
    end;
  raise EPlayerUnsupported.Create('No registered decoder/container recognizes this audio stream');
end;

class function TAudioSourceRegistry.Formats: TArray<string>;
var
  i: Integer;
begin
  TMonitor.Enter(RegistryLock);
  try
    SetLength(Result, Registry.Count);
    for i := 0 to Registry.Count - 1 do
      Result[i] := Registry[i].Name;
  finally
    TMonitor.Exit(RegistryLock);
  end;
end;

initialization
  RegistryLock := TObject.Create;
  Registry := TList<TRegistration>.Create;

finalization
  Registry.Free;
  RegistryLock.Free;

end.
