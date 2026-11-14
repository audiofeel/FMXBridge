unit FMXBridge.Toast;

interface

uses
  System.Classes,
  FMX.Win.NotificationManager;

// =============================================================================
// FToast
// =============================================================================
type
  FToast = interface(IUnknown)
    ['{73CFA424-DFEC-44AD-AFC5-B5EB4F239057}']
    procedure SetAppInfo(const AppID, AppName, IconFile: WideString); stdcall;
    procedure Show(const Title, MessageText: WideString); stdcall;
    procedure ShowImage(const Title, MessageText,
      ImageFile: WideString); stdcall;
    procedure ShowLogo(const Title, MessageText,
      ImageFile: WideString); stdcall;
  end;

  TFToast = class(TInterfacedObject, FToast)
  private
    FManager: TNotificationManager;
    FAppUserModelID: string;

    procedure CheckInitialized;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetAppInfo(const AppID, AppName, IconFile: WideString); stdcall;
    procedure Show(const Title, MessageText: WideString); stdcall;
    procedure ShowImage(const Title, MessageText,
      ImageFile: WideString); stdcall;
    procedure ShowLogo(const Title, MessageText,
      ImageFile: WideString); stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitToastHandle: FToast; stdcall;

implementation

uses
  System.SysUtils,
  System.Hash,
  Winapi.Windows;

function UrlCreateFromPathW(pszPath: PWideChar; pszUrl: PWideChar;
  var pcchUrl: Cardinal; dwFlags: Cardinal): LongInt; stdcall;
  external 'shlwapi.dll' name 'UrlCreateFromPathW';

const
  CToastAppIDPrefix = 'audiofeel.FMXBridge.Toast.';
  CToastCacheDirectory = 'FMXBridge\Toast';

function ToastAppIDHash(const AppID: string): string;
var
  Value: string;
begin
  Value := Trim(AppID);

  if Value = '' then
    raise Exception.Create('Toast AppID cannot be empty.');

  Result := THashSHA2.GetHashString(Value);
end;

function BuildToastAppUserModelID(const AppID: string): string;
begin
  Result := CToastAppIDPrefix + ToastAppIDHash(AppID);
end;

function PrepareToastIcon(const AppID, IconFile: string): string;
var
  SourcePath: string;
  LocalAppData: string;
  CacheDirectory: string;
  Extension: string;
begin
  Result := '';

  if IconFile = '' then
    Exit;

  SourcePath := ExpandFileName(IconFile);

  if not FileExists(SourcePath) then
    raise Exception.CreateFmt('Toast icon file not found: %s', [SourcePath]);

  Extension := LowerCase(ExtractFileExt(SourcePath));

  if not((Extension = '.png') or (Extension = '.ico') or (Extension = '.bmp') or
    (Extension = '.jpg')) then
    raise Exception.CreateFmt('Unsupported Toast icon format: %s', [Extension]);

  LocalAppData := GetEnvironmentVariable('LOCALAPPDATA');

  if LocalAppData = '' then
    raise Exception.Create('LOCALAPPDATA is not available.');

  CacheDirectory := IncludeTrailingPathDelimiter(LocalAppData) +
    CToastCacheDirectory;

  if not ForceDirectories(CacheDirectory) then
    raise Exception.CreateFmt('Cannot create Toast cache directory: %s',
      [CacheDirectory]);

  Result := IncludeTrailingPathDelimiter(CacheDirectory) + ToastAppIDHash(AppID)
    + Extension;

  if SameText(SourcePath, Result) then
    Exit;

  if not Winapi.Windows.CopyFile(PWideChar(SourcePath), PWideChar(Result), False)
  then
    RaiseLastOSError;
end;

function ImageFileToUri(const FileName: string): string;
const
  CUrlBufferSize = 2084;
var
  FullPath: string;
  UrlBuffer: array [0 .. CUrlBufferSize - 1] of WideChar;
  UrlLength: Cardinal;
  HR: LongInt;
begin
  FullPath := ExpandFileName(FileName);

  if not FileExists(FullPath) then
    raise Exception.CreateFmt('Toast image file not found: %s', [FullPath]);

  UrlLength := CUrlBufferSize;

  HR := UrlCreateFromPathW(PWideChar(FullPath), @UrlBuffer[0], UrlLength, 0);

  if HR < 0 then
    raise Exception.CreateFmt
      ('Cannot convert image path to URI. HRESULT: 0x%.8x', [Cardinal(HR)]);

  Result := string(PWideChar(@UrlBuffer[0]));
end;

function EscapeXmlText(const Value: string): string;
begin
  Result := StringReplace(Value, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
end;

constructor TFToast.Create;
begin
  inherited Create;

  FManager := nil;
  FAppUserModelID := '';
end;

destructor TFToast.Destroy;
begin
  FreeAndNil(FManager);

  inherited Destroy;
end;

procedure TFToast.CheckInitialized;
begin
  if not Assigned(FManager) then
    raise ENotificationNotInited.Create
      ('Call SetAppInfo before sending Toast notifications.');
end;

// =============================================================================
// FToast
// =============================================================================
procedure TFToast.SetAppInfo(const AppID, AppName, IconFile: WideString);
var
  NewAppUserModelID: string;
  IconPath: string;
  NewManager: TNotificationManager;
begin
  NewAppUserModelID := BuildToastAppUserModelID(string(AppID));

  IconPath := PrepareToastIcon(string(AppID), string(IconFile));

  if (FManager = nil) or (FAppUserModelID <> NewAppUserModelID) then
  begin
    NewManager := TNotificationManager.Create(nil, NewAppUserModelID);

    FreeAndNil(FManager);

    FManager := NewManager;
    FAppUserModelID := NewAppUserModelID;
  end;

  FManager.ApplicationName := string(AppName);
  FManager.ApplicationIcon := IconPath;
end;

procedure TFToast.Show(const Title, MessageText: WideString);
var
  Builder: TToastContentBuilder;
  Notification: TNotification;
begin
  CheckInitialized;

  Builder := TToastContentBuilder.Create;
  try
    Builder.AddText(TToastText.Create.Text(EscapeXmlText(string(Title))));

    Builder.AddText(TToastText.Create.Text(EscapeXmlText(string(MessageText))));
  except
    Builder.Free;
    raise;
  end;

  Notification := TNotification.Create(nil, Builder);
  try
    FManager.ShowNotification(Notification);
  finally
    Notification.Free;
  end;
end;

procedure TFToast.ShowImage(const Title, MessageText, ImageFile: WideString);
var
  Builder: TToastContentBuilder;
  Notification: TNotification;
  ImageUri: string;
begin
  CheckInitialized;

  ImageUri := ImageFileToUri(string(ImageFile));

  Builder := TToastContentBuilder.Create;
  try
    Builder.AddText(TToastText.Create.Text(EscapeXmlText(string(Title))));
    Builder.AddText(TToastText.Create.Text(EscapeXmlText(string(MessageText))));

    Builder.AddImage(TToastImage.Create.Src(ImageUri)
      .Placement(TToastImagePlacement.Hero));
  except
    Builder.Free;
    raise;
  end;

  Notification := TNotification.Create(nil, Builder);
  try
    FManager.ShowNotification(Notification);
  finally
    Notification.Free;
  end;
end;

procedure TFToast.ShowLogo(const Title, MessageText, ImageFile: WideString);
var
  Builder: TToastContentBuilder;
  Notification: TNotification;
  ImageUri: string;
begin
  CheckInitialized;

  ImageUri := ImageFileToUri(string(ImageFile));

  Builder := TToastContentBuilder.Create;
  try
    Builder.AddText(TToastText.Create.Text(EscapeXmlText(string(Title))));
    Builder.AddText(TToastText.Create.Text(EscapeXmlText(string(MessageText))));

    Builder.AddImage(TToastImage.Create.Src(ImageUri)
      .Placement(TToastImagePlacement.AppLogoOverride));
  except
    Builder.Free;
    raise;
  end;

  Notification := TNotification.Create(nil, Builder);
  try
    FManager.ShowNotification(Notification);
  finally
    Notification.Free;
  end;
end;

// =============================================================================
// Exports
// =============================================================================
function InitToastHandle: FToast;
begin
  Result := TFToast.Create;
end;

exports InitToastHandle;

end.
