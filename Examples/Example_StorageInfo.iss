
[Setup]
AppName=FMXBridge_StorageInfo
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

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  StorageInfo      : FStorageInfo;
  StorageView      : FVertScrollBox;
  StorageGrid      : FGridLayout;

  StorageCard      : array of FRectangle;
  StorageIcon      : array of FImage;
  StorageText1     : array of FText;
  StorageLoad      : array of FProgressBar;
  StorageText2     : array of FText;

  RecycleBinCard   : FRectangle;
  RecycleBinText1  : FText;
  RecycleBinText2  : FText;

procedure FMXInit;
begin
  FMXForm          := InitFormHandle;
  FormLayer        := InitLayoutHandle;
  TitleBar         := InitWinTitleBarHandle;
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

function BoolToText(AValue: Boolean): string;
begin
  if AValue then
    Result:= 'Yes'
  else
    Result:= 'No';
end;

function DriveTypeToStr(AType: TDriveType): string;
begin
  case AType of
    dtUnknown:   Result:= 'Unknown';
    dtNoRootDir: Result:= 'No root directory';
    dtRemovable: Result:= 'Removable';
    dtFixed:     Result:= 'Fixed';
    dtRemote:    Result:= 'Network';
    dtCDROM:     Result:= 'CD-ROM';
    dtRAMDisk:   Result:= 'RAM Disk';
  else
    Result:= 'Unknown';
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

  DriveReady: Boolean;
  DriveFileSystem: string;
  DriveSerial: string;

  ItemsCount: UInt64;
  TotalSize: UInt64;
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
  StorageGrid.ItemWidth(320);
  StorageGrid.ItemHeight(150);
  StorageGrid.Orientation(oHorizontal);

  StorageInfo:= InitStorageInfo;
  StorageInfo.Refresh;

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
      DriveReady:= StorageInfo.IsReady(I);

      if DriveReady then
      begin
        DriveFileSystem:= StorageInfo.FileSystem(I);

        if DriveFileSystem = '' then
          DriveFileSystem:= '-';

        DriveSerial:= IntToStr(StorageInfo.VolumeSerialNumber(I));
      end
      else
      begin
        DriveFileSystem:= '-';
        DriveSerial:= '-';
      end;

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
      StorageText1[I].Text(
        StorageInfo.Name(I) + ' (' + StorageInfo.Letter(I) + ')');

      StorageLoad[I]:= InitProgressBarHandle;
      StorageLoad[I].FCreate(StorageCard[I].Handle);
      StorageLoad[I].Width(240);
      StorageLoad[I].Height(8);
      StorageLoad[I].Align(Center);
      StorageLoad[I].Margins(0, 0, 8, 0);
      StorageLoad[I].Value(StorageInfo.DiskLoad(I));

      StorageText2[I]:= InitTextHandle;
      StorageText2[I].FCreate(StorageCard[I].Handle);
      StorageText2[I].Align(Bottom);
      StorageText2[I].Margins(0, 0, 6, 6);
      StorageText2[I].AutoSize(True);
      StorageText2[I].TextSetting(False, txLeading, txLeading);

      StorageText2[I].Text(
        'Type: ' + DriveTypeToStr(StorageInfo.MediaType(I)) +
        '   Ready: ' + BoolToText(DriveReady) + #13 +
        'File system: ' + DriveFileSystem + #13 +
        'Volume serial: ' + DriveSerial + #13 +
        MbOrTb(StorageInfo.SpaceFree(I), 1, 'MB', 'GB', 'TB') +
        ' free of ' +
        MbOrTb(StorageInfo.SpaceTotal(I), 0, 'MB', 'GB', 'TB')
      );
    end;
  end;

  RecycleBinCard:= InitRectangleHandle;
  RecycleBinCard.FCreate(StorageGrid.Handle);
  RecycleBinCard.Margins(16, 8, 0, 8);
  RecycleBinCard.FillColor($26000000);
  RecycleBinCard.StrokeColor($33000000);
  RecycleBinCard.StrokeSetting(2, scRound, sdSolid, sjMiter);
  RecycleBinCard.CornerStyle(6, 6, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);

  RecycleBinText1:= InitTextHandle;
  RecycleBinText1.FCreate(RecycleBinCard.Handle);
  RecycleBinText1.Align(Top);
  RecycleBinText1.Margins(8, 8, 8, 4);
  RecycleBinText1.AutoSize(True);
  RecycleBinText1.TextSetting(False, txLeading, txLeading);
  RecycleBinText1.Text('Recycle Bin');

  RecycleBinText2:= InitTextHandle;
  RecycleBinText2.FCreate(RecycleBinCard.Handle);
  RecycleBinText2.Align(Client);
  RecycleBinText2.Margins(8, 3, 8, 8);
  RecycleBinText2.TextSetting(False, txLeading, txLeading);

  ItemsCount:= 0;
  TotalSize:= 0;

  if StorageInfo.RecycleBinInfo(ItemsCount, TotalSize) then
  begin
    RecycleBinText2.Text(
      'Items count: ' + IntToStr(ItemsCount) + #13 +
      'Total size: ' +
      MbOrTb(TotalSize / 1024 / 1024, 1, 'MB', 'GB', 'TB')
    );
  end
  else
    RecycleBinText2.Text('Recycle Bin information unavailable');
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, False, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.MinimizeBtnOnClick(@CommonOnClick);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  CreateCardStorage;
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(690, 510);

  FMXDesigning;
  FMXForm.Show;
end;
