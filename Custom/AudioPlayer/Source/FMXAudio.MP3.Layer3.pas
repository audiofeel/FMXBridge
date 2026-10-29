unit FMXAudio.MP3.Layer3;

{$POINTERMATH ON}

{
  FMXAudio.MP3.Layer3.pas - MPEG-1/2/2.5 Layer III full decode pipeline

  Supports MPEG1, MPEG2, and MPEG2.5
  Translated from minimp3.h by lieff
  Original: https://github.com/lieff/minimp3

  License: CC0 1.0 Universal (Public Domain)
  https://creativecommons.org/publicdomain/zero/1.0/

  To the extent possible under law, the author(s) of the original minimp3
  have dedicated all copyright and related and neighboring rights to this
  software to the public domain worldwide.
}

interface

uses
  System.SysUtils, System.Classes, System.Math, FMXAudio.MP3.Types,
  FMXAudio.MP3.Bitstream, FMXAudio.MP3.Huffman, FMXAudio.MP3.ScaleFactors;

type
  TMP3Layer3Decoder = class
  private
    FDec: TMP3Dec;

    procedure DoL3Decode(var BS: TBsT; var GrInfo: array of TL3GrInfo; Nch: Integer; Grbuf: array of PSingle; ScfPtrs: array of PSingle; IstPtrs: array of PByte);

    procedure BuildGrInfo(const Header: TMP3FrameHeader; const SideInfo: TMP3SideInfo; GranIdx: Integer; var GrInfo: array of TL3GrInfo);

  public
    constructor Create;
    procedure Reset;
    function State: TMP3Dec;
    procedure Restore(const Value: TMP3Dec);

    procedure DecodeFrame(const Header: TMP3FrameHeader; const SideInfo: TMP3SideInfo; const MainDataBuf: TBytes; MainDataBegin: Integer; out PCMLeft, PCMRight: TArray<Single>);
  end;

implementation

// ---------------------------------------------------------------------------
// L3_midside_stereo
// ---------------------------------------------------------------------------

procedure L3MidsideStereo(Left: PSingle; N: Integer);
var
  i: Integer;
  Right: PSingle;
  A, B: Single;
begin
  Right := Left + 576;
  for i := 0 to N - 1 do
  begin
    A := PSingle(Left)[i];
    B := PSingle(Right)[i];
    PSingle(Left)[i] := A + B;
    PSingle(Right)[i] := A - B;
  end;
end;

// ---------------------------------------------------------------------------
// L3_intensity_stereo_band
// ---------------------------------------------------------------------------
procedure L3IntensityStereoBand(Left: PSingle; N: Integer; Kl, Kr: Single);
var
  i: Integer;
  Right: PSingle;
begin
  Right := Left + 576;
  for i := 0 to N - 1 do
  begin
    PSingle(Right)[i] := PSingle(Left)[i] * Kr;
    PSingle(Left)[i] := PSingle(Left)[i] * Kl;
  end;
end;

// ---------------------------------------------------------------------------
// L3_stereo_top_band
// ---------------------------------------------------------------------------
procedure L3StereoTopBand(Right: PSingle; Sfb: PByte; Nbands: Integer; MaxBand: PInteger);
var
  i, k: Integer;
  P: PSingle;
begin
  PIntegerArray(MaxBand)[0] := -1;
  PIntegerArray(MaxBand)[1] := -1;
  PIntegerArray(MaxBand)[2] := -1;
  P := Right;
  for i := 0 to Nbands - 1 do
  begin
    k := 0;
    while k < Integer(PByteArray(Sfb)[i]) do
    begin
      if (PSingle(P)[k] <> 0) or (PSingle(P)[k + 1] <> 0) then
      begin
        PIntegerArray(MaxBand)[i mod 3] := i;
        Break;
      end;
      Inc(k, 2);
    end;
    Inc(P, PByteArray(Sfb)[i]);
  end;
end;

// ---------------------------------------------------------------------------
// L3_stereo_process
// ---------------------------------------------------------------------------
procedure L3StereoProcess(Left: PSingle; IstPos: PByte; Sfb: PByte; const Hdr: array of Byte; MaxBand: PInteger; Mpeg2Sh: Integer);
const
  G_PAN: array[0..13] of Single = (
    0, 1, 0.21132487, 0.78867513, 0.36602540, 0.63397460, 0.5, 0.5,
    0.63397460, 0.36602540, 0.78867513, 0.21132487, 1, 0
  );
var
  i: Integer;
  MaxPos: Cardinal;
  Ipos: Cardinal;
  Kl, Kr, S: Single;
  P: PSingle;
begin
  if HdrTestMpeg1(Hdr) then
    MaxPos := 7
  else
    MaxPos := 64;
  P := Left;
  i := 0;
  while PByteArray(Sfb)[i] <> 0 do
  begin
    Ipos := PByteArray(IstPos)[i];
    if (i > PIntegerArray(MaxBand)[i mod 3]) and (Ipos < MaxPos) then
    begin
      if HdrTestMsStereo(Hdr) then
        S := 1.41421356
      else
        S := 1.0;
      if HdrTestMpeg1(Hdr) then
      begin
        Kl := G_PAN[2 * Ipos];
        Kr := G_PAN[2 * Ipos + 1];
      end
      else
      begin
        Kl := 1.0;
        Kr := L3LdexpQ2(1.0, Integer((Ipos + 1) shr 1) shl Mpeg2Sh);
        if (Ipos and 1) <> 0 then
        begin
          Kl := Kr;
          Kr := 1.0;
        end;
      end;
      L3IntensityStereoBand(P, PByteArray(Sfb)[i], Kl * S, Kr * S);
    end
    else if HdrTestMsStereo(Hdr) then
      L3MidsideStereo(P, PByteArray(Sfb)[i]);
    Inc(P, PByteArray(Sfb)[i]);
    Inc(i);
  end;
end;

// ---------------------------------------------------------------------------
// L3_intensity_stereo
// gr_ptr points to an array of 2 TL3GrInfo records
// ---------------------------------------------------------------------------
procedure L3IntensityStereo(Left: PSingle; IstPos: PByte; GrPtr: PByte; const Hdr: array of Byte);
var
  MaxBand: array[0..2] of Integer;
  NSfb, i, MaxBlocks, Mx: Integer;
  DefaultPos, Itop, Prev: Integer;
  Gr0, Gr1: ^TL3GrInfo;
begin
  Gr0 := Pointer(GrPtr);
  Gr1 := Pointer(GrPtr + SizeOf(TL3GrInfo));

  NSfb := Gr0^.NLongSfb + Gr0^.NShortSfb;
  if Gr0^.NShortSfb <> 0 then
    MaxBlocks := 3
  else
    MaxBlocks := 1;

  L3StereoTopBand(Left + 576, Gr0^.Sfbtab, NSfb, @MaxBand[0]);

  if Gr0^.NLongSfb <> 0 then
  begin
    Mx := MaxBand[0];
    if MaxBand[1] > Mx then
      Mx := MaxBand[1];
    if MaxBand[2] > Mx then
      Mx := MaxBand[2];
    MaxBand[0] := Mx;
    MaxBand[1] := Mx;
    MaxBand[2] := Mx;
  end;

  for i := 0 to MaxBlocks - 1 do
  begin
    if HdrTestMpeg1(Hdr) then
      DefaultPos := 3
    else
      DefaultPos := 0;
    Itop := NSfb - MaxBlocks + i;
    Prev := Itop - MaxBlocks;
    if PIntegerArray(@MaxBand)[i] >= Prev then
      PByteArray(IstPos)[Itop] := DefaultPos
    else
      PByteArray(IstPos)[Itop] := PByteArray(IstPos)[Prev];
  end;

  L3StereoProcess(Left, IstPos, Gr0^.Sfbtab, Hdr, @MaxBand[0], Integer(Gr1^.ScalefacCompress) and 1);
end;

// ---------------------------------------------------------------------------
// L3_reorder
// ---------------------------------------------------------------------------
procedure L3Reorder(Grbuf: PSingle; Scratch: PSingle; Sfb: PByte);
var
  Len, i: Integer;
  Src, Dst: PSingle;
begin
  Src := Grbuf;
  Dst := Scratch;
  while PByteArray(Sfb)[0] <> 0 do
  begin
    Len := PByteArray(Sfb)[0];
    for i := 0 to Len - 1 do
    begin
      Dst^ := PSingle(Src + 0 * Len + i)^;
      Inc(Dst);
      Dst^ := PSingle(Src + 1 * Len + i)^;
      Inc(Dst);
      Dst^ := PSingle(Src + 2 * Len + i)^;
      Inc(Dst);
    end;
    Inc(Sfb, 3);
    Inc(Src, 3 * Len);
  end;
  Move(Scratch^, Grbuf^, Integer(Dst - Scratch) * SizeOf(Single));
end;

// ---------------------------------------------------------------------------
// L3_antialias
// ---------------------------------------------------------------------------
procedure L3Antialias(Grbuf: PSingle; Nbands: Integer);
var
  i: Integer;
  U, D: Single;
  P: PSingle;
begin
  P := Grbuf;
  while Nbands > 0 do
  begin
    for i := 0 to 7 do
    begin
      U := PSingle(P)[18 + i];
      D := PSingle(P)[17 - i];
      PSingle(P)[18 + i] := U * G_AA_CS[i] - D * G_AA_CA[i];
      PSingle(P)[17 - i] := U * G_AA_CA[i] + D * G_AA_CS[i];
    end;
    Inc(P, 18);
    Dec(Nbands);
  end;
end;

// ---------------------------------------------------------------------------
// L3_dct3_9
// ---------------------------------------------------------------------------
procedure L3Dct39(Y: PSingle);
var
  S0, S1, S2, S3, S4, S5, S6, S7, S8, T0, T2, T4: Single;
begin
  S0 := PSingle(Y)[0];
  S2 := PSingle(Y)[2];
  S4 := PSingle(Y)[4];
  S6 := PSingle(Y)[6];
  S8 := PSingle(Y)[8];
  T0 := S0 + S6 * 0.5;
  S0 := S0 - S6;
  T4 := (S4 + S2) * 0.93969262;
  T2 := (S8 + S2) * 0.76604444;
  S6 := (S4 - S8) * 0.17364818;
  S4 := S4 + S8 - S2;
  S2 := S0 - S4 * 0.5;
  PSingle(Y)[4] := S4 + S0;
  S8 := T0 - T2 + S6;
  S0 := T0 - T4 + T2;
  S4 := T0 + T4 - S6;

  S1 := PSingle(Y)[1];
  S3 := PSingle(Y)[3];
  S5 := PSingle(Y)[5];
  S7 := PSingle(Y)[7];
  S3 := S3 * 0.86602540;
  T0 := (S5 + S1) * 0.98480775;
  T4 := (S5 - S7) * 0.34202014;
  T2 := (S1 + S7) * 0.64278761;
  S1 := (S1 - S5 - S7) * 0.86602540;

  S5 := T0 - S3 - T2;
  S7 := T4 - S3 - T0;
  S3 := T4 + S3 - T2;

  PSingle(Y)[0] := S4 - S7;
  PSingle(Y)[1] := S2 + S1;
  PSingle(Y)[2] := S0 - S3;
  PSingle(Y)[3] := S8 + S5;
  PSingle(Y)[5] := S8 - S5;
  PSingle(Y)[6] := S0 + S3;
  PSingle(Y)[7] := S2 - S1;
  PSingle(Y)[8] := S4 + S7;
end;

// ---------------------------------------------------------------------------
// L3_imdct36
// ---------------------------------------------------------------------------
procedure L3Imdct36(Grbuf: PSingle; Overlap: PSingle; const Window: array of Single; Nbands: Integer);
var
  i, j: Integer;
  Co, SI: array[0..8] of Single;
  Ovl, Sum: Single;
  Gb, Ov: PSingle;
begin
  Gb := Grbuf;
  Ov := Overlap;
  for j := 0 to Nbands - 1 do
  begin
    Co[0] := -PSingle(Gb)[0];
    SI[0] := PSingle(Gb)[17];
    for i := 0 to 3 do
    begin
      SI[8 - 2 * i] := PSingle(Gb)[4 * i + 1] - PSingle(Gb)[4 * i + 2];
      Co[1 + 2 * i] := PSingle(Gb)[4 * i + 1] + PSingle(Gb)[4 * i + 2];
      SI[7 - 2 * i] := PSingle(Gb)[4 * i + 4] - PSingle(Gb)[4 * i + 3];
      Co[2 + 2 * i] := -(PSingle(Gb)[4 * i + 3] + PSingle(Gb)[4 * i + 4]);
    end;
    L3Dct39(@Co[0]);
    L3Dct39(@SI[0]);

    SI[1] := -SI[1];
    SI[3] := -SI[3];
    SI[5] := -SI[5];
    SI[7] := -SI[7];

    for i := 0 to 8 do
    begin
      Ovl := PSingle(Ov)[i];
      Sum := Co[i] * G_TWID9[9 + i] + SI[i] * G_TWID9[i];
      PSingle(Ov)[i] := Co[i] * G_TWID9[i] - SI[i] * G_TWID9[9 + i];
      PSingle(Gb)[i] := Ovl * Window[i] - Sum * Window[9 + i];
      PSingle(Gb)[17 - i] := Ovl * Window[9 + i] + Sum * Window[i];
    end;
    Inc(Gb, 18);
    Inc(Ov, 9);
  end;
end;

// ---------------------------------------------------------------------------
// L3_idct3, L3_imdct12, L3_imdct_short
// ---------------------------------------------------------------------------
procedure L3Idct3(X0, X1, X2: Single; Dst: PSingle);
var
  M1, A1: Single;
begin
  M1 := X1 * 0.86602540;
  A1 := X0 - X2 * 0.5;
  PSingle(Dst)[1] := X0 + X2;
  PSingle(Dst)[0] := A1 + M1;
  PSingle(Dst)[2] := A1 - M1;
end;

procedure L3Imdct12(X: PSingle; Dst: PSingle; Overlap: PSingle);
var
  Co, SI: array[0..2] of Single;
  i: Integer;
  Ovl, Sum: Single;
begin
  L3Idct3(-PSingle(X)[0], PSingle(X)[6] + PSingle(X)[3], PSingle(X)[12] + PSingle(X)[9], @Co[0]);
  L3Idct3(PSingle(X)[15], PSingle(X)[12] - PSingle(X)[9], PSingle(X)[6] - PSingle(X)[3], @SI[0]);
  SI[1] := -SI[1];

  for i := 0 to 2 do
  begin
    Ovl := PSingle(Overlap)[i];
    Sum := Co[i] * G_TWID3[3 + i] + SI[i] * G_TWID3[i];
    PSingle(Overlap)[i] := Co[i] * G_TWID3[i] - SI[i] * G_TWID3[3 + i];
    PSingle(Dst)[i] := Ovl * G_TWID3[2 - i] - Sum * G_TWID3[5 - i];
    PSingle(Dst)[5 - i] := Ovl * G_TWID3[5 - i] + Sum * G_TWID3[2 - i];
  end;
end;

procedure L3ImdctShort(Grbuf: PSingle; Overlap: PSingle; Nbands: Integer);
var
  Tmp: array[0..17] of Single;
begin
  while Nbands > 0 do
  begin
    Move(Grbuf^, Tmp[0], 18 * SizeOf(Single));
    Move(Overlap^, Grbuf^, 6 * SizeOf(Single));
    L3Imdct12(@Tmp[0], Grbuf + 6, Overlap + 6);
    L3Imdct12(@Tmp[1], Grbuf + 12, Overlap + 6);
    L3Imdct12(@Tmp[2], Overlap, Overlap + 6);
    Inc(Overlap, 9);
    Inc(Grbuf, 18);
    Dec(Nbands);
  end;
end;

// ---------------------------------------------------------------------------
// L3_change_sign
// Minimp3: for b=0..31 step 2, for i=1..17 step 2: grbuf[18+i] = -grbuf[18+i]
// ---------------------------------------------------------------------------
procedure L3ChangeSign(Grbuf: PSingle);
var
  b, i: Integer;
  P: PSingle;
begin
  P := Grbuf + 18;
  b := 0;
  while b < 32 do
  begin
    i := 1;
    while i < 18 do
    begin
      PSingle(P)[i] := -PSingle(P)[i];
      Inc(i, 2);
    end;
    Inc(P, 36); // skip 2 subbands (b += 2)
    Inc(b, 2);
  end;
end;

// ---------------------------------------------------------------------------
// L3_imdct_gr
// ---------------------------------------------------------------------------
procedure L3ImdctGr(Grbuf: PSingle; Overlap: PSingle; BlockType: Cardinal; NLongBands: Cardinal);
begin
  if NLongBands > 0 then
  begin
    L3Imdct36(Grbuf, Overlap, G_MDCT_WINDOW[0], NLongBands);
    Inc(Grbuf, 18 * Integer(NLongBands));
    Inc(Overlap, 9 * Integer(NLongBands));
  end;
  if BlockType = SHORT_BLOCK_TYPE then
    L3ImdctShort(Grbuf, Overlap, 32 - Integer(NLongBands))
  else if BlockType = STOP_BLOCK_TYPE then
    L3Imdct36(Grbuf, Overlap, G_MDCT_WINDOW[1], 32 - Integer(NLongBands))
  else
    L3Imdct36(Grbuf, Overlap, G_MDCT_WINDOW[0], 32 - Integer(NLongBands));
end;

// ---------------------------------------------------------------------------
// mp3d_DCT_II - polyphase DCT for synthesis filter bank
// ---------------------------------------------------------------------------
procedure Mp3dDctIi(Grbuf: PSingle; N: Integer);
var
  k, i: Integer;
  T: array[0..3, 0..7] of Single;
  X: PSingle;
  Y: PSingle;
  X0, X1, X2, X3, X4, X5, X6, X7, Xt: Single;
  Tt0, Tt1, Tt2, Tt3: Single;
begin
  for k := 0 to N - 1 do
  begin
    Y := PSingle(Grbuf + k);

    // First stage: butterfly pairs
    for i := 0 to 7 do
    begin
      Tt0 := Y[i * 18] + Y[(31 - i) * 18];
      Tt1 := Y[(15 - i) * 18] + Y[(16 + i) * 18];
      Tt2 := (Y[(15 - i) * 18] - Y[(16 + i) * 18]) * G_SEC[3 * i];
      Tt3 := (Y[i * 18] - Y[(31 - i) * 18]) * G_SEC[3 * i + 1];
      T[0][i] := Tt0 + Tt1;
      T[1][i] := (Tt0 - Tt1) * G_SEC[3 * i + 2];
      T[2][i] := Tt3 + Tt2;
      T[3][i] := (Tt3 - Tt2) * G_SEC[3 * i + 2];
    end;

    // Second stage: radix-8 butterflies on each row
    for i := 0 to 3 do
    begin
      X := PSingle(@T[i][0]);
      X0 := X[0];
      X1 := X[1];
      X2 := X[2];
      X3 := X[3];
      X4 := X[4];
      X5 := X[5];
      X6 := X[6];
      X7 := X[7];

      Xt := X0 - X7;
      X0 := X0 + X7;
      X7 := X1 - X6;
      X1 := X1 + X6;
      X6 := X2 - X5;
      X2 := X2 + X5;
      X5 := X3 - X4;
      X3 := X3 + X4;
      X4 := X0 - X3;
      X0 := X0 + X3;
      X3 := X1 - X2;
      X1 := X1 + X2;

      X[0] := X0 + X1;
      X[4] := (X0 - X1) * 0.70710677;
      X5 := X5 + X6;
      X6 := (X6 + X7) * 0.70710677;
      X7 := X7 + Xt;
      X3 := (X3 + X4) * 0.70710677;
      X5 := X5 - X7 * 0.198912367;
      X7 := X7 + X5 * 0.382683432;
      X5 := X5 - X7 * 0.198912367;
      X0 := Xt - X6;
      Xt := Xt + X6;
      X[1] := (Xt + X7) * 0.50979561;
      X[2] := (X4 + X3) * 0.54119611;
      X[3] := (X0 - X5) * 0.60134488;
      X[5] := (X0 + X5) * 0.89997619;
      X[6] := (X4 - X3) * 1.30656302;
      X[7] := (Xt - X7) * 2.56291556;
    end;

    // Write output: interleave the 4 rows
    for i := 0 to 6 do
    begin
      Y[0 * 18] := T[0][i];
      Y[1 * 18] := T[2][i] + T[3][i] + T[3][i + 1];
      Y[2 * 18] := T[1][i] + T[1][i + 1];
      Y[3 * 18] := T[2][i + 1] + T[3][i] + T[3][i + 1];
      Y := PSingle(@Y[4 * 18]);
    end;
    Y[0 * 18] := T[0][7];
    Y[1 * 18] := T[2][7] + T[3][7];
    Y[2 * 18] := T[1][7];
    Y[3 * 18] := T[3][7];
  end;
end;

// ---------------------------------------------------------------------------
// mp3d_scale_pcm
// ---------------------------------------------------------------------------
function Mp3dScalePcm(Sample: Single): SmallInt;
var
  S: Integer;
begin
  if Sample >= 32766.5 then
  begin
    Result := 32767;
    Exit;
  end;
  if Sample <= -32767.5 then
  begin
    Result := -32768;
    Exit;
  end;
  S := Trunc(Sample + 0.5);
  if S < 0 then
    Dec(S);
  Result := SmallInt(S);
end;

// ---------------------------------------------------------------------------
// mp3d_synth_pair
// ---------------------------------------------------------------------------
procedure Mp3dSynthPair(PCM: PSmallInt; Nch: Integer; Z: PSingle);
var
  A: Single;
begin
  A :=
    (PSingle(Z)[14 * 64] - PSingle(Z)[0]) * 29
    + (PSingle(Z)[1 * 64] + PSingle(Z)[13 * 64]) * 213
    + (PSingle(Z)[12 * 64] - PSingle(Z)[2 * 64]) * 459
    + (PSingle(Z)[3 * 64] + PSingle(Z)[11 * 64]) * 2037
    + (PSingle(Z)[10 * 64] - PSingle(Z)[4 * 64]) * 5153
    + (PSingle(Z)[5 * 64] + PSingle(Z)[9 * 64]) * 6574
    + (PSingle(Z)[8 * 64] - PSingle(Z)[6 * 64]) * 37489
    + PSingle(Z)[7 * 64] * 75038;
  PSmallInt(PCM)[0] := Mp3dScalePcm(A);

  Inc(Z, 2);
  A :=
    PSingle(Z)[14 * 64] * 104
    + PSingle(Z)[12 * 64] * 1567
    + PSingle(Z)[10 * 64] * 9727
    + PSingle(Z)[8 * 64] * 64019
    + PSingle(Z)[6 * 64] * (-9975)
    + PSingle(Z)[4 * 64] * (-45)
    + PSingle(Z)[2 * 64] * 146
    + PSingle(Z)[0 * 64] * (-5);
  PSmallInt(PCM)[16 * Nch] := Mp3dScalePcm(A);
end;

// ---------------------------------------------------------------------------
// mp3d_synth
// ---------------------------------------------------------------------------
procedure Mp3dSynth(Xl: PSingle; Dstl: PSmallInt; Nch: Integer; Lins: PSingle);
var
  i, j: Integer;
  Xr: PSingle;
  Dstr: PSmallInt;
  Zlin: PSingle;
  W: PSingle;
  A, B: array[0..3] of Single;
  W0, W1: Single;
  Vz, Vy: PSingle;
  Xla, Xra: PSingle;
  Dstla, Dstra: PSmallInt;
begin
  Xr := Xl + 576 * (Nch - 1);
  Dstr := Dstl + (Nch - 1);
  Zlin := PSingle(Lins + 15 * 64);
  W := @G_WIN[0];
  Xla := PSingle(Xl);
  Xra := PSingle(Xr);
  Dstla := PSmallInt(Dstl);
  Dstra := PSmallInt(Dstr);

  Zlin[4 * 15] := Xla[18 * 16];
  Zlin[4 * 15 + 1] := Xra[18 * 16];
  Zlin[4 * 15 + 2] := Xla[0];
  Zlin[4 * 15 + 3] := Xra[0];

  Zlin[4 * 31] := Xla[1 + 18 * 16];
  Zlin[4 * 31 + 1] := Xra[1 + 18 * 16];
  Zlin[4 * 31 + 2] := Xla[1];
  Zlin[4 * 31 + 3] := Xra[1];

  Mp3dSynthPair(Dstr, Nch, Lins + 4 * 15 + 1);
  Mp3dSynthPair(Dstr + 32 * Nch, Nch, Lins + 4 * 15 + 64 + 1);
  Mp3dSynthPair(Dstl, Nch, Lins + 4 * 15);
  Mp3dSynthPair(Dstl + 32 * Nch, Nch, Lins + 4 * 15 + 64);

  // S0,S2,S1,S2,S1,S2,S1,S2 pattern for k=0..7
  for i := 14 downto 0 do
  begin
    // Fill zlin
    Zlin[4 * i] := Xla[18 * (31 - i)];
    Zlin[4 * i + 1] := Xra[18 * (31 - i)];
    Zlin[4 * i + 2] := Xla[1 + 18 * (31 - i)];
    Zlin[4 * i + 3] := Xra[1 + 18 * (31 - i)];
    Zlin[4 * (i + 16)] := Xla[1 + 18 * (1 + i)];
    Zlin[4 * (i + 16) + 1] := Xra[1 + 18 * (1 + i)];
    Zlin[4 * (i - 16) + 2] := Xla[18 * (1 + i)];
    Zlin[4 * (i - 16) + 3] := Xra[18 * (1 + i)];

    // S0(0): b = vz*w1+vy*w0, a = vz*w0-vy*w1
    W0 := W^;
    Inc(W);
    W1 := W^;
    Inc(W);
    Vz := @Zlin[4 * i - 0 * 64];
    Vy := @Zlin[4 * i - 15 * 64];
    for j := 0 to 3 do
    begin
      B[j] := Vz[j] * W1 + Vy[j] * W0;
      A[j] := Vz[j] * W0 - Vy[j] * W1;
    end;

    // S2(1): a += vy*w1 - vz*w0
    W0 := W^;
    Inc(W);
    W1 := W^;
    Inc(W);
    Vz := @Zlin[4 * i - 1 * 64];
    Vy := @Zlin[4 * i - 14 * 64];
    for j := 0 to 3 do
    begin
      B[j] := B[j] + Vz[j] * W1 + Vy[j] * W0;
      A[j] := A[j] + Vy[j] * W1 - Vz[j] * W0;
    end;

    // S1(2): a += vz*w0 - vy*w1
    W0 := W^;
    Inc(W);
    W1 := W^;
    Inc(W);
    Vz := @Zlin[4 * i - 2 * 64];
    Vy := @Zlin[4 * i - 13 * 64];
    for j := 0 to 3 do
    begin
      B[j] := B[j] + Vz[j] * W1 + Vy[j] * W0;
      A[j] := A[j] + Vz[j] * W0 - Vy[j] * W1;
    end;

    // S2(3)
    W0 := W^;
    Inc(W);
    W1 := W^;
    Inc(W);
    Vz := @Zlin[4 * i - 3 * 64];
    Vy := @Zlin[4 * i - 12 * 64];
    for j := 0 to 3 do
    begin
      B[j] := B[j] + Vz[j] * W1 + Vy[j] * W0;
      A[j] := A[j] + Vy[j] * W1 - Vz[j] * W0;
    end;

    // S1(4)
    W0 := W^;
    Inc(W);
    W1 := W^;
    Inc(W);
    Vz := @Zlin[4 * i - 4 * 64];
    Vy := @Zlin[4 * i - 11 * 64];
    for j := 0 to 3 do
    begin
      B[j] := B[j] + Vz[j] * W1 + Vy[j] * W0;
      A[j] := A[j] + Vz[j] * W0 - Vy[j] * W1;
    end;

    // S2(5)
    W0 := W^;
    Inc(W);
    W1 := W^;
    Inc(W);
    Vz := @Zlin[4 * i - 5 * 64];
    Vy := @Zlin[4 * i - 10 * 64];
    for j := 0 to 3 do
    begin
      B[j] := B[j] + Vz[j] * W1 + Vy[j] * W0;
      A[j] := A[j] + Vy[j] * W1 - Vz[j] * W0;
    end;

    // S1(6)
    W0 := W^;
    Inc(W);
    W1 := W^;
    Inc(W);
    Vz := @Zlin[4 * i - 6 * 64];
    Vy := @Zlin[4 * i - 9 * 64];
    for j := 0 to 3 do
    begin
      B[j] := B[j] + Vz[j] * W1 + Vy[j] * W0;
      A[j] := A[j] + Vz[j] * W0 - Vy[j] * W1;
    end;

    // S2(7)
    W0 := W^;
    Inc(W);
    W1 := W^;
    Inc(W);
    Vz := @Zlin[4 * i - 7 * 64];
    Vy := @Zlin[4 * i - 8 * 64];
    for j := 0 to 3 do
    begin
      B[j] := B[j] + Vz[j] * W1 + Vy[j] * W0;
      A[j] := A[j] + Vy[j] * W1 - Vz[j] * W0;
    end;

    Dstra[(15 - i) * Nch] := Mp3dScalePcm(A[1]);
    Dstra[(17 + i) * Nch] := Mp3dScalePcm(B[1]);
    Dstla[(15 - i) * Nch] := Mp3dScalePcm(A[0]);
    Dstla[(17 + i) * Nch] := Mp3dScalePcm(B[0]);
    Dstra[(47 - i) * Nch] := Mp3dScalePcm(A[3]);
    Dstra[(49 + i) * Nch] := Mp3dScalePcm(B[3]);
    Dstla[(47 - i) * Nch] := Mp3dScalePcm(A[2]);
    Dstla[(49 + i) * Nch] := Mp3dScalePcm(B[2]);
  end;
end;

// ---------------------------------------------------------------------------
// mp3d_synth_granule
// ---------------------------------------------------------------------------
procedure Mp3dSynthGranule(QmfState: PSingle; Grbuf: PSingle; Nbands, Nch: Integer; PCM: PSmallInt; Lins: PSingle);
var
  i: Integer;
begin
  for i := 0 to Nch - 1 do
    Mp3dDctIi(Grbuf + 576 * i, Nbands);

  Move(QmfState^, Lins^, SizeOf(Single) * 15 * 64);

  i := 0;
  while i < Nbands do
  begin
    Mp3dSynth(Grbuf + i, PCM + 32 * Nch * i, Nch, Lins + i * 64);
    Inc(i, 2);
  end;

  // Preserve the inactive right filter history across mono/stereo transitions.
  if Nch = 1 then
  begin
    i := 0;
    while i < 15 * 64 do
    begin
      QmfState[i] := Lins[Nbands * 64 + i];
      Inc(i, 2);
    end;
  end
  else
    Move((Lins + Nbands * 64)^, QmfState^, SizeOf(Single) * 15 * 64);
end;

// ---------------------------------------------------------------------------
// DoL3Decode - matches minimp3 L3_decode()
// ---------------------------------------------------------------------------
procedure TMP3Layer3Decoder.DoL3Decode(var BS: TBsT; var GrInfo: array of TL3GrInfo; Nch: Integer; Grbuf: array of PSingle; ScfPtrs: array of PSingle; IstPtrs: array of PByte);
var
  Ch, Layer3grLimit: Integer;
  AaBands, NLongBands: Integer;
  SrIdx: Integer;
  Scratch: array[0..575] of Single;
  Hdr: array[0..3] of Byte;
begin
  Hdr[0] := FDec.Header[0];
  Hdr[1] := FDec.Header[1];
  Hdr[2] := FDec.Header[2];
  Hdr[3] := FDec.Header[3];

  // Decode scalefactors + Huffman for each channel
  for Ch := 0 to Nch - 1 do
  begin
    Layer3grLimit := BS.Pos + GrInfo[Ch].Part23Length;
    L3DecodeScalefactors(Hdr, IstPtrs[Ch], BS, GrInfo[Ch], ScfPtrs[Ch], Ch);
    L3Huffman(Grbuf[Ch], BS, GrInfo[Ch], ScfPtrs[Ch], Layer3grLimit);
  end;

  // Stereo processing
  if HdrTestIStereo(Hdr) then
    L3IntensityStereo(Grbuf[0], IstPtrs[1], @GrInfo[0], Hdr)
  else if HdrIsMsStereo(Hdr) then
    L3MidsideStereo(Grbuf[0], 576);

  // Compute sample rate index for n_long_bands
  SrIdx := HdrGetMySampleRate(Hdr);
  if SrIdx <> 0 then
    Dec(SrIdx);

  // Per-channel post-processing
  for Ch := 0 to Nch - 1 do
  begin
    AaBands := 31;
    if GrInfo[Ch].MixedBlockFlag <> 0 then
      NLongBands := 2 shl Ord(SrIdx = 2)
    else
      NLongBands := 0;

    if GrInfo[Ch].NShortSfb <> 0 then
    begin
      AaBands := NLongBands - 1;
      FillChar(Scratch, SizeOf(Scratch), 0);
      L3Reorder(Grbuf[Ch] + NLongBands * 18, @Scratch[0], GrInfo[Ch].Sfbtab + GrInfo[Ch].NLongSfb);
    end;

    L3Antialias(Grbuf[Ch], AaBands);
    L3ImdctGr(Grbuf[Ch], @FDec.MdctOverlap[Ch][0], GrInfo[Ch].BlockType, NLongBands);
    L3ChangeSign(Grbuf[Ch]);
  end;
end;

// ---------------------------------------------------------------------------
// BuildGrInfo - converts TMP3SideInfo granule to TL3GrInfo
// ---------------------------------------------------------------------------
procedure TMP3Layer3Decoder.BuildGrInfo(const Header: TMP3FrameHeader; const SideInfo: TMP3SideInfo; GranIdx: Integer; var GrInfo: array of TL3GrInfo);
var
  Ch, Nch: Integer;
  GI: ^TGranuleInfo;
  Gr: ^TL3GrInfo;
  SrIdx: Integer;
  SF: TScfsi;
begin
  Nch := Header.Channels;

  SrIdx := HdrGetMySampleRate(Header.Hdr);
  if SrIdx <> 0 then
    Dec(SrIdx);

  for Ch := 0 to Nch - 1 do
  begin
    GI := @SideInfo.Granules[GranIdx][Ch];
    Gr := @GrInfo[Ch];

    Gr^.Part23Length := GI^.Part23Length;
    Gr^.BigValues := GI^.BigValues;
    Gr^.GlobalGain := GI^.GlobalGain;
    Gr^.ScalefacCompress := GI^.ScalefacCompress;
    Gr^.BlockType := GI^.BlockType;
    Gr^.MixedBlockFlag := Ord(GI^.MixedBlockFlag);
    Gr^.TableSelect[0] := GI^.TableSelect[0];
    Gr^.TableSelect[1] := GI^.TableSelect[1];
    Gr^.TableSelect[2] := GI^.TableSelect[2];
    Gr^.SubblockGain[0] := GI^.SubblockGain[0];
    Gr^.SubblockGain[1] := GI^.SubblockGain[1];
    Gr^.SubblockGain[2] := GI^.SubblockGain[2];
    Gr^.Preflag := Ord(GI^.Preflag);
    Gr^.ScalefacScale := GI^.ScalefacScale;
    Gr^.Count1Table := GI^.Count1TableSelect;
    Gr^.RegionCount[0] := GI^.Region0Count;
    Gr^.RegionCount[1] := GI^.Region1Count;
    Gr^.RegionCount[2] := 255;

    // scfsi from SideInfo (only meaningful for granule 1)
    SF := SideInfo.Scfsi[Ch];
    Gr^.Scfsi := 0;
    if SF[0] then
      Gr^.Scfsi := Gr^.Scfsi or 8;
    if SF[1] then
      Gr^.Scfsi := Gr^.Scfsi or 4;
    if SF[2] then
      Gr^.Scfsi := Gr^.Scfsi or 2;
    if SF[3] then
      Gr^.Scfsi := Gr^.Scfsi or 1;
    if (GranIdx = 0) or (GI^.BlockType = SHORT_BLOCK_TYPE) then
      Gr^.Scfsi := 0;

    // sfbtab and sfb counts
    if GI^.WindowSwitchingFlag and (GI^.BlockType = SHORT_BLOCK_TYPE) then
    begin
      if GI^.MixedBlockFlag then
      begin
        Gr^.Sfbtab := @G_SCF_MIXED[SrIdx][0];
        if HdrTestMpeg1(Header.Hdr) then
          Gr^.NLongSfb := 8
        else
          Gr^.NLongSfb := 6;
        Gr^.NShortSfb := 30;
      end
      else
      begin
        Gr^.Sfbtab := @G_SCF_SHORT[SrIdx][0];
        Gr^.NLongSfb := 0;
        Gr^.NShortSfb := 39;
        Gr^.RegionCount[0] := 8; // minimp3 sets this for short blocks
      end;
    end
    else
    begin
      Gr^.Sfbtab := @G_SCF_LONG[SrIdx][0];
      Gr^.NLongSfb := 22;
      Gr^.NShortSfb := 0;
    end;
  end;
end;

// ---------------------------------------------------------------------------
// Constructor
// ---------------------------------------------------------------------------
constructor TMP3Layer3Decoder.Create;
begin
  inherited Create;
  FillChar(FDec, SizeOf(FDec), 0);
end;

// ---------------------------------------------------------------------------
// DecodeFrame - main entry point
// ---------------------------------------------------------------------------
procedure TMP3Layer3Decoder.DecodeFrame(const Header: TMP3FrameHeader; const SideInfo: TMP3SideInfo; const MainDataBuf: TBytes; MainDataBegin: Integer; out PCMLeft, PCMRight: TArray<Single>);
var
  Nch, Igr, i: Integer;
  BS: TBsT;
  GrInfo: array[0..1] of TL3GrInfo;
  GrbufAll: array[0..1151] of Single; // contiguous: [0..575]=left, [576..1151]=right
  Grbuf: array[0..1] of PSingle;
  Scf0: array[0..39] of Single;
  Scf1: array[0..39] of Single;
  ScfPtrs: array[0..1] of PSingle;
  Ist0: array[0..38] of Byte;
  Ist1: array[0..38] of Byte;
  IstPtrs: array[0..1] of PByte;
  Pcm16: array[0..1151] of SmallInt; // 576 samples x 2 channels interleaved
begin
  Nch := Header.Channels;

  var NGranules: Integer;
  if HdrTestMpeg1(Header.Hdr) then
    NGranules := 2
  else
    NGranules := 1;

  SetLength(PCMLeft, NGranules * 576);
  SetLength(PCMRight, NGranules * 576);

  // Store raw header for minimp3 macros
  FDec.Header[0] := Header.Hdr[0];
  FDec.Header[1] := Header.Hdr[1];
  FDec.Header[2] := Header.Hdr[2];
  FDec.Header[3] := Header.Hdr[3];

  // Init bitstream: MainDataBuf is already the assembled reservoir+current data
  // MainDataBegin is always 0 here (caller prepends reservoir)
  if Length(MainDataBuf) = 0 then
    Exit;
  BsInit(BS, @MainDataBuf[0], Length(MainDataBuf));

  Grbuf[0] := @GrbufAll[0];
  Grbuf[1] := @GrbufAll[576];
  ScfPtrs[0] := @Scf0[0];
  ScfPtrs[1] := @Scf1[0];
  IstPtrs[0] := @Ist0[0];
  IstPtrs[1] := @Ist1[0];
  for Igr := 0 to NGranules - 1 do
  begin
    // Zero granule buffers
    FillChar(GrbufAll, SizeOf(GrbufAll), 0);
    FillChar(Scf0, SizeOf(Scf0), 0);
    FillChar(Scf1, SizeOf(Scf1), 0);

    // Build gr_info from SideInfo
    BuildGrInfo(Header, SideInfo, Igr, GrInfo);

    // L3_decode
    DoL3Decode(BS, GrInfo, Nch, Grbuf, ScfPtrs, IstPtrs);

    // Synthesis filter bank: outputs interleaved int16 PCM
    // Note: FDec.syn must NOT be zeroed here - it's a persistent ring buffer
    FillChar(Pcm16, SizeOf(Pcm16), 0);
    Mp3dSynthGranule(@FDec.QmfState[0], @GrbufAll[0], 18, Nch, @Pcm16[0], @FDec.Syn[0]);

    // Convert to float and de-interleave
    for i := 0 to 575 do
    begin
      if Nch = 2 then
      begin
        PCMLeft[Igr * 576 + i] := Pcm16[i * 2] / 32768.0;
        PCMRight[Igr * 576 + i] := Pcm16[i * 2 + 1] / 32768.0;
      end
      else
      begin
        PCMLeft[Igr * 576 + i] := Pcm16[i] / 32768.0;
        PCMRight[Igr * 576 + i] := PCMLeft[Igr * 576 + i];
      end;
    end;
  end;
end;

procedure TMP3Layer3Decoder.Reset;
begin
  FillChar(FDec, SizeOf(FDec), 0);
end;

function TMP3Layer3Decoder.State: TMP3Dec;
begin
  Result := FDec
end;

procedure TMP3Layer3Decoder.Restore(const Value: TMP3Dec);
begin
  FDec := Value
end;

end.

