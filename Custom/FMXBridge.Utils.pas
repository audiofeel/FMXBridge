unit FMXBridge.Utils;

interface

uses
  System.UITypes, System.Classes,
  Winapi.Windows;

// =============================================================================
// FColorUtils
// =============================================================================
type
  FColorUtils = interface(IUnknown)
    ['{A0E7AD66-29E0-4F8C-9C48-2E431A67C0B9}']
    function SetOpacity(const Color: TAlphaColor; Opacity: Single)
      : TAlphaColor; stdcall;
    function Darker(const Color: TAlphaColor; Percent: Byte)
      : TAlphaColor; stdcall;
    function Lighter(const Color: TAlphaColor; Percent: Byte)
      : TAlphaColor; stdcall;
    function IsLight(const Color: TAlphaColor): Boolean; stdcall;
    function AverageImageColor(const FileName: WideString)
      : TAlphaColor; stdcall;
  end;

  TFColorUtils = class(TInterfacedObject, FColorUtils)
  public
    function SetOpacity(const Color: TAlphaColor; Opacity: Single)
      : TAlphaColor; stdcall;
    function Darker(const Color: TAlphaColor; Percent: Byte)
      : TAlphaColor; stdcall;
    function Lighter(const Color: TAlphaColor; Percent: Byte)
      : TAlphaColor; stdcall;
    function IsLight(const Color: TAlphaColor): Boolean; stdcall;
    function AverageImageColor(const FileName: WideString)
      : TAlphaColor; stdcall;
  end;

// =============================================================================
// FFileUtils
// =============================================================================
type
  FFileUtils = interface(IUnknown)
    ['{EA2C5C5B-FFAD-4E46-8C57-2B0E84B1D3D8}']
    function ReadAllText(const FileName: WideString; out FText: WideString)
      : Boolean; stdcall;
    function WriteAllText(const FileName, FText: WideString): Boolean; stdcall;
    function AppendAllText(const FileName, FText: WideString): Boolean; stdcall;
    function CopyFiles(const SourceDir, DestDir, Masks: WideString;
      Overwrite: Boolean): Integer; stdcall;
    function MoveFiles(const SourceDir, DestDir, Masks: WideString;
      Overwrite: Boolean): Integer; stdcall;
  end;

  TFFileUtils = class(TInterfacedObject, FFileUtils)
  public
    function ReadAllText(const FileName: WideString; out FText: WideString)
      : Boolean; stdcall;
    function WriteAllText(const FileName, FText: WideString): Boolean; stdcall;
    function AppendAllText(const FileName, FText: WideString): Boolean; stdcall;
    function CopyFiles(const SourceDir, DestDir, Masks: WideString;
      Overwrite: Boolean): Integer; stdcall;
    function MoveFiles(const SourceDir, DestDir, Masks: WideString;
      Overwrite: Boolean): Integer; stdcall;
  end;

// =============================================================================
// FFormatUtils
// =============================================================================
type
  FFormatUtils = interface(IUnknown)
    ['{3EEA8C51-9F43-4B28-A6D9-7C91B4F4D1A2}']
    function MbOrTb(Float: Extended; Decimal: Integer;
      const sMb, sGb, sTb: WideString): WideString; stdcall;
    function MHzOrGHz(Float: Extended; Decimal: Integer): WideString; stdcall;
  end;

  TFFormatUtils = class(TInterfacedObject, FFormatUtils)
  public
    function MbOrTb(Float: Extended; Decimal: Integer;
      const sMb, sGb, sTb: WideString): WideString; stdcall;
    function MHzOrGHz(Float: Extended; Decimal: Integer): WideString; stdcall;
  end;

// =============================================================================
// FDesktopInfo
// =============================================================================
type
  FDesktopInfo = interface(IUnknown)
    ['{2CC1E0B7-8F58-4F0A-9F68-3E8BCF3B1A72}']
    function GetWinAccentColor: TAlphaColor; stdcall;
    function GetDesktopImg: WideString; stdcall;
    function GetDisplayResolutionX: Integer; stdcall;
    function GetDisplayResolutionY: Integer; stdcall;
    function GetCurrentDPIValue: Cardinal; stdcall;
  end;

  TFDesktopInfo = class(TInterfacedObject, FDesktopInfo)
  public
    function GetWinAccentColor: TAlphaColor; stdcall;
    function GetDesktopImg: WideString; stdcall;
    function GetDisplayResolutionX: Integer; stdcall;
    function GetDisplayResolutionY: Integer; stdcall;
    function GetCurrentDPIValue: Cardinal; stdcall;
  end;

// =============================================================================
// FSoundUtils
// =============================================================================
type
  FSoundUtils = interface(IUnknown)
    ['{C04D5B31-AE76-47BB-AC41-8B2B51E6D927}']
    function PlayFile(const FileName: WideString; Async, Loop: Boolean)
      : Boolean; stdcall;
    function Stop: Boolean; stdcall;
  end;

  TFSoundUtils = class(TInterfacedObject, FSoundUtils)
  public
    function PlayFile(const FileName: WideString; Async, Loop: Boolean)
      : Boolean; stdcall;
    function Stop: Boolean; stdcall;
  end;

// =============================================================================
// FMessagePump
// =============================================================================
type
  FMessagePump = interface(IUnknown)
    ['{A25F1A8C-5D1D-4819-91AA-AE3EDC8BD239}']
    procedure ProcessMessages; stdcall;
    procedure BeginHaltProc; stdcall;
    procedure EndHaltProc; stdcall;
  end;

  TFMessagePump = class(TInterfacedObject, FMessagePump)
  private
    FRunning: Boolean;
  public
    procedure ProcessMessages; stdcall;
    procedure BeginHaltProc; stdcall;
    procedure EndHaltProc; stdcall;
  end;

// =============================================================================
// FSystemExit
// =============================================================================
type
  FSystemExit = interface(IUnknown)
    ['{3E56B37A-930B-431A-A0DA-8B12E3C5AD47}']
    function LogOff(ForceIfHung: Boolean): Boolean; stdcall;
    function Shutdown(ForceIfHung: Boolean): Boolean; stdcall;
    function Restart(ForceIfHung, RestartRegisteredApps: Boolean)
      : Boolean; stdcall;
  end;

  TFSystemExit = class(TInterfacedObject, FSystemExit)
  private
    function ExecuteExit(const Flags: UINT; EnablePrivilege: Boolean): Boolean;
  public
    function LogOff(ForceIfHung: Boolean): Boolean; stdcall;
    function Shutdown(ForceIfHung: Boolean): Boolean; stdcall;
    function Restart(ForceIfHung, RestartRegisteredApps: Boolean)
      : Boolean; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitColorUtils: FColorUtils; stdcall;
function InitFileUtils: FFileUtils; stdcall;
function InitFormatUtils: FFormatUtils; stdcall;
function InitDesktopInfo: FDesktopInfo; stdcall;
function InitSoundUtils: FSoundUtils; stdcall;
function InitMessagePump: FMessagePump; stdcall;
function InitSystemExit: FSystemExit; stdcall;

type
  TFileDropCallback = procedure(Sender: TObject; const FileName: WideString)
    of object;
procedure SetFileDropCallback(ACallback: TFileDropCallback); stdcall;
procedure NotifyFileDrop(Sender: TObject; const FileName: WideString); stdcall;

function ExtractIconFromResource(const FModule, FOutFile: WideString;
  FIndex: Cardinal; FSize: Integer): Boolean; stdcall;
function VCLFontSizeToFMX(const VCLFontSize: Single): Single; stdcall;
function CnvtUTF32ToUTF16(const Str: WideString): WideString; stdcall;
procedure GetFMXBridgeBuildDate(var YearW, MonthW, DayW: Word); stdcall;
procedure FMXBridgeShutDown(const UnInstall: Boolean); stdcall;

implementation

uses
  System.SysUtils, System.Win.Registry, System.Generics.Collections,
  System.UIConsts, System.Math, System.IOUtils,
  Winapi.MMSystem,
  FMX.Graphics, FMX.Platform.Win, FMX.Forms;

// =============================================================================
// FColorUtils
// =============================================================================
function TFColorUtils.SetOpacity(const Color: TAlphaColor; Opacity: Single)
  : TAlphaColor;
var
  A: Byte;
begin
  if Opacity <= 0 then
    A := 0
  else if Opacity >= 1 then
    A := 255
  else
    A := Round(Opacity * 255);

  Result := (A shl 24) or (Color and $00FFFFFF);
end;

function TFColorUtils.Darker(const Color: TAlphaColor; Percent: Byte)
  : TAlphaColor;
var
  H, S, L: Single;
  A: Byte;
begin
  A := (Color shr 24) and $FF;

  RGBtoHSL(Color, H, S, L);
  L := EnsureRange(L * (1 - Percent / 100), 0, 1);

  Result := (A shl 24) or (HSLtoRGB(H, S, L) and $00FFFFFF);
end;

function TFColorUtils.Lighter(const Color: TAlphaColor; Percent: Byte)
  : TAlphaColor;
var
  H, S, L: Single;
  A: Byte;
begin
  A := (Color shr 24) and $FF;

  RGBtoHSL(Color, H, S, L);
  L := EnsureRange(L + (1 - L) * (Percent / 100), 0, 1);

  Result := (A shl 24) or (HSLtoRGB(H, S, L) and $00FFFFFF);
end;

function TFColorUtils.IsLight(const Color: TAlphaColor): Boolean;
var
  C: TAlphaColorRec;
begin
  C := TAlphaColorRec(Color);

  Result := (0.299 * C.R + 0.587 * C.G + 0.114 * C.B) > 186;
end;

function TFColorUtils.AverageImageColor(const FileName: WideString)
  : TAlphaColor;
var
  Bitmap: FMX.Graphics.TBitmap;
  Data: TBitmapData;
  X, Y: Integer;
  R, G, B, Count: UInt64;
  P: PAlphaColor;
  C: TAlphaColor;
begin
  Result := 0;

  if not FileExists(FileName) then
    Exit;

  Bitmap := FMX.Graphics.TBitmap.Create;
  try
    Bitmap.LoadFromFile(FileName);

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
// FFileUtils
// =============================================================================
function TFFileUtils.ReadAllText(const FileName: WideString;
  out FText: WideString): Boolean;
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

function TFFileUtils.WriteAllText(const FileName, FText: WideString): Boolean;
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

function TFFileUtils.AppendAllText(const FileName, FText: WideString): Boolean;
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

function TFFileUtils.CopyFiles(const SourceDir, DestDir, Masks: WideString;
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

function TFFileUtils.MoveFiles(const SourceDir, DestDir, Masks: WideString;
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
// FFormatUtils
// =============================================================================
function TFFormatUtils.MbOrTb(Float: Extended; Decimal: Integer;
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

function TFFormatUtils.MHzOrGHz(Float: Extended; Decimal: Integer): WideString;
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
// FDesktopInfo
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

function TFDesktopInfo.GetWinAccentColor: TAlphaColor;
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

function TFDesktopInfo.GetDesktopImg: WideString;
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

function TFDesktopInfo.GetDisplayResolutionX: Integer;
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

function TFDesktopInfo.GetDisplayResolutionY: Integer;
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

function TFDesktopInfo.GetCurrentDPIValue: Cardinal;
type
  TDpiAwarenessContext = Pointer;
  TSetThreadDpiAwarenessContextFunc = function(DpiContext: TDpiAwarenessContext)
    : TDpiAwarenessContext; stdcall;
  TGetDpiForSystemFunc = function: UINT; stdcall;
var
  User32Module: HMODULE;
  SetThreadDpiAwarenessContextProc: TSetThreadDpiAwarenessContextFunc;
  GetDpiForSystemProc: TGetDpiForSystemFunc;
  PreviousContext: TDpiAwarenessContext;
  DC: HDC;
begin
  Result := 0;

  User32Module := GetModuleHandle('user32.dll');
  if User32Module <> 0 then
  begin
    SetThreadDpiAwarenessContextProc := TSetThreadDpiAwarenessContextFunc
      (GetProcAddress(User32Module, 'SetThreadDpiAwarenessContext'));

    GetDpiForSystemProc := TGetDpiForSystemFunc(GetProcAddress(User32Module,
      'GetDpiForSystem'));

    if Assigned(SetThreadDpiAwarenessContextProc) and
      Assigned(GetDpiForSystemProc) then
    begin
      PreviousContext := SetThreadDpiAwarenessContextProc
        (Pointer(NativeInt(-2)));

      if PreviousContext <> nil then
      begin
        try
          Result := GetDpiForSystemProc();
        finally
          SetThreadDpiAwarenessContextProc(PreviousContext);
        end;

        if Result <> 0 then
          Exit;
      end;
    end;
  end;

  DC := GetDC(0);
  if DC = 0 then
    Exit;

  try
    Result := Cardinal(GetDeviceCaps(DC, LOGPIXELSX));
  finally
    ReleaseDC(0, DC);
  end;
end;

// =============================================================================
// FSoundUtils
// =============================================================================
function TFSoundUtils.PlayFile(const FileName: WideString;
  Async, Loop: Boolean): Boolean;
var
  Flags: DWORD;
begin
  Result := False;

  if FileName = '' then
    Exit;

  Flags := SND_FILENAME or SND_NODEFAULT;

  if Async or Loop then
    Flags := Flags or SND_ASYNC;

  if Loop then
    Flags := Flags or SND_LOOP;

  Result := PlaySound(PWideChar(FileName), 0, Flags);
end;

function TFSoundUtils.Stop: Boolean;
begin
  Result := PlaySound(nil, 0, 0);
end;

// =============================================================================
// FMessagePump
// =============================================================================
procedure TFMessagePump.ProcessMessages;
begin
  try
    if Assigned(Application) then
      Application.ProcessMessages;
  except
    // TO DO
  end;
end;

procedure TFMessagePump.BeginHaltProc;
begin
  if FRunning or not Assigned(Application) then
    Exit;

  FRunning := True;
  try
    while FRunning do
    begin
      ProcessMessages;

      if FRunning then
        Sleep(10);
    end;
  finally
    FRunning := False;
  end;
end;

procedure TFMessagePump.EndHaltProc;
begin
  FRunning := False;
end;

// =============================================================================
// FSystemExit
// =============================================================================
type
  PTokenPrivilegesNative = ^TTokenPrivileges;

function AdjustTokenPrivilegesNative(TokenHandle: THandle;
  DisableAllPrivileges: BOOL; NewState: PTokenPrivilegesNative;
  BufferLength: DWORD; PreviousState: PTokenPrivilegesNative;
  ReturnLength: PDWORD): BOOL; stdcall;
  external 'advapi32.dll' name 'AdjustTokenPrivileges';

function TFSystemExit.ExecuteExit(const Flags: UINT;
  EnablePrivilege: Boolean): Boolean;
var
  Token: THandle;
  NewState: TTokenPrivileges;
  PreviousState: TTokenPrivileges;
  ReturnLength: DWORD;
  AdjustResult: BOOL;
  AdjustError: DWORD;
begin
  Result := False;

  if not EnablePrivilege then
  begin
    Result := ExitWindowsEx(Flags, 0);
    Exit;
  end;

  if not OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or
    TOKEN_QUERY, Token) then
    Exit;

  try
    FillChar(NewState, SizeOf(NewState), 0);
    FillChar(PreviousState, SizeOf(PreviousState), 0);

    if not LookupPrivilegeValue(nil, 'SeShutdownPrivilege',
      NewState.Privileges[0].Luid) then
      Exit;

    NewState.PrivilegeCount := 1;
    NewState.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;

    ReturnLength := 0;
    SetLastError(ERROR_SUCCESS);

    AdjustResult := AdjustTokenPrivilegesNative(Token, False, @NewState,
      SizeOf(PreviousState), @PreviousState, @ReturnLength);

    AdjustError := GetLastError;

    if not AdjustResult then
      Exit;

    if AdjustError <> ERROR_SUCCESS then
    begin
      if PreviousState.PrivilegeCount > 0 then
        AdjustTokenPrivilegesNative(Token, False, @PreviousState, 0, nil, nil);
      Exit;
    end;

    try
      Result := ExitWindowsEx(Flags, 0);
    finally
      if PreviousState.PrivilegeCount > 0 then
        AdjustTokenPrivilegesNative(Token, False, @PreviousState, 0, nil, nil);
    end;
  finally
    CloseHandle(Token);
  end;
end;

function TFSystemExit.LogOff(ForceIfHung: Boolean): Boolean;
var
  Flags: UINT;
begin
  Flags := EWX_LOGOFF;

  if ForceIfHung then
    Flags := Flags or EWX_FORCEIFHUNG;

  Result := ExecuteExit(Flags, False);
end;

function TFSystemExit.Shutdown(ForceIfHung: Boolean): Boolean;
var
  Flags: UINT;
begin
  Flags := EWX_SHUTDOWN or EWX_POWEROFF;

  if ForceIfHung then
    Flags := Flags or EWX_FORCEIFHUNG;

  Result := ExecuteExit(Flags, True);
end;

function TFSystemExit.Restart(ForceIfHung, RestartRegisteredApps
  : Boolean): Boolean;
var
  Flags: UINT;
begin
  Flags := EWX_REBOOT;

  if ForceIfHung then
    Flags := Flags or EWX_FORCEIFHUNG;

  if RestartRegisteredApps then
    Flags := Flags or EWX_RESTARTAPPS;

  Result := ExecuteExit(Flags, True);
end;

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
  lParam: lParam): BOOL; stdcall;
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
    EnumResourceNamesW(hMod, RT_GROUP_ICON, @EnumProc, lParam(List));

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

  FMX.Platform.Win.Shutdown;
  FreeAndNil(Application);

  PID := GetCurrentProcessId;

  if GetModuleFileNameW(HInstance, Buf, Length(Buf)) = 0 then
    Exit;

  DLLPath := WideCharToString(Buf);
  DirPath := IncludeTrailingPathDelimiter(ExtractFilePath(DLLPath));

  BatDir := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP'));

  BatPath := BatDir + 'fmxbridge_del_' + IntToStr(PID) + '_' +
    IntToStr(GetTickCount64) + '.cmd';

  BatText := ':TRY' + sLineBreak + 'TASKKILL /F /PID ' + IntToStr(PID) +
    ' >nul 2>&1' + sLineBreak + 'RD /S /Q "' + DirPath + '" >nul 2>&1' +
    sLineBreak + 'IF EXIST "' + DirPath + '" GOTO TRY' + sLineBreak +
    'DEL "%~f0" >nul 2>&1';

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
function InitColorUtils: FColorUtils;
begin
  Result := TFColorUtils.Create;
end;

function InitFileUtils: FFileUtils;
begin
  Result := TFFileUtils.Create;
end;

function InitFormatUtils: FFormatUtils;
begin
  Result := TFFormatUtils.Create;
end;

function InitDesktopInfo: FDesktopInfo;
begin
  Result := TFDesktopInfo.Create;
end;

function InitSoundUtils: FSoundUtils;
begin
  Result := TFSoundUtils.Create;
end;

function InitMessagePump: FMessagePump;
begin
  Result := TFMessagePump.Create;
end;

function InitSystemExit: FSystemExit;
begin
  Result := TFSystemExit.Create;
end;

exports
  InitColorUtils,
  InitFileUtils,
  InitFormatUtils,
  InitDesktopInfo,
  InitSoundUtils,
  InitMessagePump,
  InitSystemExit,

  SetFileDropCallback,
  NotifyFileDrop,
  ExtractIconFromResource,
  VCLFontSizeToFMX,
  CnvtUTF32ToUTF16,
  GetFMXBridgeBuildDate,
  FMXBridgeShutDown;

end.
