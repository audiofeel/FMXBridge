
unit FMXBridge.CheckBoxTree;

interface

uses
  System.Classes, System.UITypes,
  FMX.Types, FMX.TreeView, FMX.StdCtrls;

// =============================================================================
// FCheckBoxTree
// =============================================================================
type
  FCheckBoxTree = interface(IUnknown)
    ['{C6CAC4B7-8F40-4DF1-98C8-364E72EAD1EA}']
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ScrollAnimation(FEnable: Boolean); stdcall;
    procedure ShowScrollBars(FShow: Boolean); stdcall;
    function AddEmptySection(FParent: TFmxObject; const FText: WideString)
      : TFmxObject; stdcall;
    function AddCheckBoxSection(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString; var CheckBoxHandle: TFmxObject)
      : TFmxObject; stdcall;
    function AddCheckBox(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject; stdcall;
    function AddRadioBtn(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject; stdcall;
    procedure CheckBoxSetChecked(FHandle: TFmxObject;
      FChecked: Boolean); stdcall;
    procedure RadioBtnSetChecked(FHandle: TFmxObject;
      FChecked: Boolean); stdcall;
    procedure RadioBtnGroupName(FHandle: TFmxObject;
      FGroupName: WideString); stdcall;
    procedure SectionFontSetting(FHandle: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor); stdcall;
    procedure CheckBoxFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure RadioBtnFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure SectionExpand(FHandle: TFmxObject); stdcall;
    procedure SectionExpandAll(FHandle: TFmxObject); stdcall;
    procedure SectionCollapse(FHandle: TFmxObject); stdcall;
    procedure SectionCollapseAll(FHandle: TFmxObject); stdcall;
    procedure SectionEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure CheckBoxEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure RadioBtnEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure AlternatingRowBackground(FValue: Boolean); stdcall;
    procedure RemoveBackground; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure DisableFocusEffect(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure ReFresh; stdcall;
    procedure ItemOnMouseEnter(FHandle: TFmxObject;
      Event: TNotifyEvent); stdcall;
    procedure ItemOnMouseLeave(FHandle: TFmxObject;
      Event: TNotifyEvent); stdcall;
    procedure ItemOnChange(FHandle: TFmxObject; Event: TNotifyEvent); stdcall;
    function CheckBoxGetChecked(FHandle: TFmxObject): Boolean; stdcall;
    function RadioBtnGetChecked(FHandle: TFmxObject): Boolean; stdcall;
    function GetText(FHandle: TFmxObject): WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetObjectCheckBox(FHandle: TFmxObject): TFmxObject; stdcall;
    function GetObjectRadioBtn(FHandle: TFmxObject): TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

type
  TFCheckBoxTree = class(TInterfacedObject, FCheckBoxTree)
  private type
    TSectionRec = class
      MainCB: TCheckBox;
      ChildItems: TList;
      constructor Create(AMainCB: TCheckBox);
      destructor Destroy; override;
    end;
  private
    TV: TTreeView;
    FSections: TList;
    procedure MainCBChanged(Sender: TObject);
    procedure ChildCBChanged(Sender: TObject);
    procedure OnChange(Sender: TObject);
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
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ScrollAnimation(FEnable: Boolean); stdcall;
    procedure ShowScrollBars(FShow: Boolean); stdcall;
    function AddEmptySection(FParent: TFmxObject; const FText: WideString)
      : TFmxObject; stdcall;
    function AddCheckBoxSection(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString; var CheckBoxHandle: TFmxObject)
      : TFmxObject; stdcall;
    function AddCheckBox(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject; stdcall;
    function AddRadioBtn(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject; stdcall;
    procedure CheckBoxSetChecked(FHandle: TFmxObject;
      FChecked: Boolean); stdcall;
    procedure RadioBtnSetChecked(FHandle: TFmxObject;
      FChecked: Boolean); stdcall;
    procedure RadioBtnGroupName(FHandle: TFmxObject;
      FGroupName: WideString); stdcall;
    procedure SectionFontSetting(FHandle: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor); stdcall;
    procedure CheckBoxFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure RadioBtnFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure SectionExpand(FHandle: TFmxObject); stdcall;
    procedure SectionExpandAll(FHandle: TFmxObject); stdcall;
    procedure SectionCollapse(FHandle: TFmxObject); stdcall;
    procedure SectionCollapseAll(FHandle: TFmxObject); stdcall;
    procedure SectionEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure CheckBoxEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure RadioBtnEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure AlternatingRowBackground(FValue: Boolean); stdcall;
    procedure RemoveBackground; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure DisableFocusEffect(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure ReFresh; stdcall;
    procedure ItemOnMouseEnter(FHandle: TFmxObject;
      Event: TNotifyEvent); stdcall;
    procedure ItemOnMouseLeave(FHandle: TFmxObject;
      Event: TNotifyEvent); stdcall;
    procedure ItemOnChange(FHandle: TFmxObject; Event: TNotifyEvent); stdcall;
    function CheckBoxGetChecked(FHandle: TFmxObject): Boolean; stdcall;
    function RadioBtnGetChecked(FHandle: TFmxObject): Boolean; stdcall;
    function GetText(FHandle: TFmxObject): WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetObjectCheckBox(FHandle: TFmxObject): TFmxObject; stdcall;
    function GetObjectRadioBtn(FHandle: TFmxObject): TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitCheckBoxTree: FCheckBoxTree; stdcall;

implementation

uses
  FMX.Controls;

// =============================================================================
// FCheckBoxTree
// =============================================================================
constructor TFCheckBoxTree.TSectionRec.Create(AMainCB: TCheckBox);
begin
  MainCB := AMainCB;
  ChildItems := TList.Create;
end;

destructor TFCheckBoxTree.TSectionRec.Destroy;
begin
  ChildItems.Free;

  inherited;
end;

constructor TFCheckBoxTree.Create;
begin
  inherited Create;

  FSections := TList.Create;
end;

destructor TFCheckBoxTree.Destroy;
var
  i: Integer;
begin
  if Assigned(FSections) then
  begin
    for i := 0 to FSections.Count - 1 do
      TSectionRec(FSections[i]).Free;
    FSections.Free;
  end;

  inherited;
end;

procedure TFCheckBoxTree.MainCBChanged(Sender: TObject);
var
  i, idx: Integer;
  Section: TSectionRec;
  Ctrl: TControl;
  MainChecked: Boolean;
  Groups: TStringList;
  RB: TRadioButton;
begin
  if FSections = nil then
    Exit;

  for i := 0 to FSections.Count - 1 do
  begin
    Section := TSectionRec(FSections[i]);
    if Section.MainCB = Sender then
    begin
      MainChecked := TCheckBox(Sender).IsChecked;

      Groups := TStringList.Create;
      try
        for idx := 0 to Section.ChildItems.Count - 1 do
        begin
          Ctrl := TControl(Section.ChildItems[idx]);

          if Ctrl is TCheckBox then
            TCheckBox(Ctrl).IsChecked := MainChecked

          else if Ctrl is TRadioButton then
          begin
            RB := TRadioButton(Ctrl);
            if MainChecked then
            begin
              if Groups.IndexOf(RB.GroupName) = -1 then
              begin
                RB.IsChecked := True;
                Groups.Add(RB.GroupName);
              end;
            end
            else
            begin
              RB.IsChecked := False;
            end;
          end;
        end;
      finally
        Groups.Free;
      end;

      Exit;
    end;
  end;
end;

procedure TFCheckBoxTree.ChildCBChanged(Sender: TObject);
var
  i, idx: Integer;
  Section: TSectionRec;
  Ctrl: TControl;
  AnyChecked: Boolean;
begin
  if FSections = nil then
    Exit;

  for i := 0 to FSections.Count - 1 do
  begin
    Section := TSectionRec(FSections[i]);
    if Section.ChildItems.IndexOf(TControl(Sender)) >= 0 then
    begin
      AnyChecked := False;
      for idx := 0 to Section.ChildItems.Count - 1 do
      begin
        Ctrl := TControl(Section.ChildItems[idx]);
        if (Ctrl is TCheckBox) and TCheckBox(Ctrl).IsChecked then
        begin
          AnyChecked := True;
          Break;
        end
        else if (Ctrl is TRadioButton) and TRadioButton(Ctrl).IsChecked then
        begin
          AnyChecked := True;
          Break;
        end;
      end;

      Section.MainCB.OnChange := nil;
      Section.MainCB.IsChecked := AnyChecked;
      Section.MainCB.OnChange := MainCBChanged;

      Exit;
    end;
  end;
end;

procedure TFCheckBoxTree.FCreate(FParent: TFmxObject);
begin
  TV := TTreeView.Create(nil);
  TV.Parent := FParent;
  TV.ShowCheckBoxes := False;
  TV.OnChange := OnChange;
end;

procedure TFCheckBoxTree.OnChange(Sender: TObject);
begin
  TV.Selected := nil;
end;

procedure TFCheckBoxTree.Cursor(FCursor: TCursor);
begin
  TV.Cursor := FCursor;
end;

procedure TFCheckBoxTree.Position(X, Y: Single);
begin
  TV.Position.X := X;
  TV.Position.Y := Y;
end;

procedure TFCheckBoxTree.Align(Al: TAlignLayout);
begin
  TV.Align := Al;
end;

procedure TFCheckBoxTree.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  TV.Margins.Left := FLeft;
  TV.Margins.Top := FTop;
  TV.Margins.Right := FRight;
  TV.Margins.Bottom := FBottom;
end;

procedure TFCheckBoxTree.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  TV.Padding.Left := FLeft;
  TV.Padding.Top := FTop;
  TV.Padding.Right := FRight;
  TV.Padding.Bottom := FBottom;
end;

procedure TFCheckBoxTree.SetHint(const FText: WideString);
begin
  TV.ShowHint := True;
  TV.Hint := FText;
end;

procedure TFCheckBoxTree.SetClipChildren(FValue: Boolean);
begin
  TV.ClipChildren := FValue;
end;

procedure TFCheckBoxTree.SetClipParent(FValue: Boolean);
begin
  TV.ClipParent := FValue;
end;

procedure TFCheckBoxTree.BringToFront;
begin
  TV.BringToFront;
end;

procedure TFCheckBoxTree.SendToBack;
begin
  TV.SendToBack;
end;

procedure TFCheckBoxTree.SetTag(FTag: Integer);
begin
  TV.Tag := FTag;
end;

procedure TFCheckBoxTree.Left(FLeft: Single);
begin
  TV.Position.X := FLeft;
end;

procedure TFCheckBoxTree.Top(FTop: Single);
begin
  TV.Position.Y := FTop;
end;

procedure TFCheckBoxTree.Height(FHeight: Single);
begin
  TV.Height := FHeight;
end;

procedure TFCheckBoxTree.Width(FWidth: Single);
begin
  TV.Width := FWidth;
end;

procedure TFCheckBoxTree.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  TV.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFCheckBoxTree.ScrollAnimation(FEnable: Boolean);
begin
  TV.AniCalculations.Animation := FEnable;
end;

procedure TFCheckBoxTree.ShowScrollBars(FShow: Boolean);
begin
  TV.ShowScrollBars := FShow;
end;

function TFCheckBoxTree.AddEmptySection(FParent: TFmxObject;
  const FText: WideString): TFmxObject;
var
  Item: TTreeViewItem;
begin
  Item := TTreeViewItem.Create(TV);
  Item.Parent := TTreeViewItem(FParent);
  Item.Text := FText;

  Result := Item;
end;

function TFCheckBoxTree.AddCheckBoxSection(FParent: TFmxObject;
  FLeft, FTop, FWidth: Single; const FText: WideString;
  var CheckBoxHandle: TFmxObject): TFmxObject;
var
  Item: TTreeViewItem;
  CB: TCheckBox;
  Section: TSectionRec;
begin
  Item := TTreeViewItem.Create(TV);
  Item.Parent := TTreeViewItem(FParent);
  Item.Text := '';

  CB := TCheckBox.Create(Item);
  CB.Parent := Item;
  CB.Position.X := FLeft;
  CB.Position.Y := FTop;
  CB.Width := FWidth;
  CB.Text := FText;

  if FSections = nil then
    FSections := TList.Create;

  CB.OnChange := MainCBChanged;
  Section := TSectionRec.Create(CB);
  FSections.Add(Section);

  CheckBoxHandle := CB;
  Result := Item;
end;

function TFCheckBoxTree.AddCheckBox(FParent: TFmxObject;
  FLeft, FTop, FWidth: Single; const FText: WideString): TFmxObject;
var
  Item: TTreeViewItem;
  CB: TCheckBox;
  ParentItem: TTreeViewItem;
  Section: TSectionRec;
  i: Integer;
begin
  ParentItem := TTreeViewItem(FParent);

  Item := TTreeViewItem.Create(TV);
  Item.Parent := ParentItem;
  Item.Text := '';

  CB := TCheckBox.Create(Item);
  CB.Parent := Item;
  CB.Position.X := FLeft;
  CB.Position.Y := FTop;
  CB.Width := FWidth;
  CB.Text := FText;

  Section := nil;
  if FSections <> nil then
    for i := 0 to FSections.Count - 1 do
    begin
      Section := TSectionRec(FSections[i]);
      if Section.MainCB.Parent = ParentItem then
        Break
      else
        Section := nil;
    end;

  if Section <> nil then
  begin
    Section.ChildItems.Add(CB);
    CB.OnChange := ChildCBChanged;
  end;

  Result := CB;
end;

function TFCheckBoxTree.AddRadioBtn(FParent: TFmxObject;
  FLeft, FTop, FWidth: Single; const FText: WideString): TFmxObject;
var
  Item: TTreeViewItem;
  RB: TRadioButton;
  ParentItem: TTreeViewItem;
  Section: TSectionRec;
  i: Integer;
begin
  ParentItem := TTreeViewItem(FParent);

  Item := TTreeViewItem.Create(TV);
  Item.Parent := ParentItem;
  Item.Text := '';

  RB := TRadioButton.Create(Item);
  RB.Parent := Item;
  RB.Position.X := FLeft;
  RB.Position.Y := FTop;
  RB.Width := FWidth;
  RB.Text := FText;

  Section := nil;
  if FSections <> nil then
    for i := 0 to FSections.Count - 1 do
    begin
      Section := TSectionRec(FSections[i]);
      if Section.MainCB.Parent = ParentItem then
        Break
      else
        Section := nil;
    end;

  if Section <> nil then
  begin
    Section.ChildItems.Add(RB);
    RB.OnChange := ChildCBChanged;
  end;

  Result := RB;
end;

procedure TFCheckBoxTree.CheckBoxSetChecked(FHandle: TFmxObject;
  FChecked: Boolean);
begin
  if FHandle is TCheckBox then
    TCheckBox(FHandle).IsChecked := FChecked;
end;

procedure TFCheckBoxTree.RadioBtnSetChecked(FHandle: TFmxObject;
  FChecked: Boolean);
begin
  if FHandle is TRadioButton then
    TRadioButton(FHandle).IsChecked := FChecked;
end;

procedure TFCheckBoxTree.RadioBtnGroupName(FHandle: TFmxObject;
  FGroupName: WideString);
begin
  if FHandle is TRadioButton then
    TRadioButton(FHandle).GroupName := FGroupName;
end;

procedure TFCheckBoxTree.SectionFontSetting(FHandle: TFmxObject;
  const FontName: WideString; FontSize: Single; FontColor: TAlphaColor);
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  TTreeViewItem(FHandle).StyledSettings := [];

  TTreeViewItem(FHandle).TextSettings.Font.Family := FontName;
  TTreeViewItem(FHandle).TextSettings.Font.Size := FontSize;
  TTreeViewItem(FHandle).TextSettings.FontColor := FontColor;
end;

procedure TFCheckBoxTree.CheckBoxFontSetting(FHandle: TFmxObject;
  const FontName: WideString; FontSize: Single; FontColor: TAlphaColor);
begin
  if not (FHandle is TCheckBox) then
    Exit;

  TCheckBox(FHandle).StyledSettings := [];

  TCheckBox(FHandle).TextSettings.Font.Family := FontName;
  TCheckBox(FHandle).TextSettings.Font.Size := FontSize;
  TCheckBox(FHandle).TextSettings.FontColor := FontColor;
end;

procedure TFCheckBoxTree.RadioBtnFontSetting(FHandle: TFmxObject;
  const FontName: WideString; FontSize: Single; FontColor: TAlphaColor);
begin
  if not (FHandle is TRadioButton) then
    Exit;

  TRadioButton(FHandle).StyledSettings := [];

  TRadioButton(FHandle).TextSettings.Font.Family := FontName;
  TRadioButton(FHandle).TextSettings.Font.Size := FontSize;
  TRadioButton(FHandle).TextSettings.FontColor := FontColor;
end;

procedure TFCheckBoxTree.SectionExpand(FHandle: TFmxObject);
var
  Item: TTreeViewItem;
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  Item := TTreeViewItem(FHandle);

  Item.IsExpanded := True;
  Item.RecalcSize;
  Item.Repaint;
end;

procedure TFCheckBoxTree.SectionExpandAll(FHandle: TFmxObject);
var
  Item: TTreeViewItem;
  i: Integer;
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  Item := TTreeViewItem(FHandle);

  Item.IsExpanded := True;

  for i := 0 to Item.Count - 1 do
    if Item.Items[i] is TTreeViewItem then
      SectionExpandAll(Item.Items[i]);

  Item.RecalcSize;
  Item.Repaint;
end;

procedure TFCheckBoxTree.SectionCollapse(FHandle: TFmxObject);
var
  Item: TTreeViewItem;
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  Item := TTreeViewItem(FHandle);

  Item.IsExpanded := False;
  Item.RecalcSize;
  Item.Repaint;
end;

procedure TFCheckBoxTree.SectionCollapseAll(FHandle: TFmxObject);
var
  Item: TTreeViewItem;
  i: Integer;
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  Item := TTreeViewItem(FHandle);

  for i := 0 to Item.Count - 1 do
    if Item.Items[i] is TTreeViewItem then
      SectionCollapseAll(Item.Items[i]);

  Item.IsExpanded := False;
  Item.RecalcSize;
  Item.Repaint;
end;

procedure TFCheckBoxTree.SectionEnable(FHandle: TFmxObject; FEnabled: Boolean);
begin
  if FHandle is TTreeViewItem then
    TTreeViewItem(FHandle).Enabled := FEnabled;
end;

procedure TFCheckBoxTree.CheckBoxEnable(FHandle: TFmxObject; FEnabled: Boolean);
begin
  if FHandle is TCheckBox then
    TCheckBox(FHandle).Enabled := FEnabled;
end;

procedure TFCheckBoxTree.RadioBtnEnable(FHandle: TFmxObject; FEnabled: Boolean);
begin
  if FHandle is TRadioButton then
    TRadioButton(FHandle).Enabled := FEnabled;
end;

procedure TFCheckBoxTree.ItemHeight(FHeight: Single);
begin
  TV.ItemHeight := FHeight;
end;

procedure TFCheckBoxTree.AlternatingRowBackground(FValue: Boolean);
begin
  TV.AlternatingRowBackground := FValue;
end;

procedure TFCheckBoxTree.RemoveBackground;
begin
  TV.StyleLookup := 'transparentlistboxstyle';
end;

procedure TFCheckBoxTree.CanFocus(FValue: Boolean);
begin
  TV.CanFocus := FValue;
end;

procedure TFCheckBoxTree.DisableFocusEffect(FValue: Boolean);
begin
  TV.DisableFocusEffect := FValue;
end;

procedure TFCheckBoxTree.DisableMouseWheel(FValue: Boolean);
begin
  TV.DisableMouseWheel := FValue;
end;

procedure TFCheckBoxTree.Opacity(FOpacity: Single);
begin
  TV.Opacity := FOpacity;
end;

procedure TFCheckBoxTree.RotationAngle(FValue: Single);
begin
  TV.RotationAngle := FValue;
end;

procedure TFCheckBoxTree.RotationCenter(X, Y: Single);
begin
  TV.RotationCenter.X := X;
  TV.RotationCenter.Y := Y;
end;

procedure TFCheckBoxTree.Enabled(FEnabled: Boolean);
begin
  TV.Enabled := FEnabled;
end;

procedure TFCheckBoxTree.Visible(FVisible: Boolean);
begin
  TV.Visible := FVisible;
end;

procedure TFCheckBoxTree.HitTest(FEnabled: Boolean);
begin
  TV.HitTest := FEnabled;
end;

procedure TFCheckBoxTree.ReFresh;
begin
  TV.RecalcSize;
  TV.Repaint;
end;

procedure TFCheckBoxTree.ItemOnMouseEnter(FHandle: TFmxObject;
  Event: TNotifyEvent);
begin
  if FHandle is TControl then
    TControl(FHandle).OnMouseEnter := Event;
end;

procedure TFCheckBoxTree.ItemOnMouseLeave(FHandle: TFmxObject;
  Event: TNotifyEvent);
begin
  if FHandle is TControl then
    TControl(FHandle).OnMouseLeave := Event;
end;

procedure TFCheckBoxTree.ItemOnChange(FHandle: TFmxObject; Event: TNotifyEvent);
begin
  if FHandle is TCheckBox then
    TCheckBox(FHandle).OnChange := Event
  else if FHandle is TRadioButton then
    TRadioButton(FHandle).OnChange := Event;
end;

function TFCheckBoxTree.CheckBoxGetChecked(FHandle: TFmxObject): Boolean;
begin
  Result := (FHandle is TCheckBox) and TCheckBox(FHandle).IsChecked;
end;

function TFCheckBoxTree.RadioBtnGetChecked(FHandle: TFmxObject): Boolean;
begin
  Result := (FHandle is TRadioButton) and TRadioButton(FHandle).IsChecked;
end;

function TFCheckBoxTree.GetText(FHandle: TFmxObject): WideString;
begin
  if FHandle is TTreeViewItem then
    Result := TTreeViewItem(FHandle).Text
  else if FHandle is TRadioButton then
    Result := TRadioButton(FHandle).Text
  else if FHandle is TCheckBox then
    Result := TCheckBox(FHandle).Text
  else
    Result := '';
end;

function TFCheckBoxTree.GetTag: Integer;
begin
  Result := TV.Tag;
end;

function TFCheckBoxTree.GetLeft: Single;
begin
  Result := TV.Position.X;
end;

function TFCheckBoxTree.GetTop: Single;
begin
  Result := TV.Position.Y;
end;

function TFCheckBoxTree.GetWidth: Single;
begin
  Result := TV.Width;
end;

function TFCheckBoxTree.GetHeight: Single;
begin
  Result := TV.Height;
end;

function TFCheckBoxTree.GetObjectCheckBox(FHandle: TFmxObject): TFmxObject;
begin
  if FHandle is TCheckBox then
    Result := FHandle
  else
    Result := nil;
end;

function TFCheckBoxTree.GetObjectRadioBtn(FHandle: TFmxObject): TFmxObject;
begin
  if FHandle is TRadioButton then
    Result := FHandle
  else
    Result := nil;
end;

function TFCheckBoxTree.Handle: TFmxObject;
begin
  Result := TV;
end;

// =============================================================================
// Exports
// =============================================================================
function InitCheckBoxTree: FCheckBoxTree;
begin
  Result := TFCheckBoxTree.Create;
end;

exports
  InitCheckBoxTree;

end.
