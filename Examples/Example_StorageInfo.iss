[Setup]
AppName=FMXBridge_StorageInfo
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
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  StorageInfo      : FStorageInfo;
  StorageView      : FVertScrollBox;
  StorageGrid      : FGridLayout;
  StorageCard: array of FRectangle;
  StorageIcon: array of FImage;
  StorageText1: array of FText;
  StorageLoad: array of FProgressBar;
  StorageText2: array of FText;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FStatusBar;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;

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

    TObject(TitleBar.GetObjectCloseBtn):
      ExitForm.Show;

    TObject(ExitFormYesBtn.GetObject):
      WizardForm.CancelButton.OnClick(Sender);

    TObject(ExitFormNoBtn.GetObject):
      ExitForm.Close;

  end;
end;

procedure CreateCardStorage;
var
  DriveCount: Integer;
  I: Integer;
  Module: WideString;
  SystemDrive: string;
  DriveIconFile1: WideString;
  DriveIconFile2: WideString;
  IconFile: WideString;
begin
  Module := 'C:\Windows\SystemResources\imageres.dll.mun';
  SystemDrive := Uppercase(ExtractFileDrive(ExpandConstant('{sys}')));

  DriveIconFile1 := ExpandConstant('{tmp}\drive_system.png');
  DriveIconFile2 := ExpandConstant('{tmp}\drive_other.png');

  ExtractIconFromResource(Module, DriveIconFile1, 31, 32);
  ExtractIconFromResource(Module, DriveIconFile2, 27, 32);

  StorageView:= InitVertScrollBoxHandle;
  StorageView.FCreate(FormLayer.Handle);
  StorageView.Align(Client);
  StorageView.ScrollAnimation(True);

  StorageGrid:= InitGridLayoutHandle;
  StorageGrid.FCreate(StorageView.Handle);
  StorageGrid.Margins(18, 18, 18, 0);
  StorageGrid.Align(Top);
  StorageGrid.ItemWidth(295);
  StorageGrid.ItemHeight(90);
  StorageGrid.Orientation(oHorizontal);

  StorageInfo:= InitStorageInfo;
  DriveCount:= StorageInfo.Count;

  if DriveCount > 0 then
  begin
    SetArrayLength(StorageCard, DriveCount);
    SetArrayLength(StorageIcon, DriveCount);
    SetArrayLength(StorageText1, DriveCount);
    SetArrayLength(StorageLoad, DriveCount);
    SetArrayLength(StorageText2, DriveCount);

    for I:= 0 to DriveCount - 1 do
    begin
      StorageCard[I]:= InitRectangleHandle;
      StorageCard[I].FCreate(StorageGrid.Handle);
      StorageCard[I].Margins(16, 8, 0, 8);
      StorageCard[I].FillColor($26000000);
      StorageCard[I].StrokeColor($33000000);
      StorageCard[I].StrokeSetting(2, scRound, sdSolid, sjMiter);
      StorageCard[I].CornerStyle(6, 6, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

      StorageIcon[I]:= InitImageHandle;
      StorageIcon[I].FCreate(StorageCard[I].Handle);
      StorageIcon[I].Align(MostLeft);
      StorageIcon[I].Margins(3, 0, 0, 0);

      if Uppercase(StorageInfo.Letter(I)) = SystemDrive then
        IconFile:= DriveIconFile1
      else
        IconFile:= DriveIconFile2;

      StorageIcon[I].LoadPicture(IconFile, iwCenter);

      StorageText1[I]:= InitTextHandle;
      StorageText1[I].FCreate(StorageCard[I].Handle);
      StorageText1[I].Align(Top);
      StorageText1[I].Margins(0, 6, 6, 3);
      StorageText1[I].AutoSize(True);
      StorageText1[I].TextSetting(False, txLeading, txLeading);
      StorageText1[I].Text(StorageInfo.Name(I) + ' (' + StorageInfo.Letter(I) + ')');

      StorageLoad[I]:= InitProgressBarHandle;
      StorageLoad[I].FCreate(StorageCard[I].Handle);
      StorageLoad[I].Align(Client);
      StorageLoad[I].Margins(0, 3, 6, 3);
      StorageLoad[I].Value(StorageInfo.DiskLoad(I));

      StorageText2[I] := InitTextHandle;
      StorageText2[I].FCreate(StorageCard[I].Handle);
      StorageText2[I].Align(Bottom);
      StorageText2[I].Margins(0, 3, 6, 6);
      StorageText2[I].AutoSize(True);
      StorageText2[I].TextSetting(False, txLeading, txLeading);
      StorageText2[I].Text(MbOrTb(StorageInfo.SpaceFree(I), 1, 'MB', 'GB', 'TB') + ' free of ' +  MbOrTb(StorageInfo.SpaceTotal(I), 0, 'MB', 'GB', 'TB'));
    end;
  end
  else
    MsgBox('Oops. Something went completely wrong.' + #13#10 + '"StorageInfo" failed!', mbError, MB_OK);
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, False, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  CreateCardStorage;

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btTabbed, False, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, False);
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
  EmptyWizardForm(640, 450);
  FMXDesigning;
  FMXForm.Show;
end;
