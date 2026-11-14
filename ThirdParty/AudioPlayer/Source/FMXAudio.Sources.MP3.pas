unit FMXAudio.Sources.MP3;

interface

uses
  System.Classes, System.SysUtils, FMXAudio.Types, FMXAudio.Sources,
  FMXAudio.MP3.Types, FMXAudio.MP3.Layer3;

type
  TMP3ReadMode = (Recover, strict);

  TMP3AudioSource = class(TInterfacedObject, IAudioSource, IAudioSourceCancellation)
  private
    type
      TFrameIndex = record
        Offset: Int64;
        Header: TMP3FrameHeader;
        Position: Int64;
        Prime, Reset: Boolean;
      end;

      TEmphasisState = record
        Input, PreviousInput, Output, PreviousOutput: array[0..1] of Double;
        Kind, Rate: Integer;
      end;

      TSegment = record
        Stream: TStream;
        Source: IAudioSource;
        Position, Frames: Int64;
      end;

      TCheckpoint = record
        Valid: Boolean;
        State: TMP3Dec;
        Reservoir: TBytes;
        Emphasis: TEmphasisState;
      end;
  private
    FStream: TStream;
    FMode: TMP3ReadMode;
    FApplyDeemphasis: Boolean;
    FSkippedBytes, FPrimingFrames, FTruncatedTailBytes: Int64;
    FEmphasis: TEmphasisState;
    FSegments: TArray<TSegment>;
    FSegmentCursor: Integer;
    FIndex: TArray<TFrameIndex>;
    FCheckpoints: TArray<TCheckpoint>;
    FStride, FCursor, FRate, FChannels, FFrameSamples: Integer;
    FTrimStart, FTrimEnd, FFrames, FTarget: Int64;
    FDecoder: TMP3Layer3Decoder;
    FReservoir: TBytes;
    FCancel: TAudioCancelCheck;
    procedure BuildIndex;
    procedure BuildSegments(const Entries: TArray<TFrameIndex>);
    procedure ApplyEmphasis(var Left, Right: TArray<Single>; const Header: TMP3FrameHeader);
    function IsInfoFrame(const Entry: TFrameIndex): Boolean;
    procedure DecodeFrame(out Frame: TAudioFrame);
    procedure SaveCheckpoint;
  public
    constructor Create(Stream: TStream; Mode: TMP3ReadMode = TMP3ReadMode.Recover; Deemphasis: Boolean = True);
    destructor Destroy; override;
    property SkippedBytes: Int64 read FSkippedBytes;
    property PrimingFrames: Int64 read FPrimingFrames;
    property TruncatedTailBytes: Int64 read FTruncatedTailBytes;
    function ReadFrame(out Frame: TAudioFrame): Boolean;
    procedure Seek(Time: Int64);
    function GetDuration: Int64;
    procedure SetCancellation(const Check: TAudioCancelCheck);
  end;

implementation

uses
  System.Math, System.Generics.Collections, FMXAudio.MP3.Frame,
  FMXAudio.MP3.Bitstream, FMXAudio.Sources.Convert;

type
  // A borrowed, independently positioned view. No audio-sized memory copies.
  TMP3StreamWindow = class(TStream)
  private
    FParent: TStream;
    FStart, FSize, FPosition: Int64;
  public
    constructor Create(Parent: TStream; Start, Count: Int64);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
  end;

constructor TMP3StreamWindow.Create(Parent: TStream; Start, Count: Int64);
begin
  inherited Create;
  FParent := Parent;
  FStart := Start;
  FSize := Count;
end;

function TMP3StreamWindow.Read(var Buffer; Count: Longint): Longint;
begin
  Count := Min(Int64(Max(0, Count)), FSize - FPosition);
  FParent.Position := FStart + FPosition;
  Result := FParent.Read(Buffer, Count);
  Inc(FPosition, Result);
end;

function TMP3StreamWindow.Write(const Buffer; Count: Longint): Longint;
begin
  raise EWriteError.Create('Read-only MP3 stream window');
end;

function TMP3StreamWindow.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  case Origin of
    SoBeginning:
      Result := Offset;
    SoCurrent:
      Result := FPosition + Offset;
    SoEnd:
      Result := FSize + Offset;
  else
    Result := FPosition;
  end;
  if (Result < 0) or (Result > FSize) then
    raise EStreamError.Create('MP3 stream window seek outside bounds');
  FPosition := Result;
end;

function Match(const Data: TBytes; Offset: Integer; const Text: AnsiString): Boolean;
var
  i: Integer;
begin
  if (Offset < 0) or (Offset > Length(Data) - Length(Text)) then
    Exit(False);
  for i := 1 to Length(Text) do
    if Data[Offset + i - 1] <> Ord(Text[i]) then
      Exit(False);
  Result := True;
end;

function BE32(const Data: TBytes; Offset: Integer): Cardinal;
begin
  Result :=
    (Cardinal(Data[Offset]) shl 24)
    or (Cardinal(Data[Offset + 1]) shl 16)
    or (Cardinal(Data[Offset + 2]) shl 8)
    or Data[Offset + 3];
end;

function LE32(const Data: TBytes; Offset: Integer): Cardinal;
begin
  Result :=
    Cardinal(Data[Offset])
    or (Cardinal(Data[Offset + 1]) shl 8)
    or (Cardinal(Data[Offset + 2]) shl 16)
    or (Cardinal(Data[Offset + 3]) shl 24);
end;

function MP3AudioEnd(Stream: TStream; AudioStart: Int64): Int64;
const
  APE_HAS_HEADER = Cardinal($80000000);
  APE_IS_HEADER = Cardinal($20000000);
var
  Tail, Header: TBytes;
  Size, Version, Flags, Items: Cardinal;
  TagStart, Before: Int64;
begin
  Result := Stream.Size;
  SetLength(Tail, 32);
  SetLength(Header, 32);
  repeat
    Before := Result;
    if Result - AudioStart >= 128 then
    begin
      Stream.Position := Result - 128;
      Stream.ReadBuffer(Tail[0], 3);
      if Match(Tail, 0, 'TAG') then
        Dec(Result, 128);
    end;
    if Result - AudioStart >= 32 then
    begin
      Stream.Position := Result - 32;
      Stream.ReadBuffer(Tail[0], 32);
      if Match(Tail, 0, 'APETAGEX') then
      begin
        Version := LE32(Tail, 8);
        Size := LE32(Tail, 12);
        Items := LE32(Tail, 16);
        Flags := LE32(Tail, 20);
        if ((Version <> 1000) and (Version <> 2000)) or (Size < 32) or (Items > 65536) then
          raise EPlayerFormat.Create('Invalid APE tag header');
        for var i := 24 to 31 do
          if Tail[i] <> 0 then
            raise EPlayerFormat.Create('Invalid APE reserved bytes');
        if Flags and APE_IS_HEADER <> 0 then
        begin
          // Some taggers leave only a 32-byte APE header before ID3v1.
          // Its declared size describes absent metadata, NOT earlier audio.
          // Ignore exactly this recognized trailing header, never its size.
          Dec(Result, 32);
        end
        else
        begin
          if (Int64(Size) > Result - AudioStart) or (Items > (Size - 32) div 9) then
            raise EPlayerFormat.Create('Invalid APE tag size');
          TagStart := Result - Size;
          if Flags and APE_HAS_HEADER <> 0 then
          begin
            if TagStart - AudioStart < 32 then
              raise EPlayerFormat.Create('Missing APE tag header');
            Stream.Position := TagStart - 32;
            Stream.ReadBuffer(Header[0], 32);
            if not Match(Header, 0, 'APETAGEX')
              or (LE32(Header, 8) <> Version)
              or (LE32(Header, 12) <> Size)
              or (LE32(Header, 16) <> Items)
              or (LE32(Header, 20) <> (Flags or APE_IS_HEADER)) then
              raise EPlayerFormat.Create('Inconsistent APE tag header/footer');
            Dec(TagStart, 32);
          end;
          Result := TagStart;
        end;
      end;
    end;
  until Result = Before;
end;

constructor TMP3AudioSource.Create(Stream: TStream; Mode: TMP3ReadMode; Deemphasis: Boolean);
begin
  inherited Create;
  if Stream = nil then
    raise EArgumentNilException.Create('MP3 stream is nil');
  FStream := Stream;
  FMode := Mode;
  FApplyDeemphasis := Deemphasis;
  FDecoder := TMP3Layer3Decoder.Create;
  BuildIndex;
  if Length(FSegments) > 0 then
    Exit;
  FStride := Max(64, (Length(FIndex) + 127) div 128);
  SetLength(FCheckpoints, (Length(FIndex) + FStride - 1) div FStride);
  SaveCheckpoint;
  Seek(0);
end;

destructor TMP3AudioSource.Destroy;
begin
  for var i := 0 to High(FSegments) do
  begin
    FSegments[i].Source := nil;
    FSegments[i].Stream.Free;
  end;
  FDecoder.Free;
  inherited
end;

procedure TMP3AudioSource.BuildIndex;
var
  Entries: TList<TFrameIndex>;
  Entry: TFrameIndex;
  Header: TBytes;
  Limit, Start, TagSize, Expected: Int64;
  i, FreeBytes, Available, MainSize, MainBegin, SideOffset: Integer;
  VariableRate, Recovering: Boolean;
  NextHeader, PreviousHeader: TMP3FrameHeader;
  Data: TBytes;
begin
  FreeBytes := 0;
  PreviousHeader := Default(TMP3FrameHeader);
  VariableRate := False;
  Recovering := True;
  FStream.Position := 0;
  Limit := FStream.Size;
  SetLength(Header, 10);
  // Skip complete ID3v2 tags, including their optional v2.4 footer.
  while Limit - FStream.Position >= 10 do
  begin
    Start := FStream.Position;
    FStream.ReadBuffer(Header[0], 10);
    if not Match(Header, 0, 'ID3') then
    begin
      FStream.Position := Start;
      Break
    end;
    if not (Header[3] in [2, 3, 4]) then
      raise EPlayerUnsupported.Create('Unsupported ID3 version');
    TagSize := 0;
    for i := 6 to 9 do
    begin
      if Header[i] >= 128 then
        raise EPlayerFormat.Create('Invalid ID3 synchsafe size');
      TagSize := (TagSize shl 7) or Header[i];
    end;
    if (Header[3] = 4) and ((Header[5] and $10) <> 0) then
      Inc(TagSize, 10);
    if TagSize > Limit - FStream.Position then
      raise EPlayerFormat.Create('Truncated ID3 tag');
    FStream.Position := FStream.Position + TagSize;
  end;
  Start := FStream.Position;
  // Remove recognized trailing metadata before indexing MPEG frames.
  Limit := MP3AudioEnd(FStream, Start);
  FStream.Position := Start;
  Expected := Start;
  Entries := TList<TFrameIndex>.Create;
  try
    while FStream.Position < Limit do
    begin
      Start := FStream.Position;
      if Limit - Start < 4 then
      begin
        if FMode = TMP3ReadMode.strict then
          raise EPlayerFormat.Create('Truncated MP3 header');
        FTruncatedTailBytes := Limit - Start;
        Break;
      end;
      // A cached free-format length belongs to one version/sample-rate run.
      // Re-infer it after a discontinuity or a new MPEG format header.
      if FreeBytes <> 0 then
      begin
        SetLength(Data, 4);
        FStream.ReadBuffer(Data[0], 4);
        if not HdrValid(@Data[0])
          or (Data[1] and $FE <> PreviousHeader.Hdr[1] and $FE)
          or (Data[2] and $FC <> PreviousHeader.Hdr[2] and $FC) then
          FreeBytes := 0;
        FStream.Position := Start;
      end;
      Entry := Default(TFrameIndex);
      if not TMP3FrameParser.ParseHeader(FStream, Entry.Header, FreeBytes) then
      begin
        if FMode = TMP3ReadMode.strict then
          raise EPlayerFormat.Create('Invalid MP3 frame header');
        FTruncatedTailBytes := Limit - Start;
        Break;
      end;
      Entry.Offset := FStream.Position - 4;
      if (Entry.Header.Emphasis = 2) and (FMode = TMP3ReadMode.strict) then
        raise EPlayerFormat.Create('Reserved MP3 emphasis value');
      Entry.Reset := Entry.Offset <> Expected;
      if Entry.Reset and (FMode = TMP3ReadMode.strict) then
        raise EPlayerFormat.Create('Unexpected data between MP3 frames');
      if Entry.Header.FrameSize > Limit - Entry.Offset then
      begin
        if FMode = TMP3ReadMode.strict then
          raise EPlayerFormat.Create('Truncated MP3 frame');
        FTruncatedTailBytes := Limit - Entry.Offset;
        Break;
      end;
      // A scanned sync candidate must be followed by another complete header.
      if (Entry.Reset or (Entries.Count = 0)) and (Entry.Offset + Entry.Header.FrameSize + 4 <= Limit) then
      begin
        FStream.Position := Entry.Offset + Entry.Header.FrameSize;
        if not TMP3FrameParser.ParseHeader(FStream, NextHeader, Entry.Header.FrameSize - Entry.Header.Padding)
          or (FStream.Position - 4 <> Entry.Offset + Entry.Header.FrameSize) then
        begin
          if FMode = TMP3ReadMode.strict then
            raise EPlayerFormat.Create('Unconfirmed MP3 sync');
          FStream.Position := Entry.Offset + 1;
          Continue;
        end;
      end;
      if Entry.Reset then
        Inc(FSkippedBytes, Entry.Offset - Expected);
      if Entry.Header.BitrateIndex = 0 then
        FreeBytes := Entry.Header.FrameSize - Entry.Header.Padding
      else
        FreeBytes := 0;
      if Entries.Count = 0 then
      begin
        FRate := Entry.Header.SampleRate;
        FChannels := Entry.Header.Channels;
        FFrameSamples := HdrFrameSamples(@Entry.Header.Hdr[0]);
      end
      else if Entry.Header.SampleRate <> FRate then
        VariableRate := True;
      FChannels := Max(FChannels, Entry.Header.Channels);
      Entries.Add(Entry);
      PreviousHeader := Entry.Header;
      Expected := Entry.Offset + Entry.Header.FrameSize;
      if Entries.Count > 10000000 then
        raise EPlayerUnsupported.Create('MP3 has too many frames');
      FStream.Position := Entry.Offset + Entry.Header.FrameSize;
    end;
    if Entries.Count = 0 then
      raise EPlayerFormat.Create('MP3 has no audio frames');
    if VariableRate then
    begin
      BuildSegments(Entries.ToArray);
      Exit;
    end;
    if IsInfoFrame(Entries[0]) then
      Entries.Delete(0);
    // Frames needing unavailable earlier main data prime the reservoir only.
    // Keep them indexed so seeks replay exactly the same decoder history.
    Available := 0;
    FFrames := 0;
    for i := 0 to Entries.Count - 1 do
    begin
      Entry := Entries[i];
      if Entry.Reset then
      begin
        Available := 0;
        Recovering := True;
      end;
      SideOffset := 4 + Ord(HdrIsCrc(Entry.Header.Hdr)) * 2;
      SetLength(Data, SideOffset + TMP3FrameParser.SideInfoSize(Entry.Header));
      FStream.Position := Entry.Offset;
      if Length(Data) > Entry.Header.FrameSize then
        raise EPlayerFormat.Create('Truncated MP3 side information');
      FStream.ReadBuffer(Data[0], Length(Data));
      TMP3FrameParser.ValidateCRC(Data, Entry.Header);
      MainBegin := Data[SideOffset];
      if HdrTestMpeg1(Entry.Header.Hdr) then
        MainBegin := MainBegin * 2 + (Data[SideOffset + 1] shr 7);
      Entry.Prime := MainBegin > Available;
      if Entry.Prime and ((FMode = TMP3ReadMode.strict) or not Recovering) then
        raise EPlayerFormat.Create('MP3 bit reservoir underflow');
      if not Entry.Prime then
        Recovering := False;
      if Entry.Prime then
        Inc(FPrimingFrames);
      Entry.Position := FFrames;
      if not Entry.Prime then
        Inc(FFrames, FFrameSamples);
      MainSize := Entry.Header.FrameSize - Length(Data);
      Available := Min(511, Available + MainSize);
      Entries[i] := Entry;
    end;
    FIndex := Entries.ToArray;
  finally
    Entries.Free
  end;
  FFrames := FFrames - FTrimStart - FTrimEnd;
  if FFrames < 0 then
    raise EPlayerFormat.Create('Invalid MP3 encoder delay/padding');
  if (FFrames = 0) and (FPrimingFrames > 0) then
    raise EPlayerFormat.Create('MP3 has no decodable audio frames');
end;

procedure TMP3AudioSource.BuildSegments(const Entries: TArray<TFrameIndex>);
var
  First, Last, Slot: Integer;
  EndOffset, OutputFrames: Int64;
  Child: TMP3AudioSource;
  Source: IAudioSource;
begin
  // Normalize concatenated MPEG streams to one output format. Choose the
  // highest input rate: conversion never downsamples/aliases another segment.
  for var Entry in Entries do
    FRate := Max(FRate, Entry.Header.SampleRate);
  First := 0;
  FFrames := 0;
  while First < Length(Entries) do
  begin
    Last := First + 1;
    while (Last < Length(Entries)) and (Entries[Last].Header.SampleRate = Entries[First].Header.SampleRate) do
      Inc(Last);
    EndOffset := Entries[Last - 1].Offset + Entries[Last - 1].Header.FrameSize;
    Slot := Length(FSegments);
    SetLength(FSegments, Slot + 1);
    FSegments[Slot].Stream :=
      TMP3StreamWindow.Create(FStream, Entries[First].Offset, EndOffset - Entries[First].Offset);
    Child := TMP3AudioSource.Create(FSegments[Slot].Stream, FMode, FApplyDeemphasis);
    Source := Child;
    Inc(FPrimingFrames, Child.PrimingFrames);
    OutputFrames := RescaleTime(Child.FFrames, Child.FRate, FRate);
    FSegments[Slot].Source :=
      TConvertedAudioSource.Create(
        Source,
        Child.FRate,
        Child.FChannels,
        Child.FFrames,
        FRate,
        FChannels,
        OutputFrames,
        TAudioChannelOrder.Discrete
      );
    FSegments[Slot].Position := FFrames;
    FSegments[Slot].Frames := OutputFrames;
    Inc(FFrames, OutputFrames);
    First := Last;
  end;
end;

procedure TMP3AudioSource.ApplyEmphasis(var Left, Right: TArray<Single>; const Header: TMP3FrameHeader);
const
  // Minimum-phase biquad fits of the analog curves, DC gain 1. Coefficients
  // are reproducible with Tools/design_mp3_emphasis.py. Maximum magnitude
  // error over 0..Nyquist is below 0.11 dB at all nine MPEG sample rates.
  COEFFICIENTS: array[0..1, 0..8, 0..4] of Double = (
    (
    (0.84707856829652572, 0.67067635363406863, 0.06641810907186968, 0.61111508481080035, -0.026942053808335965),
    (0.77430600085438472, 0.57911342647308528, 0.04658670972585989, 0.48754820688964862, -0.087542069836318556),
    (0.75316300931332747, 0.5524193656291545, 0.040787642941170439, 0.45109892298385756, -0.10472890510020497),
    (0.67884871854112605, 0.45724749964864608, 0.019935477626332188, 0.31979992453051254, -0.16376822871440785),
    (0.59798452405876235, 0.34915523339078397, -0.0042011320880083382, 0.16844203604894736, -0.2255034106874092),
    (0.5779706761779323, 0.3212713882396408, -0.010508132152475256, 0.12905049755206432, -0.2403165652869664),
    (0.51625401807186622, 0.23127503451231329, -0.03103122776683933, 0.0010072704955580436, -0.28450944567821779),
    (0.46018342260507117, 0.14252760212762089, -0.051361205285851731, -0.12653630448538777, -0.32211387606777175),
    (0.44761058183498775, 0.12144855679866111, -0.056175082047967576, -0.15700269546417545, -0.33011324795014313)
  ),
    (
    (
    0.30701161732906296,
    0.1768217639915998,
    -0.00048345998624261811,
    -0.14687658896783551,
    -0.36977348969774437
  ),
    (0.25352424717531508, 0.11997130085041285, -0.010606479053930189, -0.24212211675653927, -0.39498881427166299),
    (0.24182166242179967, 0.10685251148420913, -0.013029758855538604, -0.26467378837871247, -0.39968179657081732),
    (0.2086731806496458, 0.067830925903834577, -0.020406879853519088, -0.33331304944982643, -0.41058972385021236),
    (0.18168789915091513, 0.033399596592252036, -0.027072699045039804, -0.3960736290117528, -0.41591157429011982),
    (
    0.17597242547045183,
    0.025712233375496416,
    -0.028572161883013661,
    -0.41039068930926337,
    -0.41649681372780201
  ),
    (
    0.16005212419154213,
    0.0034082756387993187,
    -0.032927594604105041,
    -0.4525777869823982,
    -0.41688940779136535
  ),
    (
    0.1472772236693804,
    -0.015597650724856931,
    -0.036626506503201331,
    -0.48928401897629625,
    -0.41566291458238158
  ),
    (
    0.14457844327457489,
    -0.019758919019957095,
    -0.037432650421472057,
    -0.49741176123614544,
    -0.41520136493070881
  )
  )
  );
var
  B0, B1, B2, A1, A2, X, Y: Double;
  i, Ch, Kind, RateIndex: Integer;
begin
  if (FEmphasis.Kind <> Header.Emphasis) or (FEmphasis.Rate <> Header.SampleRate) then
  begin
    FEmphasis := Default(TEmphasisState);
    FEmphasis.Kind := Header.Emphasis;
    FEmphasis.Rate := Header.SampleRate;
  end;
  // Reserved value 2 has no defined curve. Strict mode rejects it while
  // indexing; recovery mode leaves that frame's decoded PCM unfiltered.
  if not FApplyDeemphasis or (Header.Emphasis in [0, 2]) then
    Exit;
  Kind := Ord(Header.Emphasis = 3);
  case Header.SampleRate of
    8000:
      RateIndex := 0;
    11025:
      RateIndex := 1;
    12000:
      RateIndex := 2;
    16000:
      RateIndex := 3;
    22050:
      RateIndex := 4;
    24000:
      RateIndex := 5;
    32000:
      RateIndex := 6;
    44100:
      RateIndex := 7;
    48000:
      RateIndex := 8;
  else
    raise EPlayerFormat.Create('Invalid MP3 emphasis sample rate');
  end;
  B0 := COEFFICIENTS[Kind, RateIndex, 0];
  B1 := COEFFICIENTS[Kind, RateIndex, 1];
  B2 := COEFFICIENTS[Kind, RateIndex, 2];
  A1 := COEFFICIENTS[Kind, RateIndex, 3];
  A2 := COEFFICIENTS[Kind, RateIndex, 4];
  if Header.Channels = 1 then
  begin
    FEmphasis.Input[1] := FEmphasis.Input[0];
    FEmphasis.PreviousInput[1] := FEmphasis.PreviousInput[0];
    FEmphasis.Output[1] := FEmphasis.Output[0];
    FEmphasis.PreviousOutput[1] := FEmphasis.PreviousOutput[0];
  end;
  for i := 0 to High(Left) do
    for Ch := 0 to 1 do
    begin
      if Ch = 0 then
        X := Left[i]
      else
        X := Right[i];
      Y :=
        B0 * X
        + B1 * FEmphasis.Input[Ch]
        + B2 * FEmphasis.PreviousInput[Ch]
        - A1 * FEmphasis.Output[Ch]
        - A2 * FEmphasis.PreviousOutput[Ch];
      FEmphasis.PreviousInput[Ch] := FEmphasis.Input[Ch];
      FEmphasis.Input[Ch] := X;
      FEmphasis.PreviousOutput[Ch] := FEmphasis.Output[Ch];
      FEmphasis.Output[Ch] := Y;
      if Ch = 0 then
        Left[i] := Y
      else
        Right[i] := Y;
    end;
end;

function TMP3AudioSource.IsInfoFrame(const Entry: TFrameIndex): Boolean;
var
  Data: TBytes;
  Offset, Flags, Delay, Padding: Integer;
begin
  SetLength(Data, Entry.Header.FrameSize);
  FStream.Position := Entry.Offset;
  FStream.ReadBuffer(Data[0], Length(Data));
  TMP3FrameParser.ValidateCRC(Data, Entry.Header);
  Offset := 4 + TMP3FrameParser.SideInfoSize(Entry.Header);
  if HdrIsCrc(Entry.Header.Hdr) then
    Inc(Offset, 2);
  Result := Match(Data, Offset, 'Xing') or Match(Data, Offset, 'Info');
  if not Result then
    Exit;
  if Offset + 8 > Length(Data) then
    raise EPlayerFormat.Create('Truncated Xing header');
  Flags := BE32(Data, Offset + 4) and 15;
  Inc(Offset, 8);
  if Flags and 1 <> 0 then
    Inc(Offset, 4);
  if Flags and 2 <> 0 then
    Inc(Offset, 4);
  if Flags and 4 <> 0 then
    Inc(Offset, 100);
  if Flags and 8 <> 0 then
    Inc(Offset, 4);
  if Offset > Length(Data) then
    raise EPlayerFormat.Create('Truncated Xing fields');
  if (Offset + 24 <= Length(Data))
    and (Match(Data, Offset, 'LAME') or Match(Data, Offset, 'Lavc') or Match(Data, Offset, 'Lavf')) then
  begin
    Delay := (Integer(Data[Offset + 21]) shl 4) or (Data[Offset + 22] shr 4);
    Padding := ((Integer(Data[Offset + 22]) and 15) shl 8) or Data[Offset + 23];
    if Delay + Padding > 0 then
    begin
      // minimp3's synthesis delay is 528+1 samples. The encoder's padding
      // already includes this decoder tail, so compensate both ends once.
      FTrimStart := Delay + 529;
      FTrimEnd := Max(0, Padding - 529);
    end;
  end;
end;

procedure TMP3AudioSource.SaveCheckpoint;
var
  Slot: Integer;
begin
  if (FCursor >= Length(FIndex)) or (FCursor mod FStride <> 0) then
    Exit;
  Slot := FCursor div FStride;
  if FCheckpoints[Slot].Valid then
    Exit;
  FCheckpoints[Slot].State := FDecoder.State;
  FCheckpoints[Slot].Reservoir := Copy(FReservoir);
  FCheckpoints[Slot].Emphasis := FEmphasis;
  FCheckpoints[Slot].Valid := True;
end;

procedure TMP3AudioSource.Seek(Time: Int64);
var
  Slot, Low, High, Middle: Integer;
begin
  if Time >= GetDuration then
    FTarget := FFrames
  else
    FTarget := RescaleTime(Max(Int64(0), Time), PLAYER_TIME_BASE, FRate);
  if Length(FSegments) > 0 then
  begin
    FSegmentCursor := 0;
    while (FSegmentCursor < Length(FSegments))
      and (FTarget >= FSegments[FSegmentCursor].Position + FSegments[FSegmentCursor].Frames) do
      Inc(FSegmentCursor);
    if FSegmentCursor < Length(FSegments) then
      // Replay the segment's converter from zero for sample-exact seeking.
      FSegments[FSegmentCursor].Source.Seek(0);
    Exit;
  end;
  if (FTarget >= FFrames) or (Length(FIndex) = 0) then
  begin
    FCursor := Length(FIndex);
    Exit
  end;
  Low := 0;
  High := Length(FIndex);
  while Low < High do
  begin
    Middle := Low + (High - Low) div 2;
    if FIndex[Middle].Position <= FTarget + FTrimStart then
      Low := Middle + 1
    else
      High := Middle;
  end;
  Slot := Min(Length(FCheckpoints) - 1, Max(0, Low - 1) div FStride);
  while (Slot > 0) and not FCheckpoints[Slot].Valid do
    Dec(Slot);
  FDecoder.Restore(FCheckpoints[Slot].State);
  FReservoir := Copy(FCheckpoints[Slot].Reservoir);
  FEmphasis := FCheckpoints[Slot].Emphasis;
  FCursor := Slot * FStride;
end;

function TMP3AudioSource.GetDuration: Int64;
begin
  Result := RescaleTime(FFrames, FRate, PLAYER_TIME_BASE)
end;

procedure TMP3AudioSource.SetCancellation(const Check: TAudioCancelCheck);
begin
  FCancel := Check;
  for var Segment in FSegments do
  begin
    var Control: IAudioSourceCancellation;
    if Supports(Segment.Source, IAudioSourceCancellation, Control) then
      Control.SetCancellation(Check);
  end;
end;

procedure TMP3AudioSource.DecodeFrame(out Frame: TAudioFrame);
var
  Entry: TFrameIndex;
  Data, SideBytes, Main, Input: TBytes;
  Side: TMP3SideInfo;
  Bits: TMP3BitStream;
  Left, Right: TArray<Single>;
  Offset, SideSize, Sum, g, Ch, i: Integer;
begin
  Entry := FIndex[FCursor];
  if Entry.Reset then
  begin
    FDecoder.Reset;
    FReservoir := nil;
    FEmphasis := Default(TEmphasisState);
  end;
  SetLength(Data, Entry.Header.FrameSize);
  FStream.Position := Entry.Offset;
  FStream.ReadBuffer(Data[0], Length(Data));
  TMP3FrameParser.ValidateCRC(Data, Entry.Header);
  Offset := 4;
  if HdrIsCrc(Entry.Header.Hdr) then
    Inc(Offset, 2);
  SideSize := TMP3FrameParser.SideInfoSize(Entry.Header);
  if Offset + SideSize > Length(Data) then
    raise EPlayerFormat.Create('Truncated MP3 side information');
  SideBytes := Copy(Data, Offset, SideSize);
  Bits := TMP3BitStream.Create(SideBytes);
  try
    if not TMP3FrameParser.ParseSideInfo(Bits, Entry.Header, Side) then
      raise EPlayerFormat.Create('Invalid MP3 side information');
  finally
    Bits.Free
  end;
  Main := Copy(Data, Offset + SideSize, Length(Data) - Offset - SideSize);
  if not Entry.Prime and (Side.MainDataBegin > Length(FReservoir)) then
    raise EPlayerFormat.Create('MP3 bit reservoir underflow');
  Sum := 0;
  for g := 0 to Ord(HdrTestMpeg1(Entry.Header.Hdr)) do
    for Ch := 0 to Entry.Header.Channels - 1 do
      Inc(Sum, Side.Granules[g, Ch].Part23Length);
  if not Entry.Prime and (Sum > (Side.MainDataBegin + Length(Main)) * 8) then
    raise EPlayerFormat.Create('Truncated MP3 main data');
  if not Entry.Prime then
  begin
    Input := Copy(FReservoir, Length(FReservoir) - Side.MainDataBegin, Side.MainDataBegin) + Main;
    // Huffman lookahead may read up to 16 guard bytes beyond part2_3_length.
    SetLength(Input, Length(Input) + 16);
    FDecoder.DecodeFrame(Entry.Header, Side, Input, 0, Left, Right);
    ApplyEmphasis(Left, Right, Entry.Header);
  end;
  FReservoir := FReservoir + Main;
  if Length(FReservoir) > 511 then
    FReservoir := Copy(FReservoir, Length(FReservoir) - 511, 511);
  Frame := Default(TAudioFrame);
  Frame.SampleRate := FRate;
  Frame.Channels := FChannels;
  Frame.Frames := Length(Left);
  Frame.SamplePosition := Entry.Position - FTrimStart;
  Frame.PTS := RescaleTime(Frame.SamplePosition, FRate, PLAYER_TIME_BASE);
  SetLength(Frame.Samples, Frame.Frames * FChannels);
  for i := 0 to Frame.Frames - 1 do
  begin
    Frame.Samples[i * FChannels] := EnsureRange(Round(Left[i] * 32768), -32768, 32767);
    if FChannels = 2 then
      Frame.Samples[i * 2 + 1] := EnsureRange(Round(Right[i] * 32768), -32768, 32767);
  end;
  Inc(FCursor);
  SaveCheckpoint;
end;

function TMP3AudioSource.ReadFrame(out Frame: TAudioFrame): Boolean;
var
  First, Last: Integer;
begin
  if Length(FSegments) > 0 then
  begin
    while FSegmentCursor < Length(FSegments) do
    begin
      if FSegments[FSegmentCursor].Source.ReadFrame(Frame) then
      begin
        Inc(Frame.SamplePosition, FSegments[FSegmentCursor].Position);
        First := EnsureRange(FTarget - Frame.SamplePosition, Int64(0), Int64(Frame.Frames));
        if First = Frame.Frames then
          Continue;
        Frame.Samples := Copy(Frame.Samples, First * FChannels, (Frame.Frames - First) * FChannels);
        Dec(Frame.Frames, First);
        Inc(Frame.SamplePosition, First);
        Frame.PTS := RescaleTime(Frame.SamplePosition, FRate, PLAYER_TIME_BASE);
        Exit(True);
      end;
      Inc(FSegmentCursor);
      if FSegmentCursor < Length(FSegments) then
        FSegments[FSegmentCursor].Source.Seek(0);
    end;
    Frame := Default(TAudioFrame);
    Exit(False);
  end;
  while FCursor < Length(FIndex) do
  begin
    if Assigned(FCancel) and FCancel() then
      raise EAudioReadCancelled.Create('MP3 read cancelled');
    DecodeFrame(Frame);
    First := EnsureRange(FTarget - Frame.SamplePosition, Int64(0), Int64(Frame.Frames));
    Last := EnsureRange(FFrames - Frame.SamplePosition, Int64(0), Int64(Frame.Frames));
    if Last <= First then
      Continue;
    Frame.Samples := Copy(Frame.Samples, First * FChannels, (Last - First) * FChannels);
    Frame.Frames := Last - First;
    Inc(Frame.SamplePosition, First);
    Frame.PTS := RescaleTime(Frame.SamplePosition, FRate, PLAYER_TIME_BASE);
    Exit(True);
  end;
  Frame := Default(TAudioFrame);
  Result := False;
end;

function ProbeMP3Stream(Stream: TStream): Boolean;
var
  First, Next: TMP3FrameHeader;
  Position, Offset: Int64;
  FreeBytes, Count: Integer;
begin
  Position := Stream.Position;
  Result := False;
  try
    Stream.Position := 0;
    while TMP3FrameParser.ParseHeader(Stream, First) do
    begin
      Offset := Stream.Position - 4;
      FreeBytes := 0;
      if First.BitrateIndex = 0 then
        FreeBytes := First.FrameSize - First.Padding;
      Count := 1;
      Stream.Position := Min(Stream.Size, Offset + First.FrameSize);
      while (Count < 3) and (Stream.Position + 4 <= Stream.Size) do
      begin
        var Expected := Stream.Position;
        if not TMP3FrameParser.ParseHeader(Stream, Next, FreeBytes)
          or (Stream.Position - 4 <> Expected)
          or (Next.Version <> First.Version)
          or (Next.SampleRate <> First.SampleRate)
          or (Expected + Next.FrameSize > Stream.Size) then
          Break;
        Inc(Count);
        Stream.Position := Expected + Next.FrameSize;
      end;
      if Count = 3 then
        Exit(True);
      Stream.Position := Offset + 1;
    end;
  finally
    Stream.Position := Position;
  end;
end;

initialization
  TAudioSourceRegistry.RegisterFormat(
    'MP3/LayerIII',
    function(const Header: TBytes): Boolean
    var
      i, Next: Integer;
    begin
      if Match(Header, 0, 'ID3') then
        Exit(True);
      for i := 0 to Length(Header) - 4 do
        if HdrValid(@Header[i]) and ((Header[i + 1] and $18) <> $08) and ((Header[i + 1] and 6) = 2) then
        begin
          if i = 0 then
            Exit(True);
          Next := i + HdrFrameBytes(@Header[i], 0) + HdrPadding(@Header[i]);
          if (Next > i + 4)
            and (Next + 4 <= Length(Header))
            and HdrValid(@Header[Next])
            and (Header[Next + 1] and $FE = Header[i + 1] and $FE)
            and (Header[Next + 2] and $0C = Header[i + 2] and $0C) then
            Exit(True);
        end;
      Result := False;
    end,
    function(Stream: TStream): IAudioSource
    begin
      Result := TMP3AudioSource.Create(Stream)
    end,
        ProbeMP3Stream
      );

end.

