unit FMX.HashEngine;

interface

uses
  FMX.Hash.Algorithms;

const
  { Hash algorithms. Keep IDs shared with the central registry. }
  HX_HASH_BLAKE3_256 = HASH_ALGORITHM_BLAKE3_256;

  { Task states }
  HX_STATE_QUEUED = 0;
  HX_STATE_RUNNING = 1;
  HX_STATE_PAUSED = 2;
  HX_STATE_CANCELING = 3;
  HX_STATE_COMPLETED = 4;
  HX_STATE_CANCELED = 5;
  HX_STATE_FAILED = 6;

  { API error codes }
  HX_OK = 0;
  HX_ERR_INVALID_ARGUMENT = -1;
  HX_ERR_INVALID_ALGORITHM = -2;
  HX_ERR_INVALID_HASH = -3;
  HX_ERR_FILE_NOT_FOUND = -4;
  HX_ERR_TASK_NOT_FOUND = -5;
  HX_ERR_INVALID_STATE = -6;
  HX_ERR_SHUTTING_DOWN = -7;
  HX_ERR_FILE_CHANGED = -8;
  HX_ERR_PROCESSING = -9;
  HX_ERR_OUT_OF_MEMORY = -10;
  HX_ERR_BUSY = -11;

  { HX_GetVerifyResult values }
  HX_VERIFY_MATCH = 1;
  HX_VERIFY_MISMATCH = 0;
  HX_VERIFY_PENDING = -2;
  HX_VERIFY_NOT_REQUESTED = -1;
  HX_VERIFY_TASK_NOT_FOUND = -3;
  HX_VERIFY_CANCELED = -4;
  HX_VERIFY_FAILED = -5;

function HX_StartHashFile(FileName: WideString;
  HashAlgo, BufferSizeKB: Integer): Integer;

function HX_StartVerifyFile(FileName, ExpectedHash: WideString;
  HashAlgo, BufferSizeKB: Integer): Integer;

function HX_GetProgress(TaskID: Integer; var State, FileProgress, TotalProgress,
  FilesDone, FilesTotal: Integer; var FileBytesProcessed, FileSize,
  TotalBytesProcessed, TotalBytes: Int64): Integer;

function HX_GetCurrentFile(TaskID: Integer): WideString;
function HX_GetHashResult(TaskID: Integer): WideString;
function HX_GetVerifyResult(TaskID: Integer): Integer;
function HX_GetErrorCode(TaskID: Integer): Integer;
function HX_GetErrorMessage(TaskID: Integer): WideString;

function HX_Pause(TaskID: Integer): Integer;
function HX_Resume(TaskID: Integer): Integer;
function HX_Cancel(TaskID: Integer): Integer;
function HX_ReleaseTask(TaskID: Integer): Integer;

procedure HX_Shutdown;

implementation

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.SyncObjs,
  System.Generics.Collections,
  HlpIHash,
  HlpIHashResult,
  HlpHashLibTypes;

const
  HX_DEFAULT_BUFFER_KB = 1024;
  HX_MIN_BUFFER_KB = 64;
  HX_MAX_BUFFER_KB = 8192;

type
  THXHashTask = class(TThread)
  private
    FFileName: UnicodeString;
    FExpectedHash: THashLibByteArray;
    FIsVerify: Boolean;
    FBufferSizeKB: Integer;
    FHashAlgorithm: Integer;
    FHashSizeBytes: Integer;
    FResumeEvent: TEvent;

    FState: Integer;
    FCancelRequested: Boolean;
    FPaused: Boolean;
    FFileProgress: Integer;
    FTotalProgress: Integer;
    FFilesDone: Integer;
    FFileSize: Int64;
    FBytesProcessed: Int64;
    FHashResult: UnicodeString;
    FVerifyResult: Integer;
    FErrorCode: Integer;
    FErrorMessage: UnicodeString;

    function WaitUntilActive: Boolean;
    function IsCancelRequested: Boolean;
    procedure SetFileSize(AValue: Int64);
    procedure PublishProgress(ABytesProcessed: Int64);
    procedure FinishSuccess(const AHash: UnicodeString; AVerifyResult: Integer);
    procedure FinishCanceled;
    procedure FinishFailure(AErrorCode: Integer;
      const AErrorMessage: UnicodeString);
  protected
    procedure Execute; override;
  public
    constructor Create(const AFileName: UnicodeString;
      const AExpectedHash: THashLibByteArray; AIsVerify: Boolean;
      AHashAlgorithm, ABufferSizeKB: Integer);
    destructor Destroy; override;
  end;

var
  GTaskLock: TCriticalSection;
  GTasks: TDictionary<Integer, THXHashTask>;
  GNextTaskID: Integer;
  GShuttingDown: Boolean;

function FindTaskLocked(ATaskID: Integer): THXHashTask;
begin
  if not GTasks.TryGetValue(ATaskID, Result) then
    Result := nil;
end;

function IsTerminalState(AState: Integer): Boolean;
begin
  Result := AState in [HX_STATE_COMPLETED, HX_STATE_CANCELED, HX_STATE_FAILED];
end;

function GetNextTaskIDLocked: Integer;
begin
  repeat
    Inc(GNextTaskID);
    if GNextTaskID <= 0 then
      GNextTaskID := 1;
  until not GTasks.ContainsKey(GNextTaskID);
  Result := GNextTaskID;
end;

function NormalizeBufferSize(ABufferSizeKB: Integer;
  out ANormalizedSizeKB: Integer): Boolean;
begin
  if ABufferSizeKB = 0 then
    ANormalizedSizeKB := HX_DEFAULT_BUFFER_KB
  else
    ANormalizedSizeKB := ABufferSizeKB;

  Result := (ANormalizedSizeKB >= HX_MIN_BUFFER_KB) and
    (ANormalizedSizeKB <= HX_MAX_BUFFER_KB);
end;

function StartTask(const AFileName: UnicodeString;
  const AExpectedHash: THashLibByteArray; AIsVerify: Boolean;
  AHashAlgorithm, ABufferSizeKB: Integer): Integer;
var
  LTaskID: Integer;
  LTask: THXHashTask;
  LExistingTask: THXHashTask;
  LAdded: Boolean;
begin
  LTask := nil;
  LAdded := False;

  GTaskLock.Enter;
  try
    if GShuttingDown then
      Exit(HX_ERR_SHUTTING_DOWN);

    { The first implementation intentionally permits only one active worker. }
    for LExistingTask in GTasks.Values do
      if not IsTerminalState(LExistingTask.FState) then
        Exit(HX_ERR_BUSY);

    LTaskID := GetNextTaskIDLocked;
    try
      LTask := THXHashTask.Create(AFileName, AExpectedHash, AIsVerify,
        AHashAlgorithm, ABufferSizeKB);
      GTasks.Add(LTaskID, LTask);
      LAdded := True;
      LTask.Start;
      Result := LTaskID;
    except
      on E: Exception do
      begin
        if LAdded then
          GTasks.Remove(LTaskID);
        if Assigned(LTask) then
          LTask.Free;
        if E is EOutOfMemory then
          Result := HX_ERR_OUT_OF_MEMORY
        else
          Result := HX_ERR_PROCESSING;
      end;
    end;
  finally
    GTaskLock.Leave;
  end;
end;

{ THXHashTask }

constructor THXHashTask.Create(const AFileName: UnicodeString;
  const AExpectedHash: THashLibByteArray; AIsVerify: Boolean;
  AHashAlgorithm, ABufferSizeKB: Integer);
begin
  inherited Create(True);
  FreeOnTerminate := False;

  FFileName := AFileName;
  SetLength(FExpectedHash, Length(AExpectedHash));
  if Length(AExpectedHash) > 0 then
    Move(AExpectedHash[0], FExpectedHash[0], Length(AExpectedHash));
  FIsVerify := AIsVerify;
  FHashAlgorithm := AHashAlgorithm;
  FHashSizeBytes := GetHashAlgorithmDigestSize(AHashAlgorithm);
  if FHashSizeBytes <= 0 then
    raise EArgumentException.Create('Unsupported hash algorithm');
  FBufferSizeKB := ABufferSizeKB;
  FResumeEvent := TEvent.Create(nil, True, True, '');

  FState := HX_STATE_QUEUED;
  FVerifyResult := HX_VERIFY_NOT_REQUESTED;
  if FIsVerify then
    FVerifyResult := HX_VERIFY_PENDING;
end;

destructor THXHashTask.Destroy;
begin
  FResumeEvent.Free;
  inherited;
end;

function THXHashTask.WaitUntilActive: Boolean;
var
  LPaused, LCanceled: Boolean;
begin
  while True do
  begin
    GTaskLock.Enter;
    try
      LCanceled := FCancelRequested;
      LPaused := FPaused;
    finally
      GTaskLock.Leave;
    end;

    if LCanceled then
      Exit(False);

    if not LPaused then
      Exit(True);

    FResumeEvent.WaitFor(INFINITE);
  end;
end;

function THXHashTask.IsCancelRequested: Boolean;
begin
  GTaskLock.Enter;
  try
    Result := FCancelRequested;
  finally
    GTaskLock.Leave;
  end;
end;

procedure THXHashTask.SetFileSize(AValue: Int64);
begin
  GTaskLock.Enter;
  try
    FFileSize := AValue;
  finally
    GTaskLock.Leave;
  end;
end;

procedure THXHashTask.PublishProgress(ABytesProcessed: Int64);
var
  LProgress: Integer;
begin
  GTaskLock.Enter;
  try
    FBytesProcessed := ABytesProcessed;

    if FFileSize > 0 then
    begin
      if ABytesProcessed >= FFileSize then
        LProgress := 100
      else
        LProgress := Trunc((ABytesProcessed / FFileSize) * 100.0);
    end
    else
      LProgress := 0;

    if LProgress < 0 then
      LProgress := 0;
    if LProgress > 100 then
      LProgress := 100;

    FFileProgress := LProgress;
    FTotalProgress := LProgress;
  finally
    GTaskLock.Leave;
  end;
end;

procedure THXHashTask.FinishSuccess(const AHash: UnicodeString;
  AVerifyResult: Integer);
begin
  GTaskLock.Enter;
  try
    if FCancelRequested then
    begin
      FState := HX_STATE_CANCELED;
      if FIsVerify then
        FVerifyResult := HX_VERIFY_CANCELED;
      FPaused := False;
      FResumeEvent.SetEvent;
      Exit;
    end;

    FHashResult := AHash;
    FVerifyResult := AVerifyResult;
    FBytesProcessed := FFileSize;
    FFileProgress := 100;
    FTotalProgress := 100;
    FFilesDone := 1;
    FState := HX_STATE_COMPLETED;
    FPaused := False;
    FResumeEvent.SetEvent;
  finally
    GTaskLock.Leave;
  end;
end;

procedure THXHashTask.FinishCanceled;
begin
  GTaskLock.Enter;
  try
    FState := HX_STATE_CANCELED;
    if FIsVerify then
      FVerifyResult := HX_VERIFY_CANCELED;
    FPaused := False;
    FResumeEvent.SetEvent;
  finally
    GTaskLock.Leave;
  end;
end;

procedure THXHashTask.FinishFailure(AErrorCode: Integer;
  const AErrorMessage: UnicodeString);
begin
  GTaskLock.Enter;
  try
    if FCancelRequested then
    begin
      FState := HX_STATE_CANCELED;
      if FIsVerify then
        FVerifyResult := HX_VERIFY_CANCELED;
    end
    else
    begin
      FState := HX_STATE_FAILED;
      if FIsVerify then
        FVerifyResult := HX_VERIFY_FAILED;
      FErrorCode := AErrorCode;
      FErrorMessage := AErrorMessage;
    end;

    FPaused := False;
    FResumeEvent.SetEvent;
  finally
    GTaskLock.Leave;
  end;
end;

procedure THXHashTask.Execute;
var
  LStream: TFileStream;
  LHash: IHash;
  LHashResult: IHashResult;
  LBuffer: THashLibByteArray;
  LHashBytes: THashLibByteArray;
  LRead: Integer;
  LHashSizeCreated: Integer;
  LFileSize: Int64;
  LProcessed: Int64;
  LHashText: UnicodeString;
  LVerifyResult: Integer;
  LSuccess: Boolean;
  LCanceled: Boolean;
  LErrorCode: Integer;
  LErrorMessage: UnicodeString;
begin
  LStream := nil;
  LSuccess := False;
  LCanceled := False;
  LErrorCode := HX_ERR_PROCESSING;
  LErrorMessage := '';
  LProcessed := 0;
  LVerifyResult := HX_VERIFY_NOT_REQUESTED;

  if FIsVerify then
    LVerifyResult := HX_VERIFY_PENDING;

  try
    try
      if not WaitUntilActive then
        LCanceled := True
      else
      begin
        GTaskLock.Enter;
        try
          if FState = HX_STATE_QUEUED then
            FState := HX_STATE_RUNNING;
        finally
          GTaskLock.Leave;
        end;

        LStream := TFileStream.Create(FFileName, fmOpenRead or
          fmShareDenyWrite);
        LFileSize := LStream.Size;
        SetFileSize(LFileSize);

        if not TryCreateHash(FHashAlgorithm, LHash, LHashSizeCreated) then
          raise Exception.Create('Unable to create hash algorithm instance');
        if LHashSizeCreated <> FHashSizeBytes then
          raise Exception.Create
            ('Registered hash digest size does not match its factory');
        LHash.Initialize;

        SetLength(LBuffer, FBufferSizeKB * 1024);

        while True do
        begin
          if not WaitUntilActive then
          begin
            LCanceled := True;
            Break;
          end;

          LRead := LStream.Read(LBuffer[0], Length(LBuffer));
          if LRead = 0 then
            Break;

          LHash.TransformBytes(LBuffer, 0, LRead);
          Inc(LProcessed, LRead);
          PublishProgress(LProcessed);
        end;

        if not LCanceled then
        begin
          if IsCancelRequested then
            LCanceled := True
          else if LProcessed <> LFileSize then
          begin
            LErrorCode := HX_ERR_FILE_CHANGED;
            LErrorMessage := 'File size changed while hashing';
          end
          else
          begin
            LHashResult := LHash.TransformFinal;
            LHashBytes := LHashResult.GetBytes;

            if Length(LHashBytes) <> FHashSizeBytes then
            begin
              LErrorCode := HX_ERR_PROCESSING;
              LErrorMessage := 'Hash engine returned an unexpected digest size';
            end
            else
            begin
              LHashText := HashBytesToHex(LHashBytes);
              if FIsVerify then
              begin
                if HashBytesEqual(LHashBytes, FExpectedHash) then
                  LVerifyResult := HX_VERIFY_MATCH
                else
                  LVerifyResult := HX_VERIFY_MISMATCH;
              end;
              LSuccess := True;
            end;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        if E is EOutOfMemory then
          LErrorCode := HX_ERR_OUT_OF_MEMORY
        else
          LErrorCode := HX_ERR_PROCESSING;
        LErrorMessage := E.ClassName + ': ' + E.Message;
      end;
    end;
  finally
    try
      LStream.Free;
    except
      on E: Exception do
      begin
        LSuccess := False;
        LErrorCode := HX_ERR_PROCESSING;
        LErrorMessage := 'Error closing file: ' + E.Message;
      end;
    end;
  end;

  if LCanceled or IsCancelRequested then
    FinishCanceled
  else if LSuccess then
    FinishSuccess(LHashText, LVerifyResult)
  else
    FinishFailure(LErrorCode, LErrorMessage);
end;

function HX_StartHashFile(FileName: WideString;
  HashAlgo, BufferSizeKB: Integer): Integer;
var
  LBufferSizeKB: Integer;
begin
  if FileName = '' then
    Exit(HX_ERR_INVALID_ARGUMENT);
  if not IsHashAlgorithmSupported(HashAlgo) then
    Exit(HX_ERR_INVALID_ALGORITHM);
  if not NormalizeBufferSize(BufferSizeKB, LBufferSizeKB) then
    Exit(HX_ERR_INVALID_ARGUMENT);
  if not FileExists(UnicodeString(FileName)) then
    Exit(HX_ERR_FILE_NOT_FOUND);

  Result := StartTask(UnicodeString(FileName), nil, False, HashAlgo,
    LBufferSizeKB);
end;

function HX_StartVerifyFile(FileName, ExpectedHash: WideString;
  HashAlgo, BufferSizeKB: Integer): Integer;
var
  LBufferSizeKB: Integer;
  LExpectedHash: THashLibByteArray;
begin
  if (FileName = '') or (ExpectedHash = '') then
    Exit(HX_ERR_INVALID_ARGUMENT);
  if not IsHashAlgorithmSupported(HashAlgo) then
    Exit(HX_ERR_INVALID_ALGORITHM);
  if not NormalizeBufferSize(BufferSizeKB, LBufferSizeKB) then
    Exit(HX_ERR_INVALID_ARGUMENT);
  if not TryParseHashHex(HashAlgo, ExpectedHash, LExpectedHash) then
    Exit(HX_ERR_INVALID_HASH);
  if not FileExists(UnicodeString(FileName)) then
    Exit(HX_ERR_FILE_NOT_FOUND);

  Result := StartTask(UnicodeString(FileName), LExpectedHash, True, HashAlgo,
    LBufferSizeKB);
end;

function HX_GetProgress(TaskID: Integer; var State, FileProgress, TotalProgress,
  FilesDone, FilesTotal: Integer; var FileBytesProcessed, FileSize,
  TotalBytesProcessed, TotalBytes: Int64): Integer;
var
  LTask: THXHashTask;
begin
  Result := HX_ERR_TASK_NOT_FOUND;
  State := 0;
  FileProgress := 0;
  TotalProgress := 0;
  FilesDone := 0;
  FilesTotal := 0;
  FileBytesProcessed := 0;
  FileSize := 0;
  TotalBytesProcessed := 0;
  TotalBytes := 0;

  GTaskLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;

    State := LTask.FState;
    FileProgress := LTask.FFileProgress;
    TotalProgress := LTask.FTotalProgress;
    FilesDone := LTask.FFilesDone;
    FilesTotal := 1;
    FileBytesProcessed := LTask.FBytesProcessed;
    FileSize := LTask.FFileSize;
    TotalBytesProcessed := LTask.FBytesProcessed;
    TotalBytes := LTask.FFileSize;
    Result := HX_OK;
  finally
    GTaskLock.Leave;
  end;
end;

function HX_GetCurrentFile(TaskID: Integer): WideString;
var
  LTask: THXHashTask;
begin
  Result := '';
  GTaskLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) then
      Result := WideString(LTask.FFileName);
  finally
    GTaskLock.Leave;
  end;
end;

function HX_GetHashResult(TaskID: Integer): WideString;
var
  LTask: THXHashTask;
begin
  Result := '';
  GTaskLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) then
      Result := WideString(LTask.FHashResult);
  finally
    GTaskLock.Leave;
  end;
end;

function HX_GetVerifyResult(TaskID: Integer): Integer;
var
  LTask: THXHashTask;
begin
  Result := HX_VERIFY_TASK_NOT_FOUND;
  GTaskLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) then
      Result := LTask.FVerifyResult;
  finally
    GTaskLock.Leave;
  end;
end;

function HX_GetErrorCode(TaskID: Integer): Integer;
var
  LTask: THXHashTask;
begin
  Result := HX_ERR_TASK_NOT_FOUND;
  GTaskLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) then
      Result := LTask.FErrorCode;
  finally
    GTaskLock.Leave;
  end;
end;

function HX_GetErrorMessage(TaskID: Integer): WideString;
var
  LTask: THXHashTask;
begin
  Result := '';
  GTaskLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) then
      Result := WideString(LTask.FErrorMessage);
  finally
    GTaskLock.Leave;
  end;
end;

function HX_Pause(TaskID: Integer): Integer;
var
  LTask: THXHashTask;
begin
  Result := HX_ERR_TASK_NOT_FOUND;
  GTaskLock.Enter;
  try
    if GShuttingDown then
      Exit(HX_ERR_SHUTTING_DOWN);

    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;

    if not(LTask.FState in [HX_STATE_QUEUED, HX_STATE_RUNNING]) then
      Exit(HX_ERR_INVALID_STATE);

    LTask.FPaused := True;
    LTask.FState := HX_STATE_PAUSED;
    LTask.FResumeEvent.ResetEvent;
    Result := HX_OK;
  finally
    GTaskLock.Leave;
  end;
end;

function HX_Resume(TaskID: Integer): Integer;
var
  LTask: THXHashTask;
begin
  Result := HX_ERR_TASK_NOT_FOUND;
  GTaskLock.Enter;
  try
    if GShuttingDown then
      Exit(HX_ERR_SHUTTING_DOWN);

    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;

    if LTask.FState <> HX_STATE_PAUSED then
      Exit(HX_ERR_INVALID_STATE);

    LTask.FPaused := False;
    LTask.FState := HX_STATE_RUNNING;
    LTask.FResumeEvent.SetEvent;
    Result := HX_OK;
  finally
    GTaskLock.Leave;
  end;
end;

function HX_Cancel(TaskID: Integer): Integer;
var
  LTask: THXHashTask;
begin
  Result := HX_ERR_TASK_NOT_FOUND;
  GTaskLock.Enter;
  try
    if GShuttingDown then
      Exit(HX_ERR_SHUTTING_DOWN);

    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;

    if IsTerminalState(LTask.FState) then
      Exit(HX_ERR_INVALID_STATE);

    LTask.FCancelRequested := True;
    LTask.FPaused := False;
    LTask.FState := HX_STATE_CANCELING;
    LTask.FResumeEvent.SetEvent;
    Result := HX_OK;
  finally
    GTaskLock.Leave;
  end;
end;

function HX_ReleaseTask(TaskID: Integer): Integer;
var
  LTask: THXHashTask;
begin
  Result := HX_ERR_TASK_NOT_FOUND;

  GTaskLock.Enter;
  try
    if GShuttingDown then
      Exit(HX_ERR_SHUTTING_DOWN);

    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;

    if not IsTerminalState(LTask.FState) then
      Exit(HX_ERR_INVALID_STATE);

    { The final state is written under the task lock immediately before the worker exits. }
    LTask.WaitFor;
    GTasks.Remove(TaskID);
    Result := HX_OK;
  finally
    GTaskLock.Leave;
  end;

  if Result = HX_OK then
    LTask.Free;
end;

procedure HX_Shutdown;
var
  LTasks: TList<THXHashTask>;
  LTask: THXHashTask;
begin
  if not Assigned(GTaskLock) or not Assigned(GTasks) then
    Exit;

  LTasks := TList<THXHashTask>.Create;
  try
    GTaskLock.Enter;
    try
      if GShuttingDown then
        Exit;

      GShuttingDown := True;
      for LTask in GTasks.Values do
      begin
        if not IsTerminalState(LTask.FState) then
        begin
          LTask.FCancelRequested := True;
          LTask.FPaused := False;
          LTask.FState := HX_STATE_CANCELING;
          LTask.FResumeEvent.SetEvent;
        end;
        LTasks.Add(LTask);
      end;
    finally
      GTaskLock.Leave;
    end;

    { Never wait while holding GTaskLock: workers need it to publish completion. }
    for LTask in LTasks do
      LTask.WaitFor;

    GTaskLock.Enter;
    try
      GTasks.Clear;
    finally
      GTaskLock.Leave;
    end;

    for LTask in LTasks do
      LTask.Free;
  finally
    LTasks.Free;
  end;
end;

initialization

GTaskLock := TCriticalSection.Create;
GTasks := TDictionary<Integer, THXHashTask>.Create;
GNextTaskID := 0;
GShuttingDown := False;

finalization

HX_Shutdown;
GTasks.Free;
GTaskLock.Free;

end.
