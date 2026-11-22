[Setup]
AppName=FMXBridge_TypedText
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

Source: "Files\Styles\ChangeAccentColor.style"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"

var
  FMXForm       : FForm;
  FormLayer     : FLayout;
  TitleBar      : FWinTitleBar;
  HeaderLabel   : FLabel;
  TypedText     : FTypedText;
  PlayButton    : FButton;
  PauseButton   : FButton;
  RestartButton : FButton;
  AddLineButton : FButton;

procedure FMXInit;
begin
  FMXForm       := InitFormHandle;
  FormLayer     := InitLayoutHandle;
  TitleBar      := InitWinTitleBarHandle;
  HeaderLabel   := InitLabelHandle;
  TypedText     := InitTypedTextHandle;
  PlayButton    := InitButtonHandle;
  PauseButton   := InitButtonHandle;
  RestartButton := InitButtonHandle;
  AddLineButton := InitButtonHandle;
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

procedure TitleBarCloseClick(Sender: TObject);
begin
  WizardForm.CancelButton.OnClick(Sender);
end;

procedure ControlButtonClick(Sender: TObject);
begin
  case Sender of
    TObject(PlayButton.GetObject):
      TypedText.Play;

    TObject(PauseButton.GetObject):
      TypedText.Stop;

    TObject(RestartButton.GetObject):
      begin
        TypedText.Reset;
        TypedText.Play;
      end;

    TObject(AddLineButton.GetObject):
      begin
        TypedText.AddLine('Новая строка добавлена во время работы.');
        TypedText.Play;
      end;
  end;
end;

procedure FMXDesigning;
begin
  FMXForm.FCreateBackdropForm(WizardForm.Handle, btAcrylic, True, True);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('ChangeAccentColor.style'), ALCoral);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  TitleBar.FCreate(FormLayer.Handle, True);
  TitleBar.SetColor($80172235);
  TitleBar.CloseBtnOnClick(@TitleBarCloseClick);

  HeaderLabel.FCreate(FormLayer.Handle);
  HeaderLabel.SetBounds(28, 66, 620, 34);
  HeaderLabel.Text('TYPEWRITER EFFECT');
  HeaderLabel.FontSetting('Segoe UI Variable Display', 22, $FFF4F7FC);
  HeaderLabel.TextSetting(False, txLeading, txCenter);

  TypedText.FCreate(FormLayer.Handle);
  TypedText.SetBounds(30, 125, 610, 235);
  TypedText.AutoSize(False);
  TypedText.TextSetting(True, txLeading, txLeading);
  TypedText.FontSetting('Consolas', 17, $FFB7D4F5);
  TypedText.Interval(38);
  TypedText.Text(
    'Эффект печатной машинки.'#13#10 +
    'Текст появляется последовательно, символ за символом.'#13#10 +
    'Переносы строк и кириллица сохраняются.'
  );

  PlayButton.FCreate(FormLayer.Handle);
  PlayButton.SetBounds(28, 397, 124, 34);
  PlayButton.Text('PLAY / RESUME');
  PlayButton.StyleLookUp('buttonstyle_accent');
  PlayButton.OnClick(@ControlButtonClick);

  PauseButton.FCreate(FormLayer.Handle);
  PauseButton.SetBounds(162, 397, 90, 34);
  PauseButton.Text('PAUSE');
  PauseButton.StyleLookUp('buttonstyle_accent');
  PauseButton.OnClick(@ControlButtonClick);

  RestartButton.FCreate(FormLayer.Handle);
  RestartButton.SetBounds(262, 397, 100, 34);
  RestartButton.Text('RESTART');
  RestartButton.StyleLookUp('buttonstyle_accent');
  RestartButton.OnClick(@ControlButtonClick);

  AddLineButton.FCreate(FormLayer.Handle);
  AddLineButton.SetBounds(372, 397, 140, 34);
  AddLineButton.Text('ADD LINE');
  AddLineButton.StyleLookUp('buttonstyle_accent');
  AddLineButton.OnClick(@ControlButtonClick);
end;

procedure InitializeWizard();
begin
  EmptyWizardForm(680, 470);
  FMXDesigning;
  FMXForm.Show;

  TypedText.Play;
end;
