
unit FMXBridge.TypedText;

interface

uses
  System.Classes, System.UITypes,
  FMX.Types, FMX.StdCtrls;

// =============================================================================
// FTypedText
// =============================================================================
type
  FTypedText = interface(IUnknown)
    ['{292DD0A0-8D83-4E36-A2CB-8BB3CC2468AE}']
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
    procedure AutoSize(FAutoSize: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure AddLine(const FText: WideString); stdcall;
    procedure Interval(FInterval: Integer); stdcall;
    procedure Play; stdcall;
    procedure Stop; stdcall;
    procedure Reset; stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Trimming(FTrimming: TTextTrimming); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetFontColor: TAlphaColor; stdcall;
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

  TTypedTextLabel = class(TLabel)
  private
    FSourceText: string;
    FCharOffsets: TArray<Integer>;
    FCharCount: Integer;
    FVisibleCount: Integer;
    FProgress: Single;
    procedure BuildCharOffsets;
    procedure UpdateVisibleText;
    procedure SetProgress(const Value: Single);
    procedure StopAnimationAtCurrent;
  public
    procedure SetSourceText(const Value: string);
    procedure AppendLine(const Value: string);
    property SourceText: string read FSourceText;
    property CharacterCount: Integer read FCharCount;
    property VisibleCharacters: Integer read FVisibleCount;
  published
    property Progress: Single read FProgress write SetProgress;
  end;

  TFTypedText = class(TInterfacedObject, FTypedText)
  private
    ControlTypedText: TTypedTextLabel;
    FInterval: Integer;
  public
    constructor Create; reintroduce;

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
    procedure AutoSize(FAutoSize: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure AddLine(const FText: WideString); stdcall;
    procedure Interval(FInterval: Integer); stdcall;
    procedure Play; stdcall;
    procedure Stop; stdcall;
    procedure Reset; stdcall;
    procedure StyledSettings(FStyledSettings: TStyledSettings); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Trimming(FTrimming: TTextTrimming); stdcall;
    procedure FontStyle(FStyle: TFontStyles); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetFontColor: TAlphaColor; stdcall;
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
function InitTypedTextHandle: FTypedText; stdcall;

implementation

uses
  FMX.Ani;

// TTypedTextLabel -------------------------------------------------------------
procedure TTypedTextLabel.BuildCharOffsets;
var
  I, L, N: Integer;
  C: Char;
begin
  L := Length(FSourceText);
  SetLength(FCharOffsets, L + 1);
  FCharOffsets[0] := 0;

  I := 1;
  N := 0;
  while I <= L do
  begin
    C := FSourceText[I];

    if C = #13 then
    begin
      if (I < L) and (FSourceText[I + 1] = #10) then
        Inc(I, 2)
      else
        Inc(I);
    end
    else if (Ord(C) >= $D800) and (Ord(C) <= $DBFF) then
    begin
      if I < L then
      begin
        if (Ord(FSourceText[I + 1]) >= $DC00) and
          (Ord(FSourceText[I + 1]) <= $DFFF) then
          Inc(I, 2)
        else
          Inc(I);
      end
      else
        Inc(I);
    end
    else
      Inc(I);

    Inc(N);
    FCharOffsets[N] := I - 1;
  end;

  SetLength(FCharOffsets, N + 1);
  FCharCount := N;
end;

procedure TTypedTextLabel.UpdateVisibleText;
begin
  if FVisibleCount <= 0 then
    Text := ''
  else
    Text := Copy(FSourceText, 1, FCharOffsets[FVisibleCount]);
end;

procedure TTypedTextLabel.SetProgress(const Value: Single);
var
  LValue: Single;
  LVisibleCount: Integer;
begin
  LValue := Value;
  if LValue < 0 then
    LValue := 0
  else if LValue > 1 then
    LValue := 1;

  FProgress := LValue;

  if FCharCount = 0 then
    LVisibleCount := 0
  else if LValue >= 1 then
    LVisibleCount := FCharCount
  else
    LVisibleCount := Trunc(LValue * FCharCount);

  if LVisibleCount <> FVisibleCount then
  begin
    FVisibleCount := LVisibleCount;
    UpdateVisibleText;
  end;
end;

procedure TTypedTextLabel.StopAnimationAtCurrent;
var
  LProgress: Single;
begin
  if FCharCount > 0 then
    LProgress := FVisibleCount / FCharCount
  else
    LProgress := 0;

  TAnimator.StopPropertyAnimation(Self, 'Progress');
  Progress := LProgress;
end;

procedure TTypedTextLabel.SetSourceText(const Value: string);
begin
  StopAnimationAtCurrent;

  FSourceText := Value;
  BuildCharOffsets;

  FProgress := 0;
  FVisibleCount := 0;
  Text := '';
end;

procedure TTypedTextLabel.AppendLine(const Value: string);
var
  LSource: string;
  LVisibleCount: Integer;
begin
  LVisibleCount := FVisibleCount;
  StopAnimationAtCurrent;
  LSource := FSourceText;

  if LSource <> '' then
    if (LSource[Length(LSource)] <> #10) and (LSource[Length(LSource)] <> #13)
    then
      LSource := LSource + sLineBreak;

  FSourceText := LSource + Value;
  BuildCharOffsets;

  if LVisibleCount > FCharCount then
    LVisibleCount := FCharCount;

  FVisibleCount := LVisibleCount;
  if FCharCount = 0 then
    FProgress := 0
  else
    FProgress := FVisibleCount / FCharCount;

  UpdateVisibleText;
end;

// =============================================================================
// FTypedText
// =============================================================================
constructor TFTypedText.Create;
begin
  inherited Create;
  FInterval := 40;
end;

procedure TFTypedText.FCreate(FParent: TFmxObject);
begin
  ControlTypedText := TTypedTextLabel.Create(nil);
  ControlTypedText.Parent := FParent;
  ControlTypedText.SetSourceText('');
end;

procedure TFTypedText.Cursor(FCursor: TCursor);
begin
  ControlTypedText.Cursor := FCursor;
end;

procedure TFTypedText.Left(FLeft: Single);
begin
  ControlTypedText.Position.X := FLeft;
end;

procedure TFTypedText.Top(FTop: Single);
begin
  ControlTypedText.Position.Y := FTop;
end;

procedure TFTypedText.Height(FHeight: Single);
begin
  ControlTypedText.Height := FHeight;
end;

procedure TFTypedText.Width(FWidth: Single);
begin
  ControlTypedText.Width := FWidth;
end;

procedure TFTypedText.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlTypedText.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFTypedText.Position(X, Y: Single);
begin
  ControlTypedText.Position.X := X;
  ControlTypedText.Position.Y := Y;
end;

procedure TFTypedText.Align(Al: TAlignLayout);
begin
  ControlTypedText.Align := Al;
end;

procedure TFTypedText.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTypedText.Margins.Left := FLeft;
  ControlTypedText.Margins.Top := FTop;
  ControlTypedText.Margins.Right := FRight;
  ControlTypedText.Margins.Bottom := FBottom;
end;

procedure TFTypedText.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTypedText.Padding.Left := FLeft;
  ControlTypedText.Padding.Top := FTop;
  ControlTypedText.Padding.Right := FRight;
  ControlTypedText.Padding.Bottom := FBottom;
end;

procedure TFTypedText.SetHint(const FText: WideString);
begin
  ControlTypedText.ShowHint := True;
  ControlTypedText.Hint := string(FText);
end;

procedure TFTypedText.SetClipParent(FValue: Boolean);
begin
  ControlTypedText.ClipParent := FValue;
end;

procedure TFTypedText.SetClipChildren(FValue: Boolean);
begin
  ControlTypedText.ClipChildren := FValue;
end;

procedure TFTypedText.BringToFront;
begin
  ControlTypedText.BringToFront;
end;

procedure TFTypedText.SendToBack;
begin
  ControlTypedText.SendToBack;
end;

procedure TFTypedText.SetTag(FTag: Integer);
begin
  ControlTypedText.Tag := FTag;
end;

procedure TFTypedText.AutoSize(FAutoSize: Boolean);
begin
  ControlTypedText.AutoSize := FAutoSize;
end;

procedure TFTypedText.Text(const FText: WideString);
begin
  ControlTypedText.SetSourceText(string(FText));
end;

procedure TFTypedText.AddLine(const FText: WideString);
begin
  ControlTypedText.AppendLine(string(FText));
end;

procedure TFTypedText.Interval(FInterval: Integer);
begin
  if FInterval < 0 then
    FInterval := 0;
  Self.FInterval := FInterval;
end;

procedure TFTypedText.Play;
var
  LRemainingCount: Integer;
  LDuration: Single;
begin
  if not Assigned(ControlTypedText) then
    Exit;

  LRemainingCount := ControlTypedText.CharacterCount -
    ControlTypedText.VisibleCharacters;
  if LRemainingCount <= 0 then
    Exit;

  ControlTypedText.StopAnimationAtCurrent;

  if FInterval = 0 then
  begin
    ControlTypedText.Progress := 1;
    Exit;
  end;

  LDuration := (Single(LRemainingCount) * FInterval) / 1000.0;

  TAnimator.AnimateFloat(ControlTypedText, 'Progress', 1.0, LDuration,
    TAnimationType.&In, TInterpolationType.Linear);
end;

procedure TFTypedText.Stop;
begin
  if Assigned(ControlTypedText) then
    ControlTypedText.StopAnimationAtCurrent;
end;

procedure TFTypedText.Reset;
begin
  if not Assigned(ControlTypedText) then
    Exit;

  ControlTypedText.StopAnimationAtCurrent;
  ControlTypedText.Progress := 0;
end;

procedure TFTypedText.StyledSettings(FStyledSettings: TStyledSettings);
begin
  ControlTypedText.StyledSettings := FStyledSettings;
end;

procedure TFTypedText.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlTypedText.StyledSettings := [];
  ControlTypedText.TextSettings.Font.Family := string(FontName);
  ControlTypedText.TextSettings.Font.Size := FontSize;
  ControlTypedText.TextSettings.FontColor := FontColor;
end;

procedure TFTypedText.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlTypedText.TextSettings.HorzAlign := FHorzAlign;
  ControlTypedText.TextSettings.VertAlign := FVertAlign;
  ControlTypedText.TextSettings.WordWrap := FWordWrap;
end;

procedure TFTypedText.Trimming(FTrimming: TTextTrimming);
begin
  ControlTypedText.TextSettings.Trimming := FTrimming;
end;

procedure TFTypedText.FontStyle(FStyle: TFontStyles);
begin
  ControlTypedText.TextSettings.Font.Style := FStyle;
end;

procedure TFTypedText.Color(FontColor: TAlphaColor);
begin
  ControlTypedText.FontColor := FontColor;
end;

procedure TFTypedText.Opacity(FOpacity: Single);
begin
  ControlTypedText.Opacity := FOpacity;
end;

procedure TFTypedText.RotationAngle(FValue: Single);
begin
  ControlTypedText.RotationAngle := FValue;
end;

procedure TFTypedText.RotationCenter(X, Y: Single);
begin
  ControlTypedText.RotationCenter.X := X;
  ControlTypedText.RotationCenter.Y := Y;
end;

procedure TFTypedText.Enabled(FEnabled: Boolean);
begin
  ControlTypedText.Enabled := FEnabled;
end;

procedure TFTypedText.Visible(FVisible: Boolean);
begin
  ControlTypedText.Visible := FVisible;
end;

procedure TFTypedText.HitTest(FEnabled: Boolean);
begin
  ControlTypedText.HitTest := FEnabled;
end;

procedure TFTypedText.StyleLookUp(FStyle: WideString);
begin
  ControlTypedText.StyleLookUp := string(FStyle);
end;

function TFTypedText.IsVisible: Boolean;
begin
  Result := ControlTypedText.Visible;
end;

function TFTypedText.GetText: WideString;
begin
  Result := ControlTypedText.SourceText;
end;

function TFTypedText.GetFontColor: TAlphaColor;
begin
  Result := ControlTypedText.TextSettings.FontColor;
end;

function TFTypedText.GetTag: Integer;
begin
  Result := ControlTypedText.Tag;
end;

function TFTypedText.GetLeft: Single;
begin
  Result := ControlTypedText.Position.X;
end;

function TFTypedText.GetTop: Single;
begin
  Result := ControlTypedText.Position.Y;
end;

function TFTypedText.GetHeight: Single;
begin
  Result := ControlTypedText.Height;
end;

function TFTypedText.GetWidth: Single;
begin
  Result := ControlTypedText.Width;
end;

function TFTypedText.GetObject: TFmxObject;
begin
  Result := ControlTypedText;
end;

procedure TFTypedText.OnClick(Event: TNotifyEvent);
begin
  ControlTypedText.OnClick := Event;
end;

procedure TFTypedText.OnMouseDown(Event: TMouseEvent);
begin
  ControlTypedText.OnMouseDown := Event;
end;

procedure TFTypedText.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlTypedText.OnMouseEnter := Event;
end;

procedure TFTypedText.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlTypedText.OnMouseLeave := Event;
end;

procedure TFTypedText.OnMouseUp(Event: TMouseEvent);
begin
  ControlTypedText.OnMouseUp := Event;
end;

function TFTypedText.Handle: TFmxObject;
begin
  Result := ControlTypedText;
end;

// =============================================================================
// Exports
// =============================================================================
function InitTypedTextHandle: FTypedText;
begin
  Result := TFTypedText.Create;
end;

exports
  InitTypedTextHandle;

end.
