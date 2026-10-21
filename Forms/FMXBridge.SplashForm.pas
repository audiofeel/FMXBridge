
unit FMXBridge.SplashForm;

interface

uses
  Winapi.Windows,
  System.UITypes,
  FMX.Forms, FMX.Types, FMX.Layouts, FMX.Objects, FMXBridge.AudioWave;

// =============================================================================
// FSplashForm
// =============================================================================
type
  FSplashForm = interface(IUnknown)
    ['{DC82CE70-46BF-44F7-8137-2C1D6D45444F}']
    procedure FCreateSplashForm(const FImageFile, FSoundFile: WideString;
      FDuration: Single); stdcall;
    procedure Border(FValue: Boolean); stdcall;
    procedure BorderSetting(FRound: Boolean; FColor: TAlphaColor); stdcall;
    procedure Show; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSplashForm = class(TInterfacedObject, FSplashForm)
  private
    Player: TWavePlayer;
    FormSplash: TForm;
    FormSplashHWND: HWND;
    Overlay: TLayout;
    FSoundFileStored: string;
    FImage: TRectangle;
    FadeDuration: Single;

    procedure FormOnShow(Sender: TObject);
    procedure OnFadeOutFinish(Sender: TObject);
    procedure PlaySoundFromFile(const FileName: WideString);
    procedure StopSoundFromFile;
  public
    procedure FCreateSplashForm(const FImageFile, FSoundFile: WideString;
      FDuration: Single); stdcall;
    procedure Border(FValue: Boolean); stdcall;
    procedure BorderSetting(FRound: Boolean; FColor: TAlphaColor); stdcall;
    procedure Show; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitSplashFormHandle: FSplashForm; stdcall;

implementation

uses
  System.SysUtils,
  FMX.Platform.Win, FMX.Graphics, FMX.Ani, FMXBridge.WinUtils;

// =============================================================================
// FSplashForm
// =============================================================================
procedure TFSplashForm.FCreateSplashForm(const FImageFile,
  FSoundFile: WideString; FDuration: Single);
begin
  FormSplash := TForm.CreateNew(Application);
  FormSplash.BorderStyle := TFmxFormBorderStyle.None;
  FormSplash.Transparency := True;
  FormSplash.BringToFront;

  Overlay := TLayout.Create(FormSplash);
  Overlay.Parent := FormSplash;
  Overlay.Align := TAlignLayout.Client;
  Overlay.Opacity := 0;

  FImage := TRectangle.Create(Overlay);
  FImage.Parent := Overlay;
  FImage.Align := TAlignLayout.Client;
  FImage.Stroke.Thickness := 0;
  FImage.Fill.Kind := TBrushKind.Bitmap;
  FImage.Fill.Bitmap.WrapMode := TWrapMode.TileOriginal;

  if (FImageFile <> '') and FileExists(string(FImageFile)) then
    FImage.Fill.Bitmap.Bitmap.LoadFromFile(string(FImageFile));

  FormSplash.Height := FImage.Fill.Bitmap.Bitmap.Size.Height;
  FormSplash.Width := FImage.Fill.Bitmap.Bitmap.Size.Width;
  FormSplash.Position := TFormPosition.ScreenCenter;

  FormSplash.HandleNeeded;
  FormSplashHWND := WindowHandleToPlatform(FormSplash.Handle).Wnd;

  ConfigureSplashForm(FormSplashHWND);

  FSoundFileStored := string(FSoundFile);

  FadeDuration := FDuration;
  FormSplash.OnShow := FormOnShow;
end;

procedure TFSplashForm.PlaySoundFromFile(const FileName: WideString);
begin
  if (FileName = '') or not FileExists(FileName) then
    Exit;

  Player := TWavePlayer.Create;
  Player.LoadFromFile(string(FileName));
  Player.Play;
end;

procedure TFSplashForm.StopSoundFromFile;
begin
  if Assigned(Player) then
  begin
    Player.Stop;
    Player.Unload;
    FreeAndNil(Player);
  end;
end;

procedure TFSplashForm.OnFadeOutFinish(Sender: TObject);
begin
  StopSoundFromFile;

  FormSplash.Close;
end;

procedure TFSplashForm.FormOnShow(Sender: TObject);
var
  FadeIn, FadeOut: TFloatAnimation;
  FadeSec: Single;
begin
  PlaySoundFromFile(FSoundFileStored);

  FadeSec := 0.28;
  Overlay.Opacity := 0;

  FadeIn := TFloatAnimation.Create(Overlay);
  FadeIn.Parent := Overlay;
  FadeIn.PropertyName := 'Opacity';
  FadeIn.StartValue := 0;
  FadeIn.StopValue := 1;
  FadeIn.Duration := FadeSec;

  FadeOut := TFloatAnimation.Create(Overlay);
  FadeOut.Parent := Overlay;
  FadeOut.PropertyName := 'Opacity';
  FadeOut.StartValue := 1;
  FadeOut.StopValue := 0;
  FadeOut.Duration := FadeSec;
  FadeOut.Delay := FadeSec + FadeDuration + 0.2;
  FadeOut.OnFinish := OnFadeOutFinish;

  FadeIn.Start;
  FadeOut.Start;
end;

procedure TFSplashForm.Border(FValue: Boolean);
begin
  if FValue then
  begin
    FImage.Stroke.Kind := TBrushKind.Solid;
    FImage.Stroke.Thickness := 1;
  end;
end;

procedure TFSplashForm.BorderSetting(FRound: Boolean; FColor: TAlphaColor);
begin
  if FRound then
  begin
    FImage.CornerType := TCornerType.Round;
    FImage.XRadius := 8;
    FImage.YRadius := 8;
  end
  else
    FImage.CornerType := TCornerType.Bevel;

  if FColor <> 0 then
    FImage.Stroke.Color := TAlphaColor(FColor)
  else
    FImage.Stroke.Color := TAlphaColor($80777777);

  FImage.Stroke.Kind := TBrushKind.Solid;
end;

procedure TFSplashForm.Show;
begin
  if Assigned(FormSplash) then
    try
      FormSplash.ShowModal;
    finally
      FreeAndNil(FormSplash);
    end;
end;

function TFSplashForm.Handle: TFmxObject;
begin
  Result := Overlay;
end;

// =============================================================================
// Exports
// =============================================================================
function InitSplashFormHandle: FSplashForm;
begin
  Result := TFSplashForm.Create;
end;

exports
  InitSplashFormHandle;

end.
