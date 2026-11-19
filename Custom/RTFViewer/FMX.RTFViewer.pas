
unit FMX.RTFViewer;

interface

uses
  System.Classes, System.SysUtils, System.UITypes,
  FMX.Controls, FMX.Layouts;

type
  TRTFScrollBars = (rtfScrollNone, rtfScrollVertical, rtfScrollHorizontal,
    rtfScrollBoth);

  TRTFLinkClickEvent = procedure(Sender: TObject; const URL: WideString)
    of object;

  TRTFViewerControl = class(TScrollBox)
  private
    FDocumentView: TControl;
    FScrollBars: TRTFScrollBars;
    FColor: TAlphaColor;
    FBorder: Boolean;
    FAutoOpenLink: Boolean;
    FOnLinkClick: TRTFLinkClickEvent;
    procedure SetScrollBars(const AValue: TRTFScrollBars);
    procedure SetBackgroundColor(const AValue: TAlphaColor);
    procedure SetBorder(const AValue: Boolean);
    procedure SetAutoOpenLink(const AValue: Boolean);
    procedure SetOnLinkClick(const AValue: TRTFLinkClickEvent);
    function BorderInset: Single;
    procedure LinkClicked(const AURL: string);
    procedure SetRTFData(const AData: TBytes);
  protected
    procedure Resize; override;
    procedure Paint; override;
    procedure KeyDown(var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure UpdateDocumentWidth;
    procedure LoadFromFile(const AFileName: string);
    procedure SetRTFText(const AValue: WideString);
    property ScrollBarsValue: TRTFScrollBars read FScrollBars
      write SetScrollBars;
    property BackgroundColor: TAlphaColor read FColor write SetBackgroundColor;
    property BorderVisible: Boolean read FBorder write SetBorder;
    property AutoOpenLinks: Boolean read FAutoOpenLink write SetAutoOpenLink;
    property OnLinkClickEvent: TRTFLinkClickEvent read FOnLinkClick
      write SetOnLinkClick;
  end;

implementation

uses
  System.Types, System.Generics.Collections,  System.Generics.Defaults,
  System.Math, System.Rtti, System.StrUtils,
  Winapi.ShellAPI,
  FMX.Types, FMX.Graphics, FMX.BehaviorManager, FMX.Platform,
  FMX.RTFViewer.Model, FMX.RTFViewer.Parser;

type
  // Minimal DirectWrite declarations used only to obtain the exact font-face
  // ascent/descent/line-gap metrics. Interface method order follows dwrite.h.
  TRTFDWriteFontMetrics = record
    DesignUnitsPerEm: Word;
    Ascent: Word;
    Descent: Word;
    LineGap: SmallInt;
    CapHeight: Word;
    XHeight: Word;
    UnderlinePosition: SmallInt;
    UnderlineThickness: Word;
    StrikethroughPosition: SmallInt;
    StrikethroughThickness: Word;
  end;

  TRTFDWriteFontMetricRatios = record
    Ascent: Single;
    Descent: Single;
    LineGap: Single;
  end;

  IDWriteFontCollectionRTF = interface;
  IDWriteFontFamilyRTF = interface;
  IDWriteFontRTF = interface;

  IDWriteFactoryRTF = interface(IUnknown)
    ['{B859EE5A-D838-4B5B-A2E8-1ADC7D93DB48}']
    function GetSystemFontCollection(out ACollection: IDWriteFontCollectionRTF;
      ACheckForUpdates: LongBool): LongInt; stdcall;
  end;

  IDWriteFontCollectionRTF = interface(IUnknown)
    ['{A84CEE02-3EEA-4EEE-A827-87C1A02A0FCC}']
    function GetFontFamilyCount: LongWord; stdcall;
    function GetFontFamily(AIndex: LongWord; out AFamily: IDWriteFontFamilyRTF)
      : LongInt; stdcall;
    function FindFamilyName(AName: PWideChar; out AIndex: LongWord;
      out AExists: LongBool): LongInt; stdcall;
  end;

  IDWriteFontFamilyRTF = interface(IUnknown)
    ['{DA20D8EF-812A-4C43-9802-62EC4ABD7ADD}']
    // The first three methods are inherited from IDWriteFontList.
    function GetFontCollection(out ACollection: IDWriteFontCollectionRTF)
      : LongInt; stdcall;
    function GetFontCount: LongWord; stdcall;
    function GetFont(AIndex: LongWord; out AFont: IDWriteFontRTF)
      : LongInt; stdcall;
    function GetFamilyNames(out ANames: IUnknown): LongInt; stdcall;
    function GetFirstMatchingFont(AWeight, AStretch, AStyle: LongInt;
      out AFont: IDWriteFontRTF): LongInt; stdcall;
  end;

  IDWriteFontRTF = interface(IUnknown)
    ['{ACD16696-8C14-4F5D-877E-FE3FC1D32737}']
    function GetFontFamily(out AFamily: IDWriteFontFamilyRTF): LongInt; stdcall;
    function GetWeight: LongInt; stdcall;
    function GetStretch: LongInt; stdcall;
    function GetStyle: LongInt; stdcall;
    function IsSymbolFont: LongBool; stdcall;
    function GetFaceNames(out ANames: IUnknown): LongInt; stdcall;
    function GetInformationalStrings(AStringId: LongInt; out AStrings: IUnknown;
      out AExists: LongBool): LongInt; stdcall;
    function GetSimulations: LongInt; stdcall;
    procedure GetMetrics(out AMetrics: TRTFDWriteFontMetrics); stdcall;
    function HasCharacter(AValue: LongWord; out AExists: LongBool)
      : LongInt; stdcall;
    function CreateFontFace(out AFace: IUnknown): LongInt; stdcall;
  end;

const
  RTF_DWRITE_FACTORY_TYPE_SHARED = 0;
  RTF_DWRITE_FONT_WEIGHT_NORMAL = 400;
  RTF_DWRITE_FONT_WEIGHT_BOLD = 700;
  RTF_DWRITE_FONT_STRETCH_NORMAL = 5;
  RTF_DWRITE_FONT_STYLE_NORMAL = 0;
  RTF_DWRITE_FONT_STYLE_ITALIC = 2;
  IID_IDWriteFactoryRTF: TGUID = '{B859EE5A-D838-4B5B-A2E8-1ADC7D93DB48}';

function RTFDWriteCreateFactory(AFactoryType: LongInt; const AIID: TGUID;
  out AFactory: IDWriteFactoryRTF): LongInt; stdcall;
  external 'dwrite.dll' name 'DWriteCreateFactory';

type
  TRTFLinkRect = record
    Bounds: TRectF;
    URL: string;
  end;

  TRTFLineItem = class
  public
    Text: string;
    Style: TRTFCharStyle;
    Width: Single;
    Height: Single;
    Ascent: Single;
    IsSpace: Boolean;
    URL: string;
    Bounds: TRectF;
    TextStart: Integer;
    SourceLength: Integer;
  end;

  TRTFLayoutKind = (rlkTextLine, rlkImage);

  TRTFLayoutElement = class
  public
    Kind: TRTFLayoutKind;
    Top: Single;
    Height: Single;
    Items: TObjectList<TRTFLineItem>;
    ImageBlock: TRTFBlock;
    ImageRect: TRectF;
    HasBackground: Boolean;
    BackgroundRect: TRectF;
    BackgroundColor: TAlphaColor;
    HasCellBorder: Boolean;
    HasBulletMarker: Boolean;
    BulletKind: TRTFListMarkerKind;
    BulletRect: TRectF;
    BulletColor: TAlphaColor;
    HasTextMarker: Boolean;
    TextMarker: string;
    TextMarkerBounds: TRectF;
    TextMarkerStyle: TRTFCharStyle;
    CellBorders: array [0 .. 3] of TRTFCellBorder;
    destructor Destroy; override;
  end;

  TRTFDocumentView = class(TControl)
  private
    FOwnerControl: TRTFViewerControl;
    FDocument: TRTFDocument;
    FLinks: TList<TRTFLinkRect>;
    FLayout: TObjectList<TRTFLayoutElement>;
    FTableDecorations: TObjectList<TRTFLayoutElement>;
    FDWriteFactory: IDWriteFactoryRTF;
    FDWriteFontCollection: IDWriteFontCollectionRTF;
    FFontMetricsCache: TDictionary<string, TRTFDWriteFontMetricRatios>;
    FDirty: Boolean;
    FUpdatingHeight: Boolean;
    FIsOverLink: Boolean;
    FContentWidth: Single;
    FCopyText: string;
    FSelectionAnchor: Integer;
    FSelectionCaret: Integer;
    FSelecting: Boolean;
    FHasSelection: Boolean;
    FMouseMoved: Boolean;
    FMouseDownPoint: TPointF;
    FMouseDownLinkURL: string;
    procedure SetDocument(ADocument: TRTFDocument);
    function TextPositionAtPoint(X, Y: Single): Integer;
    function SelectedText: string;
    procedure SelectAll;
    procedure CopySelectionToClipboard;
    procedure SetFontForStyle(const AStyle: TRTFCharStyle);
    procedure GetFontVerticalMetrics(const AStyle: TRTFCharStyle;
      out AAscent, ADescent, ALineGap: Single);
    function DetectURL(const AText: string; out AURL: string): Boolean;
    procedure LayoutParagraph(const AParagraph: TRTFParagraph; var AY: Single;
      AAvailableWidth: Single);
    procedure LayoutImage(ABlock: TRTFBlock; var AY: Single;
      AAvailableWidth: Single);
    procedure LayoutTableRow(ATableRow: TRTFTableRow; var AY: Single;
      AAvailableWidth: Single);
    procedure BuildLayout;
    procedure MarkDirty;
  protected
    procedure Paint; override;
    procedure Resize; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure DoMouseLeave; override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

// TRTFLayoutElement -----------------------------------------------------------
destructor TRTFLayoutElement.Destroy;
begin
  Items.Free;
  inherited;
end;

// TRTFDocumentView ------------------------------------------------------------
constructor TRTFDocumentView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLinks := TList<TRTFLinkRect>.Create;
  FLayout := TObjectList<TRTFLayoutElement>.Create(True);
  FTableDecorations := TObjectList<TRTFLayoutElement>.Create(True);
  FFontMetricsCache := TDictionary<string, TRTFDWriteFontMetricRatios>.Create;
  FDWriteFactory := nil;
  FDWriteFontCollection := nil;
  FCopyText := '';
  FSelectionAnchor := 0;
  FSelectionCaret := 0;
  FSelecting := False;
  FHasSelection := False;
  FMouseMoved := False;
  FMouseDownLinkURL := '';
  if RTFDWriteCreateFactory(RTF_DWRITE_FACTORY_TYPE_SHARED,
    IID_IDWriteFactoryRTF, FDWriteFactory) >= 0 then
  begin
    if (FDWriteFactory = nil) or
      (FDWriteFactory.GetSystemFontCollection(FDWriteFontCollection, False) < 0)
    then
      FDWriteFontCollection := nil;
  end;
  FDirty := True;
  HitTest := True;
  ClipChildren := True;
end;

destructor TRTFDocumentView.Destroy;
begin
  FTableDecorations.Free;
  FLayout.Free;
  FDocument.Free;
  FLinks.Free;
  FFontMetricsCache.Free;
  FDWriteFontCollection := nil;
  FDWriteFactory := nil;
  inherited;
end;

procedure TRTFDocumentView.SetDocument(ADocument: TRTFDocument);
begin
  if FDocument = ADocument then
    Exit;
  FDocument.Free;
  FDocument := ADocument;
  FCopyText := '';
  FSelectionAnchor := 0;
  FSelectionCaret := 0;
  FHasSelection := False;
  FSelecting := False;
  FMouseMoved := False;
  FMouseDownLinkURL := '';
  FIsOverLink := False;
  Cursor := crDefault;
  MarkDirty;
end;

procedure TRTFDocumentView.MarkDirty;
begin
  FDirty := True;
  Repaint;
end;

function RTFPointsToFMXDips(const APoints: Single): Single;
begin
  // RTF sizes are expressed in typographic points (72 per inch).
  // On Windows, FMX text rendering uses DirectWrite DIPs (96 per inch).
  // Convert points to DIPs so the visual size matches RichEdit/VCL at the
  // same effective DPI: 1 pt = 96 / 72 DIPs.
  Result := APoints * (96.0 / 72.0);
end;

procedure TRTFDocumentView.SetFontForStyle(const AStyle: TRTFCharStyle);
begin
  Canvas.Font.Family := AStyle.FontName;
  Canvas.Font.Size := Max(1, RTFPointsToFMXDips(AStyle.FontSize) *
    IfThen(AStyle.SuperSub <> 0, 0.7, 1.0));
  Canvas.Font.Style := AStyle.FontStyles;
end;

procedure TRTFDocumentView.GetFontVerticalMetrics(const AStyle: TRTFCharStyle;
  out AAscent, ADescent, ALineGap: Single);
var
  LKey, LFamilyName: string;
  LFamilyNameW: WideString;
  LFamilyIndex: LongWord;
  LFamilyExists: LongBool;
  LFamily: IDWriteFontFamilyRTF;
  LFont: IDWriteFontRTF;
  LMetrics: TRTFDWriteFontMetrics;
  LM: TRTFDWriteFontMetricRatios;
  LFontSize: Single;
  LWeight, LStyle: LongInt;
  LHaveMetrics: Boolean;
begin
  LFontSize := Max(1, RTFPointsToFMXDips(AStyle.FontSize) *
    IfThen(AStyle.SuperSub <> 0, 0.7, 1.0));

  // DirectWrite returns font metrics in design units. Cache normalized ratios
  // by family + weight + italic state; font size is applied after the lookup.
  LKey := LowerCase(AStyle.FontName) + '|' +
    IntToStr(Ord(TFontStyle.fsBold in AStyle.FontStyles)) + '|' +
    IntToStr(Ord(TFontStyle.fsItalic in AStyle.FontStyles));

  if not FFontMetricsCache.TryGetValue(LKey, LM) then
  begin
    LHaveMetrics := False;
    LM.Ascent := 0.8;
    LM.Descent := 0.2;
    LM.LineGap := 0;

    if FDWriteFontCollection <> nil then
    begin
      LFamilyName := Trim(AStyle.FontName);
      if LFamilyName = '' then
        LFamilyName := 'Segoe UI';
      LFamilyNameW := LFamilyName;
      LFamilyExists := False;
      LFamilyIndex := 0;

      if (FDWriteFontCollection.FindFamilyName(PWideChar(LFamilyNameW),
        LFamilyIndex, LFamilyExists) < 0) or not LFamilyExists then
      begin
        // Use the same default family as the viewer's default character style.
        LFamilyNameW := 'Segoe UI';
        LFamilyExists := False;
        LFamilyIndex := 0;
        if (FDWriteFontCollection.FindFamilyName(PWideChar(LFamilyNameW),
          LFamilyIndex, LFamilyExists) < 0) or not LFamilyExists then
          LFamilyExists := False;
      end;

      if LFamilyExists and (FDWriteFontCollection.GetFontFamily(LFamilyIndex,
        LFamily) >= 0) then
      begin
        if TFontStyle.fsBold in AStyle.FontStyles then
          LWeight := RTF_DWRITE_FONT_WEIGHT_BOLD
        else
          LWeight := RTF_DWRITE_FONT_WEIGHT_NORMAL;
        if TFontStyle.fsItalic in AStyle.FontStyles then
          LStyle := RTF_DWRITE_FONT_STYLE_ITALIC
        else
          LStyle := RTF_DWRITE_FONT_STYLE_NORMAL;

        LFont := nil;
        if LFamily.GetFirstMatchingFont(LWeight, RTF_DWRITE_FONT_STRETCH_NORMAL,
          LStyle, LFont) >= 0 then
        begin
          LFont.GetMetrics(LMetrics);
          if LMetrics.DesignUnitsPerEm > 0 then
          begin
            LM.Ascent := LMetrics.Ascent / LMetrics.DesignUnitsPerEm;
            LM.Descent := LMetrics.Descent / LMetrics.DesignUnitsPerEm;
            LM.LineGap := LMetrics.LineGap / LMetrics.DesignUnitsPerEm;
            LHaveMetrics := True;
          end;
        end;
      end;
    end;

    // Keep a conservative fallback for missing fonts or DirectWrite failures.
    // Normal installations take the DirectWrite path above.
    if not LHaveMetrics then
    begin
      LM.Ascent := 0.8;
      LM.Descent := 0.2;
      LM.LineGap := 0;
    end;
    FFontMetricsCache.AddOrSetValue(LKey, LM);
  end;

  AAscent := LM.Ascent * LFontSize;
  ADescent := LM.Descent * LFontSize;
  ALineGap := LM.LineGap * LFontSize;
end;

function TRTFDocumentView.DetectURL(const AText: string;
  out AURL: string): Boolean;
var
  L: Integer;
begin
  AURL := AText;
  while (AURL <> '') and CharInSet(AURL[Length(AURL)],
    ['.', ',', ';', ':', ')', ']', '!', '?']) do
    Delete(AURL, Length(AURL), 1);

  Result := StartsText('https://', AURL) or StartsText('http://', AURL) or
    StartsText('www.', AURL);
  if Result and StartsText('www.', AURL) then
    AURL := 'https://' + AURL;

  L := Length(AURL);
  Result := Result and (L > 7);
end;

procedure TRTFDocumentView.LayoutParagraph(const AParagraph: TRTFParagraph;
  var AY: Single; AAvailableWidth: Single);
var
  LineItems: TObjectList<TRTFLineItem>;
  LayoutElement: TRTFLayoutElement;
  Run: TRTFRun;
  Item, NewItem, NextItem: TRTFLineItem;
  Token, DetectedURL: string;
  I, K, LayoutStartIndex: Integer;
  RunIndex, LinkRunIndex: Integer;
  LineWidth, LineHeight, LineAscent, LineDescent: Single;
  StartX, BaseX, MaxWidth, ExtraSpace, LineBaselineY: Single;
  ParagraphTop, ParagraphHeight, CellLeft, CellRight: Single;
  BulletDiameter, BulletCenterX, BulletCenterY: Single;
  EffectiveLeftIndent, EffectiveFirstLineIndent: Single;
  MarkerWidth, MarkerAscent, MarkerDescent, MarkerLineGap: Single;
  MarkerRight: Single;
  SpaceCount: Integer;
  FirstLine, IsSpace, HasLinkWhitespace, SoftWrap: Boolean;
  Style: TRTFCharStyle;
  TextRect: TRectF;
  LinkRect: TRTFLinkRect;
  RunLinkURLs: TArray<string>;
  RunTextStarts: TArray<Integer>;
  LinkText, LinkURL: string;
  TokenStart: Integer;

  function CurrentLineBase: Single;
  begin
    Result := BaseX;
    if FirstLine and not(AParagraph.HasBullet or AParagraph.HasTextListMarker)
    then
      Result := Result + EffectiveFirstLineIndent;
  end;

  procedure AddLink(const ABounds: TRectF; const AURL: string);
  begin
    LinkRect.Bounds := ABounds;
    LinkRect.URL := AURL;
    FLinks.Add(LinkRect);
  end;

  procedure RenderLine(AJustify: Boolean);
  var
    N: Integer;
    LineBase: Single;
  begin
    MarkerWidth := 0;
    MarkerAscent := 0;
    MarkerDescent := 0;
    MarkerLineGap := 0;
    // Trailing spaces must not affect center/right alignment or justification.
    while (LineItems.Count > 0) and LineItems.Last.IsSpace do
    begin
      LineWidth := Max(0, LineWidth - LineItems.Last.Width);
      LineItems.Delete(LineItems.Count - 1);
    end;

    if LineItems.Count = 0 then
    begin
      if AParagraph.Runs.Count > 0 then
        SetFontForStyle(AParagraph.Runs[0].Style)
      else
      begin
        Canvas.Font.Family := 'Segoe UI';
        Canvas.Font.Size := RTFPointsToFMXDips(12);
        Canvas.Font.Style := [];
      end;
      AY := AY + RTFLineAdvance(Canvas.TextHeight('Mg'), AParagraph.Style);
      FirstLine := False;
      Exit;
    end;

    SpaceCount := 0;
    for N := 0 to LineItems.Count - 1 do
      if LineItems[N].IsSpace then
        Inc(SpaceCount);

    ExtraSpace := 0;
    StartX := CurrentLineBase;
    if not(FOwnerControl.ScrollBarsValue in [rtfScrollHorizontal, rtfScrollBoth])
    then
      case AParagraph.Style.Align of
        rpaCenter:
          StartX := StartX + Max(0, (MaxWidth - LineWidth) / 2);
        rpaRight:
          StartX := StartX + Max(0, MaxWidth - LineWidth);
        rpaJustify:
          if AJustify and (SpaceCount > 0) then
            ExtraSpace := Max(0, (MaxWidth - LineWidth) / SpaceCount);
      end;

    LineBase := CurrentLineBase;

    // Numbering labels may use a larger font than the paragraph body. Include
    // their DirectWrite metrics in the row height before placing any content.
    if FirstLine and AParagraph.HasTextListMarker then
    begin
      SetFontForStyle(AParagraph.ListMarkerStyle);
      MarkerWidth := Canvas.TextWidth(AParagraph.ListMarkerText);
      GetFontVerticalMetrics(AParagraph.ListMarkerStyle, MarkerAscent,
        MarkerDescent, MarkerLineGap);
      LineAscent := Max(LineAscent, MarkerAscent);
      LineDescent := Max(LineDescent, MarkerDescent + Max(0, MarkerLineGap));
      LineHeight := LineAscent + LineDescent;
    end;

    FContentWidth := Max(FContentWidth, LineBase + LineWidth +
      AParagraph.Style.RightIndent + 8);

    LayoutElement := TRTFLayoutElement.Create;
    LayoutElement.Kind := rlkTextLine;
    // Include superscript/subscript overhang in the culling bounds.
    LayoutElement.Top := AY - LineHeight * 0.2;
    LayoutElement.Height := LineHeight * 1.4 + 4;
    LayoutElement.Items := LineItems;
    LayoutElement.HasBackground := False;
    LayoutElement.HasBulletMarker := FirstLine and AParagraph.HasBullet;
    LayoutElement.BulletKind := AParagraph.ListMarkerKind;
    LayoutElement.HasTextMarker := FirstLine and AParagraph.HasTextListMarker;
    LayoutElement.TextMarker := '';
    if LayoutElement.HasBulletMarker then
    begin
      BulletDiameter := EnsureRange(LineHeight * 0.27, 3.0, 5.0);
      if AParagraph.Runs.Count > 0 then
        BulletCenterX := BaseX + EffectiveFirstLineIndent +
          Max(4.0, AParagraph.Runs[0].Style.FontSize * (4.0 / 3.0) * 0.5)
      else
        BulletCenterX := BaseX + EffectiveFirstLineIndent + 6;
      BulletCenterY := AY + LineHeight * 0.55;
      LayoutElement.BulletRect := RectF(BulletCenterX - BulletDiameter * 0.5,
        BulletCenterY - BulletDiameter * 0.5, BulletCenterX + BulletDiameter *
        0.5, BulletCenterY + BulletDiameter * 0.5);
      if AParagraph.ListMarkerStyle.FontName <> '' then
        LayoutElement.BulletColor := AParagraph.ListMarkerStyle.TextColor
      else if AParagraph.Runs.Count > 0 then
        LayoutElement.BulletColor := AParagraph.Runs[0].Style.TextColor
      else
        LayoutElement.BulletColor := TAlphaColors.Black;
    end;

    if LayoutElement.HasTextMarker then
    begin
      LayoutElement.TextMarker := AParagraph.ListMarkerText;
      LayoutElement.TextMarkerStyle := AParagraph.ListMarkerStyle;
      MarkerRight := BaseX - Max(0, AParagraph.Style.ListMarkerGap);
      // Keep the complete marker in the hanging-indent area. If the marker
      // is wider than that area (for example 100.), extend it to the left.
      LayoutElement.TextMarkerBounds := RectF(MarkerRight - MarkerWidth,
        AY + LineAscent - MarkerAscent, MarkerRight,
        AY + LineAscent - MarkerAscent + MarkerAscent + MarkerDescent + Max(0,
        MarkerLineGap));
    end;
    LineItems := TObjectList<TRTFLineItem>.Create(True);

    for N := 0 to LayoutElement.Items.Count - 1 do
    begin
      Item := LayoutElement.Items[N];
      // All normal runs share the exact DirectWrite baseline for this line.
      // Each run's top is positioned from its own face ascent; its bottom
      // uses that face's descent and line gap. Superscript/subscript retain
      // their explicit RTF-style vertical offsets below.
      LineBaselineY := AY + LineAscent;
      TextRect := RectF(StartX, LineBaselineY - Item.Ascent,
        StartX + Item.Width + 2, LineBaselineY - Item.Ascent + Item.Height);

      if Item.Style.SuperSub > 0 then
        TextRect.Offset(0, -LineHeight * 0.18)
      else if Item.Style.SuperSub < 0 then
        TextRect.Offset(0, LineHeight * 0.12);

      Item.Bounds := TextRect;
      if Item.URL <> '' then
        AddLink(TextRect, Item.URL);

      StartX := StartX + Item.Width;
      if Item.IsSpace then
        StartX := StartX + ExtraSpace;
    end;

    // Combine adjacent fragments with identical formatting after layout.
    // Normal tokens wrap word-wise; oversized tokens may wrap by character.
    if ExtraSpace <= 0.001 then
    begin
      N := 0;
      while N < LayoutElement.Items.Count - 1 do
      begin
        Item := LayoutElement.Items[N];
        NextItem := LayoutElement.Items[N + 1];
        if SameCharStyle(Item.Style, NextItem.Style) and
          (Item.URL = NextItem.URL) and
          (Item.TextStart + Item.SourceLength = NextItem.TextStart) and
          (Item.SourceLength = Length(Item.Text)) and
          (NextItem.SourceLength = Length(NextItem.Text)) and
          (Abs(Item.Bounds.Top - NextItem.Bounds.Top) < 0.1) then
        begin
          Item.Text := Item.Text + NextItem.Text;
          Item.SourceLength := Item.SourceLength + NextItem.SourceLength;
          Item.Width := NextItem.Bounds.Right - Item.Bounds.Left;
          Item.Bounds.Right := NextItem.Bounds.Right;
          Item.Height := Max(Item.Height, NextItem.Height);
          Item.Ascent := Max(Item.Ascent, NextItem.Ascent);
          Item.IsSpace := False;
          LayoutElement.Items.Delete(N + 1);
        end
        else
          Inc(N);
      end;
    end;

    FLayout.Add(LayoutElement);

    AY := AY + RTFLineAdvance(LineHeight, AParagraph.Style);
    FirstLine := False;
    LineWidth := 0;
    LineHeight := 0;
    LineAscent := 0;
    LineDescent := 0;
  end;

  procedure AppendMeasuredItem(const AText: string; const AStyle: TRTFCharStyle;
    ASpace: Boolean; const AURL: string; AItemWidth, AItemAscent, AItemDescent,
    AItemLineGap: Single; ATextStart, ASourceLength: Integer);
  var
    ItemHeight: Single;
  begin
    if AText = '' then
      Exit;

    ItemHeight := AItemAscent + AItemDescent + Max(0, AItemLineGap);
    NewItem := TRTFLineItem.Create;
    NewItem.Text := AText;
    NewItem.Style := AStyle;
    NewItem.Width := AItemWidth;
    NewItem.Height := ItemHeight;
    NewItem.Ascent := AItemAscent;
    NewItem.IsSpace := ASpace;
    NewItem.URL := AURL;
    NewItem.TextStart := ATextStart;
    NewItem.SourceLength := ASourceLength;
    NewItem.Bounds := RectF(0, 0, 0, 0);

    LineItems.Add(NewItem);
    if not ASpace then
      SoftWrap := False;
    LineWidth := LineWidth + AItemWidth;
    LineAscent := Max(LineAscent, AItemAscent);
    LineDescent := Max(LineDescent, AItemDescent + Max(0, AItemLineGap));
    LineHeight := LineAscent + LineDescent;
  end;

  procedure AddItem(const AText: string; const AStyle: TRTFCharStyle;
    ASpace: Boolean; ATextStart, ASourceLength: Integer);
  var
    ItemWidth, ItemAscent, ItemDescent, ItemLineGap: Single;
    ItemStyle: TRTFCharStyle;
    ItemURL, ChunkText: string;
    StartPos, Remaining, LowLength, HighLength, MiddleLength: Integer;
    CandidateLength, BestLength: Integer;
    CandidateWidth, BestWidth: Single;
  begin
    if AText = '' then
      Exit;
    // Preserve leading spaces/tabs at paragraph starts and after explicit
    // line breaks. Discard only whitespace introduced by an automatic wrap.
    if ASpace and (LineItems.Count = 0) and SoftWrap then
      Exit;

    SetFontForStyle(AStyle);
    ItemWidth := Canvas.TextWidth(AText);
    GetFontVerticalMetrics(AStyle, ItemAscent, ItemDescent, ItemLineGap);

    if (LineItems.Count > 0) and (LineWidth + ItemWidth > MaxWidth) then
    begin
      RenderLine(True);
      SoftWrap := True;
      if ASpace then
        Exit;
    end;

    ItemStyle := AStyle;
    ItemURL := AStyle.LinkURL;
    if (ItemURL = '') and not ASpace and DetectURL(AText, DetectedURL) then
      ItemURL := DetectedURL;

    if ItemURL <> '' then
    begin
      ItemStyle.TextColor := $FF2878C8;
      Include(ItemStyle.FontStyles, TFontStyle.fsUnderline);
    end;

    // A token wider than the available line must be split into fitting
    // character chunks. This covers both ordinary long words and unbroken
    // URLs. Keep UTF-16 surrogate pairs together; no characters are inserted
    // or removed, so the original document text stays intact.
    if not ASpace and (ItemWidth > MaxWidth + 0.01) then
    begin
      StartPos := 1;
      while StartPos <= Length(AText) do
      begin
        Remaining := Length(AText) - StartPos + 1;
        LowLength := 1;
        HighLength := Remaining;
        BestLength := 0;
        BestWidth := 0;

        // Find the longest prefix that fits. TextWidth is measured with the
        // actual run font, including bold/italic and the selected typeface.
        while LowLength <= HighLength do
        begin
          MiddleLength := LowLength + (HighLength - LowLength) div 2;
          CandidateLength := MiddleLength;

          // Do not cut between a UTF-16 high and low surrogate.
          if (CandidateLength > 0) and
            (StartPos + CandidateLength <= Length(AText)) and
            (Ord(AText[StartPos + CandidateLength - 1]) >= $D800) and
            (Ord(AText[StartPos + CandidateLength - 1]) <= $DBFF) and
            (Ord(AText[StartPos + CandidateLength]) >= $DC00) and
            (Ord(AText[StartPos + CandidateLength]) <= $DFFF) then
            Dec(CandidateLength);

          if CandidateLength = 0 then
          begin
            Inc(LowLength);
            Continue;
          end;

          ChunkText := Copy(AText, StartPos, CandidateLength);
          CandidateWidth := Canvas.TextWidth(ChunkText);
          if CandidateWidth <= MaxWidth then
          begin
            BestLength := CandidateLength;
            BestWidth := CandidateWidth;
            LowLength := MiddleLength + 1;
          end
          else
            HighLength := MiddleLength - 1;
        end;

        // A single glyph can be wider than the line. It cannot be split any
        // further, so place that complete code point on its own line.
        if BestLength = 0 then
        begin
          BestLength := 1;
          if (StartPos < Length(AText)) and (Ord(AText[StartPos]) >= $D800) and
            (Ord(AText[StartPos]) <= $DBFF) and
            (Ord(AText[StartPos + 1]) >= $DC00) and
            (Ord(AText[StartPos + 1]) <= $DFFF) then
            BestLength := 2;
          ChunkText := Copy(AText, StartPos, BestLength);
          BestWidth := Canvas.TextWidth(ChunkText);
        end
        else
          ChunkText := Copy(AText, StartPos, BestLength);

        AppendMeasuredItem(ChunkText, ItemStyle, False, ItemURL, BestWidth,
          ItemAscent, ItemDescent, ItemLineGap, ATextStart + StartPos - 1,
          BestLength);
        Inc(StartPos, BestLength);

        if StartPos <= Length(AText) then
        begin
          RenderLine(True);
          SoftWrap := True;
        end;
      end;
      Exit;
    end;

    AppendMeasuredItem(AText, ItemStyle, ASpace, ItemURL, ItemWidth, ItemAscent,
      ItemDescent, ItemLineGap, ATextStart, ASourceLength);
  end;

  procedure AddToken(const AToken: string; const AStyle: TRTFCharStyle;
    ASpace: Boolean; ATextStart, ASourceLength: Integer);
  begin
    if AToken <> '' then
      AddItem(AToken, AStyle, ASpace, ATextStart, ASourceLength);
  end;

begin
  if AParagraph = nil then
    Exit;

  ParagraphTop := AY;
  LayoutStartIndex := FLayout.Count;
  if AParagraph.HasTextListMarker and (AParagraph.ListMarkerText <> '') then
    FCopyText := FCopyText + AParagraph.ListMarkerText + ' '
  else if AParagraph.HasBullet then
    FCopyText := FCopyText + #$2022 + ' ';
  SetLength(RunTextStarts, AParagraph.Runs.Count);
  for K := 0 to AParagraph.Runs.Count - 1 do
  begin
    RunTextStarts[K] := Length(FCopyText);
    FCopyText := FCopyText + AParagraph.Runs[K].Text;
  end;
  EffectiveLeftIndent := AParagraph.Style.LeftIndent;
  EffectiveFirstLineIndent := AParagraph.Style.FirstLineIndent;

  // RTF list levels normally provide explicit \li/\fi values. Some
  // WordPad/older Word files only identify the level; use the conventional
  // 360-twip hanging slot as a fallback, increasing it for nested levels.
  if AParagraph.HasBullet or AParagraph.HasTextListMarker or
    (AParagraph.Style.ListOverride > 0) then
  begin
    if not AParagraph.Style.HasLeftIndent and not AParagraph.Style.HasListLevelIndent
    then
      EffectiveLeftIndent :=
        TwipsToPixels(360 * (Max(0, AParagraph.Style.ListLevel) + 1));
    if not AParagraph.Style.HasFirstLineIndent and not AParagraph.Style.HasListLevelFirstLineIndent
    then
      EffectiveFirstLineIndent := -TwipsToPixels(360);
  end;

  AY := AY + AParagraph.Style.SpaceBefore;
  LineItems := TObjectList<TRTFLineItem>.Create(True);
  try
    LineWidth := 0;
    LineHeight := 0;
    LineAscent := 0;
    LineDescent := 0;
    FirstLine := True;
    SoftWrap := False;
    if AParagraph.Style.InTable then
    begin
      CellLeft := 8 + AParagraph.Style.CellLeft;
      CellRight := CellLeft + AParagraph.Style.CellWidth;
      BaseX := CellLeft + AParagraph.Style.CellPaddingLeft +
        EffectiveLeftIndent;
      MaxWidth := Max(1, AParagraph.Style.CellWidth -
        AParagraph.Style.CellPaddingLeft - AParagraph.Style.CellPaddingRight -
        EffectiveLeftIndent - AParagraph.Style.RightIndent - Max(0,
        EffectiveFirstLineIndent));
      FContentWidth := Max(FContentWidth, CellRight + 8);
    end
    else
    begin
      BaseX := 8 + EffectiveLeftIndent;
      MaxWidth := Max(1, AAvailableWidth - EffectiveLeftIndent -
        AParagraph.Style.RightIndent - Max(0, EffectiveFirstLineIndent));
    end;
    if FOwnerControl.ScrollBarsValue in [rtfScrollHorizontal, rtfScrollBoth]
    then
      MaxWidth := 100000;

    // RTF hyperlinks are not always stored as a single run or as a
    // HYPERLINK field. Word/WordPad commonly split an underlined URL into
    // several adjacent character-format runs (for example: "http", "://",
    // "fitgirl", "-", "repacks", ".", "site"). Detect the complete URL
    // across the run boundaries before laying out individual words.
    SetLength(RunLinkURLs, AParagraph.Runs.Count);
    for RunIndex := 0 to AParagraph.Runs.Count - 1 do
      RunLinkURLs[RunIndex] := AParagraph.Runs[RunIndex].Style.LinkURL;

    RunIndex := 0;
    while RunIndex < AParagraph.Runs.Count do
    begin
      if (RunLinkURLs[RunIndex] <> '') or
        not(TFontStyle.fsUnderline in AParagraph.Runs[RunIndex].Style.FontStyles)
      then
      begin
        Inc(RunIndex);
        Continue;
      end;

      LinkRunIndex := RunIndex;
      LinkText := '';
      while (LinkRunIndex < AParagraph.Runs.Count) and
        (RunLinkURLs[LinkRunIndex] = '') and
        (TFontStyle.fsUnderline in AParagraph.Runs[LinkRunIndex]
        .Style.FontStyles) do
      begin
        LinkText := LinkText + AParagraph.Runs[LinkRunIndex].Text;
        Inc(LinkRunIndex);
      end;

      LinkText := Trim(LinkText);
      HasLinkWhitespace := False;
      for K := 1 to Length(LinkText) do
        if CharInSet(LinkText[K], [#9, #10, #13, ' ']) then
        begin
          HasLinkWhitespace := True;
          Break;
        end;

      if (LinkText <> '') and not HasLinkWhitespace and
        DetectURL(LinkText, LinkURL) then
        for K := RunIndex to LinkRunIndex - 1 do
          RunLinkURLs[K] := LinkURL;

      if LinkRunIndex > RunIndex then
        RunIndex := LinkRunIndex
      else
        Inc(RunIndex);
    end;

    for RunIndex := 0 to AParagraph.Runs.Count - 1 do
    begin
      Run := AParagraph.Runs[RunIndex];
      Style := Run.Style;
      if (Style.LinkURL = '') and (RunLinkURLs[RunIndex] <> '') then
        Style.LinkURL := RunLinkURLs[RunIndex];
      Token := '';
      TokenStart := 0;
      I := 1;
      while I <= Length(Run.Text) do
      begin
        IsSpace := CharInSet(Run.Text[I], [' ', #9, #10, #13]);
        if IsSpace then
        begin
          if Token <> '' then
          begin
            AddToken(Token, Style, False, RunTextStarts[RunIndex] + TokenStart -
              1, Length(Token));
            Token := '';
            TokenStart := 0;
          end;

          if (Run.Text[I] = #10) or (Run.Text[I] = #13) then
          begin
            RenderLine(True);
            SoftWrap := False;
            if (Run.Text[I] = #13) and (I < Length(Run.Text)) and
              (Run.Text[I + 1] = #10) then
              Inc(I);
          end
          else if Run.Text[I] = #9 then
            AddToken('    ', Style, True, RunTextStarts[RunIndex] + I - 1, 1)
          else
            AddToken(' ', Style, True, RunTextStarts[RunIndex] + I - 1, 1);
        end
        else
        begin
          if Token = '' then
            TokenStart := I;
          Token := Token + Run.Text[I];
        end;
        Inc(I);
      end;

      if Token <> '' then
        AddToken(Token, Style, False, RunTextStarts[RunIndex] + TokenStart - 1,
          Length(Token));
    end;

    if LineItems.Count > 0 then
      RenderLine(False)
    else if not AParagraph.HasText then
    begin
      Canvas.Font.Family := 'Segoe UI';
      Canvas.Font.Size := RTFPointsToFMXDips(12);
      Canvas.Font.Style := [];
      AY := AY + RTFLineAdvance(Canvas.TextHeight('Mg'), AParagraph.Style);
    end;

    AY := AY + AParagraph.Style.SpaceAfter;
  finally
    LineItems.Free;
  end;

  if AParagraph.Style.InTable then
  begin
    ParagraphHeight := AY - ParagraphTop;
    if AParagraph.Style.CellMinHeight > ParagraphHeight then
    begin
      ParagraphHeight := AParagraph.Style.CellMinHeight;
      AY := ParagraphTop + ParagraphHeight;
    end;

    if AParagraph.Style.HasCellBackground then
      for K := LayoutStartIndex to FLayout.Count - 1 do
      begin
        LayoutElement := FLayout[K];
        if LayoutElement.Kind = rlkTextLine then
        begin
          LayoutElement.HasBackground := True;
          LayoutElement.BackgroundRect := RectF(8 + AParagraph.Style.CellLeft,
            ParagraphTop, 8 + AParagraph.Style.CellLeft +
            AParagraph.Style.CellWidth, ParagraphTop + ParagraphHeight);
          LayoutElement.BackgroundColor := AParagraph.Style.CellBackgroundColor;
        end;
      end;
  end;
end;

procedure TRTFDocumentView.LayoutImage(ABlock: TRTFBlock; var AY: Single;
  AAvailableWidth: Single);
var
  W, H, ScaleFactor, X: Single;
  LayoutElement: TRTFLayoutElement;
begin
  if (ABlock.Bitmap = nil) or (ABlock.Bitmap.Width <= 0) or
    (ABlock.Bitmap.Height <= 0) then
    Exit;

  W := ABlock.ImageWidth;
  H := ABlock.ImageHeight;
  if W <= 0 then
    W := ABlock.Bitmap.Width;
  if H <= 0 then
    H := ABlock.Bitmap.Height;

  ScaleFactor := 1;
  if not(FOwnerControl.ScrollBarsValue in [rtfScrollHorizontal, rtfScrollBoth])
    and (W > AAvailableWidth) then
    ScaleFactor := AAvailableWidth / W;
  W := W * ScaleFactor;
  H := H * ScaleFactor;

  LayoutElement := TRTFLayoutElement.Create;
  LayoutElement.Kind := rlkImage;
  LayoutElement.Top := AY;
  LayoutElement.Height := H;
  LayoutElement.ImageBlock := ABlock;
  case ABlock.ImageAlign of
    rpaCenter:
      X := 8 + Max(0, (AAvailableWidth - W) / 2);
    rpaRight:
      X := 8 + Max(0, AAvailableWidth - W);
  else
    X := 8;
  end;
  LayoutElement.ImageRect := RectF(X, AY, X + W, AY + H);
  FLayout.Add(LayoutElement);

  FContentWidth := Max(FContentWidth, X + W + 8);
  AY := AY + H + 8;
end;

procedure TRTFDocumentView.LayoutTableRow(ATableRow: TRTFTableRow;
  var AY: Single; AAvailableWidth: Single);
var
  Cell, FirstCell, LastCell: TRTFTableCell;
  Paragraph: TRTFParagraph;
  SavedStyle: TRTFParagraphStyle;
  DecorElement: TRTFLayoutElement;
  CellIndex, BorderIndex, DecorStartIndex, N, J: Integer;
  RowTop, RowHeight, CellY, CellLeft, CellWidth: Single;
  PaddingLeft, PaddingRight, PaddingTop, PaddingBottom: Single;
  TableWidth, RowOffset, CellContentHeight, VerticalFree,
    VerticalOffset: Single;
  HasBorders: Boolean;
  CellLayoutStart, CellLayoutEnd, CellLinkStart, CellLinkEnd: TArray<Integer>;
  CellContentHeights: TArray<Single>;
  Element: TRTFLayoutElement;
  Item: TRTFLineItem;
  LinkRect: TRTFLinkRect;
begin
  if (ATableRow = nil) or (ATableRow.Cells.Count = 0) then
    Exit;

  if FCopyText <> '' then
    if not CharInSet(FCopyText[Length(FCopyText)], [#10, #13]) then
      FCopyText := FCopyText + sLineBreak;

  RowTop := AY;
  RowHeight := Max(1, TwipsToPixels(Abs(ATableRow.MinHeightTwips)));
  DecorStartIndex := FTableDecorations.Count;
  SetLength(CellLayoutStart, ATableRow.Cells.Count);
  SetLength(CellLayoutEnd, ATableRow.Cells.Count);
  SetLength(CellLinkStart, ATableRow.Cells.Count);
  SetLength(CellLinkEnd, ATableRow.Cells.Count);
  SetLength(CellContentHeights, ATableRow.Cells.Count);

  FirstCell := ATableRow.Cells[0];
  LastCell := ATableRow.Cells.Last;
  TableWidth := Max(1, TwipsToPixels(LastCell.RightTwips -
    FirstCell.LeftTwips));
  case ATableRow.Align of
    rtaCenter:
      RowOffset := Max(0, (AAvailableWidth - TableWidth) / 2);
    rtaRight:
      RowOffset := Max(0, AAvailableWidth - TableWidth);
  else
    RowOffset := TwipsToPixels(FirstCell.LeftTwips);
  end;

  // Keep cell decorations in a separate, row-sorted list. If tall cell
  // backgrounds were mixed into the line list, Top+Height would no longer be
  // monotonic and Paint's binary search could skip visible lines.
  for CellIndex := 0 to ATableRow.Cells.Count - 1 do
  begin
    Cell := ATableRow.Cells[CellIndex];
    DecorElement := TRTFLayoutElement.Create;
    DecorElement.Top := RowTop;
    DecorElement.Height := 1;
    DecorElement.HasBackground := Cell.HasBackground;
    DecorElement.BackgroundColor := Cell.BackgroundColor;
    HasBorders := False;
    for BorderIndex := 0 to 3 do
    begin
      DecorElement.CellBorders[BorderIndex] := Cell.Borders[BorderIndex];
      HasBorders := HasBorders or Cell.Borders[BorderIndex].Enabled;
    end;
    DecorElement.HasCellBorder := HasBorders;
    CellLeft := 8 + RowOffset + TwipsToPixels
      (Cell.LeftTwips - FirstCell.LeftTwips);
    CellWidth := Max(1, TwipsToPixels(Cell.RightTwips - Cell.LeftTwips));
    DecorElement.BackgroundRect := RectF(CellLeft, RowTop, CellLeft + CellWidth,
      RowTop + 1);
    FTableDecorations.Add(DecorElement);
  end;

  // Lay out every cell independently at the same row origin. The row height
  // is the maximum of its cell contents and the explicit trrh minimum.
  for CellIndex := 0 to ATableRow.Cells.Count - 1 do
  begin
    Cell := ATableRow.Cells[CellIndex];
    if CellIndex > 0 then
      FCopyText := FCopyText + #9;
    CellWidth := Max(1, TwipsToPixels(Cell.RightTwips - Cell.LeftTwips));
    PaddingLeft := TwipsToPixels(Cell.PaddingLeftTwips);
    PaddingRight := TwipsToPixels(Cell.PaddingRightTwips);
    PaddingTop := TwipsToPixels(Cell.PaddingTopTwips);
    PaddingBottom := TwipsToPixels(Cell.PaddingBottomTwips);
    CellY := RowTop + PaddingTop;

    CellLayoutStart[CellIndex] := FLayout.Count;
    CellLinkStart[CellIndex] := FLinks.Count;
    N := 0;
    for Paragraph in Cell.Paragraphs do
    begin
      if N > 0 then
        FCopyText := FCopyText + sLineBreak;
      Inc(N);
      SavedStyle := Paragraph.Style;
      try
        Paragraph.Style.InTable := True;
        Paragraph.Style.CellLeft := RowOffset +
          TwipsToPixels(Cell.LeftTwips - FirstCell.LeftTwips);
        Paragraph.Style.CellWidth := CellWidth;
        Paragraph.Style.CellPaddingLeft := PaddingLeft;
        Paragraph.Style.CellPaddingRight := PaddingRight;
        Paragraph.Style.CellMinHeight := 0;
        Paragraph.Style.HasCellBackground := False;
        LayoutParagraph(Paragraph, CellY, CellWidth);
      finally
        Paragraph.Style := SavedStyle;
      end;
    end;
    CellLayoutEnd[CellIndex] := FLayout.Count - 1;
    CellLinkEnd[CellIndex] := FLinks.Count - 1;
    CellContentHeight := Max(0, CellY - RowTop - PaddingTop);
    CellContentHeights[CellIndex] := CellContentHeight;
    RowHeight := Max(RowHeight, CellY - RowTop + PaddingBottom);
  end;

  // Apply vertical alignment after the final row height is known. Text,
  // bullets, hit-test rectangles and link rectangles move together.
  for CellIndex := 0 to ATableRow.Cells.Count - 1 do
  begin
    Cell := ATableRow.Cells[CellIndex];
    PaddingTop := TwipsToPixels(Cell.PaddingTopTwips);
    PaddingBottom := TwipsToPixels(Cell.PaddingBottomTwips);
    VerticalFree := Max(0, RowHeight - PaddingTop - PaddingBottom -
      CellContentHeights[CellIndex]);
    case Cell.VerticalAlign of
      rtvaCenter:
        VerticalOffset := VerticalFree / 2;
      rtvaBottom:
        VerticalOffset := VerticalFree;
    else
      VerticalOffset := 0;
    end;

    if VerticalOffset > 0.001 then
    begin
      for N := CellLayoutStart[CellIndex] to CellLayoutEnd[CellIndex] do
      begin
        Element := FLayout[N];
        Element.Top := Element.Top + VerticalOffset;
        if Element.Kind = rlkTextLine then
        begin
          Element.BulletRect.Offset(0, VerticalOffset);
          for J := 0 to Element.Items.Count - 1 do
          begin
            Item := Element.Items[J];
            Item.Bounds.Offset(0, VerticalOffset);
          end;
        end;
      end;

      for N := CellLinkStart[CellIndex] to CellLinkEnd[CellIndex] do
      begin
        LinkRect := FLinks[N];
        LinkRect.Bounds.Offset(0, VerticalOffset);
        FLinks[N] := LinkRect;
      end;
    end;
  end;

  // Expand all cell backgrounds/borders to the final height of the row.
  for CellIndex := 0 to ATableRow.Cells.Count - 1 do
  begin
    Cell := ATableRow.Cells[CellIndex];
    DecorElement := FTableDecorations[DecorStartIndex + CellIndex];
    CellLeft := 8 + RowOffset + TwipsToPixels
      (Cell.LeftTwips - FirstCell.LeftTwips);
    CellWidth := Max(1, TwipsToPixels(Cell.RightTwips - Cell.LeftTwips));
    DecorElement.Top := RowTop;
    DecorElement.Height := RowHeight;
    DecorElement.BackgroundRect := RectF(CellLeft, RowTop, CellLeft + CellWidth,
      RowTop + RowHeight);
    FContentWidth := Max(FContentWidth, CellLeft + CellWidth + 8);
  end;

  AY := RowTop + RowHeight;
  FCopyText := FCopyText + sLineBreak;
end;

procedure TRTFDocumentView.BuildLayout;
var
  Block: TRTFBlock;
  PreviousBlockKind: TRTFBlockKind;
  HasPreviousBlock: Boolean;
  Y, AvailableWidth, NewViewHeight, NewViewWidth: Single;
begin
  if not FDirty then
    Exit;

  FLayout.Clear;
  FTableDecorations.Clear;
  FLinks.Clear;
  FCopyText := '';
  FContentWidth := Max(1, FOwnerControl.Width - FOwnerControl.Padding.Left -
    FOwnerControl.Padding.Right - 2 * FOwnerControl.BorderInset);
  Y := 8;
  AvailableWidth := Max(1, Width - 16);
  HasPreviousBlock := False;
  PreviousBlockKind := rbParagraph;

  if FDocument <> nil then
    for Block in FDocument.Blocks do
    begin
      case Block.Kind of
        rbParagraph:
          begin
            // Every consecutive RTF paragraph contributes its own line break.
            // Do not suppress it merely because the previous paragraph was
            // empty or ended with an explicit \line; both are meaningful.
            if HasPreviousBlock and (PreviousBlockKind = rbParagraph) then
              FCopyText := FCopyText + sLineBreak
            else if HasPreviousBlock and (PreviousBlockKind = rbImage) and
              (FCopyText <> '') then
            begin
              if not CharInSet(FCopyText[Length(FCopyText)], [#10, #13]) then
                FCopyText := FCopyText + sLineBreak;
            end;
            LayoutParagraph(Block.Paragraph, Y, AvailableWidth);
          end;
        rbImage:
          LayoutImage(Block, Y, AvailableWidth);
        rbTable:
          LayoutTableRow(Block.TableRow, Y, AvailableWidth);
      end;
      PreviousBlockKind := Block.Kind;
      HasPreviousBlock := True;
    end;

  while FCopyText <> '' do
  begin
    if not CharInSet(FCopyText[Length(FCopyText)], [#10, #13]) then
      Break;
    Delete(FCopyText, Length(FCopyText), 1);
  end;

  // Rows are laid out cell-by-cell, so their line elements are not initially
  // in vertical order. Paint uses binary search by Top and requires sorting.
  FLayout.Sort(TComparer<TRTFLayoutElement>.Construct(
    function(const ALeft, ARight: TRTFLayoutElement): Integer
    begin
      if ALeft.Top < ARight.Top then
        Result := -1
      else if ALeft.Top > ARight.Top then
        Result := 1
      else
        Result := 0;
    end));

  if FOwnerControl.ScrollBarsValue in [rtfScrollNone, rtfScrollHorizontal] then
    NewViewHeight := Max(1, FOwnerControl.Height - FOwnerControl.Padding.Top -
      FOwnerControl.Padding.Bottom - 2 * FOwnerControl.BorderInset)
  else
    // The document view is already offset by Padding.Top. Its height must
    // include Padding.Bottom as well, otherwise the scroll range ends exactly
    // at the last glyph and the requested bottom padding is never visible.
    // Keep at least the available viewport height when the document is short.
    NewViewHeight := Max(Max(1, FOwnerControl.Height - FOwnerControl.Padding.Top
      - FOwnerControl.Padding.Bottom - 2 * FOwnerControl.BorderInset),
      Max(1, Y + 8 + FOwnerControl.Padding.Bottom));

  if FOwnerControl.ScrollBarsValue in [rtfScrollHorizontal, rtfScrollBoth] then
    NewViewWidth := Max(1, FContentWidth)
  else
    NewViewWidth := Max(1, FOwnerControl.Width - FOwnerControl.Padding.Left -
      FOwnerControl.Padding.Right - 2 * FOwnerControl.BorderInset);

  FUpdatingHeight := True;
  try
    if Abs(Height - NewViewHeight) > 1 then
      Height := NewViewHeight;
    if Abs(Width - NewViewWidth) > 1 then
      Width := NewViewWidth;
  finally
    FUpdatingHeight := False;
  end;

  FDirty := False;
end;

procedure TRTFDocumentView.Paint;
var
  State: TCanvasSaveState;
  Element: TRTFLayoutElement;
  Item: TRTFLineItem;
  VisibleRect: TRectF;
  VisibleTop, VisibleBottom: Single;
  Lo, Hi, Mid, FirstIndex, I, J: Integer;
  DecorLo, DecorHi, DecorMid, FirstDecorIndex: Integer;
  DecorElement: TRTFLayoutElement;
  ImageBlock: TRTFBlock;
  ImageHighSpeed: Boolean;
  SelectionStart, SelectionEnd: Integer;
  SelectionPrefixWidth, SelectionWidth: Single;
  SelectionText, SelectionPrefixText: string;
  SelectionRect, MarkerSelectionRect: TRectF;
  HasItemSelection, HasMarkerSelection: Boolean;
  MarkerStart, MarkerEnd, MarkerLength: Integer;
  MarkerPaintColor: TAlphaColor;

  procedure PaintCellDecoration(ADecor: TRTFLayoutElement);
  begin
    if ADecor.HasBackground then
    begin
      Canvas.Fill.Kind := TBrushKind.Solid;
      Canvas.Fill.Color := ADecor.BackgroundColor;
      Canvas.FillRect(ADecor.BackgroundRect, 0, 0, [], AbsoluteOpacity);
    end;

    if not ADecor.HasCellBorder then
      Exit;

    // Cell borders are thin FMX rectangles, not native window borders.
    if ADecor.CellBorders[0].Enabled then
    begin
      Canvas.Fill.Color := ADecor.CellBorders[0].Color;
      Canvas.FillRect(RectF(ADecor.BackgroundRect.Left,
        ADecor.BackgroundRect.Top, ADecor.BackgroundRect.Left +
        ADecor.CellBorders[0].Width, ADecor.BackgroundRect.Bottom), 0, 0, [],
        AbsoluteOpacity);
    end;
    if ADecor.CellBorders[1].Enabled then
    begin
      Canvas.Fill.Color := ADecor.CellBorders[1].Color;
      Canvas.FillRect(RectF(ADecor.BackgroundRect.Left,
        ADecor.BackgroundRect.Top, ADecor.BackgroundRect.Right,
        ADecor.BackgroundRect.Top + ADecor.CellBorders[1].Width), 0, 0, [],
        AbsoluteOpacity);
    end;
    if ADecor.CellBorders[2].Enabled then
    begin
      Canvas.Fill.Color := ADecor.CellBorders[2].Color;
      Canvas.FillRect(RectF(ADecor.BackgroundRect.Right - ADecor.CellBorders[2]
        .Width, ADecor.BackgroundRect.Top, ADecor.BackgroundRect.Right,
        ADecor.BackgroundRect.Bottom), 0, 0, [], AbsoluteOpacity);
    end;
    if ADecor.CellBorders[3].Enabled then
    begin
      Canvas.Fill.Color := ADecor.CellBorders[3].Color;
      Canvas.FillRect(RectF(ADecor.BackgroundRect.Left,
        ADecor.BackgroundRect.Bottom - ADecor.CellBorders[3].Width,
        ADecor.BackgroundRect.Right, ADecor.BackgroundRect.Bottom), 0, 0, [],
        AbsoluteOpacity);
    end;
  end;

begin
  SelectionStart := 0;
  SelectionEnd := 0;
  inherited;
  State := Canvas.SaveState;
  try
    if FDirty then
      BuildLayout;

    // ViewportPosition is relative to the scroll box content layout.
    // Convert the viewport origin to this document view's local coordinates.
    VisibleRect := RectF(FOwnerControl.ViewportPosition.X - Position.X,
      FOwnerControl.ViewportPosition.Y - Position.Y,
      FOwnerControl.ViewportPosition.X - Position.X +
      FOwnerControl.ViewportRect.Width, FOwnerControl.ViewportPosition.Y -
      Position.Y + FOwnerControl.ViewportRect.Height);
    VisibleRect.Left := Max(0, VisibleRect.Left);
    VisibleRect.Top := Max(0, VisibleRect.Top);
    VisibleRect.Right := Min(Width, VisibleRect.Right);
    VisibleRect.Bottom := Min(Height, VisibleRect.Bottom);

    Canvas.Fill.Kind := TBrushKind.Solid;
    Canvas.Fill.Color := FOwnerControl.BackgroundColor;
    if (VisibleRect.Right > VisibleRect.Left) and
      (VisibleRect.Bottom > VisibleRect.Top) then
      Canvas.FillRect(VisibleRect, 0, 0, [], AbsoluteOpacity);

    // Find the first layout element that intersects the visible vertical band.
    VisibleTop := VisibleRect.Top;
    VisibleBottom := VisibleRect.Bottom;
    Lo := 0;
    Hi := FLayout.Count - 1;
    FirstIndex := FLayout.Count;
    while Lo <= Hi do
    begin
      Mid := Lo + (Hi - Lo) div 2;
      Element := FLayout[Mid];
      if Element.Top + Element.Height < VisibleTop then
        Lo := Mid + 1
      else
      begin
        FirstIndex := Mid;
        Hi := Mid - 1;
      end;
    end;

    // Paint any paragraph background decorations kept in the line layout.
    for I := FirstIndex to FLayout.Count - 1 do
    begin
      Element := FLayout[I];
      if Element.Top > VisibleBottom then
        Break;
      if (Element.Top + Element.Height < VisibleTop) or not Element.HasBackground
      then
        Continue;
      Canvas.Fill.Kind := TBrushKind.Solid;
      Canvas.Fill.Color := Element.BackgroundColor;
      Canvas.FillRect(Element.BackgroundRect, 0, 0, [], AbsoluteOpacity);
    end;

    // Table cell decorations live in a separate row-sorted array so the
    // binary search over line elements keeps its monotonic-bound invariant.
    DecorLo := 0;
    DecorHi := FTableDecorations.Count - 1;
    FirstDecorIndex := FTableDecorations.Count;
    while DecorLo <= DecorHi do
    begin
      DecorMid := DecorLo + (DecorHi - DecorLo) div 2;
      DecorElement := FTableDecorations[DecorMid];
      if DecorElement.Top + DecorElement.Height < VisibleTop then
        DecorLo := DecorMid + 1
      else
      begin
        FirstDecorIndex := DecorMid;
        DecorHi := DecorMid - 1;
      end;
    end;

    for I := FirstDecorIndex to FTableDecorations.Count - 1 do
    begin
      DecorElement := FTableDecorations[I];
      if DecorElement.Top > VisibleBottom then
        Break;
      if DecorElement.Top + DecorElement.Height < VisibleTop then
        Continue;
      PaintCellDecoration(DecorElement);
    end;

    for I := FirstIndex to FLayout.Count - 1 do
    begin
      Element := FLayout[I];
      if Element.Top > VisibleBottom then
        Break;
      if Element.Top + Element.Height < VisibleTop then
        Continue;

      case Element.Kind of
        rlkTextLine:
          begin
            HasMarkerSelection := False;
            MarkerPaintColor := Element.BulletColor;
            if FHasSelection and (Element.Items.Count > 0) then
            begin
              MarkerEnd := Element.Items[0].TextStart;
              MarkerLength := 0;
              if Element.HasTextMarker and (Element.TextMarker <> '') then
                MarkerLength := Length(Element.TextMarker) + 1
              else if Element.HasBulletMarker then
                MarkerLength := 2; // bullet glyph + one plain-text separator

              if MarkerLength > 0 then
              begin
                MarkerStart := MarkerEnd - MarkerLength;
                SelectionStart := Min(FSelectionAnchor, FSelectionCaret);
                SelectionEnd := Max(FSelectionAnchor, FSelectionCaret);
                HasMarkerSelection := (SelectionStart < MarkerEnd) and
                  (SelectionEnd > MarkerStart);
              end;
            end;

            if HasMarkerSelection then
            begin
              if Element.HasTextMarker then
                MarkerSelectionRect := RectF(Element.TextMarkerBounds.Left,
                  Min(Element.TextMarkerBounds.Top,
                  Element.Items[0].Bounds.Top), Element.Items[0].Bounds.Left,
                  Max(Element.TextMarkerBounds.Bottom,
                  Element.Items[0].Bounds.Bottom))
              else
                MarkerSelectionRect := RectF(Element.BulletRect.Left,
                  Element.Items[0].Bounds.Top, Element.Items[0].Bounds.Left,
                  Element.Items[0].Bounds.Bottom);
              Canvas.Fill.Kind := TBrushKind.Solid;
              Canvas.Fill.Color := $FF2B579A;
              Canvas.FillRect(MarkerSelectionRect, 0, 0, [], AbsoluteOpacity);
              MarkerPaintColor := TAlphaColors.White;
            end;

            if Element.HasBulletMarker then
            begin
              case Element.BulletKind of
                rlmkCircle:
                  begin
                    Canvas.Stroke.Kind := TBrushKind.Solid;
                    Canvas.Stroke.Color := MarkerPaintColor;
                    Canvas.Stroke.Thickness := 1;
                    Canvas.DrawEllipse(Element.BulletRect, AbsoluteOpacity);
                  end;
                rlmkSquare:
                  begin
                    Canvas.Fill.Kind := TBrushKind.Solid;
                    Canvas.Fill.Color := MarkerPaintColor;
                    Canvas.FillRect(Element.BulletRect, 0, 0, [],
                      AbsoluteOpacity);
                  end;
              else
                begin
                  Canvas.Fill.Kind := TBrushKind.Solid;
                  Canvas.Fill.Color := MarkerPaintColor;
                  Canvas.FillEllipse(Element.BulletRect, AbsoluteOpacity);
                end;
              end;
            end;

            if Element.HasTextMarker then
            begin
              SetFontForStyle(Element.TextMarkerStyle);
              if HasMarkerSelection then
                Canvas.Fill.Color := TAlphaColors.White
              else
                Canvas.Fill.Color := Element.TextMarkerStyle.TextColor;
              Canvas.FillText(Element.TextMarkerBounds, Element.TextMarker,
                False, AbsoluteOpacity, [], TTextAlign.Leading,
                TTextAlign.Leading);
            end;

            for J := 0 to Element.Items.Count - 1 do
            begin
              Item := Element.Items[J];
              if (Item.Bounds.Bottom < VisibleTop) or
                (Item.Bounds.Top > VisibleBottom) or
                (Item.Bounds.Right < VisibleRect.Left) or
                (Item.Bounds.Left > VisibleRect.Right) then
                Continue;

              if Item.Style.HighlightColor <> TAlphaColors.Null then
              begin
                Canvas.Fill.Color := Item.Style.HighlightColor;
                Canvas.FillRect(Item.Bounds, 0, 0, [], AbsoluteOpacity);
              end;

              SetFontForStyle(Item.Style);
              HasItemSelection := False;
              if FHasSelection then
              begin
                SelectionStart := Min(FSelectionAnchor, FSelectionCaret);
                SelectionEnd := Max(FSelectionAnchor, FSelectionCaret);
                SelectionStart := Max(SelectionStart, Item.TextStart);
                SelectionEnd :=
                  Min(SelectionEnd, Item.TextStart + Item.SourceLength);
                HasItemSelection := SelectionStart < SelectionEnd;
              end;

              if HasItemSelection then
              begin
                if Item.SourceLength = Length(Item.Text) then
                begin
                  SelectionPrefixText :=
                    Copy(Item.Text, 1, SelectionStart - Item.TextStart);
                  SelectionPrefixWidth := Canvas.TextWidth(SelectionPrefixText);
                  SelectionText :=
                    Copy(Item.Text, SelectionStart - Item.TextStart + 1,
                    SelectionEnd - SelectionStart);
                end
                else
                begin
                  // One source tab is represented by four visual spaces.
                  SelectionPrefixWidth := 0;
                  SelectionText := Item.Text;
                end;
                if Item.SourceLength = Length(Item.Text) then
                  SelectionWidth :=
                    Canvas.TextWidth(SelectionPrefixText + SelectionText) -
                    SelectionPrefixWidth
                else
                  SelectionWidth := Canvas.TextWidth(SelectionText);
                SelectionRect := RectF(Item.Bounds.Left + SelectionPrefixWidth,
                  Item.Bounds.Top, Item.Bounds.Left + SelectionPrefixWidth +
                  SelectionWidth + 1, Item.Bounds.Bottom);
                Canvas.Fill.Kind := TBrushKind.Solid;
                Canvas.Fill.Color := $FF2B579A;
                Canvas.FillRect(SelectionRect, 0, 0, [], AbsoluteOpacity);
              end;

              Canvas.Fill.Color := Item.Style.TextColor;
              Canvas.FillText(Item.Bounds, Item.Text, False, AbsoluteOpacity,
                [], TTextAlign.Leading, TTextAlign.Leading);

              if HasItemSelection then
              begin
                SelectionRect.Right := SelectionRect.Right + 1;
                Canvas.Fill.Color := TAlphaColors.White;
                Canvas.FillText(SelectionRect, SelectionText, False,
                  AbsoluteOpacity, [], TTextAlign.Leading, TTextAlign.Leading);
              end;
            end;
          end;
        rlkImage:
          begin
            ImageBlock := Element.ImageBlock;
            if (ImageBlock <> nil) and (ImageBlock.Bitmap <> nil) and
              (Element.ImageRect.Right >= VisibleRect.Left) and
              (Element.ImageRect.Left <= VisibleRect.Right) then
            begin
              ImageHighSpeed := SameValue(Element.ImageRect.Width,
                ImageBlock.Bitmap.Width, 0.5) and
                SameValue(Element.ImageRect.Height,
                ImageBlock.Bitmap.Height, 0.5);
              Canvas.DrawBitmap(ImageBlock.Bitmap,
                RectF(0, 0, ImageBlock.Bitmap.Width, ImageBlock.Bitmap.Height),
                Element.ImageRect, AbsoluteOpacity, ImageHighSpeed);
            end;
          end;
      end;
    end;
  finally
    Canvas.RestoreState(State);
  end;
end;

procedure TRTFDocumentView.Resize;
begin
  inherited;
  if not FUpdatingHeight then
    MarkDirty;
end;

procedure TRTFDocumentView.MouseDown(Button: TMouseButton; Shift: TShiftState;
X, Y: Single);
var
  Link: TRTFLinkRect;
begin
  inherited;
  if Button <> TMouseButton.mbLeft then
    Exit;

  if FDirty then
    BuildLayout;

  FOwnerControl.SetFocus;
  FSelecting := True;
  FHasSelection := False;
  FMouseMoved := False;
  FMouseDownPoint := PointF(X, Y);
  FIsOverLink := False;
  Cursor := crIBeam;
  FSelectionAnchor := TextPositionAtPoint(X, Y);
  FSelectionCaret := FSelectionAnchor;
  FMouseDownLinkURL := '';
  for Link in FLinks do
    if Link.Bounds.Contains(PointF(X, Y)) then
    begin
      FMouseDownLinkURL := Link.URL;
      Break;
    end;
  Repaint;
end;

procedure TRTFDocumentView.MouseMove(Shift: TShiftState; X, Y: Single);
var
  Link: TRTFLinkRect;
  LOverLink: Boolean;
  LNewCaret: Integer;
begin
  inherited;

  if FSelecting then
  begin
    if (Abs(X - FMouseDownPoint.X) > 2) or (Abs(Y - FMouseDownPoint.Y) > 2) then
      FMouseMoved := True;
    LNewCaret := TextPositionAtPoint(X, Y);
    if LNewCaret <> FSelectionCaret then
    begin
      FSelectionCaret := LNewCaret;
      FHasSelection := FSelectionAnchor <> FSelectionCaret;
      Repaint;
    end;
    Cursor := crIBeam;
    Exit;
  end;

  // Link rectangles are built together with the cached document layout.
  // Do not rebuild the layout while moving the mouse unless it is actually dirty.
  if FDirty then
    BuildLayout;

  LOverLink := False;
  for Link in FLinks do
    if Link.Bounds.Contains(PointF(X, Y)) then
    begin
      LOverLink := True;
      Break;
    end;

  if LOverLink <> FIsOverLink then
  begin
    FIsOverLink := LOverLink;
    if FIsOverLink then
      Cursor := crHandPoint
    else
      Cursor := crDefault;
  end;
end;

procedure TRTFDocumentView.DoMouseLeave;
begin
  inherited;
  if FSelecting then
    Exit;
  FIsOverLink := False;
  Cursor := crDefault;
end;

procedure TRTFDocumentView.MouseUp(Button: TMouseButton; Shift: TShiftState;
X, Y: Single);
var
  Link: TRTFLinkRect;
  LNewCaret: Integer;
begin
  inherited;
  if Button <> TMouseButton.mbLeft then
    Exit;

  if FSelecting and ((Abs(X - FMouseDownPoint.X) > 2) or
    (Abs(Y - FMouseDownPoint.Y) > 2)) then
    FMouseMoved := True;

  if FSelecting and FMouseMoved then
  begin
    LNewCaret := TextPositionAtPoint(X, Y);
    if LNewCaret <> FSelectionCaret then
    begin
      FSelectionCaret := LNewCaret;
      FHasSelection := FSelectionAnchor <> FSelectionCaret;
    end;
  end;

  FSelecting := False;
  if FHasSelection then
  begin
    FMouseDownLinkURL := '';
    Cursor := crIBeam;
    Repaint;
    Exit;
  end;

  if not FMouseMoved and (FMouseDownLinkURL <> '') then
    for Link in FLinks do
      if Link.Bounds.Contains(PointF(X, Y)) and (Link.URL = FMouseDownLinkURL)
      then
      begin
        FOwnerControl.LinkClicked(Link.URL);
        FIsOverLink := True;
        Cursor := crHandPoint;
        Break;
      end;

  FMouseDownLinkURL := '';
  if not FIsOverLink then
    Cursor := crIBeam;
  Repaint;
end;

function TRTFDocumentView.TextPositionAtPoint(X, Y: Single): Integer;
var
  Element, BestElement: TRTFLayoutElement;
  Item, BestItem: TRTFLineItem;
  DX, DY, Distance, BestDistance: Single;
  LocalX, PreviousWidth, CurrentWidth, TextWidthValue: Single;
  Boundaries: TArray<Integer>;
  I, StepLength, TextLength, BoundaryCount: Integer;
  LowBoundary, HighBoundary, MidBoundary: Integer;
  PreviousPosition, CurrentPosition: Integer;
  MarkerSourceLength: Integer;
begin
  if FDirty then
    BuildLayout;

  BestItem := nil;
  BestElement := nil;
  BestDistance := 1.0E30;
  for Element in FLayout do
    if Element.Kind = rlkTextLine then
      for Item in Element.Items do
      begin
        if Item.Text = '' then
          Continue;

        if X < Item.Bounds.Left then
          DX := Item.Bounds.Left - X
        else if X > Item.Bounds.Right then
          DX := X - Item.Bounds.Right
        else
          DX := 0;

        if Y < Item.Bounds.Top then
          DY := Item.Bounds.Top - Y
        else if Y > Item.Bounds.Bottom then
          DY := Y - Item.Bounds.Bottom
        else
          DY := 0;

        Distance := DX * DX + DY * DY;
        if Distance < BestDistance then
        begin
          BestDistance := Distance;
          BestItem := Item;
          BestElement := Element;
        end;
      end;

  if BestItem = nil then
    Exit(0);

  // The hanging marker is visually before the first body item but is part of
  // the text copied to the clipboard. A mouse-down in that margin maps to the
  // start of the marker prefix, allowing list markers to be copied as well.
  if (BestElement <> nil) and (BestElement.Items.Count > 0) and
    (BestItem = BestElement.Items[0]) and (X < BestItem.Bounds.Left) then
  begin
    MarkerSourceLength := 0;
    if BestElement.HasTextMarker and (BestElement.TextMarker <> '') then
      MarkerSourceLength := Length(BestElement.TextMarker) + 1
    else if BestElement.HasBulletMarker then
      MarkerSourceLength := 2;
    if MarkerSourceLength > 0 then
      Exit(Max(0, BestItem.TextStart - MarkerSourceLength));
  end;

  SetFontForStyle(BestItem.Style);
  LocalX := X - BestItem.Bounds.Left;
  TextLength := Length(BestItem.Text);
  TextWidthValue := Canvas.TextWidth(BestItem.Text);
  if LocalX <= 0 then
    Exit(BestItem.TextStart);
  if LocalX >= TextWidthValue then
    Exit(BestItem.TextStart + BestItem.SourceLength);

  // A tab is displayed as four spaces but occupies one source character.
  if BestItem.SourceLength <> TextLength then
  begin
    if LocalX < BestItem.Width * 0.5 then
      Result := BestItem.TextStart
    else
      Result := BestItem.TextStart + BestItem.SourceLength;
    Exit;
  end;

  // Build UTF-16 code-point boundaries, so neither the caret nor selection
  // can be placed between a high and low surrogate. A binary search then
  // finds the nearest glyph boundary without measuring every prefix.
  SetLength(Boundaries, TextLength + 1);
  BoundaryCount := 0;
  Boundaries[0] := 0;
  I := 1;
  while I <= TextLength do
  begin
    StepLength := 1;
    if (I < TextLength) and (Ord(BestItem.Text[I]) >= $D800) and
      (Ord(BestItem.Text[I]) <= $DBFF) and (Ord(BestItem.Text[I + 1]) >= $DC00)
      and (Ord(BestItem.Text[I + 1]) <= $DFFF) then
      StepLength := 2;
    Inc(I, StepLength);
    Inc(BoundaryCount);
    Boundaries[BoundaryCount] := I - 1;
  end;

  LowBoundary := 0;
  HighBoundary := BoundaryCount;
  while LowBoundary < HighBoundary do
  begin
    MidBoundary := LowBoundary + (HighBoundary - LowBoundary) div 2;
    CurrentPosition := Boundaries[MidBoundary];
    CurrentWidth := Canvas.TextWidth(Copy(BestItem.Text, 1, CurrentPosition));
    if CurrentWidth < LocalX then
      LowBoundary := MidBoundary + 1
    else
      HighBoundary := MidBoundary;
  end;

  if LowBoundary <= 0 then
    Result := BestItem.TextStart
  else if LowBoundary > BoundaryCount then
    Result := BestItem.TextStart + BestItem.SourceLength
  else
  begin
    CurrentPosition := Boundaries[LowBoundary];
    PreviousPosition := Boundaries[LowBoundary - 1];
    PreviousWidth := Canvas.TextWidth(Copy(BestItem.Text, 1, PreviousPosition));
    CurrentWidth := Canvas.TextWidth(Copy(BestItem.Text, 1, CurrentPosition));
    if LocalX < (PreviousWidth + CurrentWidth) * 0.5 then
      Result := BestItem.TextStart + PreviousPosition
    else
      Result := BestItem.TextStart + CurrentPosition;
  end;
end;

function TRTFDocumentView.SelectedText: string;
var
  LStart, LEnd: Integer;
begin
  Result := '';
  if FDirty then
    BuildLayout;
  if not FHasSelection then
    Exit;

  LStart := Min(FSelectionAnchor, FSelectionCaret);
  LEnd := Max(FSelectionAnchor, FSelectionCaret);
  LStart := EnsureRange(LStart, 0, Length(FCopyText));
  LEnd := EnsureRange(LEnd, LStart, Length(FCopyText));
  if LEnd > LStart then
    Result := Copy(FCopyText, LStart + 1, LEnd - LStart);
end;

procedure TRTFDocumentView.SelectAll;
begin
  if FDirty then
    BuildLayout;
  FSelectionAnchor := 0;
  FSelectionCaret := Length(FCopyText);
  FHasSelection := FSelectionCaret > 0;
  FSelecting := False;
  Repaint;
end;

procedure TRTFDocumentView.CopySelectionToClipboard;
var
  ClipboardService: IFMXClipboardService;
  LText: string;
begin
  LText := SelectedText;
  if LText = '' then
    Exit;

  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService,
    IInterface(ClipboardService)) then
    ClipboardService.SetClipboard(TValue.From<string>(LText));
end;

// TRTFViewerControl -----------------------------------------------------------
constructor TRTFViewerControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FScrollBars := rtfScrollVertical;
  FColor := TAlphaColors.White;
  FBorder := True;
  FAutoOpenLink := True;
  ClipChildren := True;
  TouchTracking := TBehaviorBoolean.True;
  ScrollAnimation := TBehaviorBoolean.True;
  Bounces := TBehaviorBoolean.False;

  FDocumentView := TRTFDocumentView.Create(Self);
  TRTFDocumentView(FDocumentView).FOwnerControl := Self;
  FDocumentView.Parent := Self;
  FDocumentView.Position.X := Padding.Left + BorderInset;
  FDocumentView.Position.Y := Padding.Top + BorderInset;
  FDocumentView.Width := Max(1, Width - Padding.Left - Padding.Right - 2 *
    BorderInset);
  FDocumentView.Height := 1;

  SetScrollBars(FScrollBars);
  CanFocus := True;
  TabStop := True;
end;

procedure TRTFViewerControl.KeyDown(var Key: Word; var KeyChar: WideChar;
Shift: TShiftState);
begin
  if (FDocumentView <> nil) and (ssCtrl in Shift) then
    case Key of
      Ord('A'):
        begin
          TRTFDocumentView(FDocumentView).SelectAll;
          Key := 0;
          KeyChar := #0;
          Exit;
        end;
      Ord('C'):
        begin
          TRTFDocumentView(FDocumentView).CopySelectionToClipboard;
          Key := 0;
          KeyChar := #0;
          Exit;
        end;
    end;

  inherited;
end;

procedure TRTFViewerControl.Resize;
begin
  inherited;
  UpdateDocumentWidth;
end;

function TRTFViewerControl.BorderInset: Single;
begin
  if FBorder then
    Result := 1
  else
    Result := 0;
end;

procedure TRTFViewerControl.UpdateDocumentWidth;
var
  LWidth, LInset: Single;
begin
  if FDocumentView = nil then
    Exit;

  LInset := BorderInset;
  LWidth := Max(1, Width - Padding.Left - Padding.Right - 2 * LInset);
  if FScrollBars in [rtfScrollHorizontal, rtfScrollBoth] then
    LWidth := Max(LWidth, TRTFDocumentView(FDocumentView).FContentWidth);

  FDocumentView.Position.X := Padding.Left + LInset;
  FDocumentView.Position.Y := Padding.Top + LInset;
  FDocumentView.Width := LWidth;
  TRTFDocumentView(FDocumentView).MarkDirty;
end;

procedure TRTFViewerControl.Paint;
begin
  inherited;
  if FBorder then
  begin
    Canvas.Stroke.Kind := TBrushKind.Solid;
    Canvas.Stroke.Color := $FFB8B8B8;
    Canvas.Stroke.Thickness := 1;
    Canvas.DrawRect(LocalRect, 0, 0, [], AbsoluteOpacity);
  end;
end;

procedure TRTFViewerControl.SetScrollBars(const AValue: TRTFScrollBars);
begin
  FScrollBars := AValue;
  case FScrollBars of
    rtfScrollNone:
      ScrollDirections := TCustomScrollBox.TScrollDirections.Vertical;
    rtfScrollVertical:
      ScrollDirections := TCustomScrollBox.TScrollDirections.Vertical;
    rtfScrollHorizontal:
      ScrollDirections := TCustomScrollBox.TScrollDirections.Horizontal;
    rtfScrollBoth:
      ScrollDirections := TCustomScrollBox.TScrollDirections.Both;
  end;
  ShowScrollBars := FScrollBars <> rtfScrollNone;
  UpdateDocumentWidth;
end;

procedure TRTFViewerControl.SetBackgroundColor(const AValue: TAlphaColor);
begin
  if FColor = AValue then
    Exit;
  FColor := AValue;
  if FDocumentView <> nil then
    FDocumentView.Repaint;
end;

procedure TRTFViewerControl.SetBorder(const AValue: Boolean);
begin
  if FBorder = AValue then
    Exit;
  FBorder := AValue;
  UpdateDocumentWidth;
  Repaint;
end;

procedure TRTFViewerControl.SetAutoOpenLink(const AValue: Boolean);
begin
  FAutoOpenLink := AValue;
end;

procedure TRTFViewerControl.SetOnLinkClick(const AValue: TRTFLinkClickEvent);
begin
  FOnLinkClick := AValue;
end;

procedure TRTFViewerControl.LinkClicked(const AURL: string);
var
  LURL: string;
  LWideURL: WideString;
  I: Integer;
begin
  if Assigned(FOnLinkClick) then
  begin
    FOnLinkClick(Self, AURL);
    Exit;
  end;

  if not FAutoOpenLink then
    Exit;

  LURL := Trim(AURL);
  if LURL = '' then
    Exit;

  // Never pass local paths, UNC paths, file: URLs or arbitrary protocol
  // handlers to ShellExecute from an RTF document.
  for I := 1 to Length(LURL) do
    if Ord(LURL[I]) <= 32 then
      Exit;

  if not(StartsText('http://', LURL) or StartsText('https://', LURL) or
    StartsText('mailto:', LURL)) then
    Exit;

  LWideURL := LURL;
  ShellExecuteW(0, 'open', PWideChar(LWideURL), nil, nil, 1);
end;

procedure TRTFViewerControl.SetRTFData(const AData: TBytes);
var
  Parser: TRTFParser;
  Document: TRTFDocument;
begin
  Parser := TRTFParser.Create;
  try
    Document := Parser.Parse(AData);
    TRTFDocumentView(FDocumentView).SetDocument(Document);
  finally
    Parser.Free;
  end;
end;

procedure TRTFViewerControl.LoadFromFile(const AFileName: string);
var
  Stream: TFileStream;
  Data: TBytes;
  Size64: Int64;
begin
  Stream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  try
    Size64 := Stream.Size;
    if Size64 > High(Integer) then
      raise Exception.Create('RTF file is too large');
    SetLength(Data, Integer(Size64));
    if Size64 > 0 then
      Stream.ReadBuffer(Data[0], Integer(Size64));
    SetRTFData(Data);
  finally
    Stream.Free;
  end;
end;

procedure TRTFViewerControl.SetRTFText(const AValue: WideString);
var
  CodePage: Integer;
  Encoding: TEncoding;
  Data: TBytes;
begin
  if AValue = '' then
  begin
    SetRTFData(nil);
    Exit;
  end;

  CodePage := RTFCodePage(AValue);
  try
    Encoding := TEncoding.GetEncoding(CodePage);
  except
    Encoding := TEncoding.GetEncoding(TEncoding.Default.CodePage);
  end;
  try
    Data := Encoding.GetBytes(string(AValue));
  finally
    Encoding.Free;
  end;
  SetRTFData(Data);
end;

end.
