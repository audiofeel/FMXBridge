
unit FMXBridge.TitleBar;

interface

uses
  System.Classes, System.UITypes,
  Winapi.Messages, Winapi.Windows,
  FMX.Graphics, FMX.Layouts, FMX.Objects, FMX.Types,
  FMXBridge.TitleBar.Win, FMX.Forms;

// =============================================================================
// CaptionButton
// =============================================================================
type
  TCaptionButtonKind = (cbMinimize, cbMaximize, cbClose);

  TCaptionButtonState = (cbsNormal, cbsHovered, cbsPressed, cbsInactive);

  TFMXCaptionButton = class(TRectangle)
  private
    FGlyph: TText;
    FKind: TCaptionButtonKind;
    FState: TCaptionButtonState;

    FNormalColor: TAlphaColor;
    FHoverColor: TAlphaColor;
    FPressedColor: TAlphaColor;
    FInactiveColor: TAlphaColor;
    FGlyphColor: TAlphaColor;
    FCloseHoverColor: TAlphaColor;
    FClosePressedColor: TAlphaColor;

    FActive: Boolean;
    FMouseOver: Boolean;
    FPressed: Boolean;
    FDark: Boolean;

    procedure UpdateGlyph;
    procedure UpdateState;

    procedure MouseEnterHandler(Sender: TObject);
    procedure MouseLeaveHandler(Sender: TObject);
    procedure MouseDownHandler(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure MouseUpHandler(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);

    procedure SetNormalColor(const AValue: TAlphaColor);
    procedure SetHoverColor(const AValue: TAlphaColor);
    procedure SetPressedColor(const AValue: TAlphaColor);
    procedure SetInactiveColor(const AValue: TAlphaColor);
    procedure SetGlyphColor(const AValue: TAlphaColor);
    procedure SetCloseHoverColor(const AValue: TAlphaColor);
    procedure SetClosePressedColor(const AValue: TAlphaColor);
  public
    constructor Create(AOwner: TComponent); override;

    procedure SetActive(AValue: Boolean);
    procedure SetDarkTheme(AValue: Boolean);
    procedure SetState(const AState: TCaptionButtonState);
    procedure SetKind(const AKind: TCaptionButtonKind);

    property Glyph: TText read FGlyph;
    property Kind: TCaptionButtonKind read FKind write SetKind;
    property State: TCaptionButtonState read FState write SetState;
    property NormalColor: TAlphaColor read FNormalColor write SetNormalColor;
    property HoverColor: TAlphaColor read FHoverColor write SetHoverColor;
    property PressedColor: TAlphaColor read FPressedColor write SetPressedColor;
    property InactiveColor: TAlphaColor read FInactiveColor
      write SetInactiveColor;
    property GlyphColor: TAlphaColor read FGlyphColor write SetGlyphColor;
    property CloseHoverColor: TAlphaColor read FCloseHoverColor
      write SetCloseHoverColor;
    property ClosePressedColor: TAlphaColor read FClosePressedColor
      write SetClosePressedColor;
    property Active: Boolean read FActive write SetActive;
    property Dark: Boolean read FDark;
  end;

// =============================================================================
// Title bar
// =============================================================================
  TFMXCustomTitleBar = class(TLayout)
  private
    FBackground: TRectangle;

    FIcon: TImage;
    FCaption: TText;

    FMinimizeButton: TFMXCaptionButton;
    FMaximizeButton: TFMXCaptionButton;
    FCloseButton: TFMXCaptionButton;

    FTitleBarHeight: Single;
    FCaptionLeft: Single;
    FIconSize: Single;
    FLeftInset: Single;

    FDark: Boolean;

    FHostForm: TCommonCustomForm;
    FCaptionMetrics: TCaptionButtonMetrics;

    procedure ResizeLayout(Sender: TObject);

    procedure UpdateCaptionMetrics;
    procedure UpdateWindowIdentity;

    function FindHostForm: TCommonCustomForm;

    procedure MinimizeButtonClick(Sender: TObject);
    procedure MaximizeButtonClick(Sender: TObject);
    procedure TitleBarDblClick(Sender: TObject);

    procedure TitleBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  public
    constructor Create(AOwner: TComponent); override;

    procedure SetHostForm(AForm: TCommonCustomForm);
    procedure UpdateLayout;
    procedure SetColor(const AColor: TAlphaColor);
    procedure ChangeTheme(const ADark: Boolean);
    procedure SetMaximized(const AValue: Boolean);
    procedure SetActive(const AValue: Boolean);

    procedure CloseButtonEnabled(AValue: Boolean);
    procedure CloseButtonClick(Event: TNotifyEvent);

    property Background: TRectangle read FBackground;
    property Icon: TImage read FIcon;
    property CaptionText: TText read FCaption;
    property MinimizeButton: TFMXCaptionButton read FMinimizeButton;
    property MaximizeButton: TFMXCaptionButton read FMaximizeButton;
    property CloseButton: TFMXCaptionButton read FCloseButton;
    property TitleBarHeight: Single read FTitleBarHeight write FTitleBarHeight;
    property Dark: Boolean read FDark;
  end;

// =============================================================================
// Interface
// =============================================================================
type
  FWinTitleBar = interface(IUnknown)
    ['{31E29020-AF92-4FDB-9067-B8C573804370}']
    procedure FCreate(FParent: TFmxObject; Dark: Boolean); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Offset(PY: Single); stdcall;
    procedure SetColor(FColor: TAlphaColor); stdcall;
    procedure ChangeDarkMode(const Dark: Boolean); stdcall;
    procedure CloseBtnEnabled(FValue: Boolean); stdcall;
    function GetHeight: Single; stdcall;
    function GetObjectCloseBtn: TFmxObject; stdcall;
    procedure CloseBtnOnClick(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFWinTitleBar = class(TInterfacedObject, FWinTitleBar)
  private
    FTitleBar: TFMXCustomTitleBar;
    FDark: Boolean;
  public
    procedure FCreate(FParent: TFmxObject; Dark: Boolean); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Offset(PY: Single); stdcall;
    procedure SetColor(FColor: TAlphaColor); stdcall;
    procedure ChangeDarkMode(const Dark: Boolean); stdcall;
    procedure CloseBtnEnabled(FValue: Boolean); stdcall;
    function GetHeight: Single; stdcall;
    function GetObjectCloseBtn: TFmxObject; stdcall;
    procedure CloseBtnOnClick(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// Export
// =============================================================================
function InitWinTitleBarHandle: FWinTitleBar; stdcall;

implementation

uses
  System.SysUtils,
  FMX.Platform.Win, FMXBridge.WinBitmaps;

const
  GCLP_HICON_LOCAL = -14;
  GCLP_HICONSM_LOCAL = -34;

function GetWindowIcon(const AWnd: HWND): HICON;
begin
  Result := 0;

  if AWnd = 0 then
    Exit;

  Result := HICON(SendMessage(AWnd, WM_GETICON, ICON_SMALL2, 0));

  if Result = 0 then
    Result := HICON(SendMessage(AWnd, WM_GETICON, ICON_SMALL, 0));

  if Result = 0 then
    Result := HICON(GetClassLongPtr(AWnd, GCLP_HICONSM_LOCAL));

  if Result = 0 then
    Result := HICON(SendMessage(AWnd, WM_GETICON, ICON_BIG, 0));

  if Result = 0 then
    Result := HICON(GetClassLongPtr(AWnd, GCLP_HICON_LOCAL));
end;

function HIconToBitmap(const AIcon: HICON): FMX.Graphics.TBitmap;
begin
  Result := nil;

  if AIcon = 0 then
    Exit;

  Result := FMX.Graphics.TBitmap.Create;

  if not HIconToFMXBitmap(AIcon, Result) then
    FreeAndNil(Result);
end;

constructor TFMXCaptionButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FKind := cbMinimize;
  FState := cbsNormal;

  FActive := True;
  FMouseOver := False;
  FPressed := False;
  FDark := True;

  Width := 46;
  Height := 30;

  HitTest := True;
  CanFocus := False;

  Fill.Kind := TBrushKind.None;
  Stroke.Kind := TBrushKind.None;

  FNormalColor := 0;
  FHoverColor := $14FFFFFF;
  FPressedColor := $24FFFFFF;
  FInactiveColor := 0;

  FGlyphColor := $FFFFFFFF;

  FCloseHoverColor := $FFC42B1C;
  FClosePressedColor := $FF9E1B1B;

  FGlyph := TText.Create(Self);
  FGlyph.Parent := Self;
  FGlyph.Align := TAlignLayout.Contents;
  FGlyph.HitTest := False;

  if TOSVersion.Build < 22000 then
    FGlyph.TextSettings.Font.Family := 'Segoe MDL2 Assets'
  else
    FGlyph.TextSettings.Font.Family := 'Segoe Fluent Icons';

  FGlyph.TextSettings.Font.Size := 10;
  FGlyph.TextSettings.Font.Style := [];
  FGlyph.TextSettings.HorzAlign := TTextAlign.Center;
  FGlyph.TextSettings.VertAlign := TTextAlign.Center;
  FGlyph.TextSettings.WordWrap := False;
  FGlyph.TextSettings.Trimming := TTextTrimming.None;

  OnMouseEnter := MouseEnterHandler;
  OnMouseLeave := MouseLeaveHandler;
  OnMouseDown := MouseDownHandler;
  OnMouseUp := MouseUpHandler;

  UpdateGlyph;
  UpdateState;
end;

procedure TFMXCaptionButton.SetKind(const AKind: TCaptionButtonKind);
begin
  if FKind = AKind then
    Exit;

  FKind := AKind;

  UpdateGlyph;
  UpdateState;
end;

procedure TFMXCaptionButton.SetState(const AState: TCaptionButtonState);
begin
  if FState = AState then
    Exit;

  FState := AState;

  UpdateState;
end;

procedure TFMXCaptionButton.SetDarkTheme(AValue: Boolean);
begin
  if FDark = AValue then
  begin
    UpdateState;
    Exit;
  end;

  FDark := AValue;

  if FDark then
  begin
    FNormalColor := 0;
    FHoverColor := $14FFFFFF;
    FPressedColor := $24FFFFFF;
    FInactiveColor := 0;

    FGlyphColor := $FFFFFFFF;

    FCloseHoverColor := $FFC42B1C;
    FClosePressedColor := $FF9E1B1B;
  end
  else
  begin
    FNormalColor := 0;
    FHoverColor := $0A000000;
    FPressedColor := $14000000;
    FInactiveColor := 0;

    FGlyphColor := $FF1A1A1A;

    FCloseHoverColor := $FFC42B1C;
    FClosePressedColor := $FF9E1B1B;
  end;

  UpdateState;
end;

procedure TFMXCaptionButton.SetActive(AValue: Boolean);
begin
  if FActive = AValue then
  begin
    UpdateState;
    Exit;
  end;

  FActive := AValue;

  if not FActive then
  begin
    FState := cbsInactive;
  end
  else if FPressed then
  begin
    FState := cbsPressed;
  end
  else if FMouseOver then
  begin
    FState := cbsHovered;
  end
  else
  begin
    FState := cbsNormal;
  end;

  UpdateState;
end;

procedure TFMXCaptionButton.UpdateGlyph;
begin
  case FKind of

    cbMinimize:
      FGlyph.Text := #$E921;

    cbMaximize:
      FGlyph.Text := #$E922;

    cbClose:
      FGlyph.Text := #$E8BB;

  end;
end;

procedure TFMXCaptionButton.UpdateState;
var
  LColor: TAlphaColor;
  LGlyphColor: TAlphaColor;
begin
  LColor := 0;

  if FDark then
    LGlyphColor := $FFFFFFFF
  else
    LGlyphColor := $FF1A1A1A;

  if not FActive then
  begin
    LColor := 0;

    if FDark then
      LGlyphColor := $80FFFFFF
    else
      LGlyphColor := $80000000;
  end
  else
  begin
    case FState of

      cbsNormal:
        begin
          LColor := FNormalColor;
          LGlyphColor := FGlyphColor;
        end;

      cbsHovered:
        begin
          if FKind = cbClose then
          begin
            LColor := FCloseHoverColor;
            LGlyphColor := $FFFFFFFF;
          end
          else
          begin
            LColor := FHoverColor;
            LGlyphColor := FGlyphColor;
          end;
        end;

      cbsPressed:
        begin
          if FKind = cbClose then
          begin
            LColor := FClosePressedColor;
            LGlyphColor := $FFFFFFFF;
          end
          else
          begin
            LColor := FPressedColor;
            LGlyphColor := FGlyphColor;
          end;
        end;

      cbsInactive:
        begin
          LColor := FInactiveColor;

          if FDark then
            LGlyphColor := $80FFFFFF
          else
            LGlyphColor := $80000000;
        end;

    end;
  end;

  if LColor = 0 then
  begin
    Fill.Kind := TBrushKind.None;
  end
  else
  begin
    Fill.Kind := TBrushKind.Solid;
    Fill.Color := LColor;
  end;

  FGlyph.TextSettings.FontColor := LGlyphColor;
end;

procedure TFMXCaptionButton.MouseEnterHandler(Sender: TObject);
begin
  if not FActive then
    Exit;

  FMouseOver := True;
  FState := cbsHovered;

  UpdateState;
end;

procedure TFMXCaptionButton.MouseLeaveHandler(Sender: TObject);
begin
  FMouseOver := False;
  FPressed := False;

  if not FActive then
    FState := cbsInactive
  else
    FState := cbsNormal;

  UpdateState;
end;

procedure TFMXCaptionButton.MouseDownHandler(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Button <> TMouseButton.mbLeft then
    Exit;

  if not FActive then
    Exit;

  FPressed := True;
  FState := cbsPressed;

  UpdateState;
end;

procedure TFMXCaptionButton.MouseUpHandler(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Button <> TMouseButton.mbLeft then
    Exit;

  FPressed := False;

  if not FActive then
    FState := cbsInactive
  else
    FState := cbsHovered;

  UpdateState;
end;

procedure TFMXCaptionButton.SetNormalColor(const AValue: TAlphaColor);
begin
  FNormalColor := AValue;
  UpdateState;
end;

procedure TFMXCaptionButton.SetHoverColor(const AValue: TAlphaColor);
begin
  FHoverColor := AValue;
  UpdateState;
end;

procedure TFMXCaptionButton.SetPressedColor(const AValue: TAlphaColor);
begin
  FPressedColor := AValue;
  UpdateState;
end;

procedure TFMXCaptionButton.SetInactiveColor(const AValue: TAlphaColor);
begin
  FInactiveColor := AValue;
  UpdateState;
end;

procedure TFMXCaptionButton.SetGlyphColor(const AValue: TAlphaColor);
begin
  FGlyphColor := AValue;
  UpdateState;
end;

procedure TFMXCaptionButton.SetCloseHoverColor(const AValue: TAlphaColor);
begin
  FCloseHoverColor := AValue;
  UpdateState;
end;

procedure TFMXCaptionButton.SetClosePressedColor(const AValue: TAlphaColor);
begin
  FClosePressedColor := AValue;
  UpdateState;
end;

constructor TFMXCustomTitleBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  HitTest := True;
  CanFocus := False;

  Align := TAlignLayout.MostTop;
  BringToFront;

  FTitleBarHeight := 30;

  FLeftInset := 8;
  FIconSize := 16;
  FCaptionLeft := 6;

  FDark := True;

  Height := FTitleBarHeight;

  OnResize := ResizeLayout;
  OnMouseDown := TitleBarMouseDown;
  OnDblClick := TitleBarDblClick;

  FBackground := TRectangle.Create(Self);
  FBackground.Parent := Self;
  FBackground.Align := TAlignLayout.Contents;
  FBackground.HitTest := False;
  FBackground.Stroke.Thickness := 0;
  FBackground.Stroke.Kind := TBrushKind.None;
  FBackground.Fill.Kind := TBrushKind.None;

  FIcon := TImage.Create(Self);
  FIcon.Parent := Self;
  FIcon.Width := FIconSize;
  FIcon.Height := FIconSize;
  FIcon.WrapMode := TImageWrapMode.Fit;
  FIcon.HitTest := False;

  FCaption := TText.Create(Self);
  FCaption.Parent := Self;
  FCaption.Height := FTitleBarHeight;
  FCaption.HitTest := False;
  FCaption.TextSettings.Font.Family := 'Segoe UI';
  FCaption.TextSettings.Font.Size := 12;
  FCaption.TextSettings.Font.Style := [];
  FCaption.TextSettings.HorzAlign := TTextAlign.Leading;
  FCaption.TextSettings.VertAlign := TTextAlign.Center;
  FCaption.TextSettings.WordWrap := False;
  FCaption.TextSettings.Trimming := TTextTrimming.Character;
  FCaption.TextSettings.FontColor := $FFFFFFFF;

  FMinimizeButton := TFMXCaptionButton.Create(Self);
  FMinimizeButton.Parent := Self;
  FMinimizeButton.Kind := cbMinimize;
  FMinimizeButton.Width := 46;
  FMinimizeButton.Height := FTitleBarHeight;
  FMinimizeButton.OnClick := MinimizeButtonClick;

  FMaximizeButton := TFMXCaptionButton.Create(Self);
  FMaximizeButton.Parent := Self;
  FMaximizeButton.Kind := cbMaximize;
  FMaximizeButton.Width := 46;
  FMaximizeButton.Height := FTitleBarHeight;
  FMaximizeButton.OnClick := MaximizeButtonClick;

  FCloseButton := TFMXCaptionButton.Create(Self);
  FCloseButton.Parent := Self;
  FCloseButton.Kind := cbClose;
  FCloseButton.Width := 46;
  FCloseButton.Height := FTitleBarHeight;

  ChangeTheme(True);

  UpdateLayout;
end;

procedure TFMXCustomTitleBar.MinimizeButtonClick(Sender: TObject);
var
  Form: TCommonCustomForm;
  Wnd: HWND;
begin
  Form := FindHostForm;

  if Form = nil then
    Exit;

  Form.HandleNeeded;

  Wnd := FormToHWND(Form);

  if Wnd = 0 then
    Exit;

  SendMessage(Wnd, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TFMXCustomTitleBar.MaximizeButtonClick(Sender: TObject);
var
  Form: TCommonCustomForm;
  Wnd: HWND;
begin
  Form := FindHostForm;

  if Form = nil then
    Exit;

  Form.HandleNeeded;

  Wnd := FormToHWND(Form);

  if Wnd = 0 then
    Exit;

  if IsZoomed(Wnd) then
    SendMessage(Wnd, WM_SYSCOMMAND, SC_RESTORE, 0)
  else
    SendMessage(Wnd, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  SetMaximized(IsZoomed(Wnd));
end;

procedure TFMXCustomTitleBar.CloseButtonEnabled(AValue: Boolean);
begin
  FCloseButton.Enabled := AValue;
end;

procedure TFMXCustomTitleBar.CloseButtonClick(Event: TNotifyEvent);
begin
  FCloseButton.OnClick := Event;
end;

procedure TFMXCustomTitleBar.SetColor(const AColor: TAlphaColor);
begin
  if AColor = 0 then
  begin
    FBackground.Fill.Kind := TBrushKind.None;

    Exit;
  end;

  FBackground.Fill.Kind := TBrushKind.Solid;
  FBackground.Fill.Color := AColor;
end;

procedure TFMXCustomTitleBar.ChangeTheme(const ADark: Boolean);
begin
  FDark := ADark;

  if FDark then
  begin
    FCaption.TextSettings.FontColor := $FFFFFFFF;
  end
  else
  begin
    FCaption.TextSettings.FontColor := $FF1A1A1A;
  end;

  FMinimizeButton.SetDarkTheme(FDark);
  FMaximizeButton.SetDarkTheme(FDark);
  FCloseButton.SetDarkTheme(FDark);
end;

procedure TFMXCustomTitleBar.ResizeLayout(Sender: TObject);
begin
  UpdateLayout;
end;

procedure TFMXCustomTitleBar.TitleBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  Form: TCommonCustomForm;
  Wnd: HWND;
begin
  if Button <> TMouseButton.mbLeft then
    Exit;

  if FMinimizeButton.Visible and (X >= FMinimizeButton.Position.X) and
    (X <= FMinimizeButton.Position.X + FMinimizeButton.Width) then
    Exit;

  if FMaximizeButton.Visible and (X >= FMaximizeButton.Position.X) and
    (X <= FMaximizeButton.Position.X + FMaximizeButton.Width) then
    Exit;

  if FCloseButton.Visible and (X >= FCloseButton.Position.X) and
    (X <= FCloseButton.Position.X + FCloseButton.Width) then
    Exit;

  Form := FindHostForm;

  if Form = nil then
    Exit;

  Form.HandleNeeded;

  Wnd := FormToHWND(Form);

  if Wnd = 0 then
    Exit;

  ReleaseCapture;

  SendMessage(Wnd, WM_NCLBUTTONDOWN, HTCAPTION, 0);
end;

procedure TFMXCustomTitleBar.TitleBarDblClick(Sender: TObject);
var
  Form: TCommonCustomForm;
  Wnd: HWND;
begin
  Form := FindHostForm;

  if Form = nil then
    Exit;

  Form.HandleNeeded;

  Wnd := FormToHWND(Form);

  if Wnd = 0 then
    Exit;

  UpdateCaptionMetrics;

  if not FCaptionMetrics.HasMaximize then
    Exit;

  if IsZoomed(Wnd) then
    SendMessage(Wnd, WM_SYSCOMMAND, SC_RESTORE, 0)
  else
    SendMessage(Wnd, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  SetMaximized(IsZoomed(Wnd));
end;

procedure TFMXCustomTitleBar.UpdateCaptionMetrics;
var
  Form: TCommonCustomForm;
  Wnd: HWND;

  ButtonWidth: Single;
  X: Single;
begin
  FMinimizeButton.Visible := False;
  FMaximizeButton.Visible := False;
  FCloseButton.Visible := False;

  Form := FindHostForm;

  if Form = nil then
    Exit;

  Form.HandleNeeded;

  Wnd := FormToHWND(Form);

  if Wnd = 0 then
    Exit;

  if not GetCaptionButtonMetrics(Wnd, FCaptionMetrics) then
    Exit;

  ButtonWidth := FCaptionMetrics.ButtonWidth;

  X := Width;

  if FCaptionMetrics.HasClose then
  begin
    X := X - ButtonWidth;

    FCloseButton.Visible := True;
    FCloseButton.Position.X := X;
    FCloseButton.Position.Y := 0;
    FCloseButton.Width := ButtonWidth;
    FCloseButton.Height := TitleBarHeight;
  end;

  if FCaptionMetrics.HasMaximize then
  begin
    X := X - ButtonWidth;

    FMaximizeButton.Visible := True;
    FMaximizeButton.Position.X := X;
    FMaximizeButton.Position.Y := 0;
    FMaximizeButton.Width := ButtonWidth;
    FMaximizeButton.Height := TitleBarHeight;
  end;

  if FCaptionMetrics.HasMinimize then
  begin
    X := X - ButtonWidth;

    FMinimizeButton.Visible := True;
    FMinimizeButton.Position.X := X;
    FMinimizeButton.Position.Y := 0;
    FMinimizeButton.Width := ButtonWidth;
    FMinimizeButton.Height := TitleBarHeight;
  end;
end;

function TFMXCustomTitleBar.FindHostForm: TCommonCustomForm;
var
  Obj: TFmxObject;
begin
  Result := nil;

  if FHostForm <> nil then
  begin
    Result := FHostForm;

    Exit;
  end;

  Obj := Parent;

  while Obj <> nil do
  begin
    if Obj is TCommonCustomForm then
    begin
      Result := TCommonCustomForm(Obj);

      Exit;
    end;

    Obj := Obj.Parent;
  end;
end;

procedure TFMXCustomTitleBar.SetHostForm(AForm: TCommonCustomForm);
begin
  if AForm <> nil then
    FHostForm := AForm
  else
    FHostForm := FindHostForm;

  if FHostForm = nil then
    Exit;

  FHostForm.HandleNeeded;

  UpdateWindowIdentity;
  UpdateCaptionMetrics;
  UpdateLayout;
end;

procedure TFMXCustomTitleBar.UpdateWindowIdentity;
var
  Form: TCommonCustomForm;
  Wnd: HWND;
  IconHandle: HICON;
  Bitmap: FMX.Graphics.TBitmap;
begin
  Form := FindHostForm;

  if Form = nil then
    Exit;

  Form.HandleNeeded;

  Wnd := FormToHWND(Form);

  if Wnd = 0 then
    Exit;

  FCaption.Text := Form.Caption;

  IconHandle := GetWindowIcon(Wnd);

  if IconHandle = 0 then
  begin
    FIcon.Bitmap := nil;
    Exit;
  end;

  Bitmap := HIconToBitmap(IconHandle);

  if Bitmap = nil then
    Exit;

  try
    FIcon.Bitmap.Assign(Bitmap);
  finally
    Bitmap.Free;
  end;
end;

procedure TFMXCustomTitleBar.UpdateLayout;
var
  ButtonAreaWidth: Single;
  CaptionRight: Single;
begin
  if Width <= 0 then
    Exit;

  Height := FTitleBarHeight;

  FIcon.Width := FIconSize;
  FIcon.Height := FIconSize;
  FIcon.Position.X := FLeftInset;
  FIcon.Position.Y := (FTitleBarHeight - FIconSize) * 0.5;

  FCaption.Position.X := FLeftInset + FIconSize + FCaptionLeft;
  FCaption.Position.Y := 0;
  FCaption.Height := FTitleBarHeight;

  UpdateCaptionMetrics;

  ButtonAreaWidth := 0;

  if FCaptionMetrics.HasClose then
    ButtonAreaWidth := ButtonAreaWidth + FCaptionMetrics.ButtonWidth;

  if FCaptionMetrics.HasMaximize then
    ButtonAreaWidth := ButtonAreaWidth + FCaptionMetrics.ButtonWidth;

  if FCaptionMetrics.HasMinimize then
    ButtonAreaWidth := ButtonAreaWidth + FCaptionMetrics.ButtonWidth;

  CaptionRight := Width - ButtonAreaWidth - 16;

  if CaptionRight > FCaption.Position.X then
  begin
    FCaption.Width := CaptionRight - FCaption.Position.X;
  end
  else
  begin
    FCaption.Width := 0;
  end;
end;

procedure TFMXCustomTitleBar.SetMaximized(const AValue: Boolean);
begin
  if AValue then
    FMaximizeButton.Glyph.Text := #$E923
  else
    FMaximizeButton.Glyph.Text := #$E922;
end;

procedure TFMXCustomTitleBar.SetActive(const AValue: Boolean);
begin
  FMinimizeButton.SetActive(AValue);
  FMaximizeButton.SetActive(AValue);
  FCloseButton.SetActive(AValue);
end;

// =============================================================================
// Wrapper
// =============================================================================
procedure TFWinTitleBar.FCreate(FParent: TFmxObject; Dark: Boolean);
begin
  if FTitleBar = nil then
  begin
    FDark := Dark;

    FTitleBar := TFMXCustomTitleBar.Create(nil);

    if FParent <> nil then
      FTitleBar.Parent := FParent;

    FTitleBar.SetHostForm(nil);
    FTitleBar.ChangeTheme(FDark);
    FTitleBar.UpdateLayout;
  end
  else
  begin
    if (FParent <> nil) and (FTitleBar.Parent <> FParent) then
    begin
      FTitleBar.Parent := FParent;
      FTitleBar.SetHostForm(nil);
    end;

    ChangeDarkMode(Dark);
  end;
end;

procedure TFWinTitleBar.Height(FHeight: Single);
begin
  if FTitleBar = nil then
    Exit;

  if FHeight < 0 then
    FHeight := 0;

  FTitleBar.TitleBarHeight := FHeight;
  FTitleBar.Height := FHeight;
  FTitleBar.UpdateLayout;
end;

procedure TFWinTitleBar.Offset(PY: Single);
begin
  if FTitleBar = nil then
    Exit;

  FTitleBar.Position.Y := PY;
end;

procedure TFWinTitleBar.SetColor(FColor: TAlphaColor);
begin
  if FTitleBar = nil then
    Exit;

  FTitleBar.SetColor(FColor);
end;

procedure TFWinTitleBar.ChangeDarkMode(const Dark: Boolean);
begin
  if FTitleBar = nil then
    Exit;

  FDark := Dark;

  FTitleBar.ChangeTheme(Dark);
end;

procedure TFWinTitleBar.CloseBtnEnabled(FValue: Boolean);
begin
  if FTitleBar = nil then
    Exit;

  FTitleBar.CloseButtonEnabled(FValue);
end;

function TFWinTitleBar.GetHeight: Single;
begin
  if FTitleBar <> nil then
    Result := FTitleBar.Height
  else
    Result := 0;
end;

function TFWinTitleBar.GetObjectCloseBtn: TFmxObject;
begin
  if FTitleBar <> nil then
    Result := FTitleBar.CloseButton
  else
    Result := nil;
end;

procedure TFWinTitleBar.CloseBtnOnClick(Event: TNotifyEvent);
begin
  if FTitleBar = nil then
    Exit;

  FTitleBar.CloseButtonClick(Event);
end;

function TFWinTitleBar.Handle: TFmxObject;
begin
  Result := FTitleBar;
end;

// =============================================================================
// Export
// =============================================================================
function InitWinTitleBarHandle: FWinTitleBar;
begin
  Result := TFWinTitleBar.Create;
end;

exports InitWinTitleBarHandle;

end.
