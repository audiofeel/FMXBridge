
unit FMXBridge.SVGImage;

interface

uses
  System.UITypes, System.Classes,
  FMX.Types, FMX.SVG;

// =============================================================================
// FSVGImage
// =============================================================================
type
  FSVGImage = interface(IUnknown)
    ['{B4FD7C5A-F768-488D-A5AD-1FB4DCE05FA7}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadFromFile(const FileName: WideString); stdcall;
    procedure LoadFromText(const FText: WideString); stdcall;
    procedure SetFocus; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSVGImage = class(TInterfacedObject, FSVGImage)
  private
    ControlSVGImage: TSVGRender;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadFromFile(const FileName: WideString); stdcall;
    procedure LoadFromText(const FText: WideString); stdcall;
    procedure SetFocus; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitSVGImageHandle: FSVGImage; stdcall;

implementation

uses
  System.SysUtils, System.IOUtils;

procedure TFSVGImage.FCreate(FParent: TFmxObject);
begin
  ControlSVGImage := TSVGRender.Create(nil);
  ControlSVGImage.Parent := TFmxObject(FParent);
end;

procedure TFSVGImage.Cursor(FCursor: TCursor);
begin
  ControlSVGImage.Cursor := TCursor(FCursor);
end;

procedure TFSVGImage.Left(FLeft: Single);
begin
  ControlSVGImage.Position.X := FLeft;
end;

procedure TFSVGImage.Top(FTop: Single);
begin
  ControlSVGImage.Position.Y := FTop;
end;

procedure TFSVGImage.Height(FHeight: Single);
begin
  ControlSVGImage.Size.Height := FHeight;
end;

procedure TFSVGImage.Width(FWidth: Single);
begin
  ControlSVGImage.Size.Width := FWidth;
end;

procedure TFSVGImage.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlSVGImage.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFSVGImage.Position(X, Y: Single);
begin
  ControlSVGImage.Position.X := X;
  ControlSVGImage.Position.Y := Y;
end;

procedure TFSVGImage.Align(Al: TAlignLayout);
begin
  ControlSVGImage.Align := TAlignLayout(Al);
end;

procedure TFSVGImage.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSVGImage.Margins.Left := FLeft;
  ControlSVGImage.Margins.Top := FTop;
  ControlSVGImage.Margins.Right := FRight;
  ControlSVGImage.Margins.Bottom := FBottom;
end;

procedure TFSVGImage.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSVGImage.Padding.Left := FLeft;
  ControlSVGImage.Padding.Top := FTop;
  ControlSVGImage.Padding.Right := FRight;
  ControlSVGImage.Padding.Bottom := FBottom;
end;

procedure TFSVGImage.SetHint(const FText: WideString);
begin
  ControlSVGImage.ShowHint := True;
  ControlSVGImage.Hint := string(FText);
end;

procedure TFSVGImage.SetClipChildren(FValue: Boolean);
begin
  ControlSVGImage.ClipChildren := FValue;
end;

procedure TFSVGImage.SetClipParent(FValue: Boolean);
begin
  ControlSVGImage.ClipParent := FValue;
end;

procedure TFSVGImage.BringToFront;
begin
  ControlSVGImage.BringToFront;
end;

procedure TFSVGImage.SendToBack;
begin
  ControlSVGImage.SendToBack;
end;

procedure TFSVGImage.SetTag(FTag: Integer);
begin
  ControlSVGImage.Tag := FTag;
end;

procedure TFSVGImage.LoadFromFile(const FileName: WideString);
begin
  try
    ControlSVGImage.SVG := TFile.ReadAllText(string(FileName));
  except
    on E: Exception do
    begin
      // TO DO
    end;
  end;
end;

procedure TFSVGImage.LoadFromText(const FText: WideString);
begin
  try
    ControlSVGImage.SVG := string(FText);
  except
    on E: Exception do
    begin
      // TO DO
    end;
  end;
end;

procedure TFSVGImage.SetFocus;
begin
  ControlSVGImage.SetFocus;
end;

procedure TFSVGImage.CanFocus(FValue: Boolean);
begin
  ControlSVGImage.CanFocus := FValue;
end;

procedure TFSVGImage.Opacity(FOpacity: Single);
begin
  ControlSVGImage.Opacity := FOpacity;
end;

procedure TFSVGImage.RotationAngle(FValue: Single);
begin
  ControlSVGImage.RotationAngle := FValue;
end;

procedure TFSVGImage.RotationCenter(X, Y: Single);
begin
  ControlSVGImage.RotationCenter.X := X;
  ControlSVGImage.RotationCenter.Y := Y;
end;

procedure TFSVGImage.Enabled(FEnabled: Boolean);
begin
  ControlSVGImage.Enabled := FEnabled;
end;

procedure TFSVGImage.Visible(FVisible: Boolean);
begin
  ControlSVGImage.Visible := FVisible;
end;

procedure TFSVGImage.HitTest(FEnabled: Boolean);
begin
  ControlSVGImage.HitTest := FEnabled;
end;

function TFSVGImage.IsVisible: Boolean;
begin
  Result := ControlSVGImage.Visible;
end;

function TFSVGImage.GetTag: Integer;
begin
  Result := ControlSVGImage.Tag;
end;

function TFSVGImage.GetLeft: Single;
begin
  Result := ControlSVGImage.Position.X;
end;

function TFSVGImage.GetTop: Single;
begin
  Result := ControlSVGImage.Position.Y;
end;

function TFSVGImage.GetHeight: Single;
begin
  Result := ControlSVGImage.Size.Height;
end;

function TFSVGImage.GetWidth: Single;
begin
  Result := ControlSVGImage.Size.Width;
end;

function TFSVGImage.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlSVGImage);
end;

procedure TFSVGImage.OnClick(Event: TNotifyEvent);
begin
  ControlSVGImage.OnClick := TNotifyEvent(Event);
end;

procedure TFSVGImage.OnMouseDown(Event: TMouseEvent);
begin
  ControlSVGImage.OnMouseDown := TMouseEvent(Event);
end;

procedure TFSVGImage.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSVGImage.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSVGImage.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSVGImage.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFSVGImage.OnMouseUp(Event: TMouseEvent);
begin
  ControlSVGImage.OnMouseUp := TMouseEvent(Event);
end;

function TFSVGImage.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlSVGImage);
end;

// =============================================================================
// Exports
// =============================================================================
function InitSVGImageHandle: FSVGImage;
begin
  Result := TFSVGImage.Create;
end;

exports
  InitSVGImageHandle;

end.
