
unit FMXBridge.Colors;

interface

uses
  System.UITypes, System.Classes,
  FMX.Types, FMX.Controls, FMX.Colors, FMX.Pickers;

// =============================================================================
// FComboColorBox
// =============================================================================
type
  FComboColorBox = interface(IUnknown)
    ['{0CD24B22-FFFA-4A9C-B3AC-9141E304560D}']
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
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure UseAlpha(FValue: Boolean); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetColor: TAlphaColor; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFComboColorBox = class(TInterfacedObject, FComboColorBox)
  private
    ControlComboColorBox: TComboColorBox;
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
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure UseAlpha(FValue: Boolean); stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    function IsVisible: Boolean; stdcall;
    function GetColor: TAlphaColor; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FColorComboBox
// =============================================================================
type
  FColorComboBox = interface(IUnknown)
    ['{A3356F52-1C9D-4D26-A6D0-A68968BD60AB}']
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
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure ItemIndex(FValue: Integer); stdcall;
    procedure ItemWidth(FValue: Single); stdcall;
    procedure ItemHeight(FValue: Single); stdcall;
    procedure DropDownCount(FValue: Integer); stdcall;
    procedure DropDownKind(FValue: TDropDownKind); stdcall;
    procedure Placement(FValue: TPlacement); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetColor: TAlphaColor; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFColorComboBox = class(TInterfacedObject, FColorComboBox)
  private
    ControlColorComboBox: TColorComboBox;
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
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure ItemIndex(FValue: Integer); stdcall;
    procedure ItemWidth(FValue: Single); stdcall;
    procedure ItemHeight(FValue: Single); stdcall;
    procedure DropDownCount(FValue: Integer); stdcall;
    procedure DropDownKind(FValue: TDropDownKind); stdcall;
    procedure Placement(FValue: TPlacement); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetColor: TAlphaColor; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
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
function InitComboColorBoxHandle: FComboColorBox; stdcall;
function InitColorComboBoxHandle: FColorComboBox; stdcall;

implementation

// =============================================================================
// FComboColorBox
// =============================================================================
procedure TFComboColorBox.FCreate(FParent: TFmxObject);
begin
  ControlComboColorBox := TComboColorBox.Create(nil);
  ControlComboColorBox.Parent := FParent;
end;

procedure TFComboColorBox.Cursor(FCursor: TCursor);
begin
  ControlComboColorBox.Cursor := TCursor(FCursor);
end;

procedure TFComboColorBox.Left(FLeft: Single);
begin
  ControlComboColorBox.Position.X := FLeft;
end;

procedure TFComboColorBox.Top(FTop: Single);
begin
  ControlComboColorBox.Position.Y := FTop;
end;

procedure TFComboColorBox.Height(FHeight: Single);
begin
  ControlComboColorBox.Size.Height := FHeight;
end;

procedure TFComboColorBox.Width(FWidth: Single);
begin
  ControlComboColorBox.Size.Width := FWidth;
end;

procedure TFComboColorBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlComboColorBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFComboColorBox.Position(X, Y: Single);
begin
  ControlComboColorBox.Position.X := X;
  ControlComboColorBox.Position.Y := Y;
end;

procedure TFComboColorBox.Align(Al: TAlignLayout);
begin
  ControlComboColorBox.Align := TAlignLayout(Al);
end;

procedure TFComboColorBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlComboColorBox.Margins.Left := FLeft;
  ControlComboColorBox.Margins.Top := FTop;
  ControlComboColorBox.Margins.Right := FRight;
  ControlComboColorBox.Margins.Bottom := FBottom;
end;

procedure TFComboColorBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlComboColorBox.Padding.Left := FLeft;
  ControlComboColorBox.Padding.Top := FTop;
  ControlComboColorBox.Padding.Right := FRight;
  ControlComboColorBox.Padding.Bottom := FBottom;
end;

procedure TFComboColorBox.SetHint(const FText: WideString);
begin
  ControlComboColorBox.ShowHint := True;
  ControlComboColorBox.Hint := string(FText);
end;

procedure TFComboColorBox.SetClipChildren(FValue: Boolean);
begin
  ControlComboColorBox.ClipChildren := FValue;
end;

procedure TFComboColorBox.SetClipParent(FValue: Boolean);
begin
  ControlComboColorBox.ClipParent := FValue;
end;

procedure TFComboColorBox.BringToFront;
begin
  ControlComboColorBox.BringToFront;
end;

procedure TFComboColorBox.SendToBack;
begin
  ControlComboColorBox.SendToBack;
end;

procedure TFComboColorBox.SetTag(FTag: Integer);
begin
  ControlComboColorBox.Tag := FTag;
end;

procedure TFComboColorBox.Color(FColor: TAlphaColor);
begin
  ControlComboColorBox.Color := TAlphaColor(FColor);
end;

procedure TFComboColorBox.UseAlpha(FValue: Boolean);
begin
  ControlComboColorBox.UseAlpha := FValue;
end;

procedure TFComboColorBox.BeginUpdate;
begin
  ControlComboColorBox.BeginUpdate;
end;

procedure TFComboColorBox.EndUpdate;
begin
  ControlComboColorBox.EndUpdate;
end;

function TFComboColorBox.IsVisible: Boolean;
begin
  Result := ControlComboColorBox.Visible;
end;

function TFComboColorBox.GetColor: TAlphaColor;
begin
  Result := ControlComboColorBox.Color;
end;

function TFComboColorBox.GetTag: Integer;
begin
  Result := ControlComboColorBox.Tag;
end;

function TFComboColorBox.GetLeft: Single;
begin
  Result := ControlComboColorBox.Position.X;
end;

function TFComboColorBox.GetTop: Single;
begin
  Result := ControlComboColorBox.Position.Y;
end;

function TFComboColorBox.GetHeight: Single;
begin
  Result := ControlComboColorBox.Size.Height;
end;

function TFComboColorBox.GetWidth: Single;
begin
  Result := ControlComboColorBox.Size.Width;
end;

function TFComboColorBox.GetObject: TFmxObject;
begin
  Result := ControlComboColorBox;
end;

procedure TFComboColorBox.OnChange(Event: TNotifyEvent);
begin
  ControlComboColorBox.OnChange := TNotifyEvent(Event);
end;

procedure TFComboColorBox.OnClick(Event: TNotifyEvent);
begin
  ControlComboColorBox.OnClick := TNotifyEvent(Event);
end;

procedure TFComboColorBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlComboColorBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFComboColorBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlComboColorBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFComboColorBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlComboColorBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFComboColorBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlComboColorBox.OnMouseUp := TMouseEvent(Event);
end;

function TFComboColorBox.Handle: TFmxObject;
begin
  Result := ControlComboColorBox;
end;

// =============================================================================
// FColorComboBox
// =============================================================================
procedure TFColorComboBox.FCreate(FParent: TFmxObject);
begin
  ControlColorComboBox := TColorComboBox.Create(nil);
  ControlColorComboBox.Parent := FParent;
end;

procedure TFColorComboBox.Cursor(FCursor: TCursor);
begin
  ControlColorComboBox.Cursor := TCursor(FCursor);
end;

procedure TFColorComboBox.Left(FLeft: Single);
begin
  ControlColorComboBox.Position.X := FLeft;
end;

procedure TFColorComboBox.Top(FTop: Single);
begin
  ControlColorComboBox.Position.Y := FTop;
end;

procedure TFColorComboBox.Height(FHeight: Single);
begin
  ControlColorComboBox.Size.Height := FHeight;
end;

procedure TFColorComboBox.Width(FWidth: Single);
begin
  ControlColorComboBox.Size.Width := FWidth;
end;

procedure TFColorComboBox.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlColorComboBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFColorComboBox.Position(X, Y: Single);
begin
  ControlColorComboBox.Position.X := X;
  ControlColorComboBox.Position.Y := Y;
end;

procedure TFColorComboBox.Align(Al: TAlignLayout);
begin
  ControlColorComboBox.Align := TAlignLayout(Al);
end;

procedure TFColorComboBox.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlColorComboBox.Margins.Left := FLeft;
  ControlColorComboBox.Margins.Top := FTop;
  ControlColorComboBox.Margins.Right := FRight;
  ControlColorComboBox.Margins.Bottom := FBottom;
end;

procedure TFColorComboBox.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlColorComboBox.Padding.Left := FLeft;
  ControlColorComboBox.Padding.Top := FTop;
  ControlColorComboBox.Padding.Right := FRight;
  ControlColorComboBox.Padding.Bottom := FBottom;
end;

procedure TFColorComboBox.SetHint(const FText: WideString);
begin
  ControlColorComboBox.ShowHint := True;
  ControlColorComboBox.Hint := string(FText);
end;

procedure TFColorComboBox.SetClipChildren(FValue: Boolean);
begin
  ControlColorComboBox.ClipChildren := FValue;
end;

procedure TFColorComboBox.SetClipParent(FValue: Boolean);
begin
  ControlColorComboBox.ClipParent := FValue;
end;

procedure TFColorComboBox.BringToFront;
begin
  ControlColorComboBox.BringToFront;
end;

procedure TFColorComboBox.SendToBack;
begin
  ControlColorComboBox.SendToBack;
end;

procedure TFColorComboBox.SetTag(FTag: Integer);
begin
  ControlColorComboBox.Tag := FTag;
end;

procedure TFColorComboBox.Color(FColor: TAlphaColor);
begin
  ControlColorComboBox.Color := TAlphaColor(FColor);
end;

procedure TFColorComboBox.ItemIndex(FValue: Integer);
begin
  ControlColorComboBox.ItemIndex := FValue;
end;

procedure TFColorComboBox.ItemWidth(FValue: Single);
begin
  ControlColorComboBox.ItemWidth := FValue;
end;

procedure TFColorComboBox.ItemHeight(FValue: Single);
begin
  ControlColorComboBox.ItemHeight := FValue;
end;

procedure TFColorComboBox.DropDownCount(FValue: Integer);
begin
  ControlColorComboBox.DropDownCount := FValue;
end;

procedure TFColorComboBox.DropDownKind(FValue: TDropDownKind);
begin
  ControlColorComboBox.DropDownKind := TDropDownKind(FValue);
end;

procedure TFColorComboBox.Placement(FValue: TPlacement);
begin
  ControlColorComboBox.Placement := TPlacement(FValue);
end;

function TFColorComboBox.IsVisible: Boolean;
begin
  Result := ControlColorComboBox.Visible;
end;

function TFColorComboBox.GetColor: TAlphaColor;
begin
  Result := ControlColorComboBox.Color;
end;

function TFColorComboBox.GetTag: Integer;
begin
  Result := ControlColorComboBox.Tag;
end;

function TFColorComboBox.GetLeft: Single;
begin
  Result := ControlColorComboBox.Position.X;
end;

function TFColorComboBox.GetTop: Single;
begin
  Result := ControlColorComboBox.Position.Y;
end;

function TFColorComboBox.GetHeight: Single;
begin
  Result := ControlColorComboBox.Size.Height;
end;

function TFColorComboBox.GetWidth: Single;
begin
  Result := ControlColorComboBox.Size.Width;
end;

function TFColorComboBox.GetObject: TFmxObject;
begin
  Result := ControlColorComboBox;
end;

procedure TFColorComboBox.OnChange(Event: TNotifyEvent);
begin
  ControlColorComboBox.OnChange := TNotifyEvent(Event);
end;

procedure TFColorComboBox.OnClick(Event: TNotifyEvent);
begin
  ControlColorComboBox.OnClick := TNotifyEvent(Event);
end;

procedure TFColorComboBox.OnMouseDown(Event: TMouseEvent);
begin
  ControlColorComboBox.OnMouseDown := TMouseEvent(Event);
end;

procedure TFColorComboBox.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlColorComboBox.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFColorComboBox.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlColorComboBox.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFColorComboBox.OnMouseUp(Event: TMouseEvent);
begin
  ControlColorComboBox.OnMouseUp := TMouseEvent(Event);
end;

function TFColorComboBox.Handle: TFmxObject;
begin
  Result := ControlColorComboBox;
end;

// =============================================================================
// Exports
// =============================================================================
function InitComboColorBoxHandle: FComboColorBox;
begin
  Result := TFComboColorBox.Create;
end;

function InitColorComboBoxHandle: FColorComboBox;
begin
  Result := TFColorComboBox.Create;
end;

exports
  InitComboColorBoxHandle,
  InitColorComboBoxHandle;

end.
