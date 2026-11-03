
unit FMXBridge.Dialogs;

interface

uses
  Winapi.Windows;

function BrowseDialog(const Caption: WideString;
  var OutDir: WideString): Boolean; stdcall;

function OpenDialog(const Caption, DefExt, Filter: WideString;
  var InDir, FileName: WideString): Boolean; stdcall;

function SaveDialog(const Caption, DefExt, Filter: WideString;
  var InDir, FileName: WideString): Boolean; stdcall;

implementation

uses
  System.Classes, System.SysUtils,
  Winapi.ActiveX, Winapi.Messages,
  FMX.Dialogs;

// -----------------------------------------------------------------------------
// Dialog thread
// -----------------------------------------------------------------------------
type
  TFMXDialogMode = (dmBrowse, dmOpen, dmSave);

  TFMXDialogThread = class(TThread)
  private
    FMode: TFMXDialogMode;

    FTitle: string;
    FDefExt: string;
    FFilter: string;
    FInitialDir: string;

    FDirectory: string;
    FFileName: string;
    FResult: Boolean;

  protected
    procedure Execute; override;

  public
    constructor Create(AMode: TFMXDialogMode; const ATitle, ADefExt, AFilter,
      AInitialDir: string);

    property Result: Boolean read FResult;
    property Directory: string read FDirectory;
    property FileName: string read FFileName;
  end;

// -----------------------------------------------------------------------------
// TFMXDialogThread
// -----------------------------------------------------------------------------
constructor TFMXDialogThread.Create(AMode: TFMXDialogMode;
  const ATitle, ADefExt, AFilter, AInitialDir: string);
begin
  inherited Create(True);

  FreeOnTerminate := False;

  FMode := AMode;

  FTitle := ATitle;
  FDefExt := ADefExt;
  FFilter := AFilter;
  FInitialDir := AInitialDir;

  FDirectory := '';
  FFileName := '';
  FResult := False;
end;

procedure TFMXDialogThread.Execute;
var
  Hr: HRESULT;
  COMInitialized: Boolean;
  OpenDlg: TOpenDialog;
  SaveDlg: TSaveDialog;
  Directory: string;
begin
  Hr := CoInitializeEx(nil, COINIT_APARTMENTTHREADED);

  COMInitialized := (Hr = S_OK) or (Hr = S_FALSE);

  if not COMInitialized then
    Exit;

  try
    case FMode of

      // -----------------------------------------------------------------------
      // Select directory
      // -----------------------------------------------------------------------
      dmBrowse:
        begin
          Directory := '';

          FResult := SelectDirectory(FTitle, '', Directory);

          if FResult then
            FDirectory := Directory;
        end;

      // -----------------------------------------------------------------------
      // Open file
      // -----------------------------------------------------------------------
      dmOpen:
        begin
          OpenDlg := TOpenDialog.Create(nil);
          try
            OpenDlg.Title := FTitle;
            OpenDlg.Filter := FFilter;
            OpenDlg.DefaultExt := FDefExt;
            OpenDlg.InitialDir := FInitialDir;

            FResult := OpenDlg.Execute;

            if FResult then
              FFileName := OpenDlg.FileName;
          finally
            OpenDlg.Free;
          end;
        end;

      // -----------------------------------------------------------------------
      // Save file
      // -----------------------------------------------------------------------
      dmSave:
        begin
          SaveDlg := TSaveDialog.Create(nil);
          try
            SaveDlg.Title := FTitle;
            SaveDlg.Filter := FFilter;
            SaveDlg.DefaultExt := FDefExt;
            SaveDlg.InitialDir := FInitialDir;

            FResult := SaveDlg.Execute;

            if FResult then
              FFileName := SaveDlg.FileName;
          finally
            SaveDlg.Free;
          end;
        end;

    end;
  finally
    CoUninitialize;
  end;
end;

// -----------------------------------------------------------------------------
// Wait for dialog thread without blocking the host GUI
// -----------------------------------------------------------------------------
function WaitForDialogThread(Thread: TThread): Boolean;
var
  Handles: array [0 .. 0] of THandle;
  Msg: TMsg;
  WaitResult: DWORD;
begin
  Result := False;

  Handles[0] := Thread.Handle;

  while True do
  begin
    WaitResult := MsgWaitForMultipleObjects(1, Handles, False, INFINITE,
      QS_ALLINPUT);

    case WaitResult of

      WAIT_OBJECT_0:
        begin
          Result := True;
          Exit;
        end;

      WAIT_OBJECT_0 + 1:
        begin
          while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do
          begin
            if Msg.Message = WM_QUIT then
            begin
              PostQuitMessage(Integer(Msg.WParam));
              Continue;
            end;

            TranslateMessage(Msg);
            DispatchMessage(Msg);
          end;
        end;

    else
      Exit;
    end;
  end;
end;

// -----------------------------------------------------------------------------
// GetSystemDrive
// -----------------------------------------------------------------------------
function GetSystemDrive: string;
begin
  Result := GetEnvironmentVariable('SystemDrive') + '\';

  if Result = '\' then
    Result := 'C:\';
end;

// =============================================================================
// BrowseDialog
// =============================================================================
function BrowseDialog(const Caption: WideString;
  var OutDir: WideString): Boolean;
var
  Thread: TFMXDialogThread;
begin
  Result := False;
  OutDir := '';

  Thread := TFMXDialogThread.Create(dmBrowse, string(Caption), '', '', '');

  try
    Thread.Start;

    if WaitForDialogThread(Thread) then
    begin
      Result := Thread.Result;

      if Result then
        OutDir := Thread.Directory;
    end;
  finally
    Thread.Free;
  end;
end;

// =============================================================================
// OpenDialog
// =============================================================================
function OpenDialog(const Caption, DefExt, Filter: WideString;
  var InDir, FileName: WideString): Boolean;
var
  Thread: TFMXDialogThread;
  StartDir: string;
begin
  Result := False;
  FileName := '';

  StartDir := string(InDir);

  if not DirectoryExists(StartDir) then
    StartDir := GetSystemDrive;

  Thread := TFMXDialogThread.Create(dmOpen, string(Caption), string(DefExt),
    string(Filter), StartDir);

  try
    Thread.Start;

    if WaitForDialogThread(Thread) then
    begin
      Result := Thread.Result;

      if Result then
        FileName := Thread.FileName;
    end;
  finally
    Thread.Free;
  end;
end;

// =============================================================================
// SaveDialog
// =============================================================================
function SaveDialog(const Caption, DefExt, Filter: WideString;
  var InDir, FileName: WideString): Boolean;
var
  Thread: TFMXDialogThread;
  StartDir: string;
begin
  Result := False;
  FileName := '';

  StartDir := string(InDir);

  if not DirectoryExists(StartDir) then
    StartDir := GetSystemDrive;

  Thread := TFMXDialogThread.Create(dmSave, string(Caption), string(DefExt),
    string(Filter), StartDir);

  try
    Thread.Start;

    if WaitForDialogThread(Thread) then
    begin
      Result := Thread.Result;

      if Result then
        FileName := Thread.FileName;
    end;
  finally
    Thread.Free;
  end;
end;

// =============================================================================
// Exports
// =============================================================================
exports
  BrowseDialog,
  OpenDialog,
  SaveDialog;

end.
