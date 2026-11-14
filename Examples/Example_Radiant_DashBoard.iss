[Setup]
AppId=FMXBridge_Radiant_DashBoard
AppName=FMXBridge_Radiant_DashBoard
AppVersion=1.0
CreateAppDir=no
SetupIconFile=Files\setup.ico
SetupArchitecture=x64
Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

const
  ErrorOutlineColor = $FFFF3333;

var
  FMXForm             : FForm;
  FormLayer           : FLayout;
  TitleBar            : FWinTitleBar;

  RectFrame           : FRadiantRectangle;

  StatusTitleLayer    : FLayout;
  StatusTitleRect     : FRadiantRectangle;
  StatusTitleTraingle : FRadiantTriangle;
  StatusTitleText     : FText;

  StatusLayer         : FLayout;
  ChevLeft, ChevRight : array [1..5] of FRadiantChevron;
  StatusCenterRect    : FRadiantRectangle;
  StatusCenterText    : FText;

  FErrorCycle         : Integer;
  ErrTimer            : FTimer;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm             := InitFormHandle;
  FormLayer           := InitLayoutHandle;
  TitleBar            := InitWinTitleBarHandle;

  RectFrame           := InitRadiantRectangleHandle;

  StatusTitleLayer    := InitLayoutHandle;
  StatusTitleRect     := InitRadiantRectangleHandle;
  StatusTitleTraingle := InitRadiantTriangleHandle;
  StatusTitleText     := InitTextHandle;

  StatusLayer         := InitLayoutHandle;
  for i:= 1 to 5 do
  begin
    ChevLeft[i]       := InitRadiantChevronHandle;
    ChevRight[i]      := InitRadiantChevronHandle;
  end;
  StatusCenterRect    := InitRadiantRectangleHandle;
  StatusCenterText    := InitTextHandle;

  FErrorCycle         := 1;
  ErrTimer            := InitTimer;
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
  Confirm:= False;
end;

procedure CommonOnClick(Sender: TObject);
begin
  case Sender of

    TObject(TitleBar.GetObjectMinBtn):
      FMXForm.Minimize;

    TObject(TitleBar.GetObjectCloseBtn):
      WizardForm.Close;

  end;
end;

procedure DimChevrons(Chevron1, Chevron2: FRadiantChevron; Opacity: Single);
begin
  Chevron1.Opacity(Opacity);
  Chevron2.Opacity(Opacity);
end;

procedure ErrTimerOnTimer(Sender: TObject);
begin
  case FErrorCycle of
    1: DimChevrons(ChevLeft[1], ChevRight[1], 0.4);
    2: DimChevrons(ChevLeft[2], ChevRight[2], 0.4);
    3: DimChevrons(ChevLeft[3], ChevRight[3], 0.4);
    4: DimChevrons(ChevLeft[4], ChevRight[4], 0.4);
    5: DimChevrons(ChevLeft[5], ChevRight[5], 0.4);
  end;

  Inc(FErrorCycle);

  if FErrorCycle > 5 then
    FErrorCycle:= 1;

  case FErrorCycle of
    1: DimChevrons(ChevLeft[1], ChevRight[1], 1.0);
    2: DimChevrons(ChevLeft[2], ChevRight[2], 1.0);
    3: DimChevrons(ChevLeft[3], ChevRight[3], 1.0);
    4: DimChevrons(ChevLeft[4], ChevRight[4], 1.0);
    5: DimChevrons(ChevLeft[5], ChevRight[5], 1.0);
  end;
end;

procedure FMXDesigning;
var
  i: Integer;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btMain, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF0E192B);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  RectFrame.FCreate(FormLayer.Handle);
  RectFrame.SetBounds(110, 140, 537, 117);
  RectFrame.CornerStyle(25, 25, [tcTopRight], ctBevel);
  RectFrame.FillColor(ALNull);
  RectFrame.StrokeColor(ALCornflowerblue);
  RectFrame.StrokeSetting(1, scFlat, sdSolid, sjMiter);

  StatusTitleLayer.FCreate(RectFrame.Handle);
  StatusTitleLayer.Align(Top);
  StatusTitleLayer.Height(25);
  StatusTitleLayer.Margins(4, 4, 2, 0);

  StatusTitleTraingle.FCreate(StatusTitleLayer.Handle);
  StatusTitleTraingle.Align(Right);
  StatusTitleTraingle.Width(25);
  StatusTitleTraingle.Direction(rdUp);
  StatusTitleTraingle.FillGradient($FF012234, $FF00527E, gsLinear);
  StatusTitleTraingle.FillGradientLinearAngle(-90);
  StatusTitleTraingle.RightAngleCorner(tcBottomLeft);
  StatusTitleTraingle.TriangleType(rttRightAngle);
  StatusTitleTraingle.StrokeSetting(0, scFlat, sdSolid, sjMiter);
  
  StatusTitleRect.FCreate(StatusTitleLayer.Handle);
  StatusTitleRect.Align(Client);
  StatusTitleRect.FillGradient($FF012234, $FF00527E, gsLinear);
  StatusTitleRect.FillGradientLinearAngle(-90);
  StatusTitleRect.StrokeSetting(0, scFlat, sdSolid, sjMiter);
  StatusTitleRect.Width(506);

  StatusTitleText.FCreate(StatusTitleLayer.Handle);
  StatusTitleText.Position(12, 0);
  StatusTitleText.Height(25);
  StatusTitleText.Width(265);
  StatusTitleText.Text('System Status');
  StatusTitleText.TextSetting(False, txLeading, txCenter);
  StatusTitleText.FontSetting('Segoe UI Variable Text Bold', 16, ALLightskyblue);

  StatusLayer.FCreate(RectFrame.Handle);
  StatusLayer.Align(Center);
  StatusLayer.Height(61);
  StatusLayer.Width(410);

  StatusCenterRect.FCreate(StatusLayer.Handle);
  StatusCenterRect.CornerStyle(14, 30, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctBevel);
  StatusCenterRect.Position(132, 4);
  StatusCenterRect.Height(50);
  StatusCenterRect.Width(145);
  StatusCenterRect.FillGradient($FF6D0202, $FFBF0000, gsLinear);
  StatusCenterRect.FillGradientLinearAngle(90);
  StatusCenterRect.StrokeColor(ErrorOutlineColor);
  StatusCenterRect.StrokeSetting(2, scFlat, sdSolid, sjMiter);

  StatusCenterText.FCreate(StatusCenterRect.Handle);
  StatusCenterText.Align(Center);
  StatusCenterText.Position(12, 0);
  StatusCenterText.Height(50);
  StatusCenterText.Width(109);
  StatusCenterText.Text('Error');
  StatusCenterText.TextSetting(False, txCenter, txCenter);
  StatusCenterText.FontSetting('Segoe UI Variable Display Bold', 24, ErrorOutlineColor);

  for i:= 1 to 5 do
  begin
    ChevLeft[i].FCreate(StatusLayer.Handle);
    ChevLeft[i].Angle(120);
    ChevLeft[i].Direction(rdLeft);
    ChevLeft[i].Height(50);
    ChevLeft[i].Width(30);
    ChevLeft[i].Position(106 - 26 * (i -1), 4);
    ChevLeft[i].FillGradient($FF6D0202, $FFBF0000, gsLinear);
    ChevLeft[i].FillGradientLinearAngle(90);
    ChevLeft[i].StrokeColor(ErrorOutlineColor);
    ChevLeft[i].StrokeSetting(2, scFlat, sdSolid, sjMiter);
  end;

  for i:= 1 to 5 do
  begin
    ChevRight[i].FCreate(StatusLayer.Handle);
    ChevRight[i].Angle(120);
    ChevRight[i].Direction(rdRight);
    ChevRight[i].Height(50);
    ChevRight[i].Width(30);
    ChevRight[i].Position(273 + 26 * (i -1), 4);
    ChevRight[i].FillGradient($FF6D0202, $FFBF0000, gsLinear);
    ChevRight[i].FillGradientLinearAngle(90);
    ChevRight[i].StrokeColor(ErrorOutlineColor);
    ChevRight[i].StrokeSetting(2, scFlat, sdSolid, sjMiter);
  end;

  ErrTimer.FCreate(FMXForm.Handle);
  ErrTimer.Interval(140);
  ErrTimer.OnTimer(@ErrTimerOnTimer);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(758, 450);
  FMXDesigning;
  FMXForm.Show;

  ErrTimer.Enabled(True);
end;
