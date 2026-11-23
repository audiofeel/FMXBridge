unit FMX.Hash.Algorithms;

interface

uses
  HlpIHash,
  HlpHashLibTypes;

const
  HASH_ALGORITHM_BLAKE3_256 = 1;

type
  THashAlgorithmFactory = function: IHash;

  THashAlgorithmInfo = record
    ID: Integer;
    Name: UnicodeString;
    DigestSize: Integer;
    Factory: THashAlgorithmFactory;
  end;

procedure RegisterHashAlgorithm(AID, ADigestSize: Integer;
  const AName: UnicodeString; AFactory: THashAlgorithmFactory);
function TryGetHashAlgorithmInfo(AID: Integer;
  out AInfo: THashAlgorithmInfo): Boolean;
function IsHashAlgorithmSupported(AID: Integer): Boolean;
function GetHashAlgorithmDigestSize(AID: Integer): Integer;
function TryCreateHash(AID: Integer; out AHash: IHash;
  out ADigestSize: Integer): Boolean;
function TryParseHashHex(AID: Integer; const AText: WideString;
  out ABytes: THashLibByteArray): Boolean;
function HashBytesToHex(const ABytes: THashLibByteArray): UnicodeString;
function HashBytesEqual(const ACalculated,
  AExpected: THashLibByteArray): Boolean;

implementation

uses
  System.SysUtils,
  System.Generics.Collections,
  System.SyncObjs,
  HlpHashFactory;

var
  GHashAlgorithms: TDictionary<Integer, THashAlgorithmInfo>;
  GHashAlgorithmLock: TCriticalSection;

function CreateBlake3_256: IHash;
begin
  Result := THashFactory.TCrypto.CreateBlake3_256(nil);
end;

procedure RegisterHashAlgorithm(AID, ADigestSize: Integer;
  const AName: UnicodeString; AFactory: THashAlgorithmFactory);
var
  LInfo: THashAlgorithmInfo;
begin
  if AID <= 0 then
    raise EArgumentException.Create('Hash algorithm ID must be positive');
  if ADigestSize <= 0 then
    raise EArgumentException.Create('Hash digest size must be positive');
  if AName = '' then
    raise EArgumentException.Create('Hash algorithm name is empty');
  if not Assigned(AFactory) then
    raise EArgumentException.Create('Hash algorithm factory is not assigned');

  LInfo.ID := AID;
  LInfo.Name := AName;
  LInfo.DigestSize := ADigestSize;
  LInfo.Factory := AFactory;

  GHashAlgorithmLock.Enter;
  try
    if GHashAlgorithms.ContainsKey(AID) then
      raise EArgumentException.CreateFmt
        ('Hash algorithm ID %d is already registered', [AID]);
    GHashAlgorithms.Add(AID, LInfo);
  finally
    GHashAlgorithmLock.Leave;
  end;
end;

function TryGetHashAlgorithmInfo(AID: Integer;
  out AInfo: THashAlgorithmInfo): Boolean;
begin
  GHashAlgorithmLock.Enter;
  try
    Result := GHashAlgorithms.TryGetValue(AID, AInfo);
  finally
    GHashAlgorithmLock.Leave;
  end;
end;

function IsHashAlgorithmSupported(AID: Integer): Boolean;
var
  LInfo: THashAlgorithmInfo;
begin
  Result := TryGetHashAlgorithmInfo(AID, LInfo);
end;

function GetHashAlgorithmDigestSize(AID: Integer): Integer;
var
  LInfo: THashAlgorithmInfo;
begin
  if TryGetHashAlgorithmInfo(AID, LInfo) then
    Result := LInfo.DigestSize
  else
    Result := 0;
end;

function TryCreateHash(AID: Integer; out AHash: IHash;
  out ADigestSize: Integer): Boolean;
var
  LInfo: THashAlgorithmInfo;
begin
  AHash := nil;
  ADigestSize := 0;
  Result := TryGetHashAlgorithmInfo(AID, LInfo);
  if not Result then
    Exit;

  AHash := LInfo.Factory();
  Result := AHash <> nil;
  if Result then
    ADigestSize := LInfo.DigestSize;
end;

function HexValue(AChar: WideChar): Integer;
begin
  case AChar of
    '0' .. '9':
      Result := Ord(AChar) - Ord('0');
    'a' .. 'f':
      Result := Ord(AChar) - Ord('a') + 10;
    'A' .. 'F':
      Result := Ord(AChar) - Ord('A') + 10;
  else
    Result := -1;
  end;
end;

function TryParseHashHex(AID: Integer; const AText: WideString;
  out ABytes: THashLibByteArray): Boolean;
var
  LInfo: THashAlgorithmInfo;
  I, H, L: Integer;
begin
  Result := False;
  SetLength(ABytes, 0);

  if not TryGetHashAlgorithmInfo(AID, LInfo) then
    Exit;
  if Length(AText) <> LInfo.DigestSize * 2 then
    Exit;

  SetLength(ABytes, LInfo.DigestSize);
  for I := 0 to LInfo.DigestSize - 1 do
  begin
    H := HexValue(AText[(I * 2) + 1]);
    L := HexValue(AText[(I * 2) + 2]);
    if (H < 0) or (L < 0) then
    begin
      SetLength(ABytes, 0);
      Exit;
    end;
    ABytes[I] := Byte((H shl 4) or L);
  end;
  Result := True;
end;

function HashBytesToHex(const ABytes: THashLibByteArray): UnicodeString;
const
  HEX_CHARS: array [0 .. 15] of WideChar = ('0', '1', '2', '3', '4', '5', '6',
    '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f');
var
  I: Integer;
begin
  Result := '';
  if Length(ABytes) = 0 then
    Exit;

  SetLength(Result, Length(ABytes) * 2);
  for I := 0 to Length(ABytes) - 1 do
  begin
    Result[(I * 2) + 1] := HEX_CHARS[ABytes[I] shr 4];
    Result[(I * 2) + 2] := HEX_CHARS[ABytes[I] and $0F];
  end;
end;

function HashBytesEqual(const ACalculated,
  AExpected: THashLibByteArray): Boolean;
var
  I, Difference: Integer;
begin
  if (Length(ACalculated) = 0) or (Length(ACalculated) <> Length(AExpected))
  then
    Exit(False);

  Difference := 0;
  for I := 0 to Length(ACalculated) - 1 do
    Difference := Difference or
      (Integer(ACalculated[I]) xor Integer(AExpected[I]));

  Result := Difference = 0;
end;

initialization

GHashAlgorithmLock := TCriticalSection.Create;
GHashAlgorithms := TDictionary<Integer, THashAlgorithmInfo>.Create;
RegisterHashAlgorithm(HASH_ALGORITHM_BLAKE3_256, 32, 'BLAKE3-256',
  CreateBlake3_256);

finalization

GHashAlgorithms.Free;
GHashAlgorithmLock.Free;

end.
