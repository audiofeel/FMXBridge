
unit FMXBridge.WebPImage;

interface

uses
  System.UITypes, System.SysUtils, System.Classes,
  FMX.Types, FMX.Controls, FMX.Objects, FMX.ImgList, FMX.Ani,
  WebPAnimated;

// =============================================================================
// FWebPImage
// =============================================================================
type
  TWebPAnimationClock = class(TAnimation)
  protected
    procedure ProcessAnimation; override;
  end;

  FWebPImage = interface(IUnknown)
    ['{B7A6B8C2-0C17-4E7F-9B63-5CCB6DF4B7A1}']
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
    procedure LoadPicture(const AFileName: WideString;
      WrapMode: TImageWrapMode); stdcall;
    procedure LoadPictureFromImgList(const FIndex: Integer;
      FImgList: TImageList); stdcall;
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Stop; stdcall;
    procedure SetFrameIndex(AIndex: Integer); stdcall;
    procedure SetAutoPlay(AValue: Boolean); stdcall;
    procedure OnFrame(Event: TNotifyEvent); stdcall;
    procedure Opacity(FValue: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FValue: Boolean); stdcall;
    procedure HitTest(FValue: Boolean); stdcall;
    function IsPlaying: Boolean; stdcall;
    function GetFrameCount: Integer; stdcall;
    function GetFrameIndex: Integer; stdcall;
    function GetFrameDuration: Integer; stdcall;
    function GetLoopCount: Integer; stdcall;
    function GetCurrentLoop: Integer; stdcall;
    function GetAutoPlay: Boolean; stdcall;
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

  TFWebPImage = class(TInterfacedObject, FWebPImage)
  private
    ControlImage: TImage;
    Animation: TFMXWebPAnimation;
    AnimationClock: TWebPAnimationClock;
    FFrameIndex: Integer;
    FCurrentLoop: Integer;
    FAutoPlay: Boolean;
    FOnFrame: TNotifyEvent;
    procedure AnimationProcess(Sender: TObject);
    procedure ShowFrame(AIndex: Integer);
    procedure StartAnimation;
    procedure ClearAnimation;
  public
    constructor Create;
    destructor Destroy; override;

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
    procedure LoadPicture(const AFileName: WideString;
      WrapMode: TImageWrapMode); stdcall;
    procedure LoadPictureFromImgList(const FIndex: Integer;
      FImgList: TImageList); stdcall;
    procedure Play; stdcall;
    procedure Pause; stdcall;
    procedure Stop; stdcall;
    procedure SetFrameIndex(AIndex: Integer); stdcall;
    procedure SetAutoPlay(AValue: Boolean); stdcall;
    procedure OnFrame(Event: TNotifyEvent); stdcall;
    procedure Opacity(FValue: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FValue: Boolean); stdcall;
    procedure HitTest(FValue: Boolean); stdcall;
    function IsPlaying: Boolean; stdcall;
    function GetFrameCount: Integer; stdcall;
    function GetFrameIndex: Integer; stdcall;
    function GetFrameDuration: Integer; stdcall;
    function GetLoopCount: Integer; stdcall;
    function GetCurrentLoop: Integer; stdcall;
    function GetAutoPlay: Boolean; stdcall;
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
// Export
// =============================================================================
function InitWebPImageHandle: FWebPImage; stdcall;

implementation

uses
  WebPCodec;

constructor TFWebPImage.Create;
begin
  inherited Create;

  ControlImage := nil;
  Animation := nil;
  AnimationClock := nil;

  FFrameIndex := 0;
  FCurrentLoop := 0;
  FAutoPlay := True;
  FOnFrame := nil;
end;

destructor TFWebPImage.Destroy;
begin
  ClearAnimation;

  AnimationClock.Free;

  inherited;
end;

procedure TFWebPImage.ClearAnimation;
begin
  if AnimationClock <> nil then
    AnimationClock.Stop;

  FreeAndNil(Animation);

  FFrameIndex := 0;
  FCurrentLoop := 0;
end;

procedure TFWebPImage.FCreate(FParent: TFmxObject);
begin
  ControlImage := TImage.Create(nil);
  ControlImage.Parent := TFmxObject(FParent);

  AnimationClock := TWebPAnimationClock.Create(ControlImage);
  AnimationClock.Parent := ControlImage;
  AnimationClock.Duration := 10000;
  AnimationClock.Loop := True;
  AnimationClock.OnProcess := AnimationProcess;
end;

procedure TWebPAnimationClock.ProcessAnimation;
begin
//
end;

procedure TFWebPImage.Cursor(FCursor: TCursor);
begin
  ControlImage.Cursor := TCursor(FCursor);
end;

procedure TFWebPImage.Left(FLeft: Single);
begin
  ControlImage.Position.X := FLeft;
end;

procedure TFWebPImage.Top(FTop: Single);
begin
  ControlImage.Position.Y := FTop;
end;

procedure TFWebPImage.Height(FHeight: Single);
begin
  ControlImage.Size.Height := FHeight;
end;

procedure TFWebPImage.Width(FWidth: Single);
begin
  ControlImage.Size.Width := FWidth;
end;

procedure TFWebPImage.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlImage.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFWebPImage.Position(X, Y: Single);
begin
  ControlImage.Position.X := X;
  ControlImage.Position.Y := Y;
end;

procedure TFWebPImage.Align(Al: TAlignLayout);
begin
  ControlImage.Align := TAlignLayout(Al);
end;

procedure TFWebPImage.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImage.Margins.Left := FLeft;
  ControlImage.Margins.Top := FTop;
  ControlImage.Margins.Right := FRight;
  ControlImage.Margins.Bottom := FBottom;
end;

procedure TFWebPImage.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImage.Padding.Left := FLeft;
  ControlImage.Padding.Top := FTop;
  ControlImage.Padding.Right := FRight;
  ControlImage.Padding.Bottom := FBottom;
end;

procedure TFWebPImage.SetHint(const FText: WideString);
begin
  ControlImage.ShowHint := True;
  ControlImage.Hint := string(FText);
end;

procedure TFWebPImage.SetClipParent(FValue: Boolean);
begin
  ControlImage.ClipParent := FValue;
end;

procedure TFWebPImage.SetClipChildren(FValue: Boolean);
begin
  ControlImage.ClipChildren := FValue;
end;

procedure TFWebPImage.BringToFront;
begin
  ControlImage.BringToFront;
end;

procedure TFWebPImage.SendToBack;
begin
  ControlImage.SendToBack;
end;

procedure TFWebPImage.SetTag(FTag: Integer);
begin
  ControlImage.Tag := FTag;
end;

procedure TFWebPImage.ShowFrame(AIndex: Integer);
begin
  if Animation = nil then
    Exit;

  if (AIndex < 0) or (AIndex >= Animation.FrameCount) then
    Exit;

  FFrameIndex := AIndex;

  ControlImage.Bitmap.Assign(Animation.Frames[FFrameIndex]);

  if Assigned(FOnFrame) then
    FOnFrame(Self);
end;

procedure TFWebPImage.AnimationProcess(Sender: TObject);
var
  TimeMS: Integer;
  NewIndex: Integer;
begin
  if (Animation = nil) or (Animation.FrameCount <= 1) then
    Exit;

  TimeMS := Round(AnimationClock.CurrentTime * 1000);

  NewIndex := Animation.FrameAtTime(TimeMS);

  if (NewIndex >= 0) and (NewIndex <> FFrameIndex) then
    ShowFrame(NewIndex);
end;

procedure TFWebPImage.StartAnimation;
var
  Duration: Single;
begin
  if (AnimationClock = nil) or (Animation = nil) or
     (Animation.FrameCount <= 1) then
    Exit;

  Duration := Animation.TotalDuration / 1000;

  if Duration <= 0 then
    Exit;

  AnimationClock.Duration := Duration;
  AnimationClock.Loop := True;
  AnimationClock.Start;
end;

procedure TFWebPImage.LoadPicture(const AFileName: WideString;
  WrapMode: TImageWrapMode);
begin
  if ControlImage = nil then
    Exit;

  ClearAnimation;

  if AFileName = '' then
    Exit;

  Animation := TFMXWebPAnimation.Create;
  Animation.LoadFromFile(string(AFileName));

  ControlImage.WrapMode := WrapMode;

  if Animation.FrameCount = 0 then
    Exit;

  FFrameIndex := 0;
  FCurrentLoop := 0;

  ShowFrame(0);

  if FAutoPlay and (Animation.FrameCount > 1) then
    StartAnimation;
end;

procedure TFWebPImage.LoadPictureFromImgList(const FIndex: Integer;
  FImgList: TImageList);
begin
  ClearAnimation;

  FImgList := TImageList(FImgList);

  if (FImgList = nil) or (FIndex < 0) or (FIndex >= FImgList.Source.Count) then
    Exit;

  if FImgList.Source.Items[FIndex].MultiResBitmap.Count = 0 then
    Exit;

  ControlImage.Bitmap.Assign(
    FImgList.Source.Items[FIndex].MultiResBitmap.Items[0].Bitmap);
end;

procedure TFWebPImage.Play;
begin
  if (Animation = nil) or
     (Animation.FrameCount <= 1) then
    Exit;

  if AnimationClock.Pause then
  begin
    AnimationClock.Pause := False;
    Exit;
  end;

  StartAnimation;
end;

procedure TFWebPImage.Pause;
begin
  if AnimationClock <> nil then
    AnimationClock.Pause := True;
end;

procedure TFWebPImage.Stop;
begin
  if AnimationClock <> nil then
    AnimationClock.Stop;

  FCurrentLoop := 0;

  if (Animation <> nil) and (Animation.FrameCount > 0) then
    ShowFrame(0)
  else
  begin
    FFrameIndex := 0;

    if Assigned(FOnFrame) then
      FOnFrame(Self);
  end;
end;

procedure TFWebPImage.SetFrameIndex(AIndex: Integer);
begin
  if Animation = nil then
    Exit;

  if (AIndex < 0) or
     (AIndex >= Animation.FrameCount) then
    Exit;

  ShowFrame(AIndex);
end;

procedure TFWebPImage.SetAutoPlay(AValue: Boolean);
begin
  FAutoPlay := AValue;

  if not FAutoPlay then
    Pause;
end;

procedure TFWebPImage.OnFrame(Event: TNotifyEvent);
begin
  FOnFrame := Event;
end;

procedure TFWebPImage.Opacity(FValue: Single);
begin
  ControlImage.Opacity := FValue;
end;

procedure TFWebPImage.RotationAngle(FValue: Single);
begin
  ControlImage.RotationAngle := FValue;
end;

procedure TFWebPImage.RotationCenter(X, Y: Single);
begin
  ControlImage.RotationCenter.X := X;
  ControlImage.RotationCenter.Y := Y;
end;

procedure TFWebPImage.Enabled(FEnabled: Boolean);
begin
  ControlImage.Enabled := FEnabled;
end;

procedure TFWebPImage.Visible(FValue: Boolean);
begin
  ControlImage.Visible := FValue;
end;

procedure TFWebPImage.HitTest(FValue: Boolean);
begin
  ControlImage.HitTest := FValue;
end;

function TFWebPImage.IsPlaying: Boolean;
begin
  Result := (AnimationClock <> nil) and AnimationClock.Enabled;
end;

function TFWebPImage.GetFrameCount: Integer;
begin
  Result := Animation.FrameCount;
end;

function TFWebPImage.GetFrameIndex: Integer;
begin
  Result := FFrameIndex;
end;

function TFWebPImage.GetFrameDuration: Integer;
begin
  if Animation = nil then
    Exit(0);

  if (FFrameIndex < 0) or (FFrameIndex >= Animation.FrameCount) then
    Exit(0);

  Result := Animation.Durations[FFrameIndex];
end;

function TFWebPImage.GetLoopCount: Integer;
begin
  if Animation = nil then
    Exit(0);

  Result := Animation.LoopCount;
end;

function TFWebPImage.GetCurrentLoop: Integer;
begin
  Result := FCurrentLoop;
end;

function TFWebPImage.GetAutoPlay: Boolean;
begin
  Result := FAutoPlay;
end;

function TFWebPImage.IsVisible: Boolean;
begin
  Result := ControlImage.Visible;
end;

function TFWebPImage.GetTag: Integer;
begin
  Result := ControlImage.Tag;
end;

function TFWebPImage.GetLeft: Single;
begin
  Result := ControlImage.Position.X;
end;

function TFWebPImage.GetTop: Single;
begin
  Result := ControlImage.Position.Y;
end;

function TFWebPImage.GetHeight: Single;
begin
  Result := ControlImage.Size.Height;
end;

function TFWebPImage.GetWidth: Single;
begin
  Result := ControlImage.Size.Width;
end;

function TFWebPImage.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlImage);
end;

procedure TFWebPImage.OnClick(Event: TNotifyEvent);
begin
  ControlImage.OnClick := TNotifyEvent(Event);
end;

procedure TFWebPImage.OnMouseDown(Event: TMouseEvent);
begin
  ControlImage.OnMouseDown := TMouseEvent(Event);
end;

procedure TFWebPImage.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlImage.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFWebPImage.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlImage.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFWebPImage.OnMouseUp(Event: TMouseEvent);
begin
  ControlImage.OnMouseUp := TMouseEvent(Event);
end;

function TFWebPImage.Handle: TFmxObject;
begin
  Result := ControlImage;
end;

// =============================================================================
// Exports
// =============================================================================
function InitWebPImageHandle: FWebPImage;
begin
  Result := TFWebPImage.Create;
end;

exports
  InitWebPImageHandle;

end.
