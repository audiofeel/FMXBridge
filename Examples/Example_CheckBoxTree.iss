
//#define NoBackground

[Setup]
AppName=FMXBridge_CheckBoxTree
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

Source: "Files\Images\wallpapers5.jpg"; Flags: dontcopy
Source: "Files\Images\wallpapers7.jpg"; Flags: dontcopy
Source: "Files\Images\wallpapers10.jpg"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy
Source: "Files\Styles\Transparent.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  CheckBoxTree     : FCheckBoxTree;

  // SectionLocal
  SectionLocal     : NativeInt;
  SectionVoice     : NativeInt;
  SectionLang      : NativeInt;

  // Voice
  VoiceCheckBoxEn  : NativeInt;
  VoiceCheckBoxRu  : NativeInt;

  // Lang
  LangCheckBoxEn   : NativeInt;
  LangCheckBoxRu   : NativeInt;

  // SectionCrack
  SectionCrack     : NativeInt;

  // Crack
  CrackRadioBtn3DM : NativeInt;
  CrackRadioBtnCPY : NativeInt;

  // SectionRedist
  SectionRedist    : NativeInt;
  RedistCheckBox   : NativeInt;

  // Redist
  RedistCheckBoxDX : NativeInt;
  RedistCheckBoxVC1: NativeInt;
  RedistCheckBoxVC2: NativeInt;

  // SectionVideo
  SectionVideo     : NativeInt;
  VideoRadioBtn    : NativeInt;

  // Video
  VideoRadioBtn2K  : NativeInt;
  VideoRadioBtn4K  : NativeInt;

  Picture          : FRectangle;
  PctText          : FText;

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

  CheckBoxTree     := InitCheckBoxTree;

  Picture          := InitRectangleHandle;
  PctText          := InitTextHandle;

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

procedure OnMouseEnter(Sender: TObject);
begin
  Picture.FillPicture(ExtractAndLoad('wallpapers10.jpg'), wmTileStretch);

  PctText.Text('On Mouse Enter');
end;

procedure OnMouseLeave(Sender: TObject);
begin
  Picture.FillPicture(ExtractAndLoad('wallpapers7.jpg'), wmTileStretch);

  PctText.Text('On Mouse Leave');
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBlankForm(WizardForm.Handle, $FF4B0F19, '', True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('Transparent.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF0E192B);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  CheckBoxTree.FCreate(FormLayer.Handle);
  CheckBoxTree.SetBounds(20, 50, 315, 360);

#ifdef NoBackground
  CheckBoxTree.RemoveBackground;
#endif

  // SectionLocal
  SectionLocal:= CheckBoxTree.AddEmptySection(NativeInt(CheckBoxTree.Handle), 'Localization types');
  SectionVoice:= CheckBoxTree.AddEmptySection(SectionLocal, 'Voice-over');
  SectionLang:= CheckBoxTree.AddEmptySection(SectionLocal, 'Interface');
  CheckBoxTree.SectionFontSetting(SectionLocal, 'Segoe UI', 15, AlLime);

  // Voice
  VoiceCheckBoxEn:= CheckBoxTree.AddCheckBox(SectionVoice, 0, 0, 200, 'English voices');
  VoiceCheckBoxRu:= CheckBoxTree.AddCheckBox(SectionVoice, 0, 0, 200, 'Russian voices');
  CheckBoxTree.CheckBoxSetChecked(VoiceCheckBoxEn, True);
  CheckBoxTree.CheckBoxSetChecked(VoiceCheckBoxRu, True);
  CheckBoxTree.ItemOnMouseEnter(VoiceCheckBoxEn, @OnMouseEnter);
  CheckBoxTree.ItemOnMouseLeave(VoiceCheckBoxEn, @OnMouseLeave);

  // Lang
  LangCheckBoxEn:= CheckBoxTree.AddCheckBox(SectionLang, 0, 0, 200, 'English interface');
  LangCheckBoxRu:= CheckBoxTree.AddCheckBox(SectionLang, 0, 0, 200, 'Russian interface');
  CheckBoxTree.CheckBoxSetChecked(LangCheckBoxEn, True);
  CheckBoxTree.CheckBoxSetChecked(LangCheckBoxRu, True);
  CheckBoxTree.ItemOnMouseEnter(LangCheckBoxEn, @OnMouseEnter);
  CheckBoxTree.ItemOnMouseLeave(LangCheckBoxEn, @OnMouseLeave);

  // SectionCrack
  SectionCrack:= CheckBoxTree.AddEmptySection(NativeInt(CheckBoxTree.Handle), 'Game crack');
  CheckBoxTree.SectionFontSetting(SectionCrack, 'Segoe UI', 15, AlDarkorange);

  // Crack
  CrackRadioBtn3DM:= CheckBoxTree.AddRadioBtn(SectionCrack, 0, 0, 200, '3DM');
  CrackRadioBtnCPY:= CheckBoxTree.AddRadioBtn(SectionCrack, 0, 0, 200, 'CPY');
  CheckBoxTree.RadioBtnSetChecked(CrackRadioBtn3DM, True);
  CheckBoxTree.RadioBtnGroupName(CrackRadioBtn3DM, 'r');
  CheckBoxTree.RadioBtnGroupName(CrackRadioBtnCPY, 'r');
  CheckBoxTree.ItemOnMouseEnter(CrackRadioBtnCPY, @OnMouseEnter);
  CheckBoxTree.ItemOnMouseLeave(CrackRadioBtnCPY, @OnMouseLeave);

  // SectionRedist
  SectionRedist:= CheckBoxTree.AddCheckBoxSection(NativeInt(CheckBoxTree.Handle), 20, 0, 200, 'Redist', RedistCheckBox);
  CheckBoxTree.CheckBoxSetChecked(RedistCheckBox, True);
  CheckBoxTree.CheckBoxFontSetting(RedistCheckBox, 'Segoe UI', 15, AlYellow);

  // Redist
  RedistCheckBoxDX:= CheckBoxTree.AddCheckBox(SectionRedist, 20, 0, 200, 'DirectX');
  RedistCheckBoxVC1:= CheckBoxTree.AddCheckBox(SectionRedist, 20, 0, 200, 'Visual C++ 2015 x64');
  RedistCheckBoxVC2:= CheckBoxTree.AddCheckBox(SectionRedist, 20, 0, 200, 'Visual C++ 2015 x86');
  CheckBoxTree.CheckBoxSetChecked(RedistCheckBoxDX, True);
  CheckBoxTree.CheckBoxSetChecked(RedistCheckBoxVC1, True);
  CheckBoxTree.CheckBoxSetChecked(RedistCheckBoxVC2, True);

  //SectionVideo
  SectionVideo:= CheckBoxTree.AddCheckBoxSection(NativeInt(CheckBoxTree.Handle), 20, 0, 200, 'Video Cutscenes', VideoRadioBtn);
  CheckBoxTree.CheckBoxSetChecked(VideoRadioBtn, True);
  CheckBoxTree.CheckBoxFontSetting(VideoRadioBtn, 'Segoe UI', 15, ALDeepSkyBlue);

  //Video
  VideoRadioBtn2K:= CheckBoxTree.AddRadioBtn(SectionVideo, 20, 0, 200, '2K Video');
  VideoRadioBtn4K:= CheckBoxTree.AddRadioBtn(SectionVideo, 20, 0, 200, '4K Video');
  CheckBoxTree.RadioBtnSetChecked(VideoRadioBtn2K, True);
  CheckBoxTree.RadioBtnGroupName(VideoRadioBtn2K, 'v');
  CheckBoxTree.RadioBtnGroupName(VideoRadioBtn4K, 'v');

  CheckBoxTree.SectionExpandAll(SectionLocal);
  CheckBoxTree.SectionExpand(SectionCrack);
  CheckBoxTree.SectionExpand(SectionRedist);
  CheckBoxTree.SectionExpand(SectionVideo);

  Picture.FCreate(FormLayer.Handle);
  Picture.SetBounds(355, 50, 381, 214);
  Picture.FillPicture(ExtractAndLoad('wallpapers7.jpg'), wmTileStretch);

  PctText.FCreate(FMXForm.Handle);
  PctText.SetBounds(Picture.GetLeft, Picture.GetTop + Picture.GetHeight + 10, Picture.GetWidth, 30);
  PctText.Text('CheckBoxTree');
  PctText.FontSetting('Segoe UI', 16, $FFFFFFFF);

  ExitForm.FCreateBlankForm(FMXForm.HandleHWND, ALCornflowerBlue, '', True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

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
  EmptyWizardForm(761, 449);
  FMXDesigning;
  FMXForm.Show;
end;
