[Setup]
AppName=FMXBridge_Radiant_Game
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[CustomMessages]
ExitForm=Уведомление
ExitFormLabel1=Выход из установки
ExitFormLabel2=Вы действительно хотите выйти из установки%n{#SetupSetting('AppName')}?
ExitFormYesButton=ОК
ExitFormNoButton=Отмена

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\Styles\Transparent.fsf"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

const
  FillColorX     = $4432CDFF;
  StrokeColorX   = $FF32CDFF;
  FillColorO     = $44EB6FFF;
  StrokeColorO   = $FFEB6FFF;
  FillColorWin   = $4439FF32;
  StrokeColorWin = $FF39FF32;

type
  TPlayerMove = (PlayerX, PlayerO);

type
  TCellItem = record
    Layer      : Flayout;
    RadiantRing: FRadiantRing;
    RadiantX   : FRadiantX;
  end;

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  AGridPanelLayer  : FGridPanelLayout;
  GridLines        : array [1..4] of FRadiantRectangle;
  CellItems        : array [1..9] of TCellItem;

  tNextMove        : TPlayerMove;
  bGameOver        : Boolean;

  NewGameBtn       : FSpeedButton;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FSpeedButton;
  ExitFormNoBtn    : FSpeedButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm        := InitFormHandle;
  FormLayer      := InitLayoutHandle;
  TitleBar       := InitWinTitleBarHandle;

  AGridPanelLayer:= InitGridPanelLayoutHandle;
  for i:= 1 to 4 do GridLines[i]:= InitRadiantRectangleHandle;
  for i:= 1 to 9 do
  begin
    CellItems[i].Layer      := InitLayoutHandle;
    CellItems[i].RadiantRing:= InitRadiantRingHandle;
    CellItems[i].RadiantX   := InitRadiantXHandle;
  end;

  tNextMove:= PlayerX;
  bGameOver:= False;

  NewGameBtn:= InitSpeedButtonHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormTitleBar := InitWinTitleBarHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitSpeedButtonHandle;
  ExitFormNoBtn    := InitSpeedButtonHandle;
  ExitFormBottomBar:= InitStatusBarHandle;
end;

function InitializeSetup(): Boolean;
begin
  FMXInit;
  Result := True;
end;

procedure DeinitializeSetup();
begin
  FMXBridgeShutDown;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectCloseBtn):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

  end;
end;

procedure ShowWinnerX(Cell1, Cell2, Cell3: Integer);
begin
  CellItems[Cell1].RadiantX.FillColor(FillColorWin);
  CellItems[Cell1].RadiantX.StrokeColor(StrokeColorWin);

  CellItems[Cell2].RadiantX.FillColor(FillColorWin);
  CellItems[Cell2].RadiantX.StrokeColor(StrokeColorWin);

  CellItems[Cell3].RadiantX.FillColor(FillColorWin);
  CellItems[Cell3].RadiantX.StrokeColor(StrokeColorWin);
end;

procedure ShowWinnerO(Cell1, Cell2, Cell3: Integer);
begin
  CellItems[Cell1].RadiantRing.FillColor(FillColorWin);
  CellItems[Cell1].RadiantRing.StrokeColor(StrokeColorWin);

  CellItems[Cell2].RadiantRing.FillColor(FillColorWin);
  CellItems[Cell2].RadiantRing.StrokeColor(StrokeColorWin);

  CellItems[Cell3].RadiantRing.FillColor(FillColorWin);
  CellItems[Cell3].RadiantRing.StrokeColor(StrokeColorWin);
end;

function CheckX(Cell1, Cell2, Cell3: Integer): Boolean;
begin
  Result:= CellItems[Cell1].RadiantX.IsVisible and
           CellItems[Cell2].RadiantX.IsVisible and
           CellItems[Cell3].RadiantX.IsVisible;
  if Result then
    ShowWinnerX(Cell1, Cell2, Cell3);
end;

function CheckO(Cell1, Cell2, Cell3: Integer): Boolean;
begin
  Result:= CellItems[Cell1].RadiantRing.IsVisible and
           CellItems[Cell2].RadiantRing.IsVisible and
           CellItems[Cell3].RadiantRing.IsVisible;
  if Result then
    ShowWinnerO( Cell1, Cell2, Cell3 );
end;

procedure CheckForWinner;
begin
  if CheckX(1, 5, 9) or
     CheckX(3, 5, 7) or
     CheckX(1, 2, 3) or
     CheckX(4, 5, 6) or
     CheckX(7, 8, 9) or
     CheckX(1, 4, 7) or
     CheckX(2, 5, 8) or
     CheckX(3, 6, 9) then
  begin
    bGameOver:= True;
    Exit;
  end;

  if CheckO(1, 5, 9) or
     CheckO(3, 5, 7) or
     CheckO(1, 2, 3) or
     CheckO(4, 5, 6) or
     CheckO(7, 8, 9) or
     CheckO(1, 4, 7) or
     CheckO(2, 5, 8) or
     CheckO(3, 6, 9) then
  begin
    bGameOver:= True;
    Exit;
  end;
end;

procedure CellOnClick(Sender: TObject);
var
  Idx, i: Integer;
begin
  Idx:= -1;

  for i:= 1 to 9 do
    if Sender = TObject(CellItems[i].Layer.GetObject) then
    begin
      Idx:= i;
      break;
    end;

  if Idx = -1 then
    Exit;

  if bGameOver or CellItems[Idx].RadiantX.IsVisible or CellItems[Idx].RadiantRing.IsVisible then
    Exit;

  if tNextMove = PlayerX then
    CellItems[Idx].RadiantX.Visible(True)
  else
    CellItems[Idx].RadiantRing.Visible(True);

  if tNextMove = PlayerX then
    tNextMove:= PlayerO
  else
    tNextMove:= PlayerX;

  CheckForWinner;
end;

{ New Game }
procedure NewGameOnClick(Sender: TObject);
var
  i: Integer;
begin
  tNextMove:= PlayerX;
  bGameOver:= False;

  for i:= 1 to 9 do
  begin
    CellItems[i].RadiantRing.FillColor(FillColorO);
    CellItems[i].RadiantRing.StrokeColor(StrokeColorO);
    CellItems[i].RadiantRing.Visible(False);

    CellItems[i].RadiantX.FillColor(FillColorX);
    CellItems[i].RadiantX.StrokeColor(StrokeColorX);
    CellItems[i].RadiantX.Visible(False);
  end;
end;

procedure FMXDesigning;
var
  i: Integer;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, 0, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('Transparent.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF0E192B);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  for i:= 1 to 2 do
  begin
    GridLines[i].FCreate(FormLayer.Handle);
    GridLines[i].Align(Client);
    GridLines[i].Height(702);
    GridLines[i].Width(10);
    GridLines[i].FillColor($6400DAFF);
    GridLines[i].StrokeSetting(0, scFlat, sdSolid, sjMiter);
  end;

  for i:= 3 to 4 do
  begin
    GridLines[i].FCreate(FormLayer.Handle);
    GridLines[i].Align(Client);
    GridLines[i].Height(10);
    GridLines[i].Width(686);
    GridLines[i].FillColor($6400DAFF);
    GridLines[i].StrokeSetting(0, scFlat, sdSolid, sjMiter);
  end;

  for i:= 1 to 9 do
  begin
    CellItems[i].Layer.FCreate(FormLayer.Handle);
    CellItems[i].Layer.Align(Client);
    CellItems[i].Layer.HitTest(True);
    CellItems[i].Layer.OnClick(@CellOnClick);

    CellItems[i].RadiantRing.FCreate(CellItems[i].Layer.Handle);
    CellItems[i].RadiantRing.Align(Client);
    CellItems[i].RadiantRing.Margins(10, 10, 10, 10);
    CellItems[i].RadiantRing.FillColor(FillColorO);
    CellItems[i].RadiantRing.StrokeColor(StrokeColorO);
    CellItems[i].RadiantRing.StrokeSetting(10, scFlat, sdSolid, sjMiter);
    CellItems[i].RadiantRing.RingSize(20, 0.4, rduScaleFactor);
    CellItems[i].RadiantRing.ScaleStrokeThickness(True);
    CellItems[i].RadiantRing.Visible(False);

    CellItems[i].RadiantX.FCreate(CellItems[i].Layer.Handle);
    CellItems[i].RadiantX.Align(Client);
    CellItems[i].RadiantX.Margins(10, 10, 10, 10);
    CellItems[i].RadiantX.FillColor(FillColorX);
    CellItems[i].RadiantX.StrokeColor(StrokeColorX);
    CellItems[i].RadiantX.StrokeSetting(10, scFlat, sdSolid, sjMiter);
    CellItems[i].RadiantX.BarSize(20, 0.25, rduScaleFactor);
    CellItems[i].RadiantX.ScaleStrokeThickness(True);
    CellItems[i].RadiantX.Visible(False);
  end;

  AGridPanelLayer.FCreate(FormLayer.Handle);
  AGridPanelLayer.Align(Client);
  AGridPanelLayer.Margins(116, 48, 0, 0);

  for i:= 0 to 4 do AGridPanelLayer.AddNewRow;

  AGridPanelLayer.RowSettings(1, gplssAbsolute, 10);
  AGridPanelLayer.RowSettings(3, gplssAbsolute, 10);
  AGridPanelLayer.RowSettings(0, gplssAbsolute, 138);
  AGridPanelLayer.RowSettings(2, gplssAbsolute, 138);
  AGridPanelLayer.RowSettings(4, gplssAbsolute, 138);

  for i:= 0 to 4 do AGridPanelLayer.AddNewColumn;

  AGridPanelLayer.ColumnSettings(1, gplssAbsolute, 10);
  AGridPanelLayer.ColumnSettings(3, gplssAbsolute, 10);
  AGridPanelLayer.ColumnSettings(0, gplssAbsolute, 168);
  AGridPanelLayer.ColumnSettings(2, gplssAbsolute, 168);
  AGridPanelLayer.ColumnSettings(4, gplssAbsolute, 168);

  AGridPanelLayer.LoadAControl(GridLines[1].Handle, 1, 1, 0, 5);
  AGridPanelLayer.LoadAControl(GridLines[2].Handle, 3, 1, 0, 5);
  AGridPanelLayer.LoadAControl(GridLines[3].Handle, 0, 5, 1, 1);
  AGridPanelLayer.LoadAControl(GridLines[4].Handle, 0, 5, 3, 1);

  AGridPanelLayer.LoadAControl(CellItems[1].Layer.Handle, 0, 1, 0, 1);
  AGridPanelLayer.LoadAControl(CellItems[2].Layer.Handle, 2, 1, 0, 1);
  AGridPanelLayer.LoadAControl(CellItems[3].Layer.Handle, 4, 1, 0, 1);

  AGridPanelLayer.LoadAControl(CellItems[4].Layer.Handle, 0, 1, 2, 1);
  AGridPanelLayer.LoadAControl(CellItems[5].Layer.Handle, 2, 1, 2, 1);
  AGridPanelLayer.LoadAControl(CellItems[6].Layer.Handle, 4, 1, 2, 1);

  AGridPanelLayer.LoadAControl(CellItems[7].Layer.Handle, 0, 1, 4, 1);
  AGridPanelLayer.LoadAControl(CellItems[8].Layer.Handle, 2, 1, 4, 1);
  AGridPanelLayer.LoadAControl(CellItems[9].Layer.Handle, 4, 1, 4, 1);

  AGridPanelLayer.ApplyAllLoadedControls;

  NewGameBtn.FCreate(FormLayer.Handle);
  NewGameBtn.Position(20, 50);
  NewGameBtn.Text('New Game');
  NewGameBtn.OnClick(@NewGameOnClick);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, 0, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($FF0E192B);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FFF5F5F5);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text SemiBold', 15, $FF767676);
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Height(54);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(383, 207, 46, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(442, 207, 72, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(758, 550);
  FMXDesigning;
  FMXForm.Show;
end;
