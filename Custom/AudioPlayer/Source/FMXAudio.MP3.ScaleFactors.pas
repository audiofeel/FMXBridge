unit FMXAudio.MP3.ScaleFactors;

{
  FMXAudio.MP3.ScaleFactors.pas - Scale factor decode for MP3 Layer III

  Translated from minimp3.h by lieff:
    L3_read_scalefactors()
    L3_decode_scalefactors()
    L3_ldexp_q2()
  Original: https://github.com/lieff/minimp3

  License: CC0 1.0 Universal (Public Domain)
  https://creativecommons.org/publicdomain/zero/1.0/
}

{$POINTERMATH ON}

interface

uses
  System.SysUtils, System.Math, FMXAudio.MP3.Types;

// L3_ldexp_q2: compute y * 2^(exp_q2/4) matching minimp3 exactly
function L3LdexpQ2(Y: Single; ExpQ2: Integer): Single;

// L3_decode_scalefactors: fills scf[] with dequantized scale factors
procedure L3DecodeScalefactors(const Hdr: array of Byte; IstPos: PByte; var BS: TBsT; const Gr: TL3GrInfo; Scf: PSingle; Ch: Integer);

implementation

const
  G_EXPFRAC: array[0..3] of Single = (9.31322575e-10, 7.83145814e-10, 6.58544508e-10, 5.53767716e-10);

function L3LdexpQ2(Y: Single; ExpQ2: Integer): Single;
var
  E: Integer;
  Tmp: Single;
begin
  Result := Y;
  while ExpQ2 > 0 do
  begin
    if ExpQ2 > 30 * 4 then
      E := 30 * 4
    else
      E := ExpQ2;
    Tmp := G_EXPFRAC[E and 3] * Single(1 shl 30 shr (E shr 2));
    Result := Result * Tmp;
    Dec(ExpQ2, E);
  end;
end;

// Inner read function
procedure L3ReadScalefactors(Scf: PByte; IstPos: PByte; const ScfSize: array of Byte; ScfCountPtr: PByte; // pointer to scf_count array
  var Bitbuf: TBsT; Scfsi: Integer);
var
  i, k, Cnt, Bits, S, MaxScf: Integer;
begin
  i := 0;
  while (i < 4) and (ScfCountPtr[i] <> 0) do
  begin
    Cnt := ScfCountPtr[i];
    if (Scfsi and 8) <> 0 then
    begin
      // Copy from ist_pos (shared from previous granule)
      Move(IstPos^, Scf^, Cnt);
    end
    else
    begin
      Bits := ScfSize[i];
      if Bits = 0 then
      begin
        FillChar(Scf^, Cnt, 0);
        FillChar(IstPos^, Cnt, 0);
      end
      else
      begin
        if Scfsi < 0 then
          MaxScf := (1 shl Bits) - 1
        else
          MaxScf := -1;
        for k := 0 to Cnt - 1 do
        begin
          S := GetBits(Bitbuf, Bits);
          if S = MaxScf then
            PByteArray(IstPos)[k] := 255 // -1 cast to byte
          else
            PByteArray(IstPos)[k] := Byte(S);
          PByteArray(Scf)[k] := Byte(S);
        end;
      end;
    end;
    Inc(IstPos, Cnt);
    Inc(Scf, Cnt);
    Scfsi := Scfsi shl 1;
    Inc(i);
  end;
  // Trailing zeros (minimp3: scf[0]=scf[1]=scf[2]=0)
  PByteArray(Scf)[0] := 0;
  PByteArray(Scf)[1] := 0;
  PByteArray(Scf)[2] := 0;
end;

procedure L3DecodeScalefactors(const Hdr: array of Byte; IstPos: PByte; var BS: TBsT; const Gr: TL3GrInfo; Scf: PSingle; Ch: Integer);
const
  G_SCF_PARTITIONS: array[0..2, 0..27] of Byte = (
    (6, 5, 5, 5, 6, 5, 5, 5, 6, 5, 7, 3, 11, 10, 0, 0, 7, 7, 7, 0, 6, 6, 6, 3, 8, 8, 5, 0),
    (8, 9, 6, 12, 6, 9, 9, 9, 6, 9, 12, 6, 15, 18, 0, 0, 6, 15, 12, 0, 6, 12, 9, 6, 6, 18, 9, 0),
    (9, 9, 6, 12, 9, 9, 9, 9, 9, 9, 12, 6, 18, 18, 0, 0, 12, 12, 12, 0, 12, 9, 9, 6, 15, 12, 9, 0)
  );
  G_SCFC_DECODE: array[0..15] of Byte = (0, 1, 2, 3, 12, 5, 6, 7, 9, 10, 11, 13, 14, 15, 18, 19);
  G_MOD: array[0..23] of Byte = (5, 5, 4, 4, 5, 5, 4, 1, 4, 3, 1, 1, 5, 6, 6, 1, 4, 4, 4, 1, 4, 3, 1, 1);
  G_PREAMP: array[0..9] of Byte = (1, 1, 1, 1, 2, 2, 3, 3, 3, 2);
var
  ScfPartition: PByte;
  ScfSize: array[0..3] of Byte;
  Iscf: array[0..42] of Byte;
  i, ScfShift, GainExp: Integer;
  Scfsi: Integer;
  Gain: Single;
  Part, K, Modprod, Sfc, IsT: Integer;
  PartIdx: Integer;
  Sh: Integer;
  NTotal: Integer;
begin
  // Select partition table
  // minimp3: g_scf_partitions[!!n_short_sfb + !n_long_sfb]
  if Gr.NShortSfb <> 0 then
  begin
    if Gr.NLongSfb = 0 then
      PartIdx := 2
    else
      PartIdx := 1;
  end
  else
    PartIdx := 0;

  ScfPartition := @G_SCF_PARTITIONS[PartIdx][0];
  ScfShift := Integer(Gr.ScalefacScale) + 1;
  Scfsi := Integer(Gr.Scfsi);

  FillChar(Iscf, SizeOf(Iscf), 0);

  if HdrTestMpeg1(Hdr) then
  begin
    // MPEG1: decode scalefac_compress -> (slen1, slen2) via g_scfc_decode
    Part := G_SCFC_DECODE[Gr.ScalefacCompress and 15];
    ScfSize[0] := Part shr 2;
    ScfSize[1] := Part shr 2;
    ScfSize[2] := Part and 3;
    ScfSize[3] := Part and 3;
    L3ReadScalefactors(@Iscf[0], IstPos, ScfSize, ScfPartition, BS, Scfsi);
  end
  else
  begin
    // MPEG2
    if HdrTestIStereo(Hdr) and (Ch <> 0) then
      IsT := 1
    else
      IsT := 0;
    Sfc := Integer(Gr.ScalefacCompress) shr IsT;
    K := IsT * 3 * 4;
    // Find correct row in g_mod
    while True do
    begin
      Modprod := 1;
      for i := 3 downto 0 do
      begin
        ScfSize[i] := Byte((Sfc div Modprod) mod Integer(G_MOD[K + i]));
        Modprod := Modprod * Integer(G_MOD[K + i]);
      end;
      if Sfc < Modprod then
        Break;
      Dec(Sfc, Modprod);
      Inc(K, 4);
    end;
    // C for-loop advances past the selected row before choosing the partition.
    Inc(ScfPartition, K + 4);
    Scfsi := -16;
    L3ReadScalefactors(@Iscf[0], IstPos, ScfSize, ScfPartition, BS, Scfsi);
  end;

  // Apply subblock gains (short blocks) or preemphasis (long blocks)
  if Gr.NShortSfb <> 0 then
  begin
    Sh := 3 - ScfShift;
    i := 0;
    while i < Integer(Gr.NShortSfb) do
    begin
      Iscf[Integer(Gr.NLongSfb) + i + 0] := Iscf[Integer(Gr.NLongSfb) + i + 0] + Integer(Gr.SubblockGain[0]) shl Sh;
      Iscf[Integer(Gr.NLongSfb) + i + 1] := Iscf[Integer(Gr.NLongSfb) + i + 1] + Integer(Gr.SubblockGain[1]) shl Sh;
      Iscf[Integer(Gr.NLongSfb) + i + 2] := Iscf[Integer(Gr.NLongSfb) + i + 2] + Integer(Gr.SubblockGain[2]) shl Sh;
      Inc(i, 3);
    end;
  end
  else if Gr.Preflag <> 0 then
  begin
    for i := 0 to 9 do
      Iscf[11 + i] := Iscf[11 + i] + Integer(G_PREAMP[i]);
  end;

  // Compute global gain
  // gain_exp = global_gain + BITS_DEQUANTIZER_OUT*4 - 210 - (MS_STEREO ? 2 : 0)
  GainExp := Integer(Gr.GlobalGain) + BITS_DEQUANTIZER_OUT * 4 - 210;
  if HdrIsMsStereo(Hdr) then
    Dec(GainExp, 2);

  // gain = L3_ldexp_q2(1 << (MAX_SCFI/4), MAX_SCFI - gain_exp)
  Gain := L3LdexpQ2(Single(1 shl (MAX_SCFI div 4)), MAX_SCFI - GainExp);

  // Fill scf[] with per-band scale factors
  NTotal := Integer(Gr.NLongSfb) + Integer(Gr.NShortSfb);
  for i := 0 to NTotal - 1 do
  begin
    PSingleArray(Scf)[i] := L3LdexpQ2(Gain, Integer(Iscf[i]) shl ScfShift);
  end;
end;

end.

