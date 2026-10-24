
// ########################################################################## \\
// #    FMXBridge Handle - v3.0.0.0                                         # \\
// #    Last Updated: 24.Oct.2026                                           # \\
// #    RAD Studio 13.2 Build: 37.0.60952.8797 RTM Update 2                 # \\
// ########################################################################## \\

#if VER < 0x07000000
  #error FMXBridge requires Inno Setup version 7.0.0 or higher to compile.
#endif

[Code]

// =============================================================================
// FMX Colors
// =============================================================================
const
  ALAliceBlue = $FFF0F8FF;
  ALAntiqueWhite = $FFFAEBD7;
  ALAqua = $FF00FFFF;
  ALAquamarine = $FF7FFFD4;
  ALAzure = $FFF0FFFF;
  ALBeige = $FFF5F5DC;
  ALBisque = $FFFFE4C4;
  ALBlack = $FF000000;
  ALBlanchedAlmond = $FFFFEBCD;
  ALBlue = $FF0000FF;
  ALBlueViolet = $FF8A2BE2;
  ALBrown = $FFA52A2A;
  ALBurlyWood = $FFDEB887;
  ALCadetBlue = $FF5F9EA0;
  ALChartreuse = $FF7FFF00;
  ALChocolate = $FFD2691E;
  ALCoral = $FFFF7F50;
  ALCornflowerBlue = $FF6495ED;
  ALCornsilk = $FFFFF8DC;
  ALCrimson = $FFDC143C;
  ALCyan = $FF00FFFF;
  ALDarkBlue = $FF00008B;
  ALDarkCyan = $FF008B8B;
  ALDarkGoldenrod = $FFB8860B;
  ALDarkGray = $FFA9A9A9;
  ALDarkGrey = $FFA9A9A9;
  ALDarkGreen = $FF006400;
  ALDarkKhaki = $FFBDB76B;
  ALDarkMagenta = $FF8B008B;
  ALDarkOliveGreen = $FF556B2F;
  ALDarkOrange = $FFFF8C00;
  ALDarkOrchid = $FF9932CC;
  ALDarkRed = $FF8B0000;
  ALDarkSalmon = $FFE9967A;
  ALDarkSeaGreen = $FF8FBC8F;
  ALDarkSlateBlue = $FF483D8B;
  ALDarkSlateGray = $FF2F4F4F;
  ALDarkSlateGrey = $FF2F4F4F;
  ALDarkTurquoise = $FF00CED1;
  ALDarkViolet = $FF9400D3;
  ALDeepPink = $FFFF1493;
  ALDeepSkyBlue = $FF00BFFF;
  ALDimGray = $FF696969;
  ALDimGrey = $FF696969;
  ALDodgerBlue = $FF1E90FF;
  ALFireBrick = $FFB22222;
  ALFloralWhite = $FFFFFAF0;
  ALForestGreen = $FF228B22;
  ALFuchsia = $FFFF00FF;
  ALGainsboro = $FFDCDCDC;
  ALGhostWhite = $FFF8F8FF;
  ALGold = $FFFFD700;
  ALGoldenrod = $FFDAA520;
  ALGray = $FF808080;
  ALGreen = $FF008000;
  ALGreenYellow = $FFADFF2F;
  ALHoneydew = $FFF0FFF0;
  ALHotPink = $FFFF69B4;
  ALIndianRed = $FFCD5C5C;
  ALIndigo = $FF4B0082;
  ALIvory = $FFFFFFF0;
  ALKhaki = $FFF0E68C;
  ALLavender = $FFE6E6FA;
  ALLavenderBlush = $FFFFF0F5;
  ALLawnGreen = $FF7CFC00;
  ALLemonChiffon = $FFFFFACD;
  ALLightBlue = $FFADD8E6;
  ALLightCoral = $FFF08080;
  ALLightCyan = $FFE0FFFF;
  ALLightGoldenrodYellow = $FFFAFAD2;
  ALLightGray = $FFD3D3D3;
  ALLightGrey = $FFD3D3D3;
  ALLightGreen = $FF90EE90;
  ALLightPink = $FFFFB6C1;
  ALLightSalmon = $FFFFA07A;
  ALLightSeaGreen = $FF20B2AA;
  ALLightSkyBlue = $FF87CEFA;
  ALLightSlateGray = $FF778899;
  ALLightSlateGrey = $FF778899;
  ALLightSteelBlue = $FFB0C4DE;
  ALLightYellow = $FFFFFFE0;
  ALLime = $FF00FF00;
  ALLimeGreen = $FF32CD32;
  ALLinen = $FFFAF0E6;
  ALMagenta = $FFFF00FF;
  ALMaroon = $FF800000;
  ALMediumAquamarine = $FF66CDAA;
  ALMediumBlue = $FF0000CD;
  ALMediumOrchid = $FFBA55D3;
  ALMediumPurple = $FF9370DB;
  ALMediumSeaGreen = $FF3CB371;
  ALMediumSlateBlue = $FF7B68EE;
  ALMediumSpringGreen = $FF00FA9A;
  ALMediumTurquoise = $FF48D1CC;
  ALMediumVioletRed = $FFC71585;
  ALMidnightBlue = $FF191970;
  ALMintCream = $FFF5FFFA;
  ALMistyRose = $FFFFE4E1;
  ALMoccasin = $FFFFE4B5;
  ALNavajoWhite = $FFFFDEAD;
  ALNavy = $FF000080;
  ALOldLace = $FFFDF5E6;
  ALOlive = $FF808000;
  ALOliveDrab = $FF6B8E23;
  ALOrange = $FFFFA500;
  ALOrangeRed = $FFFF4500;
  ALOrchid = $FFDA70D6;
  ALPaleGoldenrod = $FFEEE8AA;
  ALPaleGreen = $FF98FB98;
  ALPaleTurquoise = $FFAFEEEE;
  ALPaleVioletRed = $FFDB7093;
  ALPapayaWhip = $FFFFEFD5;
  ALPeachPuff = $FFFFDAB9;
  ALPeru = $FFCD853F;
  ALPink = $FFFFC0CB;
  ALPlum = $FFDDA0DD;
  ALPowderBlue = $FFB0E0E6;
  ALPurple = $FF800080;
  ALRebeccaPurple = $FF663399;
  ALRed = $FFFF0000;
  ALRosyBrown = $FFBC8F8F;
  ALRoyalBlue = $FF4169E1;
  ALSaddleBrown = $FF8B4513;
  ALSalmon = $FFFA8072;
  ALSandyBrown = $FFF4A460;
  ALSeaGreen = $FF2E8B57;
  ALSeaShell = $FFFFF5EE;
  ALSienna = $FFA0522D;
  ALSilver = $FFC0C0C0;
  ALSkyBlue = $FF87CEEB;
  ALSlateBlue = $FF6A5ACD;
  ALSlateGray = $FF708090;
  ALSnow = $FFFFFAFA;
  ALSpringGreen = $FF00FF7F;
  ALSteelBlue = $FF4682B4;
  ALTan = $FFD2B48C;
  ALTeal = $FF008080;
  ALThistle = $FFD8BFD8;
  ALTomato = $FFFF6347;
  ALTurquoise = $FF40E0D0;
  ALViolet = $FFEE82EE;
  ALWheat = $FFF5DEB3;
  ALWhite = $FFFFFFFF;
  ALWhiteSmoke = $FFF5F5F5;
  ALYellow = $FFFFFF00;
  ALYellowGreen = $FF9ACD32;
  ALNull = $00000000;

// =============================================================================
// ExitWindowsEx - shutdown flags
// =============================================================================
  EWX_LOGOFF = 0;
  EWX_SHUTDOWN = 1;
  EWX_REBOOT = 2;
  EWX_FORCE = 4;
  EWX_POWEROFF = 8;
  EWX_FORCEIFHUNG = $10;
  EWX_QUICKRESOLVE = $20;
  EWX_RESTARTAPPS = $40;

// =============================================================================
// PlaySound - sound flags
// =============================================================================
  SND_SYNC = $0000;
  SND_ASYNC = $0001;
  SND_NODEFAULT = $0002;
  SND_MEMORY = $0004;
  SND_LOOP = $0008;
  SND_FILENAME = $00020000;
  SND_RESOURCE = $00040004;
  SND_PURGE = $40;

// =============================================================================
// Windows - Virtual-Key Codes
// =============================================================================
  vkLButton = $01;
  vkRButton = $02;
  vkCancel = $03;
  vkMButton = $04;
  vkXButton1 = $05;
  vkXButton2 = $06;
  vkBack = $08;
  vkTab = $09;
  vkLineFeed = $0A;
  vkClear = $0C;
  vkReturn = $0D;
  vkShift = $10;
  vkControl = $11;
  vkMenu = $12;
  vkPause = $13;
  vkCapital = $14;
  vkKana = $15;
  vkHangul = $15;
  vkJunja = $17;
  vkFinal = $18;
  vkHanja = $19;
  vkKanji = $19;
  vkConvert = $1C;
  vkNonConvert = $1D;
  vkAccept = $1E;
  vkModeChange = $1F;
  vkEscape = $1B;
  vkSpace = $20;
  vkPrior = $21;
  vkNext = $22;
  vkEnd = $23;
  vkHome = $24;
  vkLeft = $25;
  vkUp = $26;
  vkRight = $27;
  vkDown = $28;
  vkSelect = $29;
  vkPrint = $2A;
  vkExecute = $2B;
  vkSnapshot = $2C;
  vkInsert = $2D;
  vkDelete = $2E;
  vkHelp = $2F;
  vk0 = $30;
  vk1 = $31;
  vk2 = $32;
  vk3 = $33;
  vk4 = $34;
  vk5 = $35;
  vk6 = $36;
  vk7 = $37;
  vk8 = $38;
  vk9 = $39;
  vkLCommand = $3D;
  vkRCommand = $3E;
  vkFunction = $3F;
  vkA = $41;
  vkB = $42;
  vkC = $43;
  vkD = $44;
  vkE = $45;
  vkF = $46;
  vkG = $47;
  vkH = $48;
  vkI = $49;
  vkJ = $4A;
  vkK = $4B;
  vkL = $4C;
  vkM = $4D;
  vkN = $4E;
  vkO = $4F;
  vkP = $50;
  vkQ = $51;
  vkR = $52;
  vkS = $53;
  vkT = $54;
  vkU = $55;
  vkV = $56;
  vkW = $57;
  vkX = $58;
  vkY = $59;
  vkZ = $5A;
  vkLWin = $5B;
  vkRWin = $5C;
  vkApps = $5D;
  vkSleep = $5F;
  vkNumpad0 = $60;
  vkNumpad1 = $61;
  vkNumpad2 = $62;
  vkNumpad3 = $63;
  vkNumpad4 = $64;
  vkNumpad5 = $65;
  vkNumpad6 = $66;
  vkNumpad7 = $67;
  vkNumpad8 = $68;
  vkNumpad9 = $69;
  vkMultiply = $6A;
  vkAdd = $6B;
  vkSeparator = $6C;
  vkSubtract = $6D;
  vkDecimal = $6E;
  vkDivide = $6F;
  vkF1 = $70;
  vkF2 = $71;
  vkF3 = $72;
  vkF4 = $73;
  vkF5 = $74;
  vkF6 = $75;
  vkF7 = $76;
  vkF8 = $77;
  vkF9 = $78;
  vkF10 = $79;
  vkF11 = $7A;
  vkF12 = $7B;
  vkF13 = $7C;
  vkF14 = $7D;
  vkF15 = $7E;
  vkF16 = $7F;
  vkF17 = $80;
  vkF18 = $81;
  vkF19 = $82;
  vkF20 = $83;
  vkF21 = $84;
  vkF22 = $85;
  vkF23 = $86;
  vkF24 = $87;
  vkCamera = $88;
  vkHardwareBack = $89;
  vkNumLock = $90;
  vkScroll = $91;
  vkLShift = $A0;
  vkRShift = $A1;
  vkLControl = $A2;
  vkRControl = $A3;
  vkLMenu = $A4;
  vkRMenu = $A5;
  vkBrowserBack = $A6;
  vkBrowserForward = $A7;
  vkBrowserRefresh = $A8;
  vkBrowserStop = $A9;
  vkBrowserSearch = $AA;
  vkBrowserFavorites = $AB;
  vkBrowserHome = $AC;
  vkVolumeMute = $AD;
  vkVolumeDown = $AE;
  vkVolumeUp = $AF;
  vkMediaNextTrack = $B0;
  vkMediaPrevTrack = $B1;
  vkMediaStop = $B2;
  vkMediaPlayPause = $B3;
  vkLaunchMail = $B4;
  vkLaunchMediaSelect = $B5;
  vkLaunchApp1 = $B6;
  vkLaunchApp2 = $B7;
  vkSemicolon = $BA;
  vkEqual = $BB;
  vkComma = $BC;
  vkMinus = $BD;
  vkPeriod = $BE;
  vkSlash = $BF;
  vkTilde = $C0;
  vkLeftBracket = $DB;
  vkBackslash = $DC;
  vkRightBracket = $DD;
  vkQuote = $DE;
  vkPara = $DF;
  vkOem102 = $E2;
  vkIcoHelp = $E3;
  vkIco00 = $E4;
  vkProcessKey = $E5;
  vkIcoClear = $E6;
  vkPacket = $E7;
  vkAttn = $F6;
  vkCrsel = $F7;
  vkExsel = $F8;
  vkErEof = $F9;
  vkPlay = $FA;
  vkZoom = $FB;
  vkNoname = $FC;
  vkPA1 = $FD;
  vkOemClear = $FE;
  vkNone = $FF;

// =============================================================================
// FMX Enumerations
// =============================================================================
type
  TAlphaColor = Cardinal;
  TFmxObject = NativeInt;
  IImageList = NativeInt;
  ITabItem = NativeInt;
  IMaterialSource = NativeInt;

  TBackdropType = (btAuto, btNone, btMain, btTabbed, btAcrylic);
  TCanvasQuality = (SystemDefault, HighPerformance, HighQuality);
  TStyledSetting = (ssFamily, ssSize, ssStyle, ssFontColor, ssOther);
  TStyledSettings = set of TStyledSetting;
  TTextAlign = (txCenter, txLeading, txTrailing);
  TCorner = (tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight);
  TCorners = set of TCorner;
  TCornerType = (ctRound, ctBevel, ctInnerRound, ctInnerLine);
  TSide = (tsTop, tsLeft, tsBottom, tsRight);
  TSides = set of TSide;
  TAniIndicatorStyle = (aisLinear, aisCircular);
  TWrapMode = (wmTile, wmTileOriginal, wmTileStretch);
  TGradientStyle = (gsLinear, gsRadial);
  TAnimationType = (atIn, atOut, atInOut);
  TInterpolationType = (itLinear, itQuadratic, itCubic, itQuartic, itQuintic,
    itSinusoidal, itExponential, itCircular, itElastic, itBack, itBounce);
  TBoundsMode = (bmLegacyBounds, bmShapeBounds);
  TDropDownKind = (ddkCustom, ddkNative);
  TPlacement = (plBottom, plTop, plLeft, plRight, plCenter, plBottomCenter,
    plTopCenter, plLeftCenter, plRightCenter, plAbsolute, plMouse, plMouseCenter);
  TTabTransition = (ttNone, ttSlide, ttFade);
  TTabTransitionDirection = (ttdNormal, ttdReversed);
  TTabPosition = (tpTop, tpBottom, tpNone, tpDots, tpPlatformDefault);
  TSlidingMode = (smPushingDetailView, smOverlapDetailView);
  TPanelPlacement = (ppLeft, ppRight, ppTop, ppBottom);
  TMultiViewMode = (mvmPlatformBehaviour, mvmPanel, mvmPopover, mvmDrawer,
    mvmCustom, mvmNavigationPane);
  THTTPCompressionMethod = (Deflate, GZip, Brotli, Any);
  THTTPCompressionMethods = set of THTTPCompressionMethod;
  THTTPProtocolVersion = (UNKNOWN_HTTP, HTTP_1_0, HTTP_1_1, HTTP_2_0, HTTP_3_0);
  THTTPRedirectWithGET = (Post301, Post302, Post303, Post307, Post308, Put301,
    Put302, Put303, Put307, Put308, Delete301, Delete302, Delete303, Delete307,
    Delete308);
  THTTPRedirectsWithGET = set of THTTPRedirectWithGET;
  THTTPSecureProtocol = (SSL2, SSL3, TLS1, TLS11, TLS12, TLS13);
  THTTPSecureProtocols = set of THTTPSecureProtocol;
  TStrokeCap = (scFlat, scRound);
  TStrokeDash = (sdSolid, sdDash, sdDot, sdDashDot, sdDashDotDot, sdCustom);
  TStrokeJoin = (sjMiter, sjRound, sjBevel);
  TLineLocation = (llLBoundary, llInner, llInnerWithin);
  TLineType = (ltDiagonal, ltTop, ltLeft, ltBottom, ltRight);
  TPathWrapMode = (pwmOriginal, pwmFit, pwmStretch, pwmTile);
  TImageWrapMode = (iwOriginal, iwFit, iwStretch, iwTile, iwCenter, iwPlace);
  TCalloutPosition = (cpTop, cpLeft, cpBottom, cpRight);
  TAlignLayout = (None, Top, TopLeft, TopCenter, TopRight, Left, LeftTop,
    LeftCenter, LeftBottom, Right, RightTop, RightCenter, RightBottom, Bottom,
    BottomLeft, BottomCenter, BottomRight, MostTop, MostBottom, MostLeft,
    MostRight, Client, Contents, Center, VertCenter, HorzCenter, Horizontal,
    Vertical, Scale, Fit, FitLeft, FitRight);
  TOrientation = (oHorizontal, oVertical);
  TGPLSizeStyle = (gplssAbsolute, gplssPercent, gplssAuto, gplssWeight);
  TFlowDirection = (fdLeftToRight, fdRightToLeft);
  TFlowJustify = (fjLeft, fjRight, fjCenter, fjJustify);
  TTextTrimming = (txNone, txCharacter, txWord);
  TShortCut = Word;
  TAccessory = (aNone, aMore, aDetail, aCheckmark);
  TListGroupingKind = (lgkPlain, lgkGrouped);
  TListStyle = (lsVertical, lsHorizontal);
  TMultiSelectStyle = (mssNone, mssDefault, mssExtended);
  TMultisample = (msNone, msTwoSamples, msFourSamples);
  TProjection = (pjCamera, pjScreen);
  TLightType = (ltDirectional, ltPoint, ltSpot);
  TMeshWrapMode = (mwmOriginal, mwmFit, mwmStretch, mwmResize);
  TExtrudedShapeSide = (essFront, essBack, essShaft);
  TExtrudedShapeSides = set of TExtrudedShapeSide;
  TRadiantDirection = (rdUp, rdRight, rdDown, rdLeft);
  TRadiantDimensionUnits = (rduScaleFactor, rduPixels);
  TRadiantBannerEndStyle = (rbesBookmark, rbesChevron);
  TRadiantCalloutAlignment = (rcaLeading, rcaCenter, rcaTrailing);
  TRadiantArrowWidth = (rawThin, rawNormal, rawWide);
  TRadiantLineSlope = (rlsPositive, rlsNegative, rlsHorizontal, rlsVertical);
  TRadiantShowArrows = (rsaNoArrows, rsaStart, rsaFinish, rsaBoth);
  TRadiantShieldStyle = (rssTraditional, rssPointed, rssConcave, rssCurved,
    rssAngled, rssMedieval, rssRounded, rssBadge, rssInterstate, rssRoute);
  TRadiantTriangleType = (rttIsosceles, rttRightAngle);
  TSpinnerKind = (Win11, Arcs, DoubleBounce, FlipPlane, Pulse,
    ArcsRing, Ring, ThreeDots, Wave, BallClipRotate, BallClipRotatePulse,
    BallClipRotateMultiple, BallScaleRipple, InnerLineSpinFade,
    LineScalePulseOut, LineScalePulseOutRapid);
  TPageMove = (pmNormal, pmReverse);
  TPageDirection = (pdNone, pdHorizontal, pdVertical, pdFade);
  TDriveType = (dtUnknown, dtNoRootDir, dtRemovable,
    dtFixed, dtRemote, dtCDROM, dtRAMDisk);
  TUserType = (utUnknown, utUser, utAdmin, utGuest, utSystem);

// =============================================================================
// FMX Callback Types
// =============================================================================
  TFileDropCallback = procedure(Sender: TObject; const FileName: WideString);
  TDownloadCallback = function(const FUrl, FOutfile: WideString;
    const ProgressCurrent, ProgressMax, SpeedKBps: Int64): Boolean;
  TBASSProgressCallback = procedure(const Percent: Single;
    const Duration, Position, CurrentFile: WideString);
  TThumbButtonCallback = procedure(const Index: Integer);

// =============================================================================
// FMX Event Types
// =============================================================================
  TKeyEventF = procedure(Sender: TObject; var Key: Word; var KeyChar: WideChar;
    Shift: TShiftState);
  TMouseEventF = procedure(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Single);
  TMouseWheelEventF = procedure(Sender: TObject; Shift: TShiftState;
    WheelDelta: Integer; var Handled: Boolean);
  TMouseMoveEventF = procedure(Sender: TObject; Shift: TShiftState;
    X, Y: Single);

// =============================================================================
// FForm
// =============================================================================
type
  FForm = interface(IUnknown)
    '{C4797C10-4C8F-4102-9EFC-5EDC659D97EE}'
    procedure FCreateBackdropForm(FHost: HWND; FBackType: TBackdropType;
      FDark, FRound: Boolean);
    procedure FCreateBlurForm(FHost: HWND; FColor: TAlphaColor;
      FRound: Boolean);
    procedure FCreateBlankForm(FHost: HWND; FColor: TAlphaColor;
      const FImage: WideString; FRound: Boolean);
    procedure FCreateImageForm(FHost: HWND; FColor: TAlphaColor;
      const FImage: WideString; FOpacity: Boolean);
    procedure ChangeFormImage(const FImage: WideString);
    procedure ChangeFormColor(FColor: TAlphaColor);
    procedure ChangeDarkMode(const FDark: Boolean);
    procedure ChangeBorderColor(FColor: TAlphaColor);
    procedure GradientFormColors(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure GradientFormLinearAngle(FAngle: Single);
    procedure GradientFormRadialAngle(FAngle: Single);
    procedure GradientFormPosition(X1, Y1, X2, Y2: Single);
    procedure LoadStyleFromFile(const StyleFile: WideString;
      AccentColor: TAlphaColor);
    procedure SetCursor(const CursorFile: WideString);
    procedure Caption(const FText: WideString);
    procedure CanvasQuality(FQuality: TCanvasQuality);
    procedure StayOnTop(FValue: Boolean);
    procedure SetCaptured(FControl: TFmxObject);
    procedure AddMouseDownControls(FControl: TFmxObject);
    procedure SetContextMenuLanguage(const FLang: WideString);
    procedure StartWindowDrag;
    procedure UpdateStyleBook;
    procedure Show;
    procedure Minimize;
    function GetHeight: Integer;
    function GetWidth: Integer;
    procedure OnShow(Event: TNotifyEvent);
    procedure OnActivate(Event: TNotifyEvent);
    procedure OnDeactivate(Event: TNotifyEvent);
    procedure OnKeyDown(Event: TKeyEventF);
    procedure OnKeyUp(Event: TKeyEventF);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseWheel(Event: TMouseWheelEventF);
    function Handle: TFmxObject;
    function HandleHWND: HWND;
  end;

// =============================================================================
// FMsgForm interface
// =============================================================================
type
  FMsgForm = interface(IUnknown)
    '{F314BB73-FE86-42BA-A281-0D254C766425}'
    procedure FCreateBackdropForm(FOwner: HWND; FBackType: TBackdropType;
      FDark, FRound: Boolean);
    procedure FCreateBlurForm(FOwner: HWND; FColor: TAlphaColor;
      FRound: Boolean);
    procedure FCreateBlankForm(FOwner: HWND; FColor: TAlphaColor;
      const FImage: WideString; FRound: Boolean);
    procedure FCreateImageForm(FOwner: HWND; FColor: TAlphaColor;
      const FImage: WideString; FOpacity: Boolean);
    procedure Height(FHeight: Integer);
    procedure Width(FWidth: Integer);
    procedure ChangeFormImage(const FImage: WideString);
    procedure ChangeFormColor(FColor: TAlphaColor);
    procedure ChangeDarkMode(const FDark: Boolean);
    procedure ChangeBorderColor(FColor: TAlphaColor);
    procedure GradientFormColors(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure GradientFormLinearAngle(FAngle: Single);
    procedure GradientFormRadialAngle(FAngle: Single);
    procedure GradientFormPosition(X1, Y1, X2, Y2: Single);
    procedure Caption(const FText: WideString);
    procedure AddMouseDownControls(FControl: TFmxObject);
    procedure StartWindowDrag;
    procedure Show;
    procedure Close;
    function GetHeight: Integer;
    function GetWidth: Integer;
    function Handle: TFmxObject;
    function HandleHWND: HWND;
  end;

// =============================================================================
// FSplashForm
// =============================================================================
type
  FSplashForm = interface(IUnknown)
    '{DC82CE70-46BF-44F7-8137-2C1D6D45444F}'
    procedure FCreateSplashForm(const FImageFile, FSoundFile: WideString;
      FDuration: Single);
    procedure Border(FValue: Boolean);
    procedure BorderSetting(FRound: Boolean; FColor: TAlphaColor);
    procedure Show;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FWinTitleBar
// =============================================================================
type
  FWinTitleBar = interface(IUnknown)
    '{31E29020-AF92-4FDB-9067-B8C573804370}'
    procedure FCreate(FParent: TFmxObject; Dark: Boolean);
    procedure Height(FHeight: Single);
    procedure Offset(PY: Single);
    procedure SetColor(FColor: TAlphaColor);
    procedure ChangeDarkMode(const Dark: Boolean);
    procedure CloseBtnEnabled(FValue: Boolean);
    function GetHeight: Single;
    function GetObjectCloseBtn: TFmxObject;
    procedure CloseBtnOnClick(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FThumbButtons
// =============================================================================
type
  FThumbButtons = interface(IUnknown)
    '{D8D83FE2-E1E2-4787-A11C-1A8244D8B272}'
    function FCreate(FHandle: HWND): Boolean;
    function AddButton(const FHint: WideString): Integer;
    procedure SetIcon(const Index: Integer;
      const FIconFile: WideString);
    procedure SetGlyph(const Index: Integer;
      const FGlyph, FFontName: WideString; FColor: TAlphaColor);
    procedure SetHint(const Index: Integer; const FHint: WideString);
    procedure Enabled(const Index: Integer; FEnabled: Boolean);
    procedure Visible(const Index: Integer; FVisible: Boolean);
    procedure DismissOnClick(const Index: Integer; FValue: Boolean);
    procedure NoBackground(const Index: Integer; FValue: Boolean);
    function Count: Integer;
    procedure OnClick(FCallback: TThumbButtonCallback);
  end;

// =============================================================================
// FSpeedButton
// =============================================================================
type
  FSpeedButton = interface(IUnknown)
    '{06685429-686A-46B5-8C4C-1DDA4C1AF424}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure StayPressed(FValue: Boolean);
    procedure Pressed(FValue: Boolean);
    procedure GroupName(FGroup: WideString);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Images(FImgList: IImageList);
    procedure ImageIndex(FIndex: Integer);
    procedure TextHorzAlign(FHorzAlign: TTextAlign);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    procedure ModalResult(FModalResult: TModalResult);
    function GetModalResult: TModalResult;
    function IsPressed: Boolean;
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCornerButton
// =============================================================================
type
  FCornerButton = interface(IUnknown)
    '{41D1AB35-3B0F-4B13-BB6E-A464CEABF708}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure StayPressed(FValue: Boolean);
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType);
    procedure Sides(FSides: TSides);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Images(FImgList: IImageList);
    procedure ImageIndex(FIndex: Integer);
    procedure TextHorzAlign(FHorzAlign: TTextAlign);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    procedure ModalResult(FModalResult: TModalResult);
    function GetModalResult: TModalResult;
    function IsPressed: Boolean;
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FArcDial
// =============================================================================
type
  FArcDial = interface(IUnknown)
    '{E79CB1CE-E09E-45B5-8A37-6798E7C0B4FE}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Value(FValue: Single);
    procedure ShowValue(FValue: Boolean);
    procedure Frequency(FValue: Double);
    procedure Tracking(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetValue: Single;
    function GetFrequency: Double;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseWheel(Event: TMouseWheelEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FAniIndicator
// =============================================================================
type
  FAniIndicator = interface(IUnknown)
    '{604C3ED3-2902-4F6C-BE03-D72BFF22BB23}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Style(FStyle: TAniIndicatorStyle);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FDropTarget
// =============================================================================
type
  FDropTarget = interface(IUnknown)
    '{71BAA1DE-B251-47FA-8FC6-F4A96D6D48C3}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Filter(const FFilter: WideString);
    procedure FilterIndex(FIndex: Integer);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FImageViewer
// =============================================================================
type
  FImageViewer = interface(IUnknown)
    '{55425B62-7DBE-4027-9F46-075F446D81F0}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure BackgroundFillColor(FColor: TAlphaColor);
    procedure BackgroundFillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure BackgroundFillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure BackgroundFillGradientLinearAngle(FAngle: Single);
    procedure BackgroundFillGradientRadialAngle(FAngle: Single);
    procedure BackgroundFillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure LoadPicture(const FImage: WideString);
    procedure BitmapScale(FScale: Single);
    procedure AutoHide(FValue: Boolean);
    procedure DisableMouseWheel(FValue: Boolean);
    procedure MouseScaling(FValue: Boolean);
    procedure ShowBackground(FValue: Boolean);
    procedure ShowScrollBars(FValue: Boolean);
    procedure ShowSizeGrip(FValue: Boolean);
    procedure Bounces(FValue: Boolean);
    procedure ScrollAnimation(FValue: Boolean);
    procedure TouchTracking(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FNumberBox
// =============================================================================
type
  FNumberBox = interface(IUnknown)
    '{0D944035-9B03-43D3-9D2B-B456BD63A295}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure DecimalDigits(FDigits: Integer);
    procedure HorzIncrement(FValue: Single);
    procedure VertIncrement(FValue: Single);
    procedure VerticalMode(FEnabled: Boolean);
    procedure Max(FMax: Single);
    procedure Min(FMin: Single);
    procedure Value(FValue: Single);
    procedure ValueType(FFloat: Boolean);
    procedure ReadOnly(FValue: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign);
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetHorzIncrement: Single;
    function GetVertIncrement: Single;
    function IsVerticalMode: Boolean;
    function GetValue: Single;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnChangeTracking(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSpinBox
// =============================================================================
type
  FSpinBox = interface(IUnknown)
    '{D958ED9F-723B-4544-9B8A-ACDE84247F75}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure DecimalDigits(FDigits: Integer);
    procedure Increment(FValue: Single);
    procedure Max(FMax: Single);
    procedure Min(FMin: Single);
    procedure Value(FValue: Single);
    procedure ValueType(FFloat: Boolean);
    procedure ReadOnly(FValue: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign);
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word);
    procedure StepUp;
    procedure StepDown;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetIncrement: Single;
    function GetValue: Single;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnChangeTracking(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FComboEdit
// =============================================================================
type
  FComboEdit = interface(IUnknown)
    '{69CC8E2E-9C88-4021-91BA-469DAFE9BDCB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure CanFocus(FValue: Boolean);
    procedure SetDropDownCount(Count: Integer);
    procedure ReadOnly(FValue: Boolean);
    procedure ItemHeight(FHeight: Single);
    procedure ItemWidth(FWidth: Single);
    procedure SetItemIndex(FIndex: Integer);
    procedure AddItem(const FItem: WideString);
    procedure ListBoxResource(const FResource: WideString);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign);
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetItem(FIndex: Integer): WideString;
    function GetItemIndex: Integer;
    function GetItemCount: Integer;
    function GetDropDownCount: Integer;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClosePopup(Event: TNotifyEvent);
    procedure OnTyping(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnChange(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FComboTrackBar
// =============================================================================
type
  FComboTrackBar = interface(IUnknown)
    '{1CA4E80E-BAC1-457E-8DB3-BC48ACEFC2BC}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure DecimalDigits(FValue: Integer);
    procedure Frequency(FValue: Double);
    procedure Max(FMax: Single);
    procedure Min(FMin: Single);
    procedure Value(FValue: Single);
    procedure ValueType(FType: Integer);
    procedure ReadOnly(FEnabled: Boolean);
    procedure DropDown;
    procedure CloseDropDown;
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign);
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetDroppedDown: Boolean;
    function GetText: WideString;
    function GetValue: Single;
    function GetFrequency: Double;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnChangeTracking(Event: TNotifyEvent);
    procedure OnTyping(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FAnimation
// =============================================================================
type
  FAnimation = interface(IUnknown)
    '{C31A4F72-9B5D-4D64-8F2A-7D0D7A4C91E3}'
    procedure FCreate(FParent: TFmxObject);
    procedure Duration(FDuration: Single);
    procedure Delay(FDelay: Single);
    procedure Loop(FLoop: Boolean);
    procedure AutoReverse(FAutoReverse: Boolean);
    procedure Inverse(FInverse: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure Pause(FPause: Boolean);
    procedure AnimationType(FAnimationType: TAnimationType);
    procedure Interpolation(FInterpolation: TInterpolationType);
    function IsRunning: Boolean;
    function IsPaused: Boolean;
    function GetCurrentTime: Single;
    function GetNormalizedTime: Single;
    procedure Start;
    procedure Stop;
    procedure StopAtCurrent;
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
    function GetObject: TFmxObject;
  end;

// =============================================================================
// FPathAnimation
// =============================================================================
type
  FPathAnimation = interface(IUnknown)
    '{5C684A9F-B12B-4A46-BEAE-26BD5D89F208}'
    procedure FCreate(FParent: TFmxObject);
    procedure AnimationType(FAnimationType: TAnimationType;
      FDuration, FDelay: Single; FInverse, FAutoReverse,
       FLoop: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure Loop(FLoop: Boolean);
    procedure Rotate(FRotate: Boolean);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure PathData(const FPathData: WideString);
    procedure DataBoundsMode(FBoundsMode: TBoundsMode);
    procedure DataStyleLookup(FStyle: WideString);
    procedure Start;
    procedure Stop;
    procedure Trigger(const FTrigger: WideString);
    procedure TriggerInverse(const FTrigger: WideString);
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
  end;

// =============================================================================
// FFloatAnimation
// =============================================================================
type
  FFloatAnimation = interface(IUnknown)
    '{80273C7F-C33A-4B55-9529-2314CC63B5E9}'
    procedure FCreate(FParent: TFmxObject);
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure Loop(FLoop: Boolean);
    procedure PropertyName(const FPropertyName: WideString);
    procedure SetValues(FStartValue, FStopValue: Single);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure StartFromCurrent(FEnabled: Boolean);
    procedure StopAtCurrent;
    procedure Start;
    procedure Stop;
    procedure Trigger(const FTrigger: WideString);
    procedure TriggerInverse(const FTrigger: WideString);
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
  end;

// =============================================================================
// FFloatKeyAnimation
// =============================================================================
type
  FFloatKeyAnimation = interface(IUnknown)
    '{68E7F942-6528-4811-91B3-1213C49DA328}'
    procedure FCreate(FParent: TFmxObject);
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure Loop(FLoop: Boolean);
    procedure PropertyName(const FPropertyName: WideString);
    procedure AddKeys(Key, Value: Single);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure StartFromCurrent(FEnabled: Boolean);
    procedure StopAtCurrent;
    procedure Start;
    procedure Stop;
    procedure Trigger(const FTrigger: WideString);
    procedure TriggerInverse(const FTrigger: WideString);
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
  end;

// =============================================================================
// FColorAnimation
// =============================================================================
type
  FColorAnimation = interface(IUnknown)
    '{4771276E-71BC-4EDE-9727-1981A39B6849}'
    procedure FCreate(FParent: TFmxObject);
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure Loop(FLoop: Boolean);
    procedure PropertyName(const FPropertyName: WideString);
    procedure SetColors(FStartColor, FStopColor: TAlphaColor);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure StartFromCurrent(FEnabled: Boolean);
    procedure StopAtCurrent;
    procedure Start;
    procedure Stop;
    procedure Trigger(const FTrigger: WideString);
    procedure TriggerInverse(const FTrigger: WideString);
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
  end;

// =============================================================================
// FColorKeyAnimation
// =============================================================================
type
  FColorKeyAnimation = interface(IUnknown)
    '{C5B6DEA8-D369-4D1B-8A07-5DAED7F8804A}'
    procedure FCreate(FParent: TFmxObject);
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure Loop(FLoop: Boolean);
    procedure PropertyName(const FPropertyName: WideString);
    procedure AddKeys(Key: Single; FColor: TAlphaColor);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure StartFromCurrent(FEnabled: Boolean);
    procedure StopAtCurrent;
    procedure Start;
    procedure Stop;
    procedure Trigger(const FTrigger: WideString);
    procedure TriggerInverse(const FTrigger: WideString);
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
  end;

// =============================================================================
// FRectAnimation
// =============================================================================
type
  FRectAnimation = interface(IUnknown)
    '{DCCC6D31-4455-4EF7-B2CB-E0EA1D6C7E7F}'
    procedure FCreate(FParent: TFmxObject);
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure Loop(FLoop: Boolean);
    procedure PropertyName(const FPropertyName: WideString);
    procedure SetValues(FStartValue, FStopValue: TRect);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure StartFromCurrent(FEnabled: Boolean);
    procedure StopAtCurrent;
    procedure Start;
    procedure Stop;
    procedure Trigger(const FTrigger: WideString);
    procedure TriggerInverse(const FTrigger: WideString);
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
  end;

// =============================================================================
// FGradientAnimation
// =============================================================================
type
  FGradientAnimation = interface(IUnknown)
    '{066A78DF-C19F-4AA0-9859-1FB3E0809341}'
    procedure FCreate(FParent: TFmxObject);
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure Loop(FLoop: Boolean);
    procedure PropertyName(const FPropertyName: WideString);
    procedure StartColors(FColor1, FColor2: TAlphaColor);
    procedure StopColors(FColor1, FColor2: TAlphaColor);
    procedure StartPoints(FOffset1, FOffset2: Single);
    procedure StopPoints(FOffset1, FOffset2: Single);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure StartFromCurrent(FEnabled: Boolean);
    procedure StopAtCurrent;
    procedure Start;
    procedure Stop;
    procedure Trigger(const FTrigger: WideString);
    procedure TriggerInverse(const FTrigger: WideString);
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
  end;

// =============================================================================
// FBitmapAnimation
// =============================================================================
type
  FBitmapAnimation = interface(IUnknown)
    '{19DA6572-6F98-4501-BFBA-2BB0B8D44679}'
    procedure FCreate(FParent: TFmxObject);
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure PropertyName(const FPropertyName: WideString);
    procedure SetImages(const FStartImage, FStopImage: WideString);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure Trigger(const FTrigger: WideString);
    procedure TriggerInverse(const FTrigger: WideString);
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
  end;

// =============================================================================
// FBitmapListAnimation
// =============================================================================
type
  FBitmapListAnimation = interface(IUnknown)
    '{1AB22ACC-4B19-4A0C-93A9-48246331DBA5}'
    procedure FCreate(FParent: TFmxObject);
    procedure AnimationType(FAnimationType: TAnimationType;
        FDuration, FDelay: Single; FInverse, FAutoReverse,
        FLoop: Boolean);
    procedure Enabled(FEnabled: Boolean);
    procedure PropertyName(const FPropertyName: WideString);
    procedure SetImage(const FImage: WideString;
        FCount, FRowCount: Integer);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure AniFrameRate(FFrameRate: Integer);
    procedure Start;
    procedure Stop;
    procedure Trigger(const FTrigger: WideString);
    procedure TriggerInverse(const FTrigger: WideString);
    procedure OnProcess(Event: TNotifyEvent);
    procedure OnFinish(Event: TNotifyEvent);
  end;

// =============================================================================
// FComboColorBox
// =============================================================================
type
  FComboColorBox = interface(IUnknown)
    '{0CD24B22-FFFA-4A9C-B3AC-9141E304560D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Color(FColor: TAlphaColor);
    procedure UseAlpha(FValue: Boolean);
    procedure BeginUpdate;
    procedure EndUpdate;
    function IsVisible: Boolean;
    function GetColor: TAlphaColor;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FColorComboBox
// =============================================================================
type
  FColorComboBox = interface(IUnknown)
    '{A3356F52-1C9D-4D26-A6D0-A68968BD60AB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Color(FColor: TAlphaColor);
    procedure ItemIndex(FValue: Integer);
    procedure ItemWidth(FValue: Single);
    procedure ItemHeight(FValue: Single);
    procedure DropDownCount(FValue: Integer);
    procedure DropDownKind(FValue: TDropDownKind);
    procedure Placement(FValue: TPlacement);
    function IsVisible: Boolean;
    function GetColor: TAlphaColor;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FTabItem
// =============================================================================
type
  FTabItem = interface(IUnknown)
    '{3B241A9D-521C-4AD3-A5DE-02E5260082B8}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetHint(const FText: WideString);
    procedure SetTag(FTag: Integer);
    procedure ShowAsDot(FValue: Boolean);
    procedure AutoSize(FValue: Boolean);
    procedure CanFocus(FValue: Boolean);
    procedure SetFocus;
    procedure IsSelected(FValue: Boolean);
    procedure Index(FIndex: Integer);
    procedure Pressed(FValue: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Opacity(FOpacity: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetIsSelected: Boolean;
    function GetIndex: Integer;
    function GetPressed: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: ITabItem;
  end;

// =============================================================================
// FTabControl
// =============================================================================
type
  FTabControl = interface(IUnknown)
    '{D2273196-C2A0-4E93-864E-DC8D5626FBBF}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure SetActiveTabWithTransition(const FTab: ITabItem;
      FTransition: TTabTransition;
      FDirection: TTabTransitionDirection);
    procedure SetActiveTabWithTransitionAsync(const FTab: ITabItem;
      FTransition: TTabTransition; FDirection: TTabTransitionDirection;
      FOnFinish: TNotifyEvent);
    procedure FinishCurrentTabTransition;
    procedure GoToActiveTab;
    procedure TabPosition(FTabPosition: TTabPosition);
    procedure TabHeight(FHeight: Single);
    procedure TabIndex(FIndex: Integer);
    procedure TabStop(FValue: Boolean);
    procedure UpdateTabBarButtons;
    procedure CanFocus(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function GotoVisibleTab(FIndex: Integer; FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean;
    function Next(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean;
    function Previous(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean;
    function First(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean;
    function Last(FTransition: TTabTransition;
      FDirection: TTabTransitionDirection): Boolean;
    function Delete(const FIndex: Integer): Boolean;
    function HasActiveTab: Boolean;
    function TabCount: Integer;
    function TransitionRunning: Boolean;
    function ActiveTab: ITabItem;
    function ActiveTabIndex: Integer;
    function GetTabItem(FIndex: Integer): ITabItem;
    function GetPressed: Boolean;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnChange(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FMultiView
// =============================================================================
type
  FMultiView = interface(IUnknown)
    '{79822FD5-F942-4BE6-952C-0E07989C8C43}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure BorderOptions(FColor: TAlphaColor; FVisible: Boolean);
    procedure DrawerOptions(FMode: TSlidingMode; FPlacement: TPanelPlacement;
      FDurationSliding, FTouchAreaSize: Single);
    procedure MasterButton(FControl: TFmxObject);
    procedure Mode(FMode: TMultiViewMode);
    procedure NavCollapsedWidth(CollapsedWidth: Single);
    procedure PopoverOptions(FAppearanceDuration, FPopupHeight: Single;
      FStyleLookup: WideString; FTintColor: TAlphaColor);
    procedure ShadowOptions(FColor: TAlphaColor; FEnable: Boolean;
      FOpacity: Single);
    procedure SplitViewOptions(FPlacement: TPanelPlacement);
    procedure TargetControl(FTargetControl: TFmxObject);
    procedure ShowMaster;
    procedure HideMaster;
    procedure Opacity(FOpacity: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsShowed: Boolean;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnStartShowing(Event: TNotifyEvent);
    procedure OnStartHiding(Event: TNotifyEvent);
    procedure OnShown(Event: TNotifyEvent);
    procedure OnHidden(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FShadowEffect
// =============================================================================
type
  FShadowEffect = interface(IUnknown)
    '{CDE4ADAE-F250-4745-9BDE-E7FAD6416F10}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Direction(FDirection: Single);
    procedure Distance(FDistance: Single);
    procedure ShadowColor(FColor: TAlphaColor);
    procedure Opacity(FOpacity: Single);
    procedure Softness(FSoftness: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBlurEffect
// =============================================================================
type
  FBlurEffect = interface(IUnknown)
    '{79647B4E-3AC3-4799-B85C-3F0B6502BD50}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Softness(FSoftness: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FGlowEffect
// =============================================================================
type
  FGlowEffect = interface(IUnknown)
    '{D1162019-9C6F-4D48-89B2-19A98DBAD4CB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure GlowColor(FColor: TAlphaColor);
    procedure Opacity(FOpacity: Single);
    procedure Softness(FSoftness: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FInnerGlowEffect
// =============================================================================
type
  FInnerGlowEffect = interface(IUnknown)
    '{4226FD5D-3B2F-4616-B9A6-46EFDA4BE943}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure GlowColor(FColor: TAlphaColor);
    procedure Opacity(FOpacity: Single);
    procedure Softness(FSoftness: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBevelEffect
// =============================================================================
type
  FBevelEffect = interface(IUnknown)
    '{B1A02D1C-912B-4FEE-A06C-2F6FB13E153F}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Direction(FDirection: Single);
    procedure Size(FSize: Integer);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FReflectionEffect
// =============================================================================
type
  FReflectionEffect = interface(IUnknown)
    '{93F6A9A9-A175-43DC-9FF6-F8678F671E0F}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Length(FLength: Single);
    procedure Offset(FOffset: Integer);
    procedure Opacity(FOpacity: Single);
    procedure Trigger(const FTrigger: WideString);
    function GetOpacity: Single;
  end;

// =============================================================================
// FRippleEffect
// =============================================================================
type
  FRippleEffect = interface(IUnknown)
    '{67158629-EDF1-4689-897B-5C3553DE6F18}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Amplitude(FValue: Single);
    procedure AspectRatio(FValue: Single);
    procedure Frequency(FValue: Single);
    procedure Phase(FValue: Single);
    procedure Center(X, Y: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FSwirlEffect
// =============================================================================
type
  FSwirlEffect = interface(IUnknown)
    '{1868E8EB-BCC9-480A-9613-6BDF936B16EA}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure AspectRatio(FValue: Single);
    procedure SpiralStrength(FValue: Single);
    procedure Center(X, Y: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FMagnifyEffect
// =============================================================================
type
  FMagnifyEffect = interface(IUnknown)
    '{E47FE9A7-A6C4-4210-B1EE-3C045CDBCECE}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure AspectRatio(FValue: Single);
    procedure Radius(FValue: Single);
    procedure Magnification(FValue: Single);
    procedure Center(X, Y: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FSmoothMagnifyEffect
// =============================================================================
type
  FSmoothMagnifyEffect = interface(IUnknown)
    '{C75C12ED-031E-41BD-923B-05CBD2D4317E}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure AspectRatio(FValue: Single);
    procedure InnerRadius(FValue: Single);
    procedure OuterRadius(FValue: Single);
    procedure Magnification(FValue: Single);
    procedure Center(X, Y: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBandsEffect
// =============================================================================
type
  FBandsEffect = interface(IUnknown)
    '{1F2253DF-BBEA-40B2-A494-8BBD0CCF3115}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure BandDensity(FValue: Single);
    procedure BandIntensity(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FWaveEffect
// =============================================================================
type
  FWaveEffect = interface(IUnknown)
    '{B39BD52E-7964-4FA7-AE1E-6C1C01C68563}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Time(FValue: Single);
    procedure WaveSize(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FWrapEffect
// =============================================================================
type
  FWrapEffect = interface(IUnknown)
    '{217D506E-C0CE-45F3-9379-3EE279181AE2}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure LeftStart(FValue: Single);
    procedure LeftControl1(FValue: Single);
    procedure LeftControl2(FValue: Single);
    procedure LeftEnd(FValue: Single);
    procedure RightStart(FValue: Single);
    procedure RightControl1(FValue: Single);
    procedure RightControl2(FValue: Single);
    procedure RightEnd(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBandedSwirlEffect
// =============================================================================
type
  FBandedSwirlEffect = interface(IUnknown)
    '{253C5D42-C080-4727-BBE4-3EEAA71D9798}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure AspectRatio(FValue: Single);
    procedure Bands(FValue: Single);
    procedure Strength(FValue: Single);
    procedure Center(X, Y: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FPinchEffect
// =============================================================================
type
  FPinchEffect = interface(IUnknown)
    '{41C195FC-49BA-4E15-B50F-4A23ADE0C115}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure AspectRatio(FValue: Single);
    procedure Radius(FValue: Single);
    procedure Strength(FValue: Single);
    procedure Center(X, Y: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FTilerEffect
// =============================================================================
type
  FTilerEffect = interface(IUnknown)
    '{F6E71122-420D-4B57-A2EA-3AA6E75E6CFB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure VerticalTileCount(FValue: Single);
    procedure VerticalOffset(FValue: Single);
    procedure HorizontalTileCount(FValue: Single);
    procedure HorizontalOffset(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FPixelateEffect
// =============================================================================
type
  FPixelateEffect = interface(IUnknown)
    '{5292163A-216C-496F-BB6D-C3FCB308325D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure BlockCount(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FEmbossEffect
// =============================================================================
type
  FEmbossEffect = interface(IUnknown)
    '{D8E2C1B7-3571-46FA-B0B5-DD4275EEC1BC}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Amount(FValue: Single);
    procedure Width(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FSharpenEffect
// =============================================================================
type
  FSharpenEffect = interface(IUnknown)
    '{8520DE1D-23E5-4F46-83DE-B3C7C5B22624}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Amount(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FToonEffect
// =============================================================================
type
  FToonEffect = interface(IUnknown)
    '{5FD34163-EC47-42DC-BCCD-559EB3C2AEA3}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Levels(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FSepiaEffect
// =============================================================================
type
  FSepiaEffect = interface(IUnknown)
    '{417ED636-BBD9-49F4-94B9-BE26515C9C97}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Amount(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FPaperSketchEffect
// =============================================================================
type
  FPaperSketchEffect = interface(IUnknown)
    '{94636DD6-2A22-45A7-8C6C-DC6EB6FBFB3F}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure brushSize(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FPencilStrokeEffect
// =============================================================================
type
  FPencilStrokeEffect = interface(IUnknown)
    '{32C4D314-5745-4D94-A867-0ABB65B6EEE9}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure brushSize(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FFillEffect
// =============================================================================
type
  FFillEffect = interface(IUnknown)
    '{CB29068B-78F7-4F4E-A149-08BDC156A0BD}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Color(FColor: TAlphaColor);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FFillRGBEffect
// =============================================================================
type
  FFillRGBEffect = interface(IUnknown)
    '{3323CB91-449F-45B3-81FA-21C5C60A3B66}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Color(FColor: TAlphaColor);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FNormalBlendEffect
// =============================================================================
type
  FNormalBlendEffect = interface(IUnknown)
    '{F8833348-1593-46CD-89E6-CAC117E8D164}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FHueAdjustEffect
// =============================================================================
type
  FHueAdjustEffect = interface(IUnknown)
    '{56D02150-965A-436F-A0C1-E827480F20CA}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Hue(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FContrastEffect
// =============================================================================
type
  FContrastEffect = interface(IUnknown)
    '{43B50E8E-F5AD-4CAF-8470-52CBC3EC1FAA}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Contrast(FValue: Single);
    procedure Brightness(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBloomEffect
// =============================================================================
type
  FBloomEffect = interface(IUnknown)
    '{FA3E4C1B-33B4-416E-8D70-50277A66FE36}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure BloomIntensity(FValue: Single);
    procedure BaseIntensity(FValue: Single);
    procedure BloomSaturation(FValue: Single);
    procedure BaseSaturation(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FGloomEffect
// =============================================================================
type
  FGloomEffect = interface(IUnknown)
    '{E7FF9F4F-6553-494F-91BF-6CA92DB99139}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure GloomIntensity(FValue: Single);
    procedure GloomSaturation(FValue: Single);
    procedure BaseIntensity(FValue: Single);
    procedure BaseSaturation(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FInvertEffect
// =============================================================================
type
  FInvertEffect = interface(IUnknown)
    '{893386B7-B23F-4029-BD72-C1EC696B7B64}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FMonochromeEffect
// =============================================================================
type
  FMonochromeEffect = interface(IUnknown)
    '{0F27172A-46F9-4462-BD12-E94F6DFA61A6}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FColorKeyAlphaEffect
// =============================================================================
type
  FColorKeyAlphaEffect = interface(IUnknown)
    '{EC313112-680D-4A69-ADC6-96DA115C5196}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure ColorKey(FColor: TAlphaColor);
    procedure Tolerance(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FMaskToAlphaEffect
// =============================================================================
type
  FMaskToAlphaEffect = interface(IUnknown)
    '{4BEF2DE1-B9E6-4C63-A23A-520CE5E85FDC}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBandedSwirlTransitionEffect
// =============================================================================
type
  FBandedSwirlTransitionEffect = interface(IUnknown)
    '{AF4D3BE7-8F8D-46DC-8F86-45832DCB6593}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Center(X, Y: Single);
    procedure Progress(FValue: Single);
    procedure Strength(FValue: Single);
    procedure Frequency(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBlindTransitionEffect
// =============================================================================
type
  FBlindTransitionEffect = interface(IUnknown)
    '{DD85B733-3BD1-46F3-A92E-58D96ED07A8C}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure NumberOfBlinds(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBloodTransitionEffect
// =============================================================================
type
  FBloodTransitionEffect = interface(IUnknown)
    '{E5A956CC-6D9F-4E3C-BE0B-87402DE3D061}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure RandomSeed(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FCircleTransitionEffect
// =============================================================================
type
  FCircleTransitionEffect = interface(IUnknown)
    '{2A1EC12B-908B-410E-9F9A-F7763A22BDE2}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Center(X, Y: Single);
    procedure Progress(FValue: Single);
    procedure FuzzyAmount(FValue: Single);
    procedure CircleSize(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FMagnifyTransitionEffect
// =============================================================================
type
  FMagnifyTransitionEffect = interface(IUnknown)
    '{E1996089-D4C9-4B22-915C-04F83EA800B6}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Center(X, Y: Single);
    procedure Progress(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FCrumpleTransitionEffect
// =============================================================================
type
  FCrumpleTransitionEffect = interface(IUnknown)
    '{8CEDF9F4-9560-4124-9044-368D9F30A78E}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure RandomSeed(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FDissolveTransitionEffect
// =============================================================================
type
  FDissolveTransitionEffect = interface(IUnknown)
    '{851A58BF-0628-40EA-82DC-4F3F00EFA715}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure RandomSeed(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FDropTransitionEffect
// =============================================================================
type
  FDropTransitionEffect = interface(IUnknown)
    '{B85F2878-C1FD-4F6C-A568-23D33306F52A}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure RandomSeed(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FFadeTransitionEffect
// =============================================================================
type
  FFadeTransitionEffect = interface(IUnknown)
    '{14AC3864-452F-44C0-807B-2BE8D635D200}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBrightTransitionEffect
// =============================================================================
type
  FBrightTransitionEffect = interface(IUnknown)
    '{3B6732E2-051C-46EB-8308-1C265EBF5B31}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FPixelateTransitionEffect
// =============================================================================
type
  FPixelateTransitionEffect = interface(IUnknown)
    '{FD48CBE0-C172-4B94-8815-B289184B6C13}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBlurTransitionEffect
// =============================================================================
type
  FBlurTransitionEffect = interface(IUnknown)
    '{BEB31904-63B1-4B75-AB71-BA6920760233}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FWiggleTransitionEffect
// =============================================================================
type
  FWiggleTransitionEffect = interface(IUnknown)
    '{EA4E11FA-D07F-42E2-81B9-F7D74BCC8B80}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure RandomSeed(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FShapeTransitionEffect
// =============================================================================
type
  FShapeTransitionEffect = interface(IUnknown)
    '{86FCA73D-3F47-4008-BE87-4AF7D77A5B31}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure RandomSeed(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FRippleTransitionEffect
// =============================================================================
type
  FRippleTransitionEffect = interface(IUnknown)
    '{EDA8FDF3-E5D1-4ADA-8049-46EF1AA95F34}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FRotateCrumpleTransitionEffect
// =============================================================================
type
  FRotateCrumpleTransitionEffect = interface(IUnknown)
    '{F52F9F9E-F8B4-43D6-BEB6-DFAC432C9965}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure RandomSeed(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FSaturateTransitionEffect
// =============================================================================
type
  FSaturateTransitionEffect = interface(IUnknown)
    '{B808B1D7-0974-498D-9035-6109439A68E0}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FSlideTransitionEffect
// =============================================================================
type
  FSlideTransitionEffect = interface(IUnknown)
    '{6402D787-A3FD-4600-9CE3-F8311765AD7D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure SlideAmount(X, Y: Single);
    procedure Progress(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FSwirlTransitionEffect
// =============================================================================
type
  FSwirlTransitionEffect = interface(IUnknown)
    '{CDEE2055-9F26-4704-B810-7EE8F5938D9E}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure Strength(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FWaterTransitionEffect
// =============================================================================
type
  FWaterTransitionEffect = interface(IUnknown)
    '{FC553E7E-0C81-4FE3-BC89-0B7DCC529815}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure RandomSeed(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FWaveTransitionEffect
// =============================================================================
type
  FWaveTransitionEffect = interface(IUnknown)
    '{F0BBEA60-F229-4717-8220-765D321A72CF}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Progress(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FLineTransitionEffect
// =============================================================================
type
  FLineTransitionEffect = interface(IUnknown)
    '{73A495BF-42D6-4611-A857-664DF43F6A6C}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Origin(X, Y: Single);
    procedure Normal(X, Y: Single);
    procedure Progress(FValue: Single);
    procedure FuzzyAmount(FValue: Single);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FAffineTransformEffect
// =============================================================================
type
  FAffineTransformEffect = interface(IUnknown)
    '{9265C014-1C8E-4C77-830E-D74912CC449B}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Center(X, Y: Single);
    procedure Rotation(FValue: Single);
    procedure Scale(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FPerspectiveTransformEffect
// =============================================================================
type
  FPerspectiveTransformEffect = interface(IUnknown)
    '{4F22CBF0-7ECD-4ADA-B16A-75EC0842C2F9}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure TopLeft(X, Y: Single);
    procedure TopRight(X, Y: Single);
    procedure BottomRight(X, Y: Single);
    procedure BottomLeft(X, Y: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FCropEffect
// =============================================================================
type
  FCropEffect = interface(IUnknown)
    '{AE3FBB53-2047-4091-B1D8-137BBCDBA3E3}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure LeftTop(X, Y: Single);
    procedure RightBottom(X, Y: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FGaussianBlurEffect
// =============================================================================
type
  FGaussianBlurEffect = interface(IUnknown)
    '{97663366-6D27-4161-BBF4-9B9DBDF4CC34}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure BlurAmount(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FBoxBlurEffect
// =============================================================================
type
  FBoxBlurEffect = interface(IUnknown)
    '{995C1D9B-9674-419D-9D3B-6DA083A2461D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure BlurAmount(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FDirectionalBlurEffect
// =============================================================================
type
  FDirectionalBlurEffect = interface(IUnknown)
    '{61D2AF80-C1CF-4618-8F62-42E58BD936B7}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure BlurAmount(FValue: Single);
    procedure Angle(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FRadialBlurEffect
// =============================================================================
type
  FRadialBlurEffect = interface(IUnknown)
    '{BA4EB61D-571A-4A77-B57A-0F30BDF0BE9D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure BlurAmount(FValue: Single);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FSwipeTransitionEffect
// =============================================================================
type
  FSwipeTransitionEffect = interface(IUnknown)
    '{8EAD71DF-4621-443F-B805-D7BDEF63F61F}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure MousePoint(X, Y: Single);
    procedure CornerPoint(X, Y: Single);
    procedure Deep(FValue: Single);
    procedure BackImg(FImage: WideString);
    procedure SecondImg(FImage: WideString);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FRasterEffect
// =============================================================================
type
  FRasterEffect = interface(IUnknown)
    '{C0619EB9-4235-4948-80EA-729F379679A1}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Trigger(const FTrigger: WideString);
  end;

// =============================================================================
// FLayout
// =============================================================================
type
  FLayout = interface(IUnknown)
    '{05AA3448-0DBB-4327-82F0-DA671C6729C6}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FScaledLayout
// =============================================================================
type
  FScaledLayout = interface(IUnknown)
    '{A19FA214-4511-4D47-9E76-B97C68C2BEA8}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure OriginalHeight(FHeight: Single);
    procedure OriginalWidth(FWidth: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FGridLayout
// =============================================================================
type
  FGridLayout = interface(IUnknown)
    '{E6AF4EEA-4F30-484B-B3F3-80AAD2E3AF67}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure ItemWidth(FWidth: Single);
    procedure ItemHeight(FHeight: Single);
    procedure Orientation(FOrientation: TOrientation);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FGridPanelLayout
// =============================================================================
type
  FGridPanelLayout = interface(IUnknown)
    '{0B6D54B3-B541-4937-A923-697866A0B1F8}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AddNewColumn;
    procedure AddNewRow;
    procedure ApplyAllLoadedControls;
    procedure ColumnSettings(FIndex: Integer; FSizeStyle: TGPLSizeStyle;
      FValue: Double);
    procedure RowSettings(FIndex: Integer; FSizeStyle: TGPLSizeStyle;
      FValue: Double);
    procedure LoadAControl(FControl: TFmxObject;
      FColumn, FColumnSpan, FRow, FRowSpan: Integer);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FFlowLayout
// =============================================================================
type
  FFlowLayout = interface(IUnknown)
    '{10771559-57DE-452B-917E-02AC22AC4904}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FlowDirection(FFlowDirection: TFlowDirection);
    procedure HorizontalGap(FValue: Single);
    procedure VerticalGap(FValue: Single);
    procedure Justify(FJustify: TFlowJustify);
    procedure JustifyLastLine(FJustifyLastLine: TFlowJustify);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FScrollBox
// =============================================================================
type
  FScrollBox = interface(IUnknown)
    '{EBF8ADB5-01F0-4D25-A2C3-C21F6383B318}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AutoHide(FValue: Boolean);
    procedure Bounces(FValue: Boolean);
    procedure DisableMouseWheel(FValue: Boolean);
    procedure ScrollAnimation(FValue: Boolean);
    procedure ShowScrollBars(FValue: Boolean);
    procedure ShowSizeGrip(FValue: Boolean);
    procedure TouchTracking(FValue: Boolean);
    procedure ScrollTo(const Dx, Dy: Single);
    procedure ScrollBy(const Dx, Dy: Single);
    procedure GotoLastLine;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure RealignContent;
    procedure RecalcSize;
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FHorzScrollBox
// =============================================================================
type
  FHorzScrollBox = interface(IUnknown)
    '{EBF8ADB5-01F0-4D25-A2C3-C21F6383B318}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AutoHide(FValue: Boolean);
    procedure Bounces(FValue: Boolean);
    procedure DisableMouseWheel(FValue: Boolean);
    procedure ScrollAnimation(FValue: Boolean);
    procedure ShowScrollBars(FValue: Boolean);
    procedure ShowSizeGrip(FValue: Boolean);
    procedure TouchTracking(FValue: Boolean);
    procedure ScrollTo(const Dx, Dy: Single);
    procedure ScrollBy(const Dx, Dy: Single);
    procedure GotoLastLine;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure RealignContent;
    procedure RecalcSize;
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FVertScrollBox
// =============================================================================
type
  FVertScrollBox = interface(IUnknown)
    '{E7392376-82E6-4CDA-875B-FA933635BFE3}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AutoHide(FValue: Boolean);
    procedure Bounces(FValue: Boolean);
    procedure DisableMouseWheel(FValue: Boolean);
    procedure ScrollAnimation(FValue: Boolean);
    procedure ShowScrollBars(FValue: Boolean);
    procedure ShowSizeGrip(FValue: Boolean);
    procedure TouchTracking(FValue: Boolean);
    procedure ScrollTo(const Dx, Dy: Single);
    procedure ScrollBy(const Dx, Dy: Single);
    procedure GotoLastLine;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure RealignContent;
    procedure RecalcSize;
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FBufferedLayout
// =============================================================================
type
  FBufferedLayout = interface(IUnknown)
    '{F5BAD5FB-0681-4B2D-AB06-E25206179D69}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FMediaPlayer
// =============================================================================
type
  FMediaPlayer = interface(IUnknown)
    '{94F5C2EF-067D-49A4-9924-68DBDEB007A1}'
    procedure FCreate(FParent: TFmxObject; const FVideoFile: WideString;
      Loop: Boolean);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure VideoFile(const FVideoFile: WideString);
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure Resume;
    procedure Volume(FValue: Single);
    procedure Loop(FValue: Boolean);
    function IsPlaying: Boolean;
    function IsStopped: Boolean;
    function IsPaused: Boolean;
    function GetVolume: Single;
    function GetLeft: Single;
    function GetTop: Single;
    function GetWidth: Single;
    function GetHeight: Single;
  end;

// =============================================================================
// NetHTTPClient
// =============================================================================
type
  FNetHTTPClient = interface(IUnknown)
    '{B60A2468-0FF3-40B3-8812-4DCFAFD94FE4}'
    function DownloadStart(const FUrl, FOutfile: WideString;
      FCallback: TDownloadCallback): Int64;
    procedure Accept(FAccept: WideString);
    procedure AcceptCharSet(FCharSet: WideString);
    procedure AcceptEncoding(FEncoding: WideString);
    procedure AllowCookies(FValue: Boolean);
    procedure Asynchronous(FValue: Boolean);
    procedure AutomaticDecompression(FAutomaticDecompression
      : THTTPCompressionMethods);
    procedure ConnectionTimeout(FValue: Integer);
    procedure ContentType(FContentType: WideString);
    procedure HandleRedirects(FValue: Boolean);
    procedure MaxRedirects(FValue: Integer);
    procedure PreemptiveAuthentication(FValue: Boolean);
    procedure ProtocolVersion(FProtocolVersion: THTTPProtocolVersion);
    procedure RedirectsWithGET(FRedirectsWithGET
      : THTTPRedirectsWithGET);
    procedure ResponseTimeout(FValue: Integer);
    procedure SecureProtocols(FSecureProtocols: THTTPSecureProtocols);
    procedure SendTimeout(FValue: Integer);
    procedure SynchronizeEvents(FValue: Boolean);
    procedure UseDefaultCredentials(FValue: Boolean);
    procedure UserAgent(FUserAgent: WideString);
    procedure DownloadStop;
  end;

// =============================================================================
// FLine
// =============================================================================
type
  FLine = interface(IUnknown)
    '{469891B1-1A0F-48CE-9CCF-48EF59BD1995}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure LineStyle(FLineLocation: TLineLocation;
      FLineType: TLineType);
    procedure ShortenLine(FShortenLine: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRectangle
// =============================================================================
type
  FRectangle = interface(IUnknown)
    '{D9A61F9F-A211-46BF-8A60-E5E6D5A14B65}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType);
    procedure Sides(FSides: TSides);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRoundRect
// =============================================================================
type
  FRoundRect = interface(IUnknown)
    '{3F67560B-72D7-4911-8019-E6D2C488C304}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CornerStyle(FCorners: TCorners);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FEllipse
// =============================================================================
type
  FEllipse = interface(IUnknown)
    '{54F6B7F9-B25A-4480-BC5E-FA24F1862A3F}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCircle
// =============================================================================
type
  FCircle = interface(IUnknown)
    '{C7A9F447-AB31-4BFE-865F-9E9FE467C54C}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FArc
// =============================================================================
type
  FArc = interface(IUnknown)
    '{CFB8067F-C61A-4724-ACC7-5B3C6537D84B}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Angle(Current, Max: Single);
    procedure StartAngle(FStart: Single);
    procedure EndAngle(FEnd: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FPie
// =============================================================================
type
  FPie = interface(IUnknown)
    '{937EE567-35B6-434E-A552-8B53FADEFCB0}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Angle(Current, Max: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FText
// =============================================================================
type
  FText = interface(IUnknown)
    '{597C342F-7EFD-4B6C-80BB-49BE4AD9FBF0}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AutoSize(FAutoSize: Boolean);
    procedure Text(const FText: WideString);
    procedure Stretch(FStretch: Boolean);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Color(FontColor: TAlphaColor);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FPath
// =============================================================================
type
  FPath = interface(IUnknown)
    '{7FA760E5-6521-4C75-B420-130B7DFBF766}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure DataStr(const DataStr: WideString);
    procedure DataWrapMode(FPathWrapMode: TPathWrapMode);
    procedure DataBoundsMode(FBoundsMode: TBoundsMode);
    procedure DataStyleLookup(FStyle: WideString);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FImage
// =============================================================================
type
  FImage = interface(IUnknown)
    '{9D1ECB65-2EAC-43D6-AC7D-2EE941E33D54}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure LoadPicture(const FImage: WideString;
      WrapMode: TImageWrapMode);
    procedure SavePicture(const FImage: WideString);
    procedure LoadPictureFromImgList(const FIndex: Integer;
      FImgList: IImageList);
    procedure BitmapMargins(FLeft, FTop, FRight, FBottom: Single);
    procedure MarginWrapMode(WrapMode: TImageWrapMode);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCalloutRectangle
// =============================================================================
type
  FCalloutRectangle = interface(IUnknown)
    '{2EA28A0A-5836-4E58-818F-49D1A7B80398}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure CalloutWidth(FWidth: Single);
    procedure CalloutLength(FLength: Single);
    procedure CalloutOffset(FOffset: Single);
    procedure CalloutPosition(FPosition: TCalloutPosition);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FButton
// =============================================================================
type
  FButton = interface(IUnknown)
    '{F44AD17C-D522-4CA2-BEAC-D4B1190A8DE1}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure StayPressed(FValue: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Images(FImgList: IImageList);
    procedure ImageIndex(FIndex: Integer);
    procedure SetFocus;
    procedure CanFocus(FValue: Boolean);
    procedure TextHorzAlign(FHorzAlign: TTextAlign);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    procedure ModalResult(FModalResult: TModalResult);
    function GetModalResult: TModalResult;
    function IsPressed: Boolean;
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCheckBox
// =============================================================================
type
  FCheckBox = interface(IUnknown)
    '{F07DF579-A90A-4771-B923-115C5862F843}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure SetChecked(FChecked: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsChecked: Boolean;
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnChange(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadioButton
// =============================================================================
type
  FRadioButton = interface(IUnknown)
    '{87105653-66FE-41AC-B10B-00A1F370E0BB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure SetChecked(FChecked: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure FontColor(FColor: TAlphaColor);
    procedure GroupName(const FGroupName: WideString);
    procedure SetFocus;
    procedure CanFocus(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsChecked: Boolean;
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnChange(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FGroupBox
// =============================================================================
type
  FGroupBox = interface(IUnknown)
    '{0B4E3397-5F53-4024-91F2-B3626CC6546D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FPopupBox
// =============================================================================
type
  FPopupBox = interface(IUnknown)
    '{616554AE-D854-4BB4-A346-1F1087210FD6}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure DisableDisappear(FDisable: Boolean);
    procedure ItemsAdd(const NameStr: WideString);
    procedure ItemsAddPair(const NameStr, ValueStr: WideString);
    procedure ItemSetIndex(FIndex: Integer);
    procedure Index(FValue: Integer);
    procedure Clear;
    procedure StaysPressed(FEnabled: Boolean);
    procedure Pressed(FValue: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsPressed: Boolean;
    function IsVisible: Boolean;
    function GetItemIndex: Integer;
    function GetIndex: Integer;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FPanel
// =============================================================================
type
  FPanel = interface(IUnknown)
    '{DF8B5B03-A007-4A51-9293-067C69FD919C}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCalloutPanel
// =============================================================================
type
  FCalloutPanel = interface(IUnknown)
    '{C4458093-3AEB-4261-B99F-A9102C8E53DC}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure CalloutLength(FLength: Single);
    procedure CalloutOffset(FOffset: Single);
    procedure CalloutPosition(FPosition: TCalloutPosition);
    procedure CalloutWidth(FWidth: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FLabel
// =============================================================================
type
  FLabel = interface(IUnknown)
    '{1EE436EA-51B9-401A-A6E0-D8919B2B47A7}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AutoSize(FAutoSize: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Trimming(FTrimming: TTextTrimming);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Color(FontColor: TAlphaColor);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetFontColor: TAlphaColor;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FImageControl
// =============================================================================
type
  FImageControl = interface(IUnknown)
    '{6F2E60F1-7385-4300-B547-A7F8CF1279E4}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure LoadPicture(const FImage: WideString);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FProgressBar
// =============================================================================
type
  FProgressBar = interface(IUnknown)
    '{8EC3C7CE-C814-49DC-A370-0948823543A3}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Max(FMax: Single);
    procedure Min(FMin: Single);
    procedure Value(FValue: Single);
    procedure Orientation(FVertical: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetValue: Single;
    function GetMax: Single;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FExpander
// =============================================================================
type
  FExpander = interface(IUnknown)
    '{0438B45F-C2D7-42A0-B2AB-81CD5981B924}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure HeaderHeight(FValue: Integer);
    procedure SetChecked(Value: Boolean);
    procedure SetExpanded(Value: Boolean);
    procedure SetShowCheck(Value: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsChecked: Boolean;
    function IsExpanded: Boolean;
    function IsShowCheck: Boolean;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnCheckChange(Event: TNotifyEvent);
    procedure OnExpandedChanged(Event: TNotifyEvent);
    procedure OnExpandedChanging(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FTrackBar
// =============================================================================
type
  FTrackBar = interface(IUnknown)
    '{A39EED13-DFC1-45D4-B3C4-123BA3B53426}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Max(FMax: Single);
    procedure Min(FMin: Single);
    procedure Orientation(FVertical: Boolean);
    procedure Value(FValue: Single);
    procedure Frequency(FFrequency: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetValue: Single;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnTracking(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseWheel(Event: TMouseWheelEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSwitch
// =============================================================================
type
  FSwitch = interface(IUnknown)
    '{DD572F47-053F-4B8F-813F-12BD02E5B8DB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure SwitchedOn(FSwitchedOn: Boolean);
    procedure SetFocus;
    procedure CanFocus(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsSwitchedOn: Boolean;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnSwitch(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSplitter
// =============================================================================
type
  FSplitter = interface(IUnknown)
    '{27D1EA8D-C047-4636-AB44-1B2DA01EE3BA}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure MinSize(FSize: Single);
    procedure ShowGrip(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FMenuItem
// =============================================================================
type
  FMenuItem = interface(IUnknown)
    '{0B7CBD3D-6BAB-4188-BD8F-58F62CD00479}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Position(X, Y: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure LoadImage(const FImage: WideString);
    procedure AddItem(FMenuItem: TFmxObject);
    procedure Text(const FText: WideString);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure AutoCheck(FValue: Boolean);
    procedure SetChecked(FValue: Boolean);
    procedure SetIndex(FValue: Integer);
    procedure GroupIndex(FValue: Integer);
    procedure ImageIndex(FValue: Integer);
    procedure RadioItem(FValue: Boolean);
    procedure Select(FValue: Boolean);
    procedure Change;
    procedure Clear;
    procedure Popup;
    procedure NeedPopup;
    procedure ShortCut(FValue: TShortCut);
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Opacity(FOpacity: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsAutoCheck: Boolean;
    function IsSelected: Boolean;
    function IsSeparator: Boolean;
    function IsRadioItem: Boolean;
    function IsChecked: Boolean;
    function IsVisible: Boolean;
    function ParenIMenuItem: TFmxObject;
    function MainMenu: TFmxObject;
    function HavePopup: Boolean;
    function ItemsCount: Integer;
    function GetItem(FIndex: Integer): TFmxObject;
    function GetIndex: Integer;
    function GetGroupIndex: Integer;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FMenuBar
// =============================================================================
type
  FMenuBar = interface(IUnknown)
    '{C4E0F1FC-B0BE-42DC-811D-8E0060E7BC54}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AddItem(FItem: TFmxObject);
    procedure ImageList(FImgList: IImageList);
    procedure ItemPopup(FIndex: Integer);
    procedure Clear;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure RecalcSize;
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function ItemCount: Integer;
    function ItemIsSelected(FIndex: Integer): Boolean;
    function ItemIsSeparator(FIndex: Integer): Boolean;
    function ItemIsChecked(FIndex: Integer): Boolean;
    function ItemGroupIndex(FIndex: Integer): Integer;
    function ItemText(FIndex: Integer): WideString;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FStatusBar
// =============================================================================
type
  FStatusBar = interface(IUnknown)
    '{3597EC5B-A227-43AB-ADD2-121EE1D76ECD}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AutoHint(FValue: Boolean);
    procedure ShowSizeGrip(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FToolBar
// =============================================================================
type
  FToolBar = interface(IUnknown)
    '{A7B802B8-D4E2-44D1-B9E3-D6F5C83B7513}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure TintColor(const FColor: TAlphaColor);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSearchBox
// =============================================================================
type
  FSearchBox = interface(IUnknown)
    '{301D7E48-2814-4381-952F-558077A69FE3}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Password(FValue: Boolean);
    procedure ReadOnly(FValue: Boolean);
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word);
    procedure TextPrompt(FText: WideString);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FListBoxGroupFooter
// =============================================================================
type
  FListBoxGroupFooter = interface(IUnknown)
    '{E3DC7524-B6FB-486F-A9FB-1590231B00C8}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Position(X, Y: Single);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure ImageIndex(FIndex: Integer);
    procedure Checked(FValue: Boolean);
    procedure Selected(FValue: Boolean);
    procedure ItemDataAccessory(FAccessory: TAccessory);
    procedure ItemDataBitmap(FImgFile: WideString);
    procedure ItemDataDetail(FDetail: WideString);
    procedure ItemDataText(FText: WideString);
    procedure Selectable(FValue: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsChecked: Boolean;
    function IsSelected: Boolean;
    function IsVisible: Boolean;
    function GetIndex: Integer;
    function GeText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FListBoxGroupHeader
// =============================================================================
type
  FListBoxGroupHeader = interface(IUnknown)
    '{A0D24802-608B-408F-966D-B6D8554B7200}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Position(X, Y: Single);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure ImageIndex(FIndex: Integer);
    procedure Checked(FValue: Boolean);
    procedure Selected(FValue: Boolean);
    procedure ItemDataAccessory(FAccessory: TAccessory);
    procedure ItemDataBitmap(FImgFile: WideString);
    procedure ItemDataDetail(FDetail: WideString);
    procedure ItemDataText(FText: WideString);
    procedure Selectable(FValue: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsChecked: Boolean;
    function IsSelected: Boolean;
    function IsVisible: Boolean;
    function GetIndex: Integer;
    function GeText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FListBoxHeader
// =============================================================================
type
  FListBoxHeader = interface(IUnknown)
    '{EC51B73C-8357-40E8-B4D4-7A48866E80B2}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsEnabled: Boolean;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FListBoxItem
// =============================================================================
type
  FListBoxItem = interface(IUnknown)
    '{B1A45071-52D2-410C-80E2-0B739FDC056F}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Position(X, Y: Single);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure ImageIndex(FIndex: Integer);
    procedure Checked(FValue: Boolean);
    procedure Selected(FValue: Boolean);
    procedure ItemDataAccessory(FAccessory: TAccessory);
    procedure ItemDataBitmap(FImgFile: WideString);
    procedure ItemDataDetail(FDetail: WideString);
    procedure ItemDataText(FText: WideString);
    procedure Selectable(FValue: Boolean);
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Opacity(FOpacity: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    procedure Free;
    function IsChecked: Boolean;
    function IsSelected: Boolean;
    function IsVisible: Boolean;
    function GetIndex: Integer;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChangeCheck(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FListBox
// =============================================================================
type
  FListBox = interface(IUnknown)
    '{1D3E5D26-0B4E-4AE4-97E7-6B27E78509B8}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AlternatingRowBackground(FValue: Boolean);
    procedure AutoHide(FValue: Boolean);
    procedure CanFocus(FValue: Boolean);
    procedure CanParentFocus(FValue: Boolean);
    procedure Columns(FValue: Integer);
    procedure DefaultItemStyle(FItemStyle: WideString);
    procedure DefaultItemGroupHeaderStyle(FGpHeaderStyle: WideString);
    procedure DefaultItemGroupFooterStyle(FGpFooterStyle: WideString);
    procedure GroupingKind(FGroupingKind: TListGroupingKind);
    procedure ItemHeight(FHeight: Single);
    procedure ItemWidth(FWidth: Single);
    procedure AddItem(FItem: TFmxObject);
    procedure AddItemHeader(FHeader: TFmxObject);
    procedure AddItemGroupHeader(FGpHeader: TFmxObject);
    procedure AddItemGroupFooter(FGpFooter: TFmxObject);
    procedure AddItemSearchBox(FSrchBox: TFmxObject);
    procedure SetItemIndex(FIndex: Integer);
    procedure ListStyle(FListStyle: TListStyle);
    procedure MultiSelectStyle(FMultiSelectStyle: TMultiSelectStyle);
    procedure ShowCheckboxes(FShow: Boolean);
    procedure ShowScrollBars(FShow: Boolean);
    procedure SmoothScroll(FEnabled: Boolean);
    procedure Sorted(FValue: Boolean);
    procedure Clear;
    procedure SelectAll;
    procedure ClearSelection;
    procedure DeleteItem(FIndex: Integer);
    procedure MultiSelect(FValue: Boolean);
    procedure Images(FImgList: IImageList);
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure FileDropEnabled(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function Count: Integer;
    function Selected: TFmxObject;
    function IsItemChecked(FIndex: Integer): Boolean;
    function IsItemSelected(FIndex: Integer): Boolean;
    function IsVisible: Boolean;
    function GetItemIndex: Integer;
    function GetIndexOfItem(FItemText: WideString): Integer;
    function GetItem(FIndex: Integer): TFmxObject;
    function GetItemText(FIndex: Integer): WideString;
    function GetItemHeight: Single;
    function GetItemWidth: Single;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnChangeCheck(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FComboBox
// =============================================================================
type
  FComboBox = interface(IUnknown)
    '{BFAC7AE9-7819-442A-A9EE-6C912B04EC41}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AddItem(const FItem: WideString);
    procedure ItemHeight(FHeight: Single);
    procedure ItemWidth(FWidth: Single);
    procedure SetItemIndex(FIndex: Integer);
    procedure SetDropDownCount(Count: Integer);
    procedure Placement(Value: TPlacement);
    procedure Clear;
    procedure DropDown;
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
       FontColor: TAlphaColor);
    procedure FontStyle(FStyle: TFontStyles);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    procedure BeginUpdate;
    procedure EndUpdate;
    function IsVisible: Boolean;
    function GetItem(FIndex: Integer): WideString;
    function GetItemIndex: Integer;
    function GetItemCount: Integer;
    function GetDropDownCount: Integer;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FMemo
// =============================================================================
type
  FMemo = interface(IUnknown)
    '{6F84CA9F-7336-41F1-9BA8-B41C1508F6C4}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AutoHide(FValue: Boolean);
    procedure AutoSelect(FValue: Boolean);
    procedure Bounces(FValue: Boolean);
    procedure DisableFocusEffect(FValue: Boolean);
    procedure EnabledScroll(FValue: Boolean);
    procedure ShowSizeGrip(FValue: Boolean);
    procedure TextPrompt(const FText: WideString);
    procedure MaxLength(FLength: Integer);
    procedure CheckSpelling(FCheck: Boolean);
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word);
    procedure ShowScrollBars(FValue: Boolean);
    procedure SmoothScroll(FEnabled: Boolean);
    procedure LoadFromfile(const Filename: WideString);
    procedure SetStrings(Src: TStrings);
    procedure AddLine(const FText: WideString);
    procedure Clear;
    procedure ReadOnly(FValue: Boolean);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure RealignContent;
    procedure RecalcSize;
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function LineCount: Integer;
    function LineStrings(FIndex: Integer): WideString;
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnChange(Event: TNotifyEvent);
    procedure OnChangeTracking(Event: TNotifyEvent);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FEdit
// =============================================================================
type
  FEdit = interface(IUnknown)
    '{37489E7F-D52D-40A7-9974-8B6D29487297}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure CanFocus(FValue: Boolean);
    procedure ReadOnly(FValue: Boolean);
    procedure Text(const FText: WideString);
    procedure TextPrompt(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure AddSearchButton(Event: TNotifyEvent);
    procedure AddClearButton(Event: TNotifyEvent);
    procedure AddPasswordButton;
    procedure Password(FPassword: Boolean);
    procedure FilterChar(FFilterStr: WideString);
    procedure DisableFocusEffect(FDisable: Boolean);
    procedure MaxLength(FLength: Integer);
    procedure CheckSpelling(FCheck: Boolean);
    procedure Caret(FColor: TAlphaColor; FInterval: Integer;
      FWidth: Word);
    procedure CaretShow(FShow: Boolean);
    procedure SelectAll;
    procedure SelectWord;
    procedure SelStart(FValue: Integer);
    procedure SelLength(FValue: Integer);
    procedure SelectionFillColor(FColor: TAlphaColor);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetSelText: WideString;
    function GetSearchBtnObject: TFmxObject;
    function GetPasswordBtnObject: TFmxObject;
    function GetClearBtnObject: TFmxObject;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnTyping(Event: TNotifyEvent);
    procedure OnEnter(Event: TNotifyEvent);
    procedure OnExit(Event: TNotifyEvent);
    procedure OnKeyDown(Event: TKeyEventF);
    procedure OnClick(Event: TNotifyEvent);
    procedure OnChange(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FTreeViewItem
// =============================================================================
type
  FTreeViewItem = interface(IUnknown)
    '{4051407B-7B23-4235-94D9-98C73AF6D428}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetTag(FTag: Integer);
    procedure ImageIndex(FIndex: Integer);
    procedure SetChecked(FValue: Boolean);
    procedure SetSelected(FValue: Boolean);
    procedure AddItem(FItem: TFmxObject);
    procedure Deselect;
    procedure ExpandAll;
    procedure CollapseAll;
    procedure Expand;
    procedure Collapse;
    procedure Text(const FText: WideString);
    procedure StyledSettings(FStyledSettings: TStyledSettings);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure FontStyle(FStyle: TFontStyles);
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsChecked: Boolean;
    function IsSelected: Boolean;
    function IsExpanded: Boolean;
    function IsVisible: Boolean;
    function GetIndex: Integer;
    function GetGlobalIndex: Integer;
    function GeText: WideString;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FTreeView
// =============================================================================
type
  FTreeView = interface(IUnknown)
    '{82FDDA21-00DD-4687-A9CC-0AC6B8C4B62D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Images(FImgList: IImageList);
    procedure AlternatingRowBackground(FValue: Boolean);
    procedure AutoHide(FValue: Boolean);
    procedure CanFocus(FValue: Boolean);
    procedure DisableFocusEffect(FValue: Boolean);
    procedure DisableMouseWheel(FValue: Boolean);
    procedure DeleteItem(FIndex: Integer);
    procedure MultiSelect(FValue: Boolean);
    procedure ScrollAnimation(FValue: Boolean);
    procedure ShowCheckboxes(FShow: Boolean);
    procedure ShowScrollBars(FShow: Boolean);
    procedure Sorted(FValue: Boolean);
    procedure SetItemIndex(FIndex: Integer);
    procedure ItemHeight(FHeight: Single);
    procedure AddItem(FItem: TFmxObject);
    procedure ExpandAll;
    procedure CollapseAll;
    procedure DeselectAll;
    procedure Clear;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure RecalcSize;
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsItemChecked(FIndex: Integer): Boolean;
    function IsItemSelected(FIndex: Integer): Boolean;
    function IsVisible: Boolean;
    function GetItemIndex: Integer;
    function GetIndexOfItem(FItemText: WideString): Integer;
    function GetItem(FIndex: Integer): TFmxObject;
    function GetItemText(FIndex: Integer): WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnChange(Event: TNotifyEvent);
    procedure OnChangeCheck(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FImageList
// =============================================================================
type
  FImageList = interface(IUnknown)
    '{3943EE98-BB04-4582-8ABC-5EA024B03027}'
    procedure FCreate(FParent: TFmxObject);
    procedure AddImage(const AFileImage: WideString);
    procedure AddImageResized(const AFileImage: WideString;
      FWidth, FHeight: Integer);
    procedure Clear;
    procedure Delete(FIndex: Integer);
    procedure Replace(FIndex: Integer; const AFileImage: WideString);
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure SetTag(FTag: Integer);
    function Count: Integer;
    function GetTag: Integer;
    function Handle: IImageList;
  end;

// =============================================================================
// FTimer
// =============================================================================
type
  FTimer = interface(IUnknown)
    '{B141008A-EFF0-43EC-A1D8-4AB88AF406AA}'
    procedure FCreate(FParent: TFmxObject);
    procedure Enabled(FEnabled: Boolean);
    procedure Interval(Interval: Cardinal);
    procedure OnTimer(Event: TNotifyEvent);
  end;

// =============================================================================
// FStopwatch
// =============================================================================
type
  FStopwatch = interface(IUnknown)
    '{E38C1983-E8E5-4A37-9182-17EBA892D844}'
    procedure FCreate;
    procedure Reset;
    procedure Start;
    procedure StartNew;
    procedure Stop;
    function ElapsedMilliseconds: Double;
    function IsRunning: Boolean;
  end;

// =============================================================================
// FViewport3D
// =============================================================================
type
  FViewport3D = interface(IUnknown)
    '{3446EB19-70CB-453F-8F05-6FDB91E35347}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Camera(FCamera: TFmxObject);
    procedure Color(FColor: TAlphaColor);
    procedure Multisample(FMultisample: TMultisample);
    procedure UsingDesignCamera(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure SetTagFloat(FTagFloat: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetTagFloat: Single;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCamera
// =============================================================================
type
  FCamera = interface(IUnknown)
    '{EC4432CB-CBFB-45B9-853E-E76943DCD622}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AngleOfView(FValue: Single);
    procedure Depth(FDepth: Single);
    procedure Target(FTarget: TFmxObject);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FLight
// =============================================================================
type
  FLight = interface(IUnknown)
    '{BD2ED1E9-5BCA-4E15-9DC6-3A49815A9B47}'
    procedure FCreate(FParent: TFmxObject);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Color(FColor: TAlphaColor);
    procedure Depth(FDepth: Single);
    procedure LightType(FLightType: TLightType);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure SpotCutOff(FValue: Single);
    procedure SpotExponent(FValue: Single);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FDummy
// =============================================================================
type
  FDummy = interface(IUnknown)
    '{A29A4C09-AE41-46C0-B861-63666DF86DAA}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetRotationAngleX: Single;
    function GetRotationAngleY: Single;
    function GetRotationAngleZ: Single;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FProxyObject
// =============================================================================
type
  FProxyObject = interface(IUnknown)
    '{33BE33E9-7805-47BF-BABE-F9DE8021A2A1}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FPlane
// =============================================================================
type
  FPlane = interface(IUnknown)
    '{BD97DC30-3A98-4EE2-9112-B2E3F7D8CB5A}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure WrapMode(FWrapMode: TMeshWrapMode);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure SubdivisionsHeight(FValue: Integer);
    procedure SubdivisionsWidth(FValue: Integer);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FDisk
// =============================================================================
type
  FDisk = interface(IUnknown)
    '{2C98B668-77BD-4321-93D0-05EE59996DED}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure SubdivisionsAxes(FValue: Integer);
    procedure SubdivisionsCap(FValue: Integer);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCube
// =============================================================================
type
  FCube = interface(IUnknown)
    '{6A940A03-C3E2-45A9-A916-47545D379D95}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure SubdivisionsDepth(FValue: Integer);
    procedure SubdivisionsHeight(FValue: Integer);
    procedure SubdivisionsWidth(FValue: Integer);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSphere
// =============================================================================
type
  FSphere = interface(IUnknown)
    '{BC9F14BF-282E-492E-9FEC-9D97114B747D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure SubdivisionsAxes(FValue: Integer);
    procedure SubdivisionsHeight(FValue: Integer);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCylinder
// =============================================================================
type
  FCylinder = interface(IUnknown)
    '{9155D52D-4851-4B23-924C-B0576218987A}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure SubdivisionsAxes(FValue: Integer);
    procedure SubdivisionsCap(FValue: Integer);
    procedure SubdivisionsHeight(FValue: Integer);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRoundCube
// =============================================================================
type
  FRoundCube = interface(IUnknown)
    '{7B007E5E-511B-49F4-BC52-0CD0AEC152E4}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCone
// =============================================================================
type
  FCone = interface(IUnknown)
    '{B3256353-B340-4393-804C-CEE213741A07}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure SubdivisionsAxes(FValue: Integer);
    procedure SubdivisionsCap(FValue: Integer);
    procedure SubdivisionsHeight(FValue: Integer);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FGrid3D
// =============================================================================
type
  FGrid3D = interface(IUnknown)
    '{441EF7FD-28DC-4A95-95FE-11C2283272C5}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure Frequency(FValue: Single);
    procedure LineColor(FColor: TAlphaColor);
    procedure Marks(FValue: Single);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FStrokeCube
// =============================================================================
type
  FStrokeCube = interface(IUnknown)
    '{46C59A90-FE16-4D35-9899-08B40923514C}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure Color(FColor: TAlphaColor);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FText3D
// =============================================================================
type
  FText3D = interface(IUnknown)
    '{30F480EB-5E5E-4403-B937-A036D6B429EB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure Flatness(FValue: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure MaterialShaftSource(FMaterialSource: IMaterialSource);
    procedure MaterialBackSource(FMaterialSource: IMaterialSource);
    procedure WrapMode(FWrapMode: TMeshWrapMode);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure Sides(FSides: TExtrudedShapeSides);
    procedure Text(const FText: WideString);
    procedure Stretch(FValue: Boolean);
    procedure FontSetting(const FontName: WideString;
      FontSize: Single);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FPath3D
// =============================================================================
type
  FPath3D = interface(IUnknown)
    '{2164998F-8079-4D2A-A482-CA5946BBB2F9}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure Flatness(FValue: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure MaterialShaftSource(FMaterialSource: IMaterialSource);
    procedure MaterialBackSource(FMaterialSource: IMaterialSource);
    procedure DataStr(const DataStr: WideString);
    procedure DataWrapMode(FPathWrapMode: TPathWrapMode);
    procedure DataBoundsMode(FBoundsMode: TBoundsMode);
    procedure DataStyleLookup(FStyle: WideString);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure Sides(FSides: TExtrudedShapeSides);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRectangle3D
// =============================================================================
type
  FRectangle3D = interface(IUnknown)
    '{7659D995-3D22-400C-8D8A-E514006BFA87}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure Flatness(FValue: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure MaterialShaftSource(FMaterialSource: IMaterialSource);
    procedure MaterialBackSource(FMaterialSource: IMaterialSource);
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType);
    procedure WrapMode(FWrapMode: TMeshWrapMode);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure Sides(FSides: TExtrudedShapeSides);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FEllipse3D
// =============================================================================
type
  FEllipse3D = interface(IUnknown)
    '{342CAAFD-77B1-45BD-A2B3-AF3A535E5F18}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure Flatness(FValue: Single);
    procedure MaterialSource(FMaterialSource: IMaterialSource);
    procedure MaterialShaftSource(FMaterialSource: IMaterialSource);
    procedure MaterialBackSource(FMaterialSource: IMaterialSource);
    procedure WrapMode(FWrapMode: TMeshWrapMode);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure Sides(FSides: TExtrudedShapeSides);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FModel3D
// =============================================================================
type
  FModel3D = interface(IUnknown)
    '{C84B16EF-7786-4F71-A5BE-45E8B7C62E4D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Depth(FDepth: Single);
    procedure LoadFromfile(const Filename: WideString);
    procedure WrapMode(FWrapMode: TMeshWrapMode);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FLayout3D
// =============================================================================
type
  FLayout3D = interface(IUnknown)
    '{F474A2A5-BDF1-4CF7-BCAD-80F6A012233D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FBufferLayer3D
// =============================================================================
type
  FBufferLayer3D = interface(IUnknown)
    '{7EAA5DA7-D61B-48D2-B1DC-7F7D7FB1D577}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure Resolution(FValue: Integer);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSplitter3D
// =============================================================================
type
  FSplitter3D = interface(IUnknown)
    '{9D0DB3CC-B181-4DCF-81B9-B3F31F77AC07}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSolidLayer3D
// =============================================================================
type
  FSolidLayer3D = interface(IUnknown)
    '{341676C9-CF34-46D8-BA94-659069282D76}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FImage3D
// =============================================================================
type
  FImage3D = interface(IUnknown)
    '{95AF509C-924D-4DBD-9893-2FC6E0FEA823}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure LoadFromfile(FTextureFile: WideString;
      WrapMode: TImageWrapMode);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FLayer3D
// =============================================================================
type
  FLayer3D = interface(IUnknown)
    '{08D5FC43-F6F9-4CE8-8000-CC63CF01982D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure AnimatedCaret(FValue: Boolean);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure Resolution(FValue: Integer);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure Transparency(FValue: Boolean);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure StyleLookUp(FStyle: WideString);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FTextLayer3D
// =============================================================================
type
  FTextLayer3D = interface(IUnknown)
    '{62C07681-A12C-4D50-899D-39B40AAD5DA6}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Text(const FText: WideString);
    procedure FontSetting(const FontName: WideString;
      FontSize: Single);
    procedure Color(FColor: TAlphaColor);
    procedure Position(X, Y, Z: Single);
    procedure PosX(X: Single);
    procedure PosY(Y: Single);
    procedure PosZ(Z: Single);
    procedure Projection(FProjection: TProjection);
    procedure Resolution(FValue: Integer);
    procedure RotationAngle(X, Y, Z: Single);
    procedure RotationAngleX(X: Single);
    procedure RotationAngleY(Y: Single);
    procedure RotationAngleZ(Z: Single);
    procedure Scale(X, Y, Z: Single);
    procedure ScaleX(X: Single);
    procedure ScaleY(Y: Single);
    procedure ScaleZ(Z: Single);
    procedure TwoSide(FValue: Boolean);
    procedure VisibleContextMenu(FValue: Boolean);
    procedure ZWrite(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FColorMaterialSource
// =============================================================================
type
  FColorMaterialSource = interface(IUnknown)
    '{39EC2943-699D-47A7-A5BF-26B437F35B70}'
    procedure FCreate(FParent: TFmxObject);
    procedure Color(FColor: TAlphaColor);
    procedure SetTag(FTag: Integer);
    function GetTag: Integer;
    function Handle: IMaterialSource;
  end;

// =============================================================================
// FTextureMaterialSource
// =============================================================================
type
  FTextureMaterialSource = interface(IUnknown)
    '{398C8C68-CC22-47A6-8A55-4CA0E95AFB20}'
    procedure FCreate(FParent: TFmxObject);
    procedure LoadFromfile(FTextureFile: WideString);
    procedure SetTag(FTag: Integer);
    function GetTag: Integer;
    function Handle: IMaterialSource;
  end;

// =============================================================================
// FLightMaterialSource
// =============================================================================
type
  FLightMaterialSource = interface(IUnknown)
    '{CCCD8337-138F-44D3-83EB-A1F752AFE1DB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Ambient(FColor: TAlphaColor);
    procedure Diffuse(FColor: TAlphaColor);
    procedure Emissive(FColor: TAlphaColor);
    procedure Shininess(FValue: Integer);
    procedure Specular(FColor: TAlphaColor);
    procedure LoadFromfile(FTextureFile: WideString);
    procedure SetTag(FTag: Integer);
    function GetTag: Integer;
    function Handle: IMaterialSource;
  end;

// =============================================================================
// FBASSPlayer
// =============================================================================
type
  FBASSPlayer = interface(IUnknown)
    '{8F3C0DBE-8B8D-4B08-A251-3E011288F4D3}'
    function FCreate(FHandle: HWND; const FileName: WideString;
      Loop: Boolean): Boolean;
    function FCreateList(FHandle: HWND; const Folder: WideString;
      Loop: Boolean): Boolean;
    function SetFile(const FileName: WideString): Boolean;
    function SetFolder(const Folder: WideString): Boolean;
    procedure Play;
    procedure Pause;
    procedure Resume;
    procedure Stop;
    procedure Next;
    procedure Previous;
    procedure Volume(FValue: Integer);
    procedure Loop(FValue: Boolean);
    procedure SetPosition(Percent: Integer);
    procedure SeekForward(const Sec: Integer);
    procedure SeekBackward(const Sec: Integer);
    function IsPlaying: Boolean;
    function IsPaused: Boolean;
    function GetPercent: Single;
    function GetPosition: WideString;
    function GetDuration: WideString;
    function GetCurrentFile: WideString;
    procedure OnProgress(FCallback: TBASSProgressCallback);
    procedure SetSpectrum(FParent: TFmxObject;
      FLeft, FTop, FHeight: Single);
    procedure BarColor(FColor: TAlphaColor);
    procedure BarWidth(FWidth: Single);
    procedure BarSpacing(FSpace: Single);
    procedure BarRadius(FRadius: Single);
  end;

// =============================================================================
// FGIFImage
// =============================================================================
type
  FGIFImage = interface(IUnknown)
    '{3E84915C-CD9D-4FFC-92AB-9CC1BFE2325E}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure LoadFromFile(const GifImgFile: WideString);
    procedure WrapMode(FWrapMode: TImageWrapMode);
    procedure Play;
    procedure Stop;
    procedure Pause;
    procedure Loop(FLoop: Boolean);
    procedure Speed(FSpeed: Single);
    procedure SetActiveFrameIndex(FIndex: Integer);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsPlaying: Boolean;
    function GetFrameCount: Integer;
    function GetActiveFrameIndex: Integer;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetWidth: Single;
    function GetHeight: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FHTMLText
// =============================================================================
type
  FHTMLText = interface(IUnknown)
    '{813EB236-4248-41E3-8C49-390C9CE080C0}'
    procedure FCreate(FParent: TFmxObject);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Text(const FText: WideString);
    procedure Color(FColor: TAlphaColor);
    procedure AutoWidth(FValue: Boolean);
    procedure AutoHeight(FValue: Boolean);
    procedure AutoOpenLink(FValue: Boolean);
    procedure AutoBreak(FValue: Boolean);
    procedure AutoTranslate(FValue: Boolean);
    procedure BorderMarginAll(FValue: Single);
    procedure BorderMarginTop(FValue: Single);
    procedure BorderMarginBottom(FValue: Single);
    procedure BorderMarginLeft(FValue: Single);
    procedure BorderMarginRight(FValue: Single);
    procedure TextAlign(Al: TTextAlign);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure FontStyle(Style: TFontStyles);
    procedure WordWrap(FValue: Boolean);
    procedure ListLevelPadding(FValue: Single);
    procedure LineSpacing(FValue: Single);
    procedure LineVertAlign(FValue: TTextAlign);
    procedure LineHorzAlign(FValue: TTextAlign);
    procedure LinkNormal(FontColor, BackgroundColor: TAlphaColor;
      Underlined: Boolean);
    procedure LinkHover(FontColor, BackgroundColor: TAlphaColor;
      Underlined: Boolean);
    procedure ParagraphIndent(FValue: Single);
    procedure ParagraphSpacing(FValue: Single);
    procedure OverallVertAlign(FValue: TTextAlign);
    procedure OverallHorzAlign(FValue: TTextAlign);
    procedure Offset(vTop, vBottom: Single);
    procedure Images(FImgList: IImageList);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function LineCount: Integer;
    function ParagraphCount: Integer;
    function IsLinkHover: Boolean;
    function EscapeTextToHTML(FText: WideString): WideString;
    function IsMouseOver: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetWidth: Single;
    function GetHeight: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantAlertTriangle
// =============================================================================
type
  FRadiantAlertTriangle = interface(IUnknown)
    '{343ABC1A-C999-4DDA-A007-C43832C5CDF7}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Direction(FValue: TRadiantDirection);
    procedure Radius(FValue: Single);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantArc
// =============================================================================
type
  FRadiantArc = interface(IUnknown)
    '{4FA10670-62F1-4450-A421-C87FFCB04A29}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CentralAngle(FValue: Single);
    procedure StartAngle(FValue: Single);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantArrow
// =============================================================================
type
  FRadiantArrow = interface(IUnknown)
    '{BE09EC27-4E2D-4B91-A1C9-26CC89556C45}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Direction(FValue: TRadiantDirection);
    procedure TailLength(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure TailWidth(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantBanner
// =============================================================================
type
  FRadiantBanner = interface(IUnknown)
    '{498E1D2D-1F39-418B-9754-94385A348F27}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Direction(FValue: TRadiantDirection);
    procedure Angle(FValue: Single);
    procedure EndStyle(FValue: TRadiantBannerEndStyle);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantCallout
// =============================================================================
type
  FRadiantCallout = interface(IUnknown)
    '{8C83E99A-8563-4D79-8596-14F6284EB771}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CalloutAlignment(FValue: TRadiantCalloutAlignment);
    procedure CalloutOffset(FValue: Single);
    procedure CalloutSide(FValue: TSide);
    procedure CalloutSize(FValue: Single);
    procedure CornerRadius(FValue: Single);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantCapsule
// =============================================================================
type
  FRadiantCapsule = interface(IUnknown)
    '{1045F59D-FF57-4D2D-8378-D890B517E347}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CornerStyle(FCorners: TCorners);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantCheck
// =============================================================================
type
  FRadiantCheck = interface(IUnknown)
    '{7E38D8EE-DDD3-49F8-A17C-5266519D2377}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantChevron
// =============================================================================
type
  FRadiantChevron = interface(IUnknown)
    '{E9A7A9CD-6D83-4CAA-AC11-019329A9B676}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Direction(FValue: TRadiantDirection);
    procedure Angle(FValue: Single);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantChevronArrow
// =============================================================================
type
  FRadiantChevronArrow = interface(IUnknown)
    '{8DEA3EA8-EF43-42E1-A3C5-8CFE1281A9F0}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Direction(FValue: TRadiantDirection);
    procedure Angle(FValue: Single);
    procedure TailWidth(FValue: Single);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantCircle
// =============================================================================
type
  FRadiantCircle = interface(IUnknown)
    '{24D2AEC3-0713-46D8-9746-348123312472}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantDiamond
// =============================================================================
type
  FRadiantDiamond = interface(IUnknown)
    '{AE72EE72-999D-4FD9-87D6-77B7545F39C0}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantEllipse
// =============================================================================
type
  FRadiantEllipse = interface(IUnknown)
    '{714DD26E-0E0A-4030-844D-EBB473D525CC}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantFrame
// =============================================================================
type
  FRadiantFrame = interface(IUnknown)
    '{0ECDAAD5-DBEA-451D-AF8B-6B19FC5DDB30}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure FrameSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantGear
// =============================================================================
type
  FRadiantGear = interface(IUnknown)
    '{6452214A-03FB-468B-B66C-C31CE79E6BBB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure HoleSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure CogsSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure Cogs(FValue: Integer);
    procedure ShowHole(FValue: Boolean);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantHexagon
// =============================================================================
type
  FRadiantHexagon = interface(IUnknown)
    '{5A3B73F8-8990-4EFC-ACB1-15F735066FD6}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantLine
// =============================================================================
type
  FRadiantLine = interface(IUnknown)
    '{2E1E31A0-ED92-41A6-B888-3786599B6ECE}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure ArrowLength(FValue: Single);
    procedure ArrowWidth(FValue: TRadiantArrowWidth);
    procedure LineSlope(FValue: TRadiantLineSlope);
    procedure ShowArrows(FValue: TRadiantShowArrows);
    procedure StyleName(FValue: WideString);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantMarker
// =============================================================================
type
  FRadiantMarker = interface(IUnknown)
    '{1333D0CE-BCFF-4620-BAAB-9854540DA731}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure HoleSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure Direction(FValue: TRadiantDirection);
    procedure ShowHole(FValue: Boolean);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantMinus
// =============================================================================
type
  FRadiantMinus = interface(IUnknown)
    '{36878B60-F18C-41F4-9FA6-1D1C255A6ED2}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantNoRing
// =============================================================================
type
  FRadiantNoRing = interface(IUnknown)
    '{61C634D3-7DD2-4CD6-B5CB-D5DB27E3F2D1}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure RingSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantOctagon
// =============================================================================
type
  FRadiantOctagon = interface(IUnknown)
    '{129B581A-BF53-4177-B71B-678CF2FF647E}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantParallelogram
// =============================================================================
type
  FRadiantParallelogram = interface(IUnknown)
    '{CC933357-34CD-4B35-ACC4-27D4ED860A1E}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure SlantAngle(FValue: Single);
    procedure SlantDirection(FValue: TRadiantDirection);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantPentagon
// =============================================================================
type
  FRadiantPentagon = interface(IUnknown)
    '{83748DDC-F2BB-49C7-8448-7A38745DAE9A}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantPlus
// =============================================================================
type
  FRadiantPlus = interface(IUnknown)
    '{4C5FC500-18D0-49CA-BB81-4369370D6D7C}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantPointer
// =============================================================================
type
  FRadiantPointer = interface(IUnknown)
    '{9869CEA2-AABE-4557-97BC-E2A989B737B2}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Direction(FValue: TRadiantDirection);
    procedure PointerInset(FValue: Single);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantRectangle
// =============================================================================
type
  FRadiantRectangle = interface(IUnknown)
    '{C8A842FA-71CC-4D8C-AF75-0A3A916530FF}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType);
    procedure Sides(FSides: TSides);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantRing
// =============================================================================
type
  FRadiantRing = interface(IUnknown)
    '{4039A429-3379-421A-94D8-5459D2A66D37}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Stretch(FValue: Boolean);
    procedure RingSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantSector
// =============================================================================
type
  FRadiantSector = interface(IUnknown)
    '{FAA4AB49-CB16-46DA-B80C-C7165506D0CA}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CentralAngle(FValue: Single);
    procedure StartAngle(FValue: Single);
    procedure Stretch(FValue: Boolean);
    procedure UseRingSize(FValue: Boolean);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantSectorRing
// =============================================================================
type
  FRadiantSectorRing = interface(IUnknown)
    '{DA4505C0-D64D-48E6-8770-E880F9E1EB8E}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CentralAngle(FValue: Single);
    procedure StartAngle(FValue: Single);
    procedure RingSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantShield
// =============================================================================
type
  FRadiantShield = interface(IUnknown)
    '{7B5EF359-4780-4E9D-8C3A-307559B44C9D}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure ShieldStyle(FValue: TRadiantShieldStyle);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantSquare
// =============================================================================
type
  FRadiantSquare = interface(IUnknown)
    '{9C018E4D-55E5-4F69-AE74-136BAE77F39C}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantStar
// =============================================================================
type
  FRadiantStar = interface(IUnknown)
    '{F0E9E6DD-CC98-4957-A1DA-B71F48C4303C}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure InnerRadiusScaleFactor(FValue: Single);
    procedure Points(FValue: Integer);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantTag
// =============================================================================
type
  FRadiantTag = interface(IUnknown)
    '{AE67627C-EE1B-4594-B97B-AC3B10F844CB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure HoleSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure Direction(FValue: TRadiantDirection);
    procedure ShowHole(FValue: Boolean);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantTrapezoid
// =============================================================================
type
  FRadiantTrapezoid = interface(IUnknown)
    '{4A7A766C-22DF-4F75-A64A-E8611311B4C4}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure AcuteAngle(FValue: Single);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantTriangle
// =============================================================================
type
  FRadiantTriangle = interface(IUnknown)
    '{BE43B512-CCCB-4EB2-B192-4C8A412F4BA4}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Direction(FValue: TRadiantDirection);
    procedure RightAngleCorner(FValue: TCorner);
    procedure TriangleType(FValue: TRadiantTriangleType);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRadiantX
// =============================================================================
type
  FRadiantX = interface(IUnknown)
    '{FEE7E5F6-AD69-408C-AD58-1493B30ED872}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure FillColor(FColor: TAlphaColor);
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure FillGradientLinearAngle(FAngle: Single);
    procedure FillGradientRadialAngle(FAngle: Single);
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure StrokeGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure StrokeGradientLinearAngle(FAngle: Single);
    procedure StrokeGradientRadialAngle(FAngle: Single);
    procedure StrokeGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure BarSize(FPixels, FScaleFactor: Single;
      Units: TRadiantDimensionUnits);
    procedure ScaleStrokeThickness(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FBlurRectangle
// =============================================================================
type
  FBlurRectangle = interface(IUnknown)
    '{EBA9AE42-E4BB-4886-996A-2FECCFF9B6F0}'
    procedure FCreate(FParent: TFmxObject; FDark: Boolean);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure TintColor(FColor: TAlphaColor);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType);
    procedure Sides(FSides: TSides);
    procedure BlurAmount(FValue: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FGlassRectangle
// =============================================================================
type
  FGlassRectangle = interface(IUnknown)
    '{CCF880AD-FEE6-470E-955F-7CABA8BDDB0C}'
    procedure FCreate(FParent: TFmxObject; FDark: Boolean);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure TintColor(FColor: TAlphaColor);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType);
    procedure Sides(FSides: TSides);
    procedure GlassAmount(FValue: Single);
    procedure BlurAmount(FValue: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    procedure OnMouseMove(Event: TMouseMoveEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FPicShow
// =============================================================================
type
  FPicShow = interface(IUnknown)
    '{2534887D-0D33-408C-AFFB-69691B2837FD}'
    procedure FCreate(FParent: TFmxObject);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    procedure AddImage(const FileName: WideString);
    procedure Clear;
    procedure Start;
    procedure Stop;
    procedure SetDelay(FValue: Single);
    procedure SetDuration(FValue: Single);
    procedure SetEffect(const EffectName: WideString);
    procedure SetRandom(FValue: Boolean);
    procedure SetBorder(FColor: TAlphaColor; FThickness: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function GetEffectsCount: Integer;
    function GetEffectsName(FIndex: Integer): WideString;
    function IsVisible: Boolean;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FShapeArc
// =============================================================================
type
  FShapeArc = interface(IUnknown)
    '{0A089D80-A6E3-47D8-BECC-49404EC404F4}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure BackStrokeColor(FColor: TAlphaColor);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure Max(FMax: Single);
    procedure Min(FMin: Single);
    procedure Value(FValue: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function GetValue: Single;
    function GetMax: Single;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FShapeSwitch
// =============================================================================
type
  FShapeSwitch = interface(IUnknown)
    '{12D91194-172F-4B4A-8CC3-43B66ADF3871}'
    procedure FCreate(FParent: TFmxObject; FRound: Boolean);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure SetChecked(FValue: Boolean);
    procedure Thickness(FThickness: Single);
    procedure ColorOn(FColor: TAlphaColor);
    procedure StrokeOn(FColor: TAlphaColor);
    procedure ColorOff(FColor: TAlphaColor);
    procedure StrokeOff(FColor: TAlphaColor);
    procedure SlideWidth(FWidth: Single);
    procedure SlideColorOn(FColor: TAlphaColor);
    procedure SlideColorOff(FColor: TAlphaColor);
    procedure SlideInset(FValue: Single);
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsChecked: Boolean;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnChange(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FShapeButton
// =============================================================================
type
  FShapeButton = interface(IUnknown)
    '{AAE05579-71D9-475E-99D6-AB9F759AABFB}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure BackColor(FColor: TAlphaColor);
    procedure StrokeColor(FColor: TAlphaColor; FThickness: Single);
    procedure Corner(FRadius: Single);
    procedure Text(const FText: WideString);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure TextColor(FColor: TAlphaColor);
    procedure TextHorzAlign(FHorzAlign: TTextAlign);
    procedure Repaint;
    procedure SetFocus;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FShapeGradientButton
// =============================================================================
type
  FShapeGradientButton = interface(IUnknown)
    '{CCC4AEE5-CC87-44D8-89C9-D13C6C24C9B9}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure BackColor(FColor1, FColor2: TAlphaColor);
    procedure GradientPosition(FVerticle: Boolean);
    procedure CusGradientPosition(X1, Y1, X2, Y2: Single);
    procedure StrokeColor(FColor: TAlphaColor; FThickness: Single);
    procedure Corner(FRadius: Single);
    procedure Text(const FText: WideString);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure TextColor(FColor: TAlphaColor);
    procedure TextHorzAlign(FHorzAlign: TTextAlign);
    procedure Repaint;
    procedure SetFocus;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FShapeProgressBar
// =============================================================================
type
  FShapeProgressBar = interface(IUnknown)
    '{F31C763A-F195-40BD-8CEC-953A6DB85270}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure BackColor(FColor: TAlphaColor);
    procedure BackStroke(FColor: TAlphaColor; FThickness: Single);
    procedure Color(FColor: TAlphaColor);
    procedure Stroke(FColor: TAlphaColor; FThickness: Single);
    procedure Gradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure GradientLinearAngle(FAngle: Single);
    procedure GradientRadialAngle(FAngle: Single);
    procedure GradientPosition(X1, Y1, X2, Y2: Single);
    procedure GradientAnimSetup(FAnimationType: TAnimationType;
      FDuration, FDelay: Single; FInverse, FAutoReverse,
      FLoop: Boolean);
    procedure GradientAnimInterpolation(FInterpolation
      : TInterpolationType);
    procedure GradientAnimColors(FColor1, FColor2, FColor3,
      FColor4: TAlphaColor);
    procedure GradientAnimEnable(FEnabled: Boolean);
    procedure Corner(FRadius: Single);
    procedure Inset(FPadding: Single);
    procedure Max(FMax: Single);
    procedure Min(FMin: Single);
    procedure Value(FValue: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function GetValue: Single;
    function GetMax: Single;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSpinner
// =============================================================================
type
  FSpinner = interface(IUnknown)
    '{7E4C7A2D-3F49-4D72-9E61-8B6A0F4A12D8}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Kind(FKind: TSpinnerKind);
    procedure Color(FColor: TAlphaColor);
    procedure Speed(FSpeed: Single);
    procedure Start;
    procedure Stop;
    procedure Opacity(FOpacity: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FHitTest: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FImageProgressBar
// =============================================================================
type
  FImageProgressBar = interface(IUnknown)
    '{8FDE87C3-99A4-4909-830D-6A7440AFB088}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure SetBackImage(const FImage: WideString);
    procedure SetImage(const FImage: WideString);
    procedure Max(FMax: Single);
    procedure Min(FMin: Single);
    procedure Value(FValue: Single);
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function GetValue: Single;
    function GetMax: Single;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FImageRadioButton
// =============================================================================
type
  FImageRadioButton = interface(IUnknown)
    '{DF5B2573-7D63-4DC8-89B4-66C6D0D07A17}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure SetChecked(FChecked: Boolean);
    procedure GroupName(const FGroup: WideString);
    procedure SetImage(const FImage: WideString);
    procedure Text(const AText: WideString);
    procedure TextColor(FontColor: TAlphaColor);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsChecked: Boolean;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnChange(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FImageCheckBox
// =============================================================================
type
  FImageCheckBox = interface(IUnknown)
    '{71609447-B537-4CF5-A6EA-7CC0B7489490}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure SetChecked(FChecked: Boolean);
    procedure SetImage(const FImage: WideString);
    procedure Text(const AText: WideString);
    procedure TextColor(FontColor: TAlphaColor);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsChecked: Boolean;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnChange(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FImageButton
// =============================================================================
type
  FImageButton = interface(IUnknown)
    '{AE4F6E09-5A3A-46EB-AB43-616DDECBAF3F}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure SetImage(const FImage: WideString);
    procedure Text(const AText: WideString);
    procedure TextColor(FontColor: TAlphaColor);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FSVGImage
// =============================================================================
type
  FSVGImage = interface(IUnknown)
    '{B4FD7C5A-F768-488D-A5AD-1FB4DCE05FA7}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure LoadFromFile(const FileName: WideString);
    procedure LoadFromText(const FText: WideString);
    procedure SetFocus;
    procedure CanFocus(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FWebPImage
// =============================================================================
type
  FWebPImage = interface(IUnknown)
    '{B7A6B8C2-0C17-4E7F-9B63-5CCB6DF4B7A1}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure LoadPicture(const AFileName: WideString;
      WrapMode: TImageWrapMode);
    procedure LoadPictureFromImgList(const FIndex: Integer;
      FImgList: IImageList);
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure SetFrameIndex(AIndex: Integer);
    procedure SetAutoPlay(AValue: Boolean);
    procedure OnFrame(Event: TNotifyEvent);
    procedure Opacity(FValue: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FValue: Boolean);
    procedure HitTest(FValue: Boolean);
    function IsPlaying: Boolean;
    function GetFrameCount: Integer;
    function GetFrameIndex: Integer;
    function GetFrameDuration: Integer;
    function GetLoopCount: Integer;
    function GetCurrentLoop: Integer;
    function GetAutoPlay: Boolean;
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FPageItem
// =============================================================================
type
  FPageItem = interface(IUnknown)
    '{7A4E7C8A-0E42-4E4D-B5B2-2F2D8B9A1C01}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure SetHint(const FText: WideString);
    procedure SetTag(FTag: Integer);
    procedure CanFocus(FValue: Boolean);
    procedure SetFocus;
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FValue: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FPageControl
// =============================================================================
type
  FPageControl = interface(IUnknown)
    '{B2A6D2A4-0F9B-4B17-AF43-3D7E4A11C101}'
    procedure FCreate(FParent: TFmxObject);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure ActivePage(FIndex: Integer; FMove: TPageMove);
    procedure ActivePageEx(FIndex: Integer; FMove: TPageMove;
      FDirection: TPageDirection);
    procedure NextPage(FMove: TPageMove);
    procedure BackPage(FMove: TPageMove);
    procedure FirstPage(FMove: TPageMove);
    procedure LastPage(FMove: TPageMove);
    procedure Duration(FDuration: Single);
    procedure Direction(FDirect: TPageDirection);
    procedure Interpolation(FInterpolation: TInterpolationType);
    procedure Opacity(FOpacity: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FValue: Boolean);
    function IsActivePage(FIndex: Integer): Boolean;
    function ActivePageIndex: Integer;
    procedure OnChange(Event: TNotifyEvent);
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FTile
// =============================================================================
type
  FTile = interface(IUnknown)
    '{0669FD3A-DBAB-4AA9-890A-BC1BFD47EE09}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure TileColor(FColor: TAlphaColor);
    procedure TilePicture(const FImage: WideString;
      WrapMode: TWrapMode);
    procedure TileStrokeColor(FColor: TAlphaColor);
    procedure TileThickness(FThickness: Single);
    procedure TileCurve(XRadi, YRadi: Single);
    procedure Text(const FText: WideString);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FHorzAlign, FVertAlign: TTextAlign);
    procedure TextBackColor(FColor: TAlphaColor);
    procedure TextColor(FontColor: TAlphaColor);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FUWPTiles
// =============================================================================
type
  FUWPTiles = interface(IUnknown)
    '{E2738C2C-0B81-42C1-96FC-FB4BA872467E}'
    procedure FCreate(FParent: TFmxObject);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure BringToFront;
    procedure SendToBack;
    function AddTile(const FImage, FTitle, FText: WideString;
      FWidth, FHeight: Single; Rounded: Boolean): TFmxObject;
    procedure Offset(X, Y: Single);
    procedure TileFillColor(FTile: TFmxObject; FColor: TAlphaColor);
    procedure TileFillPicture(FTile: TFmxObject; const FImage: WideString;
      WrapMode: TWrapMode);
    procedure TileBorderColor(FTile: TFmxObject; FColor: TAlphaColor);
    procedure TileBorderThickness(FTile: TFmxObject;
      FThickness: Single);
    procedure TileCornerStyle(FTile: TFmxObject; XRadi, YRadi: Single;
      FCorners: TCorners; FCornerType: TCornerType);
    procedure TileTitleFontSetting(FTile: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor);
    procedure TileTextFontSetting(FTile: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor);
    procedure TileEnabled(FTile: TFmxObject; FEnable: Boolean);
    procedure TileVisible(FTile: TFmxObject; FVisible: Boolean);
    procedure TileOnClick(FTile: TFmxObject; Event: TNotifyEvent);
    function TileGetObject(FTile: TFmxObject): TFmxObject;
    function TileHandle(FTile: TFmxObject): TFmxObject;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure RecalcSize;
    procedure Repaint;
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FRatingBar
// =============================================================================
type
  FRatingBar = interface(IUnknown)
    '{0B4CCA3E-506B-4F0D-87D6-2D84D7C6FFA3}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure ActiveColor(FColor: TAlphaColor);
    procedure InActiveColor(FColor: TAlphaColor);
    procedure Count(ACount: Integer);
    procedure Maximum(FMax: Single);
    procedure Space(ASpace: Single);
    procedure Value(AValue: Single);
    procedure StrokeColor(FColor: TAlphaColor);
    procedure StrokeSetting(FThickness: Single; CapStyle: TStrokeCap;
      Dash: TStrokeDash; Join: TStrokeJoin);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FMarquee
// =============================================================================
type
  FMarquee = interface(IUnknown)
    '{D4BED024-0FDC-40F1-88E4-C6F02A586662}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure Text(FText: WideString);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure Color(FontColor: TAlphaColor);
    procedure Speed(FValue: Single);
    procedure Direction(FValue: Integer);
    procedure Start;
    procedure Stop;
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function IsVisible: Boolean;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FCheckBoxTree
// =============================================================================
type
  FCheckBoxTree = interface(IUnknown)
    '{C6CAC4B7-8F40-4DF1-98C8-364E72EAD1EA}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipChildren(FValue: Boolean);
    procedure SetClipParent(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure ScrollAnimation(FEnable: Boolean);
    procedure ShowScrollBars(FShow: Boolean);
    function AddEmptySection(FParent: TFmxObject; const FText: WideString)
      : TFmxObject;
    function AddCheckBoxSection(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString; var CheckBoxHandle: TFmxObject)
      : TFmxObject;
    function AddCheckBox(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject;
    function AddRadioBtn(FParent: TFmxObject; FLeft, FTop, FWidth: Single;
      const FText: WideString): TFmxObject;
    procedure CheckBoxSetChecked(FHandle: TFmxObject;
      FChecked: Boolean);
    procedure RadioBtnSetChecked(FHandle: TFmxObject;
      FChecked: Boolean);
    procedure RadioBtnGroupName(FHandle: TFmxObject;
      FGroupName: WideString);
    procedure SectionFontSetting(FHandle: TFmxObject; const FontName: WideString;
      FontSize: Single; FontColor: TAlphaColor);
    procedure CheckBoxFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure RadioBtnFontSetting(FHandle: TFmxObject;
      const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure SectionExpand(FHandle: TFmxObject);
    procedure SectionExpandAll(FHandle: TFmxObject);
    procedure SectionCollapse(FHandle: TFmxObject);
    procedure SectionCollapseAll(FHandle: TFmxObject);
    procedure SectionEnable(FHandle: TFmxObject; FEnabled: Boolean);
    procedure CheckBoxEnable(FHandle: TFmxObject; FEnabled: Boolean);
    procedure RadioBtnEnable(FHandle: TFmxObject; FEnabled: Boolean);
    procedure ItemHeight(FHeight: Single);
    procedure AlternatingRowBackground(FValue: Boolean);
    procedure RemoveBackground;
    procedure CanFocus(FValue: Boolean);
    procedure DisableFocusEffect(FValue: Boolean);
    procedure DisableMouseWheel(FValue: Boolean);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    procedure ReFresh;
    procedure ItemOnMouseEnter(FHandle: TFmxObject;
      Event: TNotifyEvent);
    procedure ItemOnMouseLeave(FHandle: TFmxObject;
      Event: TNotifyEvent);
    procedure ItemOnChange(FHandle: TFmxObject; Event: TNotifyEvent);
    function CheckBoxGetChecked(FHandle: TFmxObject): Boolean;
    function RadioBtnGetChecked(FHandle: TFmxObject): Boolean;
    function GetText(FHandle: TFmxObject): WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetWidth: Single;
    function GetHeight: Single;
    function GetObjectCheckBox(FHandle: TFmxObject): TFmxObject;
    function GetObjectRadioBtn(FHandle: TFmxObject): TFmxObject;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FLockScreen
// =============================================================================
type
  FLockScreen = interface(IUnknown)
    '{10B94B57-24AF-4FAD-9B2C-411FD5CD1910}'
    procedure FCreate(FParent: TFmxObject);
    procedure BackColor(FColor: TAlphaColor);
    procedure BackGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle);
    procedure BackGradientLinearAngle(FAngle: Single);
    procedure BackGradientRadialAngle(FAngle: Single);
    procedure BackGradientPosition(X1, Y1, X2, Y2: Single);
    procedure BackCornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType);
    procedure BackSides(FSides: TSides);
    procedure TimeText24Format(FValue: Boolean);
    procedure TimeTextPosition(FLeft, FTop: Single);
    procedure TimeTextHide;
    procedure TimeTextFontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure ShowDelay(FSeconds: Single);
    procedure ShowLockScreen;
    procedure HideLockScreen;
    function Handle: TFmxObject;
  end;

// =============================================================================
// FShadowText
// =============================================================================
type
  FShadowText = interface(IUnknown)
    '{41B2C31C-A908-4231-AF32-B6C90B663883}'
    procedure FCreate(FParent: TFmxObject);
    procedure Cursor(FCursor: TCursor);
    procedure Left(FLeft: Single);
    procedure Top(FTop: Single);
    procedure Height(FHeight: Single);
    procedure Width(FWidth: Single);
    procedure SetBounds(FLeft, FTop, FWidth, FHeight: Single);
    procedure Position(X, Y: Single);
    procedure Align(Al: TAlignLayout);
    procedure Margins(FLeft, FTop, FRight, FBottom: Single);
    procedure Padding(FLeft, FTop, FRight, FBottom: Single);
    procedure SetHint(const FText: WideString);
    procedure SetClipParent(FValue: Boolean);
    procedure SetClipChildren(FValue: Boolean);
    procedure BringToFront;
    procedure SendToBack;
    procedure SetTag(FTag: Integer);
    procedure AutoSize(FAutoSize: Boolean);
    procedure Text(const FText: WideString);
    procedure Stretch(FStretch: Boolean);
    procedure FontSetting(const FontName: WideString; FontSize: Single;
      FontColor: TAlphaColor);
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign);
    procedure Color(FontColor: TAlphaColor);
    procedure ShadowVisible(FValue: Boolean);
    procedure ShadowColor(FColor: TAlphaColor);
    procedure ShadowOffset(OffsetX, OffsetY: Single);
    procedure Opacity(FOpacity: Single);
    procedure RotationAngle(FValue: Single);
    procedure RotationCenter(X, Y: Single);
    procedure Enabled(FEnabled: Boolean);
    procedure Visible(FVisible: Boolean);
    procedure HitTest(FEnabled: Boolean);
    function GetText: WideString;
    function GetTag: Integer;
    function GetLeft: Single;
    function GetTop: Single;
    function GetHeight: Single;
    function GetWidth: Single;
    function GetObject: TFmxObject;
    procedure OnClick(Event: TNotifyEvent);
    procedure OnMouseDown(Event: TMouseEventF);
    procedure OnMouseEnter(Event: TNotifyEvent);
    procedure OnMouseLeave(Event: TNotifyEvent);
    procedure OnMouseUp(Event: TMouseEventF);
    function Handle: TFmxObject;
  end;

// =============================================================================
// FHighlight
// =============================================================================
type
  FHighlight = interface(IUnknown)
    '{6405885E-37CE-4DF9-9991-E39185F6F4AD}'
    procedure FCreate(FParent: TFmxObject);
    procedure Position(X, Y: Single);
    procedure Color(FColor: TAlphaColor);
    procedure SetNewPos(NewPos: Single);
    procedure Duration(FDuration: Single);
    procedure Vertical(FVertical: Boolean);
    procedure HighlightSize(FWidth, FHeight: Single);
    procedure DoPlay;
    procedure Hide;
    procedure Show;
  end;

// =============================================================================
// FStorageInfo
// =============================================================================
type
  FStorageInfo = interface(IUnknown)
    '{B1DFE8C4-D827-4D2C-A363-309320AFDC3F}'
    procedure Refresh;
    function Count: Integer;
    function Letter(const Index: Integer): WideString;
    function LetterToIndex(const Letter: WideString): Integer;
    function Name(const Index: Integer): WideString;
    function IsRemovable(const Index: Integer): Boolean;
    function MediaType(const Index: Integer): TDriveType;
    function SpaceFree(const Index: Integer): Double;
    function SpaceUsed(const Index: Integer): Double;
    function SpaceTotal(const Index: Integer): Double;
    function DiskLoad(const Index: Integer): Cardinal;
  end;

// =============================================================================
// FSystemInfo
// =============================================================================
type
  FSystemInfo = interface(IUnknown)
    '{06F37AEC-7E76-4EB2-ACB2-648FDE4012FD}'
    function OSCaption: WideString;
    function OSVersion: WideString;
    function OSBuildNumber: WideString;
    function GPUName: WideString;
    function GPUMemory: UInt64;
    function GPUFeatureLevel: WideString;
    function RamLoad: Cardinal;
    function TotalRam: Double;
    function FreeRam: Double;
    function UsedRam: Double;
    function CPUName: WideString;
    function CPUCores: Cardinal;
    function CPUThreads: Cardinal;
    function CPUSpeed: Cardinal;
    function CPULoad: Cardinal;
    function UserName: WideString;
    function UserDomain: WideString;
    function UserProfilePath: WideString;
    function UserType: TUserType;
    function UserIsElevated: Boolean;
  end;

// =============================================================================
// Forms
// =============================================================================
function InitFormHandle: FForm;
  external 'InitFormHandle@files:FMXBridge.dll stdcall delayload';
function InitMsgFormHandle: FMsgForm;
  external 'InitMsgFormHandle@files:FMXBridge.dll stdcall delayload';
function InitSplashFormHandle: FSplashForm;
  external 'InitSplashFormHandle@files:FMXBridge.dll stdcall delayload';
function InitWinTitleBarHandle: FWinTitleBar;
  external 'InitWinTitleBarHandle@files:FMXBridge.dll stdcall delayload';
function InitThumbButtons: FThumbButtons;
  external 'InitThumbButtons@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Additional
// =============================================================================
function InitSpeedButtonHandle: FSpeedButton;
  external 'InitSpeedButtonHandle@files:FMXBridge.dll stdcall delayload';
function InitCornerButtonHandle: FCornerButton;
  external 'InitCornerButtonHandle@files:FMXBridge.dll stdcall delayload';
function InitArcDialHandle: FArcDial;
  external 'InitArcDialHandle@files:FMXBridge.dll stdcall delayload';
function InitAniIndicatorHandle: FAniIndicator;
  external 'InitAniIndicatorHandle@files:FMXBridge.dll stdcall delayload';
function InitDropTargetHandle: FDropTarget;
  external 'InitDropTargetHandle@files:FMXBridge.dll stdcall delayload';
function InitImageViewerHandle: FImageViewer;
  external 'InitImageViewerHandle@files:FMXBridge.dll stdcall delayload';
function InitNumberBoxHandle: FNumberBox;
  external 'InitNumberBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitSpinBoxHandle: FSpinBox;
  external 'InitSpinBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitComboEditHandle: FComboEdit;
  external 'InitComboEditHandle@files:FMXBridge.dll stdcall delayload';
function InitComboTrackBarHandle: FComboTrackBar;
  external 'InitComboTrackBarHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Animation
// =============================================================================
function InitAnimation: FAnimation;
  external 'InitAnimation@files:FMXBridge.dll stdcall delayload';
function InitPathAnimation: FPathAnimation;
  external 'InitPathAnimation@files:FMXBridge.dll stdcall delayload';
function InitFloatAnimation: FFloatAnimation;
  external 'InitFloatAnimation@files:FMXBridge.dll stdcall delayload';
function InitFloatKeyAnimation: FFloatKeyAnimation;
  external 'InitFloatKeyAnimation@files:FMXBridge.dll stdcall delayload';
function InitColorAnimation: FColorAnimation;
  external 'InitColorAnimation@files:FMXBridge.dll stdcall delayload';
function InitColorKeyAnimation: FColorKeyAnimation;
  external 'InitColorKeyAnimation@files:FMXBridge.dll stdcall delayload';
function InitRectAnimation: FRectAnimation;
  external 'InitRectAnimation@files:FMXBridge.dll stdcall delayload';
function InitGradientAnimation: FGradientAnimation;
  external 'InitGradientAnimation@files:FMXBridge.dll stdcall delayload';
function InitBitmapAnimation: FBitmapAnimation;
  external 'InitBitmapAnimation@files:FMXBridge.dll stdcall delayload';
function InitBitmapListAnimation: FBitmapListAnimation;
  external 'InitBitmapListAnimation@files:FMXBridge.dll stdcall delayload';
function FMXAnimateFloat(const Target: TFmxObject; 
  const FPropertyName: WideString; FNewValue, FDuration, FDelay: Single;
    FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
  external 'FMXAnimateFloat@files:FMXBridge.dll stdcall delayload';
function FMXAnimateFloatWait(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue, FDuration: Single;
    FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
  external 'FMXAnimateFloatWait@files:FMXBridge.dll stdcall delayload';
function FMXAnimateInt(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue: Integer; FDuration: Single;
    FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
  external 'FMXAnimateInt@files:FMXBridge.dll stdcall delayload';
function FMXAnimateIntWait(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue: Integer; FDuration: Single;
    FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
  external 'FMXAnimateIntWait@files:FMXBridge.dll stdcall delayload';
function FMXAnimateColor(const Target: TFmxObject;
  const FPropertyName: WideString; FNewValue: TAlphaColor; FDuration: Single;
    FAnimationType: TAnimationType; FInterpolation: TInterpolationType): Boolean;
  external 'FMXAnimateColor@files:FMXBridge.dll stdcall delayload';
function FMXStopPropertyAnimation(const Target: TFmxObject;
  const FPropertyName: WideString): Boolean;
  external 'FMXStopPropertyAnimation@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Colors
// =============================================================================
function InitComboColorBoxHandle: FComboColorBox;
  external 'InitComboColorBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitColorComboBoxHandle: FColorComboBox;
  external 'InitColorComboBoxHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// CommonControls
// =============================================================================
function InitTabItemHandle: FTabItem;
  external 'InitTabItemHandle@files:FMXBridge.dll stdcall delayload';
function InitTabControlHandle: FTabControl;
  external 'InitTabControlHandle@files:FMXBridge.dll stdcall delayload';
function InitMultiViewHandle: FMultiView;
  external 'InitMultiViewHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Effects
// =============================================================================
function InitShadowEffect: FShadowEffect;
  external 'InitShadowEffect@files:FMXBridge.dll stdcall delayload';
function InitBlurEffect: FBlurEffect;
  external 'InitBlurEffect@files:FMXBridge.dll stdcall delayload';
function InitGlowEffect: FGlowEffect;
  external 'InitGlowEffect@files:FMXBridge.dll stdcall delayload';
function InitInnerGlowEffect: FInnerGlowEffect;
  external 'InitInnerGlowEffect@files:FMXBridge.dll stdcall delayload';
function InitBevelEffect: FBevelEffect;
  external 'InitBevelEffect@files:FMXBridge.dll stdcall delayload';
function InitReflectionEffect: FReflectionEffect;
  external 'InitReflectionEffect@files:FMXBridge.dll stdcall delayload';
function InitRippleEffect: FRippleEffect;
  external 'InitRippleEffect@files:FMXBridge.dll stdcall delayload';
function InitSwirlEffect: FSwirlEffect;
  external 'InitSwirlEffect@files:FMXBridge.dll stdcall delayload';
function InitMagnifyEffect: FMagnifyEffect;
  external 'InitMagnifyEffect@files:FMXBridge.dll stdcall delayload';
function InitSmoothMagnifyEffect: FSmoothMagnifyEffect;
  external 'InitSmoothMagnifyEffect@files:FMXBridge.dll stdcall delayload';
function InitBandsEffect: FBandsEffect;
  external 'InitBandsEffect@files:FMXBridge.dll stdcall delayload';
function InitWaveEffect: FWaveEffect;
  external 'InitWaveEffect@files:FMXBridge.dll stdcall delayload';
function InitWrapEffect: FWrapEffect;
  external 'InitWrapEffect@files:FMXBridge.dll stdcall delayload';
function InitBandedSwirlEffect: FBandedSwirlEffect;
  external 'InitBandedSwirlEffect@files:FMXBridge.dll stdcall delayload';
function InitPinchEffect: FPinchEffect;
  external 'InitPinchEffect@files:FMXBridge.dll stdcall delayload';
function InitTilerEffect: FTilerEffect;
  external 'InitTilerEffect@files:FMXBridge.dll stdcall delayload';
function InitPixelateEffect: FPixelateEffect;
  external 'InitPixelateEffect@files:FMXBridge.dll stdcall delayload';
function InitEmbossEffect: FEmbossEffect;
  external 'InitEmbossEffect@files:FMXBridge.dll stdcall delayload';
function InitSharpenEffect: FSharpenEffect;
  external 'InitSharpenEffect@files:FMXBridge.dll stdcall delayload';
function InitToonEffect: FToonEffect;
  external 'InitToonEffect@files:FMXBridge.dll stdcall delayload';
function InitSepiaEffect: FSepiaEffect;
  external 'InitSepiaEffect@files:FMXBridge.dll stdcall delayload';
function InitPaperSketchEffect: FPaperSketchEffect;
  external 'InitPaperSketchEffect@files:FMXBridge.dll stdcall delayload';
function InitPencilStrokeEffect: FPencilStrokeEffect;
  external 'InitPencilStrokeEffect@files:FMXBridge.dll stdcall delayload';
function InitFillEffect: FFillEffect;
  external 'InitFillEffect@files:FMXBridge.dll stdcall delayload';
function InitFillRGBEffect: FFillRGBEffect;
  external 'InitFillRGBEffect@files:FMXBridge.dll stdcall delayload';
function InitNormalBlendEffect: FNormalBlendEffect;
  external 'InitNormalBlendEffect@files:FMXBridge.dll stdcall delayload';
function InitHueAdjustEffect: FHueAdjustEffect;
  external 'InitHueAdjustEffect@files:FMXBridge.dll stdcall delayload';
function InitContrastEffect: FContrastEffect;
  external 'InitContrastEffect@files:FMXBridge.dll stdcall delayload';
function InitBloomEffect: FBloomEffect;
  external 'InitBloomEffect@files:FMXBridge.dll stdcall delayload';
function InitGloomEffect: FGloomEffect;
  external 'InitGloomEffect@files:FMXBridge.dll stdcall delayload';
function InitInvertEffect: FInvertEffect;
  external 'InitInvertEffect@files:FMXBridge.dll stdcall delayload';
function InitMonochromeEffect: FMonochromeEffect;
  external 'InitMonochromeEffect@files:FMXBridge.dll stdcall delayload';
function InitColorKeyAlphaEffect: FColorKeyAlphaEffect;
  external 'InitColorKeyAlphaEffect@files:FMXBridge.dll stdcall delayload';
function InitMaskToAlphaEffect: FMaskToAlphaEffect;
  external 'InitMaskToAlphaEffect@files:FMXBridge.dll stdcall delayload';
function InitBandedSwirlTransitionEffect: FBandedSwirlTransitionEffect;
  external 'InitBandedSwirlTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitBlindTransitionEffect: FBlindTransitionEffect;
  external 'InitBlindTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitBloodTransitionEffect: FBloodTransitionEffect;
  external 'InitBloodTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitCircleTransitionEffect: FCircleTransitionEffect;
  external 'InitCircleTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitMagnifyTransitionEffect: FMagnifyTransitionEffect;
  external 'InitMagnifyTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitCrumpleTransitionEffect: FCrumpleTransitionEffect;
  external 'InitCrumpleTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitDissolveTransitionEffect: FDissolveTransitionEffect;
  external 'InitDissolveTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitDropTransitionEffect: FDropTransitionEffect;
  external 'InitDropTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitFadeTransitionEffect: FFadeTransitionEffect;
  external 'InitFadeTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitBrightTransitionEffect: FBrightTransitionEffect;
  external 'InitBrightTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitPixelateTransitionEffect: FPixelateTransitionEffect;
  external 'InitPixelateTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitBlurTransitionEffect: FBlurTransitionEffect;
  external 'InitBlurTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitWiggleTransitionEffect: FWiggleTransitionEffect;
  external 'InitWiggleTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitShapeTransitionEffect: FShapeTransitionEffect;
  external 'InitShapeTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitRippleTransitionEffect: FRippleTransitionEffect;
  external 'InitRippleTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitRotateCrumpleTransitionEffect: FRotateCrumpleTransitionEffect;
  external 'InitRotateCrumpleTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitSaturateTransitionEffect: FSaturateTransitionEffect;
  external 'InitSaturateTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitSlideTransitionEffect: FSlideTransitionEffect;
  external 'InitSlideTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitSwirlTransitionEffect: FSwirlTransitionEffect;
  external 'InitSwirlTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitWaterTransitionEffect: FWaterTransitionEffect;
  external 'InitWaterTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitWaveTransitionEffect: FWaveTransitionEffect;
  external 'InitWaveTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitLineTransitionEffect: FLineTransitionEffect;
  external 'InitLineTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitAffineTransformEffect: FAffineTransformEffect;
  external 'InitAffineTransformEffect@files:FMXBridge.dll stdcall delayload';
function InitPerspectiveTransformEffect: FPerspectiveTransformEffect;
  external 'InitPerspectiveTransformEffect@files:FMXBridge.dll stdcall delayload';
function InitCropEffect: FCropEffect;
  external 'InitCropEffect@files:FMXBridge.dll stdcall delayload';
function InitGaussianBlurEffect: FGaussianBlurEffect;
  external 'InitGaussianBlurEffect@files:FMXBridge.dll stdcall delayload';
function InitBoxBlurEffect: FBoxBlurEffect;
  external 'InitBoxBlurEffect@files:FMXBridge.dll stdcall delayload';
function InitDirectionalBlurEffect: FDirectionalBlurEffect;
  external 'InitDirectionalBlurEffect@files:FMXBridge.dll stdcall delayload';
function InitRadialBlurEffect: FRadialBlurEffect;
  external 'InitRadialBlurEffect@files:FMXBridge.dll stdcall delayload';
function InitSwipeTransitionEffect: FSwipeTransitionEffect;
  external 'InitSwipeTransitionEffect@files:FMXBridge.dll stdcall delayload';
function InitRasterEffect: FRasterEffect;
  external 'InitRasterEffect@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Layouts
// =============================================================================
function InitLayoutHandle: FLayout;
  external 'InitLayoutHandle@files:FMXBridge.dll stdcall delayload';
function InitScaledLayoutHandle: FScaledLayout;
  external 'InitScaledLayoutHandle@files:FMXBridge.dll stdcall delayload';
function InitGridLayoutHandle: FGridLayout;
  external 'InitGridLayoutHandle@files:FMXBridge.dll stdcall delayload';
function InitGridPanelLayoutHandle: FGridPanelLayout;
  external 'InitGridPanelLayoutHandle@files:FMXBridge.dll stdcall delayload';
function InitFlowLayoutHandle: FFlowLayout;
  external 'InitFlowLayoutHandle@files:FMXBridge.dll stdcall delayload';
function InitScrollBoxHandle: FScrollBox;
  external 'InitScrollBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitHorzScrollBoxHandle: FHorzScrollBox;
  external 'InitHorzScrollBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitVertScrollBoxHandle: FVertScrollBox;
  external 'InitVertScrollBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitBufferedLayoutHandle: FBufferedLayout;
  external 'InitBufferedLayoutHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// MediaPlayer
// =============================================================================
function InitMediaPlayer: FMediaPlayer;
  external 'InitMediaPlayer@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// NetHTTPClient
// =============================================================================
function InitNetHTTPClient: FNetHTTPClient;
  external 'InitNetHTTPClient@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Shapes
// =============================================================================
function InitLineHandle: FLine;
  external 'InitLineHandle@files:FMXBridge.dll stdcall delayload';
function InitRectangleHandle: FRectangle;
  external 'InitRectangleHandle@files:FMXBridge.dll stdcall delayload';
function InitRoundRectHandle: FRoundRect;
  external 'InitRoundRectHandle@files:FMXBridge.dll stdcall delayload';
function InitEllipseHandle: FEllipse;
  external 'InitEllipseHandle@files:FMXBridge.dll stdcall delayload';
function InitCircleHandle: FCircle;
  external 'InitCircleHandle@files:FMXBridge.dll stdcall delayload';
function InitArcHandle: FArc;
  external 'InitArcHandle@files:FMXBridge.dll stdcall delayload';
function InitPieHandle: FPie;
  external 'InitPieHandle@files:FMXBridge.dll stdcall delayload';
function InitTextHandle: FText;
  external 'InitTextHandle@files:FMXBridge.dll stdcall delayload';
function InitPathHandle: FPath;
  external 'InitPathHandle@files:FMXBridge.dll stdcall delayload';
function InitImageHandle: FImage;
  external 'InitImageHandle@files:FMXBridge.dll stdcall delayload';
function InitCalloutRectangleHandle: FCalloutRectangle;
  external 'InitCalloutRectangleHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Standard
// =============================================================================
function InitButtonHandle: FButton;
  external 'InitButtonHandle@files:FMXBridge.dll stdcall delayload';
function InitCheckboxHandle: FCheckBox;
  external 'InitCheckboxHandle@files:FMXBridge.dll stdcall delayload';
function InitRadioButtonHandle: FRadioButton;
  external 'InitRadioButtonHandle@files:FMXBridge.dll stdcall delayload';
function InitGroupBoxHandle: FGroupBox;
  external 'InitGroupBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitPopupBoxHandle: FPopupBox;
  external 'InitPopupBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitPanelHandle: FPanel;
  external 'InitPanelHandle@files:FMXBridge.dll stdcall delayload';
function InitCalloutPanelHandle: FCalloutPanel;
  external 'InitCalloutPanelHandle@files:FMXBridge.dll stdcall delayload';
function InitLabelHandle: FLabel;
  external 'InitLabelHandle@files:FMXBridge.dll stdcall delayload';
function InitImageControlHandle: FImageControl;
  external 'InitImageControlHandle@files:FMXBridge.dll stdcall delayload';
function InitProgressBarHandle: FProgressBar;
  external 'InitProgressBarHandle@files:FMXBridge.dll stdcall delayload';
function InitExpanderHandle: FExpander;
  external 'InitExpanderHandle@files:FMXBridge.dll stdcall delayload';
function InitTrackBarHandle: FTrackBar;
  external 'InitTrackBarHandle@files:FMXBridge.dll stdcall delayload';
function InitSwitchHandle: FSwitch;
  external 'InitSwitchHandle@files:FMXBridge.dll stdcall delayload';
function InitSplitterHandle: FSplitter;
  external 'InitSplitterHandle@files:FMXBridge.dll stdcall delayload';
function InitMenuItemHandle: FMenuItem;
  external 'InitMenuItemHandle@files:FMXBridge.dll stdcall delayload';
function InitMenuBarHandle: FMenuBar;
  external 'InitMenuBarHandle@files:FMXBridge.dll stdcall delayload';
function InitStatusBarHandle: FStatusBar;
  external 'InitStatusBarHandle@files:FMXBridge.dll stdcall delayload';
function InitToolBarHandle: FToolBar;
  external 'InitToolBarHandle@files:FMXBridge.dll stdcall delayload';
function InitSearchBoxHandle: FSearchBox;
  external 'InitSearchBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitListBoxGroupFooterHandle: FListBoxGroupFooter;
  external 'InitListBoxGroupFooterHandle@files:FMXBridge.dll stdcall delayload';
function InitListBoxGroupHeaderHandle: FListBoxGroupHeader;
  external 'InitListBoxGroupHeaderHandle@files:FMXBridge.dll stdcall delayload';
function InitListBoxHeaderHandle: FListBoxHeader;
  external 'InitListBoxHeaderHandle@files:FMXBridge.dll stdcall delayload';
function InitListBoxItemHandle: FListBoxItem;
  external 'InitListBoxItemHandle@files:FMXBridge.dll stdcall delayload';
function InitListBoxHandle: FListBox;
  external 'InitListBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitComboBoxHandle: FComboBox;
  external 'InitComboBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitMemoHandle: FMemo;
  external 'InitMemoHandle@files:FMXBridge.dll stdcall delayload';
function InitEditHandle: FEdit;
  external 'InitEditHandle@files:FMXBridge.dll stdcall delayload';
function InitTreeViewItemHandle: FTreeViewItem;
  external 'InitTreeViewItemHandle@files:FMXBridge.dll stdcall delayload';
function InitTreeViewHandle: FTreeView;
  external 'InitTreeViewHandle@files:FMXBridge.dll stdcall delayload';
function InitImageListHandle: FImageList;
  external 'InitImageListHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// System
// =============================================================================
function InitTimer: FTimer;
  external 'InitTimer@files:FMXBridge.dll stdcall delayload';
function InitStopwatch: FStopwatch;
  external 'InitStopwatch@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// 3D
// =============================================================================
function InitViewport3DHandle: FViewport3D;
  external 'InitViewport3DHandle@files:FMXBridge.dll stdcall delayload';
function InitLightHandle: FLight;
  external 'InitLightHandle@files:FMXBridge.dll stdcall delayload';
function InitCameraHandle: FCamera;
  external 'InitCameraHandle@files:FMXBridge.dll stdcall delayload';
function InitDummyHandle: FDummy;
  external 'InitDummyHandle@files:FMXBridge.dll stdcall delayload';
function InitProxyObjectHandle: FProxyObject;
  external 'InitProxyObjectHandle@files:FMXBridge.dll stdcall delayload';
function InitPlaneHandle: FPlane;
  external 'InitPlaneHandle@files:FMXBridge.dll stdcall delayload';
function InitDiskHandle: FDisk;
  external 'InitDiskHandle@files:FMXBridge.dll stdcall delayload';
function InitCubeHandle: FCube;
  external 'InitCubeHandle@files:FMXBridge.dll stdcall delayload';
function InitSphereHandle: FSphere;
  external 'InitSphereHandle@files:FMXBridge.dll stdcall delayload';
function InitCylinderHandle: FCylinder;
  external 'InitCylinderHandle@files:FMXBridge.dll stdcall delayload';
function InitRoundCubeHandle: FRoundCube;
  external 'InitRoundCubeHandle@files:FMXBridge.dll stdcall delayload';
function InitConeHandle: FCone;
  external 'InitConeHandle@files:FMXBridge.dll stdcall delayload';
function InitGrid3DHandle: FGrid3D;
  external 'InitGrid3DHandle@files:FMXBridge.dll stdcall delayload';
function InitStrokeCubeHandle: FStrokeCube;
  external 'InitStrokeCubeHandle@files:FMXBridge.dll stdcall delayload';
function InitText3DHandle: FText3D;
  external 'InitText3DHandle@files:FMXBridge.dll stdcall delayload';
function InitPath3DHandle: FPath3D;
  external 'InitPath3DHandle@files:FMXBridge.dll stdcall delayload';
function InitRectangle3DHandle: FRectangle3D;
  external 'InitRectangle3DHandle@files:FMXBridge.dll stdcall delayload';
function InitEllipse3DHandle: FEllipse3D;
  external 'InitEllipse3DHandle@files:FMXBridge.dll stdcall delayload';
function InitModel3DHandle: FModel3D;
  external 'InitModel3DHandle@files:FMXBridge.dll stdcall delayload';
function InitLayout3DHandle: FLayout3D;
  external 'InitLayout3DHandle@files:FMXBridge.dll stdcall delayload';
function InitBufferLayer3DHandle: FBufferLayer3D;
  external 'InitBufferLayer3DHandle@files:FMXBridge.dll stdcall delayload';
function InitSplitter3DHandle: FSplitter3D;
  external 'InitSplitter3DHandle@files:FMXBridge.dll stdcall delayload';
function InitSolidLayer3DHandle: FSolidLayer3D;
  external 'InitSolidLayer3DHandle@files:FMXBridge.dll stdcall delayload';
function InitImage3DHandle: FImage3D;
  external 'InitImage3DHandle@files:FMXBridge.dll stdcall delayload';
function InitLayer3DHandle: FLayer3D;
  external 'InitLayer3DHandle@files:FMXBridge.dll stdcall delayload';
function InitTextLayer3DHandle: FTextLayer3D;
  external 'InitTextLayer3DHandle@files:FMXBridge.dll stdcall delayload';
function InitColorMaterialSourceHandle: FColorMaterialSource;
  external 'InitColorMaterialSourceHandle@files:FMXBridge.dll stdcall delayload';
function InitTextureMaterialSourceHandle: FTextureMaterialSource;
  external 'InitTextureMaterialSourceHandle@files:FMXBridge.dll stdcall delayload';
function InitLightMaterialSourceHandle: FLightMaterialSource;
  external 'InitLightMaterialSourceHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Dialogs
// =============================================================================
function BrowseDialog(const Caption: WideString;
  var OutDir: WideString): Boolean;
  external 'BrowseDialog@files:FMXBridge.dll stdcall delayload';
function OpenDialog(const Caption, DefExt, Filter: WideString;
  var InDir, FileName: WideString): Boolean;
  external 'OpenDialog@files:FMXBridge.dll stdcall delayload';
function SaveDialog(const Caption, DefExt, Filter: WideString;
  var InDir, FileName: WideString): Boolean;
  external 'SaveDialog@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// BASSPlayer
// =============================================================================
function InitBASSPlayer: FBASSPlayer;
  external 'InitBASSPlayer@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// GIFImage
// =============================================================================
function InitGIFImageHandle: FGIFImage;
  external 'InitGIFImageHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// HTMLText
// =============================================================================
function InitHTMLTextHandle: FHTMLText;
  external 'InitHTMLTextHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// RadiantShapes
// =============================================================================
function InitRadiantAlertTriangleHandle: FRadiantAlertTriangle;
  external 'InitRadiantAlertTriangleHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantArcHandle: FRadiantArc;
  external 'InitRadiantArcHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantArrowHandle: FRadiantArrow;
  external 'InitRadiantArrowHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantBannerHandle: FRadiantBanner;
  external 'InitRadiantBannerHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantCalloutHandle: FRadiantCallout;
  external 'InitRadiantCalloutHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantCapsuleHandle: FRadiantCapsule;
  external 'InitRadiantCapsuleHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantCheckHandle: FRadiantCheck;
  external 'InitRadiantCheckHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantChevronHandle: FRadiantChevron;
  external 'InitRadiantChevronHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantChevronArrowHandle: FRadiantChevronArrow;
  external 'InitRadiantChevronArrowHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantCircleHandle: FRadiantCircle;
  external 'InitRadiantCircleHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantDiamondHandle: FRadiantDiamond;
  external 'InitRadiantDiamondHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantEllipseHandle: FRadiantEllipse;
  external 'InitRadiantEllipseHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantFrameHandle: FRadiantFrame;
  external 'InitRadiantFrameHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantGearHandle: FRadiantGear;
  external 'InitRadiantGearHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantHexagonHandle: FRadiantHexagon;
  external 'InitRadiantHexagonHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantLineHandle: FRadiantLine;
  external 'InitRadiantLineHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantMarkerHandle: FRadiantMarker;
  external 'InitRadiantMarkerHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantMinusHandle: FRadiantMinus;
  external 'InitRadiantMinusHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantNoRingHandle: FRadiantNoRing;
  external 'InitRadiantNoRingHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantOctagonHandle: FRadiantOctagon;
  external 'InitRadiantOctagonHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantParallelogramHandle: FRadiantParallelogram;
  external 'InitRadiantParallelogramHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantPentagonHandle: FRadiantPentagon;
  external 'InitRadiantPentagonHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantPlusHandle: FRadiantPlus;
  external 'InitRadiantPlusHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantPointerHandle: FRadiantPointer;
  external 'InitRadiantPointerHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantRectangleHandle: FRadiantRectangle;
  external 'InitRadiantRectangleHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantRingHandle: FRadiantRing;
  external 'InitRadiantRingHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantSectorHandle: FRadiantSector;
  external 'InitRadiantSectorHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantSectorRingHandle: FRadiantSectorRing;
  external 'InitRadiantSectorRingHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantShieldHandle: FRadiantShield;
  external 'InitRadiantShieldHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantSquareHandle: FRadiantSquare;
  external 'InitRadiantSquareHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantStarHandle: FRadiantStar;
  external 'InitRadiantStarHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantTagHandle: FRadiantTag;
  external 'InitRadiantTagHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantTrapezoidHandle: FRadiantTrapezoid;
  external 'InitRadiantTrapezoidHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantTriangleHandle: FRadiantTriangle;
  external 'InitRadiantTriangleHandle@files:FMXBridge.dll stdcall delayload';
function InitRadiantXHandle: FRadiantX;
  external 'InitRadiantXHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// BlurRectangle
// =============================================================================
function InitBlurRectangleHandle: FBlurRectangle;
  external 'InitBlurRectangleHandle@files:FMXBridge.dll stdcall delayload';

// ==================================================
// GlassRectangle
// ==================================================
function InitGlassRectangleHandle: FGlassRectangle;
  external 'InitGlassRectangleHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// PicShow
// =============================================================================
function InitPicShowHandle: FPicShow;
  external 'InitPicShowHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// ShapeControls
// =============================================================================
function InitShapeArcHandle: FShapeArc;
  external 'InitShapeArcHandle@files:FMXBridge.dll stdcall delayload';
function InitShapeSwitchHandle: FShapeSwitch;
  external 'InitShapeSwitchHandle@files:FMXBridge.dll stdcall delayload';
function InitShapeButtonHandle: FShapeButton;
  external 'InitShapeButtonHandle@files:FMXBridge.dll stdcall delayload';
function InitShapeGradientButtonHandle: FShapeGradientButton;
  external 'InitShapeGradientButtonHandle@files:FMXBridge.dll stdcall delayload';
function InitShapeProgressBarHandle: FShapeProgressBar;
  external 'InitShapeProgressBarHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Spinner
// =============================================================================
function InitSpinnerHandle: FSpinner;
  external 'InitSpinnerHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Sprites
// =============================================================================
function InitImageProgressBarHandle: FImageProgressBar;
  external 'InitImageProgressBarHandle@files:FMXBridge.dll stdcall delayload';
function InitImageRadioButtonHandle: FImageRadioButton;
  external 'InitImageRadioButtonHandle@files:FMXBridge.dll stdcall delayload';
function InitImageCheckBoxHandle: FImageCheckBox;
  external 'InitImageCheckBoxHandle@files:FMXBridge.dll stdcall delayload';
function InitImageButtonHandle: FImageButton;
  external 'InitImageButtonHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// SVGImage
// =============================================================================
function InitSVGImageHandle: FSVGImage;
  external 'InitSVGImageHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// WebPImage
// =============================================================================
function InitWebPImageHandle: FWebPImage;
  external 'InitWebPImageHandle@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Custom
// =============================================================================
function InitPageControlHandle: FPageControl;
  external 'InitPageControlHandle@files:FMXBridge.dll stdcall delayload';
function InitPageItemHandle: FPageItem;
  external 'InitPageItemHandle@files:FMXBridge.dll stdcall delayload';
function InitTileHandle: FTile;
  external 'InitTileHandle@files:FMXBridge.dll stdcall delayload';
function InitUWPTilesHandle: FUWPTiles;
  external 'InitUWPTilesHandle@files:FMXBridge.dll stdcall delayload';
function InitRatingBar: FRatingBar;
  external 'InitRatingBar@files:FMXBridge.dll stdcall delayload';
function InitMarquee: FMarquee;
  external 'InitMarquee@files:FMXBridge.dll stdcall delayload';
function InitCheckBoxTree: FCheckBoxTree;
  external 'InitCheckBoxTree@files:FMXBridge.dll stdcall delayload';
function InitLockScreenHandle: FLockScreen;
  external 'InitLockScreenHandle@files:FMXBridge.dll stdcall delayload';
function InitShadowTextHandle: FShadowText;
  external 'InitShadowTextHandle@files:FMXBridge.dll stdcall delayload';
function InitHighlight: FHighlight;
  external 'InitHighlight@files:FMXBridge.dll stdcall delayload';
function InitStorageInfo: FStorageInfo;
  external 'InitStorageInfo@files:FMXBridge.dll stdcall delayload';
function InitSystemInfo: FSystemInfo;
  external 'InitSystemInfo@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// Utils
// =============================================================================
procedure SetFileDropCallback(ACallback: TFileDropCallback);
  external 'SetFileDropCallback@files:FMXBridge.dll stdcall delayload';
procedure NotifyFileDrop(Sender: TObject; const FileName: WideString);
  external 'NotifyFileDrop@files:FMXBridge.dll stdcall delayload';
function ExtractIconFromResource(const FModule, FOutFile: WideString;
  FIndex: Cardinal; FSize: Integer): Boolean;
  external 'ExtractIconFromResource@files:FMXBridge.dll stdcall delayload';
function VCLFontSizeToFMX(const VCLFontSize: Single): Single;
  external 'VCLFontSizeToFMX@files:FMXBridge.dll stdcall delayload';
procedure ProcessMessages;
  external 'ProcessMessages@files:FMXBridge.dll stdcall delayload';
procedure ProcessMessagesUn;
  external 'ProcessMessages@{tmp}\FMXBridge.dll uninstallonly stdcall delayload';
function IsWindows11: Boolean;
  external 'IsWindows11@files:FMXBridge.dll stdcall delayload';
function GetWinAccentColor: TAlphaColor;
  external 'GetWinAccentColor@files:FMXBridge.dll stdcall delayload';
function GetDesktopImg: WideString;
  external 'GetDesktopImg@files:FMXBridge.dll stdcall delayload';
function GetImgColor(const FImage: WideString): TAlphaColor;
  external 'GetImgColor@files:FMXBridge.dll stdcall delayload';
function ColorSetOpacity(const FColor: TAlphaColor;
  FOpacity: Single): TAlphaColor;
  external 'ColorSetOpacity@files:FMXBridge.dll stdcall delayload';
function ColorDarker(const FColor: TAlphaColor;
  Percent: Byte): TAlphaColor;
  external 'ColorDarker@files:FMXBridge.dll stdcall delayload';
function ColorLighter(const FColor: TAlphaColor;
  Percent: Byte): TAlphaColor;
  external 'ColorLighter@files:FMXBridge.dll stdcall delayload';
function IsLightColor(const FColor: TAlphaColor): Boolean;
  external 'IsLightColor@files:FMXBridge.dll stdcall delayload';
procedure BeginHaltProc;
  external 'BeginHaltProc@files:FMXBridge.dll stdcall delayload';
procedure EndHaltProc;
  external 'EndHaltProc@files:FMXBridge.dll stdcall delayload';
function GetShortCut(Key: Word; Shift: TShiftState): TShortCut;
  external 'GetShortCut@files:FMXBridge.dll stdcall delayload';
function MbOrTb(Float: Extended; Decimal: Integer;
  const sMb, sGb, sTb: WideString): WideString;
  external 'MbOrTb@files:FMXBridge.dll stdcall delayload';
function MHzOrGHz(Float: Extended; Decimal: Integer): WideString;
  external 'MHzOrGHz@files:FMXBridge.dll stdcall delayload';
function CnvtUTF32ToUTF16(const Str: WideString): WideString;
  external 'CnvtUTF32ToUTF16@files:FMXBridge.dll stdcall delayload';
function GetWinMajorVersion: Cardinal;
  external 'GetWinMajorVersion@files:FMXBridge.dll stdcall delayload';
function GetWinBuildNumber: Cardinal;
  external 'GetWinBuildNumber@files:FMXBridge.dll stdcall delayload';
function GetDisplayResolutionX: Integer;
  external 'GetDisplayResolutionX@files:FMXBridge.dll stdcall delayload';
function GetDisplayResolutionY: Integer;
  external 'GetDisplayResolutionY@files:FMXBridge.dll stdcall delayload';
function GetCurrentDPIValue: Cardinal;
  external 'GetCurrentDPIValue@files:FMXBridge.dll stdcall delayload';
procedure GetFMXBridgeBuildDate(var YearW, MonthW, DayW: Word);
  external 'GetFMXBridgeBuildDate@files:FMXBridge.dll stdcall delayload';
function GetUserCountryName: WideString;
  external 'GetUserCountryName@files:FMXBridge.dll stdcall delayload';
function GetRunningAppCount: Integer;
  external 'GetRunningAppCount@files:FMXBridge.dll stdcall delayload';
function GetRecycleBinInfo(var FTotalSizeMB: Extended): Boolean;
  external 'GetRecycleBinInfo@files:FMXBridge.dll stdcall delayload';
function PlayWavFile1(const WavFileName: WideString): Boolean;
  external 'PlayWavFile1@files:FMXBridge.dll stdcall delayload';
function PlayWavFile2(const WavFileName: WideString; Flags: Cardinal)
  : Boolean;
  external 'PlayWavFile2@files:FMXBridge.dll stdcall delayload';
function PlayWavFile3(const WavFileName: WideString; Handle, Flags: Cardinal)
  : Boolean;
  external 'PlayWavFile3@files:FMXBridge.dll stdcall delayload';
function SystemExit(EWX_Flags: UINT): BOOL;
  external 'SystemExit@files:FMXBridge.dll stdcall delayload';
function ReadAllText(const FileName: WideString; out FText: WideString)
  : Boolean;
  external 'ReadAllText@files:FMXBridge.dll stdcall delayload';
function WriteAllText(const FileName, FText: WideString): Boolean;
  external 'WriteAllText@files:FMXBridge.dll stdcall delayload';
function AppendAllText(const FileName, FText: WideString): Boolean;
  external 'AppendAllText@files:FMXBridge.dll stdcall delayload';
function CopyFiles(const SourceDir, DestDir, Masks: WideString;
  Overwrite: Boolean): Integer;
  external 'CopyFiles@files:FMXBridge.dll stdcall delayload';
function MoveFiles(const SourceDir, DestDir, Masks: WideString;
  Overwrite: Boolean): Integer;
  external 'MoveFiles@files:FMXBridge.dll stdcall delayload';

// =============================================================================
// FMX ShutDown
// =============================================================================
procedure _FMXBridgeShutDown(const UnInstall: Boolean);
  external 'FMXBridgeShutDown@files:FMXBridge.dll stdcall delayload';
procedure _FMXBridgeShutDownUn(const UnInstall: Boolean);
  external 'FMXBridgeShutDown@{tmp}\FMXBridge.dll uninstallonly stdcall delayload';
function EndTask(HWND: HWND; fShutDown, fForce: BOOL): BOOL;
  external 'EndTask@user32.dll stdcall delayload';
function EndTaskUn(HWND: HWND; fShutDown, fForce: BOOL): BOOL;
  external 'EndTask@user32.dll uninstallonly stdcall delayload';

procedure FMXBridgeShutDown;
begin
  _FMXBridgeShutDown(False);
  EndTask(WizardForm.Handle, False, True);
end;

procedure FMXBridgeShutDownUn;
begin
  _FMXBridgeShutDownUn(True);
  EndTaskUn(UninstallProgressForm.Handle, False, True);
end;

// =============================================================================
// Helper procedures and functions
// =============================================================================
function AddFontResource(FileName: String): Integer;
  external 'AddFontResourceW@gdi32.dll stdcall delayload';
function RemoveFontResource(FileName: String): BOOL;
  external 'RemoveFontResourceW@gdi32.dll stdcall delayload';

function CmdLineParamExist(const Param: String): Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := 1 to ParamCount do
    if CompareText(ParamStr(i), Param) = 0 then
    begin
      Result := True;
      Exit;
    end;
end;

function FmtSetupMessage(const ID: TSetupMessageID;
  const FromStr, ToStr: String; const SupportDBCS: Boolean): WideString;
var
  S: String;
begin
  S := SetupMessage(ID);

  StringChangeEx(S, FromStr, ToStr, SupportDBCS);

  Result := S;
end;

function ExtractAndLoad(AFileName: String): String;
var
  AFile: String;
begin
  AFile := ExtractFileName(AFileName);

  if not FileExists(ExpandConstant('{tmp}\' + AFile)) then
    ExtractTemporaryFile(AFile);

  Result := ExpandConstant('{tmp}\' + AFile);
end;

procedure EmptyWizardForm(BaseWidth, BaseHeight: Integer);
begin
  with WizardForm do
  begin
    Position := poScreenCenter;

    Height := BaseHeight;
    Width := BaseWidth;

    NextButton.SetBounds(0, 0, 0, 0);
    CancelButton.SetBounds(0, 0, 0, 0);
    BackButton.SetBounds(0, 0, 0, 0);
  end;
end;
