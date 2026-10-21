
unit FMXBridge.System;

interface

uses
  System.Classes,
  FMX.Types;

// =============================================================================
// FTimer
// =============================================================================
type
  FTimer = interface(IUnknown)
    ['{B141008A-EFF0-43EC-A1D8-4AB88AF406AA}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Interval(Interval: Cardinal); stdcall;
    procedure OnTimer(Event: TNotifyEvent); stdcall;
  end;

  TFTimer = class(TInterfacedObject, FTimer)
  private
    ControlTimer: TTimer;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Interval(Interval: Cardinal); stdcall;
    procedure OnTimer(Event: TNotifyEvent); stdcall;
  end;

// =============================================================================
// FStopwatch
// =============================================================================
type
  FStopwatch = interface(IUnknown)
    ['{E38C1983-E8E5-4A37-9182-17EBA892D844}']
    procedure FCreate; stdcall;
    procedure Reset; stdcall;
    procedure Start; stdcall;
    procedure StartNew; stdcall;
    procedure Stop; stdcall;
    function ElapsedMilliseconds: Double; stdcall;
    function IsRunning: Boolean; stdcall;
  end;

  TFStopwatch = class(TInterfacedObject, FStopwatch)
  private
    FStartTimestamp: Int64;
    FElapsedTicks: Int64;
    FFrequency: Int64;
    FRunning: Boolean;
  public
    procedure FCreate; stdcall;
    procedure Reset; stdcall;
    procedure Start; stdcall;
    procedure StartNew; stdcall;
    procedure Stop; stdcall;
    function ElapsedMilliseconds: Double; stdcall;
    function IsRunning: Boolean; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitTimer: FTimer; stdcall;
function InitStopwatch: FStopwatch; stdcall;

implementation

uses
  Winapi.Windows;

// =============================================================================
// TFTimer
// =============================================================================
procedure TFTimer.FCreate(FParent: TFmxObject);
begin
  ControlTimer := TTimer.Create(nil);
  ControlTimer.Parent := TFmxObject(FParent);
  ControlTimer.Enabled := False;
end;

procedure TFTimer.Enabled(FEnabled: Boolean);
begin
  ControlTimer.Enabled := FEnabled;
end;

procedure TFTimer.Interval(Interval: Cardinal);
begin
  ControlTimer.Interval := Interval;
end;

procedure TFTimer.OnTimer(Event: TNotifyEvent);
begin
  ControlTimer.OnTimer := TNotifyEvent(Event);
end;

// =============================================================================
// FStopwatch
// =============================================================================
procedure TFStopwatch.FCreate;
begin
  FStartTimestamp := 0;
  FElapsedTicks := 0;
  FRunning := False;

  if not QueryPerformanceFrequency(FFrequency) then
    FFrequency := 0;
end;

procedure TFStopwatch.Reset;
begin
  FStartTimestamp := 0;
  FElapsedTicks := 0;
  FRunning := False;
end;

procedure TFStopwatch.Start;
var
  LTimestamp: Int64;
begin
  if FRunning then
    Exit;

  if (FFrequency = 0) then
    Exit;

  if QueryPerformanceCounter(LTimestamp) then
  begin
    FStartTimestamp := LTimestamp;
    FRunning := True;
  end;
end;

procedure TFStopwatch.StartNew;
begin
  Reset;
  Start;
end;

procedure TFStopwatch.Stop;
var
  LTimestamp: Int64;
begin
  if not FRunning then
    Exit;

  if QueryPerformanceCounter(LTimestamp) then
    Inc(FElapsedTicks, LTimestamp - FStartTimestamp);

  FRunning := False;
end;

function TFStopwatch.ElapsedMilliseconds: Double;
var
  LTimestamp: Int64;
  LElapsedTicks: Int64;
begin
  if FFrequency = 0 then
    Exit(0);

  LElapsedTicks := FElapsedTicks;

  if FRunning then
  begin
    if QueryPerformanceCounter(LTimestamp) then
      Inc(LElapsedTicks, LTimestamp - FStartTimestamp);
  end;

  Result := LElapsedTicks * 1000.0 / FFrequency;
end;

function TFStopwatch.IsRunning: Boolean;
begin
  Result := FRunning;
end;

// =============================================================================
// Exports
// =============================================================================
function InitTimer: FTimer;
begin
  Result := TFTimer.Create;
end;

function InitStopwatch: FStopwatch;
begin
  Result := TFStopwatch.Create;
end;

exports
  InitTimer,
  InitStopwatch;

end.
