unit FMXBridge.Toast;

interface

uses
  System.Classes,
  FMX.Win.NotificationManager;

type
  FToast = interface(IUnknown)
    ['{9D74B54D-8C5A-4C35-8A4B-CF0C02C5F3B2}']
    procedure Show(const Title, MessageText: WideString); stdcall;
  end;

  TFToast = class(TInterfacedObject, FToast)
  private
    FManager: TNotificationManager;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Show(const Title, MessageText: WideString); stdcall;
  end;

function InitToastHandle: FToast; stdcall;

implementation

uses
  System.SysUtils;

const
  CToastAppID = 'Audiofeel.FMXBridge.Setup';
  CToastAppName = 'FMXBridge Setup';

function EscapeXmlText(const Value: string): string;
begin
  Result := StringReplace(Value, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
end;

constructor TFToast.Create;
begin
  inherited Create;

  FManager := TNotificationManager.Create(nil, CToastAppID);
  FManager.ApplicationName := CToastAppName;
end;

destructor TFToast.Destroy;
begin
  FManager.Free;
  inherited Destroy;
end;

procedure TFToast.Show(const Title, MessageText: WideString);
var
  Builder: TToastContentBuilder;
  Notification: TNotification;
begin
  Builder := TToastContentBuilder.Create;
  try
    Builder.AddText(TToastText.Create.Text(EscapeXmlText(string(Title))));
    Builder.AddText(TToastText.Create.Text(EscapeXmlText(string(MessageText))));
  except
    Builder.Free;
    raise;
  end;

  // TNotification.Create takes ownership of Builder and frees it
  // in its constructor, including when initialization raises an exception.
  Notification := TNotification.Create(nil, Builder);
  try
    FManager.ShowNotification(Notification);
  finally
    Notification.Free;
  end;
end;

function InitToastHandle: FToast;
begin
  Result := TFToast.Create;
end;

exports
  InitToastHandle;

end.
