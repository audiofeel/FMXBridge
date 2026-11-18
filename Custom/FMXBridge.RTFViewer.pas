unit FMXBridge.RTFViewer;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  Winapi.Windows,
  FMX.Types,
  FMX.Controls;

type
  TRTFScrollBars = (rtfScrollNone, rtfScrollVertical,
    rtfScrollHorizontal, rtfScrollBoth);

  TRTFLinkClickEvent = procedure(Sender: TObject;
    const URL: WideString) of object;

  FRTFViewer = interface(IUnknown)
    ['{A52D7C6F-6F53-4D90-B1E7-C3A2E0F58A31}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadFromFile(const AFileName: WideString); stdcall;
    procedure RTFText(const AValue: WideString); stdcall;
    procedure ScrollBars(AValue: TRTFScrollBars); stdcall;
    procedure Color(AValue: TAlphaColor); stdcall;
    procedure Border(AValue: Boolean); stdcall;
    procedure AutoOpenLink(AValue: Boolean); stdcall;
    procedure OnLinkClick(Event: TRTFLinkClickEvent); stdcall;
    procedure Visible(AValue: Boolean); stdcall;
    procedure Enabled(AValue: Boolean); stdcall;
    procedure SetFocus; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFRTFViewer = class(TInterfacedObject, FRTFViewer)
  private
    FControl: TControl;
    function GetControl: TControl;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadFromFile(const AFileName: WideString); stdcall;
    procedure RTFText(const AValue: WideString); stdcall;
    procedure ScrollBars(AValue: TRTFScrollBars); stdcall;
    procedure Color(AValue: TAlphaColor); stdcall;
    procedure Border(AValue: Boolean); stdcall;
    procedure AutoOpenLink(AValue: Boolean); stdcall;
    procedure OnLinkClick(Event: TRTFLinkClickEvent); stdcall;
    procedure Visible(AValue: Boolean); stdcall;
    procedure Enabled(AValue: Boolean); stdcall;
    procedure SetFocus; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

function InitRTFViewerHandle: FRTFViewer; stdcall;

implementation

uses
  Winapi.ActiveX,
  Winapi.CommCtrl,
  Winapi.ShellAPI,
  System.Math,
  System.Win.ComObj,
  FMX.Forms,
  FMX.Platform.Win;

const
  RTF_EM_SETREADONLY = WM_USER + 31;
  RTF_EM_SETRECT = $00B3;
  RTF_EM_EXLIMITTEXT = WM_USER + 53;
  RTF_EM_GETEVENTMASK = WM_USER + 59;
  RTF_EM_SETBKGNDCOLOR = WM_USER + 67;
  RTF_EM_SETEVENTMASK = WM_USER + 69;
  RTF_EM_SETOLECALLBACK = WM_USER + 70;
  RTF_EM_STREAMIN = WM_USER + 73;
  RTF_EM_GETTEXTRANGE = WM_USER + 75;
  RTF_EM_AUTOURLDETECT = WM_USER + 91;

  RTF_SF_TEXT = $0001;
  RTF_SF_RTF = $0002;
  RTF_SF_UNICODE = $0010;
  RTF_ENM_LINK = $04000000;
  RTF_EN_LINK = $070B;
  RTF_WM_DPICHANGED = $02E0;

type
  TRTFCharRange = record
    cpMin: Longint;
    cpMax: Longint;
  end;

  TRTFTextRange = record
    chrg: TRTFCharRange;
    lpstrText: PWideChar;
  end;

  TRTFStreamData = record
    Buffer: PByte;
    BytesLeft: Integer;
  end;
  PRTFStreamData = ^TRTFStreamData;

  TRTFEditStreamCallback = function(dwCookie: DWORD_PTR; pbBuff: PByte;
    cb: Longint; var pcb: Longint): DWORD; stdcall;

  TRTFEditStream = record
    dwCookie: DWORD_PTR;
    dwError: DWORD;
    pfnCallback: TRTFEditStreamCallback;
  end;

  TRTFNMHdr = record
    hwndFrom: HWND;
    idFrom: UINT_PTR;
    code: UINT;
  end;

  TRTFEnLink = record
    nmhdr: TRTFNMHdr;
    msg: UINT;
    wParam: WPARAM;
    lParam: LPARAM;
    chrg: TRTFCharRange;
  end;
  PRTFEnLink = ^TRTFEnLink;

  IRichEditOleCallback = interface(IUnknown)
    ['{00020D03-0000-0000-C000-000000000046}']
    function GetNewStorage(out stg: IStorage): HResult; stdcall;
    function GetInPlaceContext(out Frame: IOleInPlaceFrame;
      out Doc: IOleInPlaceUIWindow;
      lpFrameInfo: POleInPlaceFrameInfo): HResult; stdcall;
    function ShowContainerUI(fShow: BOOL): HResult; stdcall;
    function QueryInsertObject(const clsid: TCLSID; const stg: IStorage;
      cp: Integer): HResult; stdcall;
    function DeleteObject(const oleobj: IOleObject): HResult; stdcall;
    function QueryAcceptData(const dataobj: IDataObject; var cfFormat: Word;
      reco: DWORD; fReally: BOOL; hMetaPict: HGLOBAL): HResult; stdcall;
    function ContextSensitiveHelp(fEnterMode: BOOL): HResult; stdcall;
    function GetClipboardData(const [Ref] chrg: TRTFCharRange; reco: DWORD;
      out dataobj: IDataObject): HResult; stdcall;
    function GetDragDropEffect(fDrag: BOOL; grfKeyState: DWORD;
      var dwEffect: DWORD): HResult; stdcall;
    function GetContextMenu(seltype: Word; const oleobj: IOleObject;
      const [Ref] chrg: TRTFCharRange; out menu: HMENU): HResult; stdcall;
  end;

  TRTFViewerOleCallback = class(TInterfacedObject, IRichEditOleCallback)
  public
    function GetNewStorage(out stg: IStorage): HResult; stdcall;
    function GetInPlaceContext(out Frame: IOleInPlaceFrame;
      out Doc: IOleInPlaceUIWindow;
      lpFrameInfo: POleInPlaceFrameInfo): HResult; stdcall;
    function ShowContainerUI(fShow: BOOL): HResult; stdcall;
    function QueryInsertObject(const clsid: TCLSID; const stg: IStorage;
      cp: Integer): HResult; stdcall;
    function DeleteObject(const oleobj: IOleObject): HResult; stdcall;
    function QueryAcceptData(const dataobj: IDataObject; var cfFormat: Word;
      reco: DWORD; fReally: BOOL; hMetaPict: HGLOBAL): HResult; stdcall;
    function ContextSensitiveHelp(fEnterMode: BOOL): HResult; stdcall;
    function GetClipboardData(const [Ref] chrg: TRTFCharRange; reco: DWORD;
      out dataobj: IDataObject): HResult; stdcall;
    function GetDragDropEffect(fDrag: BOOL; grfKeyState: DWORD;
      var dwEffect: DWORD): HResult; stdcall;
    function GetContextMenu(seltype: Word; const oleobj: IOleObject;
      const [Ref] chrg: TRTFCharRange; out menu: HMENU): HResult; stdcall;
  end;

  TRTFViewerControl = class(TControl)
  private
    FWnd: HWND;
    FParentHWND: HWND;
    FParentSubclassID: UINT_PTR;
    FModule: HMODULE;
    FClassName: string;
    FContent: TBytes;
    FOleCallback: IRichEditOleCallback;
    FScrollBars: TRTFScrollBars;
    FColor: TAlphaColor;
    FBorder: Boolean;
    FAutoOpenLink: Boolean;
    FOnLinkClick: TRTFLinkClickEvent;
    FLastBounds: TRect;
    FHasLastBounds: Boolean;
    FLastRegion: TRect;
    FHasLastRegion: Boolean;
    FNativeVisible: Boolean;
    FUpdatingBounds: Boolean;
    function FindParentForm: TCommonCustomForm;
    procedure EnsureNativeWindow;
    procedure DestroyNativeWindow;
    procedure ParentWindowDestroyed(AParent: HWND);
    procedure UpdateNativeBounds;
    procedure ApplyScrollBars;
    procedure ApplyBackgroundColor;
    procedure ApplyBorder;
    procedure ApplyPadding;
    procedure ApplyAutoURLDetect;
    procedure ApplyContent;
    function StreamIn(AFormat: WPARAM): DWORD;
    function HandleLinkNotify(ALParam: LPARAM): Boolean;
    procedure SetRTFData(const AData: TBytes);
    procedure SetScrollBars(const AValue: TRTFScrollBars);
    procedure SetBackgroundColor(const AValue: TAlphaColor);
    procedure SetBorder(const AValue: Boolean);
    procedure SetAutoOpenLink(const AValue: Boolean);
    procedure OpenLink(const AURL: WideString);
  protected
    procedure Move; override;
    procedure Resize; override;
    procedure Paint; override;
    procedure ParentChanged; override;
    procedure Loaded; override;
    procedure VisibleChanged; override;
    procedure EnabledChanged; override;
    procedure AncestorVisibleChanged(const Visible: Boolean); override;
    procedure AncestorParentChanged; override;
    procedure ClipChildrenChanged; override;
    procedure PaddingChanged; overload; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadFromFile(const AFileName: string);
    procedure SetRTFText(const AValue: WideString);
    procedure SetNativeFocus;
    property ScrollBarsValue: TRTFScrollBars read FScrollBars write SetScrollBars;
    property BackgroundColor: TAlphaColor read FColor write SetBackgroundColor;
    property BorderVisible: Boolean read FBorder write SetBorder;
    property AutoOpenLinks: Boolean read FAutoOpenLink write SetAutoOpenLink;
    property OnLinkClickEvent: TRTFLinkClickEvent read FOnLinkClick write FOnLinkClick;
  end;

function RTFParentSubclassProc(hWnd: HWND; uMsg: UINT; wParam: WPARAM;
  lParam: LPARAM; uIdSubclass: UINT_PTR; dwRefData: DWORD_PTR): LRESULT; stdcall; forward;

function RichEditStreamLoad(dwCookie: DWORD_PTR; pbBuff: PByte;
  cb: Longint; var pcb: Longint): DWORD; stdcall;
var
  LData: PRTFStreamData;
begin
  LData := PRTFStreamData(Pointer(dwCookie));
  pcb := Min(cb, LData^.BytesLeft);
  if pcb > 0 then
  begin
    Move(LData^.Buffer^, pbBuff^, pcb);
    Inc(LData^.Buffer, pcb);
    Dec(LData^.BytesLeft, pcb);
  end;
  Result := 0;
end;

function LoadRichEditModule(out AClassName: string): HMODULE;
var
  LBuffer: array[0..MAX_PATH - 1] of Char;
  LCount: UINT;
  LSystemDir: string;
begin
  Result := 0;
  AClassName := '';

  LCount := GetSystemDirectory(LBuffer, Length(LBuffer));
  if (LCount = 0) or (LCount >= Length(LBuffer)) then
    Exit;

  SetString(LSystemDir, LBuffer, LCount);

  Result := LoadLibrary(PChar(IncludeTrailingPathDelimiter(LSystemDir) +
    'MSFTEDIT.DLL'));
  if Result <> 0 then
  begin
    AClassName := 'RICHEDIT50W';
    Exit;
  end;

  Result := LoadLibrary(PChar(IncludeTrailingPathDelimiter(LSystemDir) +
    'RICHED20.DLL'));
  if Result <> 0 then
    AClassName := 'RichEdit20W';
end;

function RTFCodePage(const AValue: WideString): UINT;
const
  RTFCodePageTag = '\ansicpg';
var
  I, J, LCodePage: Integer;
  LDigits: string;
begin
  Result := GetACP;

  for I := 1 to Length(AValue) - Length(RTFCodePageTag) + 1 do
  begin
    if Copy(AValue, I, Length(RTFCodePageTag)) = RTFCodePageTag then
    begin
      J := I + Length(RTFCodePageTag);
      while (J <= Length(AValue)) and (AValue[J] in ['0'..'9']) do
        Inc(J);

      LDigits := Copy(AValue, I + Length(RTFCodePageTag),
        J - I - Length(RTFCodePageTag));
      if (LDigits <> '') and TryStrToInt(LDigits, LCodePage) and
        (LCodePage > 0) then
        Result := UINT(LCodePage);
      Exit;
    end;
  end;
end;

{ TRTFViewerOleCallback }

function TRTFViewerOleCallback.GetNewStorage(out stg: IStorage): HResult;
var
  LLockBytes: ILockBytes;
begin
  try
    OleCheck(CreateILockBytesOnHGlobal(0, True, LLockBytes));
    OleCheck(StgCreateDocfileOnILockBytes(LLockBytes,
      STGM_READWRITE or STGM_SHARE_EXCLUSIVE or STGM_CREATE, 0, stg));
    Result := S_OK;
  except
    stg := nil;
    Result := E_OUTOFMEMORY;
  end;
end;

function TRTFViewerOleCallback.GetInPlaceContext(out Frame: IOleInPlaceFrame;
  out Doc: IOleInPlaceUIWindow;
  lpFrameInfo: POleInPlaceFrameInfo): HResult;
begin
  Frame := nil;
  Doc := nil;
  Result := E_NOTIMPL;
end;

function TRTFViewerOleCallback.ShowContainerUI(fShow: BOOL): HResult;
begin
  Result := E_NOTIMPL;
end;

function TRTFViewerOleCallback.QueryInsertObject(const clsid: TCLSID;
  const stg: IStorage; cp: Integer): HResult;
begin
  Result := S_OK;
end;

function TRTFViewerOleCallback.DeleteObject(const oleobj: IOleObject): HResult;
begin
  if Assigned(oleobj) then
    oleobj.Close(OLECLOSE_NOSAVE);
  Result := S_OK;
end;

function TRTFViewerOleCallback.QueryAcceptData(const dataobj: IDataObject;
  var cfFormat: Word; reco: DWORD; fReally: BOOL;
  hMetaPict: HGLOBAL): HResult;
begin
  Result := S_OK;
end;

function TRTFViewerOleCallback.ContextSensitiveHelp(fEnterMode: BOOL): HResult;
begin
  Result := S_OK;
end;

function TRTFViewerOleCallback.GetClipboardData(const [Ref] chrg: TRTFCharRange;
  reco: DWORD; out dataobj: IDataObject): HResult;
begin
  dataobj := nil;
  Result := E_NOTIMPL;
end;

function TRTFViewerOleCallback.GetDragDropEffect(fDrag: BOOL;
  grfKeyState: DWORD; var dwEffect: DWORD): HResult;
begin
  Result := E_NOTIMPL;
end;

function TRTFViewerOleCallback.GetContextMenu(seltype: Word;
  const oleobj: IOleObject; const [Ref] chrg: TRTFCharRange;
  out menu: HMENU): HResult;
begin
  menu := 0;
  Result := E_NOTIMPL;
end;

{ TRTFViewerControl }

constructor TRTFViewerControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FScrollBars := rtfScrollVertical;
  FColor := TAlphaColors.White;
  FBorder := True;
  FAutoOpenLink := True;
  FOleCallback := TRTFViewerOleCallback.Create;

  TabStop := True;
  HitTest := True;
end;

destructor TRTFViewerControl.Destroy;
begin
  DestroyNativeWindow;
  FOleCallback := nil;
  FContent := nil;
  inherited Destroy;
end;

function TRTFViewerControl.FindParentForm: TCommonCustomForm;
var
  LObject: TFmxObject;
begin
  Result := nil;
  LObject := Parent;
  while LObject <> nil do
  begin
    if LObject is TCommonCustomForm then
      Exit(TCommonCustomForm(LObject));
    LObject := LObject.Parent;
  end;
end;

procedure TRTFViewerControl.EnsureNativeWindow;
var
  LForm: TCommonCustomForm;
  LPlatformHandle: TWinWindowHandle;
  LNewParent: HWND;
  LStyle, LExStyle: DWORD;
  LError: DWORD;
begin
  LForm := FindParentForm;
  if LForm = nil then
  begin
    DestroyNativeWindow;
    Exit;
  end;

  LForm.HandleNeeded;
  LPlatformHandle := WindowHandleToPlatform(LForm.Handle);
  LNewParent := LPlatformHandle.Wnd;
  if LNewParent = 0 then
    Exit;

  if (FWnd <> 0) and
    ((FParentHWND <> LNewParent) or not IsWindow(FWnd)) then
    DestroyNativeWindow;

  if FWnd <> 0 then
    Exit;

  FModule := LoadRichEditModule(FClassName);
  if FModule = 0 then
    raise Exception.CreateFmt(
      'Unable to load MSFTEDIT.DLL or RICHED20.DLL. Windows error: %d',
      [GetLastError]);

  FParentHWND := LNewParent;
  LStyle := WS_CHILD or WS_TABSTOP or ES_MULTILINE or
    ES_READONLY or ES_NOHIDESEL;

  case FScrollBars of
    rtfScrollVertical:
      LStyle := LStyle or ES_AUTOVSCROLL or WS_VSCROLL;
    rtfScrollHorizontal:
      LStyle := LStyle or ES_AUTOHSCROLL or WS_HSCROLL;
    rtfScrollBoth:
      LStyle := LStyle or ES_AUTOVSCROLL or WS_VSCROLL or
        ES_AUTOHSCROLL or WS_HSCROLL;
  end;

  if FBorder then
    LExStyle := WS_EX_CLIENTEDGE
  else
    LExStyle := 0;

  FWnd := CreateWindowEx(LExStyle, PChar(FClassName), nil, LStyle,
    0, 0, 0, 0, FParentHWND, 0, FModule, nil);

  if FWnd = 0 then
  begin
    LError := GetLastError;
    FreeLibrary(FModule);
    FModule := 0;
    FParentHWND := 0;
    raise Exception.CreateFmt('Unable to create RichEdit window. Windows error: %d',
      [LError]);
  end;

  FParentSubclassID := UINT_PTR(Self);
  if not SetWindowSubclass(FParentHWND, @RTFParentSubclassProc,
    FParentSubclassID, DWORD_PTR(Self)) then
  begin
    LError := GetLastError;
    DestroyWindow(FWnd);
    FWnd := 0;
    FParentHWND := 0;
    FreeLibrary(FModule);
    FModule := 0;
    raise Exception.CreateFmt('Unable to install RichEdit parent hook. Windows error: %d',
      [LError]);
  end;

  if Assigned(FOleCallback) then
    SendMessage(FWnd, RTF_EM_SETOLECALLBACK, 0,
      LPARAM(Pointer(FOleCallback)));

  SendMessage(FWnd, RTF_EM_EXLIMITTEXT, 0, LPARAM($7FFFFFFE));
  SendMessage(FWnd, RTF_EM_SETREADONLY, 1, 0);

  ApplyBackgroundColor;
  ApplyAutoURLDetect;
  ApplyContent;
  UpdateNativeBounds;
end;

procedure TRTFViewerControl.DestroyNativeWindow;
begin
  if (FParentHWND <> 0) and IsWindow(FParentHWND) and
    (FParentSubclassID <> 0) then
    RemoveWindowSubclass(FParentHWND, @RTFParentSubclassProc,
      FParentSubclassID);

  if (FWnd <> 0) and IsWindow(FWnd) then
    DestroyWindow(FWnd);

  FWnd := 0;
  FParentHWND := 0;
  FParentSubclassID := 0;

  if FModule <> 0 then
  begin
    FreeLibrary(FModule);
    FModule := 0;
  end;

  FHasLastBounds := False;
  FHasLastRegion := False;
  FNativeVisible := False;
end;

procedure TRTFViewerControl.ParentWindowDestroyed(AParent: HWND);
begin
  if FParentHWND <> AParent then
    Exit;

  if (FWnd <> 0) and IsWindow(FWnd) then
    DestroyWindow(FWnd);

  FParentHWND := 0;
  FWnd := 0;
  FParentSubclassID := 0;

  if FModule <> 0 then
  begin
    FreeLibrary(FModule);
    FModule := 0;
  end;

  FHasLastBounds := False;
  FHasLastRegion := False;
  FNativeVisible := False;
end;

procedure TRTFViewerControl.UpdateNativeBounds;
var
  LForm: TCommonCustomForm;
  LPlatformHandle: TWinWindowHandle;
  LRect, LClipRect: TRectF;
  LWndRect, LWndClipRect: TRectF;
  LBounds, LRegion: TRect;
  LWidth, LHeight: Integer;
  LRegionHandle: HRGN;
  LNeedRegion, LBoundsChanged: Boolean;
begin
  if FUpdatingBounds then
    Exit;

  FUpdatingBounds := True;
  try
    EnsureNativeWindow;
    if (FWnd = 0) or (FParentHWND = 0) then
      Exit;

    if not Visible or not ParentedVisible then
    begin
      if FNativeVisible then
        ShowWindow(FWnd, SW_HIDE);
      FNativeVisible := False;
      Exit;
    end;

    LForm := FindParentForm;
    if LForm = nil then
      Exit;

    LPlatformHandle := WindowHandleToPlatform(LForm.Handle);
    LScale := LPlatformHandle.Scale;
    if LScale <= 0 then
      LScale := 1;

    LRect := AbsoluteRect;
    LClipRect := AbsoluteClipRect;

    LClipRect.Left := Max(LClipRect.Left, LRect.Left);
    LClipRect.Top := Max(LClipRect.Top, LRect.Top);
    LClipRect.Right := Min(LClipRect.Right, LRect.Right);
    LClipRect.Bottom := Min(LClipRect.Bottom, LRect.Bottom);

    if (LClipRect.Right <= LClipRect.Left) or
      (LClipRect.Bottom <= LClipRect.Top) then
    begin
      if FNativeVisible then
        ShowWindow(FWnd, SW_HIDE);
      FNativeVisible := False;
      Exit;
    end;

    LWndRect := LPlatformHandle.FormToWnd(LRect);
    LWndClipRect := LPlatformHandle.FormToWnd(LClipRect);

    LBounds := Rect(
      Round(LWndRect.Left),
      Round(LWndRect.Top),
      Round(LWndRect.Right),
      Round(LWndRect.Bottom));

    LWidth := LBounds.Right - LBounds.Left;
    LHeight := LBounds.Bottom - LBounds.Top;

    if (LWidth <= 0) or (LHeight <= 0) then
    begin
      if FNativeVisible then
        ShowWindow(FWnd, SW_HIDE);
      FNativeVisible := False;
      Exit;
    end;

    LBoundsChanged := not FHasLastBounds or
      not EqualRect(FLastBounds, LBounds);

    if LBoundsChanged then
    begin
      SetWindowPos(FWnd, 0, LBounds.Left, LBounds.Top, LWidth, LHeight,
        SWP_NOZORDER or SWP_NOACTIVATE);
      FLastBounds := LBounds;
      FHasLastBounds := True;
      ApplyPadding;
    end;

    LRegion := Rect(
      EnsureRange(Round(LWndClipRect.Left - LWndRect.Left), 0, LWidth),
      EnsureRange(Round(LWndClipRect.Top - LWndRect.Top), 0, LHeight),
      EnsureRange(Round(LWndClipRect.Right - LWndRect.Left), 0, LWidth),
      EnsureRange(Round(LWndClipRect.Bottom - LWndRect.Top), 0, LHeight));

    LNeedRegion := (LRegion.Left <> 0) or (LRegion.Top <> 0) or
      (LRegion.Right <> LWidth) or (LRegion.Bottom <> LHeight);

    if LNeedRegion then
    begin
      if not FHasLastRegion or not EqualRect(FLastRegion, LRegion) then
      begin
        LRegionHandle := CreateRectRgn(LRegion.Left, LRegion.Top,
          LRegion.Right, LRegion.Bottom);
        if LRegionHandle <> 0 then
        begin
          if SetWindowRgn(FWnd, LRegionHandle, True) <> 0 then
          begin
            FLastRegion := LRegion;
            FHasLastRegion := True;
          end
          else
            DeleteObject(LRegionHandle);
        end;
      end;
    end
    else if FHasLastRegion then
    begin
      SetWindowRgn(FWnd, 0, True);
      FHasLastRegion := False;
    end;

    EnableWindow(FWnd, AbsoluteEnabled);
    if not FNativeVisible then
    begin
      ShowWindow(FWnd, SW_SHOWNOACTIVATE);
      FNativeVisible := True;
    end;
  finally
    FUpdatingBounds := False;
  end;
end;

procedure TRTFViewerControl.ApplyScrollBars;
var
  LStyle: LONG_PTR;
begin
  if FWnd = 0 then
    Exit;

  LStyle := GetWindowLongPtr(FWnd, GWL_STYLE);
  LStyle := LStyle and not (WS_VSCROLL or WS_HSCROLL or
    ES_AUTOVSCROLL or ES_AUTOHSCROLL);

  case FScrollBars of
    rtfScrollVertical:
      LStyle := LStyle or ES_AUTOVSCROLL or WS_VSCROLL;
    rtfScrollHorizontal:
      LStyle := LStyle or ES_AUTOHSCROLL or WS_HSCROLL;
    rtfScrollBoth:
      LStyle := LStyle or ES_AUTOVSCROLL or WS_VSCROLL or
        ES_AUTOHSCROLL or WS_HSCROLL;
  end;

  SetWindowLongPtr(FWnd, GWL_STYLE, LStyle);
  SetWindowPos(FWnd, 0, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or
    SWP_NOZORDER or SWP_NOACTIVATE or SWP_FRAMECHANGED);
end;

procedure TRTFViewerControl.ApplyBackgroundColor;
var
  LColorRef: COLORREF;
begin
  if FWnd = 0 then
    Exit;

  LColorRef :=
    COLORREF(Byte(FColor shr 16)) or
    (COLORREF(Byte(FColor shr 8)) shl 8) or
    (COLORREF(Byte(FColor)) shl 16);

  SendMessage(FWnd, RTF_EM_SETBKGNDCOLOR, 0, LPARAM(LColorRef));
end;

procedure TRTFViewerControl.ApplyBorder;
var
  LExStyle: LONG_PTR;
begin
  if FWnd = 0 then
    Exit;

  LExStyle := GetWindowLongPtr(FWnd, GWL_EXSTYLE);
  if FBorder then
    LExStyle := LExStyle or WS_EX_CLIENTEDGE
  else
    LExStyle := LExStyle and not WS_EX_CLIENTEDGE;

  SetWindowLongPtr(FWnd, GWL_EXSTYLE, LExStyle);
  SetWindowPos(FWnd, 0, 0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER or SWP_NOACTIVATE or
    SWP_FRAMECHANGED);
end;

procedure TRTFViewerControl.ApplyPadding;
var
  LForm: TCommonCustomForm;
  LPlatformHandle: TWinWindowHandle;
  LScale: Single;
  LRect: TRect;
begin
  if FWnd = 0 then
    Exit;

  if not GetClientRect(FWnd, LRect) then
    Exit;

  LForm := FindParentForm;
  if LForm <> nil then
  begin
    LPlatformHandle := WindowHandleToPlatform(LForm.Handle);
    LScale := LPlatformHandle.Scale;
    if LScale <= 0 then
      LScale := 1;
  end
  else
    LScale := 1;

  Inc(LRect.Left, Round(Padding.Left * LScale));
  Inc(LRect.Top, Round(Padding.Top * LScale));
  Dec(LRect.Right, Round(Padding.Right * LScale));
  Dec(LRect.Bottom, Round(Padding.Bottom * LScale));

  if LRect.Right < LRect.Left then
    LRect.Right := LRect.Left;
  if LRect.Bottom < LRect.Top then
    LRect.Bottom := LRect.Top;

  SendMessage(FWnd, RTF_EM_SETRECT, 0, LPARAM(@LRect));
  InvalidateRect(FWnd, nil, True);
end;

procedure TRTFViewerControl.ApplyAutoURLDetect;
var
  LMask: LRESULT;
begin
  if FWnd = 0 then
    Exit;

  LMask := SendMessage(FWnd, RTF_EM_GETEVENTMASK, 0, 0);
  if FAutoOpenLink or Assigned(FOnLinkClick) then
    LMask := LMask or RTF_ENM_LINK
  else
    LMask := LMask and not RTF_ENM_LINK;

  SendMessage(FWnd, RTF_EM_SETEVENTMASK, 0, LMask);
  SendMessage(FWnd, RTF_EM_AUTOURLDETECT,
    WPARAM(FAutoOpenLink or Assigned(FOnLinkClick)), 0);
end;

function TRTFViewerControl.StreamIn(AFormat: WPARAM): DWORD;
var
  LData: TRTFStreamData;
  LEditStream: TRTFEditStream;
  LByteOrderMark: Word;
begin
  if (FWnd = 0) or (Length(FContent) = 0) then
    Exit(0);

  LData.Buffer := @FContent[0];
  LData.BytesLeft := Length(FContent);

  if (AFormat and RTF_SF_TEXT <> 0) and
    (LData.BytesLeft >= SizeOf(LByteOrderMark)) then
  begin
    Move(LData.Buffer^, LByteOrderMark, SizeOf(LByteOrderMark));
    if LByteOrderMark = $FEFF then
    begin
      AFormat := AFormat or RTF_SF_UNICODE;
      Inc(LData.Buffer, SizeOf(LByteOrderMark));
      Dec(LData.BytesLeft, SizeOf(LByteOrderMark));
    end;
  end;

  ZeroMemory(@LEditStream, SizeOf(LEditStream));
  LEditStream.dwCookie := DWORD_PTR(@LData);
  LEditStream.pfnCallback := RichEditStreamLoad;

  SendMessage(FWnd, RTF_EM_STREAMIN, AFormat, LPARAM(@LEditStream));
  Result := LEditStream.dwError;
end;

procedure TRTFViewerControl.ApplyContent;
var
  LEmpty: string;
begin
  if FWnd = 0 then
    Exit;

  if Length(FContent) = 0 then
  begin
    LEmpty := '';
    SendMessage(FWnd, WM_SETTEXT, 0, LPARAM(PWideChar(LEmpty)));
    Exit;
  end;

  SendMessage(FWnd, RTF_EM_EXLIMITTEXT, 0, LPARAM($7FFFFFFE));
  if StreamIn(RTF_SF_RTF) <> 0 then
    StreamIn(RTF_SF_TEXT);

  SendMessage(FWnd, EM_SETSEL, 0, 0);
  InvalidateRect(FWnd, nil, True);
end;

procedure TRTFViewerControl.SetRTFData(const AData: TBytes);
begin
  FContent := Copy(AData);
  ApplyContent;
end;

procedure TRTFViewerControl.LoadFromFile(const AFileName: string);
var
  LStream: TFileStream;
  LData: TBytes;
  LSize: Int64;
begin
  LStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  try
    LSize := LStream.Size;
    if LSize > High(Integer) then
      raise Exception.Create('RTF file is too large');

    SetLength(LData, Integer(LSize));
    if LSize > 0 then
      LStream.ReadBuffer(LData[0], Integer(LSize));
    SetRTFData(LData);
  finally
    LStream.Free;
  end;
end;

procedure TRTFViewerControl.SetRTFText(const AValue: WideString);
var
  LCodePage: UINT;
  LByteCount: Integer;
  LData: TBytes;
begin
  if AValue = '' then
  begin
    SetRTFData(nil);
    Exit;
  end;

  LCodePage := RTFCodePage(AValue);
  LByteCount := WideCharToMultiByte(LCodePage, 0, PWideChar(AValue),
    Length(AValue), nil, 0, nil, nil);
  if LByteCount <= 0 then
    RaiseLastOSError;

  SetLength(LData, LByteCount);
  if WideCharToMultiByte(LCodePage, 0, PWideChar(AValue),
    Length(AValue), PAnsiChar(@LData[0]), LByteCount, nil, nil) = 0 then
    RaiseLastOSError;

  SetRTFData(LData);
end;

procedure TRTFViewerControl.SetScrollBars(const AValue: TRTFScrollBars);
begin
  if FScrollBars = AValue then
    Exit;
  FScrollBars := AValue;
  ApplyScrollBars;
end;

procedure TRTFViewerControl.SetBackgroundColor(const AValue: TAlphaColor);
begin
  if FColor = AValue then
    Exit;
  FColor := AValue;
  ApplyBackgroundColor;
end;

procedure TRTFViewerControl.SetBorder(const AValue: Boolean);
begin
  if FBorder = AValue then
    Exit;
  FBorder := AValue;
  ApplyBorder;
end;

procedure TRTFViewerControl.SetAutoOpenLink(const AValue: Boolean);
begin
  if FAutoOpenLink = AValue then
    Exit;
  FAutoOpenLink := AValue;
  ApplyAutoURLDetect;
end;

procedure TRTFViewerControl.OpenLink(const AURL: WideString);
begin
  if Assigned(FOnLinkClick) then
    FOnLinkClick(Self, AURL)
  else
    ShellExecuteW(FParentHWND, 'open', PWideChar(AURL), nil, nil,
      SW_SHOWNORMAL);
end;

function TRTFViewerControl.HandleLinkNotify(ALParam: LPARAM): Boolean;
var
  LLink: PRTFEnLink;
  LTextRange: TRTFTextRange;
  LURL: WideString;
  LLength: Integer;
begin
  Result := False;
  if (not FAutoOpenLink and not Assigned(FOnLinkClick)) or
    (FWnd = 0) or (ALParam = 0) then
    Exit;

  LLink := PRTFEnLink(Pointer(ALParam));
  if (LLink^.nmhdr.hwndFrom <> FWnd) or
    (LLink^.nmhdr.code <> RTF_EN_LINK) or
    (LLink^.msg <> WM_LBUTTONUP) then
    Exit;

  LLength := LLink^.chrg.cpMax - LLink^.chrg.cpMin;
  if (LLength <= 0) or (LLength > 32767) then
  begin
    Result := True;
    Exit;
  end;

  SetLength(LURL, LLength);
  LTextRange.chrg := LLink^.chrg;
  LTextRange.lpstrText := PWideChar(LURL);
  LLength := SendMessage(FWnd, RTF_EM_GETTEXTRANGE, 0,
    LPARAM(@LTextRange));

  if (LLength > 0) and (LLength <= Length(LURL)) then
  begin
    SetLength(LURL, LLength);
    if Assigned(FOnLinkClick) then
      FOnLinkClick(Self, LURL)
    else if FAutoOpenLink then
      OpenLink(LURL);
  end;

  Result := True;
end;

procedure TRTFViewerControl.SetNativeFocus;
begin
  if FWnd <> 0 then
    Winapi.Windows.SetFocus(FWnd);
end;

procedure TRTFViewerControl.Move;
begin
  inherited;
  UpdateNativeBounds;
end;

procedure TRTFViewerControl.Resize;
begin
  inherited;
  UpdateNativeBounds;
end;

procedure TRTFViewerControl.Paint;
begin
  UpdateNativeBounds;
  inherited;
end;

procedure TRTFViewerControl.ParentChanged;
begin
  inherited;
  if Parent = nil then
    DestroyNativeWindow
  else
    UpdateNativeBounds;
end;

procedure TRTFViewerControl.Loaded;
begin
  inherited;
  UpdateNativeBounds;
end;

procedure TRTFViewerControl.VisibleChanged;
begin
  inherited;
  UpdateNativeBounds;
end;

procedure TRTFViewerControl.EnabledChanged;
begin
  inherited;
  UpdateNativeBounds;
end;

procedure TRTFViewerControl.AncestorVisibleChanged(const Visible: Boolean);
begin
  inherited;
  UpdateNativeBounds;
end;

procedure TRTFViewerControl.AncestorParentChanged;
begin
  inherited;
  UpdateNativeBounds;
end;

procedure TRTFViewerControl.ClipChildrenChanged;
begin
  inherited;
  UpdateNativeBounds;
end;

procedure TRTFViewerControl.PaddingChanged;
begin
  inherited;
  ApplyPadding;
end;

function RTFParentSubclassProc(hWnd: HWND; uMsg: UINT; wParam: WPARAM;
  lParam: LPARAM; uIdSubclass: UINT_PTR; dwRefData: DWORD_PTR): LRESULT; stdcall;
var
  LControl: TRTFViewerControl;
begin
  LControl := TRTFViewerControl(Pointer(dwRefData));

  if (uMsg = WM_NOTIFY) and (LControl <> nil) and
    LControl.HandleLinkNotify(lParam) then
    Exit(0);

  if uMsg = WM_NCDESTROY then
  begin
    RemoveWindowSubclass(hWnd, @RTFParentSubclassProc, uIdSubclass);
    if LControl <> nil then
      LControl.ParentWindowDestroyed(hWnd);
  end;

  Result := DefSubclassProc(hWnd, uMsg, wParam, lParam);

  if (LControl <> nil) and
    not (uMsg in [WM_NCDESTROY, WM_SIZE, WM_MOVE, WM_WINDOWPOSCHANGED,
      WM_SHOWWINDOW, RTF_WM_DPICHANGED]) then
    Exit;

  if (LControl <> nil) and
    (uMsg in [WM_SIZE, WM_MOVE, WM_WINDOWPOSCHANGED,
      WM_SHOWWINDOW, RTF_WM_DPICHANGED]) then
    LControl.UpdateNativeBounds;
end;

{ TFRTFViewer }

function TFRTFViewer.GetControl: TControl;
begin
  if FControl = nil then
    raise Exception.Create('RTF viewer has not been created. Call FCreate first');
  Result := FControl;
end;

procedure TFRTFViewer.FCreate(FParent: TFmxObject);
begin
  if FParent = nil then
    raise EArgumentNilException.Create('FParent');

  if FControl <> nil then
  begin
    FControl.Parent := nil;
    FControl.Free;
  end;

  FControl := TRTFViewerControl.Create(nil);
  FControl.Parent := FParent;
end;

procedure TFRTFViewer.Left(FLeft: Single);
begin
  GetControl.Position.X := FLeft;
end;

procedure TFRTFViewer.Top(FTop: Single);
begin
  GetControl.Position.Y := FTop;
end;

procedure TFRTFViewer.Height(FHeight: Single);
begin
  GetControl.Height := FHeight;
end;

procedure TFRTFViewer.Width(FWidth: Single);
begin
  GetControl.Width := FWidth;
end;

procedure TFRTFViewer.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  GetControl.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFRTFViewer.Position(X, Y: Single);
begin
  GetControl.Position.Point := PointF(X, Y);
end;

procedure TFRTFViewer.Align(Al: TAlignLayout);
begin
  GetControl.Align := Al;
end;

procedure TFRTFViewer.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  GetControl.Margins.Left := FLeft;
  GetControl.Margins.Top := FTop;
  GetControl.Margins.Right := FRight;
  GetControl.Margins.Bottom := FBottom;
end;

procedure TFRTFViewer.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  GetControl.Padding.Left := FLeft;
  GetControl.Padding.Top := FTop;
  GetControl.Padding.Right := FRight;
  GetControl.Padding.Bottom := FBottom;
end;

procedure TFRTFViewer.SetClipParent(FValue: Boolean);
begin
  GetControl.ClipParent := FValue;
  TRTFViewerControl(GetControl).UpdateNativeBounds;
end;

procedure TFRTFViewer.SetClipChildren(FValue: Boolean);
begin
  GetControl.ClipChildren := FValue;
  TRTFViewerControl(GetControl).UpdateNativeBounds;
end;

procedure TFRTFViewer.BringToFront;
var
  LWnd: HWND;
begin
  GetControl.BringToFront;
  LWnd := TRTFViewerControl(GetControl).FWnd;
  if LWnd <> 0 then
    SetWindowPos(LWnd, HWND_TOP, 0, 0, 0, 0,
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
end;

procedure TFRTFViewer.SendToBack;
var
  LWnd: HWND;
begin
  GetControl.SendToBack;
  LWnd := TRTFViewerControl(GetControl).FWnd;
  if LWnd <> 0 then
    SetWindowPos(LWnd, HWND_BOTTOM, 0, 0, 0, 0,
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
end;

procedure TFRTFViewer.SetTag(FTag: Integer);
begin
  GetControl.Tag := FTag;
end;

procedure TFRTFViewer.LoadFromFile(const AFileName: WideString);
begin
  TRTFViewerControl(GetControl).LoadFromFile(string(AFileName));
end;

procedure TFRTFViewer.RTFText(const AValue: WideString);
begin
  TRTFViewerControl(GetControl).SetRTFText(AValue);
end;

procedure TFRTFViewer.ScrollBars(AValue: TRTFScrollBars);
begin
  TRTFViewerControl(GetControl).ScrollBarsValue := AValue;
end;

procedure TFRTFViewer.Color(AValue: TAlphaColor);
begin
  TRTFViewerControl(GetControl).BackgroundColor := AValue;
end;

procedure TFRTFViewer.Border(AValue: Boolean);
begin
  TRTFViewerControl(GetControl).BorderVisible := AValue;
end;

procedure TFRTFViewer.AutoOpenLink(AValue: Boolean);
begin
  TRTFViewerControl(GetControl).AutoOpenLinks := AValue;
end;

procedure TFRTFViewer.OnLinkClick(Event: TRTFLinkClickEvent);
begin
  TRTFViewerControl(GetControl).OnLinkClickEvent := Event;
  TRTFViewerControl(GetControl).ApplyAutoURLDetect;
end;

procedure TFRTFViewer.Visible(AValue: Boolean);
begin
  GetControl.Visible := AValue;
end;

procedure TFRTFViewer.Enabled(AValue: Boolean);
begin
  GetControl.Enabled := AValue;
end;

procedure TFRTFViewer.SetFocus;
begin
  TRTFViewerControl(GetControl).SetNativeFocus;
end;

function TFRTFViewer.GetTag: Integer;
begin
  Result := GetControl.Tag;
end;

function TFRTFViewer.GetLeft: Single;
begin
  Result := GetControl.Position.X;
end;

function TFRTFViewer.GetTop: Single;
begin
  Result := GetControl.Position.Y;
end;

function TFRTFViewer.GetWidth: Single;
begin
  Result := GetControl.Width;
end;

function TFRTFViewer.GetHeight: Single;
begin
  Result := GetControl.Height;
end;

function TFRTFViewer.GetObject: TFmxObject;
begin
  Result := GetControl;
end;

function TFRTFViewer.Handle: TFmxObject;
begin
  Result := GetControl;
end;

function InitRTFViewerHandle: FRTFViewer;
begin
  Result := TFRTFViewer.Create;
end;

exports
  InitRTFViewerHandle;

end.
