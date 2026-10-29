unit FMXAudio.MP3.Frame;

{
  FMXAudio.MP3.Frame.pas - MP3 frame header and side information parser

  Supports MPEG1, MPEG2, and MPEG2.5 Layer III
  Translated from minimp3.h L3_read_side_info() by lieff
  Original: https://github.com/lieff/minimp3

  License: CC0 1.0 Universal (Public Domain)
  https://creativecommons.org/publicdomain/zero/1.0/
}

{$POINTERMATH ON}

interface

uses
  System.SysUtils, System.Classes, FMXAudio.Types, FMXAudio.MP3.Types,
  FMXAudio.MP3.Bitstream;

type
  TMP3FrameParser = class
  public
    // Sync to next frame header and parse it
    class function ParseHeader(Stream: TStream; out Header: TMP3FrameHeader; FreeFormatBytes: Integer = 0): Boolean;

    class procedure ValidateCRC(const Data: TBytes; const Header: TMP3FrameHeader);

    // Parse side information using minimp3's L3_read_side_info logic
    // Returns main_data_begin, or -1 on error
    class function ParseSideInfo(BS: TMP3BitStream; const Header: TMP3FrameHeader; out SideInfo: TMP3SideInfo): Boolean;

    // Size of side info in bytes
    class function SideInfoSize(const Header: TMP3FrameHeader): Integer;
  end;

implementation

class function TMP3FrameParser.SideInfoSize(const Header: TMP3FrameHeader): Integer;
begin
  if HdrTestMpeg1(Header.Hdr) then
  begin
    if Header.Channels = 1 then
      Result := 17
    else
      Result := 32;
  end
  else
  begin
    if Header.Channels = 1 then
      Result := 9
    else
      Result := 17;
  end;
end;

class function TMP3FrameParser.ParseHeader(Stream: TStream; out Header: TMP3FrameHeader; FreeFormatBytes: Integer): Boolean;
var
  B0, B1, B2, B3: Byte;
  StreamPos: Int64;
  Ha: array[0..3] of Byte;
  Br, Sr, Distance, Base, Pad: Integer;
  Next, Third: array[0..3] of Byte;

  function Compatible(const Candidate: array of Byte): Boolean;
  begin
    Result := HdrValid(@Candidate[0]) and (Candidate[1] and $FE = B1 and $FE) and (Candidate[2] and $FC = B2 and $FC);
  end;

begin
  Result := False;
  FillChar(Header, SizeOf(Header), 0);

  while Stream.Position <= Stream.Size - 4 do
  begin
    StreamPos := Stream.Position;
    if Stream.Read(B0, 1) < 1 then
      Exit;
    if B0 <> $FF then
      Continue;
    if Stream.Read(B1, 1) < 1 then
      Exit;

    // Check sync: 11 bits all set, or the 0xE2xx pattern for MPEG2.5
    if not (((B1 and $F0) = $F0) or ((B1 and $FE) = $E2)) then
    begin
      Stream.Position := StreamPos + 1;
      Continue;
    end;

    if Stream.Read(B2, 1) < 1 then
      Exit;
    if Stream.Read(B3, 1) < 1 then
      Exit;

    Ha[0] := B0;
    Ha[1] := B1;
    Ha[2] := B2;
    Ha[3] := B3;

    // Validate using minimp3 hdr_valid logic
    if ((B1 and $18) = $08) or (HdrGetLayer(Ha) = 0) or (HdrGetBitrate(Ha) = 15) or (HdrGetSampleRate(Ha) = 3) then
    begin
      Stream.Position := StreamPos + 1;
      Continue;
    end;

    // We only handle Layer 3 in this decoder
    if HdrGetLayer(Ha) <> 1 then // layer=01 means layer3 in header encoding
    begin
      Stream.Position := StreamPos + 1;
      Continue;
    end;

    Br := HdrGetBitrate(Ha);
    if Br = 0 then
    begin
      if FreeFormatBytes = 0 then
      begin
        // Infer N from three matching headers, allowing the N/N+1 padding slots.
        // The bound also covers high-bitrate free-format encoders.
        Pad := (B2 shr 1) and 1;
        for Distance := 21 to 16384 do
        begin
          if StreamPos + Distance + 4 > Stream.Size then
            Break;
          Stream.Position := StreamPos + Distance;
          Stream.ReadBuffer(Next, 4);
          if not Compatible(Next) then
            Continue;
          Base := Distance - Pad;
          if StreamPos + Distance + Base + ((Next[2] shr 1) and 1) + 4 > Stream.Size then
            Continue;
          Stream.Position := StreamPos + Distance + Base + ((Next[2] shr 1) and 1);
          Stream.ReadBuffer(Third, 4);
          if Compatible(Third) then
          begin
            FreeFormatBytes := Base;
            Break;
          end;
        end;
      end;
      Stream.Position := StreamPos + 4;
      if FreeFormatBytes = 0 then
      begin
        Stream.Position := StreamPos + 1;
        Continue;
      end;
    end;

    Sr := HdrGetSampleRate(Ha);

    Header.Hdr[0] := B0;
    Header.Hdr[1] := B1;
    Header.Hdr[2] := B2;
    Header.Hdr[3] := B3;

    if HdrTestMpeg1(Ha) then
      Header.Version := 3 // MPEG1
    else if (Ha[1] shr 3) and 3 = 2 then
      Header.Version := 2 // MPEG2
    else
      Header.Version := 0; // MPEG2.5
    Header.Layer := 3;
    Header.BitrateIndex := Br;
    Header.SampleRateIndex := Sr;
    if HdrTestPadding(Ha) then
      Header.Padding := 1
    else
      Header.Padding := 0;
    Header.ChannelMode := TChannelMode(HdrGetStereoMode(Ha));
    Header.ModeExtension := HdrGetStereoModeExt(Ha);
    Header.Copyright := (B3 shr 3) and 1 = 1;
    Header.Original := (B3 shr 2) and 1 = 1;
    Header.Emphasis := B3 and 3;

    Header.Bitrate := HdrBitrateKbps(@Header.Hdr[0]);
    Header.SampleRate := HdrSampleRateHz(@Header.Hdr[0]);

    if HdrIsMono(Ha) then
      Header.Channels := 1
    else
      Header.Channels := 2;

    Header.FrameSize := HdrFrameBytes(@Header.Hdr[0], FreeFormatBytes) + HdrPadding(@Header.Hdr[0]);

    if Header.FrameSize < 21 then
    begin
      Stream.Position := StreamPos + 1;
      Continue;
    end;

    Result := True;
    Exit;
  end;
end;

class procedure TMP3FrameParser.ValidateCRC(const Data: TBytes; const Header: TMP3FrameHeader);
var
  Crc: Word;
  i, BitIndex, Last: Integer;
begin
  if not HdrIsCrc(Header.Hdr) then
    Exit;
  Last := 6 + SideInfoSize(Header);
  if Length(Data) < Last then
    raise EPlayerFormat.Create('Truncated MP3 CRC/side information');
  Crc := $FFFF;
  // ISO Layer III protects header bytes 2/3 and all side information.
  for i := 2 to Last - 1 do
  begin
    if i in [4, 5] then
      Continue;
    for BitIndex := 7 downto 0 do
      if ((Crc shr 15) xor (Data[i] shr BitIndex)) and 1 <> 0 then
        Crc := Word((Cardinal(Crc) shl 1) xor $8005)
      else
        Crc := Word(Cardinal(Crc) shl 1);
  end;
  if Crc <> (Word(Data[4]) shl 8 or Data[5]) then
    raise EPlayerFormat.Create('MP3 CRC mismatch');
end;

class function TMP3FrameParser.ParseSideInfo(BS: TMP3BitStream; const Header: TMP3FrameHeader; out SideInfo: TMP3SideInfo): Boolean;
var
  g, Ch: Integer;
  GI: ^TGranuleInfo;
  Tables: Cardinal;
  ScfsiBits: Cardinal;
  Nch: Integer;
  Ch0s, Ch1s: Byte;
  IsMP1: Boolean;
  NGranules: Integer;
begin
  Result := False;
  FillChar(SideInfo, SizeOf(SideInfo), 0);

  Nch := Header.Channels;
  IsMP1 := HdrTestMpeg1(Header.Hdr);
  if IsMP1 then
    NGranules := 2
  else
    NGranules := 1;

  if IsMP1 then
  begin
    // MPEG1 header bits: 9-bit main_data_begin, private bits, scfsi
    SideInfo.MainDataBegin := BS.ReadBits(9);

    if Nch = 1 then
      SideInfo.PrivateBits := BS.ReadBits(5)
    else
      SideInfo.PrivateBits := BS.ReadBits(3);

    // scfsi: 4 bits per channel
    ScfsiBits := BS.ReadBits(4 * Nch);

    if Nch = 1 then
    begin
      SideInfo.Scfsi[0][0] := (ScfsiBits and 8) <> 0;
      SideInfo.Scfsi[0][1] := (ScfsiBits and 4) <> 0;
      SideInfo.Scfsi[0][2] := (ScfsiBits and 2) <> 0;
      SideInfo.Scfsi[0][3] := (ScfsiBits and 1) <> 0;
    end
    else
    begin
      Ch0s := (ScfsiBits shr 4) and $F;
      Ch1s := ScfsiBits and $F;
      SideInfo.Scfsi[0][0] := (Ch0s and 8) <> 0;
      SideInfo.Scfsi[0][1] := (Ch0s and 4) <> 0;
      SideInfo.Scfsi[0][2] := (Ch0s and 2) <> 0;
      SideInfo.Scfsi[0][3] := (Ch0s and 1) <> 0;
      SideInfo.Scfsi[1][0] := (Ch1s and 8) <> 0;
      SideInfo.Scfsi[1][1] := (Ch1s and 4) <> 0;
      SideInfo.Scfsi[1][2] := (Ch1s and 2) <> 0;
      SideInfo.Scfsi[1][3] := (Ch1s and 1) <> 0;
    end;
  end
  else
  begin
    // MPEG2/2.5: 8-bit main_data_begin, 1-2 private bits, no scfsi
    SideInfo.MainDataBegin := BS.ReadBits(8);
    if Nch = 1 then
      BS.ReadBits(1) // 1 private bit (discard)
    else
      BS.ReadBits(2); // 2 private bits (discard)
    // Scfsi stays zeroed (already done by FillChar above)
  end;

  for g := 0 to NGranules - 1 do
  begin
    for Ch := 0 to Nch - 1 do
    begin
      GI := @SideInfo.Granules[g][Ch];

      GI^.Part23Length := BS.ReadBits(12);
      GI^.BigValues := BS.ReadBits(9);
      if GI^.BigValues > 288 then
        Exit;
      GI^.GlobalGain := BS.ReadBits(8);
      if IsMP1 then
        GI^.ScalefacCompress := BS.ReadBits(4) // MPEG1: 4 bits
      else
        GI^.ScalefacCompress := BS.ReadBits(9); // MPEG2: 9 bits

      if BS.ReadBits(1) = 1 then
      begin
        // window_switching_flag = 1
        GI^.BlockType := BS.ReadBits(2);
        if GI^.BlockType = 0 then
          Exit; // invalid
        if BS.ReadBits(1) = 1 then
          GI^.MixedBlockFlag := True
        else
          GI^.MixedBlockFlag := False;
        GI^.WindowSwitchingFlag := True;

        // region counts fixed for window switching
        GI^.Region0Count := 7;
        GI^.Region1Count := 255;

        if GI^.BlockType = SHORT_BLOCK_TYPE then
        begin
          begin // Short blocks never reuse SCFSI, including mixed blocks.
            SideInfo.Scfsi[Ch][0] := False;
            SideInfo.Scfsi[Ch][1] := False;
            SideInfo.Scfsi[Ch][2] := False;
            SideInfo.Scfsi[Ch][3] := False;
          end;
          if not GI^.MixedBlockFlag then
            GI^.Region0Count := 8;
        end;

        // Read table_select for regions 0 and 1 (10 bits total)
        Tables := BS.ReadBits(10);
        Tables := Tables shl 5;

        GI^.TableSelect[0] := (Tables shr 10) and 31;
        GI^.TableSelect[1] := (Tables shr 5) and 31;
        GI^.TableSelect[2] := 0;

        GI^.SubblockGain[0] := BS.ReadBits(3);
        GI^.SubblockGain[1] := BS.ReadBits(3);
        GI^.SubblockGain[2] := BS.ReadBits(3);
      end
      else
      begin
        GI^.WindowSwitchingFlag := False;
        GI^.BlockType := 0;
        GI^.MixedBlockFlag := False;

        Tables := BS.ReadBits(15);
        GI^.TableSelect[0] := (Tables shr 10) and 31;
        GI^.TableSelect[1] := (Tables shr 5) and 31;
        GI^.TableSelect[2] := Tables and 31;

        GI^.Region0Count := BS.ReadBits(4);
        GI^.Region1Count := BS.ReadBits(3);
      end;

      if IsMP1 then
      begin
        // MPEG1: preflag is explicit bit in stream
        if BS.ReadBits(1) = 1 then
          GI^.Preflag := True
        else
          GI^.Preflag := False;
      end
      else
      begin
        // MPEG2: preflag derived from scalefac_compress
        GI^.Preflag := GI^.ScalefacCompress >= 500;
      end;
      GI^.ScalefacScale := BS.ReadBits(1);
      GI^.Count1TableSelect := BS.ReadBits(1);
    end;
  end;

  Result := True;
end;

end.

