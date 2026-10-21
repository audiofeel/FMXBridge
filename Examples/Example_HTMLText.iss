[Setup]
AppName=FMXBridge_HTMLText
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
Source: "Files\HTMLText\*"; Flags: dontcopy
Source: "Files\Styles\DarkStyle.fsf"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm          : FForm;
  FormLayer        : FLayout;
  TitleBar         : FWinTitleBar;

  HTMLText         : FHTMLText;
  ImageList        : FImageList;
  ScrollBox        : FVertScrollBox;
  HTMLText1        : FHTMLText;

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

  HTMLText         := InitHTMLTextHandle;
  ImageList        := InitImageListHandle;
  ScrollBox        := InitVertScrollBoxHandle;
  HTMLText1        := InitHTMLTextHandle;

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

  end;
end;

procedure FMXDesigning;
var
  S, S1: string;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btMain, False, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('DarkStyle.fsf'), 0);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($FF324AA4);
  TitleBar.CloseBtnOnClick(@CommonOnClick);

  S := 'The <fs:20><spoiler:bf-link-01>FireMonkey framework</spoiler></fs>' +
       '<sdetail:bf-link-01>   Developed by <b>Embarcadero Technologies</b></sdetail>' +

       '<fc:claBlack> is the <u>app development</u> and <u>runtime platform</u> behind'  +
       '<br><br>'  +

       '<fc:claPurple><b>RAD Studio</b></fc>, <fc:claPurple><b>Delphi</b></fc>, <fc:claRed><fs:14><s><b>.Net</b></s></fs></fc> and <fc:claPurple><b>C++Builder</b></fc>. ' +
       ' <b><i><bc:claYellow>FireMonkey</bc></i></b> is designed for teams building <br><i>multi-device</i>, <i>true native apps</i> for' +
       ' <fs:15><fc:claLightSeaGreen>Windows</fc></fs>, <fs:15><fc:claLightSeaGreen>OS X</fc></fs>, <fs:15><fc:claLightSeaGreen>Android</fc></fs> and <fs:15><fc:claLightSeaGreen>iOS</fc></fs>,' +

       '<br>' +

       'and getting them to app stores and enterprises fast.' +

       '<br><br><br>' +

       '<ul><fs:15><fc:claOrangered>' +
       '<li>Item 01</li>' +
       '<li>Item 02</li>' +
       '</fc>' +

       '<ol><fc:claSienna>' +
       '<li>Sub Item 2.1</li>' +
       '<li>Sub Item 2.2</li>' +
       '</fc></ol>' +

       '<fc:claOrangered>' +
       '<li>Item 03</li>' +
       '</fc>' +

       '</fs></ul>';

  HTMLText.FCreate(FormLayer.Handle);
  HTMLText.Text(S);
  HTMLText.Width(360);
  HTMLText.AutoHeight(True);
  HTMLText.Left(10);
  HTMLText.Top(100);

  ImageList.FCreate(FormLayer.Handle);
  ImageList.Clear;
  ImageList.AddImage(ExtractAndLoad('GTA6.png'));

  ScrollBox.FCreate(FormLayer.Handle);
  ScrollBox.SetBounds(380, 60, 455, 332);
  ScrollBox.TouchTracking(True);
  ScrollBox.ScrollAnimation(True);
  ScrollBox.Bounces(True);

  S1 := '<img:0>' +
        '<fn:Segoe UI Variable Text><fs:13><fc:claBlack>' + // <- чёрный по умолчанию

        '<fc:#FFCD01><fs:20><tf:105>{#SetupSetting('AppName')}</fs></fc>' +
        '<br><br>' +

        '<fc:claPalegreen><b>Release Date:</b></fc><tf:105>September 17, 2025<br>' +
        '<fc:claPalegreen><b>Genres/Tags:</b></fc><tf:105>Open world, Action-adventure, Nonlinear gameplay<br>' +
        '<fc:claPalegreen><b>Developer:</b></fc><tf:105>Rockstar Games<br>' +
        '<fc:claPalegreen><b>Publisher:</b></fc><tf:105>Take-Two Interactive Software<br>' +
        '<fc:claPalegreen><b>Engine:</b></fc><tf:105>Next-gen RAGE<br>' +
        '<fc:claPalegreen><b>Crack:</b></fc><tf:105>US Navy<br><br>' +

        '<b><fs:18>Repack Features:</fs></b><br><br>' +

        '<ul>' +
        '<li>Based on ISO release: (75,123,456,789 bytes)</li>' +
        '<li>MD5 Perfect: all files are identical to originals after installation</li>' +
        '<li>NOTHING ripped, NOTHING re-encoded</li>' +
        '<li>Significantly smaller archive size (compressed from N to M GB)</li>' +
        '<li>Installation takes ZZZ minutes (depending on your system)</li>' +
        '<li>HDD space after installation: 75 GB</li>' +
        '</ul><br><br>' +

        '<b><fs:18>Repack Features (Extended):</fs></b><br><br>' +

        '<ul>' +
        '<li>Based on {#SetupSetting('AppName')} {#SetupSetting('AppVersion')} release: 75.0 GB, thanks to US Navy!</li>' +
        '<li>All DLCs are available in multiplayer mode</li>' +
        '<li>US Navy''s offline crack applied over</li>' +
        '<li>100% Lossless & MD5 Perfect: all files are identical to originals after installation</li>' +
        '<li>NOTHING ripped, NOTHING re-encoded</li>' +
        '<li>Selective Download feature: you may skip downloading and installing of multiplayer and language files you don''t need</li>' +
        '<li>Significantly smaller archive size (compressed from 72.2 to 14.4~27.4 GB, depending on selected components)</li>' +
        '<li>Installation takes (Singleplayer campaign only) takes: ~10 minutes on 8-threads CPU; ~20 minutes on 4-threads CPU. Installation with MP components is twice longer</li>' +
        '<li>After-install integrity check so you could make sure that everything installed properly</li>' +
        '<li>HDD space after installation: up to 75 GB</li>' +
        '<li>Use .REG-files in "_Language Changer" folder in game root to change the game text/GUI language</li>' +
        '<li>Audio language can be changed in game settings</li>' +
        '<li>Use .REG-files in "_Language Changer" folder in game root to change the game text/GUI language</li>' +
        '<li>Audio language can be changed in game settings</li>' +
        '<li>Repack uses FreeArc</li>' +
        '<li>At least 2 GB of free RAM (inc. virtual) required for installing this repack</li>' +
        '</ul>' +

        '<br><br><br>' +

        '<b>I''m releasing new repacks on daily basis (well, almost).</b><br>' +
        'Check this page for the full list of my repacks:<br>' +
        '<a>http://fitgirl-repacks.site</a><br><br>' +
        'Info about soundtrack you''re listening is also in there!<br><br>' +

        '</fc></fs></fn>';
 
  HTMLText1.FCreate(ScrollBox.Handle);
  HTMLText1.Text(S1);
  HTMLText1.AutoHeight(True);
  HTMLText1.Left(0);
  HTMLText1.Top(0);
  HTMLText1.Width(ScrollBox.GetWidth - 20);
  HTMLText1.Images(ImageList.Handle);
  HTMLText1.HitTest(False);

  ExitForm.FCreateBackdropForm(FMXForm.HandleHWND, btMain, False, True);
  ExitForm.Caption(CustomMessage('ExitForm'));
  ExitForm.Height(248);
  ExitForm.Width(535);

  ExitFormTitleBar.FCreate(ExitForm.Handle, True);
  ExitFormTitleBar.SetColor($FF324AA4);
  ExitFormTitleBar.CloseBtnEnabled(False);

  ExitFormLabel1.FCreate(ExitForm.Handle);
  ExitFormLabel1.SetBounds(15, 69, 505, 28);
  ExitFormLabel1.Text(CustomMessage('ExitFormLabel1'));
  ExitFormLabel1.FontSetting('Segoe UI Variable Display Semib', 20, $FF767676);
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
  EmptyWizardForm(850, 480);
  FMXDesigning;
  FMXForm.Show;
end;
