[Setup]
AppName=FMXBridge_RatingBar
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
Source: "Files\Styles\LightStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  RatingBar        : FRatingBar;
  ShapeSelector    : FComboBox;
  ProgressTrackbar : FTrackbar;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

  RatingBar        := InitRatingBar;
  ShapeSelector    := InitComboBoxHandle;
  ProgressTrackbar := InitTrackbarHandle;
end;

function InitializeSetup(): Boolean;
begin
  FMXInit;
  Result:= True;
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

procedure TrackBarOnChange(Sender: TObject);
begin
  RatingBar.Value(ProgressTrackbar.GetValue);
end;

procedure ShapeSelectorOnChange(Sender: TObject);
begin
  case ShapeSelector.GetItemIndex of
    0: RatingBar.Shape(rbsStar);
    1: RatingBar.Shape(rbsHeart);
    2: RatingBar.Shape(rbsDiamond);
  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, False, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('LightStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  ShapeSelector.FCreate(FormLayer.Handle);
  ShapeSelector.SetBounds(130, 75, 364, 32);
  ShapeSelector.AddItem('Star');
  ShapeSelector.AddItem('Heart');
  ShapeSelector.AddItem('Diamond');
  ShapeSelector.SetDropDownCount(3);
  ShapeSelector.SetItemIndex(0);
  ShapeSelector.OnChange(@ShapeSelectorOnChange);

  RatingBar.FCreate(FormLayer.Handle);
  RatingBar.SetBounds(130, 145, 364, 63);
  RatingBar.Shape(rbsStar);
  RatingBar.ActiveColor(ALDeepPink);
  RatingBar.InActiveColor(ALDarkGreen);
  RatingBar.Count(5);
  RatingBar.Maximum(100);
  RatingBar.Space(10);
  RatingBar.Value(50);
  RatingBar.StrokeColor(ALIndigo);
  RatingBar.StrokeSetting(2, scFlat, sdSolid, sjMiter);

  ProgressTrackbar.FCreate(FormLayer.Handle);
  ProgressTrackbar.SetBounds(130, 235, 364, 20);
  ProgressTrackbar.Value(50);
  ProgressTrackbar.OnChange(@TrackBarOnChange);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(640, 400);
  FMXDesigning;

  FMXForm.Show;
end;
