#define FontFile "Orbitron-Regular.ttf"

[Setup]
AppId=FMXBridge_NOVA_InstallLocation_CursorGlow
AppName=NOVA Setup Demo
AppVersion=1.1
CreateAppDir=no
Uninstallable=no
SetupIconFile=Files\setup.ico
//SetupArchitecture=x64
//Compression=zip

[Files]
#if SetupSetting("SetupArchitecture") == "x64"
  Source: "Modules\sk4d_x64.dll";      DestName: "sk4d.dll";      Flags: dontcopy
  Source: "Modules\FMXBridge_x64.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#else
  Source: "Modules\sk4d_x86.dll";      DestName: "sk4d.dll";      Flags: dontcopy
  Source: "Modules\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
#endif

Source: "Files\Fonts\{#FontFile}"; Flags: dontcopy
Source: "Files\setup.ico"; Flags: dontcopy

[Code]
#include "Modules\FMXBridgeHandle.iss"
#include "Modules\FMXSkiaHandle.iss"

const
  FORM_WIDTH       = 960;
  FORM_HEIGHT      = 660;
  BORDER_WIDTH     = 3.0;

  BROWSE_LEFT      = 780.0;
  BROWSE_TOP       = 414.0;
  BROWSE_WIDTH     = 120.0;
  BROWSE_HEIGHT    = 64.0;

  CONTINUE_LEFT    = 700.0;
  CONTINUE_TOP     = 536.0;
  CONTINUE_WIDTH   = 200.0;
  CONTINUE_HEIGHT  = 68.0;

  CLOSE_LEFT       = 856.0;
  CLOSE_TOP        = 68.0;
  CLOSE_WIDTH      = 52.0;
  CLOSE_HEIGHT     = 52.0;

var
  FMXForm             : FForm;
  FormLayer           : FLayout;
  WindowSurface       : FRectangle;
  SceneCanvas         : FSkPaintBox;
  TitleCanvas         : FSkPaintBox;
  MouseArea           : FText;

  Typeface            : FSkTypeface;
  BrandFont           : FSkFont;
  HeadingFont         : FSkFont;
  BodyFont            : FSkFont;
  SmallFont           : FSkFont;
  ButtonFont          : FSkFont;
  CloseFont           : FSkFont;

  OuterFramePaint     : FSkPaint;
  InnerFramePaint     : FSkPaint;
  PanelFillPaint      : FSkPaint;
  PanelFramePaint     : FSkPaint;
  InputFillPaint      : FSkPaint;
  InputFramePaint     : FSkPaint;
  BrowseFillPaint     : FSkPaint;
  BrowseFramePaint    : FSkPaint;
  ContinueFillPaint   : FSkPaint;
  ContinueFramePaint  : FSkPaint;
  CloseFillPaint      : FSkPaint;
  CloseFramePaint     : FSkPaint;
  AccentPaint         : FSkPaint;
  DividerPaint        : FSkPaint;
  MainTextPaint       : FSkPaint;
  MutedTextPaint      : FSkPaint;
  ButtonTextPaint     : FSkPaint;
  StatusTextPaint     : FSkPaint;

  TitleShadowPaint    : FSkPaint;
  TitleAmbientGlowPaint : FSkPaint;
  TitleCoreGlowPaint  : FSkPaint;
  TitleGlowPaint      : FSkPaint;
  TitleTextPaint      : FSkPaint;
  CursorShader        : FSkShader;

  SelectedPath        : String;
  CursorX             : Single;
  CursorY             : Single;
  CursorInside        : Boolean;
  BrowseHover         : Boolean;
  ContinueHover       : Boolean;
  BrowsePressed       : Boolean;
  ContinuePressed     : Boolean;
  CloseHover          : Boolean;
  ClosePressed        : Boolean;

function PostMessageWindow(Wnd: HWND; Msg: Cardinal;
  WParam, LParam: NativeInt): Integer;
  external 'PostMessageW@user32.dll stdcall';

procedure FMXInit;
begin
  FMXForm            := InitFormHandle;
  FormLayer          := InitLayoutHandle;
  WindowSurface      := InitRectangleHandle;
  SceneCanvas        := InitSkPaintBox;
  TitleCanvas        := InitSkPaintBox;
  MouseArea          := InitTextHandle;

  Typeface           := InitSkTypeface;
  BrandFont          := InitSkFont;
  HeadingFont        := InitSkFont;
  BodyFont           := InitSkFont;
  SmallFont          := InitSkFont;
  ButtonFont         := InitSkFont;
  CloseFont          := InitSkFont;

  OuterFramePaint    := InitSkPaint;
  InnerFramePaint    := InitSkPaint;
  PanelFillPaint     := InitSkPaint;
  PanelFramePaint    := InitSkPaint;
  InputFillPaint     := InitSkPaint;
  InputFramePaint    := InitSkPaint;
  BrowseFillPaint    := InitSkPaint;
  BrowseFramePaint   := InitSkPaint;
  ContinueFillPaint  := InitSkPaint;
  ContinueFramePaint := InitSkPaint;
  CloseFillPaint     := InitSkPaint;
  CloseFramePaint    := InitSkPaint;
  AccentPaint        := InitSkPaint;
  DividerPaint       := InitSkPaint;
  MainTextPaint      := InitSkPaint;
  MutedTextPaint     := InitSkPaint;
  ButtonTextPaint    := InitSkPaint;
  StatusTextPaint    := InitSkPaint;

  TitleShadowPaint   := InitSkPaint;
  TitleAmbientGlowPaint := InitSkPaint;
  TitleCoreGlowPaint := InitSkPaint;
  TitleGlowPaint     := InitSkPaint;
  TitleTextPaint     := InitSkPaint;
  CursorShader       := InitSkShader;
end;

function PointInRect(X, Y, L, T, W, H: Single): Boolean;
begin
  Result := (X >= L) and (X <= L + W) and
            (Y >= T) and (Y <= T + H);
end;

function PointInBrowse(X, Y: Single): Boolean;
begin
  Result := PointInRect(X, Y, BROWSE_LEFT, BROWSE_TOP,
    BROWSE_WIDTH, BROWSE_HEIGHT);
end;

function PointInContinue(X, Y: Single): Boolean;
begin
  Result := PointInRect(X, Y, CONTINUE_LEFT, CONTINUE_TOP,
    CONTINUE_WIDTH, CONTINUE_HEIGHT);
end;

function PointInClose(X, Y: Single): Boolean;
begin
  Result := PointInRect(X, Y, CLOSE_LEFT, CLOSE_TOP,
    CLOSE_WIDTH, CLOSE_HEIGHT);
end;

procedure UpdateButtonVisuals;
begin
  if BrowsePressed then
    BrowseFillPaint.Color($FF6B2942)
  else if BrowseHover then
    BrowseFillPaint.Color($FF30202B)
  else
    BrowseFillPaint.Color($FF171D28);

  if ContinuePressed then
    ContinueFillPaint.Color($FFB92B50)
  else if ContinueHover then
    ContinueFillPaint.Color($FF76243D)
  else
    ContinueFillPaint.Color($FF4A1D31);

  if ClosePressed then
  begin
    CloseFillPaint.Color($FFB52B4C);
    CloseFramePaint.Color($FFFFA5B8);
  end
  else if CloseHover then
  begin
    CloseFillPaint.Color($FF47202F);
    CloseFramePaint.Color($FFFF5276);
  end
  else
  begin
    CloseFillPaint.Color($FF141B27);
    CloseFramePaint.Color($FF586273);
  end;

  SceneCanvas.DoDrawing;
end;

procedure DrawScene;
begin
  SceneCanvas.ClearCommands;
  TitleCanvas.ClearCommands;

  // Main frame and inset frame. Every outline uses exactly 3 px.
  SceneCanvas.AddDrawRoundRect(12, 12, 936, 636, 34, 34,
    OuterFramePaint.Handle);
  SceneCanvas.AddDrawRoundRect(27, 27, 906, 606, 27, 27,
    InnerFramePaint.Handle);

  // Header marker and small status label.
  SceneCanvas.AddDrawRoundRect(76, 76, 46, 46, 13, 13,
    PanelFillPaint.Handle);
  SceneCanvas.AddDrawRoundRect(76, 76, 46, 46, 13, 13,
    PanelFramePaint.Handle);
  SceneCanvas.AddDrawCircle(99, 99, 6, AccentPaint.Handle);
  SceneCanvas.AddDrawSimpleText('SETUP  /  01', 140, 106,
    SmallFont.Handle, StatusTextPaint.Handle);

  // Top-right close control: a real hit target with hover/pressed feedback.
  SceneCanvas.AddDrawRoundRect(CLOSE_LEFT, CLOSE_TOP,
    CLOSE_WIDTH, CLOSE_HEIGHT, 14, 14, CloseFillPaint.Handle);
  SceneCanvas.AddDrawRoundRect(CLOSE_LEFT, CLOSE_TOP,
    CLOSE_WIDTH, CLOSE_HEIGHT, 14, 14, CloseFramePaint.Handle);
  SceneCanvas.AddDrawSimpleText('×', 873, 104,
    CloseFont.Handle, ButtonTextPaint.Handle);

  // Brand title. The middle pass is an outer blur; the cursor shader
  // lights that blurred silhouette rather than only the glyph fill.
  TitleCanvas.AddDrawSimpleText('NOVA', 78, 221,
    BrandFont.Handle, TitleShadowPaint.Handle);
  TitleCanvas.AddDrawSimpleText('NOVA', 76, 218,
    BrandFont.Handle, TitleAmbientGlowPaint.Handle);
  TitleCanvas.AddDrawSimpleText('NOVA', 76, 218,
    BrandFont.Handle, TitleCoreGlowPaint.Handle);
  TitleCanvas.AddDrawSimpleText('NOVA', 76, 218,
    BrandFont.Handle, TitleGlowPaint.Handle);
  TitleCanvas.AddDrawSimpleText('NOVA', 76, 218,
    BrandFont.Handle, TitleTextPaint.Handle);

  SceneCanvas.AddDrawSimpleText('CHOOSE INSTALLATION LOCATION', 80, 286,
    HeadingFont.Handle, MainTextPaint.Handle);
  SceneCanvas.AddDrawSimpleText(
    'Select the folder where NOVA will be installed.', 82, 324,
    BodyFont.Handle, MutedTextPaint.Handle);

  // The path field and Browse button have 3 px outlines.
  SceneCanvas.AddDrawRoundRect(80, 414, 680, 64, 13, 13,
    InputFillPaint.Handle);
  SceneCanvas.AddDrawRoundRect(80, 414, 680, 64, 13, 13,
    InputFramePaint.Handle);
  SceneCanvas.AddDrawSimpleText(SelectedPath, 104, 453,
    BodyFont.Handle, MainTextPaint.Handle);

  SceneCanvas.AddDrawRoundRect(BROWSE_LEFT, BROWSE_TOP,
    BROWSE_WIDTH, BROWSE_HEIGHT, 13, 13, BrowseFillPaint.Handle);
  SceneCanvas.AddDrawRoundRect(BROWSE_LEFT, BROWSE_TOP,
    BROWSE_WIDTH, BROWSE_HEIGHT, 13, 13, BrowseFramePaint.Handle);
  SceneCanvas.AddDrawSimpleText('BROWSE', 803, 453,
    ButtonFont.Handle, ButtonTextPaint.Handle);

  // Thick divider is also 3 px, not a hairline.
  SceneCanvas.AddDrawRoundRect(80, 508, 820, 3, 1.5, 1.5,
    DividerPaint.Handle);

  SceneCanvas.AddDrawSimpleText('The selected folder can be changed later.',
    82, 551, SmallFont.Handle, MutedTextPaint.Handle);

  SceneCanvas.AddDrawRoundRect(CONTINUE_LEFT, CONTINUE_TOP,
    CONTINUE_WIDTH, CONTINUE_HEIGHT, 15, 15, ContinueFillPaint.Handle);
  SceneCanvas.AddDrawRoundRect(CONTINUE_LEFT, CONTINUE_TOP,
    CONTINUE_WIDTH, CONTINUE_HEIGHT, 15, 15, ContinueFramePaint.Handle);
  SceneCanvas.AddDrawSimpleText('CONTINUE', 748, 579,
    ButtonFont.Handle, ButtonTextPaint.Handle);

  SceneCanvas.AddDrawSimpleText('NOVA  /  INSTALLER PREVIEW', 80, 606,
    SmallFont.Handle, StatusTextPaint.Handle);
  SceneCanvas.AddDrawSimpleText('SKIA CURSOR LIGHT  •  3 PX BORDERS', 617, 606,
    SmallFont.Handle, StatusTextPaint.Handle);

  SceneCanvas.DoDrawing;
  TitleCanvas.DoDrawing;
end;

procedure UpdateCursorGlow;
var
  X, Y: Single;
begin
  if CursorInside then
  begin
    X := CursorX;
    Y := CursorY;
  end
  else
  begin
    X := -1000;
    Y := -1000;
  end;

  CursorShader.MakeGradientRadial(X, Y, 180,
    $E6FF315B, $00FF315B, sktmClamp);

  // SceneCanvas applies the light pass to every supported draw command:
  // text, rectangles, rounded rectangles, circles, lines and paths.
  SceneCanvas.SetCursorLightShader(CursorShader.Handle);

  // Only the outer-blurred NOVA silhouette receives the moving shader.
  TitleGlowPaint.Shader(CursorShader.Handle);
  TitleCanvas.DoDrawing;
end;

procedure UpdatePointerState(X, Y: Single);
begin
  BrowseHover := PointInBrowse(X, Y);
  ContinueHover := PointInContinue(X, Y);
  CloseHover := PointInClose(X, Y);
  UpdateButtonVisuals;
end;

procedure MouseAreaMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  CursorX := X;
  CursorY := Y;
  CursorInside := True;
  UpdateCursorGlow;
  UpdatePointerState(X, Y);
end;

procedure MouseAreaLeave(Sender: TObject);
begin
  CursorInside := False;
  BrowseHover := False;
  ContinueHover := False;
  CloseHover := False;
  BrowsePressed := False;
  ContinuePressed := False;
  ClosePressed := False;
  UpdateCursorGlow;
  UpdateButtonVisuals;
end;

procedure MouseAreaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if Button <> mbLeft then
    Exit;

  if PointInClose(X, Y) then
  begin
    ClosePressed := True;
    UpdateButtonVisuals;
    Exit;
  end;

  if PointInBrowse(X, Y) then
  begin
    BrowsePressed := True;
    UpdateButtonVisuals;
    Exit;
  end;

  if PointInContinue(X, Y) then
  begin
    ContinuePressed := True;
    UpdateButtonVisuals;
    Exit;
  end;

  // The top strip is the drag surface. FForm.StartWindowDrag is the
  // FMXBridge wrapper method; no custom WinAPI drag loop is required.
  if Y <= 132 then
    FMXForm.StartWindowDrag;
end;

procedure MouseAreaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  DoBrowse, DoContinue, DoClose: Boolean;
  NewPath: String;
begin
  if Button <> mbLeft then
    Exit;

  DoBrowse := BrowsePressed and PointInBrowse(X, Y);
  DoContinue := ContinuePressed and PointInContinue(X, Y);
  DoClose := ClosePressed and PointInClose(X, Y);

  BrowsePressed := False;
  ContinuePressed := False;
  ClosePressed := False;
  BrowseHover := PointInBrowse(X, Y);
  ContinueHover := PointInContinue(X, Y);
  CloseHover := PointInClose(X, Y);
  UpdateButtonVisuals;

  if DoClose then
  begin
    // FMXBridge's form OnClose forwards WM_CLOSE to the hidden Inno host.
    PostMessageWindow(FMXForm.HandleHWND, $0010, 0, 0);
    Exit;
  end;

  if DoBrowse then
  begin
    NewPath := SelectedPath;
    if BrowseForFolder('Choose the NOVA installation folder', NewPath, True) then
    begin
      SelectedPath := NewPath;
      DrawScene;
    end;
  end
  else if DoContinue then
  begin
    MsgBox('NOVA setup demo' + #13#10 + #13#10 +
      'Selected destination:' + #13#10 + SelectedPath,
      mbInformation, MB_OK);
  end;
end;

procedure FMXDesigning;
begin
  // Borderless, per-pixel transparent FMX form. The rounded silhouette is
  // drawn by a normal FMX TRectangle, not by a coarse Win32 window region.
  FMXForm.FCreateImageForm(WizardForm.Handle, 0, '', True);

  FormLayer.FCreate(FMXForm.Handle);
  FormLayer.Align(Client);

  WindowSurface.FCreate(FormLayer.Handle);
  WindowSurface.SetBounds(0, 0, FORM_WIDTH, FORM_HEIGHT);
  WindowSurface.FillColor($FF0B0F17);
  WindowSurface.CornerStyle(38, 38, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  WindowSurface.HitTest(False);
  WindowSurface.SendToBack;

  SceneCanvas.FCreate(FormLayer.Handle);
  SceneCanvas.Align(Client);
  SceneCanvas.HitTest(False);

  TitleCanvas.FCreate(FormLayer.Handle);
  TitleCanvas.Align(Client);
  TitleCanvas.HitTest(False);

  Typeface.FCreateFromFile(ExtractAndLoad('{#FontFile}'), 0);

  BrandFont.FCreate(Typeface.Handle, 70);
  BrandFont.Edging(skfeAntiAlias);
  BrandFont.Hinting(skfhNormal);
  BrandFont.Subpixel(True);

  HeadingFont.FCreate(0, 25);
  HeadingFont.Edging(skfeAntiAlias);
  HeadingFont.Hinting(skfhNormal);

  BodyFont.FCreate(0, 16);
  BodyFont.Edging(skfeAntiAlias);
  BodyFont.Hinting(skfhNormal);

  SmallFont.FCreate(0, 11);
  SmallFont.Edging(skfeAntiAlias);
  SmallFont.Hinting(skfhNormal);

  ButtonFont.FCreate(0, 15);
  ButtonFont.Edging(skfeAntiAlias);
  ButtonFont.Hinting(skfhNormal);

  CloseFont.FCreate(0, 29);
  CloseFont.Edging(skfeAntiAlias);
  CloseFont.Hinting(skfhNormal);

  OuterFramePaint.FCreate2(skpsStroke);
  OuterFramePaint.AntiAlias(True);
  OuterFramePaint.Color($FF586273);
  OuterFramePaint.StrokeWidth(BORDER_WIDTH);

  InnerFramePaint.FCreate2(skpsStroke);
  InnerFramePaint.AntiAlias(True);
  InnerFramePaint.Color($FF303A49);
  InnerFramePaint.StrokeWidth(BORDER_WIDTH);

  PanelFillPaint.FCreate;
  PanelFillPaint.AntiAlias(True);
  PanelFillPaint.Color($FF141B27);

  PanelFramePaint.FCreate2(skpsStroke);
  PanelFramePaint.AntiAlias(True);
  PanelFramePaint.Color($FF485365);
  PanelFramePaint.StrokeWidth(BORDER_WIDTH);

  InputFillPaint.FCreate;
  InputFillPaint.AntiAlias(True);
  InputFillPaint.Color($FF121924);

  InputFramePaint.FCreate2(skpsStroke);
  InputFramePaint.AntiAlias(True);
  InputFramePaint.Color($FF68758A);
  InputFramePaint.StrokeWidth(BORDER_WIDTH);

  BrowseFillPaint.FCreate;
  BrowseFillPaint.AntiAlias(True);
  BrowseFillPaint.Color($FF171D28);

  BrowseFramePaint.FCreate2(skpsStroke);
  BrowseFramePaint.AntiAlias(True);
  BrowseFramePaint.Color($FF8793A5);
  BrowseFramePaint.StrokeWidth(BORDER_WIDTH);

  ContinueFillPaint.FCreate;
  ContinueFillPaint.AntiAlias(True);
  ContinueFillPaint.Color($FF4A1D31);

  ContinueFramePaint.FCreate2(skpsStroke);
  ContinueFramePaint.AntiAlias(True);
  ContinueFramePaint.Color($FFFF5276);
  ContinueFramePaint.StrokeWidth(BORDER_WIDTH);

  CloseFillPaint.FCreate;
  CloseFillPaint.AntiAlias(True);
  CloseFillPaint.Color($FF141B27);

  CloseFramePaint.FCreate2(skpsStroke);
  CloseFramePaint.AntiAlias(True);
  CloseFramePaint.Color($FF586273);
  CloseFramePaint.StrokeWidth(BORDER_WIDTH);

  AccentPaint.FCreate;
  AccentPaint.AntiAlias(True);
  AccentPaint.Color($FFFF5276);

  DividerPaint.FCreate;
  DividerPaint.AntiAlias(True);
  DividerPaint.Color($FF394556);

  MainTextPaint.FCreate;
  MainTextPaint.AntiAlias(True);
  MainTextPaint.Color($FFF1F4FA);

  MutedTextPaint.FCreate;
  MutedTextPaint.AntiAlias(True);
  MutedTextPaint.Color($FFA2ADBD);

  ButtonTextPaint.FCreate;
  ButtonTextPaint.AntiAlias(True);
  ButtonTextPaint.Color($FFFFFFFF);

  StatusTextPaint.FCreate;
  StatusTextPaint.AntiAlias(True);
  StatusTextPaint.Color($FF8995A6);

  TitleShadowPaint.FCreate;
  TitleShadowPaint.AntiAlias(True);
  TitleShadowPaint.Color($A8000000);
  TitleShadowPaint.MaskFilter(skbsOuter, 10);

  // A persistent pink outer halo makes NOVA glow even when the pointer is
  // elsewhere. A tighter second bloom adds intensity around the letter edges.
  TitleAmbientGlowPaint.FCreate;
  TitleAmbientGlowPaint.AntiAlias(True);
  TitleAmbientGlowPaint.Color($DFFF315B);
  TitleAmbientGlowPaint.MaskFilter(skbsOuter, 25);

  TitleCoreGlowPaint.FCreate;
  TitleCoreGlowPaint.AntiAlias(True);
  TitleCoreGlowPaint.Color($DFFF6685);
  TitleCoreGlowPaint.MaskFilter(skbsOuter, 10);

  TitleGlowPaint.FCreate;
  TitleGlowPaint.AntiAlias(True);
  TitleGlowPaint.Color($FFFFFFFF);
  TitleGlowPaint.MaskFilter(skbsOuter, 18);

  TitleTextPaint.FCreate;
  TitleTextPaint.AntiAlias(True);
  TitleTextPaint.Color($FFF9FAFF);

  SelectedPath := ExpandConstant('{autopf}\NOVA');
  CursorX := -1000;
  CursorY := -1000;
  CursorInside := False;
  BrowseHover := False;
  ContinueHover := False;
  BrowsePressed := False;
  ContinuePressed := False;
  CloseHover := False;
  ClosePressed := False;

  DrawScene;
  CursorShader.MakeGradientRadial(-1000, -1000, 180,
    $E6FF315B, $00FF315B, sktmClamp);
  SceneCanvas.SetCursorLightShader(CursorShader.Handle);
  TitleGlowPaint.Shader(CursorShader.Handle);

  // One transparent FMX surface routes mouse movement and button presses.
  // The visible page itself (text, frames, controls) remains Skia-drawn.
  MouseArea.FCreate(FormLayer.Handle);
  MouseArea.SetBounds(0, 0, FORM_WIDTH, FORM_HEIGHT);
  MouseArea.Text(' ');
  MouseArea.FontSetting('Segoe UI', 1, $00000000);
  MouseArea.TextSetting(False, txLeading, txLeading);
  MouseArea.HitTest(True);
  MouseArea.OnMouseMove(@MouseAreaMove);
  MouseArea.OnMouseLeave(@MouseAreaLeave);
  MouseArea.OnMouseDown(@MouseAreaMouseDown);
  MouseArea.OnMouseUp(@MouseAreaMouseUp);
  MouseArea.BringToFront;
end;

procedure InitializeWizard;
begin
  FMXInit;
  EmptyWizardForm(FORM_WIDTH, FORM_HEIGHT);
  FMXDesigning;
  FMXForm.Show;
end;

procedure DeinitializeSetup;
begin
  FMXBridgeShutDown;
end;
