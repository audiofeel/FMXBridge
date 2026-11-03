[Setup]
AppName=FMXBridge_Radiant_AllShapes
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

Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\LightStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  ARadiantAlertTriangle : FRadiantAlertTriangle;
  ARadiantArc           : FRadiantArc;
  ARadiantArrow         : FRadiantArrow;
  ARadiantBanner        : FRadiantBanner;
  ARadiantCallout       : FRadiantCallout;
  ARadiantCapsule       : FRadiantCapsule;
  ARadiantCheck         : FRadiantCheck;
  ARadiantChevron       : FRadiantChevron;
  ARadiantChevronArrow  : FRadiantChevronArrow;

  ARadiantCircle        : FRadiantCircle;
  ARadiantDiamond       : FRadiantDiamond;
  ARadiantEllipse       : FRadiantEllipse;
  ARadiantFrame         : FRadiantFrame;
  ARadiantGear          : FRadiantGear;
  ARadiantHexagon       : FRadiantHexagon;
  ARadiantLine          : FRadiantLine;
  ARadiantMarker        : FRadiantMarker;
  ARadiantMinus         : FRadiantMinus;

  ARadiantNoRing        : FRadiantNoRing;
  ARadiantOctagon       : FRadiantOctagon;
  ARadiantParallelogram : FRadiantParallelogram;
  ARadiantPentagon      : FRadiantPentagon;
  ARadiantPlus          : FRadiantPlus;
  ARadiantPointer       : FRadiantPointer;
  ARadiantRectangle     : FRadiantRectangle;
  ARadiantRing          : FRadiantRing;
  ARadiantSector        : FRadiantSector;
  ARadiantSectorRing    : FRadiantSectorRing;

  ARadiantShield        : FRadiantShield;
  ARadiantSquare        : FRadiantSquare;
  ARadiantStar          : FRadiantStar;
  ARadiantTag           : FRadiantTag;
  ARadiantTrapezoid     : FRadiantTrapezoid;
  ARadiantTriangle      : FRadiantTriangle;
  ARadiantX             : FRadiantX;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  ARadiantAlertTriangle := InitRadiantAlertTriangleHandle;
  ARadiantArc           := InitRadiantArcHandle;
  ARadiantArrow         := InitRadiantArrowHandle;
  ARadiantBanner        := InitRadiantBannerHandle;
  ARadiantCallout       := InitRadiantCalloutHandle;
  ARadiantCapsule       := InitRadiantCapsuleHandle;
  ARadiantCheck         := InitRadiantCheckHandle;
  ARadiantChevron       := InitRadiantChevronHandle;
  ARadiantChevronArrow  := InitRadiantChevronArrowHandle;

  ARadiantCircle        := InitRadiantCircleHandle;
  ARadiantDiamond       := InitRadiantDiamondHandle;
  ARadiantEllipse       := InitRadiantEllipseHandle;
  ARadiantFrame         := InitRadiantFrameHandle;
  ARadiantGear          := InitRadiantGearHandle;
  ARadiantHexagon       := InitRadiantHexagonHandle;
  ARadiantLine          := InitRadiantLineHandle;
  ARadiantMarker        := InitRadiantMarkerHandle;
  ARadiantMinus         := InitRadiantMinusHandle;

  ARadiantNoRing        := InitRadiantNoRingHandle;
  ARadiantOctagon       := InitRadiantOctagonHandle;
  ARadiantParallelogram := InitRadiantParallelogramHandle;
  ARadiantPentagon      := InitRadiantPentagonHandle;
  ARadiantPlus          := InitRadiantPlusHandle;
  ARadiantPointer       := InitRadiantPointerHandle;
  ARadiantRectangle     := InitRadiantRectangleHandle;
  ARadiantRing          := InitRadiantRingHandle;
  ARadiantSector        := InitRadiantSectorHandle;
  ARadiantSectorRing    := InitRadiantSectorRingHandle;

  ARadiantShield        := InitRadiantShieldHandle;
  ARadiantSquare        := InitRadiantSquareHandle;
  ARadiantStar          := InitRadiantStarHandle;
  ARadiantTag           := InitRadiantTagHandle;
  ARadiantTrapezoid     := InitRadiantTrapezoidHandle;
  ARadiantTriangle      := InitRadiantTriangleHandle;
  ARadiantX             := InitRadiantXHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormTitleBar := InitWinTitleBarHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitButtonHandle;
  ExitFormNoBtn    := InitButtonHandle;
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
  Confirm:= False;
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

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btMain, False, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('LightStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  ARadiantAlertTriangle.FCreate(FormLayer.Handle);
  ARadiantAlertTriangle.Position(21, 61);
  ARadiantAlertTriangle.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantAlertTriangle.StrokeColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantAlertTriangle.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantArc.FCreate(FormLayer.Handle);
  ARadiantArc.CentralAngle(270);
  ARadiantArc.Position(91, 61);
  ARadiantArc.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantArc.StrokeColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantArc.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantArrow.FCreate(FormLayer.Handle);
  ARadiantArrow.Position(161, 61);
  ARadiantArrow.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantArrow.StrokeColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantArrow.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantBanner.FCreate(FormLayer.Handle);
  ARadiantBanner.Position(231, 61);
  ARadiantBanner.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantBanner.StrokeColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantBanner.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantCallout.FCreate(FormLayer.Handle);
  ARadiantCallout.Position(301, 61);
  ARadiantCallout.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantCallout.StrokeColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantCallout.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantCapsule.FCreate(FormLayer.Handle);
  ARadiantCapsule.Position(421, 61);
  ARadiantCapsule.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantCapsule.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantCapsule.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantCheck.FCreate(FormLayer.Handle);
  ARadiantCheck.Position(541, 61);
  ARadiantCheck.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantCheck.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantCheck.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantChevron.FCreate(FormLayer.Handle);
  ARadiantChevron.RotationAngle(90);
  ARadiantChevron.Position(601, 76);
  ARadiantChevron.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantChevron.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantChevron.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantChevronArrow.FCreate(FormLayer.Handle);
  ARadiantChevronArrow.Position(671, 61);
  ARadiantChevronArrow.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantChevronArrow.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantChevronArrow.StrokeSetting(3, scRound, sdSolid, sjMiter);

  //
  ARadiantCircle.FCreate(FormLayer.Handle);
  ARadiantCircle.Position(21, 201);
  ARadiantCircle.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantCircle.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantCircle.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantDiamond.FCreate(FormLayer.Handle);
  ARadiantDiamond.Position(91, 201);
  ARadiantDiamond.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantDiamond.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantDiamond.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantEllipse.FCreate(FormLayer.Handle);
  ARadiantEllipse.Position(161, 201);
  ARadiantEllipse.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantEllipse.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantEllipse.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantFrame.FCreate(FormLayer.Handle);
  ARadiantFrame.Position(301, 201);
  ARadiantFrame.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantFrame.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantFrame.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantGear.FCreate(FormLayer.Handle);
  ARadiantGear.Position(421, 201);
  ARadiantGear.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantGear.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantGear.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantHexagon.FCreate(FormLayer.Handle);
  ARadiantHexagon.Position(491, 201);
  ARadiantHexagon.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantHexagon.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantHexagon.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantLine.FCreate(FormLayer.Handle);
  ARadiantLine.Position(561, 201);
  ARadiantLine.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantLine.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantLine.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantMarker.FCreate(FormLayer.Handle);
  ARadiantMarker.Position(621, 201);
  ARadiantMarker.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantMarker.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantMarker.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantMinus.FCreate(FormLayer.Handle);
  ARadiantMinus.Position(681, 201);
  ARadiantMinus.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantMinus.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantMinus.StrokeSetting(3, scRound, sdSolid, sjMiter);

  //
  ARadiantNoRing.FCreate(FormLayer.Handle);
  ARadiantNoRing.Position(21, 301);
  ARadiantNoRing.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantNoRing.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantNoRing.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantOctagon.FCreate(FormLayer.Handle);
  ARadiantOctagon.Position(91, 301);
  ARadiantOctagon.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantOctagon.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantOctagon.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantParallelogram.FCreate(FormLayer.Handle);
  ARadiantParallelogram.Position(161, 301);
  ARadiantParallelogram.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantParallelogram.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantParallelogram.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantPentagon.FCreate(FormLayer.Handle);
  ARadiantPentagon.Position(241, 301);
  ARadiantPentagon.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantPentagon.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantPentagon.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantPlus.FCreate(FormLayer.Handle);
  ARadiantPlus.Position(311, 301);
  ARadiantPlus.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantPlus.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantPlus.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantPointer.FCreate(FormLayer.Handle);
  ARadiantPointer.Position(381, 301);
  ARadiantPointer.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantPointer.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantPointer.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantRectangle.FCreate(FormLayer.Handle);
  ARadiantRectangle.Position(451, 301);
  ARadiantRectangle.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantRectangle.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantRectangle.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantRing.FCreate(FormLayer.Handle);
  ARadiantRing.Position(521, 301);
  ARadiantRing.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantRing.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantRing.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantSector.FCreate(FormLayer.Handle);
  ARadiantSector.Position(581, 301);
  ARadiantSector.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantSector.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantSector.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantSectorRing.FCreate(FormLayer.Handle);
  ARadiantSectorRing.Position(661, 301);
  ARadiantSectorRing.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantSectorRing.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantSectorRing.StrokeSetting(3, scRound, sdSolid, sjMiter);

  //
  ARadiantShield.FCreate(FormLayer.Handle);
  ARadiantShield.Position(21, 401);
  ARadiantShield.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantShield.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantShield.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantSquare.FCreate(FormLayer.Handle);
  ARadiantSquare.Position(91, 401);
  ARadiantSquare.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantSquare.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantSquare.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantStar.FCreate(FormLayer.Handle);
  ARadiantStar.Position(151, 401);
  ARadiantStar.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantStar.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantStar.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantTag.FCreate(FormLayer.Handle);
  ARadiantTag.Position(231, 401);
  ARadiantTag.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantTag.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantTag.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantTrapezoid.FCreate(FormLayer.Handle);
  ARadiantTrapezoid.Position(301, 401);
  ARadiantTrapezoid.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantTrapezoid.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantTrapezoid.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantTriangle.FCreate(FormLayer.Handle);
  ARadiantTriangle.Position(401, 401);
  ARadiantTriangle.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantTriangle.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantTriangle.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ARadiantX.FCreate(FormLayer.Handle);
  ARadiantX.Position(471, 401);
  ARadiantX.FillColor(TAlphaColor($FF000000 or Random($00FFFFFF)));
  ARadiantX.StrokeColor(TAlphaColor($FF000000 or Random($FF000000)));
  ARadiantX.StrokeSetting(3, scRound, sdSolid, sjMiter);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btMain, False, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(228);
  ExitForm.Width(440);

  ExitFormTitleBar.FCreate(ExitForm.Handle, False);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(25, 55, 380, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.TextSetting(False, txLeading, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(25, 100, 380, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.TextSetting(False, txLeading, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.Height(54);

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(273, 187, 56, 27);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(342, 187, 72, 27);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(758, 550);
  FMXDesigning;
  FMXForm.Show;
end;
