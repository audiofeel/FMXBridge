
unit DynamicBass;

interface

uses
  Winapi.Windows;

const
  bassdll = 'bass.dll';

  BASSVERSION = $204;

  BASS_OK = 0;

  BASS_ERROR_MEM = 1;
  BASS_ERROR_FILEOPEN = 2;
  BASS_ERROR_DRIVER = 3;
  BASS_ERROR_HANDLE = 5;
  BASS_ERROR_FORMAT = 6;
  BASS_ERROR_INIT = 8;
  BASS_ERROR_NOTAUDIO = 17;
  BASS_ERROR_NOCHAN = 18;
  BASS_ERROR_DEVICE = 23;
  BASS_ERROR_NOPLAY = 24;
  BASS_ERROR_FILEFORM = 41;

  BASS_FILE_NAME = 0;

  BASS_STREAM_AUTOFREE = $40000;
  BASS_STREAM_DECODE = $200000;
  BASS_STREAM_PRESCAN = $20000;

  BASS_UNICODE = $80000000;

  BASS_POS_BYTE = 0;

  BASS_ACTIVE_STOPPED = 0;
  BASS_ACTIVE_PLAYING = 1;
  BASS_ACTIVE_STALLED = 2;
  BASS_ACTIVE_PAUSED = 3;

  BASS_ATTRIB_FREQ = 1;
  BASS_ATTRIB_VOL = 2;
  BASS_ATTRIB_PAN = 3;

  BASS_DATA_FFT4096 = $80000004;
  BASS_DATA_FLOAT = $40000000;

  BASS_LEVEL_MONO = 1;
  BASS_LEVEL_STEREO = 2;
  BASS_LEVEL_RMS = 4;

  BASS_SYNC_END = 2;

type
  DWORD = Cardinal;
  BOOL = LongBool;
  QWORD = Int64;

  HSTREAM = DWORD;
  HSYNC = DWORD;

type
  SYNCPROC = procedure(handle: HSYNC; channel, data: DWORD;
    user: Pointer); stdcall;

var
  BASS_Init: function(device: Integer; freq, flags: DWORD; win: HWND;
    clsid: Pointer): BOOL; stdcall;
  BASS_Free: function: BOOL; stdcall;
  BASS_StreamCreateFile: function(filetype: DWORD; f: Pointer;
    offset, length: QWORD; flags: DWORD): HSTREAM; stdcall;
  BASS_StreamFree: function(handle: HSTREAM): BOOL; stdcall;
  BASS_ChannelPlay: function(handle: DWORD; restart: BOOL): BOOL; stdcall;
  BASS_ChannelPause: function(handle: DWORD): BOOL; stdcall;
  BASS_ChannelStop: function(handle: DWORD): BOOL; stdcall;
  BASS_ChannelIsActive: function(handle: DWORD): DWORD; stdcall;
  BASS_ChannelSetAttribute: function(handle, attrib: DWORD;
    value: Single): BOOL; stdcall;
  BASS_ChannelGetLength: function(handle, mode: DWORD): QWORD; stdcall;
  BASS_ChannelSetPosition: function(handle: DWORD; pos: QWORD;
    mode: DWORD): BOOL; stdcall;
  BASS_ChannelGetPosition: function(handle, mode: DWORD): QWORD; stdcall;
  BASS_ChannelBytes2Seconds: function(handle: DWORD; pos: QWORD):
    Double; stdcall;
  BASS_ChannelSeconds2Bytes: function(handle: DWORD; pos: Double):
    QWORD; stdcall;
  BASS_ChannelGetData: function(handle: DWORD; buffer: Pointer;
    length: DWORD): DWORD; stdcall;
  BASS_ChannelSetSync: function(handle: DWORD; type_: DWORD;
    param: QWORD; proc: SYNCPROC; user: Pointer): HSYNC; stdcall;
  BASS_ChannelRemoveSync: function(handle: DWORD; sync: HSYNC):
    BOOL; stdcall;

var
  BASS_Handle: Thandle = 0;

function Load_BASSDLL(const dllfilename: String): boolean;
procedure Unload_BASSDLL;

implementation

function Load_BASSDLL(const dllfilename: String): boolean;
var
  oldmode: Integer;
begin
  if BASS_Handle <> 0 then
    Result := true
  else
  begin
    oldmode := SetErrorMode($8001);

{$IFDEF UNICODE}
    BASS_Handle := LoadLibraryW(PWideChar(dllfilename));
{$ELSE}
    BASS_Handle := LoadLibrary(PChar(dllfilename));
{$ENDIF}
    SetErrorMode(oldmode);

    if BASS_Handle <> 0 then
    begin
      @BASS_Init := GetProcAddress(BASS_Handle, PChar('BASS_Init'));
      @BASS_Free := GetProcAddress(BASS_Handle, PChar('BASS_Free'));
      @BASS_StreamCreateFile := GetProcAddress(BASS_Handle,
        PChar('BASS_StreamCreateFile'));
      @BASS_StreamFree := GetProcAddress(BASS_Handle,
        PChar('BASS_StreamFree'));
      @BASS_ChannelPlay := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelPlay'));
      @BASS_ChannelPause := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelPause'));
      @BASS_ChannelStop := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelStop'));
      @BASS_ChannelIsActive := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelIsActive'));
      @BASS_ChannelGetLength := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelGetLength'));
      @BASS_ChannelSetPosition := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelSetPosition'));
      @BASS_ChannelGetPosition := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelGetPosition'));
      @BASS_ChannelSeconds2Bytes := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelSeconds2Bytes'));
      @BASS_ChannelBytes2Seconds := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelBytes2Seconds'));
      @BASS_ChannelGetData := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelGetData'));
      @BASS_ChannelSetSync := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelSetSync'));
      @BASS_ChannelRemoveSync := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelRemoveSync'));
      @BASS_ChannelSetAttribute := GetProcAddress(BASS_Handle,
        PChar('BASS_ChannelSetAttribute'));

      if (@BASS_Init = nil) or
         (@BASS_Free = nil) or
         (@BASS_StreamCreateFile = nil) or
         (@BASS_StreamFree = nil) or
         (@BASS_ChannelPlay = nil) or
         (@BASS_ChannelPause = nil) or
         (@BASS_ChannelStop = nil) or
         (@BASS_ChannelIsActive = nil) or
         (@BASS_ChannelGetLength = nil) or
         (@BASS_ChannelSetPosition = nil) or
         (@BASS_ChannelGetPosition = nil) or
         (@BASS_ChannelSeconds2Bytes = nil) or
         (@BASS_ChannelBytes2Seconds = nil) or
         (@BASS_ChannelGetData = nil) or
         (@BASS_ChannelSetSync = nil) or
         (@BASS_ChannelRemoveSync = nil) or
         (@BASS_ChannelSetAttribute = nil) then
      begin
        FreeLibrary(BASS_Handle);
        BASS_Handle := 0;
      end;
    end;
    Result := (BASS_Handle <> 0);
  end;
end;

procedure Unload_BASSDLL;
begin
  if BASS_Handle <> 0 then
  begin
    BASS_Free;
    FreeLibrary(BASS_Handle);
  end;
  BASS_Handle := 0;
end;

end.
