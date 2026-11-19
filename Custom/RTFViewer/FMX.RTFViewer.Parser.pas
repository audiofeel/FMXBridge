
unit FMX.RTFViewer.Parser;

interface

uses
  System.SysUtils, System.Generics.Collections,
  FMX.RTFViewer.Model;

type
  TRTFPictureFormat = (rpfBitmap, rpfDIB, rpfWMF, rpfEMF);

  TRTFParserState = record
    CharStyle: TRTFCharStyle;
    ParaStyle: TRTFParagraphStyle;
    FontIndex: Integer;
    ColorIndex: Integer;
    HighlightIndex: Integer;
    CodePage: Integer;
    UnicodeFallback: Integer;
    // Current RTF table-row / cell properties. They survive \pard.
    TableLeftTwips: Integer;
    TableCellRightTwips: Integer;
    TableRowHeightTwips: Integer;
    TablePaddingLeftTwips: Integer;
    TablePaddingRightTwips: Integer;
    TablePaddingTopTwips: Integer;
    TablePaddingBottomTwips: Integer;
    TableCellPaddingLeftTwips: Integer;
    TableCellPaddingRightTwips: Integer;
    TableCellPaddingTopTwips: Integer;
    TableCellPaddingBottomTwips: Integer;
    TableCellBackgroundIndex: Integer;
    TableCurrentBorderSide: Integer;
    TableCellVerticalAlign: TRTFCellVerticalAlign;
    TableCellBorders: array [0 .. 3] of TRTFCellBorderDef;
  end;

  TRTFParser = class
  private
    FSource: AnsiString;
    FDocument: TRTFDocument;
    FState: TRTFParserState;
    FDefaultState: TRTFParserState;
    FStateStack: TList<TRTFParserState>;
    FListLevelInfo: TDictionary<string, TRTFListLevelInfo>;
    FListOverrideToID: TDictionary<Integer, Integer>;
    FCurrentParagraph: TRTFParagraph;
    FCurrentTableRow: TRTFTableRow;
    FCurrentTableCell: TRTFTableCell;
    FCurrentTableCellIndex: Integer;
    FSkipNextEmptyTableRow: Boolean;
    FTextBytes: TBytes;
    FFallbackToSkip: Integer;
    function FindGroupEnd(AStart: Integer): Integer;
    function GetGroupDestination(AStart: Integer; out ADestination: string;
      out AIgnorable: Boolean): Boolean;
    function IsSkippedDestination(const ADestination: string;
      AIgnorable: Boolean): Boolean;
    function FindDestinationGroup(const ADestination: string;
      out AStart, AFinish: Integer): Boolean;
    function ExtractFieldURL(AStart, AFinish: Integer): string;
    procedure ParseFontTable;
    procedure ParseColorTable;
    procedure ParseListTables;
    procedure ApplyListLevelIndent;
    procedure ParsePicture(AStart, AFinish: Integer);
    function ParseListText(AStart, AFinish: Integer): Boolean;
    procedure ParseLegacyPN(AStart, AFinish: Integer);
    function DecodeAnsi(const ABytes: TBytes; ACodePage: Integer): string;
    procedure FlushTextBytes;
    procedure AddText(const AText: string);
    procedure FinishParagraph(AForce: Boolean);
    procedure NewParagraph;
    procedure PushState;
    procedure PopState;
    procedure ProcessControlWord(var AIndex: Integer);
    procedure ProcessControlSymbol(var AIndex: Integer);
    procedure AppendByte(AValue: Byte);
    procedure ApplyColorIndex(AIndex: Integer; AHighlight: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(const AData: TBytes): TRTFDocument;
  end;

implementation

uses
  System.Classes, System.Math, System.StrUtils, System.UITypes,
  FMX.Graphics,
  FMX.RTFViewer.Imaging;

const
  RTF_MM_TEXT = 1;

// TRTFParser ------------------------------------------------------------------
constructor TRTFParser.Create;
begin
  inherited Create;
  FDocument := TRTFDocument.Create;
  FStateStack := TList<TRTFParserState>.Create;
  FListLevelInfo := TDictionary<string, TRTFListLevelInfo>.Create;
  FListOverrideToID := TDictionary<Integer, Integer>.Create;
  FCurrentTableRow := nil;
  FCurrentTableCell := nil;
  FCurrentTableCellIndex := 0;
  FSkipNextEmptyTableRow := False;
  FTextBytes := nil;
end;

destructor TRTFParser.Destroy;
begin
  FCurrentParagraph.Free;
  FCurrentTableRow.Free;
  FCurrentTableRow := nil;
  FCurrentTableCell := nil;
  FListOverrideToID.Free;
  FListLevelInfo.Free;
  FStateStack.Free;
  FDocument.Free;
  inherited;
end;

function TRTFParser.FindGroupEnd(AStart: Integer): Integer;
var
  I, Depth, WordStart, ParamStart, BinaryCount: Integer;
  WordName: string;
  HasParam: Boolean;
begin
  Result := Length(FSource);
  Depth := 0;
  I := AStart;
  while I <= Length(FSource) do
  begin
    if FSource[I] = '\' then
    begin
      Inc(I);
      if I > Length(FSource) then
        Break;

      if CharInSet(FSource[I], ['A' .. 'Z', 'a' .. 'z']) then
      begin
        WordStart := I;
        while (I <= Length(FSource)) and
          CharInSet(FSource[I], ['A' .. 'Z', 'a' .. 'z']) do
          Inc(I);
        WordName := LowerCase(string(Copy(FSource, WordStart, I - WordStart)));

        HasParam := False;
        BinaryCount := 0;
        if (I <= Length(FSource)) and CharInSet(FSource[I], ['-', '0' .. '9'])
        then
        begin
          ParamStart := I;
          if FSource[I] = '-' then
            Inc(I);
          while (I <= Length(FSource)) and
            CharInSet(FSource[I], ['0' .. '9']) do
            Inc(I);
          HasParam :=
            TryStrToInt(string(Copy(FSource, ParamStart, I - ParamStart)),
            BinaryCount);
        end;

        // A binary payload is opaque: braces and backslashes inside it are
        // data, not RTF group delimiters or control words.
        if (WordName = 'bin') and HasParam and (BinaryCount > 0) then
        begin
          if (I <= Length(FSource)) and (FSource[I] = ' ') then
            Inc(I);
          if BinaryCount > Length(FSource) - I + 1 then
            I := Length(FSource) + 1
          else
            Inc(I, BinaryCount);
          Continue;
        end;

        if (I <= Length(FSource)) and (FSource[I] = ' ') then
          Inc(I);
        Continue;
      end
      else
      begin
        // Escaped braces, backslash and control symbols.
        Inc(I);
        Continue;
      end;
    end;

    if FSource[I] = '{' then
      Inc(Depth)
    else if FSource[I] = '}' then
    begin
      Dec(Depth);
      if Depth = 0 then
      begin
        Result := I;
        Exit;
      end;
    end;
    Inc(I);
  end;
end;

function TRTFParser.GetGroupDestination(AStart: Integer;
  out ADestination: string; out AIgnorable: Boolean): Boolean;
var
  I: Integer;
  StartPos: Integer;
begin
  ADestination := '';
  AIgnorable := False;
  Result := False;
  if (AStart < 1) or (AStart > Length(FSource)) or (FSource[AStart] <> '{') then
    Exit;

  I := AStart + 1;
  while (I <= Length(FSource)) and CharInSet(FSource[I], [#9, #10, #13, ' ']) do
    Inc(I);

  if (I <= Length(FSource)) and (FSource[I] = '\') then
  begin
    Inc(I);
    if (I <= Length(FSource)) and (FSource[I] = '*') then
    begin
      AIgnorable := True;
      Inc(I);
      if (I <= Length(FSource)) and (FSource[I] = '\') then
        Inc(I);
    end;
    StartPos := I;
    while (I <= Length(FSource)) and CharInSet(FSource[I],
      ['A' .. 'Z', 'a' .. 'z']) do
      Inc(I);
    if I > StartPos then
    begin
      ADestination := LowerCase(string(Copy(FSource, StartPos, I - StartPos)));
      Result := True;
    end;
  end;
end;

function TRTFParser.IsSkippedDestination(const ADestination: string;
  AIgnorable: Boolean): Boolean;
begin
  Result := AIgnorable or (ADestination = 'fonttbl') or
    (ADestination = 'colortbl') or (ADestination = 'stylesheet') or
    (ADestination = 'info') or (ADestination = 'generator') or
    (ADestination = 'header') or (ADestination = 'headerf') or
    (ADestination = 'headerl') or (ADestination = 'headerr') or
    (ADestination = 'footer') or (ADestination = 'footerf') or
    (ADestination = 'footerl') or (ADestination = 'footerr') or
    (ADestination = 'annotation') or (ADestination = 'comment') or
    (ADestination = 'object') or (ADestination = 'objdata') or
    (ADestination = 'filetbl') or (ADestination = 'listtable') or
    (ADestination = 'listoverridetable') or (ADestination = 'revtbl') or
    (ADestination = 'fldinst') or (ADestination = 'nonshppict');
end;

function TRTFParser.FindDestinationGroup(const ADestination: string;
  out AStart, AFinish: Integer): Boolean;
var
  I: Integer;
  Dest: string;
  Ignorable: Boolean;
begin
  Result := False;
  AStart := 0;
  AFinish := 0;
  I := 1;
  while I <= Length(FSource) do
  begin
    if FSource[I] = '{' then
    begin
      if GetGroupDestination(I, Dest, Ignorable) and (Dest = ADestination) then
      begin
        AStart := I;
        AFinish := FindGroupEnd(I);
        Exit(True);
      end;
    end;
    Inc(I);
  end;
end;

function TRTFParser.ExtractFieldURL(AStart, AFinish: Integer): string;
var
  I, GroupEnd, P, Q, J, ContentStart: Integer;
  Destination, FieldText: string;
  Ignorable: Boolean;
begin
  Result := '';
  I := AStart + 1;
  while I < AFinish do
  begin
    if FSource[I] = '{' then
    begin
      if GetGroupDestination(I, Destination, Ignorable) and
        (Destination = 'fldinst') then
      begin
        GroupEnd := FindGroupEnd(I);
        ContentStart := I + 1;
        while (ContentStart < GroupEnd) and CharInSet(FSource[ContentStart],
          [#9, #10, #13, ' ']) do
          Inc(ContentStart);
        if (ContentStart < GroupEnd) and (FSource[ContentStart] = '\') then
        begin
          Inc(ContentStart);
          if (ContentStart < GroupEnd) and (FSource[ContentStart] = '*') then
            Inc(ContentStart);
          if (ContentStart < GroupEnd) and (FSource[ContentStart] = '\') then
            Inc(ContentStart);
          while (ContentStart < GroupEnd) and CharInSet(FSource[ContentStart],
            ['A' .. 'Z', 'a' .. 'z']) do
            Inc(ContentStart);
          if (ContentStart < GroupEnd) and (FSource[ContentStart] = ' ') then
            Inc(ContentStart);
        end;
        FieldText := string(Copy(FSource, ContentStart,
          GroupEnd - ContentStart));
        P := Pos('HYPERLINK', UpperCase(FieldText));
        if P > 0 then
        begin
          P := PosEx('"', FieldText, P + Length('HYPERLINK'));
          if P > 0 then
          begin
            Q := PosEx('"', FieldText, P + 1);
            if Q > P then
              Exit(Copy(FieldText, P + 1, Q - P - 1));
          end;
        end;
        Exit;
      end;
      J := FindGroupEnd(I);
      if J > I then
      begin
        I := J + 1;
        Continue;
      end;
    end;
    Inc(I);
  end;
end;

procedure TRTFParser.ParseFontTable;
var
  StartPos, EndPos, EntryEnd, I, J, K, FontIndex, Param: Integer;
  WordName, FontName: string;
  HasParam: Boolean;
begin
  if not FindDestinationGroup('fonttbl', StartPos, EndPos) then
    Exit;

  I := StartPos + Length('{\fonttbl');
  while I < EndPos do
  begin
    if CharInSet(FSource[I], [#9, #10, #13, ' ']) then
    begin
      Inc(I);
      Continue;
    end;

    if FSource[I] <> '{' then
    begin
      Inc(I);
      Continue;
    end;

    EntryEnd := FindGroupEnd(I);
    if EntryEnd <= I then
      Break;

    FontIndex := -1;
    FontName := '';
    J := I + 1;

    while J < EntryEnd do
    begin
      if FSource[J] = '\' then
      begin
        Inc(J);
        if (J < EntryEnd) and not CharInSet(FSource[J], ['A' .. 'Z', 'a' .. 'z'])
        then
        begin
          if FSource[J] = #39 then
            Inc(J, 3)
          else
            Inc(J);
          Continue;
        end;

        K := J;
        while (J < EntryEnd) and CharInSet(FSource[J],
          ['A' .. 'Z', 'a' .. 'z']) do
          Inc(J);
        WordName := LowerCase(string(Copy(FSource, K, J - K)));

        HasParam := False;
        Param := 0;
        if (J < EntryEnd) and CharInSet(FSource[J], ['-', '0' .. '9']) then
        begin
          K := J;
          if FSource[J] = '-' then
            Inc(J);
          while (J < EntryEnd) and CharInSet(FSource[J], ['0' .. '9']) do
            Inc(J);
          HasParam := TryStrToInt(string(Copy(FSource, K, J - K)), Param);
        end;

        if (WordName = 'f') and HasParam then
          FontIndex := Param;

        if (J < EntryEnd) and (FSource[J] = ' ') then
          Inc(J);
        Continue;
      end;

      if FSource[J] = '{' then
      begin
        J := FindGroupEnd(J) + 1;
        Continue;
      end;

      if FSource[J] = ';' then
        Break;

      if FSource[J] <> '}' then
        FontName := FontName + string(FSource[J]);
      Inc(J);
    end;

    if (FontIndex >= 0) and (Trim(FontName) <> '') then
      FDocument.Fonts.AddOrSetValue(FontIndex, Trim(FontName));

    I := EntryEnd + 1;
  end;
end;

procedure TRTFParser.ParseColorTable;
var
  StartPos, EndPos, I, J, Value: Integer;
  WordName: string;
  R, G, B: Byte;
begin
  if not FindDestinationGroup('colortbl', StartPos, EndPos) then
    Exit;

  FDocument.Colors.Clear;
  R := 0;
  G := 0;
  B := 0;
  I := StartPos + Length('{\colortbl');
  while I < EndPos do
  begin
    if FSource[I] = '\' then
    begin
      Inc(I);
      J := I;
      while (I < EndPos) and CharInSet(FSource[I], ['A' .. 'Z', 'a' .. 'z']) do
        Inc(I);
      WordName := LowerCase(string(Copy(FSource, J, I - J)));
      J := I;
      if (I < EndPos) and CharInSet(FSource[I], ['-', '0' .. '9']) then
      begin
        if FSource[I] = '-' then
          Inc(I);
        while (I < EndPos) and CharInSet(FSource[I], ['0' .. '9']) do
          Inc(I);
        if TryStrToInt(string(Copy(FSource, J, I - J)), Value) then
        begin
          Value := EnsureRange(Value, 0, 255);
          if WordName = 'red' then
            R := Byte(Value);
          if WordName = 'green' then
            G := Byte(Value);
          if WordName = 'blue' then
            B := Byte(Value);
        end;
      end;
      if (I < EndPos) and (FSource[I] = ' ') then
        Inc(I);
      Continue;
    end;

    if FSource[I] = ';' then
    begin
      FDocument.Colors.Add($FF000000 or (Cardinal(R) shl 16) or
        (Cardinal(G) shl 8) or Cardinal(B));
      R := 0;
      G := 0;
      B := 0;
    end;
    Inc(I);
  end;

  if FDocument.Colors.Count = 0 then
    FDocument.Colors.Add(TAlphaColors.Black);
end;

procedure TRTFParser.ParseListTables;
var
  TableStart, TableFinish, I, GroupFinish: Integer;
  Destination: string;
  Ignorable: Boolean;

  procedure ParseLevelGroup(AStart, AFinish, AListID, ALevel: Integer);
  var
    P, Q, Value, SignStart: Integer;
    WordName: string;
    Info: TRTFListLevelInfo;
    Key: string;
  begin
    FillChar(Info, SizeOf(Info), 0);
    P := AStart + 1;
    while P < AFinish do
    begin
      if FSource[P] = '{' then
      begin
        P := FindGroupEnd(P) + 1;
        Continue;
      end;

      if FSource[P] <> '\' then
      begin
        Inc(P);
        Continue;
      end;

      Inc(P);
      Q := P;
      while (P < AFinish) and CharInSet(FSource[P], ['A' .. 'Z', 'a' .. 'z']) do
        Inc(P);
      WordName := LowerCase(string(Copy(FSource, Q, P - Q)));

      if (P < AFinish) and CharInSet(FSource[P], ['-', '0' .. '9']) then
      begin
        SignStart := P;
        if FSource[P] = '-' then
          Inc(P);
        while (P < AFinish) and CharInSet(FSource[P], ['0' .. '9']) do
          Inc(P);
        if TryStrToInt(string(Copy(FSource, SignStart, P - SignStart)), Value)
        then
        begin
          if WordName = 'li' then
          begin
            Info.LeftIndentTwips := Value;
            Info.HasLeftIndent := True;
          end
          else if WordName = 'fi' then
          begin
            Info.FirstLineIndentTwips := Value;
            Info.HasFirstLineIndent := True;
          end;
        end;
      end;

      if (P < AFinish) and (FSource[P] = ' ') then
        Inc(P);
    end;

    Key := IntToStr(AListID) + ':' + IntToStr(ALevel);
    FListLevelInfo.AddOrSetValue(Key, Info);
  end;

  procedure ParseListDefinition(AStart, AFinish: Integer);
  var
    P, ChildFinish, ListID, LevelIndex: Integer;
    Dest: string;
    ChildIgnorable, HasListID: Boolean;
    WordName: string;
  begin
    ListID := 0;
    HasListID := False;
    P := AStart + 1;
    // First pass: listid is a top-level property of the list group.
    while P < AFinish do
    begin
      if FSource[P] = '{' then
      begin
        P := FindGroupEnd(P) + 1;
        Continue;
      end;
      if FSource[P] <> '\' then
      begin
        Inc(P);
        Continue;
      end;

      Inc(P);
      ChildFinish := P;
      while (P < AFinish) and CharInSet(FSource[P], ['A' .. 'Z', 'a' .. 'z']) do
        Inc(P);
      WordName := LowerCase(string(Copy(FSource, ChildFinish,
        P - ChildFinish)));
      if WordName = 'listid' then
      begin
        ChildFinish := P;
        if (P < AFinish) and CharInSet(FSource[P], ['-', '0' .. '9']) then
        begin
          if FSource[P] = '-' then
            Inc(P);
          while (P < AFinish) and CharInSet(FSource[P], ['0' .. '9']) do
            Inc(P);
          HasListID :=
            TryStrToInt(string(Copy(FSource, ChildFinish, P - ChildFinish)
            ), ListID);
        end;
      end
      else
      begin
        while (P < AFinish) and CharInSet(FSource[P], ['-', '0' .. '9']) do
          Inc(P);
      end;
      if (P < AFinish) and (FSource[P] = ' ') then
        Inc(P);
    end;

    if not HasListID then
      Exit;

    // Second pass: each direct listlevel child defines one level's indents.
    P := AStart + 1;
    LevelIndex := 0;
    while P < AFinish do
    begin
      if FSource[P] = '{' then
      begin
        ChildFinish := FindGroupEnd(P);
        if GetGroupDestination(P, Dest, ChildIgnorable) and (Dest = 'listlevel')
        then
        begin
          ParseLevelGroup(P, ChildFinish, ListID, LevelIndex);
          Inc(LevelIndex);
        end;
        P := ChildFinish + 1;
      end
      else
        Inc(P);
    end;
  end;

  procedure ParseOverrideGroup(AStart, AFinish: Integer);
  var
    P, Q, ListID, OverrideID, Value: Integer;
    HasListID: Boolean;
    WordName: string;
  begin
    ListID := 0;
    OverrideID := -1;
    HasListID := False;
    P := AStart + 1;
    while P < AFinish do
    begin
      if FSource[P] = '{' then
      begin
        P := FindGroupEnd(P) + 1;
        Continue;
      end;
      if FSource[P] <> '\' then
      begin
        Inc(P);
        Continue;
      end;

      Inc(P);
      Q := P;
      while (P < AFinish) and CharInSet(FSource[P], ['A' .. 'Z', 'a' .. 'z']) do
        Inc(P);
      WordName := LowerCase(string(Copy(FSource, Q, P - Q)));
      if (P < AFinish) and CharInSet(FSource[P], ['-', '0' .. '9']) then
      begin
        Q := P;
        if FSource[P] = '-' then
          Inc(P);
        while (P < AFinish) and CharInSet(FSource[P], ['0' .. '9']) do
          Inc(P);
        if TryStrToInt(string(Copy(FSource, Q, P - Q)), Value) then
        begin
          if WordName = 'listid' then
          begin
            ListID := Value;
            HasListID := True;
          end
          else if WordName = 'ls' then
            OverrideID := Value;
        end;
      end;
      if (P < AFinish) and (FSource[P] = ' ') then
        Inc(P);
    end;

    if HasListID and (OverrideID > 0) then
      FListOverrideToID.AddOrSetValue(OverrideID, ListID);
  end;

begin
  FListLevelInfo.Clear;
  FListOverrideToID.Clear;

  if FindDestinationGroup('listtable', TableStart, TableFinish) then
  begin
    I := TableStart + 1;
    while I < TableFinish do
    begin
      if FSource[I] = '{' then
      begin
        GroupFinish := FindGroupEnd(I);
        if GetGroupDestination(I, Destination, Ignorable) and
          (Destination = 'list') then
          ParseListDefinition(I, GroupFinish);
        I := GroupFinish + 1;
      end
      else
        Inc(I);
    end;
  end;

  if FindDestinationGroup('listoverridetable', TableStart, TableFinish) then
  begin
    I := TableStart + 1;
    while I < TableFinish do
    begin
      if FSource[I] = '{' then
      begin
        GroupFinish := FindGroupEnd(I);
        if GetGroupDestination(I, Destination, Ignorable) and
          (Destination = 'listoverride') then
          ParseOverrideGroup(I, GroupFinish);
        I := GroupFinish + 1;
      end
      else
        Inc(I);
    end;
  end;
end;

procedure TRTFParser.ApplyListLevelIndent;
var
  ListID, LevelIndex: Integer;
  Key: string;
  Info: TRTFListLevelInfo;
begin
  if (FState.ParaStyle.ListOverride <= 0) or (FListOverrideToID = nil) or
    (FListLevelInfo = nil) then
    Exit;

  if not FListOverrideToID.TryGetValue(FState.ParaStyle.ListOverride, ListID)
  then
    Exit;

  LevelIndex := Max(0, FState.ParaStyle.ListLevel);
  Key := IntToStr(ListID) + ':' + IntToStr(LevelIndex);
  if not FListLevelInfo.TryGetValue(Key, Info) then
    Exit;

  if Info.HasLeftIndent and not FState.ParaStyle.HasLeftIndent then
  begin
    FState.ParaStyle.LeftIndent := TwipsToPixels(Info.LeftIndentTwips);
    FState.ParaStyle.HasListLevelIndent := True;
  end;
  if Info.HasFirstLineIndent and not FState.ParaStyle.HasFirstLineIndent then
  begin
    FState.ParaStyle.FirstLineIndent :=
      TwipsToPixels(Info.FirstLineIndentTwips);
    FState.ParaStyle.HasListLevelFirstLineIndent := True;
  end;

  if FCurrentParagraph <> nil then
    FCurrentParagraph.Style := FState.ParaStyle;
end;

function TRTFParser.DecodeAnsi(const ABytes: TBytes;
  ACodePage: Integer): string;
var
  Encoding: TEncoding;
begin
  Result := '';
  if Length(ABytes) = 0 then
    Exit;
  try
    Encoding := TEncoding.GetEncoding(ACodePage);
    try
      Result := Encoding.GetString(ABytes);
    finally
      Encoding.Free;
    end;
  except
    Result := TEncoding.Default.GetString(ABytes);
  end;
end;

procedure TRTFParser.FlushTextBytes;
var
  S: string;
begin
  if Length(FTextBytes) = 0 then
    Exit;
  S := DecodeAnsi(FTextBytes, FState.CodePage);
  FTextBytes := nil;
  AddText(S);
end;

procedure TRTFParser.AppendByte(AValue: Byte);
var
  L: Integer;
begin
  L := Length(FTextBytes);
  SetLength(FTextBytes, L + 1);
  FTextBytes[L] := AValue;
end;

procedure TRTFParser.AddText(const AText: string);
var
  Run: TRTFRun;
begin
  if AText = '' then
    Exit;
  if FCurrentParagraph = nil then
    NewParagraph;

  if FCurrentParagraph.Runs.Count > 0 then
  begin
    Run := FCurrentParagraph.Runs.Last;
    if SameCharStyle(Run.Style, FState.CharStyle) then
    begin
      Run.Text := Run.Text + AText;
      Exit;
    end;
  end;

  Run := TRTFRun.Create;
  Run.Text := AText;
  Run.Style := FState.CharStyle;
  FCurrentParagraph.Runs.Add(Run);
end;

procedure TRTFParser.FinishParagraph(AForce: Boolean);
begin
  FlushTextBytes;
  if FCurrentParagraph = nil then
    Exit;
  if AForce or FCurrentParagraph.HasText then
  begin
    // The \intbl state may be enclosed in an RTF group and restored by }
    // before \cell. The active cell pointer is therefore authoritative.
    if (FCurrentTableRow <> nil) and (FCurrentTableCell <> nil) then
      FCurrentTableCell.Paragraphs.Add(FCurrentParagraph)
    else
      FDocument.Blocks.Add(TRTFBlock.CreateParagraph(FCurrentParagraph));
  end
  else
    FCurrentParagraph.Free;
  FCurrentParagraph := nil;
end;

procedure TRTFParser.NewParagraph;
begin
  if FCurrentParagraph = nil then
    FCurrentParagraph := TRTFParagraph.Create(FState.ParaStyle);
end;

procedure TRTFParser.PushState;
begin
  FlushTextBytes;
  FStateStack.Add(FState);
end;

procedure TRTFParser.PopState;
begin
  FlushTextBytes;
  if FStateStack.Count > 0 then
  begin
    FState := FStateStack.Last;
    FStateStack.Delete(FStateStack.Count - 1);
    if FCurrentParagraph <> nil then
      FCurrentParagraph.Style := FState.ParaStyle;
  end;
end;

procedure TRTFParser.ApplyColorIndex(AIndex: Integer; AHighlight: Boolean);
var
  C: TAlphaColor;
begin
  if (AIndex >= 0) and (AIndex < FDocument.Colors.Count) then
    C := FDocument.Colors[AIndex]
  else
    C := TAlphaColors.Black;

  if AHighlight then
  begin
    if AIndex = 0 then
      C := TAlphaColors.Null;
    FState.CharStyle.HighlightColor := C;
    FState.HighlightIndex := AIndex;
  end
  else
  begin
    FState.CharStyle.TextColor := C;
    FState.ColorIndex := AIndex;
  end;
end;

procedure TRTFParser.ParsePicture(AStart, AFinish: Integer);
var
  I, J, PicWidthPixels, PicHeightPixels: Integer;
  PicWidthGoal, PicHeightGoal: Integer;
  Nibble, ByteValue, HighNibble: Integer;
  ByteCount: Integer;
  WordName: string;
  HasParam: Boolean;
  Param: Integer;
  Bytes: TBytes;
  Stream: TBytesStream;
  Bitmap: TBitmap;
  DataStarted: Boolean;
  DestWidth, DestHeight: Single;
  RasterWidth, RasterHeight: Integer;
  PictureFormat: TRTFPictureFormat;
  WMFMapMode: Integer;
  ImageBlock: TRTFBlock;
begin
  I := AStart + 1;
  PicWidthPixels := 0;
  PicHeightPixels := 0;
  PicWidthGoal := 0;
  PicHeightGoal := 0;
  PictureFormat := rpfBitmap;
  WMFMapMode := RTF_MM_TEXT; // RTF default for \wmetafile is MM_TEXT.
  DataStarted := False;
  HighNibble := -1;
  ByteCount := 0;

  // Hex data needs at most one byte per two source characters.
  // A binary \binN block expands the buffer to its exact byte count below.
  SetLength(Bytes, Max(0, (AFinish - AStart) div 2));

  while I < AFinish do
  begin
    // Word may place picture properties and blip metadata inside nested
    // groups before the actual hexadecimal image payload.
    if (FSource[I] = '{') and not DataStarted then
    begin
      J := FindGroupEnd(I);
      if (J <= I) or (J >= AFinish) then
        Break;
      I := J + 1;
      Continue;
    end;

    if FSource[I] = '}' then
      Break;

    if FSource[I] = '\' then
    begin
      Inc(I);
      J := I;
      while (I < AFinish) and CharInSet(FSource[I], ['A' .. 'Z', 'a' .. 'z']) do
        Inc(I);
      WordName := LowerCase(string(Copy(FSource, J, I - J)));
      HasParam := False;
      Param := 0;
      if WordName = 'emfblip' then
        PictureFormat := rpfEMF
      else if (WordName = 'wmetafile') then
        PictureFormat := rpfWMF
      else if WordName = 'dibitmap' then
        PictureFormat := rpfDIB;
      if (I < AFinish) and CharInSet(FSource[I], ['-', '0' .. '9']) then
      begin
        J := I;
        if FSource[I] = '-' then
          Inc(I);
        while (I < AFinish) and CharInSet(FSource[I], ['0' .. '9']) do
          Inc(I);
        HasParam := TryStrToInt(string(Copy(FSource, J, I - J)), Param);
      end;
      if HasParam then
      begin
        if WordName = 'picw' then
          PicWidthPixels := Param
        else if WordName = 'pich' then
          PicHeightPixels := Param
        else if WordName = 'picwgoal' then
          PicWidthGoal := Param
        else if WordName = 'pichgoal' then
          PicHeightGoal := Param
        else if WordName = 'wmetafile' then
          WMFMapMode := Param;
      end;
      if (I < AFinish) and (FSource[I] = ' ') then
        Inc(I);

      if (WordName = 'bin') and HasParam then
      begin
        // \binN switches the next N source bytes to binary picture data.
        DataStarted := True;
        if Param > 0 then
        begin
          if Param > AFinish - I then
            Param := AFinish - I;
          if ByteCount + Param > Length(Bytes) then
            SetLength(Bytes, ByteCount + Param);
          while (Param > 0) and (I < AFinish) do
          begin
            Bytes[ByteCount] := Byte(FSource[I]);
            Inc(ByteCount);
            Inc(I);
            Dec(Param);
          end;
        end;
        Continue;
      end;
      Continue;
    end;

    if IsHexChar(FSource[I]) then
    begin
      DataStarted := True;
      Nibble := HexValue(FSource[I]);
      if HighNibble < 0 then
        HighNibble := Nibble
      else
      begin
        ByteValue := (HighNibble shl 4) or Nibble;
        if ByteCount < Length(Bytes) then
        begin
          Bytes[ByteCount] := Byte(ByteValue);
          Inc(ByteCount);
        end;
        HighNibble := -1;
      end;
    end
    else if DataStarted and CharInSet(FSource[I], [#9, #10, #13, ' ']) then
    begin
      // Whitespace between hexadecimal byte pairs.
    end;
    Inc(I);
  end;

  SetLength(Bytes, ByteCount);
  if ByteCount = 0 then
    Exit;

  DestWidth := PicWidthGoal / 15.0;
  DestHeight := PicHeightGoal / 15.0;

  // Prefer the source pixel dimensions when supplied. Otherwise render vector
  // formats at 2x the final FMX logical size to retain detail when scaled.
  RasterWidth := PicWidthPixels;
  RasterHeight := PicHeightPixels;
  if RasterWidth <= 0 then
  begin
    if DestWidth > 0 then
      RasterWidth := Round(DestWidth * 2);
  end;
  if RasterHeight <= 0 then
  begin
    if DestHeight > 0 then
      RasterHeight := Round(DestHeight * 2);
  end;
  if (RasterWidth > 0) and (RasterHeight <= 0) and (PicWidthPixels > 0) and
    (PicHeightPixels > 0) then
    RasterHeight := Round(RasterWidth * PicHeightPixels / PicWidthPixels);
  if (RasterHeight > 0) and (RasterWidth <= 0) and (PicWidthPixels > 0) and
    (PicHeightPixels > 0) then
    RasterWidth := Round(RasterHeight * PicWidthPixels / PicHeightPixels);

  Bitmap := nil;
  try
    case PictureFormat of
      rpfEMF:
        Bitmap := RTFLoadEMF(Bytes, RasterWidth, RasterHeight);
      rpfWMF:
        Bitmap := RTFLoadWMF(Bytes, WMFMapMode, PicWidthPixels, PicHeightPixels,
          RasterWidth, RasterHeight);
      rpfDIB:
        Bitmap := RTFLoadDIB(Bytes);
    else
      begin
        Bitmap := TBitmap.Create;
        Stream := TBytesStream.Create(Bytes);
        try
          try
            Bitmap.LoadFromStream(Stream);
          except
            FreeAndNil(Bitmap);
          end;
        finally
          Stream.Free;
        end;
      end;
    end;
  except
    FreeAndNil(Bitmap);
  end;
  if Bitmap = nil then
    Exit;

  if DestWidth <= 0 then
    DestWidth := Bitmap.Width;
  if DestHeight <= 0 then
    DestHeight := Bitmap.Height;

  FinishParagraph(False);
  ImageBlock := TRTFBlock.CreateImage(Bitmap, DestWidth, DestHeight);
  ImageBlock.ImageAlign := FState.ParaStyle.Align;
  FDocument.Blocks.Add(ImageBlock);
  NewParagraph;
end;

function TRTFParser.ParseListText(AStart, AFinish: Integer): Boolean;
var
  I, J, Param, FontIndex, FallbackRemaining, ByteValue, UnicodeFallback
    : Integer;
  WordName, FontName, Marker: string;
  HasParam, LegacyBullet: Boolean;
  MarkerBytes: TBytes;
  MarkerStyle: TRTFCharStyle;

  procedure AppendAnsiByte(AValue: Byte);
  var
    L: Integer;
  begin
    L := Length(MarkerBytes);
    SetLength(MarkerBytes, L + 1);
    MarkerBytes[L] := AValue;
  end;

  procedure FlushAnsiBytes;
  begin
    if Length(MarkerBytes) = 0 then
      Exit;
    Marker := Marker + DecodeAnsi(MarkerBytes, FState.CodePage);
    MarkerBytes := nil;
  end;

  procedure AppendUnicode(AValue: Integer);
  begin
    FlushAnsiBytes;
    if AValue < 0 then
      AValue := AValue + 65536;
    if (AValue >= 0) and (AValue <= $FFFF) then
      Marker := Marker + WideChar(Word(AValue));
  end;

begin
  Result := False;
  if FCurrentParagraph = nil then
    NewParagraph;

  I := AStart + 1;
  FontName := FState.CharStyle.FontName;
  MarkerStyle := FState.CharStyle;
  FallbackRemaining := 0;
  UnicodeFallback := 1;
  LegacyBullet := False;
  Marker := '';
  MarkerBytes := nil;

  while I < AFinish do
  begin
    if (FSource[I] = '{') or (FSource[I] = '}') then
    begin
      Inc(I);
      Continue;
    end;

    if FSource[I] = '\' then
    begin
      Inc(I);
      if I >= AFinish then
        Break;

      // RTF hex escape. After \uN, the fallback character is consumed but
      // not appended to the visible list marker.
      if FSource[I] = #39 then
      begin
        if (I + 2 < AFinish) and IsHexChar(FSource[I + 1]) and
          IsHexChar(FSource[I + 2]) then
        begin
          ByteValue := (HexValue(FSource[I + 1]) shl 4) or
            HexValue(FSource[I + 2]);
          if FallbackRemaining > 0 then
            Dec(FallbackRemaining)
          else if SameText(FontName, 'Wingdings') and (ByteValue >= $F9) and
            (ByteValue <= $FE) then
          begin
            FlushAnsiBytes;
            // Wingdings is a symbol font, not an ANSI text font. Preserve
            // common check/cross/box glyphs as portable Unicode characters.
            case ByteValue of
              $F9:
                Marker := Marker + WideChar($25AD); // White rectangle.
              $FA:
                Marker := Marker + WideChar($25AB); // White small square.
              $FB:
                Marker := Marker + WideChar($2717); // Ballot X.
              $FC:
                Marker := Marker + WideChar($2713); // Check mark.
              $FD:
                Marker := Marker + WideChar($2612); // Ballot box with X.
              $FE:
                Marker := Marker + WideChar($2611); // Ballot box with check.
            end;
            MarkerStyle.FontName := 'Segoe UI Symbol';
          end
          else if SameText(FontName, 'Symbol') and (ByteValue = $B7) then
          begin
            FlushAnsiBytes;
            Marker := Marker + WideChar($2022);
          end
          else
            AppendAnsiByte(Byte(ByteValue));
          Inc(I, 3);
        end
        else
          Inc(I);
        Continue;
      end;

      if not CharInSet(FSource[I], ['A' .. 'Z', 'a' .. 'z']) then
      begin
        if FSource[I] = '*' then
          Inc(I)
        else if FSource[I] = '~' then
        begin
          if FallbackRemaining > 0 then
            Dec(FallbackRemaining)
          else
          begin
            FlushAnsiBytes;
            Marker := Marker + WideChar($00A0);
          end;
          Inc(I);
        end
        else
          Inc(I);
        Continue;
      end;

      J := I;
      while (I < AFinish) and CharInSet(FSource[I], ['A' .. 'Z', 'a' .. 'z']) do
        Inc(I);
      WordName := LowerCase(string(Copy(FSource, J, I - J)));

      HasParam := False;
      Param := 0;
      if (I < AFinish) and CharInSet(FSource[I], ['-', '0' .. '9']) then
      begin
        J := I;
        if FSource[I] = '-' then
          Inc(I);
        while (I < AFinish) and CharInSet(FSource[I], ['0' .. '9']) do
          Inc(I);
        HasParam := TryStrToInt(string(Copy(FSource, J, I - J)), Param);
      end;

      if (I < AFinish) and (FSource[I] = ' ') then
        Inc(I);

      if WordName = 'tab' then
        Break
      else if WordName = 'par' then
        Break
      else if (WordName = 'f') and HasParam then
      begin
        FontIndex := Param;
        if FDocument.Fonts.TryGetValue(FontIndex, FontName) then
          MarkerStyle.FontName := FontName;
      end
      else if (WordName = 'fs') and HasParam and (Param > 0) then
        MarkerStyle.FontSize := Param / 2.0
      else if (WordName = 'cf') and HasParam and (Param >= 0) and
        (Param < FDocument.Colors.Count) then
        MarkerStyle.TextColor := FDocument.Colors[Param]
      else if WordName = 'b' then
      begin
        if not HasParam or (Param <> 0) then
          Include(MarkerStyle.FontStyles, TFontStyle.fsBold)
        else
          Exclude(MarkerStyle.FontStyles, TFontStyle.fsBold);
      end
      else if WordName = 'i' then
      begin
        if not HasParam or (Param <> 0) then
          Include(MarkerStyle.FontStyles, TFontStyle.fsItalic)
        else
          Exclude(MarkerStyle.FontStyles, TFontStyle.fsItalic);
      end
      else if WordName = 'bullet' then
      begin
        FlushAnsiBytes;
        Marker := Marker + WideChar($2022);
      end
      else if (WordName = 'uc') and HasParam then
        UnicodeFallback := EnsureRange(Param, 0, 16)
      else if (WordName = 'u') and HasParam then
      begin
        AppendUnicode(Param);
        FallbackRemaining := UnicodeFallback;
      end
      else if WordName = 'emdash' then
      begin
        FlushAnsiBytes;
        Marker := Marker + WideChar($2014);
      end
      else if WordName = 'endash' then
      begin
        FlushAnsiBytes;
        Marker := Marker + WideChar($2013);
      end
      else if WordName = 'lquote' then
      begin
        FlushAnsiBytes;
        Marker := Marker + WideChar($2018);
      end
      else if WordName = 'rquote' then
      begin
        FlushAnsiBytes;
        Marker := Marker + WideChar($2019);
      end
      else if WordName = 'pnlvlblt' then
        LegacyBullet := True;
      Continue;
    end;

    if FallbackRemaining > 0 then
    begin
      Dec(FallbackRemaining);
      Inc(I);
      Continue;
    end;

    AppendAnsiByte(Byte(FSource[I]));
    Inc(I);
  end;

  FlushAnsiBytes;
  Marker := Trim(Marker);

  if LegacyBullet and (Marker = '') then
    Marker := WideChar($2022);

  if Marker = '' then
    Exit;

  FCurrentParagraph.ListMarkerText := Marker;
  FCurrentParagraph.ListMarkerStyle := MarkerStyle;
  FCurrentParagraph.ListMarkerKind := rlmkText;

  // Common Unicode bullet encodings and the Symbol middle dot are converted
  // to native FMX shapes. Wingdings-specific check/cross/box glyphs above are
  // kept as their corresponding Unicode symbols rather than treated as dots.
  if (Length(Marker) = 1) then
  begin
    case Ord(Marker[1]) of
      $2022, $00B7, $25CF, $F0B7, $F0A7:
        FCurrentParagraph.ListMarkerKind := rlmkDisc;
      $25E6, $25CB, $2218, $F0A1:
        FCurrentParagraph.ListMarkerKind := rlmkCircle;
      $25AA, $25A0, $25FE, $25A1, $F0A0:
        FCurrentParagraph.ListMarkerKind := rlmkSquare;
    end;
  end;

  if FCurrentParagraph.ListMarkerKind in [rlmkDisc, rlmkCircle, rlmkSquare] then
  begin
    FCurrentParagraph.HasBullet := True;
    FCurrentParagraph.HasTextListMarker := False;
  end
  else
  begin
    FCurrentParagraph.HasTextListMarker := True;
    FCurrentParagraph.HasBullet := False;
  end;

  Result := True;
end;

procedure TRTFParser.ParseLegacyPN(AStart, AFinish: Integer);
var
  I, J, Param, FontIndex: Integer;
  WordName: string;
  HasParam, Hanging: Boolean;
  MarkerStyle: TRTFCharStyle;
begin
  if FCurrentParagraph = nil then
    NewParagraph;

  I := AStart + 1;
  Hanging := False;
  MarkerStyle := FCurrentParagraph.ListMarkerStyle;
  if MarkerStyle.FontName = '' then
    MarkerStyle := FState.CharStyle;

  while I < AFinish do
  begin
    if FSource[I] <> '\' then
    begin
      Inc(I);
      Continue;
    end;

    Inc(I);
    if I >= AFinish then
      Break;

    if not CharInSet(FSource[I], ['A' .. 'Z', 'a' .. 'z']) then
    begin
      Inc(I);
      Continue;
    end;

    J := I;
    while (I < AFinish) and CharInSet(FSource[I], ['A' .. 'Z', 'a' .. 'z']) do
      Inc(I);
    WordName := LowerCase(string(Copy(FSource, J, I - J)));

    HasParam := False;
    Param := 0;
    if (I < AFinish) and CharInSet(FSource[I], ['-', '0' .. '9']) then
    begin
      J := I;
      if FSource[I] = '-' then
        Inc(I);
      while (I < AFinish) and CharInSet(FSource[I], ['0' .. '9']) do
        Inc(I);
      HasParam := TryStrToInt(string(Copy(FSource, J, I - J)), Param);
    end;

    if (I < AFinish) and (FSource[I] = ' ') then
      Inc(I);

    if (WordName = 'pnindent') and HasParam then
    begin
      if not FState.ParaStyle.HasLeftIndent then
      begin
        FState.ParaStyle.LeftIndent := TwipsToPixels(Param);
        FState.ParaStyle.HasLeftIndent := True;
      end;
      if not FState.ParaStyle.HasFirstLineIndent then
      begin
        FState.ParaStyle.FirstLineIndent := -TwipsToPixels(Param);
        FState.ParaStyle.HasFirstLineIndent := True;
      end;
    end
    else if (WordName = 'pnsp') and HasParam then
      FState.ParaStyle.ListMarkerGap := Max(0, TwipsToPixels(Param))
    else if (WordName = 'pnlvl') and HasParam then
      FState.ParaStyle.ListLevel := EnsureRange(Param - 1, 0, 8)
    else if WordName = 'pnlvlblt' then
    begin
      if FCurrentParagraph.ListMarkerKind = rlmkNone then
      begin
        FCurrentParagraph.HasBullet := True;
        FCurrentParagraph.ListMarkerKind := rlmkDisc;
      end;
    end
    else if (WordName = 'pnf') and HasParam then
    begin
      FontIndex := Param;
      if FDocument.Fonts.TryGetValue(FontIndex, WordName) then
        MarkerStyle.FontName := WordName;
    end
    else if (WordName = 'pnfs') and HasParam and (Param > 0) then
      MarkerStyle.FontSize := Param / 2.0
    else if (WordName = 'pncf') and HasParam and (Param >= 0) and
      (Param < FDocument.Colors.Count) then
      MarkerStyle.TextColor := FDocument.Colors[Param]
    else if WordName = 'pnb' then
      Include(MarkerStyle.FontStyles, TFontStyle.fsBold)
    else if WordName = 'pni' then
      Include(MarkerStyle.FontStyles, TFontStyle.fsItalic)
    else if WordName = 'pnhang' then
      Hanging := True;
  end;

  if Hanging and not FState.ParaStyle.HasFirstLineIndent then
  begin
    FState.ParaStyle.FirstLineIndent := -FState.ParaStyle.LeftIndent;
    FState.ParaStyle.HasFirstLineIndent := True;
  end;

  // ParseListText translates the Wingdings byte into a Unicode symbol.
  // The following \pnf control word selects Wingdings again, which does not
  // contain that Unicode glyph and therefore displays a missing-glyph box.
  // Keep the translated marker on a Unicode symbol font.
  if SameText(MarkerStyle.FontName, 'Wingdings') and
    (Length(FCurrentParagraph.ListMarkerText) = 1) and
    ((Ord(FCurrentParagraph.ListMarkerText[1]) = $25AD) or
    (Ord(FCurrentParagraph.ListMarkerText[1]) = $25AB) or
    (Ord(FCurrentParagraph.ListMarkerText[1]) = $2717) or
    (Ord(FCurrentParagraph.ListMarkerText[1]) = $2713) or
    (Ord(FCurrentParagraph.ListMarkerText[1]) = $2612) or
    (Ord(FCurrentParagraph.ListMarkerText[1]) = $2611)) then
    MarkerStyle.FontName := 'Segoe UI Symbol';

  FCurrentParagraph.Style := FState.ParaStyle;
  if (MarkerStyle.FontName <> '') or (MarkerStyle.FontSize > 0) then
    FCurrentParagraph.ListMarkerStyle := MarkerStyle;
end;

procedure TRTFParser.ProcessControlWord(var AIndex: Integer);
var
  StartPos: Integer;
  WordName: string;
  Param: Integer;
  HasParam: Boolean;
  DigitStart: Integer;
  N: Integer;
  SavedLinkURL: string;
  Cell: TRTFTableCell;
begin
  Inc(AIndex); // Skip backslash.
  StartPos := AIndex;
  while (AIndex <= Length(FSource)) and CharInSet(FSource[AIndex],
    ['A' .. 'Z', 'a' .. 'z']) do
    Inc(AIndex);
  WordName := LowerCase(string(Copy(FSource, StartPos, AIndex - StartPos)));

  HasParam := False;
  Param := 0;
  if (AIndex <= Length(FSource)) and CharInSet(FSource[AIndex],
    ['-', '0' .. '9']) then
  begin
    DigitStart := AIndex;
    if FSource[AIndex] = '-' then
      Inc(AIndex);
    while (AIndex <= Length(FSource)) and CharInSet(FSource[AIndex],
      ['0' .. '9']) do
      Inc(AIndex);
    HasParam := TryStrToInt(string(Copy(FSource, DigitStart,
      AIndex - DigitStart)), Param);
  end;

  if (AIndex <= Length(FSource)) and (FSource[AIndex] = ' ') then
    Inc(AIndex); // A single delimiter space is not document text.

  if FFallbackToSkip > 0 then
  begin
    Dec(FFallbackToSkip);
    Exit;
  end;

  if WordName = 'ansicpg' then
  begin
    FlushTextBytes;
    if HasParam and (Param > 0) then
      FState.CodePage := Param;
  end
  // \af / \afs describe the alternate complex-script font. The current
  // renderer does not yet track \dbch versus \loch text runs, so these must
  // not overwrite the primary Western font selected by \f / \fs.
  else if WordName = 'f' then
  begin
    FlushTextBytes;
    if HasParam then
    begin
      FState.FontIndex := Param;
      if not FDocument.Fonts.TryGetValue(Param, FState.CharStyle.FontName) then
        FState.CharStyle.FontName := 'Segoe UI';
    end;
  end
  else if WordName = 'fs' then
  begin
    FlushTextBytes;
    if HasParam and (Param > 0) then
      FState.CharStyle.FontSize := Param / 2.0;
  end
  else if WordName = 'b' then
  begin
    FlushTextBytes;
    if not HasParam or (Param <> 0) then
      Include(FState.CharStyle.FontStyles, TFontStyle.fsBold)
    else
      Exclude(FState.CharStyle.FontStyles, TFontStyle.fsBold);
  end
  else if WordName = 'i' then
  begin
    FlushTextBytes;
    if not HasParam or (Param <> 0) then
      Include(FState.CharStyle.FontStyles, TFontStyle.fsItalic)
    else
      Exclude(FState.CharStyle.FontStyles, TFontStyle.fsItalic);
  end
  else if (WordName = 'ul') or (WordName = 'ulw') or (WordName = 'uld') then
  begin
    FlushTextBytes;
    if not HasParam or (Param <> 0) then
      Include(FState.CharStyle.FontStyles, TFontStyle.fsUnderline)
    else
      Exclude(FState.CharStyle.FontStyles, TFontStyle.fsUnderline);
  end
  else if (WordName = 'ulnone') or (WordName = 'ul0') then
  begin
    FlushTextBytes;
    Exclude(FState.CharStyle.FontStyles, TFontStyle.fsUnderline);
  end
  else if WordName = 'strike' then
  begin
    FlushTextBytes;
    if not HasParam or (Param <> 0) then
      Include(FState.CharStyle.FontStyles, TFontStyle.fsStrikeOut)
    else
      Exclude(FState.CharStyle.FontStyles, TFontStyle.fsStrikeOut);
  end
  else if WordName = 'cf' then
  begin
    FlushTextBytes;
    if HasParam then
      ApplyColorIndex(Param, False);
  end
  else if WordName = 'highlight' then
  begin
    FlushTextBytes;
    if HasParam then
      ApplyColorIndex(Param, True);
  end
  else if WordName = 'super' then
  begin
    FlushTextBytes;
    FState.CharStyle.SuperSub := 1;
  end
  else if WordName = 'sub' then
  begin
    FlushTextBytes;
    FState.CharStyle.SuperSub := -1;
  end
  else if WordName = 'nosupersub' then
  begin
    FlushTextBytes;
    FState.CharStyle.SuperSub := 0;
  end
  else if WordName = 'uc' then
  begin
    if HasParam then
      FState.UnicodeFallback := EnsureRange(Param, 0, 16);
  end
  else if WordName = 'u' then
  begin
    FlushTextBytes;
    if HasParam then
    begin
      N := Param;
      if N < 0 then
        N := N + 65536;
      AddText(WideChar(Word(N)));
      FFallbackToSkip := FState.UnicodeFallback;
    end;
  end
  else if WordName = 'plain' then
  begin
    FlushTextBytes;
    SavedLinkURL := FState.CharStyle.LinkURL;
    FState.CharStyle := FDefaultState.CharStyle;
    FState.CharStyle.LinkURL := SavedLinkURL;
    FState.FontIndex := FDefaultState.FontIndex;
    FState.ColorIndex := FDefaultState.ColorIndex;
    FState.HighlightIndex := FDefaultState.HighlightIndex;
  end
  else if WordName = 'pard' then
  begin
    FlushTextBytes;
    FState.ParaStyle := FDefaultState.ParaStyle;
    if FCurrentParagraph <> nil then
      FCurrentParagraph.Style := FState.ParaStyle;
  end
  else if WordName = 'trowd' then
  begin
    // Start a new table row. Some Word-generated RTF repeats an empty row
    // descriptor after the content cell has already ended with \cell.
    // Preserve the populated row instead of freeing it when that happens.
    FinishParagraph(False);
    if FCurrentTableRow <> nil then
    begin
      if RTFTableRowHasContent(FCurrentTableRow) then
      begin
        // \intbl may have created a speculative empty cell after the last
        // completed cell. It is not part of the populated row.
        if (FCurrentTableCell <> nil) and (FCurrentTableRow.Cells.Count > 0) and
          (FCurrentTableRow.Cells.Last = FCurrentTableCell) and
          (FCurrentTableCell.Paragraphs.Count = 0) then
          FCurrentTableRow.Cells.Delete(FCurrentTableRow.Cells.Count - 1);

        FDocument.Blocks.Add(TRTFBlock.CreateTable(FCurrentTableRow));
        FCurrentTableRow := nil;
        FSkipNextEmptyTableRow := True;
      end
      else
        FreeAndNil(FCurrentTableRow);
    end;

    FCurrentTableRow := TRTFTableRow.Create;
    FCurrentTableRow.LeftTwips := 0;
    FCurrentTableRow.MinHeightTwips := 0;
    FCurrentTableRow.Align := rtaLeft;
    FCurrentTableCell := nil;
    FCurrentTableCellIndex := 0;
    FState.TableLeftTwips := 0;
    FState.TableCellRightTwips := 0;
    FState.TableRowHeightTwips := 0;
    FState.TablePaddingLeftTwips := 0;
    FState.TablePaddingRightTwips := 0;
    FState.TablePaddingTopTwips := 0;
    FState.TablePaddingBottomTwips := 0;
    FState.TableCellPaddingLeftTwips := -1;
    FState.TableCellPaddingRightTwips := -1;
    FState.TableCellPaddingTopTwips := -1;
    FState.TableCellPaddingBottomTwips := -1;
    FState.TableCellBackgroundIndex := -1;
    FState.TableCurrentBorderSide := -1;
    FState.TableCellVerticalAlign := rtvaTop;
    FillChar(FState.TableCellBorders, SizeOf(FState.TableCellBorders), 0);
  end
  else if (WordName = 'trleft') and HasParam then
  begin
    FState.TableLeftTwips := Param;
    if FCurrentTableRow <> nil then
      FCurrentTableRow.LeftTwips := Param;
  end
  else if (WordName = 'trrh') and HasParam then
  begin
    FState.TableRowHeightTwips := Param;
    if FCurrentTableRow <> nil then
      FCurrentTableRow.MinHeightTwips := Param;
  end
  else if WordName = 'trql' then
  begin
    if FCurrentTableRow <> nil then
      FCurrentTableRow.Align := rtaLeft;
  end
  else if WordName = 'trqc' then
  begin
    if FCurrentTableRow <> nil then
      FCurrentTableRow.Align := rtaCenter;
  end
  else if WordName = 'trqr' then
  begin
    if FCurrentTableRow <> nil then
      FCurrentTableRow.Align := rtaRight;
  end
  else if (WordName = 'trpaddl') and HasParam then
    FState.TablePaddingLeftTwips := Param
  else if (WordName = 'trpaddr') and HasParam then
    FState.TablePaddingRightTwips := Param
  else if (WordName = 'trpaddt') and HasParam then
    FState.TablePaddingTopTwips := Param
  else if (WordName = 'trpaddb') and HasParam then
    FState.TablePaddingBottomTwips := Param
  else if (WordName = 'clpadl') and HasParam then
    FState.TableCellPaddingLeftTwips := Param
  else if (WordName = 'clpadr') and HasParam then
    FState.TableCellPaddingRightTwips := Param
  else if (WordName = 'clpadt') and HasParam then
    FState.TableCellPaddingTopTwips := Param
  else if (WordName = 'clpadb') and HasParam then
    FState.TableCellPaddingBottomTwips := Param
  else if WordName = 'clbrdrl' then
    FState.TableCurrentBorderSide := 0
  else if WordName = 'clbrdrt' then
    FState.TableCurrentBorderSide := 1
  else if WordName = 'clbrdrr' then
    FState.TableCurrentBorderSide := 2
  else if WordName = 'clbrdrb' then
    FState.TableCurrentBorderSide := 3
  else if WordName = 'clvertalt' then
    FState.TableCellVerticalAlign := rtvaTop
  else if WordName = 'clvertalc' then
    FState.TableCellVerticalAlign := rtvaCenter
  else if WordName = 'clvertalb' then
    FState.TableCellVerticalAlign := rtvaBottom
  else if (WordName = 'brdrs') or (WordName = 'brdrdb') or
    (WordName = 'brdrdot') or (WordName = 'brdrdash') or (WordName = 'brdrhair')
  then
  begin
    if (FState.TableCurrentBorderSide >= 0) and
      (FState.TableCurrentBorderSide <= 3) then
    begin
      FState.TableCellBorders[FState.TableCurrentBorderSide].Enabled := True;
      if FState.TableCellBorders[FState.TableCurrentBorderSide].WidthTwips = 0
      then
        FState.TableCellBorders[FState.TableCurrentBorderSide].WidthTwips := 15;
    end;
  end
  else if (WordName = 'brdrnil') or (WordName = 'brdrnone') then
  begin
    if (FState.TableCurrentBorderSide >= 0) and
      (FState.TableCurrentBorderSide <= 3) then
      FState.TableCellBorders[FState.TableCurrentBorderSide].Enabled := False;
  end
  else if (WordName = 'brdrw') and HasParam then
  begin
    if (FState.TableCurrentBorderSide >= 0) and
      (FState.TableCurrentBorderSide <= 3) then
      FState.TableCellBorders[FState.TableCurrentBorderSide].WidthTwips
        := Param;
  end
  else if (WordName = 'brdrcf') and HasParam then
  begin
    if (FState.TableCurrentBorderSide >= 0) and
      (FState.TableCurrentBorderSide <= 3) then
      FState.TableCellBorders[FState.TableCurrentBorderSide].ColorIndex
        := Param;
  end
  else if (WordName = 'clcbpat') and HasParam then
    FState.TableCellBackgroundIndex := Param
  else if (WordName = 'cellx') and HasParam then
  begin
    if FCurrentTableRow = nil then
    begin
      FCurrentTableRow := TRTFTableRow.Create;
      FCurrentTableCellIndex := 0;
    end;

    // In an RTF row, each \cellx is the right edge of the next cell.
    // The previous edge (or \trleft for the first cell) is its left edge.
    Cell := TRTFTableCell.Create;
    if FCurrentTableRow.Cells.Count = 0 then
      Cell.LeftTwips := FState.TableLeftTwips
    else
      Cell.LeftTwips := FCurrentTableRow.Cells.Last.RightTwips;
    Cell.RightTwips := Param;
    Cell.VerticalAlign := FState.TableCellVerticalAlign;
    Cell.PaddingLeftTwips := FState.TableCellPaddingLeftTwips;
    if Cell.PaddingLeftTwips < 0 then
      Cell.PaddingLeftTwips := FState.TablePaddingLeftTwips;
    Cell.PaddingRightTwips := FState.TableCellPaddingRightTwips;
    if Cell.PaddingRightTwips < 0 then
      Cell.PaddingRightTwips := FState.TablePaddingRightTwips;
    Cell.PaddingTopTwips := FState.TableCellPaddingTopTwips;
    if Cell.PaddingTopTwips < 0 then
      Cell.PaddingTopTwips := FState.TablePaddingTopTwips;
    Cell.PaddingBottomTwips := FState.TableCellPaddingBottomTwips;
    if Cell.PaddingBottomTwips < 0 then
      Cell.PaddingBottomTwips := FState.TablePaddingBottomTwips;
    Cell.HasBackground := (FState.TableCellBackgroundIndex > 0) and
      (FState.TableCellBackgroundIndex < FDocument.Colors.Count);
    if Cell.HasBackground then
      Cell.BackgroundColor := FDocument.Colors[FState.TableCellBackgroundIndex];
    for N := 0 to 3 do
    begin
      Cell.Borders[N].Enabled := FState.TableCellBorders[N].Enabled;
      Cell.Borders[N].Width :=
        Max(1, TwipsToPixels(FState.TableCellBorders[N].WidthTwips));
      if (FState.TableCellBorders[N].ColorIndex >= 0) and
        (FState.TableCellBorders[N].ColorIndex < FDocument.Colors.Count) then
        Cell.Borders[N].Color := FDocument.Colors
          [FState.TableCellBorders[N].ColorIndex]
      else
        Cell.Borders[N].Color := TAlphaColors.Black;
    end;
    FCurrentTableRow.Cells.Add(Cell);

    FState.TableCellRightTwips := Param;
    FState.TableCellPaddingLeftTwips := -1;
    FState.TableCellPaddingRightTwips := -1;
    FState.TableCellPaddingTopTwips := -1;
    FState.TableCellPaddingBottomTwips := -1;
    FState.TableCellBackgroundIndex := -1;
    FState.TableCurrentBorderSide := -1;
    FState.TableCellVerticalAlign := rtvaTop;
    FillChar(FState.TableCellBorders, SizeOf(FState.TableCellBorders), 0);
  end
  else if WordName = 'intbl' then
  begin
    if (FCurrentTableRow <> nil) and
      (FCurrentTableCellIndex >= FCurrentTableRow.Cells.Count) then
    begin
      // Graceful fallback for malformed RTF without a matching cellx.
      Cell := TRTFTableCell.Create;
      Cell.LeftTwips := FState.TableCellRightTwips;
      if FCurrentTableRow.Cells.Count = 0 then
        Cell.LeftTwips := FState.TableLeftTwips;
      Cell.RightTwips := Cell.LeftTwips + 9000;
      FCurrentTableRow.Cells.Add(Cell);
    end;

    FCurrentTableCell := nil;
    if (FCurrentTableRow <> nil) and
      (FCurrentTableCellIndex < FCurrentTableRow.Cells.Count) then
      FCurrentTableCell := FCurrentTableRow.Cells[FCurrentTableCellIndex];

    FState.ParaStyle.InTable := FCurrentTableCell <> nil;
    if FCurrentTableCell <> nil then
    begin
      FState.ParaStyle.CellLeft := TwipsToPixels(FCurrentTableCell.LeftTwips);
      FState.ParaStyle.CellWidth := TwipsToPixels(FCurrentTableCell.RightTwips -
        FCurrentTableCell.LeftTwips);
      FState.ParaStyle.CellMinHeight := 0;
      FState.ParaStyle.CellPaddingLeft :=
        TwipsToPixels(FCurrentTableCell.PaddingLeftTwips);
      FState.ParaStyle.CellPaddingRight :=
        TwipsToPixels(FCurrentTableCell.PaddingRightTwips);
      FState.ParaStyle.HasCellBackground := False;
    end;

    if FCurrentParagraph <> nil then
      FCurrentParagraph.Style := FState.ParaStyle
    else
      NewParagraph;
  end
  else if (WordName = 'ql') or (WordName = 'qc') or (WordName = 'qr') or
    (WordName = 'qj') or (WordName = 'li') or (WordName = 'lin') or
    (WordName = 'ri') or (WordName = 'rin') or (WordName = 'fi') or
    (WordName = 'sb') or (WordName = 'sa') or (WordName = 'sl') or
    (WordName = 'slmult') or (WordName = 'ls') or (WordName = 'ilvl') then
  begin
    if WordName = 'ql' then
      FState.ParaStyle.Align := rpaLeft
    else if WordName = 'qc' then
      FState.ParaStyle.Align := rpaCenter
    else if WordName = 'qr' then
      FState.ParaStyle.Align := rpaRight
    else if WordName = 'qj' then
      FState.ParaStyle.Align := rpaJustify
    else if HasParam and ((WordName = 'li') or (WordName = 'lin')) then
    begin
      FState.ParaStyle.LeftIndent := TwipsToPixels(Param);
      FState.ParaStyle.HasLeftIndent := True;
    end
    else if HasParam and ((WordName = 'ri') or (WordName = 'rin')) then
      FState.ParaStyle.RightIndent := TwipsToPixels(Param)
    else if HasParam and (WordName = 'fi') then
    begin
      FState.ParaStyle.FirstLineIndent := TwipsToPixels(Param);
      FState.ParaStyle.HasFirstLineIndent := True;
    end
    else if HasParam and (WordName = 'ls') then
    begin
      FState.ParaStyle.ListOverride := Param;
      if not FState.ParaStyle.HasLeftIndent then
      begin
        FState.ParaStyle.LeftIndent := 0;
        FState.ParaStyle.HasListLevelIndent := False;
      end;
      if not FState.ParaStyle.HasFirstLineIndent then
      begin
        FState.ParaStyle.FirstLineIndent := 0;
        FState.ParaStyle.HasListLevelFirstLineIndent := False;
      end;
      ApplyListLevelIndent;
    end
    else if HasParam and (WordName = 'ilvl') then
    begin
      FState.ParaStyle.ListLevel := EnsureRange(Param, 0, 8);
      if not FState.ParaStyle.HasLeftIndent then
      begin
        FState.ParaStyle.LeftIndent := 0;
        FState.ParaStyle.HasListLevelIndent := False;
      end;
      if not FState.ParaStyle.HasFirstLineIndent then
      begin
        FState.ParaStyle.FirstLineIndent := 0;
        FState.ParaStyle.HasListLevelFirstLineIndent := False;
      end;
      ApplyListLevelIndent;
    end
    else if HasParam and (WordName = 'sb') then
      FState.ParaStyle.SpaceBefore := TwipsToPixels(Param)
    else if HasParam and (WordName = 'sa') then
      FState.ParaStyle.SpaceAfter := TwipsToPixels(Param)
    else if HasParam and (WordName = 'sl') then
      FState.ParaStyle.LineSpacing := Param
    else if HasParam and (WordName = 'slmult') then
      FState.ParaStyle.LineSpacingMultiple := Param <> 0;
    if FCurrentParagraph <> nil then
      FCurrentParagraph.Style := FState.ParaStyle;
  end
  else if WordName = 'par' then
  begin
    FinishParagraph(True);
    NewParagraph;
  end
  else if WordName = 'row' then
  begin
    FinishParagraph(False);
    if (FCurrentTableRow <> nil) and (FCurrentTableRow.Cells.Count > 0) then
    begin
      // Drop only the empty trailing descriptor row following a row that
      // was already recovered at a repeated \trowd. Normal empty table rows
      // remain supported.
      if FSkipNextEmptyTableRow and not RTFTableRowHasContent(FCurrentTableRow)
      then
        FreeAndNil(FCurrentTableRow)
      else
      begin
        FDocument.Blocks.Add(TRTFBlock.CreateTable(FCurrentTableRow));
        FCurrentTableRow := nil;
      end;
    end;
    FSkipNextEmptyTableRow := False;
    FCurrentTableCell := nil;
    FCurrentTableCellIndex := 0;
    FState.ParaStyle := FDefaultState.ParaStyle;
    FState.ParaStyle.InTable := False;
    FState.ParaStyle.HasCellBackground := False;
    FState.TableLeftTwips := 0;
    FState.TableCellRightTwips := 0;
    FState.TableRowHeightTwips := 0;
    FState.TablePaddingLeftTwips := 0;
    FState.TablePaddingRightTwips := 0;
    FState.TablePaddingTopTwips := 0;
    FState.TablePaddingBottomTwips := 0;
    FState.TableCellBackgroundIndex := -1;
    NewParagraph;
  end
  else if WordName = 'line' then
  begin
    FlushTextBytes;
    AddText(#10);
  end
  else if WordName = 'tab' then
  begin
    FlushTextBytes;
    AddText(#9);
  end
  else if WordName = 'cell' then
  begin
    FlushTextBytes;
    if (FCurrentTableRow <> nil) and (FCurrentTableCell <> nil) then
      FinishParagraph(True)
    else
      FinishParagraph(False);
    Inc(FCurrentTableCellIndex);
    FCurrentTableCell := nil;
    if (FCurrentTableRow <> nil) and
      (FCurrentTableCellIndex < FCurrentTableRow.Cells.Count) then
    begin
      FCurrentTableCell := FCurrentTableRow.Cells[FCurrentTableCellIndex];
      FState.ParaStyle.InTable := True;
      FState.ParaStyle.CellLeft := TwipsToPixels(FCurrentTableCell.LeftTwips);
      FState.ParaStyle.CellWidth := TwipsToPixels(FCurrentTableCell.RightTwips -
        FCurrentTableCell.LeftTwips);
      FState.ParaStyle.CellPaddingLeft :=
        TwipsToPixels(FCurrentTableCell.PaddingLeftTwips);
      FState.ParaStyle.CellPaddingRight :=
        TwipsToPixels(FCurrentTableCell.PaddingRightTwips);
      FState.ParaStyle.CellMinHeight := 0;
      FState.ParaStyle.HasCellBackground := False;
    end
    else
    begin
      FState.ParaStyle.InTable := False;
      FState.ParaStyle.HasCellBackground := False;
    end;
  end
  else if WordName = 'bullet' then
  begin
    FlushTextBytes;
    if FCurrentParagraph <> nil then
    begin
      FCurrentParagraph.HasBullet := True;
      FCurrentParagraph.HasTextListMarker := False;
      FCurrentParagraph.ListMarkerKind := rlmkDisc;
      FCurrentParagraph.ListMarkerStyle := FState.CharStyle;
    end;
  end
  else if WordName = 'emdash' then
  begin
    FlushTextBytes;
    AddText(#$2014);
  end
  else if WordName = 'endash' then
  begin
    FlushTextBytes;
    AddText(#$2013);
  end
  else if WordName = 'lquote' then
  begin
    FlushTextBytes;
    AddText(#$2018);
  end
  else if WordName = 'rquote' then
  begin
    FlushTextBytes;
    AddText(#$2019);
  end
  else if WordName = 'ldblquote' then
  begin
    FlushTextBytes;
    AddText(#$201C);
  end
  else if WordName = 'rdblquote' then
  begin
    FlushTextBytes;
    AddText(#$201D);
  end
  else if WordName = 'page' then
  begin
    FinishParagraph(True);
    FState.ParaStyle.SpaceBefore := 24;
    NewParagraph;
  end
  else if WordName = 'deff' then
  begin
    if HasParam then
    begin
      FDefaultState.FontIndex := Param;
      if FDocument.Fonts.TryGetValue(Param, FDefaultState.CharStyle.FontName)
      then
      begin
        FState.FontIndex := Param;
        FState.CharStyle.FontName := FDefaultState.CharStyle.FontName;
      end;
    end;
  end;
end;

procedure TRTFParser.ProcessControlSymbol(var AIndex: Integer);
var
  C: AnsiChar;
  B: Byte;
begin
  Inc(AIndex); // Skip backslash.
  if AIndex > Length(FSource) then
    Exit;
  C := FSource[AIndex];

  if FFallbackToSkip > 0 then
  begin
    if C = #39 then
      Inc(AIndex, 3)
    else
      Inc(AIndex);
    Dec(FFallbackToSkip);
    Exit;
  end;

  case C of
    '\', '{', '}':
      begin
        FlushTextBytes;
        AddText(string(C));
        Inc(AIndex);
      end;
    #39:
      begin
        if (AIndex + 2 <= Length(FSource)) and IsHexChar(FSource[AIndex + 1])
          and IsHexChar(FSource[AIndex + 2]) then
        begin
          B := (HexValue(FSource[AIndex + 1]) shl 4) or
            HexValue(FSource[AIndex + 2]);
          AppendByte(B);
          Inc(AIndex, 3);
        end
        else
          Inc(AIndex);
      end;
    '~':
      begin
        FlushTextBytes;
        AddText(#$00A0);
        Inc(AIndex);
      end;
    '-':
      begin
        FlushTextBytes;
        AddText(#$00AD);
        Inc(AIndex);
      end;
    '_':
      begin
        FlushTextBytes;
        AddText(#$2011);
        Inc(AIndex);
      end;
  else
    Inc(AIndex);
  end;
end;

function TRTFParser.Parse(const AData: TBytes): TRTFDocument;
var
  I, GroupEnd: Integer;
  Destination: string;
  Ignorable: Boolean;
  DefaultFont: string;
begin
  if Length(AData) > 0 then
    SetString(FSource, PAnsiChar(@AData[0]), Length(AData))
  else
    FSource := '';

  ParseFontTable;
  ParseColorTable;
  ParseListTables;

  FDefaultState.CharStyle.FontName := 'Segoe UI';
  FDefaultState.CharStyle.FontSize := 12;
  FDefaultState.CharStyle.FontStyles := [];
  FDefaultState.CharStyle.TextColor := TAlphaColors.Black;
  FDefaultState.CharStyle.HighlightColor := TAlphaColors.Null;
  FDefaultState.CharStyle.SuperSub := 0;
  FDefaultState.ParaStyle.Align := rpaLeft;
  FDefaultState.ParaStyle.LeftIndent := 0;
  FDefaultState.ParaStyle.RightIndent := 0;
  FDefaultState.ParaStyle.FirstLineIndent := 0;
  FDefaultState.ParaStyle.HasLeftIndent := False;
  FDefaultState.ParaStyle.HasFirstLineIndent := False;
  FDefaultState.ParaStyle.HasListLevelIndent := False;
  FDefaultState.ParaStyle.HasListLevelFirstLineIndent := False;
  FDefaultState.ParaStyle.ListOverride := 0;
  FDefaultState.ParaStyle.ListLevel := -1;
  FDefaultState.ParaStyle.ListMarkerGap := 4;
  FDefaultState.ParaStyle.SpaceBefore := 0;
  FDefaultState.ParaStyle.SpaceAfter := 4;
  FDefaultState.ParaStyle.LineSpacing := 0;
  FDefaultState.ParaStyle.LineSpacingMultiple := False;
  FDefaultState.FontIndex := 0;
  FDefaultState.ColorIndex := 0;
  FDefaultState.HighlightIndex := 0;
  FDefaultState.CodePage := RTFCodePage(FSource);
  FDefaultState.UnicodeFallback := 1;

  if FDocument.Fonts.TryGetValue(0, DefaultFont) then
    FDefaultState.CharStyle.FontName := DefaultFont;

  FState := FDefaultState;
  FState.TableCellBackgroundIndex := -1;
  FState.TableCellPaddingLeftTwips := -1;
  FState.TableCellPaddingRightTwips := -1;
  FState.TableCellPaddingTopTwips := -1;
  FState.TableCellPaddingBottomTwips := -1;
  FState.TableCurrentBorderSide := -1;
  FState.TableCellVerticalAlign := rtvaTop;
  FillChar(FState.TableCellBorders, SizeOf(FState.TableCellBorders), 0);
  FCurrentTableRow.Free;
  FCurrentTableRow := nil;
  FCurrentTableCell := nil;
  FCurrentTableCellIndex := 0;
  FSkipNextEmptyTableRow := False;
  FFallbackToSkip := 0;
  FStateStack.Clear;
  FTextBytes := nil;
  NewParagraph;

  I := 1;
  while I <= Length(FSource) do
  begin
    if FSource[I] = '{' then
    begin
      if GetGroupDestination(I, Destination, Ignorable) then
      begin
        if (Destination = 'listtext') or (Destination = 'pntext') then
        begin
          GroupEnd := FindGroupEnd(I);
          if ParseListText(I, GroupEnd) then
          begin
            I := GroupEnd + 1;
            Continue;
          end;
          // Empty/unsupported marker groups are left to the regular parser.
        end;

        // WordPad/legacy Word numbering uses an ignorable {\*\pn ...}
        // group for marker formatting and paragraph indentation. The visible
        // generated marker itself is read from the preceding \pntext group.
        if (Destination = 'pn') and Ignorable then
        begin
          GroupEnd := FindGroupEnd(I);
          ParseLegacyPN(I, GroupEnd);
          I := GroupEnd + 1;
          Continue;
        end;

        if Destination = 'pict' then
        begin
          GroupEnd := FindGroupEnd(I);
          ParsePicture(I, GroupEnd);
          I := GroupEnd + 1;
          Continue;
        end;

        if Destination = 'field' then
        begin
          GroupEnd := FindGroupEnd(I);
          PushState;
          FState.CharStyle.LinkURL := ExtractFieldURL(I, GroupEnd);
          Inc(I);
          Continue;
        end;

        if IsSkippedDestination(Destination, Ignorable) then
        begin
          GroupEnd := FindGroupEnd(I);
          I := GroupEnd + 1;
          Continue;
        end;
      end;
      PushState;
      Inc(I);
      Continue;
    end;

    if FSource[I] = '}' then
    begin
      PopState;
      Inc(I);
      Continue;
    end;

    if FSource[I] = '\' then
    begin
      if (I < Length(FSource)) and CharInSet(FSource[I + 1],
        ['A' .. 'Z', 'a' .. 'z']) then
        ProcessControlWord(I)
      else
        ProcessControlSymbol(I);
      Continue;
    end;

    if (FSource[I] = #10) or (FSource[I] = #13) then
    begin
      Inc(I);
      Continue;
    end;

    if FFallbackToSkip > 0 then
    begin
      Dec(FFallbackToSkip);
      Inc(I);
      Continue;
    end;

    AppendByte(Byte(FSource[I]));
    Inc(I);
  end;

  FinishParagraph(False);
  if (FCurrentTableRow <> nil) and (FCurrentTableRow.Cells.Count > 0) then
  begin
    if FSkipNextEmptyTableRow and not RTFTableRowHasContent(FCurrentTableRow)
    then
      FreeAndNil(FCurrentTableRow)
    else
    begin
      FDocument.Blocks.Add(TRTFBlock.CreateTable(FCurrentTableRow));
      FCurrentTableRow := nil;
    end;
    FCurrentTableCell := nil;
  end;
  Result := FDocument;
  FDocument := TRTFDocument.Create;
end;

end.
