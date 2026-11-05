
unit FMXBridge.Utils;

interface

uses
  System.UITypes,
  System.Classes,
  Winapi.Windows;

// =============================================================================
// Exports
// =============================================================================
type
  TFileDropCallback = procedure(Sender: TObject;
    const FileName: WideString) of object;

procedure SetFileDropCallback(ACallback: TFileDropCallback); stdcall;
procedure NotifyFileDrop(Sender: TObject; const FileName: WideString); stdcall;
function ExtractIconFromResource(const FModule, FOutFile: WideString;
  FIndex: Cardinal; FSize: Integer): Boolean; stdcall;
function VCLFontSizeToFMX(const VCLFontSize: Single): Single; stdcall;
procedure ProcessMessages; stdcall;
function IsWindows11: Boolean; stdcall;
function GetWinAccentColor: TAlphaColor; stdcall;
function GetDesktopImg: WideString; stdcall;
function GetImgColor(const FImage: WideString): TAlphaColor; stdcall;
function ColorSetOpacity(const FColor: TAlphaColor;
  FOpacity: Single): TAlphaColor; stdcall;
function ColorDarker(const FColor: TAlphaColor;
  Percent: Byte): TAlphaColor; stdcall;
function ColorLighter(const FColor: TAlphaColor;
  Percent: Byte): TAlphaColor; stdcall;
function IsLightColor(const FColor: TAlphaColor): Boolean; stdcall;
procedure BeginHaltProc; stdcall;
procedure EndHaltProc; stdcall;
function GetShortCut(Key: Word; Shift: TShiftState): TShortCut; stdcall;
function MbOrTb(Float: Extended; Decimal: Integer;
  const sMb, sGb, sTb: WideString): WideString; stdcall;
function MHzOrGHz(Float: Extended; Decimal: Integer): WideString; stdcall;
function CnvtUTF32ToUTF16(const Str: WideString): WideString; stdcall;
function GetWinMajorVersion: Cardinal; stdcall;
function GetWinBuildNumber: Cardinal; stdcall;
function GetDisplayResolutionX: Integer; stdcall;
function GetDisplayResolutionY: Integer; stdcall;
function GetCurrentDPIValue: Cardinal; stdcall;
procedure GetFMXBridgeBuildDate(var YearW, MonthW, DayW: Word); stdcall;
function GetUserCountryName: WideString; stdcall;
function GetRunningAppCount: Integer; stdcall;
function GetRecycleBinInfo(var FTotalSizeMB: Extended): Boolean; stdcall;
function PlayWavFile1(const WavFileName: WideString): Boolean; stdcall;
function PlayWavFile2(const WavFileName: WideString; Flags: Cardinal)
  : Boolean; stdcall;
function PlayWavFile3(const WavFileName: WideString; Handle, Flags: Cardinal)
  : Boolean; stdcall;
function SystemExit(EWX_Flags: UINT): BOOL; stdcall;
function ReadAllText(const FileName: WideString; out FText: WideString)
  : Boolean; stdcall;
function WriteAllText(const FileName, FText: WideString): Boolean; stdcall;
function AppendAllText(const FileName, FText: WideString): Boolean; stdcall;
function CopyFiles(const SourceDir, DestDir, Masks: WideString;
  Overwrite: Boolean): Integer; stdcall;
function MoveFiles(const SourceDir, DestDir, Masks: WideString;
  Overwrite: Boolean): Integer; stdcall;
procedure FMXBridgeShutDown(const UnInstall: Boolean); stdcall;

implementation

uses
  System.SysUtils, System.Win.Registry, System.Generics.Collections,
  System.UIConsts, System.Math, System.IOUtils,
  Winapi.MMSystem, Winapi.ShellApi,
  FMX.Graphics, FMX.Platform.Win, FMX.Forms;

// =============================================================================
// TFileDropCallback
// =============================================================================
var
  GFileDropCallback: TFileDropCallback = nil;

procedure SetFileDropCallback(ACallback: TFileDropCallback);
begin
  GFileDropCallback := ACallback;
end;

procedure NotifyFileDrop(Sender: TObject; const FileName: WideString);
begin
  if Assigned(GFileDropCallback) then
    GFileDropCallback(Sender, FileName);
end;

// =============================================================================
// ExtractIconFromResource
// =============================================================================
type
  PGrpIconDir = ^TGrpIconDir;

  TGrpIconDir = packed record
    idReserved: Word;
    idType: Word;
    idCount: Word;
  end;

  PGrpIconDirEntry = ^TGrpIconDirEntry;

  TGrpIconDirEntry = packed record
    bWidth: Byte;
    bHeight: Byte;
    bColorCount: Byte;
    bReserved: Byte;
    wPlanes: Word;
    wBitCount: Word;
    dwBytesInRes: DWORD;
    nID: Word;
  end;

  TGroupIndexMap = TArray<HRSRC>;

function EnumProc(HMODULE: HMODULE; lpszType, lpszName: PWideChar;
  lParam: LPARAM): BOOL; stdcall;
var
  ctx: TList<HRSRC>;
  hRes: HRSRC;
begin
  ctx := TList<HRSRC>(lParam);

  hRes := FindResourceW(HMODULE, lpszName, RT_GROUP_ICON);

  if hRes <> 0 then
    ctx.Add(hRes);

  Result := True;
end;

function BuildGroupIndexMap(hMod: HMODULE): TGroupIndexMap;
var
  List: TList<HRSRC>;
  i: Integer;
begin
  List := TList<HRSRC>.Create;
  try
    EnumResourceNamesW(hMod, RT_GROUP_ICON, @EnumProc, LPARAM(List));

    SetLength(Result, List.Count);

    for i := 0 to List.Count - 1 do
      Result[i] := List[i];

  finally
    List.Free;
  end;
end;

function GetGroupByIndex(hMod: HMODULE; Index: Cardinal): HRSRC;
var
  Map: TGroupIndexMap;
begin
  Map := BuildGroupIndexMap(hMod);

  if Index >= Cardinal(Length(Map)) then
    Exit(0);

  Result := Map[Index];
end;

function LoadGroup(hMod: HMODULE; hGrp: HRSRC): Pointer;
var
  hRes: HGLOBAL;
begin
  hRes := LoadResource(hMod, hGrp);

  if hRes = 0 then
    Exit(nil);

  Result := LockResource(hRes);
end;

function PickBestIconID(grp: PGrpIconDir; WantedSize: Integer;
  out RealSize: Integer): Word;
var
  i: Integer;
  entry: PGrpIconDirEntry;
  CurSize, BestDiff, Diff: Integer;
  BestID: Word;
begin
  BestDiff := MaxInt;
  BestID := 0;
  RealSize := 0;

  for i := 0 to grp.idCount - 1 do
  begin
    entry := PGrpIconDirEntry(PByte(grp) + SizeOf(TGrpIconDir) + i *
      SizeOf(TGrpIconDirEntry));

    if entry^.bWidth = 0 then
      CurSize := 256
    else
      CurSize := entry^.bWidth;

    Diff := Abs(CurSize - WantedSize);

    if Diff < BestDiff then
    begin
      BestDiff := Diff;
      BestID := entry^.nID;
      RealSize := CurSize;
    end;
  end;

  Result := BestID;
end;

function LoadIconImage(hMod: HMODULE; ID: Word; out Size: DWORD): Pointer;
var
  hRes: HRSRC;
  hGlob: HGLOBAL;
begin
  hRes := FindResourceW(hMod, MAKEINTRESOURCEW(ID), RT_ICON);

  if hRes = 0 then
    Exit(nil);

  Size := SizeOfResource(hMod, hRes);

  hGlob := LoadResource(hMod, hRes);

  if hGlob = 0 then
    Exit(nil);

  Result := LockResource(hGlob);
end;

function ExtractIconFromResource(const FModule, FOutFile: WideString;
  FIndex: Cardinal; FSize: Integer): Boolean;
var
  hMod: HMODULE;
  hGrp: HRSRC;
  grp: PGrpIconDir;
  BestID: Word;
  RealSize: Integer;
  imgData: Pointer;
  imgSize: DWORD;
  ms: TMemoryStream;
  Reserved, ImgType, Count: Word;
  Offset: DWORD;
  wWidth, wHeight, wColor, wReserved: Byte;
  wPlanes, wBitCount: Word;
begin
  Result := False;

  hMod := LoadLibraryExW(PWideChar(FModule), 0, LOAD_LIBRARY_AS_DATAFILE);

  if hMod = 0 then
    Exit;

  try
    hGrp := GetGroupByIndex(hMod, FIndex);

    if hGrp = 0 then
      Exit;

    grp := LoadGroup(hMod, hGrp);

    if grp = nil then
      Exit;

    BestID := PickBestIconID(grp, FSize, RealSize);

    imgData := LoadIconImage(hMod, BestID, imgSize);

    if imgData = nil then
      Exit;

    ms := TMemoryStream.Create;
    try
      Reserved := 0;
      ImgType := 1;
      Count := 1;

      ms.WriteBuffer(Reserved, 2);
      ms.WriteBuffer(ImgType, 2);
      ms.WriteBuffer(Count, 2);

      Offset := 6 + 16;
      ms.Size := Offset;

      if RealSize >= 256 then
        wWidth := 0
      else
        wWidth := RealSize;

      if RealSize >= 256 then
        wHeight := 0
      else
        wHeight := RealSize;

      wColor := 0;
      wReserved := 0;
      wPlanes := 1;
      wBitCount := 32;

      ms.WriteBuffer(wWidth, 1);
      ms.WriteBuffer(wHeight, 1);
      ms.WriteBuffer(wColor, 1);
      ms.WriteBuffer(wReserved, 1);
      ms.WriteBuffer(wPlanes, 2);
      ms.WriteBuffer(wBitCount, 2);
      ms.WriteBuffer(imgSize, 4);
      ms.WriteBuffer(Offset, 4);
      ms.WriteBuffer(imgData^, imgSize);

      ms.SaveToFile(FOutFile);

      Result := True;

    finally
      ms.Free;
    end;

  finally
    FreeLibrary(hMod);
  end;
end;

// =============================================================================
// VCLFontSizeToFMX
// =============================================================================
function VCLFontSizeToFMX(const VCLFontSize: Single): Single;
begin
  Result := VCLFontSize * 1.33;
end;

// =============================================================================
// ProcessMessages
// =============================================================================
procedure ProcessMessages;
begin
  try
    if Assigned(Application) then
      Application.ProcessMessages;
  except
    // TO DO
  end;
end;

type
  TRTL_OSVERSIONINFOEXW = record
    dwOSVersionInfoSize: DWORD;
    dwMajorVersion: DWORD;
    dwMinorVersion: DWORD;
    dwBuildNumber: DWORD;
    dwPlatformId: DWORD;
    szCSDVersion: array [0 .. 127] of WideChar;
  end;

function RtlGetVersion(var lpVersionInformation: TRTL_OSVERSIONINFOEXW)
  : LongInt; stdcall; external 'ntdll.dll';

// =============================================================================
// GetWinMajorVersion
// =============================================================================
function GetWinMajorVersion: Cardinal;
var
  VI: TRTL_OSVERSIONINFOEXW;
begin
  ZeroMemory(@VI, SizeOf(VI));
  VI.dwOSVersionInfoSize := SizeOf(VI);

  if RtlGetVersion(VI) = 0 then
  begin
    if VI.dwMajorVersion = 10 then
    begin
      if VI.dwBuildNumber >= 22000 then
        Result := 11
      else
        Result := 10;
    end
    else
      Result := VI.dwMajorVersion;
  end
  else
    Result := 0;
end;

// =============================================================================
// GetWinBuildNumber
// =============================================================================
function GetWinBuildNumber: Cardinal;
var
  VI: TRTL_OSVERSIONINFOEXW;
begin
  ZeroMemory(@VI, SizeOf(VI));
  VI.dwOSVersionInfoSize := SizeOf(VI);

  if RtlGetVersion(VI) = 0 then
    Result := VI.dwBuildNumber
  else
    Result := 0;
end;

// =============================================================================
// IsWindows11
// =============================================================================
function IsWindows11: Boolean;
var
  VI: TRTL_OSVERSIONINFOEXW;
begin
  ZeroMemory(@VI, SizeOf(VI));
  VI.dwOSVersionInfoSize := SizeOf(VI);

  if RtlGetVersion(VI) <> 0 then
    Exit(False);

  Result := VI.dwBuildNumber >= 22000;
end;

// =============================================================================
// GetWinAccentColor
// =============================================================================
function IsDarkMode: Boolean;
var
  Reg: TRegistry;
begin
  Result := False;

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKeyReadOnly
      ('\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize') then
    begin
      if Reg.ValueExists('AppsUseLightTheme') then
        Result := Reg.ReadInteger('AppsUseLightTheme') = 0;
    end;
  finally
    Reg.Free;
  end;
end;

function GetWinAccentColor: TAlphaColor;
type
  TAccentArray = array [0 .. 7] of TAlphaColor;
  PAccentArray = ^TAccentArray;

  function BGRtoRGB(Color: TAlphaColor): TAlphaColor;
  var
    R, G, B: Byte;
  begin
    B := (Color shr 16) and $FF;
    G := (Color shr 8) and $FF;
    R := Color and $FF;
    Result := $FF000000 or (R shl 16) or (G shl 8) or B;
  end;

var
  Reg: TRegistry;
  Data: TBytes;
  Palette: PAccentArray;
  Index: Integer;
begin
  Result := $FF005FB8;

  if IsDarkMode then
    Index := 1
  else
    Index := 4;

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKeyReadOnly
      ('\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent') then
    begin
      if Reg.ValueExists('AccentPalette') then
      begin
        SetLength(Data, Reg.GetDataSize('AccentPalette'));
        Reg.ReadBinaryData('AccentPalette', Data[0], Length(Data));

        Palette := PAccentArray(@Data[0]);

        Result := BGRtoRGB(Palette^[Index]);
      end;
    end;
  finally
    Reg.Free;
  end;
end;

// =============================================================================
// GetDesktopImg
// =============================================================================
function GetDesktopImg: WideString;
var
  Buffer: array [0 .. MAX_PATH] of WideChar;
begin
  Result := '';

  try
    if SystemParametersInfoW(SPI_GETDESKWALLPAPER, MAX_PATH, @Buffer, 0) then
    begin
      if Buffer[0] <> #0 then
        Result := Buffer;
    end;
  except
    // TO DO
  end;
end;

// =============================================================================
// GetImgColor
// =============================================================================
function GetImgColor(const FImage: WideString): TAlphaColor;
var
  Bitmap: FMX.Graphics.TBitmap;
  Data: TBitmapData;
  X, Y: Integer;
  R, G, B, Count: UInt64;
  P: PAlphaColor;
  C: TAlphaColor;
begin
  Result := 0;

  if not FileExists(FImage) then
    Exit;

  Bitmap := FMX.Graphics.TBitmap.Create;
  try
    Bitmap.LoadFromFile(FImage);

    if not Bitmap.Map(TMapAccess.Read, Data) then
      Exit;

    try
      R := 0;
      G := 0;
      B := 0;
      Count := 0;

      for Y := 0 to Bitmap.Height - 1 do
      begin
        P := Data.GetScanline(Y);
        for X := 0 to Bitmap.Width - 1 do
        begin
          C := P^;

          Inc(R, TAlphaColorRec(C).R);
          Inc(G, TAlphaColorRec(C).G);
          Inc(B, TAlphaColorRec(C).B);

          Inc(Count);
          Inc(P);
        end;
      end;

      if Count > 0 then
        Result := (255 shl 24) or ((R div Count) shl 16) or
          ((G div Count) shl 8) or (B div Count);

    finally
      Bitmap.Unmap(Data);
    end;

  finally
    Bitmap.Free;
  end;
end;

// =============================================================================
// ColorSetOpacity
// =============================================================================
function ColorSetOpacity(const FColor: TAlphaColor;
  FOpacity: Single): TAlphaColor;
var
  A: Byte;
begin
  if FOpacity <= 0 then
    A := 0
  else if FOpacity >= 1 then
    A := 255
  else
    A := Round(FOpacity * 255);

  Result := (A shl 24) or (FColor and $00FFFFFF);
end;

// =============================================================================
// ColorDarker
// =============================================================================
function Clamp01(const v: Single): Single;
begin
  if v < 0 then
    Result := 0
  else if v > 1 then
    Result := 1
  else
    Result := v;
end;

function ColorDarker(const FColor: TAlphaColor; Percent: Byte): TAlphaColor;
var
  H, S, L: Single;
  A: Byte;
begin
  A := (FColor shr 24) and $FF;

  RGBtoHSL(TAlphaColor(FColor), H, S, L);
  L := EnsureRange(L * (1 - Percent / 100), 0, 1);

  Result := (A shl 24) or (HSLtoRGB(H, S, L) and $00FFFFFF);
end;

// =============================================================================
// ColorLighter
// =============================================================================
function ColorLighter(const FColor: TAlphaColor; Percent: Byte): TAlphaColor;
var
  H, S, L: Single;
  A: Byte;
begin
  A := (FColor shr 24) and $FF;

  RGBtoHSL(TAlphaColor(FColor), H, S, L);
  L := EnsureRange(L + (1 - L) * (Percent / 100), 0, 1);

  Result := (A shl 24) or (HSLtoRGB(H, S, L) and $00FFFFFF);
end;

// =============================================================================
// IsLightColor
// =============================================================================
function IsLightColor(const FColor: TAlphaColor): Boolean;
var
  C: TAlphaColorRec;
begin
  C := TAlphaColorRec(FColor);
  Result := (0.299 * C.R + 0.587 * C.G + 0.114 * C.B) > 186;
end;

// =============================================================================
// HaltProc
// =============================================================================
var
  Halted: Boolean = False;

procedure BeginHaltProc;
begin
  Halted := True;

  while Halted do
  begin
    try
      Application.ProcessMessages;
    except
      // TO DO
    end;

    Sleep(10);
  end;
end;

procedure EndHaltProc;
begin
  Halted := False;
end;

// =============================================================================
// GetShortCut
// =============================================================================
function GetShortCut(Key: Word; Shift: TShiftState): TShortCut;
begin
  Result := Key;

  if ssShift in Shift then
    Result := Result or $2000;

  if ssCtrl in Shift then
    Result := Result or $4000;

  if ssAlt in Shift then
    Result := Result or $8000;

  if ssCommand in Shift then
    Result := Result or $10000;
end;

// =============================================================================
// MbOrTb
// =============================================================================
function MbOrTb(Float: Extended; Decimal: Integer;
  const sMb, sGb, sTb: WideString): WideString;
var
  Value: Extended;
  unitStr: WideString;
  fmt: string;
  i: Integer;
  fs: TFormatSettings;
begin
  Value := Float;
  unitStr := sMb;

  if Abs(Value) >= 1024.0 then
  begin
    Value := Value / 1024.0;
    unitStr := sGb;

    if Abs(Value) >= 1024.0 then
    begin
      Value := Value / 1024.0;
      unitStr := sTb;
    end;
  end;

  if Decimal < 0 then
    Decimal := 0;
  if Decimal > 6 then
    Decimal := 6;

  fmt := '0';
  if Decimal > 0 then
  begin
    fmt := fmt + '.';
    for i := 1 to Decimal do
      fmt := fmt + '0';
  end;

  fs := TFormatSettings.Create;
  fs.DecimalSeparator := '.';

  Result := FormatFloat(fmt, Value, fs) + ' ' + unitStr;
end;

// =============================================================================
// MHzOrGHz
// =============================================================================
function MHzOrGHz(Float: Extended; Decimal: Integer): WideString;
const
  Suffixes: array [0 .. 1] of string = (' MHz', ' GHz');
var
  Value: Extended;
  UnitIndex: Integer;
  FormatStr: string;
  fs: TFormatSettings;
begin
  if Decimal < 1 then
    Decimal := 1;
  if Decimal > 3 then
    Decimal := 3;

  if Float <= 0 then
    Exit('0 MHz');

  Value := Float;
  UnitIndex := 0;

  if Value >= 1000 then
  begin
    Value := Value / 1000;
    UnitIndex := 1;
  end;

  case Decimal of
    1:
      FormatStr := '0.0';
    2:
      FormatStr := '0.00';
    3:
      FormatStr := '0.000';
  end;

  fs := TFormatSettings.Create;
  fs.DecimalSeparator := '.';

  Result := FormatFloat(FormatStr, Value, fs) + Suffixes[UnitIndex];
end;

// =============================================================================
// CnvtUTF32ToUTF16
// =============================================================================
procedure SplitByComma(const S: WideString; var Parts: TArray<WideString>);
var
  i, StartPos: Integer;
  Token: WideString;
begin
  SetLength(Parts, 0);
  StartPos := 1;

  for i := 1 to Length(S) do
    if S[i] = ',' then
    begin
      Token := Trim(Copy(S, StartPos, i - StartPos));
      if Token <> '' then
      begin
        SetLength(Parts, Length(Parts) + 1);
        Parts[High(Parts)] := Token;
      end;
      StartPos := i + 1;
    end;

  Token := Trim(Copy(S, StartPos, MaxInt));
  if Token <> '' then
  begin
    SetLength(Parts, Length(Parts) + 1);
    Parts[High(Parts)] := Token;
  end;
end;

function CnvtUTF32ToUTF16(const Str: WideString): WideString;
var
  Parts: TArray<WideString>;
  i, CodePoint: Integer;
  Token: WideString;
begin
  Result := '';
  SplitByComma(Str, Parts);

  for i := 0 to High(Parts) do
  begin
    Token := Parts[i];

    if (Length(Token) > 2) and ((Copy(Token, 1, 2) = 'U+') or
      (Copy(Token, 1, 2) = 'u+')) then
      Delete(Token, 1, 2);

    CodePoint := StrToInt('$' + Token);

    if CodePoint <= $FFFF then
      Result := Result + WideChar(CodePoint)
    else
    begin
      Dec(CodePoint, $10000);
      Result := Result + WideChar($D800 + (CodePoint shr 10)) +
        WideChar($DC00 + (CodePoint and $3FF));
    end;
  end;
end;

// =============================================================================
// GetDisplayResolution
// =============================================================================
function GetDisplayResolutionX: Integer;
var
  DC: HDC;
begin
  DC := GetDC(0);
  try
    Result := GetDeviceCaps(DC, HORZRES);
  finally
    ReleaseDC(0, DC);
  end;
end;

function GetDisplayResolutionY: Integer;
var
  DC: HDC;
begin
  DC := GetDC(0);
  try
    Result := GetDeviceCaps(DC, VERTRES);
  finally
    ReleaseDC(0, DC);
  end;
end;

// =============================================================================
// GetCurrentDPIValue
// =============================================================================
function GetCurrentDPIValue: Cardinal;
var
  DC: HDC;
begin
  DC := GetDC(0);
  try
    Result := GetDeviceCaps(DC, LOGPIXELSX);
  finally
    ReleaseDC(0, DC);
  end;
end;

// =============================================================================
// GetFMXBridgeBuildDate
// =============================================================================
procedure GetFMXBridgeBuildDate(var YearW, MonthW, DayW: Word);
var
  ModuleName: array [0 .. MAX_PATH - 1] of Char;
  H: THandle;
  ftWrite: TFileTime;
  stUTC: TSystemTime;
begin
  YearW := 0;
  MonthW := 0;
  DayW := 0;

  if GetModuleFileName(HInstance, ModuleName, MAX_PATH) = 0 then
    Exit;

  H := CreateFile(ModuleName, GENERIC_READ, FILE_SHARE_READ or
    FILE_SHARE_WRITE or FILE_SHARE_DELETE, nil, OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL, 0);
  if H = INVALID_HANDLE_VALUE then
    Exit;

  if GetFileTime(H, nil, nil, @ftWrite) then
    if FileTimeToSystemTime(ftWrite, stUTC) then
    begin
      YearW := stUTC.wYear;
      MonthW := stUTC.wMonth;
      DayW := stUTC.wDay;
    end;

  CloseHandle(H);
end;

// =============================================================================
// GetUserCountryName
// =============================================================================
function GetUserCountryName: WideString;
type
  TGEOID = LongInt;
const
  GEOCLASS_NATION = 16;
  GEOID_NOT_AVAILABLE = -1;
  GEO_FRIENDLYNAME = 8;
var
  UserGeoID: TGEOID;
  Buffer: array [0 .. 255] of WideChar;
begin
  UserGeoID := GetUserGeoID(GEOCLASS_NATION);
  if UserGeoID <> GEOID_NOT_AVAILABLE then
  begin
    if GetGeoInfo(UserGeoID, GEO_FRIENDLYNAME, @Buffer, Length(Buffer), 0) <> 0
    then
      Result := Buffer
    else
      Result := 'Unknown';
  end
  else
    Result := 'Unknown';
end;

// =============================================================================
// GetRunningAppCount
// =============================================================================
var
  GAppList: TStringList;

function EnumWindowsCheck(HWND: HWND; lParam: lParam): BOOL; stdcall;
var
  PID: DWORD;
  i: Integer;
  ExplorerPID: DWORD;
  cls: array [0 .. 255] of Char;
begin
  Result := True;
  if GAppList = nil then
    Exit(False);

  ExplorerPID := DWORD(NativeUInt(GAppList.Objects[0]));

  GetWindowThreadProcessId(HWND, @PID);

  if (PID = ExplorerPID) then
    Exit(True);

  if not IsWindowVisible(HWND) then
    Exit(True);
  if GetWindowTextLength(HWND) = 0 then
    Exit(True);

  GetClassName(HWND, cls, Length(cls));
  if SameText(cls, 'Progman') or SameText(cls, 'WorkerW') then
    Exit(True);

  for i := 2 to GAppList.Count - 1 do
    if DWORD(NativeUInt(GAppList.Objects[i])) = PID then
      Exit(True);

  GAppList.AddObject(IntToStr(PID), TObject(NativeUInt(PID)));
end;

function GetRunningAppCount: Integer;
var
  ExplorerPID: DWORD;
  hWndProgman: HWND;
begin
  GAppList := TStringList.Create;
  try
    hWndProgman := Winapi.Windows.FindWindowA('Progman', nil);
    ExplorerPID := 0;
    if hWndProgman <> 0 then
      GetWindowThreadProcessId(hWndProgman, @ExplorerPID);

    GAppList.AddObject('', TObject(ExplorerPID));

    EnumWindows(@EnumWindowsCheck, 0);

    Result := GAppList.Count - 1;
  finally
    GAppList.Free;
    GAppList := nil;
  end;
end;

// =============================================================================
// GetRecycleBinInfo
// =============================================================================
function GetRecycleBinInfo(var FTotalSizeMB: Extended): Boolean;
var
  Info: SHQUERYRBINFO;
begin
  Result := False;
  FTotalSizeMB := 0.0;

  ZeroMemory(@Info, SizeOf(Info));
  Info.cbSize := SizeOf(Info);

  if SHQueryRecycleBinW(nil, @Info) = S_OK then
  begin
    FTotalSizeMB := Info.i64Size / 1024.0 / 1024.0;
    Result := True;
  end;
end;

// =============================================================================
// PlayWavFile
// =============================================================================
function PlayWavFile1(const WavFileName: WideString): Boolean;
begin
  Result := PlaySound(PWideChar(WavFileName), 0, SND_FILENAME or SND_ASYNC or
    SND_NODEFAULT);
end;

function PlayWavFile2(const WavFileName: WideString; Flags: Cardinal): Boolean;
begin
  Result := PlaySound(PWideChar(WavFileName), 0, Flags);
end;

function PlayWavFile3(const WavFileName: WideString;
  Handle, Flags: Cardinal): Boolean;
begin
  Result := PlaySound(PWideChar(WavFileName), THandle(Handle), Flags);
end;

// =============================================================================
// SystemExit
// =============================================================================
function EnableShutdownPrivilege: Boolean;
var
  Token: THandle;
  TP: TTokenPrivileges;
  Dummy: Cardinal;
begin
  Result := False;
  if OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
    Token) then
    try
      if LookupPrivilegeValue(nil, 'SeShutdownPrivilege', TP.Privileges[0].Luid)
      then
      begin
        TP.PrivilegeCount := 1;
        TP.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
        Result := AdjustTokenPrivileges(Token, False, TP, SizeOf(TP),
          nil, Dummy);
      end;
    finally
      CloseHandle(Token);
    end;
end;

function SystemExit(EWX_Flags: UINT): BOOL;
begin
  EnableShutdownPrivilege;
  Result := ExitWindowsEx(EWX_Flags, 0);
end;

// =============================================================================
// ReadAllText
// =============================================================================
function ReadAllText(const FileName: WideString; out FText: WideString)
  : Boolean;
var
  Msg: string;
begin
  Result := False;
  FText := '';
  try
    FText := TFile.ReadAllText(FileName, TEncoding.UTF8);
    Result := True;
  except
    on E: Exception do
    begin
      Msg := 'File reading error: ' + FileName + #13#10 + 'Cause: ' + E.Message;
      MessageBox(0, PWideChar(Msg), 'FMX ReadAllText',
        MB_OK or MB_ICONINFORMATION);
    end;
  end;
end;

// =============================================================================
// WriteAllText
// =============================================================================
function WriteAllText(const FileName, FText: WideString): Boolean;
var
  Msg: string;
begin
  Result := False;
  try
    TFile.WriteAllText(FileName, FText, TEncoding.UTF8);
    Result := True;
  except
    on E: Exception do
    begin
      Msg := 'File writing error: ' + FileName + #13#10 + 'Cause: ' + E.Message;
      MessageBox(0, PWideChar(Msg), 'FMX WriteAllText',
        MB_OK or MB_ICONINFORMATION);
    end;
  end;
end;

// =============================================================================
// AppendAllText
// =============================================================================
function AppendAllText(const FileName, FText: WideString): Boolean;
var
  Msg: string;
begin
  Result := False;
  try
    TFile.AppendAllText(FileName, FText, TEncoding.UTF8);
    Result := True;
  except
    on E: Exception do
    begin
      Msg := 'File appended error: ' + FileName + #13#10 + 'Cause: ' +
        E.Message;
      MessageBox(0, PWideChar(Msg), 'FMX AppendAllText',
        MB_OK or MB_ICONINFORMATION);
    end;
  end;
end;

// =============================================================================
// CopyFiles
// =============================================================================
function CopyFiles(const SourceDir, DestDir, Masks: WideString;
  Overwrite: Boolean): Integer;
var
  MaskList: TStringList;
  i, CopiedCount: Integer;
  SR: TSearchRec;
  SrcFile, DestFile: string;
begin
  Result := 0;
  if not DirectoryExists(SourceDir) then
    Exit;

  if not DirectoryExists(DestDir) then
    ForceDirectories(DestDir);

  MaskList := TStringList.Create;
  try
    MaskList.Delimiter := '|';
    MaskList.DelimitedText := Masks;

    CopiedCount := 0;
    for i := 0 to MaskList.Count - 1 do
    begin
      if FindFirst(TPath.Combine(SourceDir, MaskList[i]), faAnyFile, SR) = 0
      then
      begin
        repeat
          if (SR.Attr and faDirectory) = 0 then
          begin
            SrcFile := TPath.Combine(SourceDir, SR.Name);
            DestFile := TPath.Combine(DestDir, SR.Name);
            try
              TFile.Copy(SrcFile, DestFile, Overwrite);
              Inc(CopiedCount);
            except
              // TO DO
            end;
          end;
        until FindNext(SR) <> 0;
        FindClose(SR);
      end;
    end;

    Result := CopiedCount;
  finally
    MaskList.Free;
  end;
end;

// =============================================================================
// MoveFiles
// =============================================================================
function MoveFiles(const SourceDir, DestDir, Masks: WideString;
  Overwrite: Boolean): Integer;
var
  MaskList: TStringList;
  i, MovedCount: Integer;
  SR: TSearchRec;
  SrcFile, DestFile: string;
begin
  Result := 0;
  if not DirectoryExists(SourceDir) then
    Exit;

  if not DirectoryExists(DestDir) then
    ForceDirectories(DestDir);

  MaskList := TStringList.Create;
  try
    MaskList.Delimiter := '|';
    MaskList.DelimitedText := Masks;

    MovedCount := 0;
    for i := 0 to MaskList.Count - 1 do
    begin
      if FindFirst(TPath.Combine(SourceDir, MaskList[i]), faAnyFile, SR) = 0
      then
      begin
        repeat
          if (SR.Attr and faDirectory) = 0 then
          begin
            SrcFile := TPath.Combine(SourceDir, SR.Name);
            DestFile := TPath.Combine(DestDir, SR.Name);
            try
              if Overwrite and FileExists(DestFile) then
                TFile.Delete(DestFile);

              TFile.Move(SrcFile, DestFile);
              Inc(MovedCount);
            except
              // TO DO
            end;
          end;
        until FindNext(SR) <> 0;
        FindClose(SR);
      end;
    end;

    Result := MovedCount;
  finally
    MaskList.Free;
  end;
end;

// =============================================================================
// FMXBridgeShutDown
// =============================================================================
procedure FMXBridgeShutDown(const UnInstall: Boolean);
var
  DLLPath: string;
  DirPath: string;
  BatDir: string;
  BatPath: string;
  BatText: string;
  CmdLine: string;

  SL: TStringList;
  StartupInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  Buf: array [0 .. MAX_PATH - 1] of WideChar;
  PID: DWORD;
begin
  if Assigned(Screen) then
  begin
    while Screen.PopupFormCount > 0 do
      Screen.PopupForms[Screen.PopupFormCount - 1].Free;

    while Screen.FormCount > 0 do
      Screen.Forms[Screen.FormCount - 1].Free;
  end;

  Application.Terminate;
  FMX.Platform.Win.ShutDown;

  PID := GetCurrentProcessId;

  if GetModuleFileNameW(HInstance, Buf, Length(Buf)) = 0 then
    Exit;

  DLLPath := WideCharToString(Buf);
  DirPath := IncludeTrailingPathDelimiter(ExtractFilePath(DLLPath));

  BatDir := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP'));

  BatPath := BatDir + 'fmxbridge_del_' + IntToStr(PID) + '_' +
    IntToStr(GetTickCount64) + '.cmd';

  BatText := ':TRY' + sLineBreak + 'TASKKILL /F /PID ' + IntToStr(PID) +
    ' >nul 2>&1' + sLineBreak + 'RD /S /Q "' + DirPath +
    '" >nul 2>&1' + sLineBreak + 'IF EXIST "' + DirPath +
    '" GOTO TRY' + sLineBreak + 'DEL "%~f0" >nul 2>&1';

  SL := TStringList.Create;
  try
    SL.Text := BatText;
    SL.SaveToFile(BatPath, TEncoding.ANSI);
  finally
    SL.Free;
  end;

  ZeroMemory(@StartupInfo, SizeOf(StartupInfo));
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  ZeroMemory(@ProcInfo, SizeOf(ProcInfo));

  CmdLine := '"' + GetEnvironmentVariable('ComSpec') + '" /D /C ""' +
    BatPath + '""';

  if CreateProcess(nil, PChar(CmdLine), nil, nil, False, CREATE_NO_WINDOW, nil,
    PChar(BatDir), StartupInfo, ProcInfo) then
  begin
    CloseHandle(ProcInfo.hThread);
    CloseHandle(ProcInfo.hProcess);
  end;

  if UnInstall then
    Sleep(1000);
end;

// =============================================================================
// Exports
// =============================================================================
exports
  SetFileDropCallback,
  NotifyFileDrop,
  ExtractIconFromResource,
  VCLFontSizeToFMX,
  ProcessMessages,
  IsWindows11,
  ColorSetOpacity,
  ColorDarker,
  ColorLighter,
  IsLightColor,
  BeginHaltProc,
  EndHaltProc,
  GetShortCut,
  MbOrTb,
  MHzOrGHz,
  CnvtUTF32ToUTF16,
  GetDesktopImg,
  GetImgColor,
  GetWinBuildNumber,
  GetWinAccentColor,
  GetDisplayResolutionX,
  GetDisplayResolutionY,
  GetCurrentDPIValue,
  GetFMXBridgeBuildDate,
  GetUserCountryName,
  GetRunningAppCount,
  GetRecycleBinInfo,
  PlayWavFile1,
  PlayWavFile2,
  PlayWavFile3,
  SystemExit,
  ReadAllText,
  WriteAllText,
  AppendAllText,
  CopyFiles,
  MoveFiles,
  FMXBridgeShutDown;

end.
