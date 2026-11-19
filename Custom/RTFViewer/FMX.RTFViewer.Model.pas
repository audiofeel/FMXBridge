
unit FMX.RTFViewer.Model;

interface

uses
  System.Generics.Collections, System.UITypes,
  FMX.Graphics;

type
  TRTFParagraphAlign = (rpaLeft, rpaCenter, rpaRight, rpaJustify);
  TRTFListMarkerKind = (rlmkNone, rlmkDisc, rlmkCircle, rlmkSquare, rlmkText);
  TRTFTableAlign = (rtaLeft, rtaCenter, rtaRight);
  TRTFCellVerticalAlign = (rtvaTop, rtvaCenter, rtvaBottom);

  TRTFCellBorder = record
    Enabled: Boolean;
    Color: TAlphaColor;
    Width: Single;
  end;

  TRTFCellBorderDef = record
    Enabled: Boolean;
    WidthTwips: Integer;
    ColorIndex: Integer;
  end;

  TRTFCharStyle = record
    FontName: string;
    FontSize: Single;
    FontStyles: TFontStyles;
    TextColor: TAlphaColor;
    HighlightColor: TAlphaColor;
    SuperSub: ShortInt;
    LinkURL: string;
  end;

  TRTFParagraphStyle = record
    Align: TRTFParagraphAlign;
    LeftIndent: Single;
    RightIndent: Single;
    FirstLineIndent: Single;
    HasLeftIndent: Boolean;
    HasFirstLineIndent: Boolean;
    HasListLevelIndent: Boolean;
    HasListLevelFirstLineIndent: Boolean;
    ListOverride: Integer;
    ListLevel: Integer;
    ListMarkerGap: Single;
    SpaceBefore: Single;
    SpaceAfter: Single;
    // Raw RTF \sl value in twips. With \slmult1 it is a multiplier.
    LineSpacing: Single;
    LineSpacingMultiple: Boolean;
    InTable: Boolean;
    HasCellBackground: Boolean;
    CellBackgroundColor: TAlphaColor;
    CellLeft: Single;
    CellWidth: Single;
    CellMinHeight: Single;
    CellPaddingLeft: Single;
    CellPaddingRight: Single;
  end;

  TRTFListLevelInfo = record
    HasLeftIndent: Boolean;
    HasFirstLineIndent: Boolean;
    LeftIndentTwips: Integer;
    FirstLineIndentTwips: Integer;
  end;

  TRTFRun = class
  public
    Text: string;
    Style: TRTFCharStyle;
  end;

  TRTFParagraph = class
  public
    Runs: TObjectList<TRTFRun>;
    Style: TRTFParagraphStyle;
    HasBullet: Boolean;
    HasTextListMarker: Boolean;
    ListMarkerText: string;
    ListMarkerKind: TRTFListMarkerKind;
    ListMarkerStyle: TRTFCharStyle;
    constructor Create(const AStyle: TRTFParagraphStyle);
    destructor Destroy; override;
    function HasText: Boolean;
  end;

  TRTFTableCell = class
  public
    Paragraphs: TObjectList<TRTFParagraph>;
    LeftTwips: Integer;
    RightTwips: Integer;
    VerticalAlign: TRTFCellVerticalAlign;
    PaddingLeftTwips: Integer;
    PaddingRightTwips: Integer;
    PaddingTopTwips: Integer;
    PaddingBottomTwips: Integer;
    HasBackground: Boolean;
    BackgroundColor: TAlphaColor;
    Borders: array [0 .. 3] of TRTFCellBorder; // left, top, right, bottom
    constructor Create;
    destructor Destroy; override;
  end;

  TRTFTableRow = class
  public
    Cells: TObjectList<TRTFTableCell>;
    LeftTwips: Integer;
    MinHeightTwips: Integer;
    Align: TRTFTableAlign;
    constructor Create;
    destructor Destroy; override;
  end;

  TRTFBlockKind = (rbParagraph, rbImage, rbTable);

  TRTFBlock = class
  public
    Kind: TRTFBlockKind;
    Paragraph: TRTFParagraph;
    Bitmap: TBitmap;
    ImageWidth: Single;
    ImageHeight: Single;
    ImageAlign: TRTFParagraphAlign;
    TableRow: TRTFTableRow;
    constructor CreateParagraph(AParagraph: TRTFParagraph);
    constructor CreateImage(ABitmap: TBitmap; AWidth, AHeight: Single);
    constructor CreateTable(ATableRow: TRTFTableRow);
    destructor Destroy; override;
  end;

  TRTFDocument = class
  public
    Blocks: TObjectList<TRTFBlock>;
    Fonts: TDictionary<Integer, string>;
    Colors: TList<TAlphaColor>;
    constructor Create;
    destructor Destroy; override;
  end;

function IsHexChar(C: AnsiChar): Boolean;
function HexValue(C: AnsiChar): Byte;
function TwipsToPixels(AValue: Integer): Single;
function RTFLineAdvance(ALineHeight: Single;
  const AStyle: TRTFParagraphStyle): Single;
function SameCharStyle(const A, B: TRTFCharStyle): Boolean;
function RTFCodePage(const AText: AnsiString): Integer; overload;
function RTFCodePage(const AText: WideString): Integer; overload;
function RTFTableRowHasContent(ARow: TRTFTableRow): Boolean;

implementation

uses
  System.Math, System.SysUtils;

function IsHexChar(C: AnsiChar): Boolean;
begin
  Result := (C >= '0') and (C <= '9') or (C >= 'a') and (C <= 'f') or (C >= 'A')
    and (C <= 'F');
end;

function HexValue(C: AnsiChar): Byte;
begin
  if (C >= '0') and (C <= '9') then
    Result := Ord(C) - Ord('0')
  else if (C >= 'a') and (C <= 'f') then
    Result := Ord(C) - Ord('a') + 10
  else
    Result := Ord(C) - Ord('A') + 10;
end;

function TwipsToPixels(AValue: Integer): Single;
begin
  Result := AValue / 15.0;
end;

function RTFLineAdvance(ALineHeight: Single;
  const AStyle: TRTFParagraphStyle): Single;
var
  LValue: Single;
begin
  LValue := AStyle.LineSpacing;
  if (LValue = 0) or (LValue = 1000) then
    Exit(ALineHeight);

  if AStyle.LineSpacingMultiple then
    Exit(ALineHeight * Abs(LValue) / 240.0);

  if LValue < 0 then
    Result := TwipsToPixels(Round(Abs(LValue)))
  else
    Result := Max(ALineHeight, TwipsToPixels(Round(LValue)));
end;

function SameCharStyle(const A, B: TRTFCharStyle): Boolean;
begin
  Result := (A.FontName = B.FontName) and SameValue(A.FontSize, B.FontSize,
    0.01) and (A.FontStyles = B.FontStyles) and (A.TextColor = B.TextColor) and
    (A.HighlightColor = B.HighlightColor) and (A.SuperSub = B.SuperSub) and
    (A.LinkURL = B.LinkURL);
end;

function RTFCodePageFromHeader(const AHeader: string): Integer;
var
  P, StartPos, LValue: Integer;
  Digits: string;
begin
  Result := TEncoding.Default.CodePage;
  P := Pos('\ansicpg', AHeader);
  if P = 0 then
    Exit;

  StartPos := P + Length('\ansicpg');
  Digits := '';
  while (StartPos <= Length(AHeader)) and CharInSet(AHeader[StartPos],
    ['0' .. '9']) do
  begin
    Digits := Digits + AHeader[StartPos];
    Inc(StartPos);
  end;

  if (Digits <> '') and TryStrToInt(Digits, LValue) and (LValue > 0) then
    Result := LValue;
end;

function RTFCodePage(const AText: AnsiString): Integer; overload;
begin
  Result := RTFCodePageFromHeader(string(Copy(AText, 1, 2048)));
end;

function RTFCodePage(const AText: WideString): Integer; overload;
begin
  // Copy only the RTF header before converting to UnicodeString.
  Result := RTFCodePageFromHeader(string(Copy(AText, 1, 2048)));
end;

// TRTFParagraph ---------------------------------------------------------------
constructor TRTFParagraph.Create(const AStyle: TRTFParagraphStyle);
begin
  inherited Create;
  Runs := TObjectList<TRTFRun>.Create(True);
  Style := AStyle;
  HasBullet := False;
  HasTextListMarker := False;
  ListMarkerText := '';
  ListMarkerKind := rlmkNone;
  FillChar(ListMarkerStyle, SizeOf(ListMarkerStyle), 0);
end;

destructor TRTFParagraph.Destroy;
begin
  Runs.Free;
  inherited;
end;

function TRTFParagraph.HasText: Boolean;
var
  Run: TRTFRun;
begin
  for Run in Runs do
    if Run.Text <> '' then
      Exit(True);
  Result := False;
end;

function RTFTableRowHasContent(ARow: TRTFTableRow): Boolean;
var
  Cell: TRTFTableCell;
  Paragraph: TRTFParagraph;
begin
  Result := False;
  if ARow = nil then
    Exit;

  for Cell in ARow.Cells do
    for Paragraph in Cell.Paragraphs do
      if Paragraph.HasText or Paragraph.HasBullet or Paragraph.HasTextListMarker
      then
        Exit(True);
end;

// TRTFTableCell ---------------------------------------------------------------
constructor TRTFTableCell.Create;
begin
  inherited Create;
  Paragraphs := TObjectList<TRTFParagraph>.Create(True);
  BackgroundColor := TAlphaColors.Null;
  VerticalAlign := rtvaTop;
end;

destructor TRTFTableCell.Destroy;
begin
  Paragraphs.Free;
  inherited;
end;

// TRTFTableRow ----------------------------------------------------------------
constructor TRTFTableRow.Create;
begin
  inherited Create;
  Cells := TObjectList<TRTFTableCell>.Create(True);
  Align := rtaLeft;
end;

destructor TRTFTableRow.Destroy;
begin
  Cells.Free;
  inherited;
end;

// TRTFBlock -------------------------------------------------------------------
constructor TRTFBlock.CreateParagraph(AParagraph: TRTFParagraph);
begin
  inherited Create;
  Kind := rbParagraph;
  Paragraph := AParagraph;
end;

constructor TRTFBlock.CreateImage(ABitmap: TBitmap; AWidth, AHeight: Single);
begin
  inherited Create;
  Kind := rbImage;
  Bitmap := ABitmap;
  ImageWidth := AWidth;
  ImageHeight := AHeight;
  ImageAlign := rpaLeft;
  TableRow := nil;
end;

constructor TRTFBlock.CreateTable(ATableRow: TRTFTableRow);
begin
  inherited Create;
  Kind := rbTable;
  TableRow := ATableRow;
end;

destructor TRTFBlock.Destroy;
begin
  Paragraph.Free;
  Bitmap.Free;
  TableRow.Free;
  inherited;
end;

// TRTFDocument ----------------------------------------------------------------
constructor TRTFDocument.Create;
begin
  inherited Create;
  Blocks := TObjectList<TRTFBlock>.Create(True);
  Fonts := TDictionary<Integer, string>.Create;
  Colors := TList<TAlphaColor>.Create;
  Colors.Add(TAlphaColors.Black);
end;

destructor TRTFDocument.Destroy;
begin
  Colors.Free;
  Fonts.Free;
  Blocks.Free;
  inherited;
end;

end.
