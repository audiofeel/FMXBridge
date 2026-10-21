
unit FMXBridge.SystemInfo;

interface

uses
  System.Classes,
  Winapi.Windows, Winapi.DXGI;

// =============================================================================
// FStorageInfo
// =============================================================================
type
  TDriveType = (dtUnknown, dtNoRootDir, dtRemovable, dtFixed, dtRemote, dtCDROM,
    dtRAMDisk);

  FStorageInfo = interface(IUnknown)
    ['{B1DFE8C4-D827-4D2C-A363-309320AFDC3F}']
    procedure Refresh; stdcall;
    function Count: Integer; stdcall;
    function Letter(const Index: Integer): WideString; stdcall;
    function LetterToIndex(const Letter: WideString): Integer; stdcall;
    function Name(const Index: Integer): WideString; stdcall;
    function IsRemovable(const Index: Integer): Boolean; stdcall;
    function MediaType(const Index: Integer): TDriveType; stdcall;
    function SpaceFree(const Index: Integer): Double; stdcall;
    function SpaceUsed(const Index: Integer): Double; stdcall;
    function SpaceTotal(const Index: Integer): Double; stdcall;
    function DiskLoad(const Index: Integer): Cardinal; stdcall;
  end;

  TFStorageInfo = class(TInterfacedObject, FStorageInfo)
  private
    FDrives: TStringList;

    function GetDrivePath(const Index: Integer): string;
    function GetDiskSpace(const Index: Integer;
      out FreeBytes, TotalBytes: Int64): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Refresh; stdcall;
    function Count: Integer; stdcall;
    function Letter(const Index: Integer): WideString; stdcall;
    function LetterToIndex(const Letter: WideString): Integer; stdcall;
    function Name(const Index: Integer): WideString; stdcall;
    function IsRemovable(const Index: Integer): Boolean; stdcall;
    function MediaType(const Index: Integer): TDriveType; stdcall;
    function SpaceFree(const Index: Integer): Double; stdcall;
    function SpaceUsed(const Index: Integer): Double; stdcall;
    function SpaceTotal(const Index: Integer): Double; stdcall;
    function DiskLoad(const Index: Integer): Cardinal; stdcall;
  end;

// =============================================================================
// FSystemInfo
// =============================================================================
type
  TUserType = (utUnknown, utUser, utAdmin, utGuest, utSystem);

  FSystemInfo = interface(IUnknown)
    ['{06F37AEC-7E76-4EB2-ACB2-648FDE4012FD}']
    function OSCaption: WideString; stdcall;
    function OSVersion: WideString; stdcall;
    function OSBuildNumber: WideString; stdcall;
    function GPUName: WideString; stdcall;
    function GPUMemory: UInt64; stdcall;
    function GPUFeatureLevel: WideString; stdcall;
    function RamLoad: Cardinal; stdcall;
    function TotalRam: Double; stdcall;
    function FreeRam: Double; stdcall;
    function UsedRam: Double; stdcall;
    function CPUName: WideString; stdcall;
    function CPUCores: Cardinal; stdcall;
    function CPUThreads: Cardinal; stdcall;
    function CPUSpeed: Cardinal; stdcall;
    function CPULoad: Cardinal; stdcall;
    function UserName: WideString; stdcall;
    function UserDomain: WideString; stdcall;
    function UserProfilePath: WideString; stdcall;
    function UserType: TUserType; stdcall;
    function UserIsElevated: Boolean; stdcall;
  end;

  TGPUInfoRecord = record
    Name: string;
    VRAM: UInt64;
    Dedicated: Boolean;
  end;

  TFSystemInfo = class(TInterfacedObject, FSystemInfo)
  private
    FOSReady: Boolean;
    FOSCaption: string;
    FOSVersion: string;
    FOSBuildNumber: string;

    FGPUReady: Boolean;
    FGPUName: string;
    FGPUMemory: UInt64;
    FGPUFeatureLevel: string;

    FCPUReady: Boolean;
    FCPUNameValue: string;
    FCPUCoresValue: Cardinal;
    FCPUThreadsValue: Cardinal;
    FCPUSpeedValue: Cardinal;

    FPrevIdle: TFileTime;
    FPrevKernel: TFileTime;
    FPrevUser: TFileTime;

    FUserReady: Boolean;
    FUserNameValue: string;
    FUserDomainValue: string;
    FUserProfilePathValue: string;
    FUserTypeValue: TUserType;
    FUserIsElevatedValue: Boolean;

    procedure EnsureOS;
    procedure EnsureGPU;
    procedure EnsureCPU;
    procedure EnsureUser;

    function ReadMemoryValue(const KeyPath: string; const ValueName: string;
      out Value: UInt64): Boolean;
    function GetBestGPU(out Info: TGPUInfoRecord): Boolean;
    function FindDXGIAdapter(const GPUName: string; out Adapter: IDXGIAdapter1;
      out Desc: DXGI_ADAPTER_DESC1): Boolean;
    function DetectGPUFeatureLevel(const Adapter: IDXGIAdapter1): WideString;

    function GetMemoryStatus(out Status: TMemoryStatusEx): Boolean;

    function GetCpuLoad: Cardinal;
    function NormalizeCpuName(const S: string): string;
    function FileTimeToUInt64(const FT: TFileTime): UInt64;

    function CheckElevated: Boolean;
  public
    constructor Create;

    function OSCaption: WideString; stdcall;
    function OSVersion: WideString; stdcall;
    function OSBuildNumber: WideString; stdcall;
    function GPUName: WideString; stdcall;
    function GPUMemory: UInt64; stdcall;
    function GPUFeatureLevel: WideString; stdcall;
    function RamLoad: Cardinal; stdcall;
    function TotalRam: Double; stdcall;
    function FreeRam: Double; stdcall;
    function UsedRam: Double; stdcall;
    function CPUName: WideString; stdcall;
    function CPUCores: Cardinal; stdcall;
    function CPUThreads: Cardinal; stdcall;
    function CPUSpeed: Cardinal; stdcall;
    function CPULoad: Cardinal; stdcall;
    function UserName: WideString; stdcall;
    function UserDomain: WideString; stdcall;
    function UserProfilePath: WideString; stdcall;
    function UserType: TUserType; stdcall;
    function UserIsElevated: Boolean; stdcall;
  end;

// =============================================================================
// Expotrs
// =============================================================================
function InitStorageInfo: FStorageInfo; stdcall;
function InitSystemInfo: FSystemInfo; stdcall;

implementation

uses
  System.SysUtils, System.Variants, System.Win.Registry, System.Win.ComObj,
  Winapi.D3D11, Winapi.D3DCommon, Winapi.ActiveX;

// =============================================================================
// FStorageInfo
// =============================================================================
constructor TFStorageInfo.Create;
begin
  inherited Create;

  FDrives := TStringList.Create;
  Refresh;
end;

destructor TFStorageInfo.Destroy;
begin
  FDrives.Free;

  inherited;
end;

procedure TFStorageInfo.Refresh;
var
  Mask: DWORD;
  I: Integer;
  DriveLetter: Char;
  DriveStr: string;
  DT: UINT;
begin
  FDrives.Clear;

  Mask := GetLogicalDrives;

  for I := 0 to 25 do
  begin
    if (Mask and (1 shl I)) = 0 then
      Continue;

    DriveLetter := Chr(Ord('A') + I);
    DriveStr := DriveLetter + ':\';

    DT := GetDriveType(PChar(DriveStr));

    if DT = DRIVE_CDROM then
      Continue;

    FDrives.Add(string(DriveLetter));
  end;
end;

function TFStorageInfo.Count: Integer;
begin
  Result := FDrives.Count;
end;

function TFStorageInfo.GetDrivePath(const Index: Integer): string;
begin
  Result := '';

  if (Index < 0) or (Index >= FDrives.Count) then
    Exit;

  Result := FDrives[Index] + ':\';
end;

function TFStorageInfo.Letter(const Index: Integer): WideString;
begin
  if (Index >= 0) and (Index < FDrives.Count) then
    Result := FDrives[Index] + ':'
  else
    Result := '';
end;

function TFStorageInfo.LetterToIndex(const Letter: WideString): Integer;
var
  S: WideString;
  Ch: Char;
begin
  Result := -1;

  S := Trim(Letter);

  if S = '' then
    Exit;

  Ch := UpCase(S[1]);

  if not CharInSet(Ch, ['A' .. 'Z']) then
    Exit;

  Result := FDrives.IndexOf(string(Ch));
end;

function TFStorageInfo.Name(const Index: Integer): WideString;
var
  DriveStr: string;
  Buffer: array [0 .. MAX_PATH - 1] of WideChar;
  SerialNumber: DWORD;
  MaxComponentLength: DWORD;
  FileSystemFlags: DWORD;
begin
  Result := '';

  DriveStr := GetDrivePath(Index);

  if DriveStr = '' then
    Exit;

  if GetVolumeInformationW(PWideChar(DriveStr), Buffer, Length(Buffer),
    @SerialNumber, MaxComponentLength, FileSystemFlags, nil, 0) then
    Result := Buffer
  else
    Result := DriveStr;
end;

function TFStorageInfo.MediaType(const Index: Integer): TDriveType;
var
  DriveStr: string;
  DT: UINT;
begin
  Result := dtUnknown;

  DriveStr := GetDrivePath(Index);

  if DriveStr = '' then
    Exit;

  DT := GetDriveType(PChar(DriveStr));

  case DT of
    DRIVE_UNKNOWN:
      Result := dtUnknown;

    DRIVE_NO_ROOT_DIR:
      Result := dtNoRootDir;

    DRIVE_REMOVABLE:
      Result := dtRemovable;

    DRIVE_FIXED:
      Result := dtFixed;

    DRIVE_REMOTE:
      Result := dtRemote;

    DRIVE_CDROM:
      Result := dtCDROM;

    DRIVE_RAMDISK:
      Result := dtRAMDisk;
  else
    Result := dtUnknown;
  end;
end;

function TFStorageInfo.IsRemovable(const Index: Integer): Boolean;
begin
  Result := MediaType(Index) = dtRemovable;
end;

function TFStorageInfo.GetDiskSpace(const Index: Integer;
  out FreeBytes, TotalBytes: Int64): Boolean;
var
  DriveStr: string;
  Dummy: Int64;
begin
  FreeBytes := 0;
  TotalBytes := 0;

  DriveStr := GetDrivePath(Index);

  if DriveStr = '' then
    Exit(False);

  Result := GetDiskFreeSpaceEx(PChar(DriveStr), FreeBytes, TotalBytes, @Dummy);
end;

function TFStorageInfo.SpaceFree(const Index: Integer): Double;
var
  FreeBytes, TotalBytes: Int64;
begin
  if not GetDiskSpace(Index, FreeBytes, TotalBytes) then
    Exit(0);

  Result := FreeBytes / 1024 / 1024;
end;

function TFStorageInfo.SpaceTotal(const Index: Integer): Double;
var
  FreeBytes, TotalBytes: Int64;
begin
  if not GetDiskSpace(Index, FreeBytes, TotalBytes) then
    Exit(0);

  Result := TotalBytes / 1024 / 1024;
end;

function TFStorageInfo.SpaceUsed(const Index: Integer): Double;
var
  FreeBytes, TotalBytes: Int64;
begin
  if not GetDiskSpace(Index, FreeBytes, TotalBytes) then
    Exit(0);

  Result := (TotalBytes - FreeBytes) / 1024 / 1024;
end;

function TFStorageInfo.DiskLoad(const Index: Integer): Cardinal;
var
  FreeBytes, TotalBytes: Int64;
begin
  if not GetDiskSpace(Index, FreeBytes, TotalBytes) then
    Exit(0);

  if TotalBytes = 0 then
    Exit(0);

  Result := Round((TotalBytes - FreeBytes) / TotalBytes * 100);
end;

// =============================================================================
// FSystemInfo
// =============================================================================
constructor TFSystemInfo.Create;
begin
  inherited Create;

  FOSReady := False;
  FGPUReady := False;
  FCPUReady := False;
  FUserReady := False;

  FOSCaption := '';
  FOSVersion := '';
  FOSBuildNumber := '';

  FGPUName := 'Unknown';
  FGPUMemory := 0;
  FGPUFeatureLevel := 'Unknown';
end;

// =============================================================================
// OS
// =============================================================================
procedure TFSystemInfo.EnsureOS;
var
  Reg: TRegistry;
  Build: Integer;
  Edition: string;
begin
  if FOSReady then
    Exit;

  FOSCaption := '';
  FOSVersion := '';
  FOSBuildNumber := '';

  Reg := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;

    if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
    begin
      Build := StrToIntDef(Reg.ReadString('CurrentBuildNumber'), 0);

      Edition := Reg.ReadString('EditionID');

      if Build >= 22000 then
        FOSCaption := 'Windows 11 ' + Edition
      else
        FOSCaption := 'Windows 10 ' + Edition;

      if Reg.ValueExists('DisplayVersion') then
        FOSVersion := Reg.ReadString('DisplayVersion')
      else
        FOSVersion := Reg.ReadString('ReleaseId');

      FOSBuildNumber := Reg.ReadString('CurrentBuildNumber');
    end;
  finally
    Reg.Free;
  end;

  FOSReady := True;
end;

function TFSystemInfo.OSCaption: WideString;
begin
  EnsureOS;
  Result := FOSCaption;
end;

function TFSystemInfo.OSVersion: WideString;
begin
  EnsureOS;
  Result := FOSVersion;
end;

function TFSystemInfo.OSBuildNumber: WideString;
begin
  EnsureOS;
  Result := FOSBuildNumber;
end;

// =============================================================================
// GPU
// =============================================================================
const
  REG_BINARY = 3;
  REG_QWORD = 11;

function TFSystemInfo.ReadMemoryValue(const KeyPath: string;
  const ValueName: string; out Value: UInt64): Boolean;
var
  Key: HKEY;
  DataType: DWORD;
  DataSize: DWORD;
  Buffer: UInt64;
begin
  Result := False;
  Value := 0;

  if RegOpenKeyEx(HKEY_LOCAL_MACHINE, PChar(KeyPath), 0,
    KEY_READ or KEY_WOW64_64KEY, Key) <> ERROR_SUCCESS then
    Exit;

  try
    FillChar(Buffer, SizeOf(Buffer), 0);
    DataSize := SizeOf(Buffer);

    if RegQueryValueEx(Key, PChar(ValueName), nil, @DataType, @Buffer,
      @DataSize) <> ERROR_SUCCESS then
      Exit;

    case DataType of
      REG_QWORD:
        begin
          Value := Buffer;
          Result := True;
        end;

      REG_BINARY:
        begin
          if DataSize >= SizeOf(UInt64) then
          begin
            Value := Buffer;
            Result := True;
          end
          else if DataSize = SizeOf(DWORD) then
          begin
            Value := DWORD(Buffer);
            Result := True;
          end;
        end;
    end;
  finally
    RegCloseKey(Key);
  end;
end;

function TFSystemInfo.GetBestGPU(out Info: TGPUInfoRecord): Boolean;
var
  DevNum: DWORD;
  Dev: TDisplayDevice;
  KeyPath: string;
  CardName: string;
  Memory: UInt64;
  Discrete: TGPUInfoRecord;
  Integrated: TGPUInfoRecord;
begin
  Result := False;

  FillChar(Info, SizeOf(Info), 0);
  FillChar(Discrete, SizeOf(Discrete), 0);
  FillChar(Integrated, SizeOf(Integrated), 0);

  DevNum := 0;

  while True do
  begin
    FillChar(Dev, SizeOf(Dev), 0);
    Dev.cb := SizeOf(Dev);

    if not EnumDisplayDevices(nil, DevNum, Dev, 0) then
      Break;

    CardName := Dev.DeviceString;
    KeyPath := Dev.DeviceKey;

    if Pos('\Registry\Machine\', KeyPath) = 1 then
      Delete(KeyPath, 1, Length('\Registry\Machine\'));

    Memory := 0;

    if ReadMemoryValue(KeyPath, 'HardwareInformation.qwMemorySize', Memory) then
    begin
      if Memory > Discrete.VRAM then
      begin
        Discrete.Name := CardName;
        Discrete.VRAM := Memory;
        Discrete.Dedicated := True;
      end;
    end
    else if ReadMemoryValue(KeyPath, 'HardwareInformation.MemorySize', Memory)
    then
    begin
      if Memory > Integrated.VRAM then
      begin
        Integrated.Name := CardName;
        Integrated.VRAM := Memory;
        Integrated.Dedicated := False;
      end;
    end;

    Inc(DevNum);
  end;

  if Discrete.VRAM <> 0 then
  begin
    Info := Discrete;
    Exit(True);
  end;

  if Integrated.VRAM <> 0 then
  begin
    Info := Integrated;
    Exit(True);
  end;
end;

function TFSystemInfo.FindDXGIAdapter(const GPUName: string;
  out Adapter: IDXGIAdapter1; out Desc: DXGI_ADAPTER_DESC1): Boolean;
var
  Factory: IDXGIFactory1;
  Current: IDXGIAdapter1;
  CurrentDesc: DXGI_ADAPTER_DESC1;
  I: UINT;
  CurrentName: string;
  BestMemory: UInt64;
begin
  Result := False;
  Adapter := nil;
  FillChar(Desc, SizeOf(Desc), 0);

  if Failed(CreateDXGIFactory1(IID_IDXGIFactory1, Factory)) then
    Exit;

  BestMemory := 0;
  I := 0;

  while Factory.EnumAdapters1(I, Current) = S_OK do
  begin
    FillChar(CurrentDesc, SizeOf(CurrentDesc), 0);
    Current.GetDesc1(CurrentDesc);

    if (Cardinal(CurrentDesc.Flags) and Cardinal(DXGI_ADAPTER_FLAG_SOFTWARE)) = 0
    then
    begin
      CurrentName := string(CurrentDesc.Description);

      if SameText(CurrentName, GPUName) then
      begin
        if (not Result) or (UInt64(CurrentDesc.DedicatedVideoMemory) >
          BestMemory) then
        begin
          Adapter := Current;
          Desc := CurrentDesc;
          BestMemory := UInt64(CurrentDesc.DedicatedVideoMemory);
          Result := True;
        end;
      end;
    end;

    Current := nil;
    Inc(I);
  end;
end;

function TFSystemInfo.DetectGPUFeatureLevel(const Adapter: IDXGIAdapter1)
  : WideString;
const
  Levels: array [0 .. 8] of D3D_FEATURE_LEVEL = (D3D_FEATURE_LEVEL_12_1,
    D3D_FEATURE_LEVEL_12_0, D3D_FEATURE_LEVEL_11_1, D3D_FEATURE_LEVEL_11_0,
    D3D_FEATURE_LEVEL_10_1, D3D_FEATURE_LEVEL_10_0, D3D_FEATURE_LEVEL_9_3,
    D3D_FEATURE_LEVEL_9_2, D3D_FEATURE_LEVEL_9_1);

  LevelsNo11_1: array [0 .. 7] of D3D_FEATURE_LEVEL = (D3D_FEATURE_LEVEL_12_1,
    D3D_FEATURE_LEVEL_12_0, D3D_FEATURE_LEVEL_11_0, D3D_FEATURE_LEVEL_10_1,
    D3D_FEATURE_LEVEL_10_0, D3D_FEATURE_LEVEL_9_3, D3D_FEATURE_LEVEL_9_2,
    D3D_FEATURE_LEVEL_9_1);
var
  Device: ID3D11Device;
  Context: ID3D11DeviceContext;
  FeatureLevel: D3D_FEATURE_LEVEL;
  HR: HRESULT;
begin
  Result := 'Unknown';

  if Adapter = nil then
    Exit;

  Device := nil;
  Context := nil;
  FeatureLevel := D3D_FEATURE_LEVEL_9_1;

  HR := D3D11CreateDevice(Adapter, D3D_DRIVER_TYPE_UNKNOWN, 0, 0, @Levels[0],
    Length(Levels), D3D11_SDK_VERSION, Device, FeatureLevel, Context);

  if HR = E_INVALIDARG then
  begin
    Device := nil;
    Context := nil;

    HR := D3D11CreateDevice(Adapter, D3D_DRIVER_TYPE_UNKNOWN, 0, 0,
      @LevelsNo11_1[0], Length(LevelsNo11_1), D3D11_SDK_VERSION, Device,
      FeatureLevel, Context);
  end;

  if Failed(HR) then
    Exit;

  case FeatureLevel of
    D3D_FEATURE_LEVEL_12_1:
      Result := '12.1';
    D3D_FEATURE_LEVEL_12_0:
      Result := '12.0';
    D3D_FEATURE_LEVEL_11_1:
      Result := '11.1';
    D3D_FEATURE_LEVEL_11_0:
      Result := '11.0';
    D3D_FEATURE_LEVEL_10_1:
      Result := '10.1';
    D3D_FEATURE_LEVEL_10_0:
      Result := '10.0';
    D3D_FEATURE_LEVEL_9_3:
      Result := '9.3';
    D3D_FEATURE_LEVEL_9_2:
      Result := '9.2';
    D3D_FEATURE_LEVEL_9_1:
      Result := '9.1';
  end;
end;

procedure TFSystemInfo.EnsureGPU;
var
  GPU: TGPUInfoRecord;
  Adapter: IDXGIAdapter1;
  Desc: DXGI_ADAPTER_DESC1;
begin
  if FGPUReady then
    Exit;

  FGPUName := 'Unknown';
  FGPUMemory := 0;
  FGPUFeatureLevel := 'Unknown';

  if GetBestGPU(GPU) then
  begin
    if FindDXGIAdapter(GPU.Name, Adapter, Desc) then
    begin
      FGPUName := string(Desc.Description);

      if GPU.Dedicated then
      begin
{$IFDEF WIN64}
        FGPUMemory := UInt64(Desc.DedicatedVideoMemory) div 1024 div 1024;

        if FGPUMemory = 0 then
          FGPUMemory := GPU.VRAM div 1024 div 1024;
{$ELSE}
        FGPUMemory := GPU.VRAM div 1024 div 1024;
{$ENDIF}
      end
      else
      begin
        if Desc.DedicatedVideoMemory <> 0 then
          FGPUMemory := UInt64(Desc.DedicatedVideoMemory) div 1024 div 1024
        else if GPU.VRAM <> 0 then
          FGPUMemory := GPU.VRAM div 1024 div 1024
        else
          FGPUMemory := UInt64(Desc.SharedSystemMemory) div 1024 div 1024;
      end;

      FGPUFeatureLevel := DetectGPUFeatureLevel(Adapter);
    end
    else
    begin
      FGPUName := GPU.Name;
      FGPUMemory := GPU.VRAM div 1024 div 1024;
    end;
  end;

  FGPUReady := True;
end;

function TFSystemInfo.GPUName: WideString;
begin
  EnsureGPU;
  Result := FGPUName;
end;

function TFSystemInfo.GPUMemory: UInt64;
begin
  EnsureGPU;
  Result := FGPUMemory;
end;

function TFSystemInfo.GPUFeatureLevel: WideString;
begin
  EnsureGPU;
  Result := FGPUFeatureLevel;
end;

// =============================================================================
// Ram
// =============================================================================
function TFSystemInfo.GetMemoryStatus(out Status: TMemoryStatusEx): Boolean;
begin
  ZeroMemory(@Status, SizeOf(Status));
  Status.dwLength := SizeOf(Status);

  Result := GlobalMemoryStatusEx(Status);
end;

function TFSystemInfo.RamLoad: Cardinal;
var
  Status: TMemoryStatusEx;
begin
  if GetMemoryStatus(Status) then
    Result := Status.dwMemoryLoad
  else
    Result := 0;
end;

function TFSystemInfo.TotalRam: Double;
var
  Status: TMemoryStatusEx;
begin
  if GetMemoryStatus(Status) then
    Result := Status.ullTotalPhys / 1024 / 1024
  else
    Result := 0;
end;

function TFSystemInfo.FreeRam: Double;
var
  Status: TMemoryStatusEx;
begin
  if GetMemoryStatus(Status) then
    Result := Status.ullAvailPhys / 1024 / 1024
  else
    Result := 0;
end;

function TFSystemInfo.UsedRam: Double;
var
  Status: TMemoryStatusEx;
begin
  if GetMemoryStatus(Status) then
    Result := (Status.ullTotalPhys - Status.ullAvailPhys) / 1024 / 1024
  else
    Result := 0;
end;

// =============================================================================
// CPU
// =============================================================================
procedure TFSystemInfo.EnsureCPU;
var
  WmiLocator: OLEVariant;
  WMIService: OLEVariant;
  CPUInfo: OLEVariant;
  Enum: IEnumVariant;
  Item: OLEVariant;
  Value: ULONG;
  HR: HRESULT;
begin
  if FCPUReady then
    Exit;

  FCPUNameValue := '';
  FCPUCoresValue := 0;
  FCPUThreadsValue := 0;
  FCPUSpeedValue := 0;

  HR := CoInitialize(nil);
  try
    WmiLocator := CreateOleObject('WbemScripting.SWbemLocator');
    WMIService := WmiLocator.ConnectServer('localhost', 'root\CIMV2');

    CPUInfo := WMIService.ExecQuery('SELECT Name, NumberOfCores, ' +
      'NumberOfLogicalProcessors, MaxClockSpeed ' + 'FROM Win32_Processor');

    Enum := IUnknown(CPUInfo._NewEnum) as IEnumVariant;

    if (Enum <> nil) and (Enum.Next(1, Item, Value) = 0) then
    begin
      FCPUNameValue := NormalizeCpuName(VarToStr(Item.Name));

      FCPUCoresValue := VarAsType(Item.NumberOfCores, varInteger);

      FCPUThreadsValue := VarAsType(Item.NumberOfLogicalProcessors, varInteger);

      FCPUSpeedValue := VarAsType(Item.MaxClockSpeed, varInteger);
    end;
  finally
    if Succeeded(HR) then
      CoUninitialize;
  end;

  FCPUReady := True;
end;

function TFSystemInfo.NormalizeCpuName(const S: string): string;
var
  Tmp: string;
  P: Integer;
begin
  Tmp := Trim(S);

  P := Pos('@', Tmp);
  if P > 0 then
    Tmp := Copy(Tmp, 1, P - 1);

  Tmp := StringReplace(Tmp, ' CPU', '', [rfIgnoreCase]);

  Tmp := StringReplace(Tmp, 'CPU', '', [rfIgnoreCase]);

  while Pos('  ', Tmp) > 0 do
    Tmp := StringReplace(Tmp, '  ', ' ', []);

  Result := Trim(Tmp);
end;

function TFSystemInfo.FileTimeToUInt64(const FT: TFileTime): UInt64;
begin
  Result := (UInt64(FT.dwHighDateTime) shl 32) or UInt64(FT.dwLowDateTime);
end;

function TFSystemInfo.GetCpuLoad: Cardinal;
var
  IdleTime: TFileTime;
  KernelTime: TFileTime;
  UserTime: TFileTime;

  Idle: UInt64;
  Kernel: UInt64;
  User: UInt64;

  PrevIdle64: UInt64;
  PrevKernel64: UInt64;
  PrevUser64: UInt64;

  SysDelta: UInt64;
  IdleDelta: UInt64;
begin
  Result := 0;

  if not GetSystemTimes(IdleTime, KernelTime, UserTime) then
    Exit;

  Idle := FileTimeToUInt64(IdleTime);
  Kernel := FileTimeToUInt64(KernelTime);
  User := FileTimeToUInt64(UserTime);

  if (FPrevIdle.dwLowDateTime = 0) and (FPrevIdle.dwHighDateTime = 0) then
  begin
    FPrevIdle := IdleTime;
    FPrevKernel := KernelTime;
    FPrevUser := UserTime;
    Exit;
  end;

  PrevIdle64 := FileTimeToUInt64(FPrevIdle);
  PrevKernel64 := FileTimeToUInt64(FPrevKernel);
  PrevUser64 := FileTimeToUInt64(FPrevUser);

  SysDelta := (Kernel - PrevKernel64) + (User - PrevUser64);

  IdleDelta := Idle - PrevIdle64;

  if (SysDelta > 0) and (IdleDelta <= SysDelta) then
    Result := Cardinal((SysDelta - IdleDelta) * 100 div SysDelta)
  else
    Result := 0;

  FPrevIdle := IdleTime;
  FPrevKernel := KernelTime;
  FPrevUser := UserTime;
end;

function TFSystemInfo.CPUName: WideString;
begin
  EnsureCPU;
  Result := FCPUNameValue;
end;

function TFSystemInfo.CPUCores: Cardinal;
begin
  EnsureCPU;
  Result := FCPUCoresValue;
end;

function TFSystemInfo.CPUThreads: Cardinal;
begin
  EnsureCPU;
  Result := FCPUThreadsValue;
end;

function TFSystemInfo.CPUSpeed: Cardinal;
begin
  EnsureCPU;
  Result := FCPUSpeedValue;
end;

function TFSystemInfo.CPULoad: Cardinal;
begin
  Result := GetCpuLoad;
end;

// =============================================================================
// User
// =============================================================================
procedure TFSystemInfo.EnsureUser;
var
  Buf: array [0 .. 260] of WideChar;
  Size: DWORD;
  P: Integer;
begin
  if FUserReady then
    Exit;

  FUserNameValue := '';
  FUserDomainValue := '';
  FUserProfilePathValue := '';
  FUserTypeValue := utUnknown;
  FUserIsElevatedValue := False;

  Size := Length(Buf);

  if GetUserNameW(Buf, Size) then
    FUserNameValue := Buf;

  Size := Length(Buf);

  if GetUserNameExW(NameSamCompatible, Buf, Size) then
  begin
    FUserDomainValue := Buf;

    P := Pos('\', FUserDomainValue);

    if P > 0 then
      FUserDomainValue := Copy(FUserDomainValue, 1, P - 1);
  end;

  Size := GetEnvironmentVariableW('USERPROFILE', Buf, Length(Buf));

  if (Size > 0) and (Size < DWORD(Length(Buf))) then
    FUserProfilePathValue := Buf;

  FUserIsElevatedValue := CheckElevated;

  if SameText(FUserNameValue, 'SYSTEM') then
    FUserTypeValue := utSystem
  else if FUserIsElevatedValue then
    FUserTypeValue := utAdmin
  else
    FUserTypeValue := utUser;

  FUserReady := True;
end;

function TFSystemInfo.CheckElevated: Boolean;
var
  Token: THandle;
  Elevation: TOKEN_ELEVATION;
  Size: DWORD;
begin
  Result := False;

  if not OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, Token) then
    Exit;

  try
    if GetTokenInformation(Token, TokenElevation, @Elevation, SizeOf(Elevation),
      Size) then
      Result := Elevation.TokenIsElevated <> 0;
  finally
    CloseHandle(Token);
  end;
end;

function TFSystemInfo.UserName: WideString;
begin
  EnsureUser;
  Result := FUserNameValue;
end;

function TFSystemInfo.UserDomain: WideString;
begin
  EnsureUser;
  Result := FUserDomainValue;
end;

function TFSystemInfo.UserProfilePath: WideString;
begin
  EnsureUser;
  Result := FUserProfilePathValue;
end;

function TFSystemInfo.UserType: TUserType;
begin
  EnsureUser;
  Result := FUserTypeValue;
end;

function TFSystemInfo.UserIsElevated: Boolean;
begin
  EnsureUser;
  Result := FUserIsElevatedValue;
end;

// =============================================================================
// Expotrs
// =============================================================================
function InitStorageInfo: FStorageInfo;
begin
  Result := TFStorageInfo.Create;
end;

function InitSystemInfo: FSystemInfo;
begin
  Result := TFSystemInfo.Create;
end;

exports
  InitStorageInfo,
  InitSystemInfo;

end.
