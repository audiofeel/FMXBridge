
unit FMXBridge.RTFViewer;

interface

uses
  System.Classes, System.UITypes,
  FMX.RTFViewer, FMX.Types;

// =============================================================================
// FRTFViewer
// =============================================================================
type
  TRTFScrollBars = FMX.RTFViewer.TRTFScrollBars;
  TRTFLinkClickEvent = FMX.RTFViewer.TRTFLinkClickEvent;

  FRTFViewer = interface(IUnknown)
    ['{A52D7C6F-6F53-4D90-B1E7-C3A2E0F58A31}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadFromFile(const AFileName: WideString); stdcall;
    procedure RTFText(const AValue: WideString); stdcall;
    procedure ScrollBars(AValue: TRTFScrollBars); stdcall;
    procedure Color(AValue: TAlphaColor); stdcall;
    procedure Border(AValue: Boolean); stdcall;
    procedure AutoOpenLink(AValue: Boolean); stdcall;
    procedure OnLinkClick(Event: TRTFLinkClickEvent); stdcall;
    procedure Visible(AValue: Boolean); stdcall;
    procedure Enabled(AValue: Boolean); stdcall;
    procedure SetFocus; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFRTFViewer = class(TInterfacedObject, FRTFViewer)
  private
    FControl: TRTFViewerControl;
    function GetControl: TRTFViewerControl;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadFromFile(const AFileName: WideString); stdcall;
    procedure RTFText(const AValue: WideString); stdcall;
    procedure ScrollBars(AValue: TRTFScrollBars); stdcall;
    procedure Color(AValue: TAlphaColor); stdcall;
    procedure Border(AValue: Boolean); stdcall;
    procedure AutoOpenLink(AValue: Boolean); stdcall;
    procedure OnLinkClick(Event: TRTFLinkClickEvent); stdcall;
    procedure Visible(AValue: Boolean); stdcall;
    procedure Enabled(AValue: Boolean); stdcall;
    procedure SetFocus; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitRTFViewerHandle: FRTFViewer; stdcall;

implementation

uses
  System.Types, System.SysUtils;

// =============================================================================
// TFRTFViewer
// =============================================================================
function TFRTFViewer.GetControl: TRTFViewerControl;
begin
  if FControl = nil then
    raise Exception.Create
      ('RTF viewer has not been created. Call FCreate first');
  Result := FControl;
end;

procedure TFRTFViewer.FCreate(FParent: TFmxObject);
begin
  if FParent = nil then
    raise EArgumentNilException.Create('FParent');

  if FControl <> nil then
  begin
    FControl.Parent := nil;
    FControl.Free;
    FControl := nil;
  end;

  FControl := TRTFViewerControl.Create(nil);
  FControl.Parent := FParent;
end;

procedure TFRTFViewer.Left(FLeft: Single);
begin
  GetControl.Position.X := FLeft;
end;

procedure TFRTFViewer.Top(FTop: Single);
begin
  GetControl.Position.Y := FTop;
end;

procedure TFRTFViewer.Height(FHeight: Single);
begin
  GetControl.Height := FHeight;
end;

procedure TFRTFViewer.Width(FWidth: Single);
begin
  GetControl.Width := FWidth;
end;

procedure TFRTFViewer.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  GetControl.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRTFViewer.Position(X, Y: Single);
begin
  GetControl.Position.Point := PointF(X, Y);
end;

procedure TFRTFViewer.Align(Al: TAlignLayout);
begin
  GetControl.Align := Al;
end;

procedure TFRTFViewer.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  GetControl.Margins.Left := FLeft;
  GetControl.Margins.Top := FTop;
  GetControl.Margins.Right := FRight;
  GetControl.Margins.Bottom := FBottom;
end;

procedure TFRTFViewer.Padding(FLeft, FTop, FRight, FBottom: Single);
var
  LControl: TRTFViewerControl;
begin
  GetControl.Padding.Left := FLeft;
  GetControl.Padding.Top := FTop;
  GetControl.Padding.Right := FRight;
  GetControl.Padding.Bottom := FBottom;
  LControl := GetControl;
  LControl.UpdateDocumentWidth;
end;

procedure TFRTFViewer.SetClipParent(FValue: Boolean);
begin
  GetControl.ClipParent := FValue;
end;

procedure TFRTFViewer.SetClipChildren(FValue: Boolean);
begin
  GetControl.ClipChildren := FValue;
end;

procedure TFRTFViewer.BringToFront;
begin
  GetControl.BringToFront;
end;

procedure TFRTFViewer.SendToBack;
begin
  GetControl.SendToBack;
end;

procedure TFRTFViewer.SetTag(FTag: Integer);
begin
  GetControl.Tag := FTag;
end;

procedure TFRTFViewer.LoadFromFile(const AFileName: WideString);
begin
  GetControl.LoadFromFile(string(AFileName));
end;

procedure TFRTFViewer.RTFText(const AValue: WideString);
begin
  GetControl.SetRTFText(AValue);
end;

procedure TFRTFViewer.ScrollBars(AValue: TRTFScrollBars);
begin
  GetControl.ScrollBarsValue := AValue;
end;

procedure TFRTFViewer.Color(AValue: TAlphaColor);
begin
  GetControl.BackgroundColor := AValue;
end;

procedure TFRTFViewer.Border(AValue: Boolean);
begin
  GetControl.BorderVisible := AValue;
end;

procedure TFRTFViewer.AutoOpenLink(AValue: Boolean);
begin
  GetControl.AutoOpenLinks := AValue;
end;

procedure TFRTFViewer.OnLinkClick(Event: TRTFLinkClickEvent);
begin
  GetControl.OnLinkClickEvent := Event;
end;

procedure TFRTFViewer.Visible(AValue: Boolean);
begin
  GetControl.Visible := AValue;
end;

procedure TFRTFViewer.Enabled(AValue: Boolean);
begin
  GetControl.Enabled := AValue;
end;

procedure TFRTFViewer.SetFocus;
begin
  GetControl.SetFocus;
end;

function TFRTFViewer.GetTag: Integer;
begin
  Result := GetControl.Tag;
end;

function TFRTFViewer.GetLeft: Single;
begin
  Result := GetControl.Position.X;
end;

function TFRTFViewer.GetTop: Single;
begin
  Result := GetControl.Position.Y;
end;

function TFRTFViewer.GetWidth: Single;
begin
  Result := GetControl.Width;
end;

function TFRTFViewer.GetHeight: Single;
begin
  Result := GetControl.Height;
end;

function TFRTFViewer.GetObject: TFmxObject;
begin
  Result := GetControl;
end;

function TFRTFViewer.Handle: TFmxObject;
begin
  Result := GetControl;
end;

// =============================================================================
// Exports
// =============================================================================
function InitRTFViewerHandle: FRTFViewer;
begin
  Result := TFRTFViewer.Create;
end;

exports
  InitRTFViewerHandle;

end.
