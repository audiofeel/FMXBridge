
unit FMXBridge.GIFImage;

interface

uses
  System.UITypes, System.Classes,
  FMX.Types, FMX.Objects, FMX.GIFImage;

// =============================================================================
// FGIFImage
// =============================================================================
type
  FGIFImage = interface(IUnknown)
    ['{3E84915C-CD9D-4FFC-92AB-9CC1BFE2325E}']
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
    procedure LoadFromFile(const GifImgFile: WideString); stdcall;
    procedure WrapMode(FWrapMode: TImageWrapMode); stdcall;
    procedure Play; stdcall;
    procedure Stop; stdcall;
    procedure Pause; stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure Speed(FSpeed: Single); stdcall;
    procedure SetActiveFrameIndex(FIndex: Integer); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsPlaying: Boolean; stdcall;
    function GetFrameCount: Integer; stdcall;
    function GetActiveFrameIndex: Integer; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFGIFImage = class(TInterfacedObject, FGIFImage)
  private
    ControlGIFImage: TGIFImage;
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
    procedure LoadFromFile(const GifImgFile: WideString); stdcall;
    procedure WrapMode(FWrapMode: TImageWrapMode); stdcall;
    procedure Play; stdcall;
    procedure Stop; stdcall;
    procedure Pause; stdcall;
    procedure Loop(FLoop: Boolean); stdcall;
    procedure Speed(FSpeed: Single); stdcall;
    procedure SetActiveFrameIndex(FIndex: Integer); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsPlaying: Boolean; stdcall;
    function GetFrameCount: Integer; stdcall;
    function GetActiveFrameIndex: Integer; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
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
function InitGIFImageHandle: FGIFImage; stdcall;

implementation

// =============================================================================
// FGIFImage
// =============================================================================
procedure TFGIFImage.FCreate(FParent: TFmxObject);
begin
  ControlGIFImage := TGIFImage.Create(nil);
  ControlGIFImage.Parent := TFmxObject(FParent);
end;

procedure TFGIFImage.Cursor(FCursor: TCursor);
begin
  ControlGIFImage.Cursor := TCursor(FCursor);
end;

procedure TFGIFImage.Left(FLeft: Single);
begin
  ControlGIFImage.Position.X := FLeft;
end;

procedure TFGIFImage.Top(FTop: Single);
begin
  ControlGIFImage.Position.Y := FTop;
end;

procedure TFGIFImage.Height(FHeight: Single);
begin
  ControlGIFImage.Size.Height := FHeight;
end;

procedure TFGIFImage.Width(FWidth: Single);
begin
  ControlGIFImage.Size.Width := FWidth;
end;

procedure TFGIFImage.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlGIFImage.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFGIFImage.Position(X, Y: Single);
begin
  ControlGIFImage.Position.X := X;
  ControlGIFImage.Position.Y := Y;
end;

procedure TFGIFImage.Align(Al: TAlignLayout);
begin
  ControlGIFImage.Align := TAlignLayout(Al);
end;

procedure TFGIFImage.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGIFImage.Margins.Left := FLeft;
  ControlGIFImage.Margins.Top := FTop;
  ControlGIFImage.Margins.Right := FRight;
  ControlGIFImage.Margins.Bottom := FBottom;
end;

procedure TFGIFImage.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlGIFImage.Padding.Left := FLeft;
  ControlGIFImage.Padding.Top := FTop;
  ControlGIFImage.Padding.Right := FRight;
  ControlGIFImage.Padding.Bottom := FBottom;
end;

procedure TFGIFImage.SetHint(const FText: WideString);
begin
  ControlGIFImage.ShowHint := True;
  ControlGIFImage.Hint := string(FText);
end;

procedure TFGIFImage.SetClipChildren(FValue: Boolean);
begin
  ControlGIFImage.ClipChildren := FValue;
end;

procedure TFGIFImage.SetClipParent(FValue: Boolean);
begin
  ControlGIFImage.ClipParent := FValue;
end;

procedure TFGIFImage.BringToFront;
begin
  ControlGIFImage.BringToFront;
end;

procedure TFGIFImage.SendToBack;
begin
  ControlGIFImage.SendToBack;
end;

procedure TFGIFImage.SetTag(FTag: Integer);
begin
  ControlGIFImage.Tag := FTag;
end;

procedure TFGIFImage.LoadFromFile(const GifImgFile: WideString);
begin
  ControlGIFImage.LoadFromFile(string(GifImgFile));

  if ControlGIFImage.GIFData <> nil then
    ControlGIFImage.Play;
end;

procedure TFGIFImage.WrapMode(FWrapMode: TImageWrapMode);
begin
  ControlGIFImage.WrapMode := TImageWrapMode(FWrapMode);
end;

procedure TFGIFImage.Play;
begin
  ControlGIFImage.Play;
end;

procedure TFGIFImage.Stop;
begin
  ControlGIFImage.Stop;
end;

procedure TFGIFImage.Pause;
begin
  ControlGIFImage.IsPlaying := False;
end;

procedure TFGIFImage.Loop(FLoop: Boolean);
begin
  ControlGIFImage.Loop := FLoop;
end;

procedure TFGIFImage.Speed(FSpeed: Single);
begin
  if FSpeed <= 0 then
    FSpeed := 1;
  ControlGIFImage.Speed := FSpeed;
end;

procedure TFGIFImage.SetActiveFrameIndex(FIndex: Integer);
begin
  ControlGIFImage.ActiveFrame := FIndex;
end;

procedure TFGIFImage.Opacity(FOpacity: Single);
begin
  ControlGIFImage.Opacity := FOpacity;
end;

procedure TFGIFImage.RotationAngle(FValue: Single);
begin
  ControlGIFImage.RotationAngle := FValue;
end;

procedure TFGIFImage.RotationCenter(X, Y: Single);
begin
  ControlGIFImage.RotationCenter.X := X;
  ControlGIFImage.RotationCenter.Y := Y;
end;

procedure TFGIFImage.Enabled(FEnabled: Boolean);
begin
  ControlGIFImage.Enabled := FEnabled;
end;

procedure TFGIFImage.Visible(FVisible: Boolean);
begin
  ControlGIFImage.Visible := FVisible;
end;

procedure TFGIFImage.HitTest(FEnabled: Boolean);
begin
  ControlGIFImage.HitTest := FEnabled;
end;

function TFGIFImage.IsPlaying: Boolean;
begin
  Result := ControlGIFImage.IsPlaying;
end;

function TFGIFImage.GetFrameCount: Integer;
begin
  if (ControlGIFImage.GIFData <> nil) then
    Result := ControlGIFImage.GIFData.FrameCount
  else
    Result := 0;
end;

function TFGIFImage.GetActiveFrameIndex: Integer;
begin
  Result := ControlGIFImage.ActiveFrame;
end;

function TFGIFImage.GetTag: Integer;
begin
  Result := ControlGIFImage.Tag;
end;

function TFGIFImage.GetLeft: Single;
begin
  Result := ControlGIFImage.Position.X;
end;

function TFGIFImage.GetTop: Single;
begin
  Result := ControlGIFImage.Position.Y;
end;

function TFGIFImage.GetHeight: Single;
begin
  Result := ControlGIFImage.Size.Height;
end;

function TFGIFImage.GetWidth: Single;
begin
  Result := ControlGIFImage.Size.Width;
end;

function TFGIFImage.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlGIFImage);
end;

procedure TFGIFImage.OnClick(Event: TNotifyEvent);
begin
  ControlGIFImage.OnClick := TNotifyEvent(Event);
end;

procedure TFGIFImage.OnMouseDown(Event: TMouseEvent);
begin
  ControlGIFImage.OnMouseDown := TMouseEvent(Event);
end;

procedure TFGIFImage.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlGIFImage.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFGIFImage.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlGIFImage.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFGIFImage.OnMouseUp(Event: TMouseEvent);
begin
  ControlGIFImage.OnMouseUp := TMouseEvent(Event);
end;

function TFGIFImage.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlGIFImage);
end;

// =============================================================================
// Exports
// =============================================================================
function InitGIFImageHandle: FGIFImage;
begin
  Result := TFGIFImage.Create;
end;

exports
  InitGIFImageHandle;

end.
