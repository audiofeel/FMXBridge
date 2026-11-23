
unit FMXBridge.HashProc;

interface

uses
  FMX.Hash.Algorithms;

const
  FHASH_ALGORITHM_BLAKE3_256 = HASH_ALGORITHM_BLAKE3_256;

// =============================================================================
// FHashProc
// =============================================================================
type
  THashProgressCallback = function(FileName: WideString;
    FileSize, FileProgress, TotalProgress: Extended;
    TotalFiles, FileCounted, StatusCode: Integer): Boolean of object;

  FHashProc = interface(IUnknown)
    ['{0EE46238-406F-4EC2-945E-D71EB2FEC559}']
    function SetAlgorithm(Algorithm: Integer): Integer; stdcall;
    function HashFile(FileName: WideString; Callback: THashProgressCallback)
      : Integer; stdcall;
    function VerifyFile(FileName, ExpectedHash: WideString;
      Callback: THashProgressCallback): Integer; stdcall;
    function VerifyManifest(ManifestFile, BaseDirectory: WideString;
      Callback: THashProgressCallback): Integer; stdcall;
    function Pause: Integer; stdcall;
    function Resume: Integer; stdcall;
    function Stop: Integer; stdcall;
    function GetState: Integer; stdcall;
    function GetHashResult: WideString; stdcall;
    function GetVerifyResult: Integer; stdcall;
    function GetSummary(var Matched, Mismatched, Missing, Errors: Integer)
      : Integer; stdcall;
    function GetErrorCode: Integer; stdcall;
    function GetErrorMessage: WideString; stdcall;
    function GetErrorLine: Integer; stdcall;
    function GetCurrentFileErrorMessage: WideString; stdcall;
    procedure Shutdown; stdcall;
  end;

  TFHashProc = class(TInterfacedObject, FHashProc)
  private
    FTaskID: Integer;
    FOperation: Integer;
    FAlgorithm: Integer;
    FCallback: THashProgressCallback;
    FState: Integer;
    FErrorCode: Integer;
    FErrorLine: Integer;
    FErrorMessage: UnicodeString;
    FLastStartErrorCode: Integer;
    FLastStartErrorMessage: UnicodeString;
    FCurrentFileErrorMessage: UnicodeString;
    FHashResult: UnicodeString;
    FVerifyResult: Integer;
    FMatched: Integer;
    FMismatched: Integer;
    FMissing: Integer;
    FErrors: Integer;
    FReportedFiles: Integer;
    FCallbackFailed: Boolean;
    FOperationFailed: Boolean;
    FShuttingDown: Boolean;

    function PrepareOperation(AOperation: Integer;
      ACallback: THashProgressCallback): Integer;
    procedure AbortStart(AErrorCode, AErrorLine: Integer;
      const AErrorMessage: UnicodeString);
    function RunOperation: Integer;
    procedure Poll;
    procedure PollSingle;
    procedure PollManifest;
    procedure FinishOperation;
    procedure ClearActiveOperation;
    procedure CancelTask;
    function InvokeCallback(const AFileName: WideString; AFileSize: Int64;
      AFileProgress, ATotalProgress: Extended;
      ATotalFiles, AFileCounted, AStatusCode: Integer;
      ACanCancel: Boolean): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function SetAlgorithm(Algorithm: Integer): Integer; stdcall;
    function HashFile(FileName: WideString; Callback: THashProgressCallback)
      : Integer; stdcall;
    function VerifyFile(FileName, ExpectedHash: WideString;
      Callback: THashProgressCallback): Integer; stdcall;
    function VerifyManifest(ManifestFile, BaseDirectory: WideString;
      Callback: THashProgressCallback): Integer; stdcall;
    function Pause: Integer; stdcall;
    function Resume: Integer; stdcall;
    function Stop: Integer; stdcall;
    function GetState: Integer; stdcall;
    function GetHashResult: WideString; stdcall;
    function GetVerifyResult: Integer; stdcall;
    function GetSummary(var Matched, Mismatched, Missing, Errors: Integer)
      : Integer; stdcall;
    function GetErrorCode: Integer; stdcall;
    function GetErrorMessage: WideString; stdcall;
    function GetErrorLine: Integer; stdcall;
    function GetCurrentFileErrorMessage: WideString; stdcall;
    procedure Shutdown; stdcall;
  end;

function InitHashProc: FHashProc; stdcall;

implementation

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.SyncObjs,
  FMX.HashEngine, FMX.HashBatch;

const
  HASH_OPERATION_NONE = 0;
  HASH_OPERATION_HASH = 1;
  HASH_OPERATION_VERIFY = 2;
  HASH_OPERATION_MANIFEST = 3;

  HASH_POLL_INTERVAL = 16;
  HASH_DEFAULT_BUFFER_KB = 0;

  FHASH_OK = 0;
  FHASH_ABORTED = 1;
  FHASH_ERR_INVALID_ALGORITHM = -2;
  FHASH_ERR_INVALID_STATE = -6;
  FHASH_ERR_CALLBACK = -100;

  FHASH_STATE_IDLE = 0;
  FHASH_STATE_RUNNING = 1;
  FHASH_STATE_PAUSED = 2;
  FHASH_STATE_CANCELING = 3;
  FHASH_STATE_COMPLETED = 4;
  FHASH_STATE_CANCELED = 5;
  FHASH_STATE_FAILED = 6;

  FHASH_STATUS_PROGRESS = 1;
  FHASH_STATUS_OK = 0;
  FHASH_STATUS_MISMATCH = -2;
  FHASH_STATUS_MISSING = -3;
  FHASH_STATUS_ERROR = -1;

  FHASH_VERIFY_MATCH = 1;
  FHASH_VERIFY_MISMATCH = 0;
  FHASH_VERIFY_PENDING = -2;
  FHASH_VERIFY_NOT_REQUESTED = -1;
  FHASH_VERIFY_CANCELED = -4;
  FHASH_VERIFY_FAILED = -5;

  HASH_FILE_TERMINAL_MIN = HXB_FILE_MATCH;
  HASH_FILE_TERMINAL_MAX = HXB_FILE_CANCELED;

var
  GActiveLock: TCriticalSection;
  GActiveHash: TFHashProc;
  GActiveHashRef: FHashProc;

function HashErrorText(AErrorCode, AOperation: Integer): UnicodeString;
begin
  if AErrorCode = FHASH_ERR_CALLBACK then
    Exit('Progress callback failed');

  if AOperation = HASH_OPERATION_MANIFEST then
  begin
    case AErrorCode of
      HXB_ERR_INVALID_ARGUMENT:
        Result := 'Invalid argument';
      HXB_ERR_INVALID_ALGORITHM:
        Result := 'Unsupported hash algorithm';
      HXB_ERR_INVALID_HASH:
        Result := 'Invalid hash checksum';
      HXB_ERR_TASK_NOT_FOUND:
        Result := 'Hash task not found';
      HXB_ERR_INVALID_STATE:
        Result := 'Invalid hash task state';
      HXB_ERR_SHUTTING_DOWN:
        Result := 'Hash engine is shutting down';
      HXB_ERR_BUSY:
        Result := 'Another hash operation is already running';
      HXB_ERR_OUT_OF_MEMORY:
        Result := 'Not enough memory';
      HXB_ERR_PROCESSING:
        Result := 'Hash processing error';
      HXB_ERR_FILE_NOT_FOUND:
        Result := 'File not found';
      HXB_ERR_FILE_CHANGED:
        Result := 'File changed while it was being verified';
      HXB_ERR_FILE_READ:
        Result := 'Unable to read file';
      HXB_ERR_INVALID_MANIFEST:
        Result := 'Invalid checksum manifest';
      HXB_ERR_MANIFEST_IO:
        Result := 'Unable to read checksum manifest';
    else
      Result := 'Hash operation failed (' + IntToStr(AErrorCode) + ')';
    end;
  end
  else
  begin
    case AErrorCode of
      HX_ERR_INVALID_ARGUMENT:
        Result := 'Invalid argument';
      HX_ERR_INVALID_ALGORITHM:
        Result := 'Unsupported hash algorithm';
      HX_ERR_INVALID_HASH:
        Result := 'Invalid hash checksum';
      HX_ERR_FILE_NOT_FOUND:
        Result := 'File not found';
      HX_ERR_TASK_NOT_FOUND:
        Result := 'Hash task not found';
      HX_ERR_INVALID_STATE:
        Result := 'Invalid hash task state';
      HX_ERR_SHUTTING_DOWN:
        Result := 'Hash engine is shutting down';
      HX_ERR_FILE_CHANGED:
        Result := 'File changed while it was being verified';
      HX_ERR_PROCESSING:
        Result := 'Hash processing error';
      HX_ERR_OUT_OF_MEMORY:
        Result := 'Not enough memory';
      HX_ERR_BUSY:
        Result := 'Another hash operation is already running';
    else
      Result := 'Hash operation failed (' + IntToStr(AErrorCode) + ')';
    end;
  end;
end;

function MapSingleState(AState: Integer): Integer;
begin
  case AState of
    HX_STATE_QUEUED, HX_STATE_RUNNING:
      Result := FHASH_STATE_RUNNING;
    HX_STATE_PAUSED:
      Result := FHASH_STATE_PAUSED;
    HX_STATE_CANCELING:
      Result := FHASH_STATE_CANCELING;
    HX_STATE_COMPLETED:
      Result := FHASH_STATE_COMPLETED;
    HX_STATE_CANCELED:
      Result := FHASH_STATE_CANCELED;
    HX_STATE_FAILED:
      Result := FHASH_STATE_FAILED;
  else
    Result := FHASH_STATE_FAILED;
  end;
end;

function MapBatchState(AState: Integer): Integer;
begin
  case AState of
    HXB_STATE_BUILDING, HXB_STATE_QUEUED, HXB_STATE_RUNNING:
      Result := FHASH_STATE_RUNNING;
    HXB_STATE_PAUSED:
      Result := FHASH_STATE_PAUSED;
    HXB_STATE_CANCELING:
      Result := FHASH_STATE_CANCELING;
    HXB_STATE_COMPLETED:
      Result := FHASH_STATE_COMPLETED;
    HXB_STATE_CANCELED:
      Result := FHASH_STATE_CANCELED;
    HXB_STATE_FAILED:
      Result := FHASH_STATE_FAILED;
  else
    Result := FHASH_STATE_FAILED;
  end;
end;

function FileSizeByName(const AFileName: UnicodeString): Int64;
var
  LSearchRec: TSearchRec;
begin
  Result := 0;
  if FindFirst(AFileName, faAnyFile, LSearchRec) = 0 then
    try
      if (LSearchRec.Attr and faDirectory) = 0 then
        Result := LSearchRec.Size;
    finally
      FindClose(LSearchRec);
    end;
end;

function FileStatusToCallback(AStatus, AErrorCode: Integer): Integer;
begin
  case AStatus of
    HXB_FILE_MATCH:
      Result := FHASH_STATUS_OK;
    HXB_FILE_MISMATCH:
      Result := FHASH_STATUS_MISMATCH;
    HXB_FILE_MISSING:
      Result := FHASH_STATUS_MISSING;
    HXB_FILE_CANCELED:
      Result := FHASH_STATUS_ERROR;
    HXB_FILE_ERROR:
      if AErrorCode <> 0 then
        Result := AErrorCode
      else
        Result := FHASH_STATUS_ERROR;
  else
    Result := FHASH_STATUS_PROGRESS;
  end;
end;

function IsBatchFileTerminal(AStatus: Integer): Boolean;
begin
  Result := (AStatus >= HASH_FILE_TERMINAL_MIN) and
    (AStatus <= HASH_FILE_TERMINAL_MAX);
end;

function CalcProgressPercent(AValue, ATotal: Int64): Extended;
begin
  if ATotal <= 0 then
  begin
    Result := 0.0;
    Exit;
  end;

  if AValue <= 0 then
  begin
    Result := 0.0;
    Exit;
  end;

  if AValue >= ATotal then
  begin
    Result := 99.99;
    Exit;
  end;

  Result := (Extended(AValue) * 100.0) / Extended(ATotal);
end;

// TFHashProc ------------------------------------------------------------------
constructor TFHashProc.Create;
begin
  inherited Create;
  FAlgorithm := FHASH_ALGORITHM_BLAKE3_256;
  FState := FHASH_STATE_IDLE;
  FVerifyResult := FHASH_VERIFY_NOT_REQUESTED;
end;

function TFHashProc.SetAlgorithm(Algorithm: Integer): Integer;
begin
  if FShuttingDown or (FTaskID <> 0) or
    (FState in [FHASH_STATE_RUNNING, FHASH_STATE_PAUSED, FHASH_STATE_CANCELING])
  then
    Exit(FHASH_ERR_INVALID_STATE);

  if not IsHashAlgorithmSupported(Algorithm) then
  begin
    FErrorCode := FHASH_ERR_INVALID_ALGORITHM;
    FErrorMessage := 'Unsupported hash algorithm';
    Exit(FHASH_ERR_INVALID_ALGORITHM);
  end;

  FAlgorithm := Algorithm;
  FErrorCode := 0;
  FErrorMessage := '';
  Result := FHASH_OK;
end;

function TFHashProc.PrepareOperation(AOperation: Integer;
  ACallback: THashProgressCallback): Integer;
begin
  FLastStartErrorCode := 0;
  FLastStartErrorMessage := '';

  if AOperation = HASH_OPERATION_MANIFEST then
    Result := HXB_ERR_BUSY
  else
    Result := HX_ERR_BUSY;

  if FShuttingDown then
  begin
    if AOperation = HASH_OPERATION_MANIFEST then
      FErrorCode := HXB_ERR_SHUTTING_DOWN
    else
      FErrorCode := HX_ERR_SHUTTING_DOWN;
    FErrorMessage := HashErrorText(FErrorCode, AOperation);
    FState := FHASH_STATE_FAILED;
    Result := FErrorCode;
    Exit;
  end;

  if FTaskID <> 0 then
  begin
    FLastStartErrorCode := Result;
    FLastStartErrorMessage := HashErrorText(Result, AOperation);
    Exit;
  end;

  FOperation := AOperation;
  FCallback := ACallback;
  FState := FHASH_STATE_IDLE;
  FErrorCode := 0;
  FErrorLine := 0;
  FErrorMessage := '';
  FCurrentFileErrorMessage := '';
  FHashResult := '';
  if AOperation = HASH_OPERATION_HASH then
    FVerifyResult := FHASH_VERIFY_NOT_REQUESTED
  else
    FVerifyResult := FHASH_VERIFY_PENDING;
  FMatched := 0;
  FMismatched := 0;
  FMissing := 0;
  FErrors := 0;
  FReportedFiles := 0;
  FCallbackFailed := False;
  FOperationFailed := False;

  GActiveLock.Enter;
  try
    if GActiveHash <> nil then
    begin
      if AOperation = HASH_OPERATION_MANIFEST then
        FErrorCode := HXB_ERR_BUSY
      else
        FErrorCode := HX_ERR_BUSY;
      FErrorMessage := HashErrorText(FErrorCode, FOperation);
      FState := FHASH_STATE_FAILED;
      FCallback := nil;
      Result := FErrorCode;
      Exit;
    end;
    GActiveHash := Self;
    GActiveHashRef := Self as FHashProc;
  finally
    GActiveLock.Leave;
  end;

  FState := FHASH_STATE_RUNNING;
  Result := FHASH_OK;
end;

procedure TFHashProc.AbortStart(AErrorCode, AErrorLine: Integer;
  const AErrorMessage: UnicodeString);
begin
  FErrorCode := AErrorCode;
  FErrorLine := AErrorLine;
  if AErrorMessage <> '' then
    FErrorMessage := AErrorMessage
  else
    FErrorMessage := HashErrorText(AErrorCode, FOperation);
  FState := FHASH_STATE_FAILED;

  if FTaskID > 0 then
  begin
    case FOperation of
      HASH_OPERATION_HASH, HASH_OPERATION_VERIFY:
        HX_ReleaseTask(FTaskID);
      HASH_OPERATION_MANIFEST:
        HXB_ReleaseTask(FTaskID);
    end;
  end;

  FTaskID := 0;
  FCallback := nil;
  ClearActiveOperation;
end;

function TFHashProc.HashFile(FileName: WideString;
  Callback: THashProgressCallback): Integer;
begin
  Result := PrepareOperation(HASH_OPERATION_HASH, Callback);
  if Result <> FHASH_OK then
    Exit;

  FTaskID := HX_StartHashFile(FileName, FAlgorithm, HASH_DEFAULT_BUFFER_KB);
  if FTaskID <= 0 then
  begin
    Result := FTaskID;
    AbortStart(Result, 0, HashErrorText(Result, FOperation));
    Exit;
  end;

  Result := RunOperation;
end;

function TFHashProc.VerifyFile(FileName, ExpectedHash: WideString;
  Callback: THashProgressCallback): Integer;
begin
  Result := PrepareOperation(HASH_OPERATION_VERIFY, Callback);
  if Result <> FHASH_OK then
    Exit;

  FTaskID := HX_StartVerifyFile(FileName, ExpectedHash, FAlgorithm,
    HASH_DEFAULT_BUFFER_KB);
  if FTaskID <= 0 then
  begin
    Result := FTaskID;
    AbortStart(Result, 0, HashErrorText(Result, FOperation));
    Exit;
  end;

  Result := RunOperation;
end;

function TFHashProc.VerifyManifest(ManifestFile, BaseDirectory: WideString;
  Callback: THashProgressCallback): Integer;
var
  LErrorLine: Integer;
begin
  Result := PrepareOperation(HASH_OPERATION_MANIFEST, Callback);
  if Result <> FHASH_OK then
    Exit;

  FTaskID := HXB_CreateVerifyBatch(FAlgorithm, HASH_DEFAULT_BUFFER_KB);
  if FTaskID <= 0 then
  begin
    Result := FTaskID;
    AbortStart(Result, 0, HashErrorText(Result, FOperation));
    Exit;
  end;

  LErrorLine := 0;
  Result := HXB_LoadChecksumManifestEx(FTaskID, ManifestFile, BaseDirectory,
    LErrorLine);
  if Result <> HXB_OK then
  begin
    if LErrorLine > 0 then
      AbortStart(Result, LErrorLine, HashErrorText(Result, FOperation) +
        ' at line ' + IntToStr(LErrorLine))
    else
      AbortStart(Result, LErrorLine, HashErrorText(Result, FOperation));
    Exit;
  end;

  Result := HXB_StartVerifyBatch(FTaskID);
  if Result <> HXB_OK then
  begin
    AbortStart(Result, 0, HashErrorText(Result, FOperation));
    Exit;
  end;

  Result := RunOperation;
end;

function TFHashProc.InvokeCallback(const AFileName: WideString; AFileSize: Int64;
  AFileProgress, ATotalProgress: Extended; ATotalFiles, AFileCounted,
  AStatusCode: Integer; ACanCancel: Boolean): Boolean;
begin
  Result := False;
  if not Assigned(FCallback) or FCallbackFailed then
    Exit;

  try
    Result := FCallback(AFileName, Extended(AFileSize), AFileProgress,
      ATotalProgress, ATotalFiles, AFileCounted, AStatusCode);
  except
    on E: Exception do
    begin
      FCallbackFailed := True;
      FErrorCode := FHASH_ERR_CALLBACK;
      FErrorMessage := E.ClassName + ': ' + E.Message;
      FCallback := nil;
      Result := True;
    end;
  end;

  if Result and ACanCancel then
    CancelTask;
end;

procedure TFHashProc.CancelTask;
begin
  FCallback := nil;
  if FTaskID <= 0 then
    Exit;

  case FOperation of
    HASH_OPERATION_HASH, HASH_OPERATION_VERIFY:
      HX_Cancel(FTaskID);
    HASH_OPERATION_MANIFEST:
      HXB_Cancel(FTaskID);
  end;
end;

function PumpHostMessages(ATimeout: Cardinal; out AQuitCode: Integer): Boolean;
var
  LMessage: TMsg;
  LWaitResult: DWORD;
  LWaitHandles: THandle;
begin
  Result := False;
  AQuitCode := 0;
  LWaitHandles := 0;

  LWaitResult := MsgWaitForMultipleObjects(0, LWaitHandles, False, ATimeout,
    QS_ALLINPUT);
  if LWaitResult = WAIT_FAILED then
    RaiseLastOSError;

  while PeekMessage(LMessage, 0, 0, 0, PM_REMOVE) do
  begin
    if LMessage.Message = WM_QUIT then
    begin
      Result := True;
      AQuitCode := Integer(LMessage.WParam);
      Break;
    end;

    TranslateMessage(LMessage);
    DispatchMessage(LMessage);
  end;
end;

function TFHashProc.RunOperation: Integer;
var
  LLastPoll: UInt64;
  LNow: UInt64;
  LQuitCode: Integer;
  LNewQuitCode: Integer;
  LQuitSeen: Boolean;
begin
  LQuitSeen := False;
  LQuitCode := 0;

  Poll;
  LLastPoll := GetTickCount64;

  while FTaskID > 0 do
  begin
    try
      if PumpHostMessages(HASH_POLL_INTERVAL, LNewQuitCode) then
      begin
        if not LQuitSeen then
          LQuitCode := LNewQuitCode;
        LQuitSeen := True;
        Stop;
      end;

      LNow := GetTickCount64;
      if (LNow - LLastPoll) >= HASH_POLL_INTERVAL then
      begin
        Poll;
        LLastPoll := LNow;
      end;
    except
      on E: Exception do
      begin
        if FOperation = HASH_OPERATION_MANIFEST then
          FErrorCode := HXB_ERR_PROCESSING
        else
          FErrorCode := HX_ERR_PROCESSING;
        FErrorMessage := E.ClassName + ': ' + E.Message;
        FOperationFailed := True;
        CancelTask;
      end;
    end;
  end;

  if LQuitSeen then
    PostQuitMessage(LQuitCode);

  if FShuttingDown then
  begin
    HX_Shutdown;
    HXB_Shutdown;
  end;

  if FCallbackFailed or FOperationFailed then
  begin
    if FErrorCode <> 0 then
      Result := FErrorCode
    else if FOperation = HASH_OPERATION_MANIFEST then
      Result := HXB_ERR_PROCESSING
    else
      Result := HX_ERR_PROCESSING;
  end
  else if FState = FHASH_STATE_COMPLETED then
    Result := FHASH_OK
  else if FState = FHASH_STATE_CANCELED then
    Result := FHASH_ABORTED
  else if FState = FHASH_STATE_FAILED then
  begin
    if FErrorCode <> 0 then
      Result := FErrorCode
    else if FOperation = HASH_OPERATION_MANIFEST then
      Result := HXB_ERR_PROCESSING
    else
      Result := HX_ERR_PROCESSING;
  end
  else
    Result := FHASH_OK;
end;

procedure TFHashProc.Poll;
begin
  if FTaskID <= 0 then
    Exit;

  FLastStartErrorCode := 0;
  FLastStartErrorMessage := '';
  try
    case FOperation of
      HASH_OPERATION_HASH, HASH_OPERATION_VERIFY:
        PollSingle;
      HASH_OPERATION_MANIFEST:
        PollManifest;
    end;
  except
    on E: Exception do
    begin
      if FOperation = HASH_OPERATION_MANIFEST then
        FErrorCode := HXB_ERR_PROCESSING
      else
        FErrorCode := HX_ERR_PROCESSING;
      FErrorMessage := E.ClassName + ': ' + E.Message;
      FOperationFailed := True;
      CancelTask;
    end;
  end;
end;

procedure TFHashProc.PollSingle;
var
  LEngineState: Integer;
  LFileProgressInt: Integer;
  LTotalProgressInt: Integer;
  LFileProgress: Extended;
  LTotalProgress: Extended;
  LFilesDone: Integer;
  LFilesTotal: Integer;
  LFileBytesProcessed: Int64;
  LFileSize: Int64;
  LTotalBytesProcessed: Int64;
  LTotalBytes: Int64;
  LCurrentFile: WideString;
  LStatusCode: Integer;
begin
  if HX_GetProgress(FTaskID, LEngineState, LFileProgressInt, LTotalProgressInt,
    LFilesDone, LFilesTotal, LFileBytesProcessed, LFileSize,
    LTotalBytesProcessed, LTotalBytes) <> HX_OK then
  begin
    FErrorCode := HX_ERR_TASK_NOT_FOUND;
    FErrorMessage := HashErrorText(FErrorCode, FOperation);
    FState := FHASH_STATE_FAILED;
    FVerifyResult := FHASH_VERIFY_FAILED;
    FinishOperation;
    Exit;
  end;

  FState := MapSingleState(LEngineState);
  LCurrentFile := HX_GetCurrentFile(FTaskID);

  if LFileSize > 0 then
    LFileProgress := CalcProgressPercent(LFileBytesProcessed, LFileSize)
  else
    LFileProgress := Extended(LFileProgressInt);

  if LTotalBytes > 0 then
    LTotalProgress := CalcProgressPercent(LTotalBytesProcessed, LTotalBytes)
  else
    LTotalProgress := Extended(LTotalProgressInt);

  if not(FState in [FHASH_STATE_COMPLETED, FHASH_STATE_CANCELED,
    FHASH_STATE_FAILED]) then
  begin
    if LCurrentFile <> '' then
      InvokeCallback(LCurrentFile, LFileSize, LFileProgress, LTotalProgress, 1,
        LFilesDone, FHASH_STATUS_PROGRESS, True);
    Exit;
  end;

  FHashResult := HX_GetHashResult(FTaskID);
  FVerifyResult := HX_GetVerifyResult(FTaskID);
  if FErrorCode = 0 then
    FErrorCode := HX_GetErrorCode(FTaskID);
  if (FErrorMessage = '') and (FErrorCode <> 0) then
    FErrorMessage := HX_GetErrorMessage(FTaskID);

  case FState of
    FHASH_STATE_COMPLETED:
      begin
        if FOperation = HASH_OPERATION_VERIFY then
        begin
          if FVerifyResult = HX_VERIFY_MATCH then
            LStatusCode := FHASH_STATUS_OK
          else if FVerifyResult = HX_VERIFY_MISMATCH then
            LStatusCode := FHASH_STATUS_MISMATCH
          else
            LStatusCode := FHASH_STATUS_ERROR;
        end
        else
          LStatusCode := FHASH_STATUS_OK;
        if FOperation = HASH_OPERATION_VERIFY then
        begin
          FMatched := Ord(FVerifyResult = HX_VERIFY_MATCH);
          FMismatched := Ord(FVerifyResult = HX_VERIFY_MISMATCH);
        end
        else
        begin
          FMatched := 0;
          FMismatched := 0;
        end;
        InvokeCallback(LCurrentFile, LFileSize, 100, 100, 1, 1,
          LStatusCode, False);
      end;
    FHASH_STATE_CANCELED:
      begin
        FVerifyResult := FHASH_VERIFY_CANCELED;
        InvokeCallback(LCurrentFile, LFileSize, LFileProgress, LTotalProgress,
          1, LFilesDone, FHASH_STATUS_ERROR, False);
      end;
    FHASH_STATE_FAILED:
      begin
        FVerifyResult := FHASH_VERIFY_FAILED;
        if FErrorCode = 0 then
          FErrorCode := HX_ERR_PROCESSING;
        if FErrorMessage = '' then
          FErrorMessage := HashErrorText(FErrorCode, FOperation);
        LStatusCode := FErrorCode;
        if LStatusCode = 0 then
          LStatusCode := FHASH_STATUS_ERROR;
        InvokeCallback(LCurrentFile, LFileSize, LFileProgress, LTotalProgress,
          1, LFilesDone, LStatusCode, False);
      end;
  end;

  FinishOperation;
end;

procedure TFHashProc.PollManifest;
var
  LEngineState: Integer;
  LSnapshotState: Integer;
  LFileProgressInt: Integer;
  LTotalProgressInt: Integer;
  LFileProgress: Extended;
  LTotalProgress: Extended;
  LCallbackTotal: Extended;
  LFilesDone: Integer;
  LFilesTotal: Integer;
  LFileBytesProcessed: Int64;
  LFileSize: Int64;
  LTotalBytesProcessed: Int64;
  LTotalBytes: Int64;
  LCurrentFile: WideString;
  LFileName: WideString;
  LFileStatus: Integer;
  LFileErrorCode: Integer;
  LCallbackStatus: Integer;
  LFileSize64: Int64;
  LTerminalEnd: Integer;
  LCanComplete: Boolean;
  LFinalProgressSent: Boolean;
  I: Integer;
begin
  if HXB_GetProgress(FTaskID, LEngineState, LFileProgressInt, LTotalProgressInt,
    LFilesDone, LFilesTotal, LFileBytesProcessed, LFileSize,
    LTotalBytesProcessed, LTotalBytes) <> HXB_OK then
  begin
    FErrorCode := HXB_ERR_TASK_NOT_FOUND;
    FErrorMessage := HashErrorText(FErrorCode, FOperation);
    FState := FHASH_STATE_FAILED;
    FVerifyResult := FHASH_VERIFY_FAILED;
    FinishOperation;
    Exit;
  end;
  LSnapshotState := LEngineState;

  LTerminalEnd := FReportedFiles;
  while LTerminalEnd < LFilesTotal do
  begin
    LFileStatus := HXB_GetFileStatus(FTaskID, LTerminalEnd);
    if not IsBatchFileTerminal(LFileStatus) then
      Break;
    Inc(LTerminalEnd);
  end;

  if HXB_GetProgress(FTaskID, LEngineState, LFileProgressInt, LTotalProgressInt,
    LFilesDone, LFilesTotal, LFileBytesProcessed, LFileSize,
    LTotalBytesProcessed, LTotalBytes) <> HXB_OK then
  begin
    FErrorCode := HXB_ERR_TASK_NOT_FOUND;
    FErrorMessage := HashErrorText(FErrorCode, FOperation);
    FState := FHASH_STATE_FAILED;
    FVerifyResult := FHASH_VERIFY_FAILED;
    FinishOperation;
    Exit;
  end;

  FState := MapBatchState(LSnapshotState);
  HXB_GetSummary(FTaskID, FMatched, FMismatched, FMissing, FErrors);
  LCurrentFile := HXB_GetCurrentFile(FTaskID);

  if LFileSize > 0 then
    LFileProgress := CalcProgressPercent(LFileBytesProcessed, LFileSize)
  else
    LFileProgress := Extended(LFileProgressInt);

  if LTotalBytes > 0 then
    LTotalProgress := CalcProgressPercent(LTotalBytesProcessed, LTotalBytes)
  else
    LTotalProgress := Extended(LTotalProgressInt);

  if LTotalProgress > 99.99 then
    LTotalProgress := 99.99;

  LCanComplete := (LEngineState = HXB_STATE_COMPLETED) and
    (LFilesDone = LFilesTotal) and (LTotalProgressInt = 100) and
    (LTerminalEnd = LFilesTotal);

  if (LSnapshotState = HXB_STATE_COMPLETED) and not LCanComplete then
  begin
    FState := FHASH_STATE_FAILED;
    FVerifyResult := FHASH_VERIFY_FAILED;
    FErrorCode := HXB_ERR_PROCESSING;
    FErrorMessage :=
      Format('Completed batch snapshot is inconsistent: files %d/%d, terminal prefix %d/%d, progress %d%%',
      [LFilesDone, LFilesTotal, LTerminalEnd, LFilesTotal, LTotalProgressInt]);
    FCurrentFileErrorMessage := FErrorMessage;
    InvokeCallback('', 0, LFileProgress, LTotalProgress, LFilesTotal,
      FReportedFiles, FErrorCode, False);
    FinishOperation;
    Exit;
  end;

  if LCanComplete then
    FState := FHASH_STATE_COMPLETED;

  LFinalProgressSent := False;

  for I := FReportedFiles to LTerminalEnd - 1 do
  begin
    LFileStatus := HXB_GetFileStatus(FTaskID, I);
    if not IsBatchFileTerminal(LFileStatus) then
      Break;

    LFileName := HXB_GetFileName(FTaskID, I);
    LFileErrorCode := HXB_GetFileErrorCode(FTaskID, I);
    FCurrentFileErrorMessage := HXB_GetFileErrorMessage(FTaskID, I);
    LFileSize64 := FileSizeByName(LFileName);
    LCallbackStatus := FileStatusToCallback(LFileStatus, LFileErrorCode);
    Inc(FReportedFiles);

    if LCanComplete and (FReportedFiles = LFilesTotal) then
    begin
      LCallbackTotal := Extended(LTotalProgressInt);
      LFinalProgressSent := True;
    end
    else
      LCallbackTotal := LTotalProgress;

    if InvokeCallback(LFileName, LFileSize64, 100, LCallbackTotal, LFilesTotal,
      FReportedFiles, LCallbackStatus, True) then
      Exit;
  end;

  if not(FState in [FHASH_STATE_COMPLETED, FHASH_STATE_CANCELED,
    FHASH_STATE_FAILED]) then
  begin
    if (LCurrentFile <> '') and (FReportedFiles < LFilesTotal) and
      (HXB_GetFileStatus(FTaskID, FReportedFiles) = HXB_FILE_HASHING) then
    begin
      if InvokeCallback(LCurrentFile, LFileSize, LFileProgress, LTotalProgress,
        LFilesTotal, FReportedFiles, FHASH_STATUS_PROGRESS, True) then
        Exit;
    end;
    Exit;
  end;

  if FState = FHASH_STATE_COMPLETED then
  begin
    if (FMismatched = 0) and (FMissing = 0) and (FErrors = 0) then
      FVerifyResult := FHASH_VERIFY_MATCH
    else
      FVerifyResult := FHASH_VERIFY_MISMATCH;

    if not LFinalProgressSent then
      InvokeCallback(LCurrentFile, LFileSize, LFileProgress,
        Extended(LTotalProgressInt), LFilesTotal, FReportedFiles,
        FHASH_STATUS_PROGRESS, False);
  end
  else if FState = FHASH_STATE_CANCELED then
    FVerifyResult := FHASH_VERIFY_CANCELED
  else
  begin
    FVerifyResult := FHASH_VERIFY_FAILED;
    FErrorCode := HXB_GetErrorCode(FTaskID);
    FErrorMessage := HXB_GetErrorMessage(FTaskID);
    if FErrorCode = 0 then
      FErrorCode := HXB_ERR_PROCESSING;
    if FErrorMessage = '' then
      FErrorMessage := HashErrorText(FErrorCode, FOperation);
    FCurrentFileErrorMessage := FErrorMessage;

    InvokeCallback('', 0, LFileProgress, LTotalProgress, LFilesTotal,
      FReportedFiles, FErrorCode, False);
  end;

  FinishOperation;
end;

procedure TFHashProc.FinishOperation;
var
  LTaskID: Integer;
begin
  LTaskID := FTaskID;
  FTaskID := 0;

  if LTaskID > 0 then
  begin
    case FOperation of
      HASH_OPERATION_HASH, HASH_OPERATION_VERIFY:
        HX_ReleaseTask(LTaskID);
      HASH_OPERATION_MANIFEST:
        HXB_ReleaseTask(LTaskID);
    end;
  end;

  FCallback := nil;
  ClearActiveOperation;
end;

procedure TFHashProc.ClearActiveOperation;
var
  LOldRef: FHashProc;
begin
  LOldRef := nil;
  GActiveLock.Enter;
  try
    if GActiveHash = Self then
    begin
      GActiveHash := nil;
      LOldRef := GActiveHashRef;
      GActiveHashRef := nil;
    end;
  finally
    GActiveLock.Leave;
  end;
  LOldRef := nil;
end;

function TFHashProc.Pause: Integer;
begin
  if FTaskID <= 0 then
  begin
    if FOperation = HASH_OPERATION_MANIFEST then
      Exit(HXB_ERR_INVALID_STATE)
    else
      Exit(HX_ERR_INVALID_STATE);
  end;

  case FOperation of
    HASH_OPERATION_HASH, HASH_OPERATION_VERIFY:
      Result := HX_Pause(FTaskID);
    HASH_OPERATION_MANIFEST:
      Result := HXB_Pause(FTaskID);
  else
    Result := HX_ERR_INVALID_STATE;
  end;
end;

function TFHashProc.Resume: Integer;
begin
  if FTaskID <= 0 then
  begin
    if FOperation = HASH_OPERATION_MANIFEST then
      Exit(HXB_ERR_INVALID_STATE)
    else
      Exit(HX_ERR_INVALID_STATE);
  end;

  case FOperation of
    HASH_OPERATION_HASH, HASH_OPERATION_VERIFY:
      Result := HX_Resume(FTaskID);
    HASH_OPERATION_MANIFEST:
      Result := HXB_Resume(FTaskID);
  else
    Result := HX_ERR_INVALID_STATE;
  end;
end;

function TFHashProc.Stop: Integer;
begin
  if FTaskID <= 0 then
  begin
    if FOperation = HASH_OPERATION_MANIFEST then
      Exit(HXB_ERR_INVALID_STATE)
    else
      Exit(HX_ERR_INVALID_STATE);
  end;

  FCallback := nil;
  case FOperation of
    HASH_OPERATION_HASH, HASH_OPERATION_VERIFY:
      Result := HX_Cancel(FTaskID);
    HASH_OPERATION_MANIFEST:
      Result := HXB_Cancel(FTaskID);
  else
    Result := HX_ERR_INVALID_STATE;
  end;
end;

function TFHashProc.GetState: Integer;
begin
  Result := FState;
end;

function TFHashProc.GetHashResult: WideString;
begin
  Result := WideString(FHashResult);
end;

function TFHashProc.GetVerifyResult: Integer;
begin
  Result := FVerifyResult;
end;

function TFHashProc.GetSummary(var Matched, Mismatched, Missing,
  Errors: Integer): Integer;
begin
  Matched := FMatched;
  Mismatched := FMismatched;
  Missing := FMissing;
  Errors := FErrors;
  Result := FHASH_OK;
end;

function TFHashProc.GetErrorCode: Integer;
begin
  if FLastStartErrorCode <> 0 then
    Result := FLastStartErrorCode
  else
    Result := FErrorCode;
end;

function TFHashProc.GetErrorMessage: WideString;
begin
  if FLastStartErrorMessage <> '' then
    Result := WideString(FLastStartErrorMessage)
  else
    Result := WideString(FErrorMessage);
end;

function TFHashProc.GetErrorLine: Integer;
begin
  Result := FErrorLine;
end;

function TFHashProc.GetCurrentFileErrorMessage: WideString;
begin
  Result := WideString(FCurrentFileErrorMessage);
end;

procedure TFHashProc.Shutdown;
begin
  if FShuttingDown then
    Exit;
  FShuttingDown := True;

  FCallback := nil;
  if FTaskID > 0 then
    Stop;

  HX_Shutdown;
  HXB_Shutdown;

  FTaskID := 0;
  if FState in [FHASH_STATE_RUNNING, FHASH_STATE_PAUSED, FHASH_STATE_CANCELING]
  then
  begin
    FState := FHASH_STATE_CANCELED;
    FVerifyResult := FHASH_VERIFY_CANCELED;
  end;
  ClearActiveOperation;
end;

destructor TFHashProc.Destroy;
begin
  if FTaskID > 0 then
  begin
    Stop;
    case FOperation of
      HASH_OPERATION_HASH, HASH_OPERATION_VERIFY:
        HX_Shutdown;
      HASH_OPERATION_MANIFEST:
        HXB_Shutdown;
    end;
    FTaskID := 0;
  end;
  ClearActiveOperation;
  inherited;
end;

// =============================================================================
// Exports
// =============================================================================
function InitHashProc: FHashProc;
begin
  Result := TFHashProc.Create;
end;

exports
  InitHashProc;

initialization

GActiveLock := TCriticalSection.Create;

finalization

GActiveLock.Free;

end.
