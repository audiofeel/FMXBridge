; =============================================================================
; FMXBridge - Windows Toast test
; The notification is sent by the running Setup.exe process.
; =============================================================================

[Setup]
AppName=FMXBridge_WindowsToast
AppVersion=1.0
CreateAppDir=no
SetupArchitecture=x64
PrivilegesRequired=admin
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  Toast: FToast;

function InitializeSetup(): Boolean;
begin
  Toast := InitToastHandle;
  Result := True;
end;

procedure InitializeWizard();
begin
  Toast.Show('FMXBridge Toast', 'This notification was sent by the running Setup.exe process.');
end;

procedure DeinitializeSetup();
begin
  Toast := nil;
end;
