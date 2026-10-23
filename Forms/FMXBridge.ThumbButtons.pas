
unit FMXBridge.ThumbButtons;

interface

uses
  Winapi.Windows, Winapi.ShlObj,
  System.UITypes;

// =============================================================================
// FThumbButtons
// =============================================================================
const
  MaxThumbButtons = 7;

type
  TThumbButtonCallback = procedure(const Index: Integer) of object;

  FThumbButtons = interface(IUnknown)
    ['{D8D83FE2-E1E2-4787-A11C-1A8244D8B272}']
    function FCreate(FHandle: HWND): Boolean; stdcall;
    function AddButton(const FHint: WideString): Integer; stdcall;
    procedure SetIcon(const Index: Integer;
      const FIconFile: WideString); stdcall;
    procedure SetGlyph(const Index: Integer;
      const FGlyph, FFontName: WideString; FColor: TAlphaColor); stdcall;
    procedure SetHint(const Index: Integer; const FHint: WideString); stdcall;
    procedure Enabled(const Index: Integer; FEnabled: Boolean); stdcall;
    procedure Visible(const Index: Integer; FVisible: Boolean); stdcall;
    procedure DismissOnClick(const Index: Integer; FValue: Boolean); stdcall;
    procedure NoBackground(const Index: Integer; FValue: Boolean); stdcall;
    function Count: Integer; stdcall;
    procedure OnClick(FCallback: TThumbButtonCallback); stdcall;
  end;

  TThumbButtonState = record
    Icon: HICON;
    Hint: string;
    Enabled: Boolean;
    Visible: Boolean;
    DismissOnClick: Boolean;
    NoBackground: Boolean;
  end;

  TFThumbButtons = class(TInterfacedObject, FThumbButtons)
  private
    FWnd: HWND;
    FTaskbar: ITaskbarList3;
    FAttached: Boolean;
    FCount: Integer;
    FStates: array [0 .. MaxThumbButtons - 1] of TThumbButtonState;
    FClickCallback: TThumbButtonCallback;

    function ValidIndex(const Index: Integer): Boolean;
    procedure ReplaceIcon(const Index: Integer; AIcon: HICON);
    procedure ApplyButtons;
    procedure Detach;
    procedure DoClick(const Index: Integer);
  public
    destructor Destroy; override;

    function FCreate(FHandle: HWND): Boolean; stdcall;
    function AddButton(const FHint: WideString): Integer; stdcall;
    procedure SetIcon(const Index: Integer;
      const FIconFile: WideString); stdcall;
    procedure SetGlyph(const Index: Integer;
      const FGlyph, FFontName: WideString; FColor: TAlphaColor); stdcall;
    procedure SetHint(const Index: Integer; const FHint: WideString); stdcall;
    procedure Enabled(const Index: Integer; FEnabled: Boolean); stdcall;
    procedure Visible(const Index: Integer; FVisible: Boolean); stdcall;
    procedure DismissOnClick(const Index: Integer; FValue: Boolean); stdcall;
    procedure NoBackground(const Index: Integer; FValue: Boolean); stdcall;
    function Count: Integer; stdcall;
    procedure OnClick(FCallback: TThumbButtonCallback); stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitThumbButtons: FThumbButtons; stdcall;

implementation

uses
  System.SysUtils, System.Types, System.UIConsts, System.Win.Registry,
  Winapi.Messages, Winapi.ActiveX,
  FMX.Types, FMX.Graphics;

// =============================================================================
// WinAPI
// =============================================================================
type
  TSubclassProc = function(Wnd: HWND; Msg: UINT; wParam: WPARAM;
    lParam: LPARAM; uIdSubclass: UINT_PTR; dwRefData: DWORD_PTR)
    : LRESULT; stdcall;

function SetWindowSubclass(Wnd: HWND; SubclassProc: TSubclassProc;
  uIdSubclass: UINT_PTR; dwRefData: DWORD_PTR): BOOL; stdcall;
  external 'comctl32.dll' name 'SetWindowSubclass';

function RemoveWindowSubclass(Wnd: HWND; SubclassProc: TSubclassProc;
  uIdSubclass: UINT_PTR): BOOL; stdcall;
  external 'comctl32.dll' name 'RemoveWindowSubclass';

function DefSubclassProc(Wnd: HWND; Msg: UINT; wParam: WPARAM;
  lParam: LPARAM): LRESULT; stdcall;
  external 'comctl32.dll' name 'DefSubclassProc';

const
  MSGFLT_ALLOW = 1;

function ChangeWindowMessageFilterEx(Wnd: HWND; Msg: UINT; Action: DWORD;
  ChangeFilterStruct: Pointer): BOOL; stdcall;
  external user32 name 'ChangeWindowMessageFilterEx';

var
  WM_TaskbarButtonCreated: UINT = 0;
  WM_ThumbButtonClick: UINT = 0;

function CreateTaskbarList: ITaskbarList3;
begin
  if Failed(CoCreateInstance(CLSID_TaskbarList, nil, CLSCTX_INPROC_SERVER,
    ITaskbarList3, Result)) or Failed(Result.HrInit) then
    Result := nil;
end;

// =============================================================================
// Icons
// =============================================================================
function IconSize: Integer;
begin
  Result := GetSystemMetrics(SM_CXSMICON);
end;

function DefaultGlyphColor: TAlphaColor;
var
  Reg: TRegistry;
begin
  Result := TAlphaColors.White;

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if Reg.OpenKeyReadOnly
      ('\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize') and
      Reg.ValueExists('SystemUsesLightTheme') and
      (Reg.ReadInteger('SystemUsesLightTheme') <> 0) then
      Result := TAlphaColors.Black;
  finally
    Reg.Free;
  end;
end;

function BitmapToIcon(Bitmap: FMX.Graphics.TBitmap): HICON;
var
  FBitmapInfo: BITMAPINFO;
  FIconInfo: ICONINFO;
  ColorBitmap: HBITMAP;
  MaskBitmap: HBITMAP;
  MaskBits: TBytes;
  Bits: Pointer;
  Pixel: PCardinal;
  Data: TBitmapData;
  X, Y: Integer;
begin
  Result := 0;

  FillChar(FBitmapInfo, SizeOf(BITMAPINFO), 0);

  FBitmapInfo.bmiHeader.biSize := SizeOf(BITMAPINFOHEADER);
  FBitmapInfo.bmiHeader.biWidth := Bitmap.Width;
  FBitmapInfo.bmiHeader.biHeight := -Bitmap.Height;
  FBitmapInfo.bmiHeader.biPlanes := 1;
  FBitmapInfo.bmiHeader.biBitCount := 32;
  FBitmapInfo.bmiHeader.biCompression := BI_RGB;

  ColorBitmap := CreateDIBSection(0, FBitmapInfo, DIB_RGB_COLORS, Bits, 0, 0);

  if ColorBitmap = 0 then
    Exit;

  SetLength(MaskBits, ((Bitmap.Width + 15) div 16) * 2 * Bitmap.Height);
  MaskBitmap := CreateBitmap(Bitmap.Width, Bitmap.Height, 1, 1, @MaskBits[0]);

  try
    if not Bitmap.Map(TMapAccess.Read, Data) then
      Exit;

    try
      Pixel := Bits;

      for Y := 0 to Bitmap.Height - 1 do
        for X := 0 to Bitmap.Width - 1 do
        begin
          // FMX keeps premultiplied pixels, icons expect straight alpha
          Pixel^ := UnpremultiplyAlpha(Data.GetPixel(X, Y));
          Inc(Pixel);
        end;
    finally
      Bitmap.Unmap(Data);
    end;

    FillChar(FIconInfo, SizeOf(ICONINFO), 0);

    FIconInfo.fIcon := True;
    FIconInfo.hbmMask := MaskBitmap;
    FIconInfo.hbmColor := ColorBitmap;

    Result := CreateIconIndirect(FIconInfo);
  finally
    DeleteObject(MaskBitmap);
    DeleteObject(ColorBitmap);
  end;
end;

function LoadIconFile(const FileName: string; Size: Integer): HICON;
var
  Source: FMX.Graphics.TBitmap;
  Bitmap: FMX.Graphics.TBitmap;
  SrcRect: TRectF;
begin
  Result := 0;

  if not FileExists(FileName) then
    Exit;

  if SameText(ExtractFileExt(FileName), '.ico') then
    Exit(LoadImage(0, PChar(FileName), IMAGE_ICON, Size, Size,
      LR_LOADFROMFILE));

  try
    Source := FMX.Graphics.TBitmap.CreateFromFile(FileName);
    try
      Bitmap := FMX.Graphics.TBitmap.Create(Size, Size);
      try
        Bitmap.Clear(TAlphaColors.Null);

        SrcRect := RectF(0, 0, Source.Width, Source.Height);

        if Bitmap.Canvas.BeginScene then
          try
            Bitmap.Canvas.DrawBitmap(Source, SrcRect,
              SrcRect.FitInto(RectF(0, 0, Size, Size)), 1);
          finally
            Bitmap.Canvas.EndScene;
          end;

        Result := BitmapToIcon(Bitmap);
      finally
        Bitmap.Free;
      end;
    finally
      Source.Free;
    end;
  except
    Result := 0;
  end;
end;

function GlyphToIcon(const Glyph, FontName: string; Color: TAlphaColor;
  Size: Integer): HICON;
var
  Bitmap: FMX.Graphics.TBitmap;
begin
  Bitmap := FMX.Graphics.TBitmap.Create(Size, Size);
  try
    Bitmap.Clear(TAlphaColors.Null);

    if Bitmap.Canvas.BeginScene then
      try
        Bitmap.Canvas.Font.Family := FontName;
        Bitmap.Canvas.Font.Size := Size;
        Bitmap.Canvas.Fill.Kind := TBrushKind.Solid;
        Bitmap.Canvas.Fill.Color := Color;
        Bitmap.Canvas.FillText(RectF(0, 0, Size, Size), Glyph, False, 1, [],
          TTextAlign.Center, TTextAlign.Center);
      finally
        Bitmap.Canvas.EndScene;
      end;

    Result := BitmapToIcon(Bitmap);
  finally
    Bitmap.Free;
  end;
end;

// =============================================================================
// Window subclass
// =============================================================================
function ThumbSubclassProc(Wnd: HWND; Msg: UINT; wParam: WPARAM;
  lParam: LPARAM; uIdSubclass: UINT_PTR; dwRefData: DWORD_PTR)
  : LRESULT; stdcall;
var
  Buttons: TFThumbButtons;
begin
  Buttons := TFThumbButtons(dwRefData);

  if Msg = WM_TaskbarButtonCreated then
  begin
    // Sent again after Explorer restarts, the toolbar has to be added anew
    Buttons.FAttached := False;
    Buttons.FTaskbar := nil;
    Buttons.ApplyButtons;
  end
  else if (Msg = WM_COMMAND) and (HiWord(wParam) = THBN_CLICKED) then
  begin
    // Deferred, so a modal dialog in the script handler cannot block Explorer
    PostMessage(Wnd, WM_ThumbButtonClick, LoWord(wParam), 0);
    Exit(0);
  end
  else if Msg = WM_ThumbButtonClick then
  begin
    Buttons.DoClick(wParam);
    Exit(0);
  end
  else if Msg = WM_NCDESTROY then
    Buttons.Detach;

  Result := DefSubclassProc(Wnd, Msg, wParam, lParam);
end;

// =============================================================================
// TFThumbButtons
// =============================================================================
destructor TFThumbButtons.Destroy;
var
  I: Integer;
begin
  Detach;

  for I := 0 to MaxThumbButtons - 1 do
    if FStates[I].Icon <> 0 then
      DestroyIcon(FStates[I].Icon);

  inherited;
end;

function TFThumbButtons.ValidIndex(const Index: Integer): Boolean;
begin
  Result := (Index >= 0) and (Index < FCount);
end;

procedure TFThumbButtons.ReplaceIcon(const Index: Integer; AIcon: HICON);
var
  OldIcon: HICON;
begin
  OldIcon := FStates[Index].Icon;
  FStates[Index].Icon := AIcon;

  ApplyButtons;

  if OldIcon <> 0 then
    DestroyIcon(OldIcon);
end;

procedure TFThumbButtons.ApplyButtons;
var
  Buttons: array [0 .. MaxThumbButtons - 1] of THUMBBUTTON;
  I: Integer;
begin
  if FWnd = 0 then
    Exit;

  if not Assigned(FTaskbar) then
    FTaskbar := CreateTaskbarList;

  if not Assigned(FTaskbar) then
    Exit;

  FillChar(Buttons, SizeOf(Buttons), 0);

  // All seven slots are registered once, unused ones stay hidden
  for I := 0 to MaxThumbButtons - 1 do
  begin
    Buttons[I].dwMask := THB_TOOLTIP or THB_FLAGS;
    Buttons[I].iId := I;

    if FStates[I].Icon <> 0 then
    begin
      Buttons[I].dwMask := Buttons[I].dwMask or THB_ICON;
      Buttons[I].hIcon := FStates[I].Icon;
    end;

    StrPLCopy(Buttons[I].szTip, FStates[I].Hint, Length(Buttons[I].szTip) - 1);

    if (I >= FCount) or not FStates[I].Visible then
      Buttons[I].dwFlags := Buttons[I].dwFlags or THBF_HIDDEN;

    if not FStates[I].Enabled then
      Buttons[I].dwFlags := Buttons[I].dwFlags or THBF_DISABLED;

    if FStates[I].DismissOnClick then
      Buttons[I].dwFlags := Buttons[I].dwFlags or THBF_DISMISSONCLICK;

    if FStates[I].NoBackground then
      Buttons[I].dwFlags := Buttons[I].dwFlags or THBF_NOBACKGROUND;
  end;

  if FAttached or Failed(FTaskbar.ThumbBarAddButtons(FWnd, MaxThumbButtons,
    @Buttons[0])) then
    FAttached := Succeeded(FTaskbar.ThumbBarUpdateButtons(FWnd,
      MaxThumbButtons, @Buttons[0]))
  else
    FAttached := True;
end;

procedure TFThumbButtons.Detach;
begin
  if FWnd = 0 then
    Exit;

  RemoveWindowSubclass(FWnd, ThumbSubclassProc, UINT_PTR(Self));

  FWnd := 0;
  FAttached := False;
  FTaskbar := nil;
end;

procedure TFThumbButtons.DoClick(const Index: Integer);
begin
  if ValidIndex(Index) and Assigned(FClickCallback) then
    FClickCallback(Index);
end;

function TFThumbButtons.FCreate(FHandle: HWND): Boolean;
begin
  Result := False;

  if (FWnd <> 0) or not IsWindow(FHandle) then
    Exit;

  if WM_TaskbarButtonCreated = 0 then
    WM_TaskbarButtonCreated := RegisterWindowMessage('TaskbarButtonCreated');

  if WM_ThumbButtonClick = 0 then
    WM_ThumbButtonClick := RegisterWindowMessage('FMXBridgeThumbButtonClick');

  if not SetWindowSubclass(FHandle, ThumbSubclassProc, UINT_PTR(Self),
    DWORD_PTR(Self)) then
    Exit;

  FWnd := FHandle;

  // Setup usually runs elevated, Explorer messages are filtered by UIPI
  ChangeWindowMessageFilterEx(FWnd, WM_TaskbarButtonCreated, MSGFLT_ALLOW, nil);
  ChangeWindowMessageFilterEx(FWnd, WM_COMMAND, MSGFLT_ALLOW, nil);

  ApplyButtons;

  Result := True;
end;

function TFThumbButtons.AddButton(const FHint: WideString): Integer;
begin
  if FCount >= MaxThumbButtons then
    Exit(-1);

  Result := FCount;
  Inc(FCount);

  FStates[Result].Hint := string(FHint);
  FStates[Result].Enabled := True;
  FStates[Result].Visible := True;

  ApplyButtons;
end;

procedure TFThumbButtons.SetIcon(const Index: Integer;
  const FIconFile: WideString);
begin
  if not ValidIndex(Index) then
    Exit;

  ReplaceIcon(Index, LoadIconFile(string(FIconFile), IconSize));
end;

procedure TFThumbButtons.SetGlyph(const Index: Integer;
  const FGlyph, FFontName: WideString; FColor: TAlphaColor);
var
  FontName: string;
  Color: TAlphaColor;
begin
  if not ValidIndex(Index) then
    Exit;

  FontName := string(FFontName);

  if FontName = '' then
    FontName := 'Segoe MDL2 Assets';

  Color := FColor;

  if Color = 0 then
    Color := DefaultGlyphColor;

  ReplaceIcon(Index, GlyphToIcon(string(FGlyph), FontName, Color, IconSize));
end;

procedure TFThumbButtons.SetHint(const Index: Integer; const FHint: WideString);
begin
  if not ValidIndex(Index) then
    Exit;

  FStates[Index].Hint := string(FHint);
  ApplyButtons;
end;

procedure TFThumbButtons.Enabled(const Index: Integer; FEnabled: Boolean);
begin
  if not ValidIndex(Index) then
    Exit;

  FStates[Index].Enabled := FEnabled;
  ApplyButtons;
end;

procedure TFThumbButtons.Visible(const Index: Integer; FVisible: Boolean);
begin
  if not ValidIndex(Index) then
    Exit;

  FStates[Index].Visible := FVisible;
  ApplyButtons;
end;

procedure TFThumbButtons.DismissOnClick(const Index: Integer; FValue: Boolean);
begin
  if not ValidIndex(Index) then
    Exit;

  FStates[Index].DismissOnClick := FValue;
  ApplyButtons;
end;

procedure TFThumbButtons.NoBackground(const Index: Integer; FValue: Boolean);
begin
  if not ValidIndex(Index) then
    Exit;

  FStates[Index].NoBackground := FValue;
  ApplyButtons;
end;

function TFThumbButtons.Count: Integer;
begin
  Result := FCount;
end;

procedure TFThumbButtons.OnClick(FCallback: TThumbButtonCallback);
begin
  FClickCallback := FCallback;
end;

// =============================================================================
// Exports
// =============================================================================
function InitThumbButtons: FThumbButtons;
begin
  Result := TFThumbButtons.Create;
end;

exports
  InitThumbButtons;

end.
