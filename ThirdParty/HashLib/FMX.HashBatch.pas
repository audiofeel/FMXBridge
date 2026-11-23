unit FMX.HashBatch;

interface

uses
  FMX.Hash.Algorithms;

const
  { Uses the same identifiers as the central hash-algorithm registry. }
  HXB_HASH_BLAKE3_256 = HASH_ALGORITHM_BLAKE3_256;

  { Task states }
  HXB_STATE_BUILDING = 0;
  HXB_STATE_QUEUED = 1;
  HXB_STATE_RUNNING = 2;
  HXB_STATE_PAUSED = 3;
  HXB_STATE_CANCELING = 4;
  HXB_STATE_COMPLETED = 5;
  HXB_STATE_CANCELED = 6;
  HXB_STATE_FAILED = 7;

  { Per-file states }
  HXB_FILE_PENDING = 0;
  HXB_FILE_HASHING = 1;
  HXB_FILE_MATCH = 2;
  HXB_FILE_MISMATCH = 3;
  HXB_FILE_MISSING = 4;
  HXB_FILE_ERROR = 5;
  HXB_FILE_CANCELED = 6;

  { API result codes }
  HXB_OK = 0;
  HXB_ERR_INVALID_ARGUMENT = -1;
  HXB_ERR_INVALID_ALGORITHM = -2;
  HXB_ERR_INVALID_HASH = -3;
  HXB_ERR_TASK_NOT_FOUND = -4;
  HXB_ERR_INVALID_STATE = -5;
  HXB_ERR_SHUTTING_DOWN = -6;
  HXB_ERR_BUSY = -7;
  HXB_ERR_OUT_OF_MEMORY = -8;
  HXB_ERR_PROCESSING = -9;
  HXB_ERR_FILE_NOT_FOUND = -10;
  HXB_ERR_FILE_CHANGED = -11;
  HXB_ERR_FILE_READ = -12;
  HXB_ERR_INVALID_MANIFEST = -13;
  HXB_ERR_MANIFEST_IO = -14;

function HXB_CreateVerifyBatch(HashAlgo, BufferSizeKB: Integer): Integer;
function HXB_AddVerifyFile(TaskID: Integer;
  FileName, ExpectedHash: WideString): Integer;
function HXB_LoadChecksumManifest(TaskID: Integer; ManifestFile: WideString;
  var ErrorLine: Integer): Integer;
function HXB_LoadChecksumManifestEx(TaskID: Integer;
  ManifestFile, BaseDirectory: WideString; var ErrorLine: Integer): Integer;
{ Backward-compatible names for the existing b3sum-compatible manifest format. }
function HXB_LoadB3SumManifest(TaskID: Integer; ManifestFile: WideString;
  var ErrorLine: Integer): Integer;
function HXB_LoadB3SumManifestEx(TaskID: Integer;
  ManifestFile, BaseDirectory: WideString; var ErrorLine: Integer): Integer;
function HXB_StartVerifyBatch(TaskID: Integer): Integer;

function HXB_GetProgress(TaskID: Integer; var State, FileProgress,
  TotalProgress, FilesDone, FilesTotal: Integer;
  var FileBytesProcessed, FileSize, TotalBytesProcessed,
  TotalBytes: Int64): Integer;
function HXB_GetCurrentFile(TaskID: Integer): WideString;
function HXB_GetFileCount(TaskID: Integer): Integer;
function HXB_GetFileStatus(TaskID, FileIndex: Integer): Integer;
function HXB_GetFileName(TaskID, FileIndex: Integer): WideString;
function HXB_GetFileHash(TaskID, FileIndex: Integer): WideString;
function HXB_GetFileErrorCode(TaskID, FileIndex: Integer): Integer;
function HXB_GetFileErrorMessage(TaskID, FileIndex: Integer): WideString;
function HXB_GetSummary(TaskID: Integer; var Matched, Mismatched, Missing,
  Errors: Integer): Integer;
function HXB_GetErrorCode(TaskID: Integer): Integer;
function HXB_GetErrorMessage(TaskID: Integer): WideString;

function HXB_Pause(TaskID: Integer): Integer;
function HXB_Resume(TaskID: Integer): Integer;
function HXB_Cancel(TaskID: Integer): Integer;
function HXB_ReleaseTask(TaskID: Integer): Integer;
procedure HXB_Shutdown;

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
  HXB_DEFAULT_BUFFER_KB = 1024;
  HXB_MIN_BUFFER_KB = 64;
  HXB_MAX_BUFFER_KB = 8192;
  HXB_MAX_FILES = 100000;

type
  THXBFileItem = class
  public
    FileName: UnicodeString;
    ExpectedHash: THashLibByteArray;
    HashResult: UnicodeString;
    Status: Integer;
    FileSize: Int64;
    ErrorCode: Integer;
    ErrorMessage: UnicodeString;
    constructor Create(const AFileName: UnicodeString;
      const AExpectedHash: THashLibByteArray);
  end;

  THXBVerifyTask = class(TThread)
  private
    FItems: TObjectList<THXBFileItem>;
    FBufferSizeKB: Integer;
    FHashAlgorithm: Integer;
    FHashSizeBytes: Integer;
    FResumeEvent: TEvent;
    FStarted: Boolean;
    FState: Integer;
    FCancelRequested: Boolean;
    FPaused: Boolean;
    FCurrentIndex: Integer;
    FFileProgress: Integer;
    FTotalProgress: Integer;
    FFilesDone: Integer;
    FFilesTotal: Integer;
    FFileBytesProcessed: Int64;
    FFileSize: Int64;
    FTotalBytesProcessed: Int64;
    FTotalBytes: Int64;
    FErrorCode: Integer;
    FErrorMessage: UnicodeString;

    function WaitUntilActive: Boolean;
    function IsCancelRequested: Boolean;
    procedure SetTaskState(AState: Integer);
    procedure SetCurrentFile(AIndex: Integer);
    procedure PublishFileProgress(ABytesProcessed: Int64);
    procedure UpdateTotalProgress; { requires GHXBLock }
    procedure CompleteFile(AIndex, AStatus, AErrorCode: Integer;
      const AErrorMessage, AHash: UnicodeString; ABytesProcessed: Int64);
    procedure FinishCanceled;
    procedure FinishFailure(AErrorCode: Integer;
      const AErrorMessage: UnicodeString);
    procedure FinishSuccess;
    procedure ProcessFile(AIndex: Integer);
    procedure PrepareFiles;
  protected
    procedure Execute; override;
  public
    constructor Create(AHashAlgorithm, AHashSizeBytes, ABufferSizeKB: Integer);
    destructor Destroy; override;
  end;

var
  GHXBLock: TCriticalSection;
  GHXBTasks: TDictionary<Integer, THXBVerifyTask>;
  GHXBNextTaskID: Integer;
  GHXBShuttingDown: Boolean;

function FindTaskLocked(ATaskID: Integer): THXBVerifyTask;
begin
  if not GHXBTasks.TryGetValue(ATaskID, Result) then
    Result := nil;
end;

function IsTerminalState(AState: Integer): Boolean;
begin
  Result := AState in [HXB_STATE_COMPLETED, HXB_STATE_CANCELED,
    HXB_STATE_FAILED];
end;

function IsManifestCommentOrBlank(const ALine: UnicodeString): Boolean;
var
  I: Integer;
  LChar: WideChar;
begin
  I := 1;
  while I <= Length(ALine) do
  begin
    LChar := ALine[I];
    if not((LChar = #9) or (LChar = #10) or (LChar = #13) or (LChar = ' ')) then
      Break;
    Inc(I);
  end;

  Result := I > Length(ALine);
  if Result then
    Exit;

  Result := (ALine[I] = ';') or (ALine[I] = '#');
end;

function TryUnescapeManifestFileName(const AText: UnicodeString;
  out AFileName: UnicodeString): Boolean;
var
  I: Integer;
begin
  Result := False;
  AFileName := '';
  I := 1;
  while I <= Length(AText) do
  begin
    if AText[I] = '\' then
    begin
      Inc(I);
      if I > Length(AText) then
        Exit;
      case AText[I] of
        '\':
          AFileName := AFileName + '\';
        'n', 'r':
          Exit; { CR/LF cannot occur in a Windows file name. }
      else
        Exit; { Reject unknown escape sequences instead of guessing. }
      end;
    end
    else
      AFileName := AFileName + AText[I];
    Inc(I);
  end;
  Result := AFileName <> '';
end;

function TryParseChecksumLine(const ALine: UnicodeString;
  AHashSizeBytes: Integer; out AHash, AFileName: UnicodeString): Boolean;
var
  LLine: UnicodeString;
  LIndex: Integer;
  LEscaped: Boolean;
  LHasBinaryMarker: Boolean;
  LDecodedFileName: UnicodeString;
  LHashHexLength: Integer;
begin
  Result := False;
  AHash := '';
  AFileName := '';
  LLine := ALine;
  LEscaped := False;
  LHasBinaryMarker := False;
  LHashHexLength := AHashSizeBytes * 2;
  if LHashHexLength <= 0 then
    Exit;

  { GNU-compatible checksum output prefixes escaped filenames with '\'. }
  if (Length(LLine) > 0) and (LLine[1] = '\') then
  begin
    LEscaped := True;
    Delete(LLine, 1, 1);
  end;

  if Length(LLine) < LHashHexLength + 2 then
    Exit;

  AHash := Copy(LLine, 1, LHashHexLength);

  { Standard output uses two spaces; binary marker uses space + '*'. }
  if LLine[LHashHexLength + 1] = ' ' then
  begin
    if LLine[LHashHexLength + 2] = ' ' then
      LIndex := LHashHexLength + 3
    else
    begin
      LIndex := LHashHexLength + 2;
      LHasBinaryMarker := True;
    end;
  end
  else if LLine[LHashHexLength + 1] = #9 then
    LIndex := LHashHexLength + 2
  else
    Exit;

  if LHasBinaryMarker and (LIndex <= Length(LLine)) and (LLine[LIndex] = '*')
  then
    Inc(LIndex);

  if LIndex > Length(LLine) then
    Exit;

  AFileName := Copy(LLine, LIndex, MaxInt);
  if LEscaped then
  begin
    if not TryUnescapeManifestFileName(AFileName, LDecodedFileName) then
      Exit;
    AFileName := LDecodedFileName;
  end;

  Result := AFileName <> '';
end;

function IsAbsoluteWindowsPath(const APath: UnicodeString): Boolean;
begin
  Result := False;
  if APath = '' then
    Exit;

  { Drive-rooted path, e.g. C:\folder\file. }
  if (Length(APath) >= 3) and (APath[2] = ':') and
    ((APath[3] = '\') or (APath[3] = '/')) then
    Exit(True);

  { UNC and extended-length paths. }
  if (Length(APath) >= 2) and ((APath[1] = '\') or (APath[1] = '/')) and
    ((APath[2] = '\') or (APath[2] = '/')) then
    Exit(True);

  { Root-relative path on the manifest's current drive. }
  if (APath[1] = '\') or (APath[1] = '/') then
    Result := True;
end;

function ResolveManifestFileName(const ABaseDirectory, AFileName: UnicodeString)
  : UnicodeString;
var
  LDrive: UnicodeString;
begin
  if IsAbsoluteWindowsPath(AFileName) then
  begin
    if (Length(AFileName) >= 1) and
      ((AFileName[1] = '\') or (AFileName[1] = '/')) and
      not((Length(AFileName) >= 2) and ((AFileName[2] = '\') or
      (AFileName[2] = '/'))) then
    begin
      LDrive := ExtractFileDrive(ABaseDirectory);
      Result := ExpandFileName(LDrive + AFileName);
    end
    else
      Result := AFileName;
  end
  else
    Result := ExpandFileName(IncludeTrailingPathDelimiter(ABaseDirectory) +
      AFileName);
end;

function NormalizeBufferSize(ABufferSizeKB: Integer;
  out ANormalizedSizeKB: Integer): Boolean;
begin
  if ABufferSizeKB = 0 then
    ANormalizedSizeKB := HXB_DEFAULT_BUFFER_KB
  else
    ANormalizedSizeKB := ABufferSizeKB;
  Result := (ANormalizedSizeKB >= HXB_MIN_BUFFER_KB) and
    (ANormalizedSizeKB <= HXB_MAX_BUFFER_KB);
end;

function GetNextTaskIDLocked: Integer;
begin
  repeat
    Inc(GHXBNextTaskID);
    if GHXBNextTaskID <= 0 then
      GHXBNextTaskID := 1;
  until not GHXBTasks.ContainsKey(GHXBNextTaskID);
  Result := GHXBNextTaskID;
end;

function TryGetFileSize64(const AFileName: UnicodeString;
  out ASize: Int64): Boolean;
var
  LSearchRec: TSearchRec;
begin
  ASize := 0;
  Result := FindFirst(AFileName, faAnyFile, LSearchRec) = 0;
  if not Result then
    Exit;
  try
    Result := (LSearchRec.Attr and faDirectory) = 0;
    if Result then
      ASize := LSearchRec.Size;
  finally
    FindClose(LSearchRec);
  end;
end;

function CalcPercent(AValue, ATotal: Int64): Integer;
begin
  if ATotal <= 0 then
    Exit(0);
  if AValue >= ATotal then
    Exit(100);
  Result := Trunc((AValue / ATotal) * 100.0);
  if Result < 0 then
    Result := 0;
  if Result > 100 then
    Result := 100;
end;

{ THXBFileItem }

constructor THXBFileItem.Create(const AFileName: UnicodeString;
  const AExpectedHash: THashLibByteArray);
begin
  inherited Create;
  FileName := AFileName;
  SetLength(ExpectedHash, Length(AExpectedHash));
  if Length(AExpectedHash) > 0 then
    Move(AExpectedHash[0], ExpectedHash[0], Length(AExpectedHash));
  Status := HXB_FILE_PENDING;
  FileSize := 0;
  ErrorCode := 0;
  ErrorMessage := '';
  HashResult := '';
end;

{ THXBVerifyTask }

constructor THXBVerifyTask.Create(AHashAlgorithm, AHashSizeBytes,
  ABufferSizeKB: Integer);
begin
  inherited Create(True);
  FreeOnTerminate := False;

  { Keep the suspended OS thread harmless if construction later fails. }
  FCancelRequested := True;
  FPaused := False;
  FItems := nil;
  FResumeEvent := nil;

  FItems := TObjectList<THXBFileItem>.Create(True);
  FHashAlgorithm := AHashAlgorithm;
  FHashSizeBytes := AHashSizeBytes;
  FBufferSizeKB := ABufferSizeKB;
  FResumeEvent := TEvent.Create(nil, True, True, '');
  FStarted := False;
  FState := HXB_STATE_BUILDING;
  FCurrentIndex := -1;
  FFileProgress := 0;
  FTotalProgress := 0;
  FFilesDone := 0;
  FFilesTotal := 0;
  FFileBytesProcessed := 0;
  FFileSize := 0;
  FTotalBytesProcessed := 0;
  FTotalBytes := 0;
  FErrorCode := 0;
  FErrorMessage := '';
  FCancelRequested := False;
end;

destructor THXBVerifyTask.Destroy;
begin
  { TThread.Destroy may resume a never-started thread before waiting for it. }
  FCancelRequested := True;
  FPaused := False;
  if Assigned(FResumeEvent) then
    FResumeEvent.SetEvent;

  inherited;

  { The worker has exited before its data and wait objects are released. }
  FResumeEvent.Free;
  FItems.Free;
end;

function THXBVerifyTask.WaitUntilActive: Boolean;
var
  LPaused, LCanceled: Boolean;
begin
  while True do
  begin
    GHXBLock.Enter;
    try
      LCanceled := FCancelRequested;
      LPaused := FPaused;
    finally
      GHXBLock.Leave;
    end;

    if LCanceled then
      Exit(False);
    if not LPaused then
      Exit(True);
    FResumeEvent.WaitFor(INFINITE);
  end;
end;

function THXBVerifyTask.IsCancelRequested: Boolean;
begin
  GHXBLock.Enter;
  try
    Result := FCancelRequested;
  finally
    GHXBLock.Leave;
  end;
end;

procedure THXBVerifyTask.SetTaskState(AState: Integer);
begin
  GHXBLock.Enter;
  try
    if (AState <> HXB_STATE_RUNNING) or (not FPaused and not FCancelRequested)
    then
      FState := AState;
  finally
    GHXBLock.Leave;
  end;
end;

procedure THXBVerifyTask.SetCurrentFile(AIndex: Integer);
begin
  GHXBLock.Enter;
  try
    FCurrentIndex := AIndex;
    FFileProgress := 0;
    FFileBytesProcessed := 0;
    if (AIndex >= 0) and (AIndex < FItems.Count) then
      FFileSize := FItems[AIndex].FileSize
    else
      FFileSize := 0;
  finally
    GHXBLock.Leave;
  end;
end;

procedure THXBVerifyTask.UpdateTotalProgress;
var
  LCurrentFraction: Double;
begin
  LCurrentFraction := 0.0;
  if (FCurrentIndex >= 0) and (FCurrentIndex < FItems.Count) then
    if FItems[FCurrentIndex].Status = HXB_FILE_HASHING then
      LCurrentFraction := FFileProgress / 100.0;
  if FFilesTotal <= 0 then
    FTotalProgress := 0
  else if FFilesDone >= FFilesTotal then
    FTotalProgress := 100
  else if FTotalBytes > 0 then
  begin
    FTotalProgress := CalcPercent(FTotalBytesProcessed, FTotalBytes);
    if FTotalProgress > 99 then
      FTotalProgress := 99;
  end
  else
    FTotalProgress :=
      Trunc(((FFilesDone + LCurrentFraction) / FFilesTotal) * 100.0);
end;

procedure THXBVerifyTask.PublishFileProgress(ABytesProcessed: Int64);
begin
  GHXBLock.Enter;
  try
    FFileBytesProcessed := ABytesProcessed;
    FFileProgress := CalcPercent(ABytesProcessed, FFileSize);
    UpdateTotalProgress;
  finally
    GHXBLock.Leave;
  end;
end;

procedure THXBVerifyTask.CompleteFile(AIndex, AStatus, AErrorCode: Integer;
  const AErrorMessage, AHash: UnicodeString; ABytesProcessed: Int64);
begin
  GHXBLock.Enter;
  try
    if (AIndex >= 0) and (AIndex < FItems.Count) then
    begin
      FItems[AIndex].Status := AStatus;
      FItems[AIndex].ErrorCode := AErrorCode;
      FItems[AIndex].ErrorMessage := AErrorMessage;
      FItems[AIndex].HashResult := AHash;
    end;

    FFileBytesProcessed := ABytesProcessed;
    if AStatus in [HXB_FILE_MATCH, HXB_FILE_MISMATCH] then
      FFileProgress := 100
    else
      FFileProgress := CalcPercent(ABytesProcessed, FItems[AIndex].FileSize);
    Inc(FFilesDone);
    UpdateTotalProgress;
  finally
    GHXBLock.Leave;
  end;
end;

procedure THXBVerifyTask.PrepareFiles;
var
  I: Integer;
  LSize: Int64;
  LTotalBytes: Int64;
  LFinishedCount: Integer;
  LPathExists: Boolean;
begin
  LTotalBytes := 0;
  LFinishedCount := 0;
  for I := 0 to FItems.Count - 1 do
  begin
    if not WaitUntilActive then
      Exit;

    if TryGetFileSize64(FItems[I].FileName, LSize) then
    begin
      if LSize > High(Int64) - LTotalBytes then
      begin
        GHXBLock.Enter;
        try
          FItems[I].FileSize := 0;
          FItems[I].Status := HXB_FILE_ERROR;
          FItems[I].ErrorCode := HXB_ERR_PROCESSING;
          FItems[I].ErrorMessage := 'Total batch size exceeds Int64 range';
        finally
          GHXBLock.Leave;
        end;
        Inc(LFinishedCount);
      end
      else
      begin
        GHXBLock.Enter;
        try
          FItems[I].FileSize := LSize;
          FItems[I].Status := HXB_FILE_PENDING;
          FItems[I].ErrorCode := 0;
          FItems[I].ErrorMessage := '';
        finally
          GHXBLock.Leave;
        end;
        Inc(LTotalBytes, LSize);
      end;
    end
    else
    begin
      LPathExists := FileExists(FItems[I].FileName) or
        DirectoryExists(FItems[I].FileName);
      GHXBLock.Enter;
      try
        FItems[I].FileSize := 0;
        if LPathExists then
        begin
          FItems[I].Status := HXB_FILE_ERROR;
          FItems[I].ErrorCode := HXB_ERR_FILE_READ;
          FItems[I].ErrorMessage :=
            'Path exists but is not a readable regular file';
        end
        else
        begin
          FItems[I].Status := HXB_FILE_MISSING;
          FItems[I].ErrorCode := HXB_ERR_FILE_NOT_FOUND;
          FItems[I].ErrorMessage := 'File not found';
        end;
      finally
        GHXBLock.Leave;
      end;
      Inc(LFinishedCount);
    end;
  end;

  GHXBLock.Enter;
  try
    FFilesTotal := FItems.Count;
    FFilesDone := LFinishedCount;
    FTotalBytes := LTotalBytes;
    FTotalBytesProcessed := 0;
    UpdateTotalProgress;
  finally
    GHXBLock.Leave;
  end;
end;

procedure THXBVerifyTask.ProcessFile(AIndex: Integer);
var
  LItem: THXBFileItem;
  LStream: TFileStream;
  LHash: IHash;
  LHashResult: IHashResult;
  LBuffer: THashLibByteArray;
  LHashBytes: THashLibByteArray;
  LRead: Integer;
  LHashSizeCreated: Integer;
  LProcessed: Int64;
  LHashText: UnicodeString;
  LStatus: Integer;
  LErrorCode: Integer;
  LErrorMessage: UnicodeString;
  LCompleted: Boolean;
  LFileIOStage: Boolean;
begin
  LItem := FItems[AIndex];
  if LItem.Status = HXB_FILE_MISSING then
    Exit;

  if not WaitUntilActive then
    Exit;

  SetCurrentFile(AIndex);
  GHXBLock.Enter;
  try
    LItem.Status := HXB_FILE_HASHING;
  finally
    GHXBLock.Leave;
  end;

  LStream := nil;
  LProcessed := 0;
  LStatus := HXB_FILE_ERROR;
  LErrorCode := HXB_ERR_PROCESSING;
  LErrorMessage := '';
  LHashText := '';
  LCompleted := False;
  LFileIOStage := True;

  try
    try
      LStream := TFileStream.Create(LItem.FileName, fmOpenRead or
        fmShareDenyWrite);

      if LStream.Size <> LItem.FileSize then
      begin
        LErrorCode := HXB_ERR_FILE_CHANGED;
        LErrorMessage := 'File size changed between scan and open';
      end
      else
      begin
        LFileIOStage := False;
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
            Break;

          LFileIOStage := True;
          LRead := LStream.Read(LBuffer[0], Length(LBuffer));
          LFileIOStage := False;
          if LRead = 0 then
            Break;

          LHash.TransformBytes(LBuffer, 0, LRead);
          Inc(LProcessed, LRead);

          GHXBLock.Enter;
          try
            Inc(FTotalBytesProcessed, LRead);
          finally
            GHXBLock.Leave;
          end;
          PublishFileProgress(LProcessed);
        end;

        if not IsCancelRequested then
        begin
          if LProcessed <> LItem.FileSize then
          begin
            LErrorCode := HXB_ERR_FILE_CHANGED;
            LErrorMessage := 'File ended before the scanned size was read';
          end
          else
          begin
            LHashResult := LHash.TransformFinal;
            LHashBytes := LHashResult.GetBytes;
            if Length(LHashBytes) <> FHashSizeBytes then
            begin
              LErrorCode := HXB_ERR_PROCESSING;
              LErrorMessage := 'Hash engine returned an unexpected digest size';
            end
            else
            begin
              LHashText := HashBytesToHex(LHashBytes);
              if HashBytesEqual(LHashBytes, LItem.ExpectedHash) then
                LStatus := HXB_FILE_MATCH
              else
                LStatus := HXB_FILE_MISMATCH;
              LCompleted := True;
            end;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        if E is EOutOfMemory then
          raise;
        if LFileIOStage and not FileExists(LItem.FileName) then
        begin
          LStatus := HXB_FILE_MISSING;
          LErrorCode := HXB_ERR_FILE_NOT_FOUND;
          LErrorMessage := 'File disappeared during verification';
        end
        else if LFileIOStage then
        begin
          LStatus := HXB_FILE_ERROR;
          LErrorCode := HXB_ERR_FILE_READ;
          LErrorMessage := E.ClassName + ': ' + E.Message;
        end
        else
        begin
          LStatus := HXB_FILE_ERROR;
          LErrorCode := HXB_ERR_PROCESSING;
          LErrorMessage := 'Hash engine: ' + E.ClassName + ': ' + E.Message;
        end;
      end;
    end;
  finally
    LStream.Free;
  end;

  if IsCancelRequested then
  begin
    GHXBLock.Enter;
    try
      LItem.Status := HXB_FILE_CANCELED;
    finally
      GHXBLock.Leave;
    end;
    Exit;
  end;

  if not LCompleted and (LStatus = HXB_FILE_ERROR) and (LErrorMessage = '') then
  begin
    { A size mismatch detected before reading is a per-file error. }
    if LErrorMessage = '' then
      LErrorMessage := 'Unable to verify file';
  end;

  if not LCompleted and (LProcessed < LItem.FileSize) then
  begin
    GHXBLock.Enter;
    try
      Dec(FTotalBytes, LItem.FileSize - LProcessed);
      if FTotalBytes < FTotalBytesProcessed then
        FTotalBytes := FTotalBytesProcessed;
    finally
      GHXBLock.Leave;
    end;
  end;

  CompleteFile(AIndex, LStatus, LErrorCode, LErrorMessage, LHashText,
    LProcessed);
end;

procedure THXBVerifyTask.FinishCanceled;
var
  I: Integer;
begin
  GHXBLock.Enter;
  try
    if Assigned(FItems) then
      for I := 0 to FItems.Count - 1 do
        if FItems[I].Status in [HXB_FILE_PENDING, HXB_FILE_HASHING] then
          FItems[I].Status := HXB_FILE_CANCELED;
    FState := HXB_STATE_CANCELED;
    FPaused := False;
    if Assigned(FResumeEvent) then
      FResumeEvent.SetEvent;
  finally
    GHXBLock.Leave;
  end;
end;

procedure THXBVerifyTask.FinishFailure(AErrorCode: Integer;
  const AErrorMessage: UnicodeString);
begin
  GHXBLock.Enter;
  try
    if FCancelRequested then
      FState := HXB_STATE_CANCELED
    else
    begin
      FState := HXB_STATE_FAILED;
      FErrorCode := AErrorCode;
      FErrorMessage := AErrorMessage;
    end;
    FPaused := False;
    FResumeEvent.SetEvent;
  finally
    GHXBLock.Leave;
  end;
end;

procedure THXBVerifyTask.FinishSuccess;
begin
  GHXBLock.Enter;
  try
    if FCancelRequested then
      FState := HXB_STATE_CANCELED
    else if (FFilesTotal = FItems.Count) and (FFilesDone = FFilesTotal) and
      (FTotalProgress = 100) then
      FState := HXB_STATE_COMPLETED
    else
    begin
      { Do not repair inconsistent counters here. A successful completion
        must already have been calculated by PrepareFiles/CompleteFile. }
      FState := HXB_STATE_FAILED;
      FErrorCode := HXB_ERR_PROCESSING;
      FErrorMessage :=
        Format('Batch progress accounting mismatch: files %d/%d, progress %d%%',
        [FFilesDone, FFilesTotal, FTotalProgress]);
    end;
    FPaused := False;
    FResumeEvent.SetEvent;
  finally
    GHXBLock.Leave;
  end;
end;

procedure THXBVerifyTask.Execute;
var
  I: Integer;
begin
  try
    if FCancelRequested then
    begin
      FinishCanceled;
      Exit;
    end;

    SetTaskState(HXB_STATE_RUNNING);
    PrepareFiles;
    if IsCancelRequested then
    begin
      FinishCanceled;
      Exit;
    end;

    for I := 0 to FItems.Count - 1 do
    begin
      if not WaitUntilActive then
        Break;
      if FItems[I].Status = HXB_FILE_PENDING then
        ProcessFile(I);
      if IsCancelRequested then
        Break;
    end;

    if IsCancelRequested then
      FinishCanceled
    else
      FinishSuccess;
  except
    on E: Exception do
    begin
      if E is EOutOfMemory then
        FinishFailure(HXB_ERR_OUT_OF_MEMORY, E.ClassName + ': ' + E.Message)
      else
        FinishFailure(HXB_ERR_PROCESSING, E.ClassName + ': ' + E.Message);
    end;
  end;
end;

function HXB_CreateVerifyBatch(HashAlgo, BufferSizeKB: Integer): Integer;
var
  LBufferSizeKB: Integer;
  LTask: THXBVerifyTask;
  LTaskID: Integer;
  LExistingTask: THXBVerifyTask;
  LHasActiveTask: Boolean;
  LHashInfo: THashAlgorithmInfo;
begin
  Result := HXB_ERR_INVALID_ARGUMENT;
  if not TryGetHashAlgorithmInfo(HashAlgo, LHashInfo) then
  begin
    Result := HXB_ERR_INVALID_ALGORITHM;
    Exit;
  end;
  if not NormalizeBufferSize(BufferSizeKB, LBufferSizeKB) then
    Exit;

  try
    { Construct outside GHXBLock so a failed constructor cannot deadlock the lock. }
    LTask := THXBVerifyTask.Create(HashAlgo, LHashInfo.DigestSize,
      LBufferSizeKB);
  except
    on E: Exception do
    begin
      if E is EOutOfMemory then
        Result := HXB_ERR_OUT_OF_MEMORY
      else
        Result := HXB_ERR_PROCESSING;
      Exit;
    end;
  end;

  Result := HXB_ERR_BUSY;
  GHXBLock.Enter;
  try
    if GHXBShuttingDown then
      Result := HXB_ERR_SHUTTING_DOWN
    else
    begin
      LHasActiveTask := False;
      for LExistingTask in GHXBTasks.Values do
        if not IsTerminalState(LExistingTask.FState) then
        begin
          LHasActiveTask := True;
          Break;
        end;

      if not LHasActiveTask then
      begin
        try
          LTaskID := GetNextTaskIDLocked;
          GHXBTasks.Add(LTaskID, LTask);
          LTask := nil; { ownership transferred to the dictionary }
          Result := LTaskID;
        except
          on E: Exception do
          begin
            if E is EOutOfMemory then
              Result := HXB_ERR_OUT_OF_MEMORY
            else
              Result := HXB_ERR_PROCESSING;
          end;
        end;
      end;
    end;
  finally
    GHXBLock.Leave;
  end;

  { Free rejected/unregistered tasks only after releasing GHXBLock. }
  LTask.Free;
end;

function HXB_AddVerifyFile(TaskID: Integer;
  FileName, ExpectedHash: WideString): Integer;
var
  LTask: THXBVerifyTask;
  LExpectedBytes: THashLibByteArray;
  LItem: THXBFileItem;
begin
  LItem := nil;
  Result := HXB_ERR_INVALID_ARGUMENT;
  if (FileName = '') or (ExpectedHash = '') then
    Exit;

  GHXBLock.Enter;
  try
    if GHXBShuttingDown then
    begin
      Result := HXB_ERR_SHUTTING_DOWN;
      Exit;
    end;
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
    begin
      Result := HXB_ERR_TASK_NOT_FOUND;
      Exit;
    end;
    if LTask.FState <> HXB_STATE_BUILDING then
    begin
      Result := HXB_ERR_INVALID_STATE;
      Exit;
    end;
    if LTask.FItems.Count >= HXB_MAX_FILES then
    begin
      Result := HXB_ERR_INVALID_ARGUMENT;
      Exit;
    end;
    try
      if not TryParseHashHex(LTask.FHashAlgorithm, ExpectedHash, LExpectedBytes)
      then
      begin
        Result := HXB_ERR_INVALID_HASH;
        Exit;
      end;

      LItem := THXBFileItem.Create(UnicodeString(FileName), LExpectedBytes);
      LTask.FItems.Add(LItem);
      LItem := nil; { ownership transferred to the task's TObjectList }
      Result := HXB_OK;
    except
      on E: Exception do
      begin
        if Assigned(LItem) then
          LItem.Free;
        if E is EOutOfMemory then
          Result := HXB_ERR_OUT_OF_MEMORY
        else
          Result := HXB_ERR_PROCESSING;
      end;
    end;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_LoadChecksumManifest(TaskID: Integer; ManifestFile: WideString;
  var ErrorLine: Integer): Integer;
begin
  Result := HXB_LoadChecksumManifestEx(TaskID, ManifestFile, '', ErrorLine);
end;

function HXB_LoadChecksumManifestEx(TaskID: Integer;
  ManifestFile, BaseDirectory: WideString; var ErrorLine: Integer): Integer;
var
  LTask: THXBVerifyTask;
  LLines: TStringList;
  LParsedItems: TList<THXBFileItem>;
  LHash: UnicodeString;
  LFileName: UnicodeString;
  LManifestFullPath: UnicodeString;
  LBaseDirectory: UnicodeString;
  LExpectedBytes: THashLibByteArray;
  LItem: THXBFileItem;
  I: Integer;
  LOriginalCount: Integer;
  LHashAlgorithm: Integer;
  LHashSizeBytes: Integer;
begin
  ErrorLine := 0;
  Result := HXB_ERR_INVALID_ARGUMENT;
  if ManifestFile = '' then
    Exit;

  { The task fixes the algorithm for the whole manifest operation. Copy its
    immutable algorithm metadata while holding the task lock. }
  GHXBLock.Enter;
  try
    if GHXBShuttingDown then
    begin
      Result := HXB_ERR_SHUTTING_DOWN;
      Exit;
    end;
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
    begin
      Result := HXB_ERR_TASK_NOT_FOUND;
      Exit;
    end;
    if LTask.FState <> HXB_STATE_BUILDING then
    begin
      Result := HXB_ERR_INVALID_STATE;
      Exit;
    end;
    LHashAlgorithm := LTask.FHashAlgorithm;
    LHashSizeBytes := LTask.FHashSizeBytes;
  finally
    GHXBLock.Leave;
  end;

  LLines := nil;
  LParsedItems := nil;
  try
    try
      LLines := TStringList.Create;
      LParsedItems := TList<THXBFileItem>.Create;

      try
        LManifestFullPath := ExpandFileName(UnicodeString(ManifestFile));
        if not FileExists(LManifestFullPath) then
        begin
          Result := HXB_ERR_MANIFEST_IO;
          Exit;
        end;
        { Checksum manifests are read as UTF-8; an optional UTF-8 BOM is accepted. }
        LLines.LoadFromFile(LManifestFullPath, TEncoding.UTF8);
        if BaseDirectory <> '' then
          LBaseDirectory := IncludeTrailingPathDelimiter
            (ExpandFileName(UnicodeString(BaseDirectory)))
        else
          LBaseDirectory := ExtractFilePath(LManifestFullPath);
      except
        on E: EOutOfMemory do
        begin
          Result := HXB_ERR_OUT_OF_MEMORY;
          Exit;
        end;
        on E: Exception do
        begin
          Result := HXB_ERR_MANIFEST_IO;
          Exit;
        end;
      end;

      for I := 0 to LLines.Count - 1 do
      begin
        if IsManifestCommentOrBlank(LLines[I]) then
          Continue;

        if not TryParseChecksumLine(LLines[I], LHashSizeBytes, LHash, LFileName)
        then
        begin
          ErrorLine := I + 1;
          Result := HXB_ERR_INVALID_MANIFEST;
          Exit;
        end;

        if not TryParseHashHex(LHashAlgorithm, LHash, LExpectedBytes) then
        begin
          ErrorLine := I + 1;
          Result := HXB_ERR_INVALID_MANIFEST;
          Exit;
        end;

        if LParsedItems.Count >= HXB_MAX_FILES then
        begin
          ErrorLine := I + 1;
          Result := HXB_ERR_INVALID_ARGUMENT;
          Exit;
        end;

        LFileName := ResolveManifestFileName(LBaseDirectory, LFileName);
        LItem := THXBFileItem.Create(LFileName, LExpectedBytes);
        try
          LParsedItems.Add(LItem);
          LItem := nil;
        finally
          LItem.Free;
        end;
      end;

      if LParsedItems.Count = 0 then
      begin
        Result := HXB_ERR_INVALID_MANIFEST;
        Exit;
      end;

      GHXBLock.Enter;
      try
        if GHXBShuttingDown then
        begin
          Result := HXB_ERR_SHUTTING_DOWN;
          Exit;
        end;

        LTask := FindTaskLocked(TaskID);
        if not Assigned(LTask) then
        begin
          Result := HXB_ERR_TASK_NOT_FOUND;
          Exit;
        end;
        if LTask.FState <> HXB_STATE_BUILDING then
        begin
          Result := HXB_ERR_INVALID_STATE;
          Exit;
        end;
        if LTask.FItems.Count + LParsedItems.Count > HXB_MAX_FILES then
        begin
          Result := HXB_ERR_INVALID_ARGUMENT;
          Exit;
        end;

        LOriginalCount := LTask.FItems.Count;
        try
          { Reserve capacity first, then commit all entries under the task lock. }
          LTask.FItems.Capacity := LOriginalCount + LParsedItems.Count;
          for I := 0 to LParsedItems.Count - 1 do
          begin
            LTask.FItems.Add(LParsedItems[I]);
            LParsedItems[I] := nil;
          end;
          LTask.FFilesTotal := LTask.FItems.Count;
          Result := HXB_OK;
        except
          { Roll back if an unexpected exception interrupts the commit. }
          while LTask.FItems.Count > LOriginalCount do
            LTask.FItems.Delete(LTask.FItems.Count - 1);
          raise;
        end;
      finally
        GHXBLock.Leave;
      end;
    except
      on E: EOutOfMemory do
        Result := HXB_ERR_OUT_OF_MEMORY;
      on E: Exception do
        Result := HXB_ERR_PROCESSING;
    end;
  finally
    if Assigned(LParsedItems) then
    begin
      for I := 0 to LParsedItems.Count - 1 do
        LParsedItems[I].Free;
      LParsedItems.Free;
    end;
    LLines.Free;
  end;
end;

function HXB_LoadB3SumManifest(TaskID: Integer; ManifestFile: WideString;
  var ErrorLine: Integer): Integer;
begin
  Result := HXB_LoadChecksumManifest(TaskID, ManifestFile, ErrorLine);
end;

function HXB_LoadB3SumManifestEx(TaskID: Integer;
  ManifestFile, BaseDirectory: WideString; var ErrorLine: Integer): Integer;
begin
  Result := HXB_LoadChecksumManifestEx(TaskID, ManifestFile, BaseDirectory,
    ErrorLine);
end;

function HXB_StartVerifyBatch(TaskID: Integer): Integer;
var
  LTask: THXBVerifyTask;
begin
  Result := HXB_ERR_TASK_NOT_FOUND;
  GHXBLock.Enter;
  try
    if GHXBShuttingDown then
    begin
      Result := HXB_ERR_SHUTTING_DOWN;
      Exit;
    end;
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;
    if LTask.FState <> HXB_STATE_BUILDING then
    begin
      Result := HXB_ERR_INVALID_STATE;
      Exit;
    end;
    if LTask.FItems.Count = 0 then
    begin
      Result := HXB_ERR_INVALID_ARGUMENT;
      Exit;
    end;

    try
      LTask.FStarted := True;
      LTask.FState := HXB_STATE_QUEUED;
      LTask.Start;
      Result := HXB_OK;
    except
      on E: Exception do
      begin
        LTask.FStarted := False;
        LTask.FState := HXB_STATE_FAILED;
        LTask.FErrorCode := HXB_ERR_PROCESSING;
        LTask.FErrorMessage := E.ClassName + ': ' + E.Message;
        Result := HXB_ERR_PROCESSING;
      end;
    end;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetProgress(TaskID: Integer; var State, FileProgress,
  TotalProgress, FilesDone, FilesTotal: Integer;
  var FileBytesProcessed, FileSize, TotalBytesProcessed,
  TotalBytes: Int64): Integer;
var
  LTask: THXBVerifyTask;
begin
  Result := HXB_ERR_TASK_NOT_FOUND;
  State := 0;
  FileProgress := 0;
  TotalProgress := 0;
  FilesDone := 0;
  FilesTotal := 0;
  FileBytesProcessed := 0;
  FileSize := 0;
  TotalBytesProcessed := 0;
  TotalBytes := 0;

  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;
    State := LTask.FState;
    FileProgress := LTask.FFileProgress;
    TotalProgress := LTask.FTotalProgress;
    FilesDone := LTask.FFilesDone;
    FilesTotal := LTask.FItems.Count;
    FileBytesProcessed := LTask.FFileBytesProcessed;
    FileSize := LTask.FFileSize;
    TotalBytesProcessed := LTask.FTotalBytesProcessed;
    TotalBytes := LTask.FTotalBytes;
    Result := HXB_OK;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetCurrentFile(TaskID: Integer): WideString;
var
  LTask: THXBVerifyTask;
begin
  Result := '';
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) and (LTask.FCurrentIndex >= 0) and
      (LTask.FCurrentIndex < LTask.FItems.Count) then
      Result := LTask.FItems[LTask.FCurrentIndex].FileName;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetFileCount(TaskID: Integer): Integer;
var
  LTask: THXBVerifyTask;
begin
  Result := HXB_ERR_TASK_NOT_FOUND;
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) then
      Result := LTask.FItems.Count;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetFileStatus(TaskID, FileIndex: Integer): Integer;
var
  LTask: THXBVerifyTask;
begin
  Result := HXB_FILE_ERROR;
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) and (FileIndex >= 0) and (FileIndex < LTask.FItems.Count)
    then
      Result := LTask.FItems[FileIndex].Status;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetFileName(TaskID, FileIndex: Integer): WideString;
var
  LTask: THXBVerifyTask;
begin
  Result := '';
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) and (FileIndex >= 0) and (FileIndex < LTask.FItems.Count)
    then
      Result := LTask.FItems[FileIndex].FileName;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetFileHash(TaskID, FileIndex: Integer): WideString;
var
  LTask: THXBVerifyTask;
begin
  Result := '';
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) and (FileIndex >= 0) and (FileIndex < LTask.FItems.Count)
    then
      Result := LTask.FItems[FileIndex].HashResult;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetFileErrorCode(TaskID, FileIndex: Integer): Integer;
var
  LTask: THXBVerifyTask;
begin
  Result := HXB_ERR_TASK_NOT_FOUND;
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;
    if (FileIndex < 0) or (FileIndex >= LTask.FItems.Count) then
      Exit(HXB_ERR_INVALID_ARGUMENT);
    Result := LTask.FItems[FileIndex].ErrorCode;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetFileErrorMessage(TaskID, FileIndex: Integer): WideString;
var
  LTask: THXBVerifyTask;
begin
  Result := '';
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) and (FileIndex >= 0) and (FileIndex < LTask.FItems.Count)
    then
      Result := LTask.FItems[FileIndex].ErrorMessage;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetSummary(TaskID: Integer; var Matched, Mismatched, Missing,
  Errors: Integer): Integer;
var
  LTask: THXBVerifyTask;
  I: Integer;
begin
  Result := HXB_ERR_TASK_NOT_FOUND;
  Matched := 0;
  Mismatched := 0;
  Missing := 0;
  Errors := 0;
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;
    for I := 0 to LTask.FItems.Count - 1 do
      case LTask.FItems[I].Status of
        HXB_FILE_MATCH:
          Inc(Matched);
        HXB_FILE_MISMATCH:
          Inc(Mismatched);
        HXB_FILE_MISSING:
          Inc(Missing);
        HXB_FILE_ERROR:
          Inc(Errors);
      end;
    Result := HXB_OK;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetErrorCode(TaskID: Integer): Integer;
var
  LTask: THXBVerifyTask;
begin
  Result := HXB_ERR_TASK_NOT_FOUND;
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) then
      Result := LTask.FErrorCode;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_GetErrorMessage(TaskID: Integer): WideString;
var
  LTask: THXBVerifyTask;
begin
  Result := '';
  GHXBLock.Enter;
  try
    LTask := FindTaskLocked(TaskID);
    if Assigned(LTask) then
      Result := LTask.FErrorMessage;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_Pause(TaskID: Integer): Integer;
var
  LTask: THXBVerifyTask;
begin
  Result := HXB_ERR_TASK_NOT_FOUND;
  GHXBLock.Enter;
  try
    if GHXBShuttingDown then
    begin
      Result := HXB_ERR_SHUTTING_DOWN;
      Exit;
    end;
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;
    if not LTask.FStarted or
      not(LTask.FState in [HXB_STATE_QUEUED, HXB_STATE_RUNNING]) then
    begin
      Result := HXB_ERR_INVALID_STATE;
      Exit;
    end;
    LTask.FPaused := True;
    LTask.FState := HXB_STATE_PAUSED;
    LTask.FResumeEvent.ResetEvent;
    Result := HXB_OK;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_Resume(TaskID: Integer): Integer;
var
  LTask: THXBVerifyTask;
begin
  Result := HXB_ERR_TASK_NOT_FOUND;
  GHXBLock.Enter;
  try
    if GHXBShuttingDown then
    begin
      Result := HXB_ERR_SHUTTING_DOWN;
      Exit;
    end;
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;
    if LTask.FState <> HXB_STATE_PAUSED then
    begin
      Result := HXB_ERR_INVALID_STATE;
      Exit;
    end;
    LTask.FPaused := False;
    LTask.FState := HXB_STATE_RUNNING;
    LTask.FResumeEvent.SetEvent;
    Result := HXB_OK;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_Cancel(TaskID: Integer): Integer;
var
  LTask: THXBVerifyTask;
begin
  Result := HXB_ERR_TASK_NOT_FOUND;
  GHXBLock.Enter;
  try
    if GHXBShuttingDown then
    begin
      Result := HXB_ERR_SHUTTING_DOWN;
      Exit;
    end;
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;
    if IsTerminalState(LTask.FState) then
    begin
      Result := HXB_ERR_INVALID_STATE;
      Exit;
    end;

    if not LTask.FStarted then
    begin
      LTask.FCancelRequested := True;
      LTask.FPaused := False;
      LTask.FState := HXB_STATE_CANCELED;
      LTask.FResumeEvent.SetEvent;
      Result := HXB_OK;
      Exit;
    end;

    LTask.FCancelRequested := True;
    LTask.FPaused := False;
    LTask.FState := HXB_STATE_CANCELING;
    LTask.FResumeEvent.SetEvent;
    Result := HXB_OK;
  finally
    GHXBLock.Leave;
  end;
end;

function HXB_ReleaseTask(TaskID: Integer): Integer;
var
  LTask: THXBVerifyTask;
  LWaitForThread: Boolean;
begin
  LWaitForThread := False;
  Result := HXB_ERR_TASK_NOT_FOUND;

  GHXBLock.Enter;
  try
    if GHXBShuttingDown then
    begin
      Result := HXB_ERR_SHUTTING_DOWN;
      Exit;
    end;
    LTask := FindTaskLocked(TaskID);
    if not Assigned(LTask) then
      Exit;

    if LTask.FStarted then
    begin
      if not IsTerminalState(LTask.FState) then
      begin
        Result := HXB_ERR_INVALID_STATE;
        Exit;
      end;
      LWaitForThread := True;
    end
    else if not IsTerminalState(LTask.FState) and
      (LTask.FState <> HXB_STATE_BUILDING) then
    begin
      Result := HXB_ERR_INVALID_STATE;
      Exit;
    end;

    GHXBTasks.Remove(TaskID);
    Result := HXB_OK;
  finally
    GHXBLock.Leave;
  end;

  if Result = HXB_OK then
  begin
    if LWaitForThread then
      LTask.WaitFor;
    LTask.Free;
  end;
end;

procedure HXB_Shutdown;
var
  LTasks: TList<THXBVerifyTask>;
  LTask: THXBVerifyTask;
begin
  if not Assigned(GHXBLock) or not Assigned(GHXBTasks) then
    Exit;

  LTasks := TList<THXBVerifyTask>.Create;
  try
    GHXBLock.Enter;
    try
      if GHXBShuttingDown then
        Exit;
      GHXBShuttingDown := True;
      for LTask in GHXBTasks.Values do
      begin
        if LTask.FStarted and not IsTerminalState(LTask.FState) then
        begin
          LTask.FCancelRequested := True;
          LTask.FPaused := False;
          LTask.FState := HXB_STATE_CANCELING;
          LTask.FResumeEvent.SetEvent;
        end;
        LTasks.Add(LTask);
      end;
    finally
      GHXBLock.Leave;
    end;

    for LTask in LTasks do
      if LTask.FStarted then
        LTask.WaitFor;

    GHXBLock.Enter;
    try
      GHXBTasks.Clear;
    finally
      GHXBLock.Leave;
    end;
    for LTask in LTasks do
      LTask.Free;
  finally
    LTasks.Free;
  end;
end;

initialization

GHXBLock := TCriticalSection.Create;
GHXBTasks := TDictionary<Integer, THXBVerifyTask>.Create;
GHXBNextTaskID := 0;
GHXBShuttingDown := False;

finalization

HXB_Shutdown;
GHXBTasks.Free;
GHXBLock.Free;

end.
