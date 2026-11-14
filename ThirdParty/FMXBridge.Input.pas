unit FMXBridge.Input;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections,
  FMX.Types, FMXInput;

// =============================================================================
// FInput
// =============================================================================
type
  FInput = interface(IUnknown)
    ['{3FAF5B3C-4B97-4F2A-9C3D-BA0AD938A7C1}']
    function StartPolling(Interval: Cardinal; Event: TNotifyEvent)
      : Boolean; stdcall;
    procedure StopPolling; stdcall;
    procedure Shutdown; stdcall;
    function Poll: Boolean; stdcall;
    function Refresh: Boolean; stdcall;
    procedure Enabled(Value: Boolean); stdcall;
    function IsEnabled: Boolean; stdcall;
    function IsPolling: Boolean; stdcall;
    function DeviceCount: Integer; stdcall;
    function DeviceID(Index: Integer): WideString; stdcall;
    function DeviceName(Index: Integer): WideString; stdcall;
    function DeviceKind(Index: Integer): Integer; stdcall;
    function DeviceAvailable(Index: Integer): Boolean; stdcall;
    function DeviceError(Index: Integer): WideString; stdcall;
    function DeviceRumbleSupported(Index: Integer): Boolean; stdcall;
    function ElementCount(DeviceIndex: Integer): Integer; stdcall;
    function ElementName(DeviceIndex, ElementIndex: Integer)
      : WideString; stdcall;
    function ElementKind(DeviceIndex, ElementIndex: Integer): Integer; stdcall;
    function ElementCode(DeviceIndex, ElementIndex: Integer): Integer; stdcall;
    function Bind(Action: Integer; const DeviceID: WideString;
      Kind, Code, Direction: Integer): Boolean; stdcall;
    function BindAxis(Action: Integer; const DeviceID: WideString;
      Code, Direction: Integer; AxisOrigin, PressThreshold, ReleaseThreshold
      : Single): Boolean; stdcall;
    function BeginCapture(Action: Integer; const DeviceID: WideString;
      IncludePointerMotion: Boolean): Boolean; stdcall;
    procedure CancelCapture; stdcall;
    function Capturing: Boolean; stdcall;
    function HasCaptured: Boolean; stdcall;
    function CapturedDeviceID: WideString; stdcall;
    function CapturedDeviceName: WideString; stdcall;
    function CapturedKind: Integer; stdcall;
    function CapturedCode: Integer; stdcall;
    function CapturedDirection: Integer; stdcall;
    function AcceptCaptured: Boolean; stdcall;
    function IsPressed(Action: Integer): Boolean; stdcall;
    function WasPressed(Action: Integer): Boolean; stdcall;
    procedure ClearBindings; stdcall;
    procedure RemoveBindings(Action: Integer); stdcall;
    function SaveProfile(const FileName: WideString): Boolean; stdcall;
    function LoadProfile(const FileName: WideString): Boolean; stdcall;
    function SetRumble(const DeviceID: WideString;
      LowFrequency, HighFrequency, DurationMs: Word): Boolean; stdcall;
    procedure StopRumble(const DeviceID: WideString); stdcall;
    function LastError: WideString; stdcall;
    procedure ClearError; stdcall;
  end;

  TFInputService = class(TInterfacedObject, FInput)
  private
    FManager: TInputManager;
    FTimer: TTimer;
    FOnPoll: TNotifyEvent;
    FLastError: string;
    FInPoll: Boolean;
    FCaptured: TInputBinding;
    FHasCaptured: Boolean;
    FActionIDs: TList<Integer>;
    FActionDown: TDictionary<Integer, Boolean>;
    FActionPressed: TDictionary<Integer, Boolean>;

    procedure SetError(const E: Exception);
    procedure PollInternal(Notify: Boolean);
    procedure TimerTick(Sender: TObject);
    procedure TrackAction(Action: Integer);
    procedure UpdateActionEdges;
    procedure RebuildActions;
    function GetDeviceAt(Index: Integer; out Device: TInputDevice): Boolean;
    function FindDevice(const DeviceID: string;
      out Device: TInputDevice): Boolean;
    function ResolveDeviceID(const DeviceID: string; Kind: Integer): string;
    function HasElement(const Device: TInputDevice;
      Kind, Code: Integer): Boolean;
    function AddBindingInternal(Action: Integer; const DeviceID: WideString;
      Kind, Code, Direction: Integer; CustomAxis: Boolean;
      AxisOrigin, PressThreshold, ReleaseThreshold: Single): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function StartPolling(Interval: Cardinal; Event: TNotifyEvent)
      : Boolean; stdcall;
    procedure StopPolling; stdcall;
    procedure Shutdown; stdcall;
    function Poll: Boolean; stdcall;
    function Refresh: Boolean; stdcall;
    procedure Enabled(Value: Boolean); stdcall;
    function IsEnabled: Boolean; stdcall;
    function IsPolling: Boolean; stdcall;
    function DeviceCount: Integer; stdcall;
    function DeviceID(Index: Integer): WideString; stdcall;
    function DeviceName(Index: Integer): WideString; stdcall;
    function DeviceKind(Index: Integer): Integer; stdcall;
    function DeviceAvailable(Index: Integer): Boolean; stdcall;
    function DeviceError(Index: Integer): WideString; stdcall;
    function DeviceRumbleSupported(Index: Integer): Boolean; stdcall;
    function ElementCount(DeviceIndex: Integer): Integer; stdcall;
    function ElementName(DeviceIndex, ElementIndex: Integer)
      : WideString; stdcall;
    function ElementKind(DeviceIndex, ElementIndex: Integer): Integer; stdcall;
    function ElementCode(DeviceIndex, ElementIndex: Integer): Integer; stdcall;
    function Bind(Action: Integer; const DeviceID: WideString;
      Kind, Code, Direction: Integer): Boolean; stdcall;
    function BindAxis(Action: Integer; const DeviceID: WideString;
      Code, Direction: Integer; AxisOrigin, PressThreshold, ReleaseThreshold
      : Single): Boolean; stdcall;
    function BeginCapture(Action: Integer; const DeviceID: WideString;
      IncludePointerMotion: Boolean): Boolean; stdcall;
    procedure CancelCapture; stdcall;
    function Capturing: Boolean; stdcall;
    function HasCaptured: Boolean; stdcall;
    function CapturedDeviceID: WideString; stdcall;
    function CapturedDeviceName: WideString; stdcall;
    function CapturedKind: Integer; stdcall;
    function CapturedCode: Integer; stdcall;
    function CapturedDirection: Integer; stdcall;
    function AcceptCaptured: Boolean; stdcall;
    function IsPressed(Action: Integer): Boolean; stdcall;
    function WasPressed(Action: Integer): Boolean; stdcall;
    procedure ClearBindings; stdcall;
    procedure RemoveBindings(Action: Integer); stdcall;
    function SaveProfile(const FileName: WideString): Boolean; stdcall;
    function LoadProfile(const FileName: WideString): Boolean; stdcall;
    function SetRumble(const DeviceID: WideString;
      LowFrequency, HighFrequency, DurationMs: Word): Boolean; stdcall;
    procedure StopRumble(const DeviceID: WideString); stdcall;
    function LastError: WideString; stdcall;
    procedure ClearError; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitInput: FInput; stdcall;

implementation

constructor TFInputService.Create;
begin
  inherited Create;

  FActionIDs := TList<Integer>.Create;
  FActionDown := TDictionary<Integer, Boolean>.Create;
  FActionPressed := TDictionary<Integer, Boolean>.Create;

  try
    FManager := TInputManager.Create(CreateFMXInputBackend);
  except
    FreeAndNil(FActionPressed);
    FreeAndNil(FActionDown);
    FreeAndNil(FActionIDs);
    raise;
  end;
end;

destructor TFInputService.Destroy;
begin
  Shutdown;
  FActionPressed.Free;
  FActionDown.Free;
  FActionIDs.Free;

  inherited;
end;

procedure TFInputService.SetError(const E: Exception);
begin
  FLastError := E.ClassName + ': ' + E.Message;
end;

function TFInputService.GetDeviceAt(Index: Integer;
  out Device: TInputDevice): Boolean;
var
  Devices: TArray<TInputDevice>;
begin
  Device := Default (TInputDevice);
  Result := False;

  if FManager = nil then
    Exit;

  Devices := FManager.Devices;
  if (Index < 0) or (Index >= Length(Devices)) then
    Exit;

  Device := Devices[Index];
  Result := True;
end;

function TFInputService.FindDevice(const DeviceID: string;
  out Device: TInputDevice): Boolean;
var
  Devices: TArray<TInputDevice>;
  Item: TInputDevice;
begin
  Device := Default (TInputDevice);
  Result := False;

  if (FManager = nil) or (DeviceID = '') then
    Exit;

  Devices := FManager.Devices;

  for Item in Devices do
    if Item.Id = DeviceID then
    begin
      Device := Item;
      Exit(True);
    end;
end;

function TFInputService.ResolveDeviceID(const DeviceID: string;
  Kind: Integer): string;
begin
  Result := DeviceID;

  if Result <> '' then
    Exit;

  case Kind of
    0:
      Result := SystemKeyboardId;
    1, 4:
      Result := SystemMouseId;
  else
    raise EArgumentException.Create
      ('A device ID is required for controller axes and hats');
  end;
end;

function TFInputService.HasElement(const Device: TInputDevice;
  Kind, Code: Integer): Boolean;
var
  Element: TInputElement;
begin
  Result := False;

  for Element in Device.Elements do
    if (Ord(Element.Kind) = Kind) and (Element.Code = Code) then
      Exit(True);
end;

procedure TFInputService.TrackAction(Action: Integer);
begin
  if FActionDown.ContainsKey(Action) then
    Exit;

  FActionIDs.Add(Action);
  FActionDown.Add(Action, FManager.IsPressed(Action));
  FActionPressed.Add(Action, False);
end;

procedure TFInputService.UpdateActionEdges;
var
  Action: Integer;
  WasDown, IsDown: Boolean;
begin
  if FManager = nil then
    Exit;

  for Action in FActionIDs do
  begin
    WasDown := False;
    FActionDown.TryGetValue(Action, WasDown);
    IsDown := FManager.IsPressed(Action);

    if IsDown and not WasDown then
      FActionPressed.AddOrSetValue(Action, True);

    FActionDown.AddOrSetValue(Action, IsDown);
  end;
end;

procedure TFInputService.RebuildActions;
var
  Binding: TInputBinding;
  Items: TArray<TInputBinding>;
begin
  FActionIDs.Clear;
  FActionDown.Clear;
  FActionPressed.Clear;

  Items := FManager.Bindings;

  for Binding in Items do
    TrackAction(Binding.Action);
end;

procedure TFInputService.PollInternal(Notify: Boolean);
var
  Binding: TInputBinding;
begin
  if FManager = nil then
    raise EInvalidOperation.Create('Input service is shut down');

  if FInPoll then
    Exit;

  FInPoll := True;
  try
    FManager.Poll;

    if FManager.TakeCaptured(Binding) then
    begin
      FCaptured := Binding;
      FHasCaptured := True;
    end;

    UpdateActionEdges;

    if Notify and Assigned(FOnPoll) then
      FOnPoll(Self);
  finally
    FInPoll := False;
  end;
end;

procedure TFInputService.TimerTick(Sender: TObject);
begin
  try
    PollInternal(True);
  except
    on E: Exception do
    begin
      SetError(E);
      if FTimer <> nil then
        FTimer.Enabled := False;
      FOnPoll := nil;
    end;
  end;
end;

function TFInputService.StartPolling(Interval: Cardinal;
  Event: TNotifyEvent): Boolean;
begin
  Result := False;
  try
    if FManager = nil then
      raise EInvalidOperation.Create('Input service is shut down');

    if Interval = 0 then
      Interval := 1;

    if FTimer = nil then
    begin
      FTimer := TTimer.Create(nil);
      FTimer.Enabled := False;
      FTimer.OnTimer := TimerTick;
    end;

    FOnPoll := Event;
    FTimer.Interval := Interval;
    FTimer.Enabled := True;
    FLastError := '';

    Result := True;
  except
    on E: Exception do
      SetError(E);
  end;
end;

procedure TFInputService.StopPolling;
begin
  if FTimer <> nil then
    FTimer.Enabled := False;

  FOnPoll := nil;
end;

procedure TFInputService.Shutdown;
begin
  StopPolling;

  if FTimer <> nil then
  begin
    FTimer.OnTimer := nil;
    if not FInPoll then
    begin
      FTimer.Free;
      FTimer := nil;
    end;
  end;

  if FManager <> nil then
  begin
    try
      FManager.Enabled := False;
    except
      on E: Exception do
        SetError(E);
    end;

    FManager.Free;
    FManager := nil;
  end;

  FHasCaptured := False;

  if FActionIDs <> nil then
    FActionIDs.Clear;

  if FActionDown <> nil then
    FActionDown.Clear;

  if FActionPressed <> nil then
    FActionPressed.Clear;
end;

function TFInputService.Poll: Boolean;
begin
  Result := False;
  try
    PollInternal(False);
    FLastError := '';

    Result := True;
  except
    on E: Exception do
      SetError(E);
  end;
end;

function TFInputService.Refresh: Boolean;
begin
  Result := False;
  try
    if FManager = nil then
      raise EInvalidOperation.Create('Input service is shut down');

    FManager.Refresh;
    PollInternal(False);
    FLastError := '';

    Result := True;
  except
    on E: Exception do
      SetError(E);
  end;
end;

procedure TFInputService.Enabled(Value: Boolean);
begin
  if FManager = nil then
    Exit;

  try
    FManager.Enabled := Value;

    if not Value then
    begin
      FHasCaptured := False;
      FCaptured := Default (TInputBinding);
      for var Action in FActionIDs do
        FActionPressed.AddOrSetValue(Action, False);
    end;

    UpdateActionEdges;
    FLastError := '';
  except
    on E: Exception do
      SetError(E);
  end;
end;

function TFInputService.IsEnabled: Boolean;
begin
  Result := (FManager <> nil) and FManager.Enabled;
end;

function TFInputService.IsPolling: Boolean;
begin
  Result := (FTimer <> nil) and FTimer.Enabled;
end;

function TFInputService.DeviceCount: Integer;
var
  Devices: TArray<TInputDevice>;
begin
  Result := 0;

  if FManager = nil then
    Exit;

  Devices := FManager.Devices;
  Result := Length(Devices);
end;

function TFInputService.DeviceID(Index: Integer): WideString;
var
  Device: TInputDevice;
begin
  Result := '';

  if GetDeviceAt(Index, Device) then
    Result := Device.Id;
end;

function TFInputService.DeviceName(Index: Integer): WideString;
var
  Device: TInputDevice;
begin
  Result := '';

  if GetDeviceAt(Index, Device) then
    Result := Device.Name;
end;

function TFInputService.DeviceKind(Index: Integer): Integer;
var
  Device: TInputDevice;
begin
  Result := -1;

  if GetDeviceAt(Index, Device) then
    Result := Ord(Device.Kind);
end;

function TFInputService.DeviceAvailable(Index: Integer): Boolean;
var
  Device: TInputDevice;
begin
  Result := GetDeviceAt(Index, Device) and Device.Available;
end;

function TFInputService.DeviceError(Index: Integer): WideString;
var
  Device: TInputDevice;
begin
  Result := '';

  if GetDeviceAt(Index, Device) then
    Result := Device.Error;
end;

function TFInputService.DeviceRumbleSupported(Index: Integer): Boolean;
var
  Device: TInputDevice;
begin
  Result := GetDeviceAt(Index, Device) and Device.RumbleSupported;
end;

function TFInputService.ElementCount(DeviceIndex: Integer): Integer;
var
  Device: TInputDevice;
begin
  Result := 0;

  if GetDeviceAt(DeviceIndex, Device) then
    Result := Length(Device.Elements);
end;

function TFInputService.ElementName(DeviceIndex, ElementIndex: Integer)
  : WideString;
var
  Device: TInputDevice;
begin
  Result := '';

  if GetDeviceAt(DeviceIndex, Device) and (ElementIndex >= 0) and
    (ElementIndex < Length(Device.Elements)) then
    Result := Device.Elements[ElementIndex].Name;
end;

function TFInputService.ElementKind(DeviceIndex, ElementIndex: Integer)
  : Integer;
var
  Device: TInputDevice;
begin
  Result := -1;

  if GetDeviceAt(DeviceIndex, Device) and (ElementIndex >= 0) and
    (ElementIndex < Length(Device.Elements)) then
    Result := Ord(Device.Elements[ElementIndex].Kind);
end;

function TFInputService.ElementCode(DeviceIndex, ElementIndex: Integer)
  : Integer;
var
  Device: TInputDevice;
begin
  Result := -1;

  if GetDeviceAt(DeviceIndex, Device) and (ElementIndex >= 0) and
    (ElementIndex < Length(Device.Elements)) then
    Result := Device.Elements[ElementIndex].Code;
end;

function TFInputService.AddBindingInternal(Action: Integer;
  const DeviceID: WideString; Kind, Code, Direction: Integer;
  CustomAxis: Boolean; AxisOrigin, PressThreshold, ReleaseThreshold
  : Single): Boolean;
var
  Id: string;
  Device: TInputDevice;
  InputKind: TInputElementKind;
  Value: TInputValue;
  Binding: TInputBinding;
begin
  Result := False;
  try
    if FManager = nil then
      raise EInvalidOperation.Create('Input service is shut down');

    if (Kind < Ord(Low(TInputElementKind))) or
      (Kind > Ord(High(TInputElementKind))) then
      raise EArgumentException.Create('Invalid input element kind');

    InputKind := TInputElementKind(Kind);

    if CustomAxis and (InputKind <> TInputElementKind.Axis) then
      raise EArgumentException.Create('BindAxis requires an analog axis');

    if InputKind in [TInputElementKind.Axis, TInputElementKind.RelativeAxis]
    then
      if (Direction <> -1) and (Direction <> 1) then
        raise EArgumentException.Create('Axis direction must be -1 or +1');

    if (InputKind = TInputElementKind.Hat) and
      ((Direction < 0) or (Direction > 7)) then
      raise EArgumentException.Create('Hat direction must be in range 0..7');

    Id := ResolveDeviceID(string(DeviceID), Kind);

    if not FindDevice(Id, Device) then
      raise EArgumentException.Create('Input device not found: ' + Id);

    if not Device.Available then
      raise EInvalidOperation.Create('Input device is unavailable: ' +
        Device.Error);

    if not HasElement(Device, Kind, Code) then
      raise EArgumentException.CreateFmt
        ('Input element not found (kind %d, code %d)', [Kind, Code]);

    Value := TInputValue.Create(Id, InputKind, Code, AxisOrigin);
    Binding := TInputBinding.Create(Action, Value);

    if InputKind in [TInputElementKind.Axis, TInputElementKind.RelativeAxis,
      TInputElementKind.Hat] then
      Binding.Direction := Direction;

    if CustomAxis then
    begin
      Binding.AxisOrigin := AxisOrigin;
      Binding.PressThreshold := PressThreshold;
      Binding.ReleaseThreshold := ReleaseThreshold;
    end;

    FManager.AddBinding(Binding);
    TrackAction(Action);
    FLastError := '';
    Result := True;
  except
    on E: Exception do
      SetError(E);
  end;
end;

function TFInputService.Bind(Action: Integer; const DeviceID: WideString;
  Kind, Code, Direction: Integer): Boolean;
begin
  Result := AddBindingInternal(Action, DeviceID, Kind, Code, Direction, False,
    0, 0.65, 0.45);
end;

function TFInputService.BindAxis(Action: Integer; const DeviceID: WideString;
  Code, Direction: Integer; AxisOrigin, PressThreshold, ReleaseThreshold
  : Single): Boolean;
begin
  Result := AddBindingInternal(Action, DeviceID, 2, Code, Direction, True,
    AxisOrigin, PressThreshold, ReleaseThreshold);
end;

function TFInputService.BeginCapture(Action: Integer;
  const DeviceID: WideString; IncludePointerMotion: Boolean): Boolean;
var
  Device: TInputDevice;
begin
  Result := False;
  try
    if FManager = nil then
      raise EInvalidOperation.Create('Input service is shut down');

    if not FManager.Enabled then
      raise EInvalidOperation.Create('Input is disabled');

    if DeviceID <> '' then
    begin
      if not FindDevice(string(DeviceID), Device) then
        raise EArgumentException.Create('Input device not found: ' +
          string(DeviceID));
      if not Device.Available then
        raise EInvalidOperation.Create('Input device is unavailable: ' +
          Device.Error);
    end;

    FHasCaptured := False;
    FCaptured := Default (TInputBinding);
    FManager.BeginCapture(Action, string(DeviceID), IncludePointerMotion);
    FLastError := '';
    Result := True;
  except
    on E: Exception do
      SetError(E);
  end;
end;

procedure TFInputService.CancelCapture;
begin
  if FManager <> nil then
    FManager.CancelCapture;

  FHasCaptured := False;
  FCaptured := Default (TInputBinding);
end;

function TFInputService.Capturing: Boolean;
begin
  Result := (FManager <> nil) and FManager.Capturing;
end;

function TFInputService.HasCaptured: Boolean;
begin
  Result := FHasCaptured;
end;

function TFInputService.CapturedDeviceID: WideString;
begin
  Result := '';

  if FHasCaptured then
    Result := FCaptured.DeviceID;
end;

function TFInputService.CapturedDeviceName: WideString;
var
  Device: TInputDevice;
begin
  Result := '';

  if FHasCaptured and FindDevice(FCaptured.DeviceID, Device) then
    Result := Device.Name;
end;

function TFInputService.CapturedKind: Integer;
begin
  Result := -1;
  if FHasCaptured then
    Result := Ord(FCaptured.Kind);
end;

function TFInputService.CapturedCode: Integer;
begin
  Result := -1;

  if FHasCaptured then
    Result := FCaptured.Code;
end;

function TFInputService.CapturedDirection: Integer;
begin
  Result := 0;

  if FHasCaptured then
    Result := FCaptured.Direction;
end;

function TFInputService.AcceptCaptured: Boolean;
begin
  Result := False;
  try
    if (FManager = nil) or not FHasCaptured then
      Exit;

    FManager.AddBinding(FCaptured);
    TrackAction(FCaptured.Action);
    FHasCaptured := False;
    FCaptured := Default (TInputBinding);
    FLastError := '';
    Result := True;
  except
    on E: Exception do
      SetError(E);
  end;
end;

function TFInputService.IsPressed(Action: Integer): Boolean;
begin
  Result := (FManager <> nil) and FManager.IsPressed(Action);
end;

function TFInputService.WasPressed(Action: Integer): Boolean;
begin
  Result := False;

  if FActionPressed.TryGetValue(Action, Result) then
    FActionPressed.AddOrSetValue(Action, False);
end;

procedure TFInputService.ClearBindings;
begin
  if FManager = nil then
    Exit;

  FManager.CancelCapture;
  FManager.ClearBindings;
  FHasCaptured := False;
  FCaptured := Default (TInputBinding);
  FActionIDs.Clear;
  FActionDown.Clear;
  FActionPressed.Clear;
end;

procedure TFInputService.RemoveBindings(Action: Integer);
begin
  if FManager = nil then
    Exit;

  FManager.RemoveBindings(Action);
  FActionIDs.Remove(Action);
  FActionDown.Remove(Action);
  FActionPressed.Remove(Action);
end;

function TFInputService.SaveProfile(const FileName: WideString): Boolean;
var
  Stream: TFileStream;
begin
  Result := False;
  try
    if FManager = nil then
      raise EInvalidOperation.Create('Input service is shut down');

    Stream := TFileStream.Create(string(FileName), fmCreate);
    try
      FManager.SaveBindings(Stream);
    finally
      Stream.Free;
    end;

    FLastError := '';
    Result := True;
  except
    on E: Exception do
      SetError(E);
  end;
end;

function TFInputService.LoadProfile(const FileName: WideString): Boolean;
var
  Stream: TFileStream;
begin
  Result := False;
  try
    if FManager = nil then
      raise EInvalidOperation.Create('Input service is shut down');

    Stream := TFileStream.Create(string(FileName), fmOpenRead or
      fmShareDenyWrite);
    try
      FManager.LoadBindings(Stream);
    finally
      Stream.Free;
    end;

    RebuildActions;
    FLastError := '';
    Result := True;
  except
    on E: Exception do
      SetError(E);
  end;
end;

function TFInputService.SetRumble(const DeviceID: WideString;
  LowFrequency, HighFrequency, DurationMs: Word): Boolean;
begin
  Result := False;
  try
    if FManager = nil then
      raise EInvalidOperation.Create('Input service is shut down');

    Result := FManager.SetRumble(string(DeviceID), LowFrequency, HighFrequency,
      DurationMs);

    if Result then
      FLastError := ''
    else
      FLastError := 'Rumble is unavailable for this device or backend.';
  except
    on E: Exception do
      SetError(E);
  end;
end;

procedure TFInputService.StopRumble(const DeviceID: WideString);
begin
  if FManager <> nil then
    FManager.StopRumble(string(DeviceID));
end;

function TFInputService.LastError: WideString;
begin
  Result := FLastError;
end;

procedure TFInputService.ClearError;
begin
  FLastError := '';
end;

// =============================================================================
// Exports
// =============================================================================
function InitInput: FInput;
begin
  Result := TFInputService.Create;
end;

exports InitInput;

end.
