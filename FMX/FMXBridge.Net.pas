
unit FMXBridge.Net;

interface

uses
  System.Net.HttpClient, System.Net.HttpClientComponent;

// =============================================================================
// FNetHTTPClient
// =============================================================================
type
  TDownloadCallback = function(const FUrl, FOutfile: WideString;
    const ProgressCurrent, ProgressMax, SpeedKBps: Int64): Boolean of object;

  FNetHTTPClient = interface(IUnknown)
    ['{B60A2468-0FF3-40B3-8812-4DCFAFD94FE4}']
    function DownloadStart(const FUrl, FOutfile: WideString;
      FCallback: TDownloadCallback): Int64; stdcall;
    procedure Accept(FAccept: WideString); stdcall;
    procedure AcceptCharSet(FCharSet: WideString); stdcall;
    procedure AcceptEncoding(FEncoding: WideString); stdcall;
    procedure AllowCookies(FValue: Boolean); stdcall;
    procedure Asynchronous(FValue: Boolean); stdcall;
    procedure AutomaticDecompression(FAutomaticDecompression
      : THTTPCompressionMethods); stdcall;
    procedure ConnectionTimeout(FValue: Integer); stdcall;
    procedure ContentType(FContentType: WideString); stdcall;
    procedure HandleRedirects(FValue: Boolean); stdcall;
    procedure MaxRedirects(FValue: Integer); stdcall;
    procedure PreemptiveAuthentication(FValue: Boolean); stdcall;
    procedure ProtocolVersion(FProtocolVersion: THTTPProtocolVersion); stdcall;
    procedure RedirectsWithGET(FRedirectsWithGET
      : THTTPRedirectsWithGET); stdcall;
    procedure ResponseTimeout(FValue: Integer); stdcall;
    procedure SecureProtocols(FSecureProtocols: THTTPSecureProtocols); stdcall;
    procedure SendTimeout(FValue: Integer); stdcall;
    procedure SynchronizeEvents(FValue: Boolean); stdcall;
    procedure UseDefaultCredentials(FValue: Boolean); stdcall;
    procedure UserAgent(FUserAgent: WideString); stdcall;
    procedure DownloadStop; stdcall;
  end;

  TFNetHTTPClient = class(TInterfacedObject, FNetHTTPClient)
  private
    HttpClient: TNetHTTPClient;
    FUrl, FOutfile: WideString;
    FOnProgress: TDownloadCallback;
    FTotalRead, FContentLen: Int64;
    FStartTime: Cardinal;
    FAbort: Boolean;
    procedure OnReceiveData(const Sender: TObject;
      AContentLength, AReadCount: Int64; var AAbort: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    function DownloadStart(const FUrl, FOutfile: WideString;
      FCallback: TDownloadCallback): Int64; stdcall;
    procedure Accept(FAccept: WideString); stdcall;
    procedure AcceptCharSet(FCharSet: WideString); stdcall;
    procedure AcceptEncoding(FEncoding: WideString); stdcall;
    procedure AllowCookies(FValue: Boolean); stdcall;
    procedure Asynchronous(FValue: Boolean); stdcall;
    procedure AutomaticDecompression(FAutomaticDecompression
      : THTTPCompressionMethods); stdcall;
    procedure ConnectionTimeout(FValue: Integer); stdcall;
    procedure ContentType(FContentType: WideString); stdcall;
    procedure HandleRedirects(FValue: Boolean); stdcall;
    procedure MaxRedirects(FValue: Integer); stdcall;
    procedure PreemptiveAuthentication(FValue: Boolean); stdcall;
    procedure ProtocolVersion(FProtocolVersion: THTTPProtocolVersion); stdcall;
    procedure RedirectsWithGET(FRedirectsWithGET
      : THTTPRedirectsWithGET); stdcall;
    procedure ResponseTimeout(FValue: Integer); stdcall;
    procedure SecureProtocols(FSecureProtocols: THTTPSecureProtocols); stdcall;
    procedure SendTimeout(FValue: Integer); stdcall;
    procedure SynchronizeEvents(FValue: Boolean); stdcall;
    procedure UseDefaultCredentials(FValue: Boolean); stdcall;
    procedure UserAgent(FUserAgent: WideString); stdcall;
    procedure DownloadStop; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitNetHTTPClient: FNetHTTPClient; stdcall;

implementation

uses
  System.SysUtils, System.Classes, Winapi.Windows, FMX.Forms;

// =============================================================================
// TFNetHTTPClient
// =============================================================================
constructor TFNetHTTPClient.Create;
begin
  inherited Create;
  HttpClient := TNetHTTPClient.Create(nil);
  HttpClient.OnReceiveData := OnReceiveData;
end;

destructor TFNetHTTPClient.Destroy;
begin
  HttpClient.Free;
  inherited;
end;

procedure TFNetHTTPClient.DownloadStop;
begin
  FAbort := True;
end;

procedure TFNetHTTPClient.OnReceiveData(const Sender: TObject;
  AContentLength, AReadCount: Int64; var AAbort: Boolean);
var
  Elapsed, Speed: Int64;
begin
  FTotalRead := AReadCount;
  FContentLen := AContentLength;

  Elapsed := GetTickCount - FStartTime;
  if Elapsed = 0 then
    Elapsed := 1;

  Speed := (FTotalRead * 1024) div Elapsed;

  if Assigned(FOnProgress) then
  begin
    AAbort := FOnProgress(FUrl, FOutfile, FTotalRead, FContentLen, Speed);
    Application.ProcessMessages;
  end;

  if FAbort then
    AAbort := True;
end;

function TFNetHTTPClient.DownloadStart(const FUrl, FOutfile: WideString;
  FCallback: TDownloadCallback): Int64;
var
  FileStream: TFileStream;
  Resp: IHTTPResponse;
begin
  Result := -1;

  FAbort := False;
  Self.FUrl := string(FUrl);
  Self.FOutfile := string(FOutfile);
  FOnProgress := FCallback;
  FTotalRead := 0;
  FContentLen := -1;

  FileStream := TFileStream.Create(FOutfile, fmCreate or fmShareExclusive);
  try
    FStartTime := GetTickCount;

    Resp := HttpClient.Get(FUrl, FileStream);

    if FAbort then
      Exit;

    Result := FileStream.Size;
  finally
    FileStream.Free;
  end;
end;

procedure TFNetHTTPClient.Accept(FAccept: WideString);
begin
  HttpClient.Accept := string(FAccept);
end;

procedure TFNetHTTPClient.AcceptCharSet(FCharSet: WideString);
begin
  HttpClient.AcceptCharSet := string(FCharSet);
end;

procedure TFNetHTTPClient.AcceptEncoding(FEncoding: WideString);
begin
  HttpClient.AcceptEncoding := string(FEncoding);
end;

procedure TFNetHTTPClient.AllowCookies(FValue: Boolean);
begin
  HttpClient.AllowCookies := FValue;
end;

procedure TFNetHTTPClient.Asynchronous(FValue: Boolean);
begin
  HttpClient.Asynchronous := FValue;
end;

procedure TFNetHTTPClient.AutomaticDecompression(FAutomaticDecompression
  : THTTPCompressionMethods);
begin
  HttpClient.AutomaticDecompression :=
    THTTPCompressionMethods(FAutomaticDecompression);
end;

procedure TFNetHTTPClient.ConnectionTimeout(FValue: Integer);
begin
  HttpClient.ConnectionTimeout := FValue;
end;

procedure TFNetHTTPClient.ContentType(FContentType: WideString);
begin
  HttpClient.ContentType := string(FContentType);
end;

procedure TFNetHTTPClient.HandleRedirects(FValue: Boolean);
begin
  HttpClient.HandleRedirects := FValue;
end;

procedure TFNetHTTPClient.MaxRedirects(FValue: Integer);
begin
  HttpClient.MaxRedirects := FValue;
end;

procedure TFNetHTTPClient.PreemptiveAuthentication(FValue: Boolean);
begin
  HttpClient.PreemptiveAuthentication := FValue;
end;

procedure TFNetHTTPClient.ProtocolVersion(FProtocolVersion
  : THTTPProtocolVersion);
begin
  HttpClient.ProtocolVersion := THTTPProtocolVersion(FProtocolVersion);
end;

procedure TFNetHTTPClient.RedirectsWithGET(FRedirectsWithGET
  : THTTPRedirectsWithGET);
begin
  HttpClient.RedirectsWithGET := THTTPRedirectsWithGET(FRedirectsWithGET);
end;

procedure TFNetHTTPClient.ResponseTimeout(FValue: Integer);
begin
  HttpClient.ResponseTimeout := FValue;
end;

procedure TFNetHTTPClient.SecureProtocols(FSecureProtocols
  : THTTPSecureProtocols);
begin
  HttpClient.SecureProtocols := THTTPSecureProtocols(FSecureProtocols);
end;

procedure TFNetHTTPClient.SendTimeout(FValue: Integer);
begin
  HttpClient.SendTimeout := FValue;
end;

procedure TFNetHTTPClient.SynchronizeEvents(FValue: Boolean);
begin
  HttpClient.SynchronizeEvents := FValue;
end;

procedure TFNetHTTPClient.UseDefaultCredentials(FValue: Boolean);
begin
  HttpClient.UseDefaultCredentials := FValue;
end;

procedure TFNetHTTPClient.UserAgent(FUserAgent: WideString);
begin
  HttpClient.UserAgent := string(FUserAgent);
end;

// =============================================================================
// Exports
// =============================================================================
function InitNetHTTPClient: FNetHTTPClient;
begin
  Result := TFNetHTTPClient.Create;
end;

exports
  InitNetHTTPClient;

end.
