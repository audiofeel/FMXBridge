
unit FMXBridge.HTMLText;

interface

uses
  System.UITypes, System.Classes,
  FMX.Types, FMX.ImgList, FMX.DzHTMLText;

// =============================================================================
// FHTMLText
// =============================================================================
type
  FHTMLText = interface(IUnknown)
    ['{813EB236-4248-41E3-8C49-390C9CE080C0}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
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
    procedure Text(const FText: WideString); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure AutoWidth(FValue: Boolean); stdcall;
    procedure AutoHeight(FValue: Boolean); stdcall;
    procedure AutoOpenLink(FValue: Boolean); stdcall;
    procedure AutoBreak(FValue: Boolean); stdcall;
    procedure AutoTranslate(FValue: Boolean); stdcall;
    procedure BorderMarginAll(FValue: Single); stdcall;
    procedure BorderMarginTop(FValue: Single); stdcall;
    procedure BorderMarginBottom(FValue: Single); stdcall;
    procedure BorderMarginLeft(FValue: Single); stdcall;
    procedure BorderMarginRight(FValue: Single); stdcall;
    procedure TextAlign(Al: TTextAlign); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure FontStyle(Style: TFontStyles); stdcall;
    procedure WordWrap(FValue: Boolean); stdcall;
    procedure ListLevelPadding(FValue: Single); stdcall;
    procedure LineSpacing(FValue: Single); stdcall;
    procedure LineVertAlign(FValue: TTextAlign); stdcall;
    procedure LineHorzAlign(FValue: TTextAlign); stdcall;
    procedure LinkNormal(FontColor, BackgroundColor: TAlphaColor;
      Underlined: Boolean); stdcall;
    procedure LinkHover(FontColor, BackgroundColor: TAlphaColor;
      Underlined: Boolean); stdcall;
    procedure ParagraphIndent(FValue: Single); stdcall;
    procedure ParagraphSpacing(FValue: Single); stdcall;
    procedure OverallVertAlign(FValue: TTextAlign); stdcall;
    procedure OverallHorzAlign(FValue: TTextAlign); stdcall;
    procedure Offset(vTop, vBottom: Single); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function LineCount: Integer; stdcall;
    function ParagraphCount: Integer; stdcall;
    function IsLinkHover: Boolean; stdcall;
    function EscapeTextToHTML(FText: WideString): WideString; stdcall;
    function IsMouseOver: Boolean; stdcall;
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

  TFHTMLText = class(TInterfacedObject, FHTMLText)
  private
    ControlHTML: TDzHTMLText;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
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
    procedure Text(const FText: WideString); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure AutoWidth(FValue: Boolean); stdcall;
    procedure AutoHeight(FValue: Boolean); stdcall;
    procedure AutoOpenLink(FValue: Boolean); stdcall;
    procedure AutoBreak(FValue: Boolean); stdcall;
    procedure AutoTranslate(FValue: Boolean); stdcall;
    procedure BorderMarginAll(FValue: Single); stdcall;
    procedure BorderMarginTop(FValue: Single); stdcall;
    procedure BorderMarginBottom(FValue: Single); stdcall;
    procedure BorderMarginLeft(FValue: Single); stdcall;
    procedure BorderMarginRight(FValue: Single); stdcall;
    procedure TextAlign(Al: TTextAlign); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure FontStyle(Style: TFontStyles); stdcall;
    procedure WordWrap(FValue: Boolean); stdcall;
    procedure ListLevelPadding(FValue: Single); stdcall;
    procedure LineSpacing(FValue: Single); stdcall;
    procedure LineVertAlign(FValue: TTextAlign); stdcall;
    procedure LineHorzAlign(FValue: TTextAlign); stdcall;
    procedure LinkNormal(FontColor, BackgroundColor: TAlphaColor;
      Underlined: Boolean); stdcall;
    procedure LinkHover(FontColor, BackgroundColor: TAlphaColor;
      Underlined: Boolean); stdcall;
    procedure ParagraphIndent(FValue: Single); stdcall;
    procedure ParagraphSpacing(FValue: Single); stdcall;
    procedure OverallVertAlign(FValue: TTextAlign); stdcall;
    procedure OverallHorzAlign(FValue: TTextAlign); stdcall;
    procedure Offset(vTop, vBottom: Single); stdcall;
    procedure Images(FImgList: TImageList); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function LineCount: Integer; stdcall;
    function ParagraphCount: Integer; stdcall;
    function IsLinkHover: Boolean; stdcall;
    function EscapeTextToHTML(FText: WideString): WideString; stdcall;
    function IsMouseOver: Boolean; stdcall;
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
function InitHTMLTextHandle: FHTMLText; stdcall;

implementation

// =============================================================================
// FHTMLText
// =============================================================================
procedure TFHTMLText.FCreate(FParent: TFmxObject);
begin
  ControlHTML := TDzHTMLText.Create(nil);
  ControlHTML.Parent := TFmxObject(FParent);
end;

procedure TFHTMLText.Left(FLeft: Single);
begin
  ControlHTML.Position.X := FLeft;
end;

procedure TFHTMLText.Top(FTop: Single);
begin
  ControlHTML.Position.Y := FTop;
end;

procedure TFHTMLText.Height(FHeight: Single);
begin
  ControlHTML.Size.Height := FHeight;
end;

procedure TFHTMLText.Width(FWidth: Single);
begin
  ControlHTML.Size.Width := FWidth;
end;

procedure TFHTMLText.Position(X, Y: Single);
begin
  ControlHTML.Position.X := X;
  ControlHTML.Position.Y := Y;
end;

procedure TFHTMLText.Align(Al: TAlignLayout);
begin
  ControlHTML.Align := TAlignLayout(Al);
end;

procedure TFHTMLText.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlHTML.Margins.Left := FLeft;
  ControlHTML.Margins.Top := FTop;
  ControlHTML.Margins.Right := FRight;
  ControlHTML.Margins.Bottom := FBottom;
end;

procedure TFHTMLText.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlHTML.Padding.Left := FLeft;
  ControlHTML.Padding.Top := FTop;
  ControlHTML.Padding.Right := FRight;
  ControlHTML.Padding.Bottom := FBottom;
end;

procedure TFHTMLText.SetHint(const FText: WideString);
begin
  ControlHTML.ShowHint := True;
  ControlHTML.Hint := string(FText);
end;

procedure TFHTMLText.SetClipChildren(FValue: Boolean);
begin
  ControlHTML.ClipChildren := FValue;
end;

procedure TFHTMLText.SetClipParent(FValue: Boolean);
begin
  ControlHTML.ClipParent := FValue;
end;

procedure TFHTMLText.BringToFront;
begin
  ControlHTML.BringToFront;
end;

procedure TFHTMLText.SendToBack;
begin
  ControlHTML.SendToBack;
end;

procedure TFHTMLText.SetTag(FTag: Integer);
begin
  ControlHTML.Tag := FTag;
end;

procedure TFHTMLText.Text(const FText: WideString);
begin
  ControlHTML.Text := string(FText);
end;

procedure TFHTMLText.Color(FColor: TAlphaColor);
begin
  ControlHTML.Color := TAlphaColor(FColor);
end;

procedure TFHTMLText.AutoWidth(FValue: Boolean);
begin
  ControlHTML.AutoWidth := FValue;
end;

procedure TFHTMLText.AutoHeight(FValue: Boolean);
begin
  ControlHTML.AutoHeight := FValue;
end;

procedure TFHTMLText.AutoOpenLink(FValue: Boolean);
begin
  ControlHTML.AutoOpenLink := FValue;
end;

procedure TFHTMLText.AutoBreak(FValue: Boolean);
begin
  ControlHTML.AutoBreak := FValue;
end;

procedure TFHTMLText.AutoTranslate(FValue: Boolean);
begin
  ControlHTML.AutoTranslate := FValue;
end;

procedure TFHTMLText.BorderMarginAll(FValue: Single);
begin
  ControlHTML.Borders.All := FValue;
end;

procedure TFHTMLText.BorderMarginTop(FValue: Single);
begin
  ControlHTML.Borders.Top := FValue;
end;

procedure TFHTMLText.BorderMarginBottom(FValue: Single);
begin
  ControlHTML.Borders.Bottom := FValue;
end;

procedure TFHTMLText.BorderMarginLeft(FValue: Single);
begin
  ControlHTML.Borders.Left := FValue;
end;

procedure TFHTMLText.BorderMarginRight(FValue: Single);
begin
  ControlHTML.Borders.Right := FValue;
end;

procedure TFHTMLText.TextAlign(Al: TTextAlign);
begin
  case Al of
    TTextAlign.Leading:
      ControlHTML.OverallHorzAlign := haLeft;
    TTextAlign.Center:
      ControlHTML.OverallHorzAlign := haCenter;
    TTextAlign.Trailing:
      ControlHTML.OverallHorzAlign := haRight;
  else
    ControlHTML.OverallHorzAlign := haLeft;
  end;

  ControlHTML.Rebuild;
end;

procedure TFHTMLText.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlHTML.TextSettings.Font.Size := FontSize;
  ControlHTML.TextSettings.Font.Family := string(FontName);
  ControlHTML.TextSettings.FontColor := TAlphaColor(FontColor);
end;

procedure TFHTMLText.FontStyle(Style: TFontStyles);
begin
  ControlHTML.Font.Style := TFontStyles(Style);
end;

procedure TFHTMLText.WordWrap(FValue: Boolean);
begin
  ControlHTML.WordWrap := FValue;
end;

procedure TFHTMLText.ListLevelPadding(FValue: Single);
begin
  ControlHTML.ListLevelPadding := FValue;
end;

procedure TFHTMLText.LineSpacing(FValue: Single);
begin
  ControlHTML.LineSpacing := FValue;
end;

procedure TFHTMLText.LineVertAlign(FValue: TTextAlign);
begin
  case FValue of
    TTextAlign.Leading:
      ControlHTML.LineVertAlign := vaTop;
    TTextAlign.Center:
      ControlHTML.LineVertAlign := vaCenter;
    TTextAlign.Trailing:
      ControlHTML.LineVertAlign := vaBottom;
  else
    ControlHTML.LineVertAlign := vaTop;
  end;
end;

procedure TFHTMLText.LineHorzAlign(FValue: TTextAlign);
begin
  case FValue of
    TTextAlign.Leading:
      ControlHTML.LineHorzAlign := haLeft;
    TTextAlign.Center:
      ControlHTML.LineHorzAlign := haCenter;
    TTextAlign.Trailing:
      ControlHTML.LineHorzAlign := haRight;
  else
    ControlHTML.LineHorzAlign := haLeft;
  end;
end;

procedure TFHTMLText.LinkNormal(FontColor, BackgroundColor: TAlphaColor;
  Underlined: Boolean);
begin
  ControlHTML.StyleLinkNormal.FontColor := TAnyColor(FontColor);
  ControlHTML.StyleLinkNormal.BackColor := TAnyColor(BackgroundColor);
  ControlHTML.StyleLinkNormal.Underline := Underlined;

  ControlHTML.Rebuild;
end;

procedure TFHTMLText.LinkHover(FontColor, BackgroundColor: TAlphaColor;
  Underlined: Boolean);
begin
  ControlHTML.StyleLinkHover.FontColor := TAnyColor(FontColor);
  ControlHTML.StyleLinkHover.BackColor := TAnyColor(BackgroundColor);
  ControlHTML.StyleLinkHover.Underline := Underlined;

  ControlHTML.Rebuild;
end;

procedure TFHTMLText.ParagraphIndent(FValue: Single);
begin
  ControlHTML.ParagraphIndent := FValue;
end;

procedure TFHTMLText.ParagraphSpacing(FValue: Single);
begin
  ControlHTML.ParagraphSpacing := FValue;
end;

procedure TFHTMLText.OverallVertAlign(FValue: TTextAlign);
begin
  case FValue of
    TTextAlign.Leading:
      ControlHTML.OverallVertAlign := vaTop;
    TTextAlign.Center:
      ControlHTML.OverallVertAlign := vaCenter;
    TTextAlign.Trailing:
      ControlHTML.OverallVertAlign := vaBottom;
  else
    ControlHTML.OverallVertAlign := vaTop;
  end;

  ControlHTML.Rebuild;
end;

procedure TFHTMLText.OverallHorzAlign(FValue: TTextAlign);
begin
  case FValue of
    TTextAlign.Leading:
      ControlHTML.OverallHorzAlign := haLeft;
    TTextAlign.Center:
      ControlHTML.OverallHorzAlign := haCenter;
    TTextAlign.Trailing:
      ControlHTML.OverallHorzAlign := haRight;
  else
    ControlHTML.OverallHorzAlign := haLeft;
  end;

  ControlHTML.Rebuild;
end;

procedure TFHTMLText.Offset(vTop, vBottom: Single);
begin
  ControlHTML.Offset.Top := vTop;
  ControlHTML.Offset.Bottom := vBottom;

  ControlHTML.Rebuild;
end;

procedure TFHTMLText.Images(FImgList: TImageList);
begin
  ControlHTML.Images := FImgList;
end;

procedure TFHTMLText.Opacity(FOpacity: Single);
begin
  ControlHTML.Opacity := FOpacity;
end;

procedure TFHTMLText.RotationAngle(FValue: Single);
begin
  ControlHTML.RotationAngle := FValue;
end;

procedure TFHTMLText.RotationCenter(X, Y: Single);
begin
  ControlHTML.RotationCenter.X := X;
  ControlHTML.RotationCenter.Y := Y;
end;

procedure TFHTMLText.Enabled(FEnabled: Boolean);
begin
  ControlHTML.Enabled := FEnabled;
end;

procedure TFHTMLText.Visible(FVisible: Boolean);
begin
  ControlHTML.Visible := FVisible;
end;

procedure TFHTMLText.HitTest(FEnabled: Boolean);
begin
  ControlHTML.HitTest := FEnabled;
end;

function TFHTMLText.LineCount: Integer;
begin
  Result := ControlHTML.LineCount;
end;

function TFHTMLText.ParagraphCount: Integer;
begin
  Result := ControlHTML.ParagraphCount;
end;

function TFHTMLText.IsLinkHover: Boolean;
begin
  Result := ControlHTML.IsLinkHover;
end;

function TFHTMLText.EscapeTextToHTML(FText: WideString): WideString;
begin
  Result := ControlHTML.EscapeTextToHTML(string(FText));
end;

function TFHTMLText.IsMouseOver: Boolean;
begin
  Result := ControlHTML.IsMouseOver;
end;

function TFHTMLText.GetTag: Integer;
begin
  Result := ControlHTML.Tag;
end;

function TFHTMLText.GetLeft: Single;
begin
  Result := ControlHTML.Position.X;
end;

function TFHTMLText.GetTop: Single;
begin
  Result := ControlHTML.Position.Y;
end;

function TFHTMLText.GetHeight: Single;
begin
  Result := ControlHTML.Size.Height;
end;

function TFHTMLText.GetWidth: Single;
begin
  Result := ControlHTML.Size.Width;
end;

function TFHTMLText.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlHTML);
end;

procedure TFHTMLText.OnClick(Event: TNotifyEvent);
begin
  ControlHTML.OnClick := TNotifyEvent(Event);
end;

procedure TFHTMLText.OnMouseDown(Event: TMouseEvent);
begin
  ControlHTML.OnMouseDown := TMouseEvent(Event);
end;

procedure TFHTMLText.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlHTML.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFHTMLText.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlHTML.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFHTMLText.OnMouseUp(Event: TMouseEvent);
begin
  ControlHTML.OnMouseUp := TMouseEvent(Event);
end;

function TFHTMLText.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlHTML);
end;

// =============================================================================
// Exports
// =============================================================================
function InitHTMLTextHandle: FHTMLText;
begin
  Result := TFHTMLText.Create;
end;

exports
  InitHTMLTextHandle;

end.
