
unit FMXBridge.Cursor;

interface

uses
  System.UITypes,
  Winapi.Windows,
  FMX.Types;

type
  ICustomCursorService = interface(IInterface)
    ['{A9C7A6A3-6B6B-4A7A-9B7D-0D6B2E3D4C81}']
    procedure SetCustomCursor(const AFileName: WideString);
  end;

  TFMXCursorService = class(TInterfacedObject, IFMXCursorService,
    ICustomCursorService)
  private
    FOriginalService: IFMXCursorService;
    FCustomCursor: HCURSOR;
  public
    constructor Create(const AOriginalService: IFMXCursorService);
    destructor Destroy; override;

    procedure SetCursor(const ACursor: TCursor);
    function GetCursor: TCursor;
    procedure SetCustomCursor(const AFileName: WideString);
  end;

procedure RegisterCustomCursorService;

implementation

uses
  System.SysUtils, FMX.Platform;

constructor TFMXCursorService.Create(const AOriginalService: IFMXCursorService);
begin
  inherited Create;

  FOriginalService := AOriginalService;
  FCustomCursor := 0;
end;

destructor TFMXCursorService.Destroy;
begin
  if FCustomCursor <> 0 then
  begin
    DestroyCursor(FCustomCursor);
    FCustomCursor := 0;
  end;

  FOriginalService := nil;

  inherited;
end;

procedure TFMXCursorService.SetCursor(const ACursor: TCursor);
begin
  { Custom cursor only crDefault. }
  if (FCustomCursor <> 0) and (ACursor = crDefault) then
  begin
    Winapi.Windows.SetCursor(FCustomCursor);
    Exit;
  end;

  FOriginalService.SetCursor(ACursor);
end;

function TFMXCursorService.GetCursor: TCursor;
begin
  Result := FOriginalService.GetCursor;
end;

procedure TFMXCursorService.SetCustomCursor(const AFileName: WideString);
var
  NewCursor: HCURSOR;
begin
  if AFileName = '' then
  begin
    if FCustomCursor <> 0 then
    begin
      DestroyCursor(FCustomCursor);
      FCustomCursor := 0;
    end;

    FOriginalService.SetCursor(FOriginalService.GetCursor);
    Exit;
  end;

  NewCursor := LoadImageW(0, PWideChar(AFileName), IMAGE_CURSOR, 0, 0,
    LR_LOADFROMFILE or LR_DEFAULTSIZE);

  if NewCursor = 0 then
    RaiseLastOSError;

  if FCustomCursor <> 0 then
    DestroyCursor(FCustomCursor);

  FCustomCursor := NewCursor;

  Winapi.Windows.SetCursor(FCustomCursor);
end;

procedure RegisterCustomCursorService;
var
  OriginalService: IFMXCursorService;
  CustomService: ICustomCursorService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(
    IFMXCursorService, OriginalService) then
    Exit;

  if Supports(OriginalService, ICustomCursorService, CustomService) then
    Exit;

  TPlatformServices.Current.RemovePlatformService(IFMXCursorService);

  TPlatformServices.Current.AddPlatformService(IFMXCursorService,
    TFMXCursorService.Create(OriginalService));
end;

end.