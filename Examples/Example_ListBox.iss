[Setup]
AppName=FMXBridge_ListBox
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
Source: "Files\ListBox\*"; Flags: dontcopy
Source: "Files\Styles\LightStyle.fsf"; Flags: dontcopy

[CustomMessages]
YesBtn=Yes
NoBtn=No
ExitMsg1=Are you sure to exit the installer?
ExitMsg2=This will closes the installer wizard.%nThe product you are installing would not be installed.

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  mListBox         : FListBox;
  mListBoxHeader   : FListBoxHeader;
  mHeaderText      : FText;
  mGroupHeader     : FListBoxGroupHeader;
  mGroupFooter     : FListBoxGroupFooter;
  mListBoxItem     : array [1..8] of FListBoxItem;
  mImgList         : FImageList;

  nListBox         : FListBox;
  nListBoxItem     : array [1..24] of FListBoxItem;

  kListBox         : FListBox;
  kGroupHeader     : array [1..5] of FListBoxGroupHeader;
  kGroupFooter     : array [1..5] of FListBoxGroupFooter;
  kListBoxItem     : array [1..15] of FListBoxItem;
  kSearchBox       : FSearchBox;

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
  FMXForm       := InitFormHandle;
  FormLayer     := InitLayoutHandle;
  TitleBar      := InitWinTitleBarHandle;

  mListBox      := InitListBoxHandle;
  mListBoxHeader:= InitListBoxHeaderHandle;
  mHeaderText   := InitTextHandle;
  mGroupHeader  := InitListBoxGroupHeaderHandle;
  mGroupFooter  := InitListBoxGroupFooterHandle;
  mImgList      := InitImageListHandle;
  for i:= 1 to 8 do mListBoxItem[i]:= InitListBoxItemHandle;

  nListBox:= InitListBoxHandle;
  for i:= 1 to 24 do nListBoxItem[i]:= InitListBoxItemHandle;

  kListBox:= InitListBoxHandle;
  kSearchBox:= InitSearchBoxHandle;
  for i:= 1 to 5 do kGroupHeader[i]:= InitListBoxGroupHeaderHandle;
  for i:= 1 to 5 do kGroupFooter[i]:= InitListBoxGroupFooterHandle;
  for i:= 1 to 15 do kListBoxItem[i]:= InitListBoxItemHandle;

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

    TObject(mListBoxItem[2].GetObject):
    begin
      mListBox.BeginUpdate;

      if mListBoxItem[3].IsVisible then
      begin
        mListBoxItem[3].Visible(False);
        mListBoxItem[4].Visible(False);
      end else
      begin
        mListBoxItem[3].Visible(True);
        mListBoxItem[4].Visible(True);
      end;

      mListBox.EndUpdate;
    end;

  end;
end;

procedure FMXDesigning;
var
  i, j, n, k: Integer;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btTabbed, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('LightStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF324AA4);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  mImgList.FCreate(FormLayer.Handle);
  mImgList.AddImage(ExtractAndLoad('icon.ico'));
  mImgList.AddImage(ExtractAndLoad('config.bmp'));
  mImgList.AddImage(ExtractAndLoad('dir.bmp'));
  mImgList.AddImage(ExtractAndLoad('uninstall.bmp'));
  mImgList.AddImage(ExtractAndLoad('install.bmp'));
  mImgList.AddImage(ExtractAndLoad('quit.bmp'));

  mListBox.FCreate(FormLayer.Handle);
  mListBox.SetBounds(32, 53, 297, 249);
  mListBox.SmoothScroll(True);
  mListBox.Images(mImgList.Handle);

  mListBoxHeader.FCreate(mListBox.Handle);
  mListBox.AddItemHeader(mListBoxHeader.Handle);

  mHeaderText.FCreate(mListBoxHeader.Handle);
  mHeaderText.Align(Client);
  mHeaderText.Text('THE HEADER');
  mHeaderText.TextSetting(False, txCenter, txCenter);

  mGroupHeader.FCreate(mListBox.Handle);
  mGroupHeader.Text('GroupHeader');
  mGroupHeader.Selectable(False);
  mListBox.AddItemGroupHeader(mGroupHeader.Handle);

  mListBoxItem[1].FCreate(mListBox.Handle);
  mListBoxItem[1].Height(44);
  mListBoxItem[1].Text('Item1');
  mListBoxItem[1].ItemDataAccessory(aDetail);
  mListBoxItem[1].ItemDataDetail('Detail1');
  mListBoxItem[1].ImageIndex(0);
  mListBoxItem[1].StyleLookup('listboxitembottomdetail');
  mListBox.AddItem(mListBoxItem[1].Handle);

  mListBoxItem[2].FCreate(mListBox.Handle);
  mListBoxItem[2].Height(20);
  mListBoxItem[2].Selectable(False);
  mListBoxItem[2].Text('Item2');
  mListBoxItem[2].ItemDataAccessory(aMore);
  mListBoxItem[2].ItemDataDetail('Detail2');
  mListBoxItem[2].ImageIndex(1);
  mListBoxItem[2].StyleLookup('listboxitemrightdetail');
  mListBoxItem[2].OnClick(@CommonOnClick);
  mListBox.AddItem(mListBoxItem[2].Handle);

  mListBoxItem[3].FCreate(mListBox.Handle);
  mListBoxItem[3].Height(20);
  mListBoxItem[3].Text('Sub Item1');
  mListBoxItem[3].ItemDataAccessory(aNone);
  mListBoxItem[3].StyleLookup('listboxitemdetaillabel');
  mListBoxItem[3].Visible(False);
  mListBox.AddItem(mListBoxItem[3].Handle);

  mListBoxItem[4].FCreate(mListBox.Handle);
  mListBoxItem[4].Height(20);
  mListBoxItem[4].Text('Sub Item2');
  mListBoxItem[4].ItemDataAccessory(aNone);
  mListBoxItem[4].StyleLookup('listboxitemdetaillabel');
  mListBoxItem[4].Visible(False);
  mListBox.AddItem(mListBoxItem[4].Handle);

  mListBoxItem[5].FCreate(mListBox.Handle);
  mListBoxItem[5].Height(20);
  mListBoxItem[5].Text('Item3');
  mListBoxItem[5].ItemDataAccessory(aCheckmark);
  mListBoxItem[5].ItemDataDetail('Detail3');
  mListBoxItem[5].ImageIndex(2);
  mListBoxItem[5].StyleLookup('listboxitemrightdetail');
  mListBox.AddItem(mListBoxItem[5].Handle);

  mListBoxItem[6].FCreate(mListBox.Handle);
  mListBoxItem[6].Height(20);
  mListBoxItem[6].Text('Item4');
  mListBoxItem[6].ItemDataAccessory(aNone);
  mListBoxItem[6].ItemDataDetail('Detail4');
  mListBoxItem[6].ImageIndex(3);
  mListBoxItem[6].StyleLookup('listboxitemrightdetail');
  mListBox.AddItem(mListBoxItem[6].Handle);

  mListBoxItem[7].FCreate(mListBox.Handle);
  mListBoxItem[7].Height(20);
  mListBoxItem[7].Text('Item5');
  mListBoxItem[7].ItemDataAccessory(aNone);
  mListBoxItem[7].ItemDataDetail('Detail5');
  mListBoxItem[7].ImageIndex(4);
  mListBoxItem[7].StyleLookup('listboxitemrightdetail');
  mListBox.AddItem(mListBoxItem[7].Handle);

  mListBoxItem[8].FCreate(mListBox.Handle);
  mListBoxItem[8].Height(20);
  mListBoxItem[8].Text('Item6');
  mListBoxItem[8].ItemDataAccessory(aNone);
  mListBoxItem[8].ItemDataDetail('Detail6');
  mListBoxItem[8].ImageIndex(5);
  mListBoxItem[8].StyleLookup('listboxitemrightdetail');
  mListBox.AddItem(mListBoxItem[8].Handle);

  mGroupFooter.FCreate(mListBox.Handle);
  mGroupFooter.Text('GroupFooter');
  mListBox.AddItemGroupFooter(mGroupFooter.Handle);

  nListBox.FCreate(FormLayer.Handle);
  nListBox.SetBounds(152, 325, 397, 249);
  nListBox.SmoothScroll(True);
  nListBox.ShowCheckboxes(True);

  for i:= 1 to 24 do
  begin
    nListBoxItem[i].FCreate(nListBox.Handle);
    nListBoxItem[i].Height(20);

    if (i mod 2) = 0 then
    begin
      nListBoxItem[i].Checked(True);
      nListBoxItem[i].Margins(25, 0, 0, 0);
    end;

    nListBoxItem[i].Text('ListBoxItem ' + IntToStr(i));
    nListBox.AddItem(nListBoxItem[i].Handle);
  end;

  kListBox.FCreate(FormLayer.Handle);
  kListBox.SetBounds(354, 53, 321, 249);
  kListBox.SmoothScroll(True);

  kSearchBox.FCreate(kListBox.Handle);
  kSearchBox.TextPrompt('Search Aliens');
  kListBox.AddItemSearchBox(kSearchBox.Handle);

  for i:= Ord('A') to Ord('E') do
  begin
    n:= (i - Ord('A') + 1);

    kGroupHeader[n].FCreate(kListBox.Handle);
    kGroupHeader[n].Margins(-10, 0, 0, 0);
    kGroupHeader[n].Text(Chr(i));
    kGroupHeader[n].ItemDataDetail('Type ' + Chr(i) + ' Aliens');
    kGroupHeader[n].Selectable(False);
    kGroupHeader[n].StyleLookup('listboxitemrightdetail');
    kListBox.AddItemGroupHeader(kGroupHeader[n].Handle);

    for j:= 1 to 3 do
    begin
      k:= 3 * (n - 1) + j;

      kListBoxItem[k].FCreate(kListBox.Handle);
      kListBoxItem[k].Margins(10, 0, 0, 0);
      kListBoxItem[k].Text(Chr(i) + '_Alien' + IntToStr(j));
      kListBox.AddItem(kListBoxItem[k].Handle);
    end;

    kGroupFooter[n].FCreate(kListBox.Handle);
    kGroupFooter[n].Height(10);
    kGroupFooter[n].Text('');
    kGroupFooter[n].Selectable(False);
    kListBox.AddItemGroupFooter(kGroupFooter[n].Handle);
  end;

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btTabbed, True, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($FF324AA4);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display', 20, $FF767676);
  ExitFormLabel1.TextSetting(False, txCenter, txLeading);

  ExitFormLabel2.FCreate(ExitForm.Handle);
  ExitFormLabel2.SetBounds(15, 113, 505, 45);
  ExitFormLabel2.Text(CustomMessage('ExitFormLabel2'));
  ExitFormLabel2.FontSetting('Segoe UI Variable Text', 15, $FF767676);
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
  EmptyWizardForm(700, 590);
  FMXDesigning;
  FMXForm.Show;
end;
