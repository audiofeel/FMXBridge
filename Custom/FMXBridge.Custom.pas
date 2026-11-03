
unit FMXBridge.Custom;

interface

uses
  System.Classes, System.UITypes,  System.Types, System.Generics.Collections,
  FMX.Layouts, FMX.Graphics, FMX.Types, FMX.Objects, FMX.TreeView,
  FMX.StdCtrls, FMX.Controls, FMX.Styles.Objects, FMX.Ani;

// =============================================================================
// FPageItem
// =============================================================================
type
  TPageItem = class(TLayout)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  FPageItem = interface(IUnknown)
    ['{7A4E7C8A-0E42-4E4D-B5B2-2F2D8B9A1C01}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure SetFocus; stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FValue: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFPageItem = class(TInterfacedObject, FPageItem)
  private
    ControlItem: TPageItem;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure SetFocus; stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FValue: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FPageControl
// =============================================================================
type
  TPageDirection = (pdNone, pdHorizontal, pdVertical, pdFade);
  TPageMove      = (pmNormal, pmReverse);

  TPageHost = class(TLayout)
  private
    FPages: TList<TPageItem>;
    FActivePage: Integer;
    FOldAnimation: TFloatAnimation;
    FNewAnimation: TFloatAnimation;
    FAnimating: Boolean;
    FOldPage: TPageItem;
    FNewPage: TPageItem;
    FDuration: Single;
    FDirection: TPageDirection;
    FInterpolation: TInterpolationType;
    FOnChange: TNotifyEvent;
    procedure NextPage(Move: TPageMove);
    procedure BackPage(Move: TPageMove);
    procedure FirstPage(Move: TPageMove);
    procedure LastPage(Move: TPageMove);
    procedure RegisterPage(AItem: TPageItem);
    procedure StartFade;
    procedure StartSlideX(OldStart, OldStop, NewStart, NewStop: Single);
    procedure StartSlideY(OldStart, OldStop, NewStart, NewStop: Single);
    procedure UpdateEffectsRecursive(AObject: TFmxObject);
    procedure AnimationProcess(Sender: TObject);
    procedure AnimationFinish(Sender: TObject);
    function IsActivePage(Index: Integer): Boolean;
    function ActivePageIndex: Integer;
  protected
    procedure DoAddObject(const AObject: TFmxObject); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SwitchPage(Index: Integer; Move: TPageMove); overload;
    procedure SwitchPage(Index: Integer; Move: TPageMove;
      ADirection: TPageDirection); overload;
  end;

  FPageControl = interface(IUnknown)
    ['{B2A6D2A4-0F9B-4B17-AF43-3D7E4A11C101}']
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
    procedure ActivePage(FIndex: Integer; FMove: TPageMove); stdcall;
    procedure ActivePageEx(FIndex: Integer; FMove: TPageMove;
      FDirection: TPageDirection); stdcall;
    procedure NextPage(FMove: TPageMove); stdcall;
    procedure BackPage(FMove: TPageMove); stdcall;
    procedure FirstPage(FMove: TPageMove); stdcall;
    procedure LastPage(FMove: TPageMove); stdcall;
    procedure Duration(FDuration: Single); stdcall;
    procedure Direction(FDirect: TPageDirection); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FValue: Boolean); stdcall;
    function IsActivePage(FIndex: Integer): Boolean; stdcall;
    function ActivePageIndex: Integer; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFPageControl = class(TInterfacedObject, FPageControl)
  private
    ControlPage: TPageHost;
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
    procedure ActivePage(FIndex: Integer; FMove: TPageMove); stdcall;
    procedure ActivePageEx(FIndex: Integer; FMove: TPageMove;
      FDirection: TPageDirection); stdcall;
    procedure NextPage(FMove: TPageMove); stdcall;
    procedure BackPage(FMove: TPageMove); stdcall;
    procedure FirstPage(FMove: TPageMove); stdcall;
    procedure LastPage(FMove: TPageMove); stdcall;
    procedure Duration(FDuration: Single); stdcall;
    procedure Direction(FDirect: TPageDirection); stdcall;
    procedure Interpolation(FInterpolation: TInterpolationType); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FValue: Boolean); stdcall;
    function IsActivePage(FIndex: Integer): Boolean; stdcall;
    function ActivePageIndex: Integer; stdcall;
    procedure OnChange(Event: TNotifyEvent); stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FTile
// =============================================================================
type
  FTile = interface(IUnknown)
    ['{0669FD3A-DBAB-4AA9-890A-BC1BFD47EE09}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure TileColor(FColor: TAlphaColor); stdcall;
    procedure TilePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure TileStrokeColor(FColor: TAlphaColor); stdcall;
    procedure TileThickness(FThickness: Single); stdcall;
    procedure TileCurve(XRadi, YRadi: Single); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure TextBackColor(FColor: TAlphaColor); stdcall;
    procedure TextColor(FontColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFTile = class(TInterfacedObject, FTile)
  private
    FBackTiles: TRectangle;
    FTiles: TRectangle;
    FBackCaption: TRectangle;
    FCaption: TText;
    FStrokeColor: TAlphaColor;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    procedure InternalMouseEnter(Sender: TObject);
    procedure InternalMouseLeave(Sender: TObject);
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure TileColor(FColor: TAlphaColor); stdcall;
    procedure TilePicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure TileStrokeColor(FColor: TAlphaColor); stdcall;
    procedure TileThickness(FThickness: Single); stdcall;
    procedure TileCurve(XRadi, YRadi: Single); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure TextBackColor(FColor: TAlphaColor); stdcall;
    procedure TextColor(FontColor: TAlphaColor); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FUWPTiles
// =============================================================================
type
  FUWPTiles = interface(IUnknown)
    ['{E2738C2C-0B81-42C1-96FC-FB4BA872467E}']
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
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    function AddTile(const FImage, FTitle, FText: WideString;
      FWidth, FHeight: Single; Rounded: Boolean): TFmxObject; stdcall;
    procedure Offset(X, Y: Single); stdcall;
    procedure TileFillColor(FTile: TFmxObject; FColor: TAlphaColor); stdcall;
    procedure TileFillPicture(FTile: TFmxObject; const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure TileBorderColor(FTile: TFmxObject; FColor: TAlphaColor); stdcall;
    procedure TileBorderThickness(FTile: TFmxObject;
      FThickness: Single); stdcall;
    procedure TileCornerStyle(FTile: TFmxObject; XRadi, YRadi: Single;
      FCorners: TCorners; FCornerType: TCornerType); stdcall;
    procedure TileTitleFontSetting(FTile: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor); stdcall;
    procedure TileTextFontSetting(FTile: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor); stdcall;
    procedure TileEnabled(FTile: TFmxObject; FEnable: Boolean); stdcall;
    procedure TileVisible(FTile: TFmxObject; FVisible: Boolean); stdcall;
    procedure TileOnClick(FTile: TFmxObject; Event: TNotifyEvent); stdcall;
    function TileGetObject(FTile: TFmxObject): TFmxObject; stdcall;
    function TileHandle(FTile: TFmxObject): TFmxObject; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFUWPTiles = class(TInterfacedObject, FUWPTiles)
  private
    FScrollBox: TVertScrollBox;
    FTiles: TObjectList<TRectangle>;
    FTileBasePos: TDictionary<TRectangle, TPointF>;
    FTileTitles: TDictionary<TRectangle, TLabel>;
    FTileTexts: TDictionary<TRectangle, TLabel>;
    FTimer: TTimer;
    FOffsetX, FOffsetY, FStroke: Single;
    procedure OnTimer(Sender: TObject);
    procedure DoTilePaint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure DoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure DoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure RecalcPositions;
  public
    constructor Create;
    destructor Destroy; override;

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
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    function AddTile(const FImage, FTitle, FText: WideString;
      FWidth, FHeight: Single; Rounded: Boolean): TFmxObject; stdcall;
    procedure Offset(X, Y: Single); stdcall;
    procedure TileFillColor(FTile: TFmxObject; FColor: TAlphaColor); stdcall;
    procedure TileFillPicture(FTile: TFmxObject; const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure TileBorderColor(FTile: TFmxObject; FColor: TAlphaColor); stdcall;
    procedure TileBorderThickness(FTile: TFmxObject;
      FThickness: Single); stdcall;
    procedure TileCornerStyle(FTile: TFmxObject; XRadi, YRadi: Single;
      FCorners: TCorners; FCornerType: TCornerType); stdcall;
    procedure TileTitleFontSetting(FTile: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor); stdcall;
    procedure TileTextFontSetting(FTile: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor); stdcall;
    procedure TileEnabled(FTile: TFmxObject; FEnable: Boolean); stdcall;
    procedure TileVisible(FTile: TFmxObject; FVisible: Boolean); stdcall;
    procedure TileOnClick(FTile: TFmxObject; Event: TNotifyEvent); stdcall;
    function TileGetObject(FTile: TFmxObject): TFmxObject; stdcall;
    function TileHandle(FTile: TFmxObject): TFmxObject; stdcall;
    procedure BeginUpdate; stdcall;
    procedure EndUpdate; stdcall;
    procedure RecalcSize; stdcall;
    procedure Repaint; stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FRatingBar
// =============================================================================
type
  FRatingBar = interface(IUnknown)
    ['{0B4CCA3E-506B-4F0D-87D6-2D84D7C6FFA3}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ActiveColor(FColor: TAlphaColor); stdcall;
    procedure InActiveColor(FColor: TAlphaColor); stdcall;
    procedure Count(ACount: Integer); stdcall;
    procedure Maximum(FMax: Single); stdcall;
    procedure Space(ASpace: Single); stdcall;
    procedure Value(AValue: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFRatingBar = class(TInterfacedObject, FRatingBar)
  private
    FLayer: TLayout;
    FControl: TShape;
    FCount: Integer;
    FMaximum: Single;
    FValue: Single;
    FSpace: Single;
    FActiveColor: TAlphaColor;
    FInActiveColor: TAlphaColor;
    FPath: TPathData;
    FActiveBrush: TBrush;
    FInActiveBrush: TBrush;
    procedure CreateBrush;
    procedure FreeBrush;
    procedure DoPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure DrawStar(Canvas: TCanvas; const R: TRectF; AValue: Single);
  public
    constructor Create;
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ActiveColor(FColor: TAlphaColor); stdcall;
    procedure InActiveColor(FColor: TAlphaColor); stdcall;
    procedure Count(ACount: Integer); stdcall;
    procedure Maximum(FMax: Single); stdcall;
    procedure Space(ASpace: Single); stdcall;
    procedure Value(AValue: Single); stdcall;
    procedure StrokeColor(FColor: TAlphaColor); stdcall;
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FMarquee
// =============================================================================
type
  TMarqueeAnimation = class(TAnimation)
  protected
    procedure ProcessAnimation; override;
  end;

  FMarquee = interface(IUnknown)
    ['{D4BED024-0FDC-40F1-88E4-C6F02A586662}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure Text(FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure Speed(FValue: Single); stdcall;
    procedure Direction(FValue: Integer); stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFMarquee = class(TInterfacedObject, FMarquee)
  private
    Layout: TLayout;
    Text1: TText;
    Text2: TText;
    FAnimation: TMarqueeAnimation;
    FSpeed: Single;
    FDirection: Integer;
    FGap: Single;
    FX1, FX2: Single;
    procedure AnimationProcess(Sender: TObject);
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure Text(FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure Speed(FValue: Single); stdcall;
    procedure Direction(FValue: Integer); stdcall;
    procedure Start; stdcall;
    procedure Stop; stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FCheckBoxTree
// =============================================================================
type
  FCheckBoxTree = interface(IUnknown)
    ['{C6CAC4B7-8F40-4DF1-98C8-364E72EAD1EA}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ScrollAnimation(FEnable: Boolean); stdcall;
    procedure ShowScrollBars(FShow: Boolean); stdcall;
    function AddEmptySection(FParent: TFmxObject; const FText: WideString)
      : TFmxObject; stdcall;
    function AddCheckBoxSection(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString; var CheckBoxHandle: TFmxObject)
      : TFmxObject; stdcall;
    function AddCheckBox(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject; stdcall;
    function AddRadioBtn(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject; stdcall;
    procedure CheckBoxSetChecked(FHandle: TFmxObject;
      FChecked: Boolean); stdcall;
    procedure RadioBtnSetChecked(FHandle: TFmxObject;
      FChecked: Boolean); stdcall;
    procedure RadioBtnGroupName(FHandle: TFmxObject;
      FGroupName: WideString); stdcall;
    procedure SectionFontSetting(FHandle: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor); stdcall;
    procedure CheckBoxFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure RadioBtnFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure SectionExpand(FHandle: TFmxObject); stdcall;
    procedure SectionExpandAll(FHandle: TFmxObject); stdcall;
    procedure SectionCollapse(FHandle: TFmxObject); stdcall;
    procedure SectionCollapseAll(FHandle: TFmxObject); stdcall;
    procedure SectionEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure CheckBoxEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure RadioBtnEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure AlternatingRowBackground(FValue: Boolean); stdcall;
    procedure RemoveBackground; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure DisableFocusEffect(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure ReFresh; stdcall;
    procedure ItemOnMouseEnter(FHandle: TFmxObject;
      Event: TNotifyEvent); stdcall;
    procedure ItemOnMouseLeave(FHandle: TFmxObject;
      Event: TNotifyEvent); stdcall;
    procedure ItemOnChange(FHandle: TFmxObject; Event: TNotifyEvent); stdcall;
    function CheckBoxGetChecked(FHandle: TFmxObject): Boolean; stdcall;
    function RadioBtnGetChecked(FHandle: TFmxObject): Boolean; stdcall;
    function GetText(FHandle: TFmxObject): WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetObjectCheckBox(FHandle: TFmxObject): TFmxObject; stdcall;
    function GetObjectRadioBtn(FHandle: TFmxObject): TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

type
  TFCheckBoxTree = class(TInterfacedObject, FCheckBoxTree)
  private type
    TSectionRec = class
      MainCB: TCheckBox;
      ChildItems: TList;
      constructor Create(AMainCB: TCheckBox);
      destructor Destroy; override;
    end;
  private
    TV: TTreeView;
    FSections: TList;
    procedure MainCBChanged(Sender: TObject);
    procedure ChildCBChanged(Sender: TObject);
    procedure OnChange(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure ScrollAnimation(FEnable: Boolean); stdcall;
    procedure ShowScrollBars(FShow: Boolean); stdcall;
    function AddEmptySection(FParent: TFmxObject; const FText: WideString)
      : TFmxObject; stdcall;
    function AddCheckBoxSection(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString; var CheckBoxHandle: TFmxObject)
      : TFmxObject; stdcall;
    function AddCheckBox(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject; stdcall;
    function AddRadioBtn(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject; stdcall;
    procedure CheckBoxSetChecked(FHandle: TFmxObject;
      FChecked: Boolean); stdcall;
    procedure RadioBtnSetChecked(FHandle: TFmxObject;
      FChecked: Boolean); stdcall;
    procedure RadioBtnGroupName(FHandle: TFmxObject;
      FGroupName: WideString); stdcall;
    procedure SectionFontSetting(FHandle: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor); stdcall;
    procedure CheckBoxFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure RadioBtnFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure SectionExpand(FHandle: TFmxObject); stdcall;
    procedure SectionExpandAll(FHandle: TFmxObject); stdcall;
    procedure SectionCollapse(FHandle: TFmxObject); stdcall;
    procedure SectionCollapseAll(FHandle: TFmxObject); stdcall;
    procedure SectionEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure CheckBoxEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure RadioBtnEnable(FHandle: TFmxObject; FEnabled: Boolean); stdcall;
    procedure ItemHeight(FHeight: Single); stdcall;
    procedure AlternatingRowBackground(FValue: Boolean); stdcall;
    procedure RemoveBackground; stdcall;
    procedure CanFocus(FValue: Boolean); stdcall;
    procedure DisableFocusEffect(FValue: Boolean); stdcall;
    procedure DisableMouseWheel(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure ReFresh; stdcall;
    procedure ItemOnMouseEnter(FHandle: TFmxObject;
      Event: TNotifyEvent); stdcall;
    procedure ItemOnMouseLeave(FHandle: TFmxObject;
      Event: TNotifyEvent); stdcall;
    procedure ItemOnChange(FHandle: TFmxObject; Event: TNotifyEvent); stdcall;
    function CheckBoxGetChecked(FHandle: TFmxObject): Boolean; stdcall;
    function RadioBtnGetChecked(FHandle: TFmxObject): Boolean; stdcall;
    function GetText(FHandle: TFmxObject): WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetObjectCheckBox(FHandle: TFmxObject): TFmxObject; stdcall;
    function GetObjectRadioBtn(FHandle: TFmxObject): TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FLockScreen
// =============================================================================
type
  FLockScreen = interface(IUnknown)
    ['{10B94B57-24AF-4FAD-9B2C-411FD5CD1910}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure BackColor(FColor: TAlphaColor); stdcall;
    procedure BackGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure BackGradientLinearAngle(FAngle: Single); stdcall;
    procedure BackGradientRadialAngle(FAngle: Single); stdcall;
    procedure BackGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure BackCornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure BackSides(FSides: TSides); stdcall;
    procedure TimeText24Format(FValue: Boolean); stdcall;
    procedure TimeTextPosition(FLeft, FTop: Single); stdcall;
    procedure TimeTextHide; stdcall;
    procedure TimeTextFontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure ShowDelay(FSeconds: Single); stdcall;
    procedure ShowLockScreen; stdcall;
    procedure HideLockScreen; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFLockScreen = class(TInterfacedObject, FLockScreen)
  private
    FOverlay: TRectangle;
    FTimeLabel, FDateLabel: TLabel;
    FTime24Format: Boolean;
    FShowDelay: Single;
    FShowTimer: TTimer;
    procedure ShowLockScreenTimer(Sender: TObject);
  public
    destructor Destroy; override;

    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure BackColor(FColor: TAlphaColor); stdcall;
    procedure BackGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure BackGradientLinearAngle(FAngle: Single); stdcall;
    procedure BackGradientRadialAngle(FAngle: Single); stdcall;
    procedure BackGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure BackCornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure BackSides(FSides: TSides); stdcall;
    procedure TimeText24Format(FValue: Boolean); stdcall;
    procedure TimeTextPosition(FLeft, FTop: Single); stdcall;
    procedure TimeTextHide; stdcall;
    procedure TimeTextFontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure ShowDelay(FSeconds: Single); stdcall;
    procedure ShowLockScreen; stdcall;
    procedure HideLockScreen; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FShadowText
// =============================================================================
type
  FShadowText = interface(IUnknown)
    ['{41B2C31C-A908-4231-AF32-B6C90B663883}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure AutoSize(FAutoSize: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure Stretch(FStretch: Boolean); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure ShadowVisible(FValue: Boolean); stdcall;
    procedure ShadowColor(FColor: TAlphaColor); stdcall;
    procedure ShadowOffset(OffsetX, OffsetY: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFShadowText = class(TInterfacedObject, FShadowText)
    ControlShadowText: TStyleTextObject;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Left(FLeft: Single); stdcall;
    procedure Top(FTop: Single); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure SetHint(const FText: WideString); stdcall;
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure AutoSize(FAutoSize: Boolean); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure Stretch(FStretch: Boolean); stdcall;
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure Color(FontColor: TAlphaColor); stdcall;
    procedure ShadowVisible(FValue: Boolean); stdcall;
    procedure ShadowColor(FColor: TAlphaColor); stdcall;
    procedure ShadowOffset(OffsetX, OffsetY: Single); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function GetText: WideString; stdcall;
    function GetTag: Integer; stdcall;
    function GetLeft: Single; stdcall;
    function GetTop: Single; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseDown(Event: TMouseEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    procedure OnMouseUp(Event: TMouseEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FHighlight
// =============================================================================
type
  FHighlight = interface(IUnknown)
    ['{6405885E-37CE-4DF9-9991-E39185F6F4AD}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure SetNewPos(NewPos: Single); stdcall;
    procedure Duration(FDuration: Single); stdcall;
    procedure Vertical(FVertical: Boolean); stdcall;
    procedure HighlightSize(FWidth, FHeight: Single); stdcall;
    procedure DoPlay; stdcall;
    procedure Hide; stdcall;
    procedure Show; stdcall;
  end;

  TFHighlight = class(TInterfacedObject, FHighlight)
  private
    FRect: TRectangle;
    FTargetPos: Single;
    FDuration: Single;
    FVertical: Boolean;
  public
    constructor Create;

    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Position(X, Y: Single); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure SetNewPos(NewPos: Single); stdcall;
    procedure Duration(FDuration: Single); stdcall;
    procedure Vertical(FVertical: Boolean); stdcall;
    procedure HighlightSize(FWidth, FHeight: Single); stdcall;
    procedure DoPlay; stdcall;
    procedure Hide; stdcall;
    procedure Show; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitPageControlHandle: FPageControl; stdcall;
function InitPageItemHandle: FPageItem; stdcall;
function InitTileHandle: FTile; stdcall;
function InitUWPTilesHandle: FUWPTiles; stdcall;
function InitRatingBar: FRatingBar; stdcall;
function InitMarquee: FMarquee; stdcall;
function InitCheckBoxTree: FCheckBoxTree; stdcall;
function InitLockScreenHandle: FLockScreen; stdcall;
function InitShadowTextHandle: FShadowText; stdcall;
function InitHighlight: FHighlight; stdcall;

implementation

uses
  System.SysUtils, System.Math,
  FMX.Forms, FMXBridge.BrushHelpers;

// =============================================================================
// FPageItem
// =============================================================================
constructor TPageItem.Create(AOwner: TComponent);
begin
  inherited;

  Align := TAlignLayout.None;
  Position.Point := PointF(0, 0);
  Visible := False;
end;

procedure TFPageItem.FCreate(FParent: TFmxObject);
begin
  ControlItem := TPageItem.Create(FParent);
  ControlItem.Parent := FParent;
  ControlItem.HitTest := True;
end;

procedure TFPageItem.Cursor(FCursor: TCursor);
begin
  ControlItem.Cursor := FCursor;
end;

procedure TFPageItem.SetHint(const FText: WideString);
begin
  ControlItem.ShowHint := True;
  ControlItem.Hint := FText;
end;

procedure TFPageItem.SetTag(FTag: Integer);
begin
  ControlItem.Tag := FTag;
end;

procedure TFPageItem.CanFocus(FValue: Boolean);
begin
  ControlItem.CanFocus := FValue;
end;

procedure TFPageItem.SetFocus;
begin
  ControlItem.SetFocus;
end;

procedure TFPageItem.Enabled(FEnabled: Boolean);
begin
  ControlItem.Enabled := FEnabled;
end;

procedure TFPageItem.Visible(FVisible: Boolean);
begin
  ControlItem.Visible := FVisible;
end;

procedure TFPageItem.HitTest(FValue: Boolean);
begin
  ControlItem.Visible := FValue;
end;

function TFPageItem.IsVisible: Boolean;
begin
  Result := ControlItem.Visible;
end;

function TFPageItem.GetTag: Integer;
begin
  Result := ControlItem.Tag;
end;

function TFPageItem.GetObject: TFmxObject;
begin
  Result := ControlItem;
end;

procedure TFPageItem.OnClick(Event: TNotifyEvent);
begin
  ControlItem.OnClick := Event;
end;

procedure TFPageItem.OnMouseDown(Event: TMouseEvent);
begin
  ControlItem.OnMouseDown := Event;
end;

procedure TFPageItem.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlItem.OnMouseEnter := Event;
end;

procedure TFPageItem.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlItem.OnMouseLeave := Event;
end;

procedure TFPageItem.OnMouseUp(Event: TMouseEvent);
begin
  ControlItem.OnMouseUp := Event;
end;

function TFPageItem.Handle: TFmxObject;
begin
  Result := ControlItem;
end;

// =============================================================================
// FPageControl
// =============================================================================
constructor TPageHost.Create(AOwner: TComponent);
begin
  inherited;

  ClipChildren := True;

  FPages := TList<TPageItem>.Create;

  FActivePage := -1;
  FAnimating := False;

  FDuration := 0.4;
  FDirection := pdHorizontal;
  FInterpolation := TInterpolationType.Cubic;
end;

destructor TPageHost.Destroy;
begin
  FOldAnimation.Free;
  FNewAnimation.Free;
  FPages.Free;

  inherited;
end;

procedure TPageHost.DoAddObject(const AObject: TFmxObject);
begin
  inherited;

  if AObject is TPageItem then
    RegisterPage(TPageItem(AObject));
end;

procedure TPageHost.RegisterPage(AItem: TPageItem);
begin
  AItem.Parent := Self;
  AItem.Position.Point := PointF(0, 0);
  AItem.Width := Width;
  AItem.Height := Height;
  AItem.Visible := False;

  FPages.Add(AItem);

  if FActivePage = -1 then
  begin
    FActivePage := 0;
    AItem.Visible := True;
    AItem.BringToFront;
  end;
end;

procedure TPageHost.SwitchPage(Index: Integer; Move: TPageMove);
begin
  SwitchPage(Index, Move, FDirection);
end;

procedure TPageHost.SwitchPage(Index: Integer; Move: TPageMove;
  ADirection: TPageDirection);
var
  Offset: Single;
begin
  if FAnimating then
    Exit;

  if Index = FActivePage then
    Exit;

  if (Index < 0) or (Index >= FPages.Count) then
    Exit;

  if Move = pmNormal then
  begin
    if Index > FActivePage then
      Move := pmNormal
    else
      Move := pmReverse;
  end;

  FOldPage := FPages[FActivePage];
  FNewPage := FPages[Index];

  case ADirection of
    pdHorizontal:
      begin
        if Move = pmNormal then
          Offset := Width
        else
          Offset := -Width;
      end;

    pdVertical:
      begin
        if Move = pmNormal then
          Offset := Height
        else
          Offset := -Height;
      end;
  else
    Offset := 0;
  end;

  FNewPage.Visible := True;

  FNewPage.BringToFront;
  FOldPage.SendToBack;

  FAnimating := True;

  FOldPage.Position.Point := PointF(0, 0);

  case ADirection of
    pdNone:
      begin
        FOldPage.Visible := False;
        FOldPage.Position.Point := PointF(0, 0);

        FNewPage.Position.Point := PointF(0, 0);

        FOldPage.Opacity := 1;
        FNewPage.Opacity := 1;

        FAnimating := False;
      end;

    pdHorizontal:
      begin
        FNewPage.Position.X := Offset;
        StartSlideX(0, -Offset, Offset, 0);
      end;

    pdVertical:
      begin
        FNewPage.Position.Y := Offset;
        StartSlideY(0, -Offset, Offset, 0);
      end;

    pdFade:
      begin
        StartFade;
      end;
  end;

  FActivePage := Index;

  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TPageHost.UpdateEffectsRecursive(AObject: TFmxObject);
var
  I: Integer;
begin
  if AObject is TControl then
    TControl(AObject).UpdateEffects;

  for I := 0 to AObject.ChildrenCount - 1 do
    UpdateEffectsRecursive(AObject.Children[I]);
end;

procedure TPageHost.AnimationProcess(Sender: TObject);
begin
  if Assigned(FOldPage) then
    UpdateEffectsRecursive(FOldPage);

  if Assigned(FNewPage) then
    UpdateEffectsRecursive(FNewPage);
end;

procedure TPageHost.StartFade;
begin
  FOldPage.Opacity := 1;
  FNewPage.Opacity := 0;

  FOldAnimation := TFloatAnimation.Create(FOldPage);
  FOldAnimation.Parent := FOldPage;
  FOldAnimation.PropertyName := 'Opacity';
  FOldAnimation.StartValue := 1;
  FOldAnimation.StopValue := 0;
  FOldAnimation.Duration := FDuration;
  FOldAnimation.Interpolation := FInterpolation;
  FOldAnimation.OnProcess := AnimationProcess;

  FNewAnimation := TFloatAnimation.Create(FNewPage);
  FNewAnimation.Parent := FNewPage;
  FNewAnimation.PropertyName := 'Opacity';
  FNewAnimation.StartValue := 0;
  FNewAnimation.StopValue := 1;
  FNewAnimation.Duration := FDuration;
  FNewAnimation.Interpolation := FInterpolation;
  FNewAnimation.OnProcess := AnimationProcess;
  FNewAnimation.OnFinish := AnimationFinish;

  FOldAnimation.Start;
  FNewAnimation.Start;
end;

procedure TPageHost.StartSlideX(OldStart, OldStop, NewStart,
  NewStop: Single);
begin
  FOldAnimation := TFloatAnimation.Create(FOldPage);
  FOldAnimation.Parent := FOldPage;
  FOldAnimation.AnimationType := TAnimationType.InOut;
  FOldAnimation.PropertyName := 'Position.X';
  FOldAnimation.StartValue := OldStart;
  FOldAnimation.StopValue := OldStop;
  FOldAnimation.Duration := FDuration;
  FOldAnimation.Interpolation := FInterpolation;

  FNewAnimation := TFloatAnimation.Create(FNewPage);
  FNewAnimation.Parent := FNewPage;
  FNewAnimation.AnimationType := TAnimationType.InOut;
  FNewAnimation.PropertyName := 'Position.X';
  FNewAnimation.StartValue := NewStart;
  FNewAnimation.StopValue := NewStop;
  FNewAnimation.Duration := FDuration;
  FNewAnimation.Interpolation := FInterpolation;
  FNewAnimation.OnFinish := AnimationFinish;

  FOldAnimation.Start;
  FNewAnimation.Start;
end;

procedure TPageHost.StartSlideY(OldStart, OldStop, NewStart,
  NewStop: Single);
begin
  FOldAnimation := TFloatAnimation.Create(FOldPage);
  FOldAnimation.Parent := FOldPage;
  FOldAnimation.AnimationType := TAnimationType.InOut;
  FOldAnimation.PropertyName := 'Position.Y';
  FOldAnimation.StartValue := OldStart;
  FOldAnimation.StopValue := OldStop;
  FOldAnimation.Duration := FDuration;
  FOldAnimation.Interpolation := FInterpolation;

  FNewAnimation := TFloatAnimation.Create(FNewPage);
  FNewAnimation.Parent := FNewPage;
  FNewAnimation.AnimationType := TAnimationType.InOut;
  FNewAnimation.PropertyName := 'Position.Y';
  FNewAnimation.StartValue := NewStart;
  FNewAnimation.StopValue := NewStop;
  FNewAnimation.Duration := FDuration;
  FNewAnimation.Interpolation := FInterpolation;
  FNewAnimation.OnFinish := AnimationFinish;

  FOldAnimation.Start;
  FNewAnimation.Start;
end;

procedure TPageHost.AnimationFinish(Sender: TObject);
begin
  if Assigned(FOldPage) then
  begin
    FOldPage.Visible := False;
    FOldPage.Position.Point := PointF(0, 0);
    FOldPage.Opacity := 1;
  end;

  if Assigned(FNewPage) then
  begin
    FNewPage.Position.Point := PointF(0, 0);
    FNewPage.Opacity := 1;
  end;

  FreeAndNil(FOldAnimation);
  FreeAndNil(FNewAnimation);

  FAnimating := False;
end;

procedure TPageHost.NextPage(Move: TPageMove);
begin
  if FActivePage < FPages.Count - 1 then
    SwitchPage(FActivePage + 1, Move);
end;

procedure TPageHost.BackPage(Move: TPageMove);
begin
  if FActivePage > 0 then
    SwitchPage(FActivePage - 1, Move);
end;

procedure TPageHost.FirstPage(Move: TPageMove);
begin
  if FPages.Count > 0 then
    SwitchPage(0, Move);
end;

procedure TPageHost.LastPage(Move: TPageMove);
begin
  if FPages.Count > 0 then
    SwitchPage(FPages.Count - 1, Move);
end;

function TPageHost.IsActivePage(Index: Integer): Boolean;
begin
  Result := (Index >= 0) and (Index < FPages.Count) and (Index = FActivePage);
end;

function TPageHost.ActivePageIndex: Integer;
begin
  Result := FActivePage;
end;

procedure TFPageControl.FCreate(FParent: TFmxObject);
begin
  ControlPage := TPageHost.Create(nil);
  ControlPage.Parent := FParent;
  ControlPage.HitTest := True;
end;

procedure TFPageControl.Left(FLeft: Single);
begin
  ControlPage.Position.X := FLeft;
end;

procedure TFPageControl.Top(FTop: Single);
begin
  ControlPage.Position.Y := FTop;
end;

procedure TFPageControl.Height(FHeight: Single);
begin
  ControlPage.Size.Height := FHeight;
end;

procedure TFPageControl.Width(FWidth: Single);
begin
  ControlPage.Size.Width := FWidth;
end;

procedure TFPageControl.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlPage.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFPageControl.Position(X, Y: Single);
begin
  ControlPage.Position.X := X;
  ControlPage.Position.Y := Y;
end;

procedure TFPageControl.Align(Al: TAlignLayout);
begin
  ControlPage.Align := Al;
end;

procedure TFPageControl.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPage.Margins.Left := FLeft;
  ControlPage.Margins.Top := FTop;
  ControlPage.Margins.Right := FRight;
  ControlPage.Margins.Bottom := FBottom;
end;

procedure TFPageControl.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlPage.Padding.Left := FLeft;
  ControlPage.Padding.Top := FTop;
  ControlPage.Padding.Right := FRight;
  ControlPage.Padding.Bottom := FBottom;
end;

procedure TFPageControl.ActivePage(FIndex: Integer; FMove: TPageMove);
begin
  ControlPage.SwitchPage(FIndex, FMove);
end;

procedure TFPageControl.ActivePageEx(FIndex: Integer; FMove: TPageMove;
  FDirection: TPageDirection);
begin
  ControlPage.SwitchPage(FIndex, FMove, FDirection);
end;

procedure TFPageControl.NextPage(FMove: TPageMove);
begin
  ControlPage.NextPage(FMove);
end;

procedure TFPageControl.BackPage(FMove: TPageMove);
begin
  ControlPage.BackPage(FMove);
end;

procedure TFPageControl.FirstPage(FMove: TPageMove);
begin
  ControlPage.FirstPage(FMove);
end;

procedure TFPageControl.LastPage(FMove: TPageMove);
begin
  ControlPage.LastPage(FMove);
end;

procedure TFPageControl.Duration(FDuration: Single);
begin
  ControlPage.FDuration := FDuration;
end;

procedure TFPageControl.Direction(FDirect: TPageDirection);
begin
  ControlPage.FDirection := TPageDirection(FDirect);
end;

procedure TFPageControl.Interpolation(FInterpolation: TInterpolationType);
begin
  ControlPage.FInterpolation := FInterpolation;
end;

procedure TFPageControl.Opacity(FOpacity: Single);
begin
  ControlPage.Opacity := FOpacity;
end;

procedure TFPageControl.Enabled(FEnabled: Boolean);
begin
  ControlPage.Enabled := FEnabled;
end;

procedure TFPageControl.Visible(FVisible: Boolean);
begin
  ControlPage.Visible := FVisible;
end;

procedure TFPageControl.HitTest(FValue: Boolean);
begin
  ControlPage.HitTest := FValue;
end;

function TFPageControl.IsActivePage(FIndex: Integer): Boolean;
begin
  Result := ControlPage.IsActivePage(FIndex);
end;

function TFPageControl.ActivePageIndex: Integer;
begin
  Result := ControlPage.ActivePageIndex;
end;

function TFPageControl.GetLeft: Single;
begin
  Result := ControlPage.Position.X;
end;

function TFPageControl.GetTop: Single;
begin
  Result := ControlPage.Position.Y;
end;

function TFPageControl.GetHeight: Single;
begin
  Result := ControlPage.Height;
end;

function TFPageControl.GetWidth: Single;
begin
  Result := ControlPage.Width;
end;

procedure TFPageControl.OnChange(Event: TNotifyEvent);
begin
  ControlPage.FOnChange := Event;
end;

function TFPageControl.Handle: TFmxObject;
begin
  Result := ControlPage;
end;

// =============================================================================
// FTile
// =============================================================================
procedure TFTile.FCreate(FParent: TFmxObject);
begin
  FStrokeColor := $FFF2680B;

  FBackTiles := TRectangle.Create(nil);
  FBackTiles.Parent := FParent;
  FBackTiles.Stroke.Kind := TBrushKind.None;

  FTiles := TRectangle.Create(nil);
  FTiles.Parent := FBackTiles;
  FTiles.Stroke.Kind := TBrushKind.Solid;
  FTiles.Stroke.Color := FStrokeColor;
  FTiles.Align := TAlignLayout.Client;
  FTiles.HitTest := False;

  FBackCaption := TRectangle.Create(nil);
  FBackCaption.Parent := FTiles;
  FBackCaption.Fill.Kind := TBrushKind.Solid;
  FBackCaption.Fill.Color := $00000000;
  FBackCaption.Stroke.Kind := TBrushKind.None;
  FBackCaption.Align := TAlignLayout.MostBottom;
  FBackCaption.Height := 17;
  FBackCaption.HitTest := False;

  FCaption := TText.Create(nil);
  FCaption.Parent := FBackCaption;
  FCaption.Text := 'FTile';
  FCaption.Align := TAlignLayout.Client;
  FCaption.AutoSize := True;
  FCaption.TextSettings.FontColor := $FFFFFFFF;
  FCaption.TextSettings.HorzAlign := TTextAlign.Center;
  FCaption.TextSettings.VertAlign := TTextAlign.Trailing;
  FCaption.TextSettings.WordWrap := False;
  FCaption.HitTest := False;

  FBackTiles.OnMouseEnter := InternalMouseEnter;
  FBackTiles.OnMouseLeave := InternalMouseLeave;
end;

procedure TFTile.InternalMouseEnter(Sender: TObject);
begin
  FTiles.Stroke.Kind := TBrushKind.Solid;
  FTiles.Stroke.Color := $FFFFFFFF;

  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Sender);
end;

procedure TFTile.InternalMouseLeave(Sender: TObject);
begin
  FTiles.Stroke.Kind := TBrushKind.Solid;
  FTiles.Stroke.Color := FStrokeColor;

  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Sender);
end;

procedure TFTile.Cursor(FCursor: TCursor);
begin
  FBackTiles.Cursor := FCursor;
end;

procedure TFTile.Left(FLeft: Single);
begin
  FBackTiles.Position.X := FLeft;
end;

procedure TFTile.Top(FTop: Single);
begin
  FBackTiles.Position.Y := FTop;
end;

procedure TFTile.Height(FHeight: Single);
begin
  FBackTiles.Height := FHeight;
end;

procedure TFTile.Width(FWidth: Single);
begin
  FBackTiles.Width := FWidth;
end;

procedure TFTile.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  FBackTiles.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFTile.Position(X, Y: Single);
begin
  FBackTiles.Position.X := X;
  FBackTiles.Position.Y := Y;
end;

procedure TFTile.Align(Al: TAlignLayout);
begin
  FBackTiles.Align := Al;
end;

procedure TFTile.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FBackTiles.Margins.Left := FLeft;
  FBackTiles.Margins.Top := FTop;
  FBackTiles.Margins.Right := FRight;
  FBackTiles.Margins.Bottom := FBottom;
end;

procedure TFTile.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FBackTiles.Padding.Left := FLeft;
  FBackTiles.Padding.Top := FTop;
  FBackTiles.Padding.Right := FRight;
  FBackTiles.Padding.Bottom := FBottom;
end;

procedure TFTile.SetHint(const FText: WideString);
begin
  FBackTiles.ShowHint := True;
  FBackTiles.Hint := FText;
end;

procedure TFTile.SetClipChildren(FValue: Boolean);
begin
  FBackTiles.ClipChildren := FValue;
end;

procedure TFTile.SetClipParent(FValue: Boolean);
begin
  FBackTiles.ClipParent := FValue;
end;

procedure TFTile.BringToFront;
begin
  FBackTiles.BringToFront;
end;

procedure TFTile.SendToBack;
begin
  FBackTiles.SendToBack;
end;

procedure TFTile.SetTag(FTag: Integer);
begin
  FBackTiles.Tag := FTag;
end;

procedure TFTile.TileColor(FColor: TAlphaColor);
begin
  FBackTiles.Fill.Kind := TBrushKind.Solid;
  FBackTiles.Fill.Color := FColor;
end;

procedure TFTile.TilePicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  FTiles.Fill.Kind := TBrushKind.Bitmap;
  FTiles.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
  FTiles.Fill.Bitmap.WrapMode := WrapMode;
end;

procedure TFTile.TileStrokeColor(FColor: TAlphaColor);
begin
  FStrokeColor := FColor;

  FTiles.Stroke.Kind := TBrushKind.Solid;
  FTiles.Stroke.Color := FStrokeColor;
end;

procedure TFTile.TileThickness(FThickness: Single);
begin
  FTiles.Stroke.Kind := TBrushKind.Solid;
  FTiles.Stroke.Thickness := FThickness;

  FBackCaption.Margins.Left := FThickness;
  FBackCaption.Margins.Right := FThickness;
  FBackCaption.Margins.Bottom := FThickness;
end;

procedure TFTile.TileCurve(XRadi, YRadi: Single);
begin
  FBackTiles.Corners := [TCorner.TopLeft, TCorner.TopRight, TCorner.BottomLeft,
    TCorner.BottomRight];
  FBackTiles.CornerType := TCornerType.Round;
  FBackTiles.XRadius := XRadi;
  FBackTiles.YRadius := YRadi;

  FTiles.Corners := [TCorner.TopLeft, TCorner.TopRight, TCorner.BottomLeft,
    TCorner.BottomRight];
  FTiles.CornerType := TCornerType.Round;
  FTiles.XRadius := XRadi;
  FTiles.YRadius := YRadi;

  FBackCaption.Corners := [TCorner.BottomLeft, TCorner.BottomRight];
  FBackCaption.CornerType := TCornerType.Round;
  FBackCaption.XRadius := XRadi - 1.4;
  FBackCaption.YRadius := YRadi - 1.4;
end;

procedure TFTile.Text(const FText: WideString);
begin
  FCaption.Text := FText;
end;

procedure TFTile.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  FCaption.TextSettings.Font.Family := FontName;
  FCaption.TextSettings.Font.Size := FontSize;
  FCaption.TextSettings.FontColor := FontColor;
end;

procedure TFTile.TextSetting(FHorzAlign, FVertAlign: TTextAlign);
begin
  FCaption.TextSettings.HorzAlign := FHorzAlign;
  FCaption.TextSettings.VertAlign := FVertAlign;
end;

procedure TFTile.TextBackColor(FColor: TAlphaColor);
begin
  FBackCaption.Fill.Kind := TBrushKind.Solid;
  FBackCaption.Fill.Color := FColor;
end;

procedure TFTile.TextColor(FontColor: TAlphaColor);
begin
  FCaption.Color := FontColor;
end;

procedure TFTile.Opacity(FOpacity: Single);
begin
  FBackTiles.Opacity := FOpacity;
end;

procedure TFTile.RotationAngle(FValue: Single);
begin
  FBackTiles.RotationAngle := FValue;
end;

procedure TFTile.RotationCenter(X, Y: Single);
begin
  FBackTiles.RotationCenter.X := X;
  FBackTiles.RotationCenter.Y := Y;
end;

procedure TFTile.Enabled(FEnabled: Boolean);
begin
  FBackTiles.Enabled := FEnabled;
end;

procedure TFTile.Visible(FVisible: Boolean);
begin
  FBackTiles.Visible := FVisible;
end;

procedure TFTile.HitTest(FEnabled: Boolean);
begin
  FBackTiles.HitTest := FEnabled;
end;

function TFTile.IsVisible: Boolean;
begin
  Result := FBackTiles.Visible;
end;

function TFTile.GetText: WideString;
begin
  Result := FCaption.Text;
end;

function TFTile.GetTag: Integer;
begin
  Result := FBackTiles.Tag;
end;

function TFTile.GetLeft: Single;
begin
  Result := FBackTiles.Position.X;
end;

function TFTile.GetTop: Single;
begin
  Result := FBackTiles.Position.Y;
end;

function TFTile.GetHeight: Single;
begin
  Result := FBackTiles.Height;
end;

function TFTile.GetWidth: Single;
begin
  Result := FBackTiles.Width;
end;

function TFTile.GetObject: TFmxObject;
begin
  Result := FBackTiles;
end;

procedure TFTile.OnClick(Event: TNotifyEvent);
begin
  FBackTiles.OnClick := Event;
end;

procedure TFTile.OnMouseDown(Event: TMouseEvent);
begin
  FBackTiles.OnMouseDown := Event;
end;

procedure TFTile.OnMouseEnter(Event: TNotifyEvent);
begin
  FOnMouseEnter := Event;
end;

procedure TFTile.OnMouseLeave(Event: TNotifyEvent);
begin
  FOnMouseLeave := Event;
end;

procedure TFTile.OnMouseUp(Event: TMouseEvent);
begin
  FBackTiles.OnMouseUp := Event;
end;

function TFTile.Handle: TFmxObject;
begin
  Result := FBackTiles;
end;

// =============================================================================
// FUWPTiles
// =============================================================================
constructor TFUWPTiles.Create;
begin
  inherited;
  FTiles := TObjectList<TRectangle>.Create(True);
  FTileBasePos := TDictionary<TRectangle, TPointF>.Create;
  FTileTitles := TDictionary<TRectangle, TLabel>.Create;
  FTileTexts := TDictionary<TRectangle, TLabel>.Create;

  FOffsetX := 5;
  FOffsetY := 5;
  FStroke := 2;

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 16;
  FTimer.OnTimer := OnTimer;
  FTimer.Enabled := True;
end;

destructor TFUWPTiles.Destroy;
begin
  FTimer.Free;
  FTileBasePos.Free;
  FTileTitles.Free;
  FTileTexts.Free;
  FTiles.Free;

  inherited;
end;

procedure TFUWPTiles.FCreate(FParent: TFmxObject);
begin
  FScrollBox := TVertScrollBox.Create(nil);
  FScrollBox.Parent := FParent;
  FScrollBox.ShowScrollBars := False;
  FScrollBox.DisableMouseWheel := True;
  FScrollBox.HitTest := False;
  FScrollBox.StyleLookup := '';
  FScrollBox.ApplyStyleLookup;
  FScrollBox.Content.Align := TAlignLayout.Top;
  FScrollBox.Content.Position.Point := PointF(0, 0);
end;

procedure TFUWPTiles.OnTimer(Sender: TObject);
begin
  FScrollBox.Repaint;
end;

procedure TFUWPTiles.Left(FLeft: Single);
begin
  FScrollBox.Position.X := FLeft;
end;

procedure TFUWPTiles.Top(FTop: Single);
begin
  FScrollBox.Position.Y := FTop;
end;

procedure TFUWPTiles.Width(FWidth: Single);
begin
  FScrollBox.Width := FWidth;
end;

procedure TFUWPTiles.Height(FHeight: Single);
begin
  FScrollBox.Height := FHeight;
end;

procedure TFUWPTiles.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  FScrollBox.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFUWPTiles.Position(X, Y: Single);
begin
  FScrollBox.Position.X := X;
  FScrollBox.Position.Y := Y;
end;

procedure TFUWPTiles.Align(Al: TAlignLayout);
begin
  FScrollBox.Align := Al;
end;

procedure TFUWPTiles.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FScrollBox.Margins.Left := FLeft;
  FScrollBox.Margins.Top := FTop;
  FScrollBox.Margins.Right := FRight;
  FScrollBox.Margins.Bottom := FBottom;
end;

procedure TFUWPTiles.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FScrollBox.Padding.Left := FLeft;
  FScrollBox.Padding.Top := FTop;
  FScrollBox.Padding.Right := FRight;
  FScrollBox.Padding.Bottom := FBottom;
end;

procedure TFUWPTiles.BringToFront;
begin
  FScrollBox.BringToFront;
end;

procedure TFUWPTiles.SendToBack;
begin
  FScrollBox.SendToBack;
end;

function TFUWPTiles.AddTile(const FImage, FTitle, FText: WideString;
  FWidth, FHeight: Single; Rounded: Boolean): TFmxObject;
var
  Tile: TRectangle;
  IconLayout: TLayout;
  Icon: TImage;
  TextLayout: TLayout;
  TitleLbl, TextLbl: TLabel;
begin
  Tile := TRectangle.Create(nil);
  Tile.Parent := FScrollBox.Content;
  Tile.Width := FWidth;
  Tile.Height := FHeight;

  if Rounded then
  begin
    Tile.XRadius := 6;
    Tile.YRadius := 6;
  end
  else
  begin
    Tile.XRadius := 0;
    Tile.YRadius := 0;
  end;

  Tile.Fill.Color := $1A000000;
  Tile.Stroke.Kind := TBrushKind.Gradient;
  Tile.Stroke.Gradient.Style := TGradientStyle.Radial;
  Tile.Stroke.Gradient.Points.Clear;
  Tile.Stroke.Gradient.Points.Add;
  Tile.Stroke.Gradient.Points[0].Color := $000078D4;
  Tile.Stroke.Gradient.Points[0].Offset := 0;
  Tile.Stroke.Gradient.Points.Add;
  Tile.Stroke.Gradient.Points[1].Color := $FF0078D4;
  Tile.Stroke.Gradient.Points[1].Offset := 1;
  Tile.Stroke.Thickness := FStroke;

  Tile.OnPaint := DoTilePaint;
  Tile.OnMouseDown := DoMouseDown;
  Tile.OnMouseUp := DoMouseUp;

  IconLayout := TLayout.Create(nil);
  IconLayout.Parent := Tile;
  IconLayout.Width := 48;
  IconLayout.Align := TAlignLayout.MostLeft;
  IconLayout.Margins.Left := 8;
  IconLayout.Margins.Top := 8;
  IconLayout.Margins.Bottom := 8;
  IconLayout.Margins.Right := 4;

  Icon := TImage.Create(nil);
  Icon.Parent := IconLayout;
  Icon.Align := TAlignLayout.Center;
  Icon.WrapMode := TImageWrapMode.Fit;
  Icon.HitTest := False;

  if (FImage <> '') and FileExists(FImage) then
    Icon.Bitmap.LoadFromfile(FImage);

  TextLayout := TLayout.Create(nil);
  TextLayout.Parent := Tile;
  TextLayout.Align := TAlignLayout.Client;
  TextLayout.Margins.Left := 4;
  TextLayout.Margins.Top := 8;
  TextLayout.Margins.Bottom := 8;
  TextLayout.Margins.Right := 8;

  TitleLbl := TLabel.Create(nil);
  TitleLbl.Parent := TextLayout;
  TitleLbl.Align := TAlignLayout.Top;
  TitleLbl.AutoSize := True;
  TitleLbl.Text := FTitle;
  TitleLbl.StyledSettings := [];
  TitleLbl.TextSettings.Font.Family := 'Segoe UI';
  TitleLbl.TextSettings.Font.Size := 14;
  TitleLbl.TextSettings.FontColor := $FFE8E8E8;
  TitleLbl.TextSettings.VertAlign := TTextAlign.Leading;
  TitleLbl.WordWrap := True;
  TitleLbl.Trimming := TTextTrimming.Character;

  TextLbl := TLabel.Create(nil);
  TextLbl.Parent := TextLayout;
  TextLbl.Align := TAlignLayout.Client;
  TextLbl.Text := FText;
  TextLbl.StyledSettings := [];
  TextLbl.TextSettings.Font.Family := 'Segoe UI';
  TextLbl.TextSettings.Font.Size := 12;
  TextLbl.TextSettings.FontColor := $FFADADAD;
  TextLbl.TextSettings.VertAlign := TTextAlign.Center;
  TextLbl.WordWrap := True;
  TextLbl.Trimming := TTextTrimming.Character;

  FTileTitles.Add(Tile, TitleLbl);
  FTileTexts.Add(Tile, TextLbl);

  FTiles.Add(Tile);
  RecalcPositions;

  Result := Tile;
end;

procedure TFUWPTiles.DoTilePaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  Tile: TRectangle absolute Sender;
  P: TPointF;
begin
  P := Tile.ScreenToLocal(Screen.MousePos);

  Tile.Stroke.Gradient.RadialTransform.RotationCenter.Point :=
    TPointF.Create(P.X / Tile.Width, P.Y / Tile.Height);
end;

procedure TFUWPTiles.DoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
const
  Rate = 0.98;
var
  Tile: TRectangle absolute Sender;
  Base: TPointF;
begin
  if not FTileBasePos.TryGetValue(Tile, Base) then
    Exit;

  if Tile.Root <> nil then
    Tile.Root.Captured := Tile;

  Tile.Scale.X := Rate;
  Tile.Scale.Y := Rate;

  Tile.Position.Point := TPointF.Create
    (Base.X + (Tile.Width - Tile.Width * Rate) / 2,
    Base.Y + (Tile.Height - Tile.Height * Rate) / 2);
end;

procedure TFUWPTiles.DoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  Tile: TRectangle absolute Sender;
  Base: TPointF;
begin
  if not FTileBasePos.TryGetValue(Tile, Base) then
    Exit;

  if Tile.Root <> nil then
    Tile.Root.Captured := nil;

  Tile.Scale.X := 1;
  Tile.Scale.Y := 1;

  Tile.Position.Point := Base;
end;

procedure TFUWPTiles.RecalcPositions;
var
  i, C, R, WCount: Integer;
  Tile: TRectangle;
  NX, NY: Single;
begin
  for i := 0 to FTiles.Count - 1 do
  begin
    Tile := FTiles[i];

    WCount := Trunc(FScrollBox.Width / (Tile.Width + FOffsetX * 2));
    if WCount <= 0 then
      Continue;

    R := i div WCount;
    C := i mod WCount;

    NX := C * (Tile.Width + FOffsetX * 2) + FOffsetX;
    NY := R * (Tile.Height + FOffsetY * 2) + FOffsetY;

    Tile.Position.X := NX;
    Tile.Position.Y := NY;

    FTileBasePos.AddOrSetValue(Tile, TPointF.Create(NX, NY));
  end;
end;

procedure TFUWPTiles.Offset(X, Y: Single);
begin
  FOffsetX := X;
  FOffsetY := Y;

  RecalcPositions;
end;

procedure TFUWPTiles.TileFillColor(FTile: TFmxObject; FColor: TAlphaColor);
var
  Tile: TRectangle;
begin
  Tile := TRectangle(FTile);

  Tile.Fill.Kind := TBrushKind.Solid;
  Tile.Fill.Color := FColor;
end;

procedure TFUWPTiles.TileFillPicture(FTile: TFmxObject; const FImage: WideString;
  WrapMode: TWrapMode);
var
  Tile: TRectangle;
begin
  if not FileExists(FImage) then
    Exit;

  Tile := TRectangle(FTile);

  Tile.Fill.Kind := TBrushKind.Bitmap;
  Tile.Fill.Bitmap.WrapMode := WrapMode;
  Tile.Fill.Bitmap.Bitmap.LoadFromfile(FImage);
end;

procedure TFUWPTiles.TileBorderColor(FTile: TFmxObject; FColor: TAlphaColor);
var
  Tile: TRectangle;
begin
  Tile := TRectangle(FTile);

  if Tile.Stroke.Kind <> TBrushKind.Gradient then
    Exit;

  if Tile.Stroke.Gradient.Points.Count < 2 then
    Exit;

  Tile.Stroke.Gradient.Points[0].Color := (FColor and $00FFFFFF) or $00000000;

  Tile.Stroke.Gradient.Points[1].Color := (FColor and $00FFFFFF) or $FF000000;
end;

procedure TFUWPTiles.TileBorderThickness(FTile: TFmxObject; FThickness: Single);
var
  Tile: TRectangle;
begin
  Tile := TRectangle(FTile);

  Tile.Stroke.Thickness := FThickness;

  FStroke := FThickness;
end;

procedure TFUWPTiles.TileCornerStyle(FTile: TFmxObject; XRadi, YRadi: Single;
  FCorners: TCorners; FCornerType: TCornerType);
var
  Tile: TRectangle;
begin
  Tile := TRectangle(FTile);

  Tile.CornerType := FCornerType;
  Tile.Corners := FCorners;
  Tile.XRadius := XRadi;
  Tile.YRadius := YRadi;
end;

procedure TFUWPTiles.TileTitleFontSetting(FTile: TFmxObject;
  const FontName: WideString; FontSize: Single; FontColor: TAlphaColor);
var
  Tile: TRectangle;
  L: TLabel;
begin
  Tile := TRectangle(FTile);

  if not FTileTitles.TryGetValue(Tile, L) then
    Exit;

  L.TextSettings.Font.Family := FontName;
  L.TextSettings.Font.Size := FontSize;
  L.TextSettings.FontColor := FontColor;
end;

procedure TFUWPTiles.TileTextFontSetting(FTile: TFmxObject;
  const FontName: WideString; FontSize: Single; FontColor: TAlphaColor);
var
  Tile: TRectangle;
  L: TLabel;
begin
  Tile := TRectangle(FTile);

  if not FTileTexts.TryGetValue(Tile, L) then
    Exit;

  L.TextSettings.Font.Family := FontName;
  L.TextSettings.Font.Size := FontSize;
  L.TextSettings.FontColor := FontColor;
end;

procedure TFUWPTiles.TileEnabled(FTile: TFmxObject; FEnable: Boolean);
var
  Tile: TRectangle;
begin
  Tile := TRectangle(FTile);
  Tile.Enabled := FEnable;
end;

procedure TFUWPTiles.TileVisible(FTile: TFmxObject; FVisible: Boolean);
var
  Tile: TRectangle;
begin
  Tile := TRectangle(FTile);
  Tile.Visible := FVisible;
end;

procedure TFUWPTiles.TileOnClick(FTile: TFmxObject; Event: TNotifyEvent);
var
  Tile: TRectangle;
begin
  Tile := TRectangle(FTile);
  Tile.OnClick := Event;
end;

function TFUWPTiles.TileGetObject(FTile: TFmxObject): TFmxObject;
var
  Tile: TRectangle;
begin
  Tile := TRectangle(FTile);
  Result := Tile;
end;

function TFUWPTiles.TileHandle(FTile: TFmxObject): TFmxObject;
var
  Tile: TRectangle;
begin
  Tile := TRectangle(FTile);
  Result := Tile;
end;

procedure TFUWPTiles.BeginUpdate;
begin
  FScrollBox.BeginUpdate;
end;

procedure TFUWPTiles.EndUpdate;
begin
  FScrollBox.EndUpdate;
end;

procedure TFUWPTiles.RecalcSize;
begin
  FScrollBox.RecalcSize;
end;

procedure TFUWPTiles.Repaint;
begin
  FScrollBox.Repaint;
end;

procedure TFUWPTiles.Opacity(FOpacity: Single);
begin
  FScrollBox.Opacity := FOpacity;
end;

procedure TFUWPTiles.RotationAngle(FValue: Single);
begin
  FScrollBox.RotationAngle := FValue;
end;

procedure TFUWPTiles.RotationCenter(X, Y: Single);
begin
  FScrollBox.RotationCenter.X := X;
  FScrollBox.RotationCenter.Y := Y;
end;

procedure TFUWPTiles.Enabled(FEnabled: Boolean);
begin
  FScrollBox.Enabled := FEnabled;
end;

procedure TFUWPTiles.Visible(FVisible: Boolean);
begin
  FScrollBox.Visible := FVisible;
end;

procedure TFUWPTiles.HitTest(FEnabled: Boolean);
begin
  FScrollBox.HitTest := FEnabled;
end;

function TFUWPTiles.IsVisible: Boolean;
begin
  Result := FScrollBox.Visible;
end;

function TFUWPTiles.GetLeft: Single;
begin
  Result := FScrollBox.Position.X;
end;

function TFUWPTiles.GetTop: Single;
begin
  Result := FScrollBox.Position.Y;
end;

function TFUWPTiles.GetHeight: Single;
begin
  Result := FScrollBox.Height;
end;

function TFUWPTiles.GetWidth: Single;
begin
  Result := FScrollBox.Width;
end;

function TFUWPTiles.GetObject: TFmxObject;
begin
  Result := FScrollBox;
end;

function TFUWPTiles.Handle: TFmxObject;
begin
  Result := FScrollBox;
end;

// =============================================================================
// FRatingBar
// =============================================================================
constructor TFRatingBar.Create;
begin
  inherited;

  FPath := TPathData.Create;
  FPath.Data :=
    'm 4677,2657 -1004,727 385,1179 -1002,-731 -1002,731 386,-1179 -1005,-727 1240,3 381,-1181 381,1181 z';

  FCount := 5;
  FMaximum := 5;
  FValue := 0;
  FSpace := 6;

  FActiveColor := $FF1E90FF;
  FInActiveColor := $30000000;
end;

destructor TFRatingBar.Destroy;
begin
  FreeBrush;
  FPath.Free;
  inherited;
end;

procedure TFRatingBar.FCreate(FParent: TFmxObject);
begin
  FLayer := TLayout.Create(nil);
  FLayer.Parent := FParent;

  FControl := TShape.Create(nil);
  FControl.Parent := FLayer;
  FControl.Align := TAlignLayout.Client;
  FControl.HitTest := False;

  FControl.OnPaint := DoPaint;
end;

procedure TFRatingBar.CreateBrush;
begin
  if not Assigned(FActiveBrush) then
    FActiveBrush := TBrush.Create(TBrushKind.Solid, FActiveColor);

  if not Assigned(FInActiveBrush) then
    FInActiveBrush := TBrush.Create(TBrushKind.Solid, FInActiveColor);
end;

procedure TFRatingBar.FreeBrush;
begin
  FreeAndNil(FActiveBrush);
  FreeAndNil(FInActiveBrush);
end;

procedure TFRatingBar.DoPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  i: Integer;
  w, X, Step, StrokeR, Inset: Single;
  R: TRectF;
  dv, v: Single;
begin
  CreateBrush;

  w := ARect.Height;
  StrokeR := FControl.Stroke.Thickness * 0.5;
  Inset := StrokeR;

  Step := w + FSpace + StrokeR * 2;

  dv := (FValue / FMaximum) * FCount;

  for i := 0 to FCount - 1 do
  begin
    X := i * Step;

    R := RectF(X + Inset, Inset, X + w - Inset, w - Inset);

    if dv - i >= 1 then
      v := 1
    else if dv <= i then
      v := 0
    else
      v := dv - i;

    DrawStar(Canvas, R, v);
  end;
end;

procedure TFRatingBar.DrawStar(Canvas: TCanvas; const R: TRectF;
  AValue: Single);
var
  P: TPathData;
  State: TCanvasSaveState;
  ClipR: TRectF;
  StrokeOffset: Single;
  R2: TRectF;
begin
  StrokeOffset := FControl.Stroke.Thickness * 0.5;

  R2 := RectF(R.Left + StrokeOffset, R.Top + StrokeOffset,
    R.Right - StrokeOffset, R.Bottom - StrokeOffset);

  P := FPath;
  P.FitToRect(R2);

  Canvas.FillPath(P, FControl.AbsoluteOpacity, FInActiveBrush);

  if AValue > 0 then
  begin
    State := Canvas.SaveState;
    try
      ClipR := RectF(R.Left, R.Top, R.Left + R.Width * AValue, R.Bottom);
      Canvas.IntersectClipRect(ClipR);

      Canvas.FillPath(P, FControl.AbsoluteOpacity, FActiveBrush);
    finally
      Canvas.RestoreState(State);
    end;
  end;

  Canvas.DrawPath(P, FControl.AbsoluteOpacity, FControl.Stroke);
end;

procedure TFRatingBar.Cursor(FCursor: TCursor);
begin
  FLayer.Cursor := FCursor;
end;

procedure TFRatingBar.Left(FLeft: Single);
begin
  FLayer.Position.X := FLeft;
end;

procedure TFRatingBar.Top(FTop: Single);
begin
  FLayer.Position.Y := FTop;
end;

procedure TFRatingBar.Height(FHeight: Single);
begin
  FLayer.Height := FHeight;
end;

procedure TFRatingBar.Width(FWidth: Single);
begin
  FLayer.Width := FWidth;
end;

procedure TFRatingBar.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  FLayer.Position.X := FLeft;
  FLayer.Position.Y := FTop;
  FLayer.Width := FWidth;
  FLayer.Height := FHeight;
end;

procedure TFRatingBar.Position(X, Y: Single);
begin
  FLayer.Position.X := X;
  FLayer.Position.Y := Y;
end;

procedure TFRatingBar.Align(Al: TAlignLayout);
begin
  FLayer.Align := Al;
end;

procedure TFRatingBar.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  FLayer.Margins.Left := FLeft;
  FLayer.Margins.Top := FTop;
  FLayer.Margins.Right := FRight;
  FLayer.Margins.Bottom := FBottom;
end;

procedure TFRatingBar.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  FLayer.Padding.Left := FLeft;
  FLayer.Padding.Top := FTop;
  FLayer.Padding.Right := FRight;
  FLayer.Padding.Bottom := FBottom;
end;

procedure TFRatingBar.SetHint(const FText: WideString);
begin
  FLayer.ShowHint := True;
  FLayer.Hint := FText;
end;

procedure TFRatingBar.SetClipChildren(FValue: Boolean);
begin
  FLayer.ClipChildren := FValue;
end;

procedure TFRatingBar.SetClipParent(FValue: Boolean);
begin
  FLayer.ClipParent := FValue;
end;

procedure TFRatingBar.BringToFront;
begin
  FLayer.BringToFront;
end;

procedure TFRatingBar.SendToBack;
begin
  FLayer.SendToBack;
end;

procedure TFRatingBar.SetTag(FTag: Integer);
begin
  FLayer.Tag := FTag;
end;

procedure TFRatingBar.ActiveColor(FColor: TAlphaColor);
begin
  FActiveColor := FColor;
  FreeAndNil(FActiveBrush);
  FControl.Repaint;
end;

procedure TFRatingBar.InActiveColor(FColor: TAlphaColor);
begin
  FInActiveColor := FColor;
  FreeAndNil(FInActiveBrush);
  FControl.Repaint;
end;

procedure TFRatingBar.Count(ACount: Integer);
begin
  FCount := ACount;
  FControl.Repaint;
end;

procedure TFRatingBar.Maximum(FMax: Single);
begin
  FMaximum := FMax;
  FControl.Repaint;
end;

procedure TFRatingBar.Space(ASpace: Single);
begin
  FSpace := ASpace;
  FControl.Repaint;
end;

procedure TFRatingBar.Value(AValue: Single);
begin
  FValue := AValue;
  FControl.Repaint;
end;

procedure TFRatingBar.StrokeColor(FColor: TAlphaColor);
begin
  FControl.Stroke.Color := FColor;
  FControl.Repaint;
end;

procedure TFRatingBar.StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
  Dash: TStrokeDash; Join: TStrokeJoin);
begin
  FControl.Stroke.Kind := TBrushKind.Solid;
  FControl.Stroke.Thickness := FThickness;
  FControl.Stroke.Cap := TStrokeCap(CapStyle);
  FControl.Stroke.Dash := TStrokeDash(Dash);
  FControl.Stroke.Join := TStrokeJoin(Join);
  FControl.Repaint;
end;

procedure TFRatingBar.Opacity(FOpacity: Single);
begin
  FLayer.Opacity := FOpacity;
end;

procedure TFRatingBar.RotationAngle(FValue: Single);
begin
  FLayer.RotationAngle := FValue;
end;

procedure TFRatingBar.RotationCenter(X, Y: Single);
begin
  FLayer.RotationCenter.X := X;
  FLayer.RotationCenter.Y := Y;
end;

procedure TFRatingBar.Enabled(FEnabled: Boolean);
begin
  FLayer.Enabled := FEnabled;
end;

procedure TFRatingBar.Visible(FVisible: Boolean);
begin
  FLayer.Visible := FVisible;
end;

procedure TFRatingBar.HitTest(FEnabled: Boolean);
begin
  FLayer.HitTest := FEnabled;
end;

function TFRatingBar.IsVisible: Boolean;
begin
  Result := FLayer.Visible;
end;

function TFRatingBar.GetTag: Integer;
begin
  Result := FLayer.Tag;
end;

function TFRatingBar.GetLeft: Single;
begin
  Result := FLayer.Position.X;
end;

function TFRatingBar.GetTop: Single;
begin
  Result := FLayer.Position.Y;
end;

function TFRatingBar.GetHeight: Single;
begin
  Result := FLayer.Height;
end;

function TFRatingBar.GetWidth: Single;
begin
  Result := FLayer.Width;
end;

function TFRatingBar.GetObject: TFmxObject;
begin
  Result := FLayer;
end;

procedure TFRatingBar.OnClick(Event: TNotifyEvent);
begin
  FLayer.OnClick := Event;
end;

procedure TFRatingBar.OnMouseDown(Event: TMouseEvent);
begin
  FLayer.OnMouseDown := Event;
end;

procedure TFRatingBar.OnMouseEnter(Event: TNotifyEvent);
begin
  FLayer.OnMouseEnter := Event;
end;

procedure TFRatingBar.OnMouseLeave(Event: TNotifyEvent);
begin
  FLayer.OnMouseLeave := Event;
end;

procedure TFRatingBar.OnMouseUp(Event: TMouseEvent);
begin
  FLayer.OnMouseUp := Event;
end;

function TFRatingBar.Handle: TFmxObject;
begin
  Result := FLayer;
end;

// =============================================================================
// FMarquee
// =============================================================================
procedure TFMarquee.FCreate(FParent: TFmxObject);
begin
  Layout := TLayout.Create(nil);
  Layout.Parent := FParent;
  Layout.ClipChildren := True;
  Layout.HitTest := True;

  Text1 := TText.Create(Layout);
  Text1.Parent := Layout;
  Text1.TextSettings.HorzAlign := TTextAlign.Leading;
  Text1.TextSettings.VertAlign := TTextAlign.Leading;
  Text1.TextSettings.WordWrap := False;
  Text1.Position.Y := 0;
  Text1.AutoSize := True;
  Text1.HitTest := False;

  Text2 := TText.Create(Layout);
  Text2.Parent := Layout;
  Text2.TextSettings.HorzAlign := TTextAlign.Leading;
  Text2.TextSettings.VertAlign := TTextAlign.Leading;
  Text2.TextSettings.WordWrap := False;
  Text2.Position.Y := 0;
  Text2.AutoSize := True;
  Text2.HitTest := False;

  FAnimation := TMarqueeAnimation.Create(Layout);
  FAnimation.Stored := False;
  FAnimation.Parent := Layout;
  FAnimation.Duration := 1.0;
  FAnimation.Loop := True;
  FAnimation.OnProcess := AnimationProcess;

  FSpeed := 1;
  FDirection := -1;
  FGap := 40;
end;

procedure TMarqueeAnimation.ProcessAnimation;
begin
//
end;

procedure TFMarquee.AnimationProcess(Sender: TObject);
begin
  FX1 := FX1 + FSpeed * FDirection;
  FX2 := FX2 + FSpeed * FDirection;

  Text1.Position.X := Round(FX1);
  Text2.Position.X := Round(FX2);

  if FDirection < 0 then
  begin
    if FX1 + Text1.Width < 0 then
      FX1 := FX2 + Text2.Width + FGap;

    if FX2 + Text2.Width < 0 then
      FX2 := FX1 + Text1.Width + FGap;
  end
  else
  begin
    if FX1 > Layout.Width then
      FX1 := FX2 - Text1.Width - FGap;

    if FX2 > Layout.Width then
      FX2 := FX1 - Text2.Width - FGap;
  end;
end;

procedure TFMarquee.Cursor(FCursor: TCursor);
begin
  Layout.Cursor := FCursor;
end;

procedure TFMarquee.Left(FLeft: Single);
begin
  Layout.Position.X := FLeft;
end;

procedure TFMarquee.Top(FTop: Single);
begin
  Layout.Position.Y := FTop;
end;

procedure TFMarquee.Height(FHeight: Single);
begin
  Layout.Height := FHeight;
end;

procedure TFMarquee.Width(FWidth: Single);
begin
  Layout.Width := FWidth;
end;

procedure TFMarquee.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  Layout.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFMarquee.Position(X, Y: Single);
begin
  Layout.Position.X := X;
  Layout.Position.Y := Y;
end;

procedure TFMarquee.Align(Al: TAlignLayout);
begin
  Layout.Align := Al;
end;

procedure TFMarquee.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  Layout.Margins.Left := FLeft;
  Layout.Margins.Top := FTop;
  Layout.Margins.Right := FRight;
  Layout.Margins.Bottom := FBottom;
end;

procedure TFMarquee.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  Layout.Padding.Left := FLeft;
  Layout.Padding.Top := FTop;
  Layout.Padding.Right := FRight;
  Layout.Padding.Bottom := FBottom;
end;

procedure TFMarquee.SetHint(const FText: WideString);
begin
  Layout.ShowHint := True;
  Layout.Hint := FText;
end;

procedure TFMarquee.Text(FText: WideString);
begin
  Text1.Text := FText;
  Text2.Text := FText;

  Text1.RecalcSize;
  Text2.RecalcSize;

  FX1 := FX1;
  FX2 := FX1 + Text1.Width + FGap;

  Text1.Position.X := Round(FX1);
  Text2.Position.X := Round(FX2);
end;

procedure TFMarquee.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  Text1.TextSettings.Font.Family := FontName;
  Text1.TextSettings.Font.Size := FontSize;
  Text1.TextSettings.FontColor := FontColor;

  Text2.TextSettings.Font.Family := FontName;
  Text2.TextSettings.Font.Size := FontSize;
  Text2.TextSettings.FontColor := FontColor;

  Text1.RecalcSize;
  Text2.RecalcSize;

  FX2 := FX1 + Text1.Width + FGap;

  Text2.Position.X := Round(FX2);
end;

procedure TFMarquee.Color(FontColor: TAlphaColor);
begin
  Text1.Color := FontColor;
  Text2.Color := FontColor;
end;

procedure TFMarquee.Speed(FValue: Single);
begin
  if FValue < 0 then
    FValue := 0;

  FSpeed := FValue;
end;

procedure TFMarquee.Direction(FValue: Integer);
begin
  if FValue >= 0 then
    FDirection := 1
  else
    FDirection := -1;
end;

procedure TFMarquee.Start;
begin
  FAnimation.Start;
end;

procedure TFMarquee.Stop;
begin
  FAnimation.Stop;
end;

procedure TFMarquee.BringToFront;
begin
  Layout.BringToFront;
end;

procedure TFMarquee.SendToBack;
begin
  Layout.SendToBack;
end;

procedure TFMarquee.SetTag(FTag: Integer);
begin
  Layout.Tag := FTag;
end;

procedure TFMarquee.Opacity(FOpacity: Single);
begin
  Layout.Opacity := FOpacity;
end;

procedure TFMarquee.RotationAngle(FValue: Single);
begin
  Layout.RotationAngle := FValue;
end;

procedure TFMarquee.RotationCenter(X, Y: Single);
begin
  Layout.RotationCenter.X := X;
  Layout.RotationCenter.Y := Y;
end;

procedure TFMarquee.Enabled(FEnabled: Boolean);
begin
  Layout.Enabled := FEnabled;
end;

procedure TFMarquee.Visible(FVisible: Boolean);
begin
  Layout.Visible := FVisible;
end;

procedure TFMarquee.HitTest(FEnabled: Boolean);
begin
  Layout.HitTest := FEnabled;
end;

function TFMarquee.IsVisible: Boolean;
begin
  Result := Layout.Visible;
end;

function TFMarquee.GetTag: Integer;
begin
  Result := Layout.Tag;
end;

function TFMarquee.GetLeft: Single;
begin
  Result := Layout.Position.X;
end;

function TFMarquee.GetTop: Single;
begin
  Result := Layout.Position.Y;
end;

function TFMarquee.GetHeight: Single;
begin
  Result := Layout.Height;
end;

function TFMarquee.GetWidth: Single;
begin
  Result := Layout.Width;
end;

function TFMarquee.GetObject: TFmxObject;
begin
  Result := Layout;
end;

procedure TFMarquee.OnClick(Event: TNotifyEvent);
begin
  Layout.OnClick := Event;
end;

procedure TFMarquee.OnMouseDown(Event: TMouseEvent);
begin
  Layout.OnMouseDown := Event;
end;

procedure TFMarquee.OnMouseEnter(Event: TNotifyEvent);
begin
  Layout.OnMouseEnter := Event;
end;

procedure TFMarquee.OnMouseLeave(Event: TNotifyEvent);
begin
  Layout.OnMouseLeave := Event;
end;

procedure TFMarquee.OnMouseUp(Event: TMouseEvent);
begin
  Layout.OnMouseUp := Event;
end;

function TFMarquee.Handle: TFmxObject;
begin
  Result := Layout;
end;

// =============================================================================
// FCheckBoxTree
// =============================================================================
constructor TFCheckBoxTree.TSectionRec.Create(AMainCB: TCheckBox);
begin
  MainCB := AMainCB;
  ChildItems := TList.Create;
end;

destructor TFCheckBoxTree.TSectionRec.Destroy;
begin
  ChildItems.Free;
  inherited;
end;

constructor TFCheckBoxTree.Create;
begin
  inherited Create;
  FSections := TList.Create;
end;

destructor TFCheckBoxTree.Destroy;
var
  i: Integer;
begin
  if Assigned(FSections) then
  begin
    for i := 0 to FSections.Count - 1 do
      TSectionRec(FSections[i]).Free;
    FSections.Free;
  end;
  inherited;
end;

procedure TFCheckBoxTree.MainCBChanged(Sender: TObject);
var
  i, idx: Integer;
  Section: TSectionRec;
  Ctrl: TControl;
  MainChecked: Boolean;
  Groups: TStringList;
  RB: TRadioButton;
begin
  if FSections = nil then
    Exit;

  for i := 0 to FSections.Count - 1 do
  begin
    Section := TSectionRec(FSections[i]);
    if Section.MainCB = Sender then
    begin
      MainChecked := TCheckBox(Sender).IsChecked;

      Groups := TStringList.Create;
      try
        for idx := 0 to Section.ChildItems.Count - 1 do
        begin
          Ctrl := TControl(Section.ChildItems[idx]);

          if Ctrl is TCheckBox then
            TCheckBox(Ctrl).IsChecked := MainChecked

          else if Ctrl is TRadioButton then
          begin
            RB := TRadioButton(Ctrl);
            if MainChecked then
            begin
              if Groups.IndexOf(RB.GroupName) = -1 then
              begin
                RB.IsChecked := True;
                Groups.Add(RB.GroupName);
              end;
            end
            else
            begin
              RB.IsChecked := False;
            end;
          end;
        end;
      finally
        Groups.Free;
      end;

      Exit;
    end;
  end;
end;

procedure TFCheckBoxTree.ChildCBChanged(Sender: TObject);
var
  i, idx: Integer;
  Section: TSectionRec;
  Ctrl: TControl;
  AnyChecked: Boolean;
begin
  if FSections = nil then
    Exit;

  for i := 0 to FSections.Count - 1 do
  begin
    Section := TSectionRec(FSections[i]);
    if Section.ChildItems.IndexOf(TControl(Sender)) >= 0 then
    begin
      AnyChecked := False;
      for idx := 0 to Section.ChildItems.Count - 1 do
      begin
        Ctrl := TControl(Section.ChildItems[idx]);
        if (Ctrl is TCheckBox) and TCheckBox(Ctrl).IsChecked then
        begin
          AnyChecked := True;
          Break;
        end
        else if (Ctrl is TRadioButton) and TRadioButton(Ctrl).IsChecked then
        begin
          AnyChecked := True;
          Break;
        end;
      end;

      Section.MainCB.OnChange := nil;
      Section.MainCB.IsChecked := AnyChecked;
      Section.MainCB.OnChange := MainCBChanged;

      Exit;
    end;
  end;
end;

procedure TFCheckBoxTree.FCreate(FParent: TFmxObject);
begin
  TV := TTreeView.Create(nil);
  TV.Parent := FParent;
  TV.ShowCheckBoxes := False;
  TV.OnChange := OnChange;
  FSections := TList.Create;
end;

procedure TFCheckBoxTree.OnChange(Sender: TObject);
begin
  TV.Selected := nil;
end;

procedure TFCheckBoxTree.Cursor(FCursor: TCursor);
begin
  TV.Cursor := FCursor;
end;

procedure TFCheckBoxTree.Position(X, Y: Single);
begin
  TV.Position.X := X;
  TV.Position.Y := Y;
end;

procedure TFCheckBoxTree.Align(Al: TAlignLayout);
begin
  TV.Align := Al;
end;

procedure TFCheckBoxTree.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  TV.Margins.Left := FLeft;
  TV.Margins.Top := FTop;
  TV.Margins.Right := FRight;
  TV.Margins.Bottom := FBottom;
end;

procedure TFCheckBoxTree.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  TV.Padding.Left := FLeft;
  TV.Padding.Top := FTop;
  TV.Padding.Right := FRight;
  TV.Padding.Bottom := FBottom;
end;

procedure TFCheckBoxTree.SetHint(const FText: WideString);
begin
  TV.ShowHint := True;
  TV.Hint := FText;
end;

procedure TFCheckBoxTree.SetClipChildren(FValue: Boolean);
begin
  TV.ClipChildren := FValue;
end;

procedure TFCheckBoxTree.SetClipParent(FValue: Boolean);
begin
  TV.ClipParent := FValue;
end;

procedure TFCheckBoxTree.BringToFront;
begin
  TV.BringToFront;
end;

procedure TFCheckBoxTree.SendToBack;
begin
  TV.SendToBack;
end;

procedure TFCheckBoxTree.SetTag(FTag: Integer);
begin
  TV.Tag := FTag;
end;

procedure TFCheckBoxTree.Left(FLeft: Single);
begin
  TV.Position.X := FLeft;
end;

procedure TFCheckBoxTree.Top(FTop: Single);
begin
  TV.Position.Y := FTop;
end;

procedure TFCheckBoxTree.Height(FHeight: Single);
begin
  TV.Height := FHeight;
end;

procedure TFCheckBoxTree.Width(FWidth: Single);
begin
  TV.Width := FWidth;
end;

procedure TFCheckBoxTree.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  TV.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFCheckBoxTree.ScrollAnimation(FEnable: Boolean);
begin
  TV.AniCalculations.Animation := FEnable;
end;

procedure TFCheckBoxTree.ShowScrollBars(FShow: Boolean);
begin
  TV.ShowScrollBars := FShow;
end;

function TFCheckBoxTree.AddEmptySection(FParent: TFmxObject;
  const FText: WideString): TFmxObject;
var
  Item: TTreeViewItem;
begin
  Item := TTreeViewItem.Create(TV);
  Item.Parent := TTreeViewItem(FParent);
  Item.Text := FText;

  Result := Item;
end;

function TFCheckBoxTree.AddCheckBoxSection(FParent: TFmxObject;
  FLeft, FTop, FWidth: Single; const FText: WideString;
  var CheckBoxHandle: TFmxObject): TFmxObject;
var
  Item: TTreeViewItem;
  CB: TCheckBox;
  Section: TSectionRec;
begin
  Item := TTreeViewItem.Create(TV);
  Item.Parent := TTreeViewItem(FParent);
  Item.Text := '';

  CB := TCheckBox.Create(Item);
  CB.Parent := Item;
  CB.Position.X := FLeft;
  CB.Position.Y := FTop;
  CB.Width := FWidth;
  CB.Text := FText;

  if FSections = nil then
    FSections := TList.Create;

  CB.OnChange := MainCBChanged;
  Section := TSectionRec.Create(CB);
  FSections.Add(Section);

  CheckBoxHandle := CB;
  Result := Item;
end;

function TFCheckBoxTree.AddCheckBox(FParent: TFmxObject;
  FLeft, FTop, FWidth: Single; const FText: WideString): TFmxObject;
var
  Item: TTreeViewItem;
  CB: TCheckBox;
  ParentItem: TTreeViewItem;
  Section: TSectionRec;
  i: Integer;
begin
  ParentItem := TTreeViewItem(FParent);

  Item := TTreeViewItem.Create(TV);
  Item.Parent := ParentItem;
  Item.Text := '';

  CB := TCheckBox.Create(Item);
  CB.Parent := Item;
  CB.Position.X := FLeft;
  CB.Position.Y := FTop;
  CB.Width := FWidth;
  CB.Text := FText;

  Section := nil;
  if FSections <> nil then
    for i := 0 to FSections.Count - 1 do
    begin
      Section := TSectionRec(FSections[i]);
      if Section.MainCB.Parent = ParentItem then
        Break
      else
        Section := nil;
    end;

  if Section <> nil then
  begin
    Section.ChildItems.Add(CB);
    CB.OnChange := ChildCBChanged;
  end;

  Result := CB;
end;

function TFCheckBoxTree.AddRadioBtn(FParent: TFmxObject;
  FLeft, FTop, FWidth: Single; const FText: WideString): TFmxObject;
var
  Item: TTreeViewItem;
  RB: TRadioButton;
  ParentItem: TTreeViewItem;
  Section: TSectionRec;
  i: Integer;
begin
  ParentItem := TTreeViewItem(FParent);

  Item := TTreeViewItem.Create(TV);
  Item.Parent := ParentItem;
  Item.Text := '';

  RB := TRadioButton.Create(Item);
  RB.Parent := Item;
  RB.Position.X := FLeft;
  RB.Position.Y := FTop;
  RB.Width := FWidth;
  RB.Text := FText;

  Section := nil;
  if FSections <> nil then
    for i := 0 to FSections.Count - 1 do
    begin
      Section := TSectionRec(FSections[i]);
      if Section.MainCB.Parent = ParentItem then
        Break
      else
        Section := nil;
    end;

  if Section <> nil then
  begin
    Section.ChildItems.Add(RB);
    RB.OnChange := ChildCBChanged;
  end;

  Result := RB;
end;

procedure TFCheckBoxTree.CheckBoxSetChecked(FHandle: TFmxObject;
  FChecked: Boolean);
begin
  if FHandle is TCheckBox then
    TCheckBox(FHandle).IsChecked := FChecked;
end;

procedure TFCheckBoxTree.RadioBtnSetChecked(FHandle: TFmxObject;
  FChecked: Boolean);
begin
  if FHandle is TRadioButton then
    TRadioButton(FHandle).IsChecked := FChecked;
end;

procedure TFCheckBoxTree.RadioBtnGroupName(FHandle: TFmxObject;
  FGroupName: WideString);
begin
  if FHandle is TRadioButton then
    TRadioButton(FHandle).GroupName := FGroupName;
end;

procedure TFCheckBoxTree.SectionFontSetting(FHandle: TFmxObject;
  const FontName: WideString; FontSize: Single; FontColor: TAlphaColor);
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  TTreeViewItem(FHandle).StyledSettings := [];

  TTreeViewItem(FHandle).TextSettings.Font.Family := FontName;
  TTreeViewItem(FHandle).TextSettings.Font.Size := FontSize;
  TTreeViewItem(FHandle).TextSettings.FontColor := FontColor;
end;

procedure TFCheckBoxTree.CheckBoxFontSetting(FHandle: TFmxObject;
  const FontName: WideString; FontSize: Single; FontColor: TAlphaColor);
begin
  if not (FHandle is TCheckBox) then
    Exit;

  TCheckBox(FHandle).StyledSettings := [];

  TCheckBox(FHandle).TextSettings.Font.Family := FontName;
  TCheckBox(FHandle).TextSettings.Font.Size := FontSize;
  TCheckBox(FHandle).TextSettings.FontColor := FontColor;
end;

procedure TFCheckBoxTree.RadioBtnFontSetting(FHandle: TFmxObject;
  const FontName: WideString; FontSize: Single; FontColor: TAlphaColor);
begin
  if not (FHandle is TRadioButton) then
    Exit;

  TRadioButton(FHandle).StyledSettings := [];

  TRadioButton(FHandle).TextSettings.Font.Family := FontName;
  TRadioButton(FHandle).TextSettings.Font.Size := FontSize;
  TRadioButton(FHandle).TextSettings.FontColor := FontColor;
end;

procedure TFCheckBoxTree.SectionExpand(FHandle: TFmxObject);
var
  Item: TTreeViewItem;
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  Item := TTreeViewItem(FHandle);

  Item.IsExpanded := True;
  Item.RecalcSize;
  Item.Repaint;
end;

procedure TFCheckBoxTree.SectionExpandAll(FHandle: TFmxObject);
var
  Item: TTreeViewItem;
  i: Integer;
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  Item := TTreeViewItem(FHandle);

  Item.IsExpanded := True;

  for i := 0 to Item.Count - 1 do
    if Item.Items[i] is TTreeViewItem then
      SectionExpandAll(Item.Items[i]);

  Item.RecalcSize;
  Item.Repaint;
end;

procedure TFCheckBoxTree.SectionCollapse(FHandle: TFmxObject);
var
  Item: TTreeViewItem;
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  Item := TTreeViewItem(FHandle);

  Item.IsExpanded := False;
  Item.RecalcSize;
  Item.Repaint;
end;

procedure TFCheckBoxTree.SectionCollapseAll(FHandle: TFmxObject);
var
  Item: TTreeViewItem;
  i: Integer;
begin
  if not (FHandle is TTreeViewItem) then
    Exit;

  Item := TTreeViewItem(FHandle);

  for i := 0 to Item.Count - 1 do
    if Item.Items[i] is TTreeViewItem then
      SectionCollapseAll(Item.Items[i]);

  Item.IsExpanded := False;
  Item.RecalcSize;
  Item.Repaint;
end;

procedure TFCheckBoxTree.SectionEnable(FHandle: TFmxObject; FEnabled: Boolean);
begin
  if FHandle is TTreeViewItem then
    TTreeViewItem(FHandle).Enabled := FEnabled;
end;

procedure TFCheckBoxTree.CheckBoxEnable(FHandle: TFmxObject; FEnabled: Boolean);
begin
  if FHandle is TCheckBox then
    TCheckBox(FHandle).Enabled := FEnabled;
end;

procedure TFCheckBoxTree.RadioBtnEnable(FHandle: TFmxObject; FEnabled: Boolean);
begin
  if FHandle is TRadioButton then
    TRadioButton(FHandle).Enabled := FEnabled;
end;

procedure TFCheckBoxTree.ItemHeight(FHeight: Single);
begin
  TV.ItemHeight := FHeight;
end;

procedure TFCheckBoxTree.AlternatingRowBackground(FValue: Boolean);
begin
  TV.AlternatingRowBackground := FValue;
end;

procedure TFCheckBoxTree.RemoveBackground;
begin
  TV.StyleLookup := 'transparentlistboxstyle';
end;

procedure TFCheckBoxTree.CanFocus(FValue: Boolean);
begin
  TV.CanFocus := FValue;
end;

procedure TFCheckBoxTree.DisableFocusEffect(FValue: Boolean);
begin
  TV.DisableFocusEffect := FValue;
end;

procedure TFCheckBoxTree.DisableMouseWheel(FValue: Boolean);
begin
  TV.DisableMouseWheel := FValue;
end;

procedure TFCheckBoxTree.Opacity(FOpacity: Single);
begin
  TV.Opacity := FOpacity;
end;

procedure TFCheckBoxTree.RotationAngle(FValue: Single);
begin
  TV.RotationAngle := FValue;
end;

procedure TFCheckBoxTree.RotationCenter(X, Y: Single);
begin
  TV.RotationCenter.X := X;
  TV.RotationCenter.Y := Y;
end;

procedure TFCheckBoxTree.Enabled(FEnabled: Boolean);
begin
  TV.Enabled := FEnabled;
end;

procedure TFCheckBoxTree.Visible(FVisible: Boolean);
begin
  TV.Visible := FVisible;
end;

procedure TFCheckBoxTree.HitTest(FEnabled: Boolean);
begin
  TV.HitTest := FEnabled;
end;

procedure TFCheckBoxTree.ReFresh;
begin
  TV.RecalcSize;
  TV.Repaint;
end;

procedure TFCheckBoxTree.ItemOnMouseEnter(FHandle: TFmxObject;
  Event: TNotifyEvent);
begin
  if FHandle is TControl then
    TControl(FHandle).OnMouseEnter := Event;
end;

procedure TFCheckBoxTree.ItemOnMouseLeave(FHandle: TFmxObject;
  Event: TNotifyEvent);
begin
  if FHandle is TControl then
    TControl(FHandle).OnMouseLeave := Event;
end;

procedure TFCheckBoxTree.ItemOnChange(FHandle: TFmxObject; Event: TNotifyEvent);
begin
  if FHandle is TCheckBox then
    TCheckBox(FHandle).OnChange := Event
  else if FHandle is TRadioButton then
    TRadioButton(FHandle).OnChange := Event;
end;

function TFCheckBoxTree.CheckBoxGetChecked(FHandle: TFmxObject): Boolean;
begin
  Result := (FHandle is TCheckBox) and TCheckBox(FHandle).IsChecked;
end;

function TFCheckBoxTree.RadioBtnGetChecked(FHandle: TFmxObject): Boolean;
begin
  Result := (FHandle is TRadioButton) and TRadioButton(FHandle).IsChecked;
end;

function TFCheckBoxTree.GetText(FHandle: TFmxObject): WideString;
begin
  if FHandle is TTreeViewItem then
    Result := TTreeViewItem(FHandle).Text
  else if FHandle is TRadioButton then
    Result := TRadioButton(FHandle).Text
  else if FHandle is TCheckBox then
    Result := TCheckBox(FHandle).Text
  else
    Result := '';
end;

function TFCheckBoxTree.GetTag: Integer;
begin
  Result := TV.Tag;
end;

function TFCheckBoxTree.GetLeft: Single;
begin
  Result := TV.Position.X;
end;

function TFCheckBoxTree.GetTop: Single;
begin
  Result := TV.Position.Y;
end;

function TFCheckBoxTree.GetWidth: Single;
begin
  Result := TV.Width;
end;

function TFCheckBoxTree.GetHeight: Single;
begin
  Result := TV.Height;
end;

function TFCheckBoxTree.GetObjectCheckBox(FHandle: TFmxObject): TFmxObject;
begin
  if FHandle is TCheckBox then
    Result := FHandle
  else
    Result := nil;
end;

function TFCheckBoxTree.GetObjectRadioBtn(FHandle: TFmxObject): TFmxObject;
begin
  if FHandle is TRadioButton then
    Result := FHandle
  else
    Result := nil;
end;

function TFCheckBoxTree.Handle: TFmxObject;
begin
  Result := TV;
end;

// =============================================================================
// FLockScreen
// =============================================================================
destructor TFLockScreen.Destroy;
begin
  FShowTimer.Free;

  inherited;
end;

procedure TFLockScreen.FCreate(FParent: TFmxObject);
begin
  FOverlay := TRectangle.Create(nil);
  FOverlay.Parent := FParent;
  FOverlay.Visible := False;
  FOverlay.Enabled := False;
  FOverlay.Align := TAlignLayout.Client;
  FOverlay.Fill.Kind := TBrushKind.Solid;
  FOverlay.Fill.Color := $AA161616;
  FOverlay.Stroke.Thickness := 0;
  FOverlay.HitTest := False;
  FOverlay.BringToFront;
  FOverlay.Opacity := 0;

  FDateLabel := TLabel.Create(nil);
  FDateLabel.Parent := FOverlay;
  FDateLabel.Align := TAlignLayout.Bottom;
  FDateLabel.Margins.Left := 32;
  FDateLabel.Margins.Right := 32;
  FDateLabel.Margins.Bottom := 32;
  FDateLabel.Size.Height := 64;
  FDateLabel.TextSettings.Font.Size := 48;
  FDateLabel.TextSettings.Font.Family := 'Segoe UI Light';
  FDateLabel.TextSettings.FontColor := $FFFFFFFF;
  FDateLabel.StyledSettings := [TStyledSetting.Style];
  FDateLabel.Text := 'Friday, July 22';
  FDateLabel.HitTest := False;

  FTimeLabel := TLabel.Create(nil);
  FTimeLabel.Parent := FOverlay;
  FTimeLabel.Align := TAlignLayout.Bottom;
  FTimeLabel.Margins.Left := 32;
  FTimeLabel.Margins.Right := 32;
  FTimeLabel.Size.Height := 80;
  FTimeLabel.TextSettings.Font.Size := 80;
  FTimeLabel.TextSettings.Font.Family := 'Segoe UI Light';
  FTimeLabel.TextSettings.FontColor := $FFFFFFFF;
  FTimeLabel.StyledSettings := [TStyledSetting.Style];
  FTimeLabel.Text := '6:55 PM';
  FTimeLabel.HitTest := False;

  FShowDelay := 0;

  FShowTimer := TTimer.Create(nil);
  FShowTimer.Enabled := False;
  FShowTimer.OnTimer := ShowLockScreenTimer;

  FTime24Format := False;
end;

procedure TFLockScreen.ShowDelay(FSeconds: Single);
begin
  if FSeconds < 0 then
    FSeconds := 0;

  FShowDelay := FSeconds;
end;

procedure TFLockScreen.BackColor(FColor: TAlphaColor);
begin
  FOverlay.Fill.Kind := TBrushKind.Solid;
  FOverlay.Fill.Color := FColor;
end;

procedure TFLockScreen.BackGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  FOverlay.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(FOverlay.Fill, FColor1, FColor2, FStyle);
end;

procedure TFLockScreen.BackGradientLinearAngle(FAngle: Single);
begin
  FOverlay.Fill.Kind := TBrushKind.Gradient;
  FOverlay.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(FOverlay.Fill, FAngle);
end;

procedure TFLockScreen.BackGradientRadialAngle(FAngle: Single);
begin
  FOverlay.Fill.Kind := TBrushKind.Gradient;
  FOverlay.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(FOverlay.Fill, FAngle);
end;

procedure TFLockScreen.BackGradientPosition(X1, Y1, X2, Y2: Single);
begin
  FOverlay.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(FOverlay.Fill, X1, Y1, X2, Y2);
end;

procedure TFLockScreen.BackCornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
  FCornerType: TCornerType);
begin
  FOverlay.CornerType := FCornerType;
  FOverlay.Corners := FCorners;
  FOverlay.XRadius := XRadi;
  FOverlay.YRadius := YRadi;
end;

procedure TFLockScreen.BackSides(FSides: TSides);
begin
  FOverlay.Sides := FSides;
end;

procedure TFLockScreen.TimeText24Format(FValue: Boolean);
begin
  FTime24Format := FValue;
end;

procedure TFLockScreen.TimeTextPosition(FLeft, FTop: Single);
begin
  FTimeLabel.Position.X := FLeft;
  FTimeLabel.Position.Y := FTop;
end;

procedure TFLockScreen.TimeTextHide;
begin
  FTimeLabel.Visible := False;
  FTimeLabel.Enabled := False;
end;

procedure TFLockScreen.TimeTextFontSetting(const FontName: WideString;
  FontSize: Single; FontColor: TAlphaColor);
begin
  FTimeLabel.StyledSettings := [];

  FTimeLabel.TextSettings.Font.Family := FontName;
  FDateLabel.TextSettings.Font.Family := FontName;

  FTimeLabel.TextSettings.Font.Size := FontSize;
  FDateLabel.TextSettings.Font.Size := Max(10, FontSize - 45);

  FTimeLabel.TextSettings.FontColor := FontColor;
  FDateLabel.TextSettings.FontColor := FontColor;
end;

procedure TFLockScreen.ShowLockScreen;
begin
  if FOverlay.Visible then
    Exit;

  if FShowTimer.Enabled then
    Exit;

  if FShowDelay > 0 then
  begin
    FShowTimer.Interval := Round(FShowDelay * 1000);

    if FShowTimer.Interval < 1 then
      FShowTimer.Interval := 1;

    FShowTimer.Enabled := True;
    Exit;
  end;

  ShowLockScreenTimer(nil);
end;

procedure TFLockScreen.ShowLockScreenTimer(Sender: TObject);
var
  TNow: TDateTime;
begin
  FShowTimer.Enabled := False;

  if FOverlay.Visible then
    Exit;

  TNow := Now;

  if FTime24Format then
    FTimeLabel.Text := FormatDateTime('HH:nn', TNow)
  else
    FTimeLabel.Text := FormatDateTime('hh:nn AM/PM', TNow);

  FDateLabel.Text := FormatDateTime('dddd, mmmm d', TNow);

  FOverlay.Visible := True;
  FOverlay.Enabled := True;
  FOverlay.Opacity := 0;

  TAnimator.AnimateFloatDelay(FOverlay, 'Opacity', 1,
      0.5, 0.2, TAnimationType.InOut, TInterpolationType.Linear);
end;

procedure TFLockScreen.HideLockScreen;
begin
  FShowTimer.Enabled := False;

  if not FOverlay.Visible then
    Exit;

  TAnimator.AnimateFloatWait(FOverlay, 'Opacity', 0,
      0.4, TAnimationType.InOut, TInterpolationType.Linear);

  FOverlay.Enabled := False;
  FOverlay.Visible := False;
end;

function TFLockScreen.Handle: TFmxObject;
begin
  Result := FOverlay;
end;

// =============================================================================
// FShadowText
// =============================================================================
procedure TFShadowText.FCreate(FParent: TFmxObject);
begin
  ControlShadowText := TStyleTextObject.Create(nil);
  ControlShadowText.Parent := FParent;
  ControlShadowText.ShadowVisible := True;
  ControlShadowText.Text := 'ShadowText1';
end;

procedure TFShadowText.Cursor(FCursor: TCursor);
begin
  ControlShadowText.Cursor := FCursor;
end;

procedure TFShadowText.Left(FLeft: Single);
begin
  ControlShadowText.Position.X := FLeft;
end;

procedure TFShadowText.Top(FTop: Single);
begin
  ControlShadowText.Position.Y := FTop;
end;

procedure TFShadowText.Height(FHeight: Single);
begin
  ControlShadowText.Height := FHeight;
end;

procedure TFShadowText.Width(FWidth: Single);
begin
  ControlShadowText.Width := FWidth;
end;

procedure TFShadowText.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlShadowText.SetBounds(FLeft, FTop, FWidth, FHeight);
end;

procedure TFShadowText.Position(X, Y: Single);
begin
  ControlShadowText.Position.X := X;
  ControlShadowText.Position.Y := Y;
end;

procedure TFShadowText.Align(Al: TAlignLayout);
begin
  ControlShadowText.Align := Al;
end;

procedure TFShadowText.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlShadowText.Margins.Left := FLeft;
  ControlShadowText.Margins.Top := FTop;
  ControlShadowText.Margins.Right := FRight;
  ControlShadowText.Margins.Bottom := FBottom;
end;

procedure TFShadowText.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlShadowText.Margins.Left := FLeft;
  ControlShadowText.Margins.Top := FTop;
  ControlShadowText.Margins.Right := FRight;
  ControlShadowText.Margins.Bottom := FBottom;
end;

procedure TFShadowText.SetHint(const FText: WideString);
begin
  ControlShadowText.ShowHint := True;
  ControlShadowText.Hint := FText;
end;

procedure TFShadowText.SetClipChildren(FValue: Boolean);
begin
  ControlShadowText.ClipChildren := FValue;
end;

procedure TFShadowText.SetClipParent(FValue: Boolean);
begin
  ControlShadowText.ClipParent := FValue;
end;

procedure TFShadowText.BringToFront;
begin
  ControlShadowText.BringToFront;
end;

procedure TFShadowText.SendToBack;
begin
  ControlShadowText.SendToBack;
end;

procedure TFShadowText.SetTag(FTag: Integer);
begin
  ControlShadowText.Tag := FTag;
end;

procedure TFShadowText.AutoSize(FAutoSize: Boolean);
begin
  ControlShadowText.AutoSize := FAutoSize;
end;

procedure TFShadowText.Text(const FText: WideString);
begin
  ControlShadowText.Text := FText;
end;

procedure TFShadowText.Stretch(FStretch: Boolean);
begin
  ControlShadowText.Stretch := FStretch;
end;

procedure TFShadowText.FontSetting(const FontName: WideString; FontSize: Single;
  FontColor: TAlphaColor);
begin
  ControlShadowText.TextSettings.Font.Family := FontName;
  ControlShadowText.TextSettings.Font.Size := FontSize;
  ControlShadowText.TextSettings.FontColor := FontColor;
end;

procedure TFShadowText.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlShadowText.TextSettings.WordWrap := FWordWrap;
  ControlShadowText.TextSettings.HorzAlign := FHorzAlign;
  ControlShadowText.TextSettings.VertAlign := FVertAlign;
end;

procedure TFShadowText.Color(FontColor: TAlphaColor);
begin
  ControlShadowText.TextSettings.FontColor := FontColor;
end;

procedure TFShadowText.ShadowVisible(FValue: Boolean);
begin
  ControlShadowText.ShadowVisible := FValue;
end;

procedure TFShadowText.ShadowColor(FColor: TAlphaColor);
begin
  ControlShadowText.Shadow.Color := FColor;
end;

procedure TFShadowText.ShadowOffset(OffsetX, OffsetY: Single);
begin
  ControlShadowText.Shadow.Offset.X := OffsetX;
  ControlShadowText.Shadow.Offset.Y := OffsetY;
end;

procedure TFShadowText.Opacity(FOpacity: Single);
begin
  ControlShadowText.Opacity := FOpacity;
end;

procedure TFShadowText.RotationAngle(FValue: Single);
begin
  ControlShadowText.RotationAngle := FValue;
end;

procedure TFShadowText.RotationCenter(X, Y: Single);
begin
  ControlShadowText.RotationCenter.X := X;
  ControlShadowText.RotationCenter.Y := Y;
end;

procedure TFShadowText.Enabled(FEnabled: Boolean);
begin
  ControlShadowText.Enabled := FEnabled;
end;

procedure TFShadowText.Visible(FVisible: Boolean);
begin
  ControlShadowText.Visible := FVisible;
end;

procedure TFShadowText.HitTest(FEnabled: Boolean);
begin
  ControlShadowText.HitTest := FEnabled;
end;

function TFShadowText.GetText: WideString;
begin
  Result := ControlShadowText.Text;
end;

function TFShadowText.GetTag: Integer;
begin
  Result := ControlShadowText.Tag
end;

function TFShadowText.GetLeft: Single;
begin
  Result := ControlShadowText.Position.X;
end;

function TFShadowText.GetTop: Single;
begin
  Result := ControlShadowText.Position.Y;
end;

function TFShadowText.GetHeight: Single;
begin
  Result := ControlShadowText.Height;
end;

function TFShadowText.GetWidth: Single;
begin
  Result := ControlShadowText.Width;
end;

function TFShadowText.GetObject: TFmxObject;
begin
  Result := ControlShadowText;
end;

procedure TFShadowText.OnClick(Event: TNotifyEvent);
begin
  ControlShadowText.OnClick := Event;
end;

procedure TFShadowText.OnMouseDown(Event: TMouseEvent);
begin
  ControlShadowText.OnMouseDown := Event;
end;

procedure TFShadowText.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlShadowText.OnMouseEnter := Event;
end;

procedure TFShadowText.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlShadowText.OnMouseLeave := Event;
end;

procedure TFShadowText.OnMouseUp(Event: TMouseEvent);
begin
  ControlShadowText.OnMouseUp := Event;
end;

function TFShadowText.Handle: TFmxObject;
begin
  Result := ControlShadowText;
end;

// =============================================================================
// FHighlight
// =============================================================================
constructor TFHighlight.Create;
begin
  inherited;
  FDuration := 0.25;
end;

procedure TFHighlight.FCreate(FParent: TFmxObject);
begin
  FRect := TRectangle.Create(nil);
  FRect.Parent := FParent;
  FRect.Fill.Kind := TBrushKind.Solid;
  FRect.Fill.Color := $FF60CDFF;
  FRect.CornerType := TCornerType.Round;
  FRect.Corners := [TCorner.TopLeft, TCorner.TopRight, TCorner.BottomLeft,
    TCorner.BottomRight];
  FRect.XRadius := 1.5;
  FRect.YRadius := 1.5;
  FRect.Stroke.Kind := TBrushKind.None;
  FRect.Size.Width := 3;
  FRect.Size.Height := 16;
  FRect.HitTest := False;
  FRect.BringToFront;
end;

procedure TFHighlight.SetNewPos(NewPos: Single);
begin
  FTargetPos := NewPos;
end;

procedure TFHighlight.DoPlay;
var
  AniPos, AniScale: TFloatAnimation;
  PropName: string;
  StartPos: Single;
begin
  if FVertical then
  begin
    PropName := 'Position.X';
    StartPos := FRect.Position.X;
  end
  else
  begin
    PropName := 'Position.Y';
    StartPos := FRect.Position.Y;
  end;

  AniPos := TFloatAnimation.Create(FRect);
  AniPos.Parent := FRect;
  AniPos.PropertyName := PropName;
  AniPos.StartValue := StartPos;
  AniPos.StopValue := FTargetPos;
  AniPos.Duration := FDuration;
  AniPos.Interpolation := TInterpolationType.Linear;
  AniPos.Start;

  AniScale := TFloatAnimation.Create(FRect);
  AniScale.Parent := FRect;
  if FVertical then
    AniScale.PropertyName := 'Scale.X'
  else
    AniScale.PropertyName := 'Scale.Y';

  AniScale.StartValue := 1.0;
  AniScale.StopValue := 1.4;
  AniScale.Duration := FDuration * 0.9;
  AniScale.Interpolation := TInterpolationType.Linear;
  AniScale.AutoReverse := True;
  AniScale.Start;
end;

procedure TFHighlight.Position(X, Y: Single);
begin
  FRect.Position.Point := PointF(X, Y);
end;

procedure TFHighlight.Color(FColor: TAlphaColor);
begin
  FRect.Fill.Kind := TBrushKind.Solid;
  FRect.Fill.Color := FColor;
end;

procedure TFHighlight.Duration(FDuration: Single);
begin
  Self.FDuration := FDuration;
end;

procedure TFHighlight.Vertical(FVertical: Boolean);
begin
  Self.FVertical := FVertical;
end;

procedure TFHighlight.HighlightSize(FWidth, FHeight: Single);
begin
  FRect.Size.Width := FWidth;
  FRect.Size.Height := FHeight;
end;

procedure TFHighlight.Hide;
begin
  FRect.Visible := False;
  FRect.Enabled := False;
end;

procedure TFHighlight.Show;
begin
  FRect.Visible := True;
  FRect.Enabled := True;
end;

// =============================================================================
// Exports
// =============================================================================
function InitPageControlHandle: FPageControl;
begin
  Result := TFPageControl.Create;
end;

function InitPageItemHandle: FPageItem;
begin
  Result := TFPageItem.Create;
end;

function InitTileHandle: FTile;
begin
  Result := TFTile.Create;
end;

function InitUWPTilesHandle: FUWPTiles;
begin
  Result := TFUWPTiles.Create;
end;

function InitRatingBar: FRatingBar;
begin
  Result := TFRatingBar.Create;
end;

function InitMarquee: FMarquee;
begin
  Result := TFMarquee.Create;
end;

function InitCheckBoxTree: FCheckBoxTree;
begin
  Result := TFCheckBoxTree.Create;
end;

function InitLockScreenHandle: FLockScreen;
begin
  Result := TFLockScreen.Create;
end;

function InitShadowTextHandle: FShadowText;
begin
  Result := TFShadowText.Create;
end;

function InitHighlight: FHighlight;
begin
  Result := TFHighlight.Create;
end;

exports
  InitPageControlHandle,
  InitPageItemHandle,
  InitTileHandle,
  InitUWPTilesHandle,
  InitRatingBar,
  InitMarquee,
  InitCheckBoxTree,
  InitLockScreenHandle,
  InitShadowTextHandle,
  InitHighlight;

end.
