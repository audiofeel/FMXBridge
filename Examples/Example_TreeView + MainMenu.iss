[Setup]
AppId=FMXBridge_TreeView + MainMenu
AppName=FMXBridge_TreeView + MainMenu
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
Source: "Files\MenuBar\*"; Flags: dontcopy
Source: "Files\Styles\LightStyle.fsf"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"
var
  FMXForm       : FForm;
  FormLayer     : FLayout;
  TitleBar      : FWinTitleBar;

  PMenuBar      : FMenuBar;
  pMenuItem     : array [1..11] of FMenuItem;

  kTreeView     : FTreeView;
  kTreeViewItem : array [1..10] of FTreeViewItem;
  mTreeView     : FTreeView;
  mTreeViewItem : array [1..14] of FTreeViewItem;

  ImgIdx        : array [1..7] of Integer;
  ImgFile       : array [1..7] of WideString;
  ImgList       : FImageList;

  ExitForm         : FMsgForm;
  ExitFormTitleBar : FWinTitleBar;
  ExitFormLabel1   : FLabel;
  ExitFormLabel2   : FLabel;
  ExitFormYesBtn   : FButton;
  ExitFormNoBtn    : FButton;
  ExitFormBottomBar: FRectangle;

procedure FMXInit;
var
  i: Integer;
begin
  FMXForm   := InitFormHandle;
  FormLayer := InitLayoutHandle;
  TitleBar  := InitWinTitleBarHandle;

  PMenuBar  := InitMenuBarHandle;
  for i:= 1 to 11 do pMenuItem[i]:= InitMenuItemHandle;

  kTreeView := InitTreeViewHandle;
  for i:= 1 to 10 do kTreeViewItem[i]:= InitTreeViewItemHandle;
  mTreeView := InitTreeViewHandle;
  for i:= 1 to 14 do mTreeViewItem[i]:= InitTreeViewItemHandle;
  ImgList := InitImageListHandle;

  ExitForm         := InitMsgFormHandle;
  ExitFormTitleBar := InitWinTitleBarHandle;
  ExitFormLabel1   := InitLabelHandle;
  ExitFormLabel2   := InitLabelHandle;
  ExitFormYesBtn   := InitButtonHandle;
  ExitFormNoBtn    := InitButtonHandle;
  ExitFormBottomBar:= InitRectangleHandle;
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

    TObject(pMenuItem[2].GetObject):
      MsgBox(' Command:  Open ', mbInformation, MB_OK);

    TObject(pMenuItem[3].GetObject):
      MsgBox(' Command:  Save ', mbInformation, MB_OK);

    TObject(pMenuItem[4].GetObject):
      MsgBox(' Command:  Save as ', mbInformation, MB_OK);

    TObject(pMenuItem[6].GetObject):
      WizardForm.Close;

    TObject(pMenuItem[11].GetObject):
      MsgBox(' FMXBridge v0.3.0.0 ' + #13#10 + '  - Created by audiofeel ', mbInformation, MB_OK);

    TObject(pMenuItem[8].GetObject):
    begin
      FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);
      FMXForm.UpdateStyleBook;
      TitleBar.SetColor($FF0E192B);
      TitleBar.ChangeDarkMode(True);
      FMXForm.ChangeDarkMode(True);
//      ExitForm.UpdateStyleBook;
      ExitFormTitleBar.SetColor($FF0E192B);
      ExitFormTitleBar.ChangeDarkMode(True);
      ExitFormBottomBar.FillColor($FF0E192B);
      ExitForm.ChangeDarkMode(True);

      pMenuItem[1].ImageIndex(9);
      pMenuItem[2].ImageIndex(10);
      pMenuItem[3].ImageIndex(11);
      pMenuItem[4].ImageIndex(11);
      pMenuItem[6].ImageIndex(12);
      pMenuItem[7].ImageIndex(13);
      pMenuItem[8].ImageIndex(14);
      pMenuItem[9].ImageIndex(15);
      pMenuItem[10].ImageIndex(16);
      pMenuItem[11].ImageIndex(17);
    end;

    TObject(pMenuItem[9].GetObject):
    begin
      FMXForm.ChangeDarkMode(False);
      FMXForm.LoadStyleFromFile(ExtractAndLoad('LightStyle.fsf'), 0);
      FMXForm.UpdateStyleBook;
      TitleBar.SetColor($FF5A6EBA);
      TitleBar.ChangeDarkMode(False);
      ExitForm.ChangeDarkMode(False);
//      ExitForm.UpdateStyleBook;
      ExitFormTitleBar.SetColor($FF5A6EBA);
      ExitFormTitleBar.ChangeDarkMode(False);
      ExitFormBottomBar.FillColor($FF5A6EBA);

      pMenuItem[1].ImageIndex(0);
      pMenuItem[2].ImageIndex(1);
      pMenuItem[3].ImageIndex(2);
      pMenuItem[4].ImageIndex(2);
      pMenuItem[6].ImageIndex(3);
      pMenuItem[7].ImageIndex(4);
      pMenuItem[8].ImageIndex(5);
      pMenuItem[9].ImageIndex(6);
      pMenuItem[10].ImageIndex(7);
      pMenuItem[11].ImageIndex(8);
    end;

  end;
end;

procedure FMXDesigning;
var
  i: Integer;
  Module: WideString;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btMain, False, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('LightStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, False);
  TitleBar.SetColor($FF5A6EBA);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  ImgList.FCreate(FormLayer.Handle);
  ImgList.AddImage(ExtractAndLoad('home_icon.png'));
  ImgList.AddImage(ExtractAndLoad('open_icon.png'));
  ImgList.AddImage(ExtractAndLoad('save_icon.png'));
  ImgList.AddImage(ExtractAndLoad('exit_icon.png'));
  ImgList.AddImage(ExtractAndLoad('theme_icon.png'));
  ImgList.AddImage(ExtractAndLoad('dark_icon.png'));
  ImgList.AddImage(ExtractAndLoad('light_icon.png'));
  ImgList.AddImage(ExtractAndLoad('about_icon.png'));
  ImgList.AddImage(ExtractAndLoad('info_icon.png'));

  ImgList.AddImage(ExtractAndLoad('home_iconL.png'));
  ImgList.AddImage(ExtractAndLoad('open_iconL.png'));
  ImgList.AddImage(ExtractAndLoad('save_iconL.png'));
  ImgList.AddImage(ExtractAndLoad('exit_iconL.png'));
  ImgList.AddImage(ExtractAndLoad('theme_iconL.png'));
  ImgList.AddImage(ExtractAndLoad('dark_iconL.png'));
  ImgList.AddImage(ExtractAndLoad('light_iconL.png'));
  ImgList.AddImage(ExtractAndLoad('about_iconL.png'));
  ImgList.AddImage(ExtractAndLoad('info_iconL.png'));

  Module:= 'C:\Windows\SystemResources\imageres.dll.mun';
  ImgIdx[1]:= 31;
  ImgIdx[2]:= 27;
  ImgIdx[3]:= 83;
  ImgIdx[4]:= 105;
  ImgIdx[5]:= 107;
  ImgIdx[6]:= 175;
  ImgIdx[7]:= 4;

  for i:= 1 to 7 do
  begin
    ImgFile[i]:= ExpandConstant('{tmp}\') + IntToStr(i) + '.png';

    if ExtractIconFromResource(Module, ImgFile[i], ImgIdx[i], 16) then
      ImgList.AddImage(ImgFile[i]);
  end;

  PMenuBar.FCreate(FormLayer.Handle);
  PMenuBar.ImageList(ImgList.Handle);

  pMenuItem[1].FCreate(PMenuBar.Handle);
  pMenuItem[1].Text('Home');
  pMenuItem[1].ImageIndex(0);
  PMenuBar.AddItem(pMenuItem[1].Handle);

  pMenuItem[2].FCreate(pMenuItem[1].Handle);
  pMenuItem[2].Text('Open');
  pMenuItem[2].ShortCut(GetShortCut(vkO, [ssCtrl]));
  pMenuItem[2].ImageIndex(1);
  pMenuItem[2].OnClick(@CommonOnClick);
  pMenuItem[1].AddItem(pMenuItem[2].Handle);

  pMenuItem[3].FCreate(pMenuItem[1].Handle);
  pMenuItem[3].Text('Save');
  pMenuItem[3].ShortCut(GetShortCut(vkS, [ssCtrl]));
  pMenuItem[3].ImageIndex(2);
  pMenuItem[3].OnClick(@CommonOnClick);
  pMenuItem[1].AddItem(pMenuItem[3].Handle);

  pMenuItem[4].FCreate(pMenuItem[1].Handle);
  pMenuItem[4].Text('Save As');
  pMenuItem[4].ShortCut(GetShortCut(vkS, [ssCtrl, ssAlt]));
  pMenuItem[4].ImageIndex(2);
  pMenuItem[4].OnClick(@CommonOnClick);
  pMenuItem[1].AddItem(pMenuItem[4].Handle);

  pMenuItem[5].FCreate(pMenuItem[1].Handle);
  pMenuItem[5].Text('-');
  pMenuItem[1].AddItem(pMenuItem[5].Handle);

  pMenuItem[6].FCreate(pMenuItem[1].Handle);
  pMenuItem[6].Text('Exit');
  pMenuItem[6].ShortCut(GetShortCut(vkX, [ssCtrl]));
  pMenuItem[6].ImageIndex(3);
  pMenuItem[6].OnClick(@CommonOnClick);
  pMenuItem[1].AddItem(pMenuItem[6].Handle);

  pMenuItem[7].FCreate(PMenuBar.Handle);
  pMenuItem[7].Text('Personalize');
  pMenuItem[7].ImageIndex(4);
  PMenuBar.AddItem(pMenuItem[7].Handle);

  pMenuItem[8].FCreate(pMenuItem[7].Handle);
  pMenuItem[8].RadioItem(True);
  pMenuItem[8].AutoCheck(True);
  pMenuItem[8].GroupIndex(1);
  pMenuItem[8].SetChecked(False);
  pMenuItem[8].Text('Dark');
  pMenuItem[8].ShortCut(GetShortCut(vkD, [ssCtrl]));
  pMenuItem[8].ImageIndex(5);
  pMenuItem[8].OnClick(@CommonOnClick);
  pMenuItem[7].AddItem(pMenuItem[8].Handle);

  pMenuItem[9].FCreate(pMenuItem[7].Handle);
  pMenuItem[9].RadioItem(True);
  pMenuItem[9].AutoCheck(True);
  pMenuItem[9].GroupIndex(1);
  pMenuItem[9].SetChecked(True);
  pMenuItem[9].Text('Light');
  pMenuItem[9].ShortCut(GetShortCut(vkL, [ssCtrl]));
  pMenuItem[9].ImageIndex(6);
  pMenuItem[9].OnClick(@CommonOnClick);
  pMenuItem[7].AddItem(pMenuItem[9].Handle);

  { About }
  pMenuItem[10].FCreate(PMenuBar.Handle);
  pMenuItem[10].Text('About');
  pMenuItem[10].ImageIndex(7);
  PMenuBar.AddItem(pMenuItem[10].Handle);

  pMenuItem[11].FCreate(pMenuItem[10].Handle);
  pMenuItem[11].Text('About');
  pMenuItem[11].ShortCut(GetShortCut(vkA, [ssCtrl]));
  pMenuItem[11].ImageIndex(8);
  pMenuItem[11].OnClick(@CommonOnClick);
  pMenuItem[10].AddItem(pMenuItem[11].Handle);

  kTreeView.FCreate(FormLayer.Handle);
  kTreeView.SetBounds(40, 90, 249, 329);
  kTreeView.Images(ImgList.Handle);

  kTreeViewItem[1].FCreate(kTreeView.Handle);
  kTreeViewItem[1].ImageIndex(18);
  kTreeViewItem[1].Text(GetUserNameString);
  kTreeViewItem[1].Margins(-20,0,0,0);
  kTreeView.AddItem(kTreeViewItem[1].Handle);

  kTreeViewItem[2].FCreate(kTreeView.Handle);
  kTreeViewItem[2].ImageIndex(19);
  kTreeViewItem[2].Text('Desktop');
  kTreeViewItem[2].Margins(-20,0,0,0);
  kTreeView.AddItem(kTreeViewItem[2].Handle);

  kTreeViewItem[3].FCreate(kTreeView.Handle);
  kTreeViewItem[3].ImageIndex(20);
  kTreeViewItem[3].Text('Documents');
  kTreeViewItem[3].Margins(-20,0,0,0);
  kTreeView.AddItem(kTreeViewItem[3].Handle);

  kTreeViewItem[4].FCreate(kTreeView.Handle);
  kTreeViewItem[4].ImageIndex(21);
  kTreeViewItem[4].Text('Downloads');
  kTreeViewItem[4].Margins(-20,0,0,0);
  kTreeView.AddItem(kTreeViewItem[4].Handle);

  kTreeViewItem[5].FCreate(kTreeView.Handle);
  kTreeViewItem[5].ImageIndex(22);
  kTreeViewItem[5].Text('Disk 01');
  kTreeView.AddItem(kTreeViewItem[5].Handle);

  kTreeViewItem[6].FCreate(kTreeViewItem[5].Handle);
  kTreeViewItem[6].ImageIndex(24);
  kTreeViewItem[6].Text('Folder 01');
  kTreeViewItem[5].AddItem(kTreeViewItem[6].Handle);

  kTreeViewItem[7].FCreate(kTreeViewItem[5].Handle);
  kTreeViewItem[7].ImageIndex(24);
  kTreeViewItem[7].Text('Folder 02');
  kTreeViewItem[5].AddItem(kTreeViewItem[7].Handle);

  kTreeViewItem[8].FCreate(kTreeView.Handle);
  kTreeViewItem[8].ImageIndex(23);
  kTreeViewItem[8].Text('Disk 02');
  kTreeView.AddItem(kTreeViewItem[8].Handle);

  kTreeViewItem[9].FCreate(kTreeViewItem[8].Handle);
  kTreeViewItem[9].ImageIndex(24);
  kTreeViewItem[9].Text('Folder 01');
  kTreeViewItem[8].AddItem(kTreeViewItem[9].Handle);

  kTreeViewItem[10].FCreate(kTreeViewItem[9].Handle);
  kTreeViewItem[10].ImageIndex(24);
  kTreeViewItem[10].Text('Folder 02');
  kTreeViewItem[9].AddItem(kTreeViewItem[10].Handle);

  kTreeView.ExpandAll;

  mTreeView.FCreate(FormLayer.Handle);
  mTreeView.SetBounds(340, 90, 249, 329);
  mTreeView.ShowCheckboxes(True);

  mTreeViewItem[1].FCreate(mTreeView.Handle);
  mTreeViewItem[1].StyledSettings([]);
  mTreeViewItem[1].FontSetting('Segoe UI Variable Text', 12, AlRed);
  mTreeViewItem[1].Text('Come, Let''s Destroy Our World!');
  mTreeView.AddItem(mTreeViewItem[1].Handle);

  mTreeViewItem[2].FCreate(mTreeViewItem[1].Handle);
  mTreeViewItem[2].StyledSettings([]);
  mTreeViewItem[2].FontSetting('Segoe UI Variable Text', 12, AlBlue);
  mTreeViewItem[2].Text('Weapon Preset');
  mTreeViewItem[1].AddItem(mTreeViewItem[2].Handle);

  mTreeViewItem[3].FCreate(mTreeViewItem[2].Handle);
  mTreeViewItem[3].Text('Soviet');
  mTreeViewItem[2].AddItem(mTreeViewItem[3].Handle);

  mTreeViewItem[4].FCreate(mTreeViewItem[2].Handle);
  mTreeViewItem[4].Text('NATO');
  mTreeViewItem[2].AddItem(mTreeViewItem[4].Handle);

  mTreeViewItem[5].FCreate(mTreeViewItem[2].Handle);
  mTreeViewItem[5].Text('Nazi');
  mTreeViewItem[2].AddItem(mTreeViewItem[5].Handle);

  mTreeViewItem[6].FCreate(mTreeViewItem[1].Handle);
  mTreeViewItem[6].StyledSettings([]);
  mTreeViewItem[6].FontSetting('Segoe UI Variable Text', 12, AlPurple);
  mTreeViewItem[6].Text('Match 01');
  mTreeViewItem[1].AddItem(mTreeViewItem[6].Handle);

  mTreeViewItem[7].FCreate(mTreeViewItem[6].Handle);
  mTreeViewItem[7].Text('Russia');
  mTreeViewItem[6].AddItem(mTreeViewItem[7].Handle);

  mTreeViewItem[8].FCreate(mTreeViewItem[6].Handle);
  mTreeViewItem[8].Text('Ukraine + Nato');
  mTreeViewItem[6].AddItem(mTreeViewItem[8].Handle);

  mTreeViewItem[9].FCreate(mTreeViewItem[1].Handle);
  mTreeViewItem[9].StyledSettings([]);
  mTreeViewItem[9].FontSetting('Segoe UI Variable Text', 12, AlPurple);
  mTreeViewItem[9].Text('Match 02');
  mTreeViewItem[1].AddItem(mTreeViewItem[9].Handle);

  mTreeViewItem[10].FCreate(mTreeViewItem[9].Handle);
  mTreeViewItem[10].Text('Hamas + Jihad');
  mTreeViewItem[9].AddItem(mTreeViewItem[10].Handle);

  mTreeViewItem[11].FCreate(mTreeViewItem[9].Handle);
  mTreeViewItem[11].Text('Israel+ USA');
  mTreeViewItem[9].AddItem(mTreeViewItem[11].Handle);

  mTreeViewItem[12].FCreate(mTreeViewItem[1].Handle);
  mTreeViewItem[12].StyledSettings([]);
  mTreeViewItem[12].FontSetting('Segoe UI Variable Text', 12, AlPurple);
  mTreeViewItem[12].Text('Match 03');
  mTreeViewItem[1].AddItem(mTreeViewItem[12].Handle);

  mTreeViewItem[13].FCreate(mTreeViewItem[12].Handle);
  mTreeViewItem[13].Text('China');
  mTreeViewItem[12].AddItem(mTreeViewItem[13].Handle);

  mTreeViewItem[14].FCreate(mTreeViewItem[12].Handle);
  mTreeViewItem[14].Text('Taiwan + Nato');
  mTreeViewItem[12].AddItem(mTreeViewItem[14].Handle);

  mTreeView.ExpandAll;

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btMain, False, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(200);
  ExitForm.Width(400);

  ExitFormTitleBar.FCreate(ExitForm.Handle, False);
  ExitFormTitleBar.SetColor($FF5A6EBA);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 49, 370, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 88, 370, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.TextSetting(False, txCenter, txCenter);

  ExitFormBottomBar.FCreate(ExitForm.Handle);
  ExitFormBottomBar.SetBounds(0, 150, 400, 50);
  ExitFormBottomBar.FillColor($FF5A6EBA);
  ExitFormBottomBar.SendToBack;

  ExitFormYesBtn.FCreate(ExitForm.Handle);
  ExitFormYesBtn.SetBounds(250, 164, 46, 22);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesButton'));
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitForm.Handle);
  ExitFormNoBtn.SetBounds(312, 164, 72, 22);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoButton'));
  ExitFormNoBtn.OnClick(@CommonOnClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(640, 480);
  FMXDesigning;

  FMXForm.Show;
end;
