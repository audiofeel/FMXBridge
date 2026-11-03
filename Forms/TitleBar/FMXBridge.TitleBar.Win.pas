unit FMXBridge.TitleBar.Win;

interface

uses
  Winapi.Windows;

const
  CUSTOM_CAPTION_BUTTON_WIDTH = 46;
  CUSTOM_SINGLE_CLOSE_BUTTON_WIDTH = 30;

type
  TCaptionButtonMetrics = record
    Valid: Boolean;

    ButtonWidth: Single;

    HasMinimize: Boolean;
    HasMaximize: Boolean;
    HasClose: Boolean;
  end;

function GetCaptionButtonMetrics(const AWnd: HWND;
  out AMetrics: TCaptionButtonMetrics): Boolean;

implementation

function GetCaptionButtonMetrics(const AWnd: HWND;
  out AMetrics: TCaptionButtonMetrics): Boolean;
var
  Style: LONG_PTR;
begin
  FillChar(AMetrics, SizeOf(AMetrics), 0);
  Result := False;

  if AWnd = 0 then
    Exit;

  if not IsWindow(AWnd) then
    Exit;

  Style := GetWindowLongPtr(AWnd, GWL_STYLE);

  AMetrics.HasMinimize := (Style and WS_MINIMIZEBOX) <> 0;
  AMetrics.HasMaximize := (Style and WS_MAXIMIZEBOX) <> 0;
  AMetrics.HasClose := True;

  if AMetrics.HasClose and not AMetrics.HasMinimize and not AMetrics.HasMaximize
  then
    AMetrics.ButtonWidth := CUSTOM_SINGLE_CLOSE_BUTTON_WIDTH
  else
    AMetrics.ButtonWidth := CUSTOM_CAPTION_BUTTON_WIDTH;

  AMetrics.Valid := AMetrics.HasMinimize or AMetrics.HasMaximize or
    AMetrics.HasClose;

  Result := AMetrics.Valid;
end;

end.
