
unit FMXBridge.ThreeD;

interface

uses
  System.Classes, System.UITypes,

  FMX.DAE.Importer,
//  FMX.ASE.Importer,
//  FMX.OBJ.Importer,

  FMX.Graphics, FMX.Types, FMX.Objects, FMX.Viewport3D, FMX.Types3D,
  FMX.Controls3D, FMX.Layers3D, FMX.Objects3D, FMX.MaterialSources;

// =============================================================================
// FViewport3D
// =============================================================================
type
  FViewport3D = interface(IUnknown)
    ['{3446EB19-70CB-453F-8F05-6FDB91E35347}']
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
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Camera(FCamera: TCamera); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Multisample(FMultisample: TMultisample); stdcall;
    procedure UsingDesignCamera(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure SetTagFloat(FTagFloat: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetTagFloat: Single; stdcall;
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
    procedure OnMouseMove(Event: TMouseMoveEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFViewport3D = class(TInterfacedObject, FViewport3D)
  private
    ControlViewport3D: TViewport3D;
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
    procedure SetClipParent(FValue: Boolean); stdcall;
    procedure SetClipChildren(FValue: Boolean); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Camera(FCamera: TCamera); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Multisample(FMultisample: TMultisample); stdcall;
    procedure UsingDesignCamera(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure RotationAngle(FValue: Single); stdcall;
    procedure RotationCenter(X, Y: Single); stdcall;
    procedure SetTagFloat(FTagFloat: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetTagFloat: Single; stdcall;
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
    procedure OnMouseMove(Event: TMouseMoveEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FCamera
// =============================================================================
type
  FCamera = interface(IUnknown)
    ['{EC4432CB-CBFB-45B9-853E-E76943DCD622}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure AngleOfView(FValue: Single); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Target(FTarget: TControl3D); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFCamera = class(TInterfacedObject, FCamera)
  private
    ControlCamera: TCamera;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure AngleOfView(FValue: Single); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Target(FTarget: TControl3D); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FLight
// =============================================================================
type
  FLight = interface(IUnknown)
    ['{BD2ED1E9-5BCA-4E15-9DC6-3A49815A9B47}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure LightType(FLightType: TLightType); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SpotCutOff(FValue: Single); stdcall;
    procedure SpotExponent(FValue: Single); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFLight = class(TInterfacedObject, FLight)
  private
    ControlLight: TLight;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure LightType(FLightType: TLightType); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SpotCutOff(FValue: Single); stdcall;
    procedure SpotExponent(FValue: Single); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Enabled(FEnabled: Boolean); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FDummy
// =============================================================================
type
  FDummy = interface(IUnknown)
    ['{A29A4C09-AE41-46C0-B861-63666DF86DAA}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetRotationAngleX: Single; stdcall;
    function GetRotationAngleY: Single; stdcall;
    function GetRotationAngleZ: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFDummy = class(TInterfacedObject, FDummy)
  private
    ControlDummy: TDummy;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetRotationAngleX: Single; stdcall;
    function GetRotationAngleY: Single; stdcall;
    function GetRotationAngleZ: Single; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FProxyObject
// =============================================================================
type
  FProxyObject = interface(IUnknown)
    ['{33BE33E9-7805-47BF-BABE-F9DE8021A2A1}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFProxyObject = class(TInterfacedObject, FProxyObject)
  private
    ControlProxyObject: TProxyObject;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FPlane
// =============================================================================
type
  FPlane = interface(IUnknown)
    ['{BD97DC30-3A98-4EE2-9112-B2E3F7D8CB5A}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure SubdivisionsWidth(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFPlane = class(TInterfacedObject, FPlane)
  private
    ControlPlane: TPlane;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure SubdivisionsWidth(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FDisk
// =============================================================================
type
  FDisk = interface(IUnknown)
    ['{2C98B668-77BD-4321-93D0-05EE59996DED}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsAxes(FValue: Integer); stdcall;
    procedure SubdivisionsCap(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFDisk = class(TInterfacedObject, FDisk)
  private
    ControlDisk: TDisk;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsAxes(FValue: Integer); stdcall;
    procedure SubdivisionsCap(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FCube
// =============================================================================
type
  FCube = interface(IUnknown)
    ['{6A940A03-C3E2-45A9-A916-47545D379D95}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsDepth(FValue: Integer); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure SubdivisionsWidth(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFCube = class(TInterfacedObject, FCube)
  private
    ControlCube: TCube;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsDepth(FValue: Integer); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure SubdivisionsWidth(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSphere
// =============================================================================
type
  FSphere = interface(IUnknown)
    ['{BC9F14BF-282E-492E-9FEC-9D97114B747D}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsAxes(FValue: Integer); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSphere = class(TInterfacedObject, FSphere)
  private
    ControlSphere: TSphere;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsAxes(FValue: Integer); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FCylinder
// =============================================================================
type
  FCylinder = interface(IUnknown)
    ['{9155D52D-4851-4B23-924C-B0576218987A}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsAxes(FValue: Integer); stdcall;
    procedure SubdivisionsCap(FValue: Integer); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFCylinder = class(TInterfacedObject, FCylinder)
  private
    ControlCylinder: TCylinder;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsAxes(FValue: Integer); stdcall;
    procedure SubdivisionsCap(FValue: Integer); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FRoundCube
// =============================================================================
type
  FRoundCube = interface(IUnknown)
    ['{7B007E5E-511B-49F4-BC52-0CD0AEC152E4}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFRoundCube = class(TInterfacedObject, FRoundCube)
  private
    ControlRoundCube: TRoundCube;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FCone
// =============================================================================
type
  FCone = interface(IUnknown)
    ['{B3256353-B340-4393-804C-CEE213741A07}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsAxes(FValue: Integer); stdcall;
    procedure SubdivisionsCap(FValue: Integer); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFCone = class(TInterfacedObject, FCone)
  private
    ControlCone: TCone;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure SubdivisionsAxes(FValue: Integer); stdcall;
    procedure SubdivisionsCap(FValue: Integer); stdcall;
    procedure SubdivisionsHeight(FValue: Integer); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FGrid3D
// =============================================================================
type
  FGrid3D = interface(IUnknown)
    ['{441EF7FD-28DC-4A95-95FE-11C2283272C5}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Frequency(FValue: Single); stdcall;
    procedure LineColor(FColor: TAlphaColor); stdcall;
    procedure Marks(FValue: Single); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFGrid3D = class(TInterfacedObject, FGrid3D)
  private
    ControlGrid3D: TGrid3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Frequency(FValue: Single); stdcall;
    procedure LineColor(FColor: TAlphaColor); stdcall;
    procedure Marks(FValue: Single); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FStrokeCube
// =============================================================================
type
  FStrokeCube = interface(IUnknown)
    ['{46C59A90-FE16-4D35-9899-08B40923514C}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFStrokeCube = class(TInterfacedObject, FStrokeCube)
  private
    ControlStrokeCube: TStrokeCube;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FText3D
// =============================================================================
type
  FText3D = interface(IUnknown)
    ['{30F480EB-5E5E-4403-B937-A036D6B429EB}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Flatness(FValue: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialShaftSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialBackSource(FMaterialSource: TMaterialSource); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Sides(FSides: TExtrudedShapeSides); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure Stretch(FValue: Boolean); stdcall;
    procedure FontSetting(const FontName: WideString;
      FontSize: Single); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFText3D = class(TInterfacedObject, FText3D)
  private
    ControlText3D: TText3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Flatness(FValue: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialShaftSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialBackSource(FMaterialSource: TMaterialSource); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Sides(FSides: TExtrudedShapeSides); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure Stretch(FValue: Boolean); stdcall;
    procedure FontSetting(const FontName: WideString;
      FontSize: Single); stdcall;
    procedure TextSetting(FWordWrap: Boolean;
      FHorzAlign, FVertAlign: TTextAlign); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FPath3D
// =============================================================================
type
  FPath3D = interface(IUnknown)
    ['{2164998F-8079-4D2A-A482-CA5946BBB2F9}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Flatness(FValue: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialShaftSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialBackSource(FMaterialSource: TMaterialSource); stdcall;
    procedure DataStr(const DataStr: WideString); stdcall;
    procedure DataWrapMode(FPathWrapMode: TPathWrapMode); stdcall;
    procedure DataBoundsMode(FBoundsMode: TBoundsMode); stdcall;
    procedure DataStyleLookup(FStyle: WideString); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Sides(FSides: TExtrudedShapeSides); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFPath3D = class(TInterfacedObject, FPath3D)
  private
    ControlPath3D: TPath3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Flatness(FValue: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialShaftSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialBackSource(FMaterialSource: TMaterialSource); stdcall;
    procedure DataStr(const DataStr: WideString); stdcall;
    procedure DataWrapMode(FPathWrapMode: TPathWrapMode); stdcall;
    procedure DataBoundsMode(FBoundsMode: TBoundsMode); stdcall;
    procedure DataStyleLookup(FStyle: WideString); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Sides(FSides: TExtrudedShapeSides); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FRectangle3D
// =============================================================================
type
  FRectangle3D = interface(IUnknown)
    ['{7659D995-3D22-400C-8D8A-E514006BFA87}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Flatness(FValue: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialShaftSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialBackSource(FMaterialSource: TMaterialSource); stdcall;
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Sides(FSides: TExtrudedShapeSides); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFRectangle3D = class(TInterfacedObject, FRectangle3D)
  private
    ControlRectangle3D: TRectangle3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Flatness(FValue: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialShaftSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialBackSource(FMaterialSource: TMaterialSource); stdcall;
    procedure CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
      FCornerType: TCornerType); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Sides(FSides: TExtrudedShapeSides); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FEllipse3D
// =============================================================================
type
  FEllipse3D = interface(IUnknown)
    ['{342CAAFD-77B1-45BD-A2B3-AF3A535E5F18}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Flatness(FValue: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialShaftSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialBackSource(FMaterialSource: TMaterialSource); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Sides(FSides: TExtrudedShapeSides); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFEllipse3D = class(TInterfacedObject, FEllipse3D)
  private
    ControlEllipse3D: TEllipse3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure Flatness(FValue: Single); stdcall;
    procedure MaterialSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialShaftSource(FMaterialSource: TMaterialSource); stdcall;
    procedure MaterialBackSource(FMaterialSource: TMaterialSource); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Sides(FSides: TExtrudedShapeSides); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FModel3D
// =============================================================================
type
  FModel3D = interface(IUnknown)
    ['{C84B16EF-7786-4F71-A5BE-45E8B7C62E4D}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure LoadFromfile(const Filename: WideString); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFModel3D = class(TInterfacedObject, FModel3D)
  private
    ControlModel3D: TModel3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Depth(FDepth: Single); stdcall;
    procedure LoadFromfile(const Filename: WideString); stdcall;
    procedure WrapMode(FWrapMode: TMeshWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FLayout3D
// =============================================================================
type
  FLayout3D = interface(IUnknown)
    ['{F474A2A5-BDF1-4CF7-BCAD-80F6A012233D}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFLayout3D = class(TInterfacedObject, FLayout3D)
  private
    ControlLayout3D: TLayout3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FBufferLayer3D
// =============================================================================
type
  FBufferLayer3D = interface(IUnknown)
    ['{7EAA5DA7-D61B-48D2-B1DC-7F7D7FB1D577}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure Resolution(FValue: Integer); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFBufferLayer3D = class(TInterfacedObject, FBufferLayer3D)
  private
    ControlBufferLayer3D: TBufferLayer3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure Resolution(FValue: Integer); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSplitter3D
// =============================================================================
type
  FSplitter3D = interface(IUnknown)
    ['{9D0DB3CC-B181-4DCF-81B9-B3F31F77AC07}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSplitter3D = class(TInterfacedObject, FSplitter3D)
  private
    ControlSplitter3D: TSplitter3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FSolidLayer3D
// =============================================================================
type
  FSolidLayer3D = interface(IUnknown)
    ['{341676C9-CF34-46D8-BA94-659069282D76}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFSolidLayer3D = class(TInterfacedObject, FSolidLayer3D)
  private
    ControlSolidLayer3D: TSolidLayer3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FImage3D
// =============================================================================
type
  FImage3D = interface(IUnknown)
    ['{95AF509C-924D-4DBD-9893-2FC6E0FEA823}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadFromfile(FTextureFile: WideString;
      WrapMode: TImageWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFImage3D = class(TInterfacedObject, FImage3D)
  private
    ControlImage3D: TImage3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure LoadFromfile(FTextureFile: WideString;
      WrapMode: TImageWrapMode); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FLayer3D
// =============================================================================
type
  FLayer3D = interface(IUnknown)
    ['{08D5FC43-F6F9-4CE8-8000-CC63CF01982D}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure AnimatedCaret(FValue: Boolean); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure Resolution(FValue: Integer); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Transparency(FValue: Boolean); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFLayer3D = class(TInterfacedObject, FLayer3D)
  private
    ControlLayer3D: TLayer3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure FillColor(FColor: TAlphaColor); stdcall;
    procedure FillPicture(const FImage: WideString;
      WrapMode: TWrapMode); stdcall;
    procedure FillGradient(FColor1, FColor2: TAlphaColor;
      FStyle: TGradientStyle); stdcall;
    procedure FillGradientLinearAngle(FAngle: Single); stdcall;
    procedure FillGradientRadialAngle(FAngle: Single); stdcall;
    procedure FillGradientPosition(X1, Y1, X2, Y2: Single); stdcall;
    procedure AnimatedCaret(FValue: Boolean); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure Resolution(FValue: Integer); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure Transparency(FValue: Boolean); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    procedure StyleLookUp(FStyle: WideString); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FTextLayer3D
// =============================================================================
type
  FTextLayer3D = interface(IUnknown)
    ['{62C07681-A12C-4D50-899D-39B40AAD5DA6}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString;
      FontSize: Single); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure Resolution(FValue: Integer); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

  TFTextLayer3D = class(TInterfacedObject, FTextLayer3D)
  private
    ControlTextLayer3D: TTextLayer3D;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Cursor(FCursor: TCursor); stdcall;
    procedure Height(FHeight: Single); stdcall;
    procedure Width(FWidth: Single); stdcall;
    procedure Align(Al: TAlignLayout); stdcall;
    procedure Margins(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure Padding(FLeft, FTop, FRight, FBottom: Single); stdcall;
    procedure BringToFront; stdcall;
    procedure SendToBack; stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    procedure Text(const FText: WideString); stdcall;
    procedure FontSetting(const FontName: WideString;
      FontSize: Single); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure Position(X, Y, Z: Single); stdcall;
    procedure PosX(X: Single); stdcall;
    procedure PosY(Y: Single); stdcall;
    procedure PosZ(Z: Single); stdcall;
    procedure Projection(FProjection: TProjection); stdcall;
    procedure Resolution(FValue: Integer); stdcall;
    procedure RotationAngle(X, Y, Z: Single); stdcall;
    procedure RotationAngleX(X: Single); stdcall;
    procedure RotationAngleY(Y: Single); stdcall;
    procedure RotationAngleZ(Z: Single); stdcall;
    procedure Scale(X, Y, Z: Single); stdcall;
    procedure ScaleX(X: Single); stdcall;
    procedure ScaleY(Y: Single); stdcall;
    procedure ScaleZ(Z: Single); stdcall;
    procedure TwoSide(FValue: Boolean); stdcall;
    procedure VisibleContextMenu(FValue: Boolean); stdcall;
    procedure ZWrite(FValue: Boolean); stdcall;
    procedure Opacity(FOpacity: Single); stdcall;
    procedure Visible(FVisible: Boolean); stdcall;
    procedure HitTest(FEnabled: Boolean); stdcall;
    function IsVisible: Boolean; stdcall;
    function GetTag: Integer; stdcall;
    function GetHeight: Single; stdcall;
    function GetWidth: Single; stdcall;
    function GetObject: TFmxObject; stdcall;
    procedure OnClick(Event: TNotifyEvent); stdcall;
    procedure OnMouseEnter(Event: TNotifyEvent); stdcall;
    procedure OnMouseLeave(Event: TNotifyEvent); stdcall;
    function Handle: TFmxObject; stdcall;
  end;

// =============================================================================
// FColorMaterialSource
// =============================================================================
type
  FColorMaterialSource = interface(IUnknown)
    ['{39EC2943-699D-47A7-A5BF-26B437F35B70}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    function GetTag: Integer; stdcall;
    function Handle: TMaterialSource; stdcall;
  end;

  TFColorMaterialSource = class(TInterfacedObject, FColorMaterialSource)
  private
    ControlColorMaterialSource: TColorMaterialSource;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Color(FColor: TAlphaColor); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    function GetTag: Integer; stdcall;
    function Handle: TMaterialSource; stdcall;
  end;

// =============================================================================
// FTextureMaterialSource
// =============================================================================
type
  FTextureMaterialSource = interface(IUnknown)
    ['{398C8C68-CC22-47A6-8A55-4CA0E95AFB20}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure LoadFromfile(FTextureFile: WideString); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    function GetTag: Integer; stdcall;
    function Handle: TMaterialSource; stdcall;
  end;

  TFTextureMaterialSource = class(TInterfacedObject, FTextureMaterialSource)
  private
    ControlTextureMaterialSource: TTextureMaterialSource;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure LoadFromfile(FTextureFile: WideString); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    function GetTag: Integer; stdcall;
    function Handle: TMaterialSource; stdcall;
  end;

// =============================================================================
// FLightMaterialSource
// =============================================================================
type
  FLightMaterialSource = interface(IUnknown)
    ['{CCCD8337-138F-44D3-83EB-A1F752AFE1DB}']
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Ambient(FColor: TAlphaColor); stdcall;
    procedure Diffuse(FColor: TAlphaColor); stdcall;
    procedure Emissive(FColor: TAlphaColor); stdcall;
    procedure Shininess(FValue: Integer); stdcall;
    procedure Specular(FColor: TAlphaColor); stdcall;
    procedure LoadFromfile(FTextureFile: WideString); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    function GetTag: Integer; stdcall;
    function Handle: TMaterialSource; stdcall;
  end;

  TFLightMaterialSource = class(TInterfacedObject, FLightMaterialSource)
  private
    ControlLightMaterialSource: TLightMaterialSource;
  public
    procedure FCreate(FParent: TFmxObject); stdcall;
    procedure Ambient(FColor: TAlphaColor); stdcall;
    procedure Diffuse(FColor: TAlphaColor); stdcall;
    procedure Emissive(FColor: TAlphaColor); stdcall;
    procedure Shininess(FValue: Integer); stdcall;
    procedure Specular(FColor: TAlphaColor); stdcall;
    procedure LoadFromfile(FTextureFile: WideString); stdcall;
    procedure SetTag(FTag: Integer); stdcall;
    function GetTag: Integer; stdcall;
    function Handle: TMaterialSource; stdcall;
  end;

// =============================================================================
// Exports
// =============================================================================
function InitViewport3DHandle: FViewport3D; stdcall;
function InitCameraHandle: FCamera; stdcall;
function InitLightHandle: FLight; stdcall;
function InitDummyHandle: FDummy; stdcall;
function InitProxyObjectHandle: FProxyObject; stdcall;
function InitPlaneHandle: FPlane; stdcall;
function InitDiskHandle: FDisk; stdcall;
function InitCubeHandle: FCube; stdcall;
function InitSphereHandle: FSphere; stdcall;
function InitCylinderHandle: FCylinder; stdcall;
function InitRoundCubeHandle: FRoundCube; stdcall;
function InitConeHandle: FCone; stdcall;
function InitGrid3DHandle: FGrid3D; stdcall;
function InitStrokeCubeHandle: FStrokeCube; stdcall;
function InitText3DHandle: FText3D; stdcall;
function InitPath3DHandle: FPath3D; stdcall;
function InitRectangle3DHandle: FRectangle3D; stdcall;
function InitEllipse3DHandle: FEllipse3D; stdcall;
function InitModel3DHandle: FModel3D; stdcall;
function InitLayout3DHandle: FLayout3D; stdcall;
function InitBufferLayer3DHandle: FBufferLayer3D; stdcall;
function InitSplitter3DHandle: FSplitter3D; stdcall;
function InitSolidLayer3DHandle: FSolidLayer3D; stdcall;
function InitImage3DHandle: FImage3D; stdcall;
function InitLayer3DHandle: FLayer3D; stdcall;
function InitTextLayer3DHandle: FTextLayer3D; stdcall;
function InitColorMaterialSourceHandle: FColorMaterialSource; stdcall;
function InitTextureMaterialSourceHandle: FTextureMaterialSource; stdcall;
function InitLightMaterialSourceHandle: FLightMaterialSource; stdcall;

implementation

uses
  FMXBridge.BrushHelpers;

// =============================================================================
// FViewport3D
// =============================================================================
procedure TFViewport3D.FCreate(FParent: TFmxObject);
begin
  ControlViewport3D := TViewport3D.Create(nil);
  ControlViewport3D.Parent := TFmxObject(FParent);
end;

procedure TFViewport3D.Cursor(FCursor: TCursor);
begin
  ControlViewport3D.Cursor := TCursor(FCursor);
end;

procedure TFViewport3D.Left(FLeft: Single);
begin
  ControlViewport3D.Position.X := FLeft;
end;

procedure TFViewport3D.Top(FTop: Single);
begin
  ControlViewport3D.Position.Y := FTop;
end;

procedure TFViewport3D.Height(FHeight: Single);
begin
  ControlViewport3D.Size.Height := FHeight;
end;

procedure TFViewport3D.Width(FWidth: Single);
begin
  ControlViewport3D.Size.Width := FWidth;
end;

procedure TFViewport3D.SetBounds(FLeft, FTop, FWidth, FHeight: Single);
begin
  ControlViewport3D.Position.X := FLeft;
  ControlViewport3D.Position.Y := FTop;
  ControlViewport3D.Size.Width := FWidth;
  ControlViewport3D.Size.Height := FHeight;
end;

procedure TFViewport3D.Position(X, Y: Single);
begin
  ControlViewport3D.Position.X := X;
  ControlViewport3D.Position.Y := Y;
end;

procedure TFViewport3D.Align(Al: TAlignLayout);
begin
  ControlViewport3D.Align := TAlignLayout(Al);
end;

procedure TFViewport3D.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlViewport3D.Margins.Left := FLeft;
  ControlViewport3D.Margins.Top := FTop;
  ControlViewport3D.Margins.Right := FRight;
  ControlViewport3D.Margins.Bottom := FBottom;
end;

procedure TFViewport3D.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlViewport3D.Padding.Left := FLeft;
  ControlViewport3D.Padding.Top := FTop;
  ControlViewport3D.Padding.Right := FRight;
  ControlViewport3D.Padding.Bottom := FBottom;
end;

procedure TFViewport3D.SetClipParent(FValue: Boolean);
begin
  ControlViewport3D.ClipParent := FValue;
end;

procedure TFViewport3D.SetClipChildren(FValue: Boolean);
begin
  ControlViewport3D.ClipChildren := FValue;
end;

procedure TFViewport3D.BringToFront;
begin
  ControlViewport3D.BringToFront;
end;

procedure TFViewport3D.SendToBack;
begin
  ControlViewport3D.SendToBack;
end;

procedure TFViewport3D.SetTag(FTag: Integer);
begin
  ControlViewport3D.Tag := FTag;
end;

procedure TFViewport3D.Camera(FCamera: TCamera);
begin
  ControlViewport3D.Camera := TCamera(FCamera);
end;

procedure TFViewport3D.Color(FColor: TAlphaColor);
begin
  ControlViewport3D.Color := TAlphaColor(FColor);
end;

procedure TFViewport3D.Multisample(FMultisample: TMultisample);
begin
  ControlViewport3D.Multisample := FMultisample;
end;

procedure TFViewport3D.UsingDesignCamera(FValue: Boolean);
begin
  ControlViewport3D.UsingDesignCamera := FValue;
end;

procedure TFViewport3D.Opacity(FOpacity: Single);
begin
  ControlViewport3D.Opacity := FOpacity;
end;

procedure TFViewport3D.RotationAngle(FValue: Single);
begin
  ControlViewport3D.RotationAngle := FValue;
end;

procedure TFViewport3D.RotationCenter(X, Y: Single);
begin
  ControlViewport3D.RotationCenter.X := X;
  ControlViewport3D.RotationCenter.Y := Y;
end;

procedure TFViewport3D.SetTagFloat(FTagFloat: Single);
begin
  ControlViewport3D.TagFloat := FTagFloat;
end;

procedure TFViewport3D.Enabled(FEnabled: Boolean);
begin
  ControlViewport3D.Enabled := FEnabled;
end;

procedure TFViewport3D.Visible(FVisible: Boolean);
begin
  ControlViewport3D.Visible := FVisible;
end;

procedure TFViewport3D.HitTest(FEnabled: Boolean);
begin
  ControlViewport3D.HitTest := FEnabled;
end;

function TFViewport3D.IsVisible: Boolean;
begin
  Result := ControlViewport3D.Visible;
end;

function TFViewport3D.GetTag: Integer;
begin
  Result := ControlViewport3D.Tag;
end;

function TFViewport3D.GetTagFloat: Single;
begin
  Result := ControlViewport3D.TagFloat;
end;

function TFViewport3D.GetLeft: Single;
begin
  Result := ControlViewport3D.Position.X;
end;

function TFViewport3D.GetTop: Single;
begin
  Result := ControlViewport3D.Position.Y;
end;

function TFViewport3D.GetHeight: Single;
begin
  Result := ControlViewport3D.Height;
end;

function TFViewport3D.GetWidth: Single;
begin
  Result := ControlViewport3D.Width;
end;

function TFViewport3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlViewport3D);
end;

procedure TFViewport3D.OnClick(Event: TNotifyEvent);
begin
  ControlViewport3D.OnClick := TNotifyEvent(Event);
end;

procedure TFViewport3D.OnMouseDown(Event: TMouseEvent);
begin
  ControlViewport3D.OnMouseDown := TMouseEvent(Event);
end;

procedure TFViewport3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlViewport3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFViewport3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlViewport3D.OnMouseLeave := TNotifyEvent(Event);
end;

procedure TFViewport3D.OnMouseUp(Event: TMouseEvent);
begin
  ControlViewport3D.OnMouseUp := TMouseEvent(Event);
end;

procedure TFViewport3D.OnMouseMove(Event: TMouseMoveEvent);
begin
  ControlViewport3D.OnMouseMove := TMouseMoveEvent(Event);
end;

function TFViewport3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlViewport3D);
end;

// =============================================================================
// FCamera
// =============================================================================
procedure TFCamera.FCreate(FParent: TFmxObject);
begin
  ControlCamera := TCamera.Create(nil);
  ControlCamera.Parent := TFmxObject(FParent);
end;

procedure TFCamera.Cursor(FCursor: TCursor);
begin
  ControlCamera.Cursor := TCursor(FCursor);
end;

procedure TFCamera.Height(FHeight: Single);
begin
  ControlCamera.Height := FHeight;
end;

procedure TFCamera.Width(FWidth: Single);
begin
  ControlCamera.Width := FWidth;
end;

procedure TFCamera.BringToFront;
begin
  ControlCamera.BringToFront;
end;

procedure TFCamera.SendToBack;
begin
  ControlCamera.SendToBack;
end;

procedure TFCamera.SetTag(FTag: Integer);
begin
  ControlCamera.Tag := FTag;
end;

procedure TFCamera.AngleOfView(FValue: Single);
begin
  ControlCamera.AngleOfView := FValue;
end;

procedure TFCamera.Depth(FDepth: Single);
begin
  ControlCamera.Depth := FDepth;
end;

procedure TFCamera.Target(FTarget: TControl3D);
begin
  ControlCamera.Target := TControl3D(FTarget);
end;

procedure TFCamera.Position(X, Y, Z: Single);
begin
  ControlCamera.Position.X := X;
  ControlCamera.Position.Y := Y;
  ControlCamera.Position.Z := Z;
end;

procedure TFCamera.PosX(X: Single);
begin
  ControlCamera.Position.X := X;
end;

procedure TFCamera.PosY(Y: Single);
begin
  ControlCamera.Position.Y := Y;
end;

procedure TFCamera.PosZ(Z: Single);
begin
  ControlCamera.Position.Z := Z;
end;

procedure TFCamera.Projection(FProjection: TProjection);
begin
  ControlCamera.Projection := TProjection(FProjection);
end;

procedure TFCamera.RotationAngle(X, Y, Z: Single);
begin
  ControlCamera.RotationAngle.X := X;
  ControlCamera.RotationAngle.Y := Y;
  ControlCamera.RotationAngle.Z := Z;
end;

procedure TFCamera.RotationAngleX(X: Single);
begin
  ControlCamera.RotationAngle.X := X;
end;

procedure TFCamera.RotationAngleY(Y: Single);
begin
  ControlCamera.RotationAngle.Y := Y;
end;

procedure TFCamera.RotationAngleZ(Z: Single);
begin
  ControlCamera.RotationAngle.Z := Z;
end;

procedure TFCamera.Scale(X, Y, Z: Single);
begin
  ControlCamera.Scale.X := X;
  ControlCamera.Scale.Y := Y;
  ControlCamera.Scale.Z := Z;
end;

procedure TFCamera.ScaleX(X: Single);
begin
  ControlCamera.Scale.X := X;
end;

procedure TFCamera.ScaleY(Y: Single);
begin
  ControlCamera.Scale.Y := Y;
end;

procedure TFCamera.ScaleZ(Z: Single);
begin
  ControlCamera.Scale.Z := Z;
end;

procedure TFCamera.TwoSide(FValue: Boolean);
begin
  ControlCamera.TwoSide := FValue;
end;

procedure TFCamera.VisibleContextMenu(FValue: Boolean);
begin
  ControlCamera.VisibleContextMenu := FValue;
end;

procedure TFCamera.ZWrite(FValue: Boolean);
begin
  ControlCamera.ZWrite := FValue;
end;

procedure TFCamera.Opacity(FOpacity: Single);
begin
  ControlCamera.Opacity := FOpacity;
end;

procedure TFCamera.Visible(FVisible: Boolean);
begin
  ControlCamera.Visible := FVisible;
end;

procedure TFCamera.HitTest(FEnabled: Boolean);
begin
  ControlCamera.HitTest := FEnabled;
end;

function TFCamera.IsVisible: Boolean;
begin
  Result := ControlCamera.Visible;
end;

function TFCamera.GetTag: Integer;
begin
  Result := ControlCamera.Tag;
end;

function TFCamera.GetHeight: Single;
begin
  Result := ControlCamera.Height;
end;

function TFCamera.GetWidth: Single;
begin
  Result := ControlCamera.Width;
end;

function TFCamera.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlCamera);
end;

function TFCamera.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlCamera);
end;

// =============================================================================
// FLight
// =============================================================================
procedure TFLight.FCreate(FParent: TFmxObject);
begin
  ControlLight := TLight.Create(nil);
  ControlLight.Parent := TFmxObject(FParent);
end;

procedure TFLight.Height(FHeight: Single);
begin
  ControlLight.Height := FHeight;
end;

procedure TFLight.Width(FWidth: Single);
begin
  ControlLight.Width := FWidth;
end;

procedure TFLight.BringToFront;
begin
  ControlLight.BringToFront;
end;

procedure TFLight.SendToBack;
begin
  ControlLight.SendToBack;
end;

procedure TFLight.SetTag(FTag: Integer);
begin
  ControlLight.Tag := FTag;
end;

procedure TFLight.Color(FColor: TAlphaColor);
begin
  ControlLight.Color := TAlphaColor(FColor);
end;

procedure TFLight.Depth(FDepth: Single);
begin
  ControlLight.Depth := FDepth;
end;

procedure TFLight.LightType(FLightType: TLightType);
begin
  ControlLight.LightType := TLightType(FLightType);
end;

procedure TFLight.Position(X, Y, Z: Single);
begin
  ControlLight.Position.X := X;
  ControlLight.Position.Y := Y;
  ControlLight.Position.Z := Z;
end;

procedure TFLight.PosX(X: Single);
begin
  ControlLight.Position.X := X;
end;

procedure TFLight.PosY(Y: Single);
begin
  ControlLight.Position.Y := Y;
end;

procedure TFLight.PosZ(Z: Single);
begin
  ControlLight.Position.Z := Z;
end;

procedure TFLight.Projection(FProjection: TProjection);
begin
  ControlLight.Projection := TProjection(FProjection);
end;

procedure TFLight.RotationAngle(X, Y, Z: Single);
begin
  ControlLight.RotationAngle.X := X;
  ControlLight.RotationAngle.Y := Y;
  ControlLight.RotationAngle.Z := Z;
end;

procedure TFLight.RotationAngleX(X: Single);
begin
  ControlLight.RotationAngle.X := X;
end;

procedure TFLight.RotationAngleY(Y: Single);
begin
  ControlLight.RotationAngle.Y := Y;
end;

procedure TFLight.RotationAngleZ(Z: Single);
begin
  ControlLight.RotationAngle.Z := Z;
end;

procedure TFLight.Scale(X, Y, Z: Single);
begin
  ControlLight.Scale.X := X;
  ControlLight.Scale.Y := Y;
  ControlLight.Scale.Z := Z;
end;

procedure TFLight.ScaleX(X: Single);
begin
  ControlLight.Scale.X := X;
end;

procedure TFLight.ScaleY(Y: Single);
begin
  ControlLight.Scale.Y := Y;
end;

procedure TFLight.ScaleZ(Z: Single);
begin
  ControlLight.Scale.Z := Z;
end;

procedure TFLight.SpotCutOff(FValue: Single);
begin
  ControlLight.SpotCutOff := FValue;
end;

procedure TFLight.SpotExponent(FValue: Single);
begin
  ControlLight.SpotExponent := FValue;
end;

procedure TFLight.VisibleContextMenu(FValue: Boolean);
begin
  ControlLight.VisibleContextMenu := FValue;
end;

procedure TFLight.Opacity(FOpacity: Single);
begin
  ControlLight.Opacity := FOpacity;
end;

procedure TFLight.Enabled(FEnabled: Boolean);
begin
  ControlLight.Enabled := FEnabled;
end;

procedure TFLight.Visible(FVisible: Boolean);
begin
  ControlLight.Visible := FVisible;
end;

procedure TFLight.HitTest(FEnabled: Boolean);
begin
  ControlLight.HitTest := FEnabled;
end;

function TFLight.IsVisible: Boolean;
begin
  Result := ControlLight.Visible;
end;

function TFLight.GetTag: Integer;
begin
  Result := ControlLight.Tag;
end;

function TFLight.GetHeight: Single;
begin
  Result := ControlLight.Height;
end;

function TFLight.GetWidth: Single;
begin
  Result := ControlLight.Width;
end;

function TFLight.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlLight);
end;

function TFLight.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlLight);
end;

// =============================================================================
// FDummy
// =============================================================================
procedure TFDummy.FCreate(FParent: TFmxObject);
begin
  ControlDummy := TDummy.Create(nil);
  ControlDummy.Parent := TFmxObject(FParent);
end;

procedure TFDummy.Cursor(FCursor: TCursor);
begin
  ControlDummy.Cursor := TCursor(FCursor);
end;

procedure TFDummy.Height(FHeight: Single);
begin
  ControlDummy.Height := FHeight;
end;

procedure TFDummy.Width(FWidth: Single);
begin
  ControlDummy.Width := FWidth;
end;

procedure TFDummy.BringToFront;
begin
  ControlDummy.BringToFront;
end;

procedure TFDummy.SendToBack;
begin
  ControlDummy.SendToBack;
end;

procedure TFDummy.SetTag(FTag: Integer);
begin
  ControlDummy.Tag := FTag;
end;

procedure TFDummy.Depth(FDepth: Single);
begin
  ControlDummy.Depth := FDepth;
end;

procedure TFDummy.Position(X, Y, Z: Single);
begin
  ControlDummy.Position.X := X;
  ControlDummy.Position.Y := Y;
  ControlDummy.Position.Z := Z;
end;

procedure TFDummy.PosX(X: Single);
begin
  ControlDummy.Position.X := X;
end;

procedure TFDummy.PosY(Y: Single);
begin
  ControlDummy.Position.Y := Y;
end;

procedure TFDummy.PosZ(Z: Single);
begin
  ControlDummy.Position.Z := Z;
end;

procedure TFDummy.Projection(FProjection: TProjection);
begin
  ControlDummy.Projection := TProjection(FProjection);
end;

procedure TFDummy.RotationAngle(X, Y, Z: Single);
begin
  ControlDummy.RotationAngle.X := X;
  ControlDummy.RotationAngle.Y := Y;
  ControlDummy.RotationAngle.Z := Z;
end;

procedure TFDummy.RotationAngleX(X: Single);
begin
  ControlDummy.RotationAngle.X := X;
end;

procedure TFDummy.RotationAngleY(Y: Single);
begin
  ControlDummy.RotationAngle.Y := Y;
end;

procedure TFDummy.RotationAngleZ(Z: Single);
begin
  ControlDummy.RotationAngle.Z := Z;
end;

procedure TFDummy.Scale(X, Y, Z: Single);
begin
  ControlDummy.Scale.X := X;
  ControlDummy.Scale.Y := Y;
  ControlDummy.Scale.Z := Z;
end;

procedure TFDummy.ScaleX(X: Single);
begin
  ControlDummy.Scale.X := X;
end;

procedure TFDummy.ScaleY(Y: Single);
begin
  ControlDummy.Scale.Y := Y;
end;

procedure TFDummy.ScaleZ(Z: Single);
begin
  ControlDummy.Scale.Z := Z;
end;

procedure TFDummy.TwoSide(FValue: Boolean);
begin
  ControlDummy.TwoSide := FValue;
end;

procedure TFDummy.VisibleContextMenu(FValue: Boolean);
begin
  ControlDummy.VisibleContextMenu := FValue;
end;

procedure TFDummy.ZWrite(FValue: Boolean);
begin
  ControlDummy.ZWrite := FValue;
end;

procedure TFDummy.Opacity(FOpacity: Single);
begin
  ControlDummy.Opacity := FOpacity;
end;

procedure TFDummy.Visible(FVisible: Boolean);
begin
  ControlDummy.Visible := FVisible;
end;

procedure TFDummy.HitTest(FEnabled: Boolean);
begin
  ControlDummy.HitTest := FEnabled;
end;

function TFDummy.IsVisible: Boolean;
begin
  Result := ControlDummy.Visible;
end;

function TFDummy.GetRotationAngleX: Single;
begin
  Result := ControlDummy.RotationAngle.X;
end;

function TFDummy.GetRotationAngleY: Single;
begin
  Result := ControlDummy.RotationAngle.Y;
end;

function TFDummy.GetRotationAngleZ: Single;
begin
  Result := ControlDummy.RotationAngle.Z;
end;

function TFDummy.GetTag: Integer;
begin
  Result := ControlDummy.Tag;
end;

function TFDummy.GetHeight: Single;
begin
  Result := ControlDummy.Height;
end;

function TFDummy.GetWidth: Single;
begin
  Result := ControlDummy.Width;
end;

function TFDummy.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlDummy);
end;

function TFDummy.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlDummy);
end;

// =============================================================================
// FProxyObject
// =============================================================================
procedure TFProxyObject.FCreate(FParent: TFmxObject);
begin
  ControlProxyObject := TProxyObject.Create(nil);
  ControlProxyObject.Parent := TFmxObject(FParent);
end;

procedure TFProxyObject.Cursor(FCursor: TCursor);
begin
  ControlProxyObject.Cursor := TCursor(FCursor);
end;

procedure TFProxyObject.Height(FHeight: Single);
begin
  ControlProxyObject.Height := FHeight;
end;

procedure TFProxyObject.Width(FWidth: Single);
begin
  ControlProxyObject.Width := FWidth;
end;

procedure TFProxyObject.BringToFront;
begin
  ControlProxyObject.BringToFront;
end;

procedure TFProxyObject.SendToBack;
begin
  ControlProxyObject.SendToBack;
end;

procedure TFProxyObject.SetTag(FTag: Integer);
begin
  ControlProxyObject.Tag := FTag;
end;

procedure TFProxyObject.Depth(FDepth: Single);
begin
  ControlProxyObject.Depth := FDepth;
end;

procedure TFProxyObject.Position(X, Y, Z: Single);
begin
  ControlProxyObject.Position.X := X;
  ControlProxyObject.Position.Y := Y;
  ControlProxyObject.Position.Z := Z;
end;

procedure TFProxyObject.PosX(X: Single);
begin
  ControlProxyObject.Position.X := X;
end;

procedure TFProxyObject.PosY(Y: Single);
begin
  ControlProxyObject.Position.Y := Y;
end;

procedure TFProxyObject.PosZ(Z: Single);
begin
  ControlProxyObject.Position.Z := Z;
end;

procedure TFProxyObject.Projection(FProjection: TProjection);
begin
  ControlProxyObject.Projection := TProjection(FProjection);
end;

procedure TFProxyObject.RotationAngle(X, Y, Z: Single);
begin
  ControlProxyObject.RotationAngle.X := X;
  ControlProxyObject.RotationAngle.Y := Y;
  ControlProxyObject.RotationAngle.Z := Z;
end;

procedure TFProxyObject.RotationAngleX(X: Single);
begin
  ControlProxyObject.RotationAngle.X := X;
end;

procedure TFProxyObject.RotationAngleY(Y: Single);
begin
  ControlProxyObject.RotationAngle.Y := Y;
end;

procedure TFProxyObject.RotationAngleZ(Z: Single);
begin
  ControlProxyObject.RotationAngle.Z := Z;
end;

procedure TFProxyObject.Scale(X, Y, Z: Single);
begin
  ControlProxyObject.Scale.X := X;
  ControlProxyObject.Scale.Y := Y;
  ControlProxyObject.Scale.Z := Z;
end;

procedure TFProxyObject.ScaleX(X: Single);
begin
  ControlProxyObject.Scale.X := X;
end;

procedure TFProxyObject.ScaleY(Y: Single);
begin
  ControlProxyObject.Scale.Y := Y;
end;

procedure TFProxyObject.ScaleZ(Z: Single);
begin
  ControlProxyObject.Scale.Z := Z;
end;

procedure TFProxyObject.TwoSide(FValue: Boolean);
begin
  ControlProxyObject.TwoSide := FValue;
end;

procedure TFProxyObject.VisibleContextMenu(FValue: Boolean);
begin
  ControlProxyObject.VisibleContextMenu := FValue;
end;

procedure TFProxyObject.ZWrite(FValue: Boolean);
begin
  ControlProxyObject.ZWrite := FValue;
end;

procedure TFProxyObject.Opacity(FOpacity: Single);
begin
  ControlProxyObject.Opacity := FOpacity;
end;

procedure TFProxyObject.Visible(FVisible: Boolean);
begin
  ControlProxyObject.Visible := FVisible;
end;

procedure TFProxyObject.HitTest(FEnabled: Boolean);
begin
  ControlProxyObject.HitTest := FEnabled;
end;

function TFProxyObject.IsVisible: Boolean;
begin
  Result := ControlProxyObject.Visible;
end;

function TFProxyObject.GetTag: Integer;
begin
  Result := ControlProxyObject.Tag;
end;

function TFProxyObject.GetHeight: Single;
begin
  Result := ControlProxyObject.Height;
end;

function TFProxyObject.GetWidth: Single;
begin
  Result := ControlProxyObject.Width;
end;

function TFProxyObject.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlProxyObject);
end;

function TFProxyObject.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlProxyObject);
end;

// =============================================================================
// FProxyObject
// =============================================================================
procedure TFPlane.FCreate(FParent: TFmxObject);
begin
  ControlPlane := TPlane.Create(nil);
  ControlPlane.Parent := TFmxObject(FParent);
end;

procedure TFPlane.Cursor(FCursor: TCursor);
begin
  ControlPlane.Cursor := TCursor(FCursor);
end;

procedure TFPlane.Height(FHeight: Single);
begin
  ControlPlane.Height := FHeight;
end;

procedure TFPlane.Width(FWidth: Single);
begin
  ControlPlane.Width := FWidth;
end;

procedure TFPlane.BringToFront;
begin
  ControlPlane.BringToFront;
end;

procedure TFPlane.SendToBack;
begin
  ControlPlane.SendToBack;
end;

procedure TFPlane.SetTag(FTag: Integer);
begin
  ControlPlane.Tag := FTag;
end;

procedure TFPlane.Depth(FDepth: Single);
begin
  ControlPlane.Depth := FDepth;
end;

procedure TFPlane.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlPlane.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFPlane.WrapMode(FWrapMode: TMeshWrapMode);
begin
  ControlPlane.WrapMode := TMeshWrapMode(FWrapMode);
end;

procedure TFPlane.Position(X, Y, Z: Single);
begin
  ControlPlane.Position.X := X;
  ControlPlane.Position.Y := Y;
  ControlPlane.Position.Z := Z;
end;

procedure TFPlane.PosX(X: Single);
begin
  ControlPlane.Position.X := X;
end;

procedure TFPlane.PosY(Y: Single);
begin
  ControlPlane.Position.Y := Y;
end;

procedure TFPlane.PosZ(Z: Single);
begin
  ControlPlane.Position.Z := Z;
end;

procedure TFPlane.Projection(FProjection: TProjection);
begin
  ControlPlane.Projection := TProjection(FProjection);
end;

procedure TFPlane.RotationAngle(X, Y, Z: Single);
begin
  ControlPlane.RotationAngle.X := X;
  ControlPlane.RotationAngle.Y := Y;
  ControlPlane.RotationAngle.Z := Z;
end;

procedure TFPlane.RotationAngleX(X: Single);
begin
  ControlPlane.RotationAngle.X := X;
end;

procedure TFPlane.RotationAngleY(Y: Single);
begin
  ControlPlane.RotationAngle.Y := Y;
end;

procedure TFPlane.RotationAngleZ(Z: Single);
begin
  ControlPlane.RotationAngle.Z := Z;
end;

procedure TFPlane.Scale(X, Y, Z: Single);
begin
  ControlPlane.Scale.X := X;
  ControlPlane.Scale.Y := Y;
  ControlPlane.Scale.Z := Z;
end;

procedure TFPlane.ScaleX(X: Single);
begin
  ControlPlane.Scale.X := X;
end;

procedure TFPlane.ScaleY(Y: Single);
begin
  ControlPlane.Scale.Y := Y;
end;

procedure TFPlane.ScaleZ(Z: Single);
begin
  ControlPlane.Scale.Z := Z;
end;

procedure TFPlane.SubdivisionsHeight(FValue: Integer);
begin
  ControlPlane.SubdivisionsHeight := FValue;
end;

procedure TFPlane.SubdivisionsWidth(FValue: Integer);
begin
  ControlPlane.SubdivisionsWidth := FValue;
end;

procedure TFPlane.TwoSide(FValue: Boolean);
begin
  ControlPlane.TwoSide := FValue;
end;

procedure TFPlane.VisibleContextMenu(FValue: Boolean);
begin
  ControlPlane.VisibleContextMenu := FValue;
end;

procedure TFPlane.ZWrite(FValue: Boolean);
begin
  ControlPlane.ZWrite := FValue;
end;

procedure TFPlane.Opacity(FOpacity: Single);
begin
  ControlPlane.Opacity := FOpacity;
end;

procedure TFPlane.Visible(FVisible: Boolean);
begin
  ControlPlane.Visible := FVisible;
end;

procedure TFPlane.HitTest(FEnabled: Boolean);
begin
  ControlPlane.HitTest := FEnabled;
end;

function TFPlane.IsVisible: Boolean;
begin
  Result := ControlPlane.Visible;
end;

function TFPlane.GetTag: Integer;
begin
  Result := ControlPlane.Tag;
end;

function TFPlane.GetHeight: Single;
begin
  Result := ControlPlane.Height;
end;

function TFPlane.GetWidth: Single;
begin
  Result := ControlPlane.Width;
end;

function TFPlane.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlPlane);
end;

function TFPlane.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlPlane);
end;

// =============================================================================
// FDisk
// =============================================================================
procedure TFDisk.FCreate(FParent: TFmxObject);
begin
  ControlDisk := TDisk.Create(nil);
  ControlDisk.Parent := TFmxObject(FParent);
end;

procedure TFDisk.Cursor(FCursor: TCursor);
begin
  ControlDisk.Cursor := TCursor(FCursor);
end;

procedure TFDisk.Height(FHeight: Single);
begin
  ControlDisk.Height := FHeight;
end;

procedure TFDisk.Width(FWidth: Single);
begin
  ControlDisk.Width := FWidth;
end;

procedure TFDisk.BringToFront;
begin
  ControlDisk.BringToFront;
end;

procedure TFDisk.SendToBack;
begin
  ControlDisk.SendToBack;
end;

procedure TFDisk.SetTag(FTag: Integer);
begin
  ControlDisk.Tag := FTag;
end;

procedure TFDisk.Depth(FDepth: Single);
begin
  ControlDisk.Depth := FDepth;
end;

procedure TFDisk.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlDisk.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFDisk.Position(X, Y, Z: Single);
begin
  ControlDisk.Position.X := X;
  ControlDisk.Position.Y := Y;
  ControlDisk.Position.Z := Z;
end;

procedure TFDisk.PosX(X: Single);
begin
  ControlDisk.Position.X := X;
end;

procedure TFDisk.PosY(Y: Single);
begin
  ControlDisk.Position.Y := Y;
end;

procedure TFDisk.PosZ(Z: Single);
begin
  ControlDisk.Position.Z := Z;
end;

procedure TFDisk.Projection(FProjection: TProjection);
begin
  ControlDisk.Projection := TProjection(FProjection);
end;

procedure TFDisk.RotationAngle(X, Y, Z: Single);
begin
  ControlDisk.RotationAngle.X := X;
  ControlDisk.RotationAngle.Y := Y;
  ControlDisk.RotationAngle.Z := Z;
end;

procedure TFDisk.RotationAngleX(X: Single);
begin
  ControlDisk.RotationAngle.X := X;
end;

procedure TFDisk.RotationAngleY(Y: Single);
begin
  ControlDisk.RotationAngle.Y := Y;
end;

procedure TFDisk.RotationAngleZ(Z: Single);
begin
  ControlDisk.RotationAngle.Z := Z;
end;

procedure TFDisk.Scale(X, Y, Z: Single);
begin
  ControlDisk.Scale.X := X;
  ControlDisk.Scale.Y := Y;
  ControlDisk.Scale.Z := Z;
end;

procedure TFDisk.ScaleX(X: Single);
begin
  ControlDisk.Scale.X := X;
end;

procedure TFDisk.ScaleY(Y: Single);
begin
  ControlDisk.Scale.Y := Y;
end;

procedure TFDisk.ScaleZ(Z: Single);
begin
  ControlDisk.Scale.Z := Z;
end;

procedure TFDisk.SubdivisionsAxes(FValue: Integer);
begin
  ControlDisk.SubdivisionsAxes := FValue;
end;

procedure TFDisk.SubdivisionsCap(FValue: Integer);
begin
  ControlDisk.SubdivisionsCap := FValue;
end;

procedure TFDisk.TwoSide(FValue: Boolean);
begin
  ControlDisk.TwoSide := FValue;
end;

procedure TFDisk.VisibleContextMenu(FValue: Boolean);
begin
  ControlDisk.VisibleContextMenu := FValue;
end;

procedure TFDisk.ZWrite(FValue: Boolean);
begin
  ControlDisk.ZWrite := FValue;
end;

procedure TFDisk.Opacity(FOpacity: Single);
begin
  ControlDisk.Opacity := FOpacity;
end;

procedure TFDisk.Visible(FVisible: Boolean);
begin
  ControlDisk.Visible := FVisible;
end;

procedure TFDisk.HitTest(FEnabled: Boolean);
begin
  ControlDisk.HitTest := FEnabled;
end;

function TFDisk.IsVisible: Boolean;
begin
  Result := ControlDisk.Visible;
end;

function TFDisk.GetTag: Integer;
begin
  Result := ControlDisk.Tag;
end;

function TFDisk.GetHeight: Single;
begin
  Result := ControlDisk.Height;
end;

function TFDisk.GetWidth: Single;
begin
  Result := ControlDisk.Width;
end;

function TFDisk.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlDisk);
end;

function TFDisk.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlDisk);
end;

// =============================================================================
// FCube
// =============================================================================
procedure TFCube.FCreate(FParent: TFmxObject);
begin
  ControlCube := TCube.Create(nil);
  ControlCube.Parent := TFmxObject(FParent);
end;

procedure TFCube.Cursor(FCursor: TCursor);
begin
  ControlCube.Cursor := TCursor(FCursor);
end;

procedure TFCube.Height(FHeight: Single);
begin
  ControlCube.Height := FHeight;
end;

procedure TFCube.Width(FWidth: Single);
begin
  ControlCube.Width := FWidth;
end;

procedure TFCube.BringToFront;
begin
  ControlCube.BringToFront;
end;

procedure TFCube.SendToBack;
begin
  ControlCube.SendToBack;
end;

procedure TFCube.SetTag(FTag: Integer);
begin
  ControlCube.Tag := FTag;
end;

procedure TFCube.Depth(FDepth: Single);
begin
  ControlCube.Depth := FDepth;
end;

procedure TFCube.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlCube.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFCube.Position(X, Y, Z: Single);
begin
  ControlCube.Position.X := X;
  ControlCube.Position.Y := Y;
  ControlCube.Position.Z := Z;
end;

procedure TFCube.PosX(X: Single);
begin
  ControlCube.Position.X := X;
end;

procedure TFCube.PosY(Y: Single);
begin
  ControlCube.Position.Y := Y;
end;

procedure TFCube.PosZ(Z: Single);
begin
  ControlCube.Position.Z := Z;
end;

procedure TFCube.Projection(FProjection: TProjection);
begin
  ControlCube.Projection := TProjection(FProjection);
end;

procedure TFCube.RotationAngle(X, Y, Z: Single);
begin
  ControlCube.RotationAngle.X := X;
  ControlCube.RotationAngle.Y := Y;
  ControlCube.RotationAngle.Z := Z;
end;

procedure TFCube.RotationAngleX(X: Single);
begin
  ControlCube.RotationAngle.X := X;
end;

procedure TFCube.RotationAngleY(Y: Single);
begin
  ControlCube.RotationAngle.Y := Y;
end;

procedure TFCube.RotationAngleZ(Z: Single);
begin
  ControlCube.RotationAngle.Z := Z;
end;

procedure TFCube.Scale(X, Y, Z: Single);
begin
  ControlCube.Scale.X := X;
  ControlCube.Scale.Y := Y;
  ControlCube.Scale.Z := Z;
end;

procedure TFCube.ScaleX(X: Single);
begin
  ControlCube.Scale.X := X;
end;

procedure TFCube.ScaleY(Y: Single);
begin
  ControlCube.Scale.Y := Y;
end;

procedure TFCube.ScaleZ(Z: Single);
begin
  ControlCube.Scale.Z := Z;
end;

procedure TFCube.SubdivisionsDepth(FValue: Integer);
begin
  ControlCube.SubdivisionsDepth := FValue;
end;

procedure TFCube.SubdivisionsHeight(FValue: Integer);
begin
  ControlCube.SubdivisionsHeight := FValue;
end;

procedure TFCube.SubdivisionsWidth(FValue: Integer);
begin
  ControlCube.SubdivisionsWidth := FValue;
end;

procedure TFCube.TwoSide(FValue: Boolean);
begin
  ControlCube.TwoSide := FValue;
end;

procedure TFCube.VisibleContextMenu(FValue: Boolean);
begin
  ControlCube.VisibleContextMenu := FValue;
end;

procedure TFCube.ZWrite(FValue: Boolean);
begin
  ControlCube.ZWrite := FValue;
end;

procedure TFCube.Opacity(FOpacity: Single);
begin
  ControlCube.Opacity := FOpacity;
end;

procedure TFCube.Visible(FVisible: Boolean);
begin
  ControlCube.Visible := FVisible;
end;

procedure TFCube.HitTest(FEnabled: Boolean);
begin
  ControlCube.HitTest := FEnabled;
end;

function TFCube.IsVisible: Boolean;
begin
  Result := ControlCube.Visible;
end;

function TFCube.GetTag: Integer;
begin
  Result := ControlCube.Tag;
end;

function TFCube.GetHeight: Single;
begin
  Result := ControlCube.Height;
end;

function TFCube.GetWidth: Single;
begin
  Result := ControlCube.Width;
end;

function TFCube.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlCube);
end;

function TFCube.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlCube);
end;

// =============================================================================
// FSphere
// =============================================================================
procedure TFSphere.FCreate(FParent: TFmxObject);
begin
  ControlSphere := TSphere.Create(nil);
  ControlSphere.Parent := TFmxObject(FParent);
end;

procedure TFSphere.Cursor(FCursor: TCursor);
begin
  ControlSphere.Cursor := TCursor(FCursor);
end;

procedure TFSphere.Height(FHeight: Single);
begin
  ControlSphere.Height := FHeight;
end;

procedure TFSphere.Width(FWidth: Single);
begin
  ControlSphere.Width := FWidth;
end;

procedure TFSphere.BringToFront;
begin
  ControlSphere.BringToFront;
end;

procedure TFSphere.SendToBack;
begin
  ControlSphere.SendToBack;
end;

procedure TFSphere.SetTag(FTag: Integer);
begin
  ControlSphere.Tag := FTag;
end;

procedure TFSphere.Depth(FDepth: Single);
begin
  ControlSphere.Depth := FDepth;
end;

procedure TFSphere.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlSphere.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFSphere.Position(X, Y, Z: Single);
begin
  ControlSphere.Position.X := X;
  ControlSphere.Position.Y := Y;
  ControlSphere.Position.Z := Z;
end;

procedure TFSphere.PosX(X: Single);
begin
  ControlSphere.Position.X := X;
end;

procedure TFSphere.PosY(Y: Single);
begin
  ControlSphere.Position.Y := Y;
end;

procedure TFSphere.PosZ(Z: Single);
begin
  ControlSphere.Position.Z := Z;
end;

procedure TFSphere.Projection(FProjection: TProjection);
begin
  ControlSphere.Projection := TProjection(FProjection);
end;

procedure TFSphere.RotationAngle(X, Y, Z: Single);
begin
  ControlSphere.RotationAngle.X := X;
  ControlSphere.RotationAngle.Y := Y;
  ControlSphere.RotationAngle.Z := Z;
end;

procedure TFSphere.RotationAngleX(X: Single);
begin
  ControlSphere.RotationAngle.X := X;
end;

procedure TFSphere.RotationAngleY(Y: Single);
begin
  ControlSphere.RotationAngle.Y := Y;
end;

procedure TFSphere.RotationAngleZ(Z: Single);
begin
  ControlSphere.RotationAngle.Z := Z;
end;

procedure TFSphere.Scale(X, Y, Z: Single);
begin
  ControlSphere.Scale.X := X;
  ControlSphere.Scale.Y := Y;
  ControlSphere.Scale.Z := Z;
end;

procedure TFSphere.ScaleX(X: Single);
begin
  ControlSphere.Scale.X := X;
end;

procedure TFSphere.ScaleY(Y: Single);
begin
  ControlSphere.Scale.Y := Y;
end;

procedure TFSphere.ScaleZ(Z: Single);
begin
  ControlSphere.Scale.Z := Z;
end;

procedure TFSphere.SubdivisionsAxes(FValue: Integer);
begin
  ControlSphere.SubdivisionsAxes := FValue;
end;

procedure TFSphere.SubdivisionsHeight(FValue: Integer);
begin
  ControlSphere.SubdivisionsHeight := FValue;
end;

procedure TFSphere.TwoSide(FValue: Boolean);
begin
  ControlSphere.TwoSide := FValue;
end;

procedure TFSphere.VisibleContextMenu(FValue: Boolean);
begin
  ControlSphere.VisibleContextMenu := FValue;
end;

procedure TFSphere.ZWrite(FValue: Boolean);
begin
  ControlSphere.ZWrite := FValue;
end;

procedure TFSphere.Opacity(FOpacity: Single);
begin
  ControlSphere.Opacity := FOpacity;
end;

procedure TFSphere.Visible(FVisible: Boolean);
begin
  ControlSphere.Visible := FVisible;
end;

procedure TFSphere.HitTest(FEnabled: Boolean);
begin
  ControlSphere.HitTest := FEnabled;
end;

function TFSphere.IsVisible: Boolean;
begin
  Result := ControlSphere.Visible;
end;

function TFSphere.GetTag: Integer;
begin
  Result := ControlSphere.Tag;
end;

function TFSphere.GetHeight: Single;
begin
  Result := ControlSphere.Height;
end;

function TFSphere.GetWidth: Single;
begin
  Result := ControlSphere.Width;
end;

function TFSphere.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlSphere);
end;

function TFSphere.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlSphere);
end;

// =============================================================================
// FCylinder
// =============================================================================
procedure TFCylinder.FCreate(FParent: TFmxObject);
begin
  ControlCylinder := TCylinder.Create(nil);
  ControlCylinder.Parent := TFmxObject(FParent);
end;

procedure TFCylinder.Cursor(FCursor: TCursor);
begin
  ControlCylinder.Cursor := TCursor(FCursor);
end;

procedure TFCylinder.Height(FHeight: Single);
begin
  ControlCylinder.Height := FHeight;
end;

procedure TFCylinder.Width(FWidth: Single);
begin
  ControlCylinder.Width := FWidth;
end;

procedure TFCylinder.BringToFront;
begin
  ControlCylinder.BringToFront;
end;

procedure TFCylinder.SendToBack;
begin
  ControlCylinder.SendToBack;
end;

procedure TFCylinder.SetTag(FTag: Integer);
begin
  ControlCylinder.Tag := FTag;
end;

procedure TFCylinder.Depth(FDepth: Single);
begin
  ControlCylinder.Depth := FDepth;
end;

procedure TFCylinder.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlCylinder.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFCylinder.Position(X, Y, Z: Single);
begin
  ControlCylinder.Position.X := X;
  ControlCylinder.Position.Y := Y;
  ControlCylinder.Position.Z := Z;
end;

procedure TFCylinder.PosX(X: Single);
begin
  ControlCylinder.Position.X := X;
end;

procedure TFCylinder.PosY(Y: Single);
begin
  ControlCylinder.Position.Y := Y;
end;

procedure TFCylinder.PosZ(Z: Single);
begin
  ControlCylinder.Position.Z := Z;
end;

procedure TFCylinder.Projection(FProjection: TProjection);
begin
  ControlCylinder.Projection := TProjection(FProjection);
end;

procedure TFCylinder.RotationAngle(X, Y, Z: Single);
begin
  ControlCylinder.RotationAngle.X := X;
  ControlCylinder.RotationAngle.Y := Y;
  ControlCylinder.RotationAngle.Z := Z;
end;

procedure TFCylinder.RotationAngleX(X: Single);
begin
  ControlCylinder.RotationAngle.X := X;
end;

procedure TFCylinder.RotationAngleY(Y: Single);
begin
  ControlCylinder.RotationAngle.Y := Y;
end;

procedure TFCylinder.RotationAngleZ(Z: Single);
begin
  ControlCylinder.RotationAngle.Z := Z;
end;

procedure TFCylinder.Scale(X, Y, Z: Single);
begin
  ControlCylinder.Scale.X := X;
  ControlCylinder.Scale.Y := Y;
  ControlCylinder.Scale.Z := Z;
end;

procedure TFCylinder.ScaleX(X: Single);
begin
  ControlCylinder.Scale.X := X;
end;

procedure TFCylinder.ScaleY(Y: Single);
begin
  ControlCylinder.Scale.Y := Y;
end;

procedure TFCylinder.ScaleZ(Z: Single);
begin
  ControlCylinder.Scale.Z := Z;
end;

procedure TFCylinder.SubdivisionsAxes(FValue: Integer);
begin
  ControlCylinder.SubdivisionsAxes := FValue;
end;

procedure TFCylinder.SubdivisionsCap(FValue: Integer);
begin
  ControlCylinder.SubdivisionsCap := FValue;
end;

procedure TFCylinder.SubdivisionsHeight(FValue: Integer);
begin
  ControlCylinder.SubdivisionsHeight := FValue;
end;

procedure TFCylinder.TwoSide(FValue: Boolean);
begin
  ControlCylinder.TwoSide := FValue;
end;

procedure TFCylinder.VisibleContextMenu(FValue: Boolean);
begin
  ControlCylinder.VisibleContextMenu := FValue;
end;

procedure TFCylinder.ZWrite(FValue: Boolean);
begin
  ControlCylinder.ZWrite := FValue;
end;

procedure TFCylinder.Opacity(FOpacity: Single);
begin
  ControlCylinder.Opacity := FOpacity;
end;

procedure TFCylinder.Visible(FVisible: Boolean);
begin
  ControlCylinder.Visible := FVisible;
end;

procedure TFCylinder.HitTest(FEnabled: Boolean);
begin
  ControlCylinder.HitTest := FEnabled;
end;

function TFCylinder.IsVisible: Boolean;
begin
  Result := ControlCylinder.Visible;
end;

function TFCylinder.GetTag: Integer;
begin
  Result := ControlCylinder.Tag;
end;

function TFCylinder.GetHeight: Single;
begin
  Result := ControlCylinder.Height;
end;

function TFCylinder.GetWidth: Single;
begin
  Result := ControlCylinder.Width;
end;

function TFCylinder.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlCylinder);
end;

function TFCylinder.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlCylinder);
end;

// =============================================================================
// FRoundCube
// =============================================================================
procedure TFRoundCube.FCreate(FParent: TFmxObject);
begin
  ControlRoundCube := TRoundCube.Create(nil);
  ControlRoundCube.Parent := TFmxObject(FParent);
end;

procedure TFRoundCube.Cursor(FCursor: TCursor);
begin
  ControlRoundCube.Cursor := TCursor(FCursor);
end;

procedure TFRoundCube.Height(FHeight: Single);
begin
  ControlRoundCube.Height := FHeight;
end;

procedure TFRoundCube.Width(FWidth: Single);
begin
  ControlRoundCube.Width := FWidth;
end;

procedure TFRoundCube.BringToFront;
begin
  ControlRoundCube.BringToFront;
end;

procedure TFRoundCube.SendToBack;
begin
  ControlRoundCube.SendToBack;
end;

procedure TFRoundCube.SetTag(FTag: Integer);
begin
  ControlRoundCube.Tag := FTag;
end;

procedure TFRoundCube.Depth(FDepth: Single);
begin
  ControlRoundCube.Depth := FDepth;
end;

procedure TFRoundCube.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlRoundCube.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFRoundCube.Position(X, Y, Z: Single);
begin
  ControlRoundCube.Position.X := X;
  ControlRoundCube.Position.Y := Y;
  ControlRoundCube.Position.Z := Z;
end;

procedure TFRoundCube.PosX(X: Single);
begin
  ControlRoundCube.Position.X := X;
end;

procedure TFRoundCube.PosY(Y: Single);
begin
  ControlRoundCube.Position.Y := Y;
end;

procedure TFRoundCube.PosZ(Z: Single);
begin
  ControlRoundCube.Position.Z := Z;
end;

procedure TFRoundCube.Projection(FProjection: TProjection);
begin
  ControlRoundCube.Projection := TProjection(FProjection);
end;

procedure TFRoundCube.RotationAngle(X, Y, Z: Single);
begin
  ControlRoundCube.RotationAngle.X := X;
  ControlRoundCube.RotationAngle.Y := Y;
  ControlRoundCube.RotationAngle.Z := Z;
end;

procedure TFRoundCube.RotationAngleX(X: Single);
begin
  ControlRoundCube.RotationAngle.X := X;
end;

procedure TFRoundCube.RotationAngleY(Y: Single);
begin
  ControlRoundCube.RotationAngle.Y := Y;
end;

procedure TFRoundCube.RotationAngleZ(Z: Single);
begin
  ControlRoundCube.RotationAngle.Z := Z;
end;

procedure TFRoundCube.Scale(X, Y, Z: Single);
begin
  ControlRoundCube.Scale.X := X;
  ControlRoundCube.Scale.Y := Y;
  ControlRoundCube.Scale.Z := Z;
end;

procedure TFRoundCube.ScaleX(X: Single);
begin
  ControlRoundCube.Scale.X := X;
end;

procedure TFRoundCube.ScaleY(Y: Single);
begin
  ControlRoundCube.Scale.Y := Y;
end;

procedure TFRoundCube.ScaleZ(Z: Single);
begin
  ControlRoundCube.Scale.Z := Z;
end;

procedure TFRoundCube.TwoSide(FValue: Boolean);
begin
  ControlRoundCube.TwoSide := FValue;
end;

procedure TFRoundCube.VisibleContextMenu(FValue: Boolean);
begin
  ControlRoundCube.VisibleContextMenu := FValue;
end;

procedure TFRoundCube.ZWrite(FValue: Boolean);
begin
  ControlRoundCube.ZWrite := FValue;
end;

procedure TFRoundCube.Opacity(FOpacity: Single);
begin
  ControlRoundCube.Opacity := FOpacity;
end;

procedure TFRoundCube.Visible(FVisible: Boolean);
begin
  ControlRoundCube.Visible := FVisible;
end;

procedure TFRoundCube.HitTest(FEnabled: Boolean);
begin
  ControlRoundCube.HitTest := FEnabled;
end;

function TFRoundCube.IsVisible: Boolean;
begin
  Result := ControlRoundCube.Visible;
end;

function TFRoundCube.GetTag: Integer;
begin
  Result := ControlRoundCube.Tag;
end;

function TFRoundCube.GetHeight: Single;
begin
  Result := ControlRoundCube.Height;
end;

function TFRoundCube.GetWidth: Single;
begin
  Result := ControlRoundCube.Width;
end;

function TFRoundCube.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlRoundCube);
end;

function TFRoundCube.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlRoundCube);
end;

// =============================================================================
// FCone
// =============================================================================
procedure TFCone.FCreate(FParent: TFmxObject);
begin
  ControlCone := TCone.Create(nil);
  ControlCone.Parent := TFmxObject(FParent);
end;

procedure TFCone.Cursor(FCursor: TCursor);
begin
  ControlCone.Cursor := TCursor(FCursor);
end;

procedure TFCone.Height(FHeight: Single);
begin
  ControlCone.Height := FHeight;
end;

procedure TFCone.Width(FWidth: Single);
begin
  ControlCone.Width := FWidth;
end;

procedure TFCone.BringToFront;
begin
  ControlCone.BringToFront;
end;

procedure TFCone.SendToBack;
begin
  ControlCone.SendToBack;
end;

procedure TFCone.SetTag(FTag: Integer);
begin
  ControlCone.Tag := FTag;
end;

procedure TFCone.Depth(FDepth: Single);
begin
  ControlCone.Depth := FDepth;
end;

procedure TFCone.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlCone.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFCone.Position(X, Y, Z: Single);
begin
  ControlCone.Position.X := X;
  ControlCone.Position.Y := Y;
  ControlCone.Position.Z := Z;
end;

procedure TFCone.PosX(X: Single);
begin
  ControlCone.Position.X := X;
end;

procedure TFCone.PosY(Y: Single);
begin
  ControlCone.Position.Y := Y;
end;

procedure TFCone.PosZ(Z: Single);
begin
  ControlCone.Position.Z := Z;
end;

procedure TFCone.Projection(FProjection: TProjection);
begin
  ControlCone.Projection := TProjection(FProjection);
end;

procedure TFCone.RotationAngle(X, Y, Z: Single);
begin
  ControlCone.RotationAngle.X := X;
  ControlCone.RotationAngle.Y := Y;
  ControlCone.RotationAngle.Z := Z;
end;

procedure TFCone.RotationAngleX(X: Single);
begin
  ControlCone.RotationAngle.X := X;
end;

procedure TFCone.RotationAngleY(Y: Single);
begin
  ControlCone.RotationAngle.Y := Y;
end;

procedure TFCone.RotationAngleZ(Z: Single);
begin
  ControlCone.RotationAngle.Z := Z;
end;

procedure TFCone.Scale(X, Y, Z: Single);
begin
  ControlCone.Scale.X := X;
  ControlCone.Scale.Y := Y;
  ControlCone.Scale.Z := Z;
end;

procedure TFCone.ScaleX(X: Single);
begin
  ControlCone.Scale.X := X;
end;

procedure TFCone.ScaleY(Y: Single);
begin
  ControlCone.Scale.Y := Y;
end;

procedure TFCone.ScaleZ(Z: Single);
begin
  ControlCone.Scale.Z := Z;
end;

procedure TFCone.SubdivisionsAxes(FValue: Integer);
begin
  ControlCone.SubdivisionsAxes := FValue;
end;

procedure TFCone.SubdivisionsCap(FValue: Integer);
begin
  ControlCone.SubdivisionsCap := FValue;
end;

procedure TFCone.SubdivisionsHeight(FValue: Integer);
begin
  ControlCone.SubdivisionsHeight := FValue;
end;

procedure TFCone.TwoSide(FValue: Boolean);
begin
  ControlCone.TwoSide := FValue;
end;

procedure TFCone.VisibleContextMenu(FValue: Boolean);
begin
  ControlCone.VisibleContextMenu := FValue;
end;

procedure TFCone.ZWrite(FValue: Boolean);
begin
  ControlCone.ZWrite := FValue;
end;

procedure TFCone.Opacity(FOpacity: Single);
begin
  ControlCone.Opacity := FOpacity;
end;

procedure TFCone.Visible(FVisible: Boolean);
begin
  ControlCone.Visible := FVisible;
end;

procedure TFCone.HitTest(FEnabled: Boolean);
begin
  ControlCone.HitTest := FEnabled;
end;

function TFCone.IsVisible: Boolean;
begin
  Result := ControlCone.Visible;
end;

function TFCone.GetTag: Integer;
begin
  Result := ControlCone.Tag;
end;

function TFCone.GetHeight: Single;
begin
  Result := ControlCone.Height;
end;

function TFCone.GetWidth: Single;
begin
  Result := ControlCone.Width;
end;

function TFCone.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlCone);
end;

function TFCone.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlCone);
end;

// =============================================================================
// FGrid3D
// =============================================================================
procedure TFGrid3D.FCreate(FParent: TFmxObject);
begin
  ControlGrid3D := TGrid3D.Create(nil);
  ControlGrid3D.Parent := TFmxObject(FParent);
end;

procedure TFGrid3D.Cursor(FCursor: TCursor);
begin
  ControlGrid3D.Cursor := TCursor(FCursor);
end;

procedure TFGrid3D.Height(FHeight: Single);
begin
  ControlGrid3D.Height := FHeight;
end;

procedure TFGrid3D.Width(FWidth: Single);
begin
  ControlGrid3D.Width := FWidth;
end;

procedure TFGrid3D.BringToFront;
begin
  ControlGrid3D.BringToFront;
end;

procedure TFGrid3D.SendToBack;
begin
  ControlGrid3D.SendToBack;
end;

procedure TFGrid3D.SetTag(FTag: Integer);
begin
  ControlGrid3D.Tag := FTag;
end;

procedure TFGrid3D.Depth(FDepth: Single);
begin
  ControlGrid3D.Depth := FDepth;
end;

procedure TFGrid3D.Frequency(FValue: Single);
begin
  ControlGrid3D.Frequency := FValue;
end;

procedure TFGrid3D.LineColor(FColor: TAlphaColor);
begin
  ControlGrid3D.LineColor := TAlphaColor(FColor);
end;

procedure TFGrid3D.Marks(FValue: Single);
begin
  ControlGrid3D.Marks := FValue;
end;

procedure TFGrid3D.Position(X, Y, Z: Single);
begin
  ControlGrid3D.Position.X := X;
  ControlGrid3D.Position.Y := Y;
  ControlGrid3D.Position.Z := Z;
end;

procedure TFGrid3D.PosX(X: Single);
begin
  ControlGrid3D.Position.X := X;
end;

procedure TFGrid3D.PosY(Y: Single);
begin
  ControlGrid3D.Position.Y := Y;
end;

procedure TFGrid3D.PosZ(Z: Single);
begin
  ControlGrid3D.Position.Z := Z;
end;

procedure TFGrid3D.Projection(FProjection: TProjection);
begin
  ControlGrid3D.Projection := TProjection(FProjection);
end;

procedure TFGrid3D.RotationAngle(X, Y, Z: Single);
begin
  ControlGrid3D.RotationAngle.X := X;
  ControlGrid3D.RotationAngle.Y := Y;
  ControlGrid3D.RotationAngle.Z := Z;
end;

procedure TFGrid3D.RotationAngleX(X: Single);
begin
  ControlGrid3D.RotationAngle.X := X;
end;

procedure TFGrid3D.RotationAngleY(Y: Single);
begin
  ControlGrid3D.RotationAngle.Y := Y;
end;

procedure TFGrid3D.RotationAngleZ(Z: Single);
begin
  ControlGrid3D.RotationAngle.Z := Z;
end;

procedure TFGrid3D.Scale(X, Y, Z: Single);
begin
  ControlGrid3D.Scale.X := X;
  ControlGrid3D.Scale.Y := Y;
  ControlGrid3D.Scale.Z := Z;
end;

procedure TFGrid3D.ScaleX(X: Single);
begin
  ControlGrid3D.Scale.X := X;
end;

procedure TFGrid3D.ScaleY(Y: Single);
begin
  ControlGrid3D.Scale.Y := Y;
end;

procedure TFGrid3D.ScaleZ(Z: Single);
begin
  ControlGrid3D.Scale.Z := Z;
end;

procedure TFGrid3D.TwoSide(FValue: Boolean);
begin
  ControlGrid3D.TwoSide := FValue;
end;

procedure TFGrid3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlGrid3D.VisibleContextMenu := FValue;
end;

procedure TFGrid3D.ZWrite(FValue: Boolean);
begin
  ControlGrid3D.ZWrite := FValue;
end;

procedure TFGrid3D.Opacity(FOpacity: Single);
begin
  ControlGrid3D.Opacity := FOpacity;
end;

procedure TFGrid3D.Visible(FVisible: Boolean);
begin
  ControlGrid3D.Visible := FVisible;
end;

procedure TFGrid3D.HitTest(FEnabled: Boolean);
begin
  ControlGrid3D.HitTest := FEnabled;
end;

function TFGrid3D.IsVisible: Boolean;
begin
  Result := ControlGrid3D.Visible;
end;

function TFGrid3D.GetTag: Integer;
begin
  Result := ControlGrid3D.Tag;
end;

function TFGrid3D.GetHeight: Single;
begin
  Result := ControlGrid3D.Height;
end;

function TFGrid3D.GetWidth: Single;
begin
  Result := ControlGrid3D.Width;
end;

function TFGrid3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlGrid3D);
end;

function TFGrid3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlGrid3D);
end;

// =============================================================================
// FStrokeCube
// =============================================================================
procedure TFStrokeCube.FCreate(FParent: TFmxObject);
begin
  ControlStrokeCube := TStrokeCube.Create(nil);
  ControlStrokeCube.Parent := TFmxObject(FParent);
end;

procedure TFStrokeCube.Cursor(FCursor: TCursor);
begin
  ControlStrokeCube.Cursor := TCursor(FCursor);
end;

procedure TFStrokeCube.Height(FHeight: Single);
begin
  ControlStrokeCube.Height := FHeight;
end;

procedure TFStrokeCube.Width(FWidth: Single);
begin
  ControlStrokeCube.Width := FWidth;
end;

procedure TFStrokeCube.BringToFront;
begin
  ControlStrokeCube.BringToFront;
end;

procedure TFStrokeCube.SendToBack;
begin
  ControlStrokeCube.SendToBack;
end;

procedure TFStrokeCube.SetTag(FTag: Integer);
begin
  ControlStrokeCube.Tag := FTag;
end;

procedure TFStrokeCube.Depth(FDepth: Single);
begin
  ControlStrokeCube.Depth := FDepth;
end;

procedure TFStrokeCube.Color(FColor: TAlphaColor);
begin
  ControlStrokeCube.Color := TAlphaColor(FColor);
end;

procedure TFStrokeCube.Position(X, Y, Z: Single);
begin
  ControlStrokeCube.Position.X := X;
  ControlStrokeCube.Position.Y := Y;
  ControlStrokeCube.Position.Z := Z;
end;

procedure TFStrokeCube.PosX(X: Single);
begin
  ControlStrokeCube.Position.X := X;
end;

procedure TFStrokeCube.PosY(Y: Single);
begin
  ControlStrokeCube.Position.Y := Y;
end;

procedure TFStrokeCube.PosZ(Z: Single);
begin
  ControlStrokeCube.Position.Z := Z;
end;

procedure TFStrokeCube.Projection(FProjection: TProjection);
begin
  ControlStrokeCube.Projection := TProjection(FProjection);
end;

procedure TFStrokeCube.RotationAngle(X, Y, Z: Single);
begin
  ControlStrokeCube.RotationAngle.X := X;
  ControlStrokeCube.RotationAngle.Y := Y;
  ControlStrokeCube.RotationAngle.Z := Z;
end;

procedure TFStrokeCube.RotationAngleX(X: Single);
begin
  ControlStrokeCube.RotationAngle.X := X;
end;

procedure TFStrokeCube.RotationAngleY(Y: Single);
begin
  ControlStrokeCube.RotationAngle.Y := Y;
end;

procedure TFStrokeCube.RotationAngleZ(Z: Single);
begin
  ControlStrokeCube.RotationAngle.Z := Z;
end;

procedure TFStrokeCube.Scale(X, Y, Z: Single);
begin
  ControlStrokeCube.Scale.X := X;
  ControlStrokeCube.Scale.Y := Y;
  ControlStrokeCube.Scale.Z := Z;
end;

procedure TFStrokeCube.ScaleX(X: Single);
begin
  ControlStrokeCube.Scale.X := X;
end;

procedure TFStrokeCube.ScaleY(Y: Single);
begin
  ControlStrokeCube.Scale.Y := Y;
end;

procedure TFStrokeCube.ScaleZ(Z: Single);
begin
  ControlStrokeCube.Scale.Z := Z;
end;

procedure TFStrokeCube.TwoSide(FValue: Boolean);
begin
  ControlStrokeCube.TwoSide := FValue;
end;

procedure TFStrokeCube.VisibleContextMenu(FValue: Boolean);
begin
  ControlStrokeCube.VisibleContextMenu := FValue;
end;

procedure TFStrokeCube.ZWrite(FValue: Boolean);
begin
  ControlStrokeCube.ZWrite := FValue;
end;

procedure TFStrokeCube.Opacity(FOpacity: Single);
begin
  ControlStrokeCube.Opacity := FOpacity;
end;

procedure TFStrokeCube.Visible(FVisible: Boolean);
begin
  ControlStrokeCube.Visible := FVisible;
end;

procedure TFStrokeCube.HitTest(FEnabled: Boolean);
begin
  ControlStrokeCube.HitTest := FEnabled;
end;

function TFStrokeCube.IsVisible: Boolean;
begin
  Result := ControlStrokeCube.Visible;
end;

function TFStrokeCube.GetTag: Integer;
begin
  Result := ControlStrokeCube.Tag;
end;

function TFStrokeCube.GetHeight: Single;
begin
  Result := ControlStrokeCube.Height;
end;

function TFStrokeCube.GetWidth: Single;
begin
  Result := ControlStrokeCube.Width;
end;

function TFStrokeCube.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlStrokeCube);
end;

function TFStrokeCube.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlStrokeCube);
end;

// =============================================================================
// FText3D
// =============================================================================
procedure TFText3D.FCreate(FParent: TFmxObject);
begin
  ControlText3D := TText3D.Create(nil);
  ControlText3D.Parent := TFmxObject(FParent);
end;

procedure TFText3D.Cursor(FCursor: TCursor);
begin
  ControlText3D.Cursor := TCursor(FCursor);
end;

procedure TFText3D.Height(FHeight: Single);
begin
  ControlText3D.Height := FHeight;
end;

procedure TFText3D.Width(FWidth: Single);
begin
  ControlText3D.Width := FWidth;
end;

procedure TFText3D.BringToFront;
begin
  ControlText3D.BringToFront;
end;

procedure TFText3D.SendToBack;
begin
  ControlText3D.SendToBack;
end;

procedure TFText3D.SetTag(FTag: Integer);
begin
  ControlText3D.Tag := FTag;
end;

procedure TFText3D.Depth(FDepth: Single);
begin
  ControlText3D.Depth := FDepth;
end;

procedure TFText3D.Flatness(FValue: Single);
begin
  ControlText3D.Flatness := FValue;
end;

procedure TFText3D.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlText3D.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFText3D.MaterialShaftSource(FMaterialSource: TMaterialSource);
begin
  ControlText3D.MaterialShaftSource := TMaterialSource(FMaterialSource);
end;

procedure TFText3D.MaterialBackSource(FMaterialSource: TMaterialSource);
begin
  ControlText3D.MaterialBackSource := TMaterialSource(FMaterialSource);
end;

procedure TFText3D.WrapMode(FWrapMode: TMeshWrapMode);
begin
  ControlText3D.WrapMode := TMeshWrapMode(FWrapMode);
end;

procedure TFText3D.Position(X, Y, Z: Single);
begin
  ControlText3D.Position.X := X;
  ControlText3D.Position.Y := Y;
  ControlText3D.Position.Z := Z;
end;

procedure TFText3D.PosX(X: Single);
begin
  ControlText3D.Position.X := X;
end;

procedure TFText3D.PosY(Y: Single);
begin
  ControlText3D.Position.Y := Y;
end;

procedure TFText3D.PosZ(Z: Single);
begin
  ControlText3D.Position.Z := Z;
end;

procedure TFText3D.Projection(FProjection: TProjection);
begin
  ControlText3D.Projection := TProjection(FProjection);
end;

procedure TFText3D.RotationAngle(X, Y, Z: Single);
begin
  ControlText3D.RotationAngle.X := X;
  ControlText3D.RotationAngle.Y := Y;
  ControlText3D.RotationAngle.Z := Z;
end;

procedure TFText3D.RotationAngleX(X: Single);
begin
  ControlText3D.RotationAngle.X := X;
end;

procedure TFText3D.RotationAngleY(Y: Single);
begin
  ControlText3D.RotationAngle.Y := Y;
end;

procedure TFText3D.RotationAngleZ(Z: Single);
begin
  ControlText3D.RotationAngle.Z := Z;
end;

procedure TFText3D.Scale(X, Y, Z: Single);
begin
  ControlText3D.Scale.X := X;
  ControlText3D.Scale.Y := Y;
  ControlText3D.Scale.Z := Z;
end;

procedure TFText3D.ScaleX(X: Single);
begin
  ControlText3D.Scale.X := X;
end;

procedure TFText3D.ScaleY(Y: Single);
begin
  ControlText3D.Scale.Y := Y;
end;

procedure TFText3D.ScaleZ(Z: Single);
begin
  ControlText3D.Scale.Z := Z;
end;

procedure TFText3D.Sides(FSides: TExtrudedShapeSides);
begin
  ControlText3D.Sides := TExtrudedShapeSides(FSides);
end;

procedure TFText3D.Text(const FText: WideString);
begin
  ControlText3D.Text := string(FText);
end;

procedure TFText3D.Stretch(FValue: Boolean);
begin
  ControlText3D.Stretch := FValue;
end;

procedure TFText3D.FontSetting(const FontName: WideString; FontSize: Single);
begin
  ControlText3D.Font.Family := string(FontName);
  ControlText3D.Font.Size := FontSize;
end;

procedure TFText3D.TextSetting(FWordWrap: Boolean;
  FHorzAlign, FVertAlign: TTextAlign);
begin
  ControlText3D.HorzTextAlign := TTextAlign(FHorzAlign);
  ControlText3D.VertTextAlign := TTextAlign(FVertAlign);
  ControlText3D.WordWrap := FWordWrap;
end;

procedure TFText3D.TwoSide(FValue: Boolean);
begin
  ControlText3D.TwoSide := FValue;
end;

procedure TFText3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlText3D.VisibleContextMenu := FValue;
end;

procedure TFText3D.ZWrite(FValue: Boolean);
begin
  ControlText3D.ZWrite := FValue;
end;

procedure TFText3D.Opacity(FOpacity: Single);
begin
  ControlText3D.Opacity := FOpacity;
end;

procedure TFText3D.Visible(FVisible: Boolean);
begin
  ControlText3D.Visible := FVisible;
end;

procedure TFText3D.HitTest(FEnabled: Boolean);
begin
  ControlText3D.HitTest := FEnabled;
end;

function TFText3D.IsVisible: Boolean;
begin
  Result := ControlText3D.Visible;
end;

function TFText3D.GetTag: Integer;
begin
  Result := ControlText3D.Tag;
end;

function TFText3D.GetHeight: Single;
begin
  Result := ControlText3D.Height;
end;

function TFText3D.GetWidth: Single;
begin
  Result := ControlText3D.Width;
end;

function TFText3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlText3D);
end;

procedure TFText3D.OnClick(Event: TNotifyEvent);
begin
  ControlText3D.OnClick := TNotifyEvent(Event);
end;

procedure TFText3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlText3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFText3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlText3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFText3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlText3D);
end;

// =============================================================================
// FPath3D
// =============================================================================
procedure TFPath3D.FCreate(FParent: TFmxObject);
begin
  ControlPath3D := TPath3D.Create(nil);
  ControlPath3D.Parent := TFmxObject(FParent);
end;

procedure TFPath3D.Cursor(FCursor: TCursor);
begin
  ControlPath3D.Cursor := TCursor(FCursor);
end;

procedure TFPath3D.Height(FHeight: Single);
begin
  ControlPath3D.Height := FHeight;
end;

procedure TFPath3D.Width(FWidth: Single);
begin
  ControlPath3D.Width := FWidth;
end;

procedure TFPath3D.BringToFront;
begin
  ControlPath3D.BringToFront;
end;

procedure TFPath3D.SendToBack;
begin
  ControlPath3D.SendToBack;
end;

procedure TFPath3D.SetTag(FTag: Integer);
begin
  ControlPath3D.Tag := FTag;
end;

procedure TFPath3D.Depth(FDepth: Single);
begin
  ControlPath3D.Depth := FDepth;
end;

procedure TFPath3D.Flatness(FValue: Single);
begin
  ControlPath3D.Flatness := FValue;
end;

procedure TFPath3D.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlPath3D.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFPath3D.MaterialShaftSource(FMaterialSource: TMaterialSource);
begin
  ControlPath3D.MaterialShaftSource := TMaterialSource(FMaterialSource);
end;

procedure TFPath3D.MaterialBackSource(FMaterialSource: TMaterialSource);
begin
  ControlPath3D.MaterialBackSource := TMaterialSource(FMaterialSource);
end;

procedure TFPath3D.DataStr(const DataStr: WideString);
begin
  ControlPath3D.Path.Data := string(DataStr);
end;

procedure TFPath3D.DataWrapMode(FPathWrapMode: TPathWrapMode);
begin
  ControlPath3D.WrapMode := TPathWrapMode(FPathWrapMode);
end;

procedure TFPath3D.DataBoundsMode(FBoundsMode: TBoundsMode);
begin
  ControlPath3D.Path.BoundsMode := TBoundsMode(FBoundsMode);
end;

procedure TFPath3D.DataStyleLookup(FStyle: WideString);
begin
  ControlPath3D.Path.StyleLookUp := string(FStyle);
end;

procedure TFPath3D.Position(X, Y, Z: Single);
begin
  ControlPath3D.Position.X := X;
  ControlPath3D.Position.Y := Y;
  ControlPath3D.Position.Z := Z;
end;

procedure TFPath3D.PosX(X: Single);
begin
  ControlPath3D.Position.X := X;
end;

procedure TFPath3D.PosY(Y: Single);
begin
  ControlPath3D.Position.Y := Y;
end;

procedure TFPath3D.PosZ(Z: Single);
begin
  ControlPath3D.Position.Z := Z;
end;

procedure TFPath3D.Projection(FProjection: TProjection);
begin
  ControlPath3D.Projection := TProjection(FProjection);
end;

procedure TFPath3D.RotationAngle(X, Y, Z: Single);
begin
  ControlPath3D.RotationAngle.X := X;
  ControlPath3D.RotationAngle.Y := Y;
  ControlPath3D.RotationAngle.Z := Z;
end;

procedure TFPath3D.RotationAngleX(X: Single);
begin
  ControlPath3D.RotationAngle.X := X;
end;

procedure TFPath3D.RotationAngleY(Y: Single);
begin
  ControlPath3D.RotationAngle.Y := Y;
end;

procedure TFPath3D.RotationAngleZ(Z: Single);
begin
  ControlPath3D.RotationAngle.Z := Z;
end;

procedure TFPath3D.Scale(X, Y, Z: Single);
begin
  ControlPath3D.Scale.X := X;
  ControlPath3D.Scale.Y := Y;
  ControlPath3D.Scale.Z := Z;
end;

procedure TFPath3D.ScaleX(X: Single);
begin
  ControlPath3D.Scale.X := X;
end;

procedure TFPath3D.ScaleY(Y: Single);
begin
  ControlPath3D.Scale.Y := Y;
end;

procedure TFPath3D.ScaleZ(Z: Single);
begin
  ControlPath3D.Scale.Z := Z;
end;

procedure TFPath3D.Sides(FSides: TExtrudedShapeSides);
begin
  ControlPath3D.Sides := TExtrudedShapeSides(FSides);
end;

procedure TFPath3D.TwoSide(FValue: Boolean);
begin
  ControlPath3D.TwoSide := FValue;
end;

procedure TFPath3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlPath3D.VisibleContextMenu := FValue;
end;

procedure TFPath3D.ZWrite(FValue: Boolean);
begin
  ControlPath3D.ZWrite := FValue;
end;

procedure TFPath3D.Opacity(FOpacity: Single);
begin
  ControlPath3D.Opacity := FOpacity;
end;

procedure TFPath3D.Visible(FVisible: Boolean);
begin
  ControlPath3D.Visible := FVisible;
end;

procedure TFPath3D.HitTest(FEnabled: Boolean);
begin
  ControlPath3D.HitTest := FEnabled;
end;

function TFPath3D.IsVisible: Boolean;
begin
  Result := ControlPath3D.Visible;
end;

function TFPath3D.GetTag: Integer;
begin
  Result := ControlPath3D.Tag;
end;

function TFPath3D.GetHeight: Single;
begin
  Result := ControlPath3D.Height;
end;

function TFPath3D.GetWidth: Single;
begin
  Result := ControlPath3D.Width;
end;

function TFPath3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlPath3D);
end;

procedure TFPath3D.OnClick(Event: TNotifyEvent);
begin
  ControlPath3D.OnClick := TNotifyEvent(Event);
end;

procedure TFPath3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlPath3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFPath3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlPath3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFPath3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlPath3D);
end;

// =============================================================================
// FRectangle3D
// =============================================================================
procedure TFRectangle3D.FCreate(FParent: TFmxObject);
begin
  ControlRectangle3D := TRectangle3D.Create(nil);
  ControlRectangle3D.Parent := TFmxObject(FParent);
end;

procedure TFRectangle3D.Cursor(FCursor: TCursor);
begin
  ControlRectangle3D.Cursor := TCursor(FCursor);
end;

procedure TFRectangle3D.Height(FHeight: Single);
begin
  ControlRectangle3D.Height := FHeight;
end;

procedure TFRectangle3D.Width(FWidth: Single);
begin
  ControlRectangle3D.Width := FWidth;
end;

procedure TFRectangle3D.BringToFront;
begin
  ControlRectangle3D.BringToFront;
end;

procedure TFRectangle3D.SendToBack;
begin
  ControlRectangle3D.SendToBack;
end;

procedure TFRectangle3D.SetTag(FTag: Integer);
begin
  ControlRectangle3D.Tag := FTag;
end;

procedure TFRectangle3D.Depth(FDepth: Single);
begin
  ControlRectangle3D.Depth := FDepth;
end;

procedure TFRectangle3D.Flatness(FValue: Single);
begin
  ControlRectangle3D.Flatness := FValue;
end;

procedure TFRectangle3D.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlRectangle3D.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFRectangle3D.MaterialShaftSource(FMaterialSource: TMaterialSource);
begin
  ControlRectangle3D.MaterialShaftSource := TMaterialSource(FMaterialSource);
end;

procedure TFRectangle3D.MaterialBackSource(FMaterialSource: TMaterialSource);
begin
  ControlRectangle3D.MaterialBackSource := TMaterialSource(FMaterialSource);
end;

procedure TFRectangle3D.CornerStyle(XRadi, YRadi: Single; FCorners: TCorners;
  FCornerType: TCornerType);
begin
  ControlRectangle3D.CornerType := TCornerType(FCornerType);
  ControlRectangle3D.Corners := TCorners(FCorners);
  ControlRectangle3D.XRadius := XRadi;
  ControlRectangle3D.YRadius := YRadi;
end;

procedure TFRectangle3D.WrapMode(FWrapMode: TMeshWrapMode);
begin
  ControlRectangle3D.WrapMode := TMeshWrapMode(FWrapMode);
end;

procedure TFRectangle3D.Position(X, Y, Z: Single);
begin
  ControlRectangle3D.Position.X := X;
  ControlRectangle3D.Position.Y := Y;
  ControlRectangle3D.Position.Z := Z;
end;

procedure TFRectangle3D.PosX(X: Single);
begin
  ControlRectangle3D.Position.X := X;
end;

procedure TFRectangle3D.PosY(Y: Single);
begin
  ControlRectangle3D.Position.Y := Y;
end;

procedure TFRectangle3D.PosZ(Z: Single);
begin
  ControlRectangle3D.Position.Z := Z;
end;

procedure TFRectangle3D.Projection(FProjection: TProjection);
begin
  ControlRectangle3D.Projection := TProjection(FProjection);
end;

procedure TFRectangle3D.RotationAngle(X, Y, Z: Single);
begin
  ControlRectangle3D.RotationAngle.X := X;
  ControlRectangle3D.RotationAngle.Y := Y;
  ControlRectangle3D.RotationAngle.Z := Z;
end;

procedure TFRectangle3D.RotationAngleX(X: Single);
begin
  ControlRectangle3D.RotationAngle.X := X;
end;

procedure TFRectangle3D.RotationAngleY(Y: Single);
begin
  ControlRectangle3D.RotationAngle.Y := Y;
end;

procedure TFRectangle3D.RotationAngleZ(Z: Single);
begin
  ControlRectangle3D.RotationAngle.Z := Z;
end;

procedure TFRectangle3D.Scale(X, Y, Z: Single);
begin
  ControlRectangle3D.Scale.X := X;
  ControlRectangle3D.Scale.Y := Y;
  ControlRectangle3D.Scale.Z := Z;
end;

procedure TFRectangle3D.ScaleX(X: Single);
begin
  ControlRectangle3D.Scale.X := X;
end;

procedure TFRectangle3D.ScaleY(Y: Single);
begin
  ControlRectangle3D.Scale.Y := Y;
end;

procedure TFRectangle3D.ScaleZ(Z: Single);
begin
  ControlRectangle3D.Scale.Z := Z;
end;

procedure TFRectangle3D.Sides(FSides: TExtrudedShapeSides);
begin
  ControlRectangle3D.Sides := TExtrudedShapeSides(FSides);
end;

procedure TFRectangle3D.TwoSide(FValue: Boolean);
begin
  ControlRectangle3D.TwoSide := FValue;
end;

procedure TFRectangle3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlRectangle3D.VisibleContextMenu := FValue;
end;

procedure TFRectangle3D.ZWrite(FValue: Boolean);
begin
  ControlRectangle3D.ZWrite := FValue;
end;

procedure TFRectangle3D.Opacity(FOpacity: Single);
begin
  ControlRectangle3D.Opacity := FOpacity;
end;

procedure TFRectangle3D.Visible(FVisible: Boolean);
begin
  ControlRectangle3D.Visible := FVisible;
end;

procedure TFRectangle3D.HitTest(FEnabled: Boolean);
begin
  ControlRectangle3D.HitTest := FEnabled;
end;

function TFRectangle3D.IsVisible: Boolean;
begin
  Result := ControlRectangle3D.Visible;
end;

function TFRectangle3D.GetTag: Integer;
begin
  Result := ControlRectangle3D.Tag;
end;

function TFRectangle3D.GetHeight: Single;
begin
  Result := ControlRectangle3D.Height;
end;

function TFRectangle3D.GetWidth: Single;
begin
  Result := ControlRectangle3D.Width;
end;

function TFRectangle3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlRectangle3D);
end;

procedure TFRectangle3D.OnClick(Event: TNotifyEvent);
begin
  ControlRectangle3D.OnClick := TNotifyEvent(Event);
end;

procedure TFRectangle3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlRectangle3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFRectangle3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlRectangle3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFRectangle3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlRectangle3D);
end;

// =============================================================================
// FEllipse3D
// =============================================================================
procedure TFEllipse3D.FCreate(FParent: TFmxObject);
begin
  ControlEllipse3D := TEllipse3D.Create(nil);
  ControlEllipse3D.Parent := TFmxObject(FParent);
end;

procedure TFEllipse3D.Cursor(FCursor: TCursor);
begin
  ControlEllipse3D.Cursor := TCursor(FCursor);
end;

procedure TFEllipse3D.Height(FHeight: Single);
begin
  ControlEllipse3D.Height := FHeight;
end;

procedure TFEllipse3D.Width(FWidth: Single);
begin
  ControlEllipse3D.Width := FWidth;
end;

procedure TFEllipse3D.BringToFront;
begin
  ControlEllipse3D.BringToFront;
end;

procedure TFEllipse3D.SendToBack;
begin
  ControlEllipse3D.SendToBack;
end;

procedure TFEllipse3D.SetTag(FTag: Integer);
begin
  ControlEllipse3D.Tag := FTag;
end;

procedure TFEllipse3D.Depth(FDepth: Single);
begin
  ControlEllipse3D.Depth := FDepth;
end;

procedure TFEllipse3D.Flatness(FValue: Single);
begin
  ControlEllipse3D.Flatness := FValue;
end;

procedure TFEllipse3D.MaterialSource(FMaterialSource: TMaterialSource);
begin
  ControlEllipse3D.MaterialSource := TMaterialSource(FMaterialSource);
end;

procedure TFEllipse3D.MaterialShaftSource(FMaterialSource: TMaterialSource);
begin
  ControlEllipse3D.MaterialShaftSource := TMaterialSource(FMaterialSource);
end;

procedure TFEllipse3D.MaterialBackSource(FMaterialSource: TMaterialSource);
begin
  ControlEllipse3D.MaterialBackSource := TMaterialSource(FMaterialSource);
end;

procedure TFEllipse3D.WrapMode(FWrapMode: TMeshWrapMode);
begin
  ControlEllipse3D.WrapMode := TMeshWrapMode(FWrapMode);
end;

procedure TFEllipse3D.Position(X, Y, Z: Single);
begin
  ControlEllipse3D.Position.X := X;
  ControlEllipse3D.Position.Y := Y;
  ControlEllipse3D.Position.Z := Z;
end;

procedure TFEllipse3D.PosX(X: Single);
begin
  ControlEllipse3D.Position.X := X;
end;

procedure TFEllipse3D.PosY(Y: Single);
begin
  ControlEllipse3D.Position.Y := Y;
end;

procedure TFEllipse3D.PosZ(Z: Single);
begin
  ControlEllipse3D.Position.Z := Z;
end;

procedure TFEllipse3D.Projection(FProjection: TProjection);
begin
  ControlEllipse3D.Projection := TProjection(FProjection);
end;

procedure TFEllipse3D.RotationAngle(X, Y, Z: Single);
begin
  ControlEllipse3D.RotationAngle.X := X;
  ControlEllipse3D.RotationAngle.Y := Y;
  ControlEllipse3D.RotationAngle.Z := Z;
end;

procedure TFEllipse3D.RotationAngleX(X: Single);
begin
  ControlEllipse3D.RotationAngle.X := X;
end;

procedure TFEllipse3D.RotationAngleY(Y: Single);
begin
  ControlEllipse3D.RotationAngle.Y := Y;
end;

procedure TFEllipse3D.RotationAngleZ(Z: Single);
begin
  ControlEllipse3D.RotationAngle.Z := Z;
end;

procedure TFEllipse3D.Scale(X, Y, Z: Single);
begin
  ControlEllipse3D.Scale.X := X;
  ControlEllipse3D.Scale.Y := Y;
  ControlEllipse3D.Scale.Z := Z;
end;

procedure TFEllipse3D.ScaleX(X: Single);
begin
  ControlEllipse3D.Scale.X := X;
end;

procedure TFEllipse3D.ScaleY(Y: Single);
begin
  ControlEllipse3D.Scale.Y := Y;
end;

procedure TFEllipse3D.ScaleZ(Z: Single);
begin
  ControlEllipse3D.Scale.Z := Z;
end;

procedure TFEllipse3D.Sides(FSides: TExtrudedShapeSides);
begin
  ControlEllipse3D.Sides := TExtrudedShapeSides(FSides);
end;

procedure TFEllipse3D.TwoSide(FValue: Boolean);
begin
  ControlEllipse3D.TwoSide := FValue;
end;

procedure TFEllipse3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlEllipse3D.VisibleContextMenu := FValue;
end;

procedure TFEllipse3D.ZWrite(FValue: Boolean);
begin
  ControlEllipse3D.ZWrite := FValue;
end;

procedure TFEllipse3D.Opacity(FOpacity: Single);
begin
  ControlEllipse3D.Opacity := FOpacity;
end;

procedure TFEllipse3D.Visible(FVisible: Boolean);
begin
  ControlEllipse3D.Visible := FVisible;
end;

procedure TFEllipse3D.HitTest(FEnabled: Boolean);
begin
  ControlEllipse3D.HitTest := FEnabled;
end;

function TFEllipse3D.IsVisible: Boolean;
begin
  Result := ControlEllipse3D.Visible;
end;

function TFEllipse3D.GetTag: Integer;
begin
  Result := ControlEllipse3D.Tag;
end;

function TFEllipse3D.GetHeight: Single;
begin
  Result := ControlEllipse3D.Height;
end;

function TFEllipse3D.GetWidth: Single;
begin
  Result := ControlEllipse3D.Width;
end;

function TFEllipse3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlEllipse3D);
end;

procedure TFEllipse3D.OnClick(Event: TNotifyEvent);
begin
  ControlEllipse3D.OnClick := TNotifyEvent(Event);
end;

procedure TFEllipse3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlEllipse3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFEllipse3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlEllipse3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFEllipse3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlEllipse3D);
end;

// =============================================================================
// FModel3D
// =============================================================================
procedure TFModel3D.FCreate(FParent: TFmxObject);
begin
  ControlModel3D := TModel3D.Create(nil);
  ControlModel3D.Parent := TFmxObject(FParent);
end;

procedure TFModel3D.Cursor(FCursor: TCursor);
begin
  ControlModel3D.Cursor := TCursor(FCursor);
end;

procedure TFModel3D.Height(FHeight: Single);
begin
  ControlModel3D.Height := FHeight;
end;

procedure TFModel3D.Width(FWidth: Single);
begin
  ControlModel3D.Width := FWidth;
end;

procedure TFModel3D.BringToFront;
begin
  ControlModel3D.BringToFront;
end;

procedure TFModel3D.SendToBack;
begin
  ControlModel3D.SendToBack;
end;

procedure TFModel3D.SetTag(FTag: Integer);
begin
  ControlModel3D.Tag := FTag;
end;

procedure TFModel3D.Depth(FDepth: Single);
begin
  ControlModel3D.Depth := FDepth;
end;

procedure TFModel3D.LoadFromfile(const Filename: WideString);
begin
  ControlModel3D.LoadFromfile(string(Filename));
end;

procedure TFModel3D.WrapMode(FWrapMode: TMeshWrapMode);
begin
  ControlModel3D.WrapMode := TMeshWrapMode(FWrapMode);
end;

procedure TFModel3D.Position(X, Y, Z: Single);
begin
  ControlModel3D.Position.X := X;
  ControlModel3D.Position.Y := Y;
  ControlModel3D.Position.Z := Z;
end;

procedure TFModel3D.PosX(X: Single);
begin
  ControlModel3D.Position.X := X;
end;

procedure TFModel3D.PosY(Y: Single);
begin
  ControlModel3D.Position.Y := Y;
end;

procedure TFModel3D.PosZ(Z: Single);
begin
  ControlModel3D.Position.Z := Z;
end;

procedure TFModel3D.Projection(FProjection: TProjection);
begin
  ControlModel3D.Projection := TProjection(FProjection);
end;

procedure TFModel3D.RotationAngle(X, Y, Z: Single);
begin
  ControlModel3D.RotationAngle.X := X;
  ControlModel3D.RotationAngle.Y := Y;
  ControlModel3D.RotationAngle.Z := Z;
end;

procedure TFModel3D.RotationAngleX(X: Single);
begin
  ControlModel3D.RotationAngle.X := X;
end;

procedure TFModel3D.RotationAngleY(Y: Single);
begin
  ControlModel3D.RotationAngle.Y := Y;
end;

procedure TFModel3D.RotationAngleZ(Z: Single);
begin
  ControlModel3D.RotationAngle.Z := Z;
end;

procedure TFModel3D.Scale(X, Y, Z: Single);
begin
  ControlModel3D.Scale.X := X;
  ControlModel3D.Scale.Y := Y;
  ControlModel3D.Scale.Z := Z;
end;

procedure TFModel3D.ScaleX(X: Single);
begin
  ControlModel3D.Scale.X := X;
end;

procedure TFModel3D.ScaleY(Y: Single);
begin
  ControlModel3D.Scale.Y := Y;
end;

procedure TFModel3D.ScaleZ(Z: Single);
begin
  ControlModel3D.Scale.Z := Z;
end;

procedure TFModel3D.TwoSide(FValue: Boolean);
begin
  ControlModel3D.TwoSide := FValue;
end;

procedure TFModel3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlModel3D.VisibleContextMenu := FValue;
end;

procedure TFModel3D.ZWrite(FValue: Boolean);
begin
  ControlModel3D.ZWrite := FValue;
end;

procedure TFModel3D.Opacity(FOpacity: Single);
begin
  ControlModel3D.Opacity := FOpacity;
end;

procedure TFModel3D.Visible(FVisible: Boolean);
begin
  ControlModel3D.Visible := FVisible;
end;

procedure TFModel3D.HitTest(FEnabled: Boolean);
begin
  ControlModel3D.HitTest := FEnabled;
end;

function TFModel3D.IsVisible: Boolean;
begin
  Result := ControlModel3D.Visible;
end;

function TFModel3D.GetTag: Integer;
begin
  Result := ControlModel3D.Tag;
end;

function TFModel3D.GetHeight: Single;
begin
  Result := ControlModel3D.Height;
end;

function TFModel3D.GetWidth: Single;
begin
  Result := ControlModel3D.Width;
end;

function TFModel3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlModel3D);
end;

procedure TFModel3D.OnClick(Event: TNotifyEvent);
begin
  ControlModel3D.OnClick := TNotifyEvent(Event);
end;

procedure TFModel3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlModel3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFModel3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlModel3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFModel3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlModel3D);
end;

// =============================================================================
// FLayout3D
// =============================================================================
procedure TFLayout3D.FCreate(FParent: TFmxObject);
begin
  ControlLayout3D := TLayout3D.Create(nil);
  ControlLayout3D.Parent := TFmxObject(FParent);
end;

procedure TFLayout3D.Cursor(FCursor: TCursor);
begin
  ControlLayout3D.Cursor := TCursor(FCursor);
end;

procedure TFLayout3D.Height(FHeight: Single);
begin
  ControlLayout3D.Height := FHeight;
end;

procedure TFLayout3D.Width(FWidth: Single);
begin
  ControlLayout3D.Width := FWidth;
end;

procedure TFLayout3D.Align(Al: TAlignLayout);
begin
  ControlLayout3D.Align := TAlignLayout(Al);
end;

procedure TFLayout3D.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLayout3D.Margins.Left := FLeft;
  ControlLayout3D.Margins.Top := FTop;
  ControlLayout3D.Margins.Right := FRight;
  ControlLayout3D.Margins.Bottom := FBottom;
end;

procedure TFLayout3D.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLayout3D.Padding.Left := FLeft;
  ControlLayout3D.Padding.Top := FTop;
  ControlLayout3D.Padding.Right := FRight;
  ControlLayout3D.Padding.Bottom := FBottom;
end;

procedure TFLayout3D.BringToFront;
begin
  ControlLayout3D.BringToFront;
end;

procedure TFLayout3D.SendToBack;
begin
  ControlLayout3D.SendToBack;
end;

procedure TFLayout3D.SetTag(FTag: Integer);
begin
  ControlLayout3D.Tag := FTag;
end;

procedure TFLayout3D.Position(X, Y, Z: Single);
begin
  ControlLayout3D.Position.X := X;
  ControlLayout3D.Position.Y := Y;
  ControlLayout3D.Position.Z := Z;
end;

procedure TFLayout3D.PosX(X: Single);
begin
  ControlLayout3D.Position.X := X;
end;

procedure TFLayout3D.PosY(Y: Single);
begin
  ControlLayout3D.Position.Y := Y;
end;

procedure TFLayout3D.PosZ(Z: Single);
begin
  ControlLayout3D.Position.Z := Z;
end;

procedure TFLayout3D.Projection(FProjection: TProjection);
begin
  ControlLayout3D.Projection := TProjection(FProjection);
end;

procedure TFLayout3D.RotationAngle(X, Y, Z: Single);
begin
  ControlLayout3D.RotationAngle.X := X;
  ControlLayout3D.RotationAngle.Y := Y;
  ControlLayout3D.RotationAngle.Z := Z;
end;

procedure TFLayout3D.RotationAngleX(X: Single);
begin
  ControlLayout3D.RotationAngle.X := X;
end;

procedure TFLayout3D.RotationAngleY(Y: Single);
begin
  ControlLayout3D.RotationAngle.Y := Y;
end;

procedure TFLayout3D.RotationAngleZ(Z: Single);
begin
  ControlLayout3D.RotationAngle.Z := Z;
end;

procedure TFLayout3D.Scale(X, Y, Z: Single);
begin
  ControlLayout3D.Scale.X := X;
  ControlLayout3D.Scale.Y := Y;
  ControlLayout3D.Scale.Z := Z;
end;

procedure TFLayout3D.ScaleX(X: Single);
begin
  ControlLayout3D.Scale.X := X;
end;

procedure TFLayout3D.ScaleY(Y: Single);
begin
  ControlLayout3D.Scale.Y := Y;
end;

procedure TFLayout3D.ScaleZ(Z: Single);
begin
  ControlLayout3D.Scale.Z := Z;
end;

procedure TFLayout3D.TwoSide(FValue: Boolean);
begin
  ControlLayout3D.TwoSide := FValue;
end;

procedure TFLayout3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlLayout3D.VisibleContextMenu := FValue;
end;

procedure TFLayout3D.ZWrite(FValue: Boolean);
begin
  ControlLayout3D.ZWrite := FValue;
end;

procedure TFLayout3D.Opacity(FOpacity: Single);
begin
  ControlLayout3D.Opacity := FOpacity;
end;

procedure TFLayout3D.Visible(FVisible: Boolean);
begin
  ControlLayout3D.Visible := FVisible;
end;

procedure TFLayout3D.HitTest(FEnabled: Boolean);
begin
  ControlLayout3D.HitTest := FEnabled;
end;

function TFLayout3D.IsVisible: Boolean;
begin
  Result := ControlLayout3D.Visible;
end;

function TFLayout3D.GetTag: Integer;
begin
  Result := ControlLayout3D.Tag;
end;

function TFLayout3D.GetHeight: Single;
begin
  Result := ControlLayout3D.Height;
end;

function TFLayout3D.GetWidth: Single;
begin
  Result := ControlLayout3D.Width;
end;

function TFLayout3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlLayout3D);
end;

procedure TFLayout3D.OnClick(Event: TNotifyEvent);
begin
  ControlLayout3D.OnClick := TNotifyEvent(Event);
end;

procedure TFLayout3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlLayout3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFLayout3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlLayout3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFLayout3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlLayout3D);
end;

// =============================================================================
// FBufferLayer3D
// =============================================================================
procedure TFBufferLayer3D.FCreate(FParent: TFmxObject);
begin
  ControlBufferLayer3D := TBufferLayer3D.Create(nil);
  ControlBufferLayer3D.Parent := TFmxObject(FParent);
end;

procedure TFBufferLayer3D.Cursor(FCursor: TCursor);
begin
  ControlBufferLayer3D.Cursor := TCursor(FCursor);
end;

procedure TFBufferLayer3D.Height(FHeight: Single);
begin
  ControlBufferLayer3D.Height := FHeight;
end;

procedure TFBufferLayer3D.Width(FWidth: Single);
begin
  ControlBufferLayer3D.Width := FWidth;
end;

procedure TFBufferLayer3D.Align(Al: TAlignLayout);
begin
  ControlBufferLayer3D.Align := TAlignLayout(Al);
end;

procedure TFBufferLayer3D.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlBufferLayer3D.Margins.Left := FLeft;
  ControlBufferLayer3D.Margins.Top := FTop;
  ControlBufferLayer3D.Margins.Right := FRight;
  ControlBufferLayer3D.Margins.Bottom := FBottom;
end;

procedure TFBufferLayer3D.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlBufferLayer3D.Padding.Left := FLeft;
  ControlBufferLayer3D.Padding.Top := FTop;
  ControlBufferLayer3D.Padding.Right := FRight;
  ControlBufferLayer3D.Padding.Bottom := FBottom;
end;

procedure TFBufferLayer3D.BringToFront;
begin
  ControlBufferLayer3D.BringToFront;
end;

procedure TFBufferLayer3D.SendToBack;
begin
  ControlBufferLayer3D.SendToBack;
end;

procedure TFBufferLayer3D.SetTag(FTag: Integer);
begin
  ControlBufferLayer3D.Tag := FTag;
end;

procedure TFBufferLayer3D.Position(X, Y, Z: Single);
begin
  ControlBufferLayer3D.Position.X := X;
  ControlBufferLayer3D.Position.Y := Y;
  ControlBufferLayer3D.Position.Z := Z;
end;

procedure TFBufferLayer3D.PosX(X: Single);
begin
  ControlBufferLayer3D.Position.X := X;
end;

procedure TFBufferLayer3D.PosY(Y: Single);
begin
  ControlBufferLayer3D.Position.Y := Y;
end;

procedure TFBufferLayer3D.PosZ(Z: Single);
begin
  ControlBufferLayer3D.Position.Z := Z;
end;

procedure TFBufferLayer3D.Projection(FProjection: TProjection);
begin
  ControlBufferLayer3D.Projection := TProjection(FProjection);
end;

procedure TFBufferLayer3D.Resolution(FValue: Integer);
begin
  ControlBufferLayer3D.Resolution := FValue;
end;

procedure TFBufferLayer3D.RotationAngle(X, Y, Z: Single);
begin
  ControlBufferLayer3D.RotationAngle.X := X;
  ControlBufferLayer3D.RotationAngle.Y := Y;
  ControlBufferLayer3D.RotationAngle.Z := Z;
end;

procedure TFBufferLayer3D.RotationAngleX(X: Single);
begin
  ControlBufferLayer3D.RotationAngle.X := X;
end;

procedure TFBufferLayer3D.RotationAngleY(Y: Single);
begin
  ControlBufferLayer3D.RotationAngle.Y := Y;
end;

procedure TFBufferLayer3D.RotationAngleZ(Z: Single);
begin
  ControlBufferLayer3D.RotationAngle.Z := Z;
end;

procedure TFBufferLayer3D.Scale(X, Y, Z: Single);
begin
  ControlBufferLayer3D.Scale.X := X;
  ControlBufferLayer3D.Scale.Y := Y;
  ControlBufferLayer3D.Scale.Z := Z;
end;

procedure TFBufferLayer3D.ScaleX(X: Single);
begin
  ControlBufferLayer3D.Scale.X := X;
end;

procedure TFBufferLayer3D.ScaleY(Y: Single);
begin
  ControlBufferLayer3D.Scale.Y := Y;
end;

procedure TFBufferLayer3D.ScaleZ(Z: Single);
begin
  ControlBufferLayer3D.Scale.Z := Z;
end;

procedure TFBufferLayer3D.TwoSide(FValue: Boolean);
begin
  ControlBufferLayer3D.TwoSide := FValue;
end;

procedure TFBufferLayer3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlBufferLayer3D.VisibleContextMenu := FValue;
end;

procedure TFBufferLayer3D.ZWrite(FValue: Boolean);
begin
  ControlBufferLayer3D.ZWrite := FValue;
end;

procedure TFBufferLayer3D.Opacity(FOpacity: Single);
begin
  ControlBufferLayer3D.Opacity := FOpacity;
end;

procedure TFBufferLayer3D.Visible(FVisible: Boolean);
begin
  ControlBufferLayer3D.Visible := FVisible;
end;

procedure TFBufferLayer3D.HitTest(FEnabled: Boolean);
begin
  ControlBufferLayer3D.HitTest := FEnabled;
end;

function TFBufferLayer3D.IsVisible: Boolean;
begin
  Result := ControlBufferLayer3D.Visible;
end;

function TFBufferLayer3D.GetTag: Integer;
begin
  Result := ControlBufferLayer3D.Tag;
end;

function TFBufferLayer3D.GetHeight: Single;
begin
  Result := ControlBufferLayer3D.Height;
end;

function TFBufferLayer3D.GetWidth: Single;
begin
  Result := ControlBufferLayer3D.Width;
end;

function TFBufferLayer3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlBufferLayer3D);
end;

procedure TFBufferLayer3D.OnClick(Event: TNotifyEvent);
begin
  ControlBufferLayer3D.OnClick := TNotifyEvent(Event);
end;

procedure TFBufferLayer3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlBufferLayer3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFBufferLayer3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlBufferLayer3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFBufferLayer3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlBufferLayer3D);
end;

// =============================================================================
// FSplitter3D
// =============================================================================
procedure TFSplitter3D.FCreate(FParent: TFmxObject);
begin
  ControlSplitter3D := TSplitter3D.Create(nil);
  ControlSplitter3D.Parent := TFmxObject(FParent);
end;

procedure TFSplitter3D.Cursor(FCursor: TCursor);
begin
  ControlSplitter3D.Cursor := TCursor(FCursor);
end;

procedure TFSplitter3D.Height(FHeight: Single);
begin
  ControlSplitter3D.Height := FHeight;
end;

procedure TFSplitter3D.Width(FWidth: Single);
begin
  ControlSplitter3D.Width := FWidth;
end;

procedure TFSplitter3D.Align(Al: TAlignLayout);
begin
  ControlSplitter3D.Align := TAlignLayout(Al);
end;

procedure TFSplitter3D.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSplitter3D.Margins.Left := FLeft;
  ControlSplitter3D.Margins.Top := FTop;
  ControlSplitter3D.Margins.Right := FRight;
  ControlSplitter3D.Margins.Bottom := FBottom;
end;

procedure TFSplitter3D.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSplitter3D.Padding.Left := FLeft;
  ControlSplitter3D.Padding.Top := FTop;
  ControlSplitter3D.Padding.Right := FRight;
  ControlSplitter3D.Padding.Bottom := FBottom;
end;

procedure TFSplitter3D.BringToFront;
begin
  ControlSplitter3D.BringToFront;
end;

procedure TFSplitter3D.SendToBack;
begin
  ControlSplitter3D.SendToBack;
end;

procedure TFSplitter3D.SetTag(FTag: Integer);
begin
  ControlSplitter3D.Tag := FTag;
end;

procedure TFSplitter3D.Position(X, Y, Z: Single);
begin
  ControlSplitter3D.Position.X := X;
  ControlSplitter3D.Position.Y := Y;
  ControlSplitter3D.Position.Z := Z;
end;

procedure TFSplitter3D.PosX(X: Single);
begin
  ControlSplitter3D.Position.X := X;
end;

procedure TFSplitter3D.PosY(Y: Single);
begin
  ControlSplitter3D.Position.Y := Y;
end;

procedure TFSplitter3D.PosZ(Z: Single);
begin
  ControlSplitter3D.Position.Z := Z;
end;

procedure TFSplitter3D.Projection(FProjection: TProjection);
begin
  ControlSplitter3D.Projection := TProjection(FProjection);
end;

procedure TFSplitter3D.RotationAngle(X, Y, Z: Single);
begin
  ControlSplitter3D.RotationAngle.X := X;
  ControlSplitter3D.RotationAngle.Y := Y;
  ControlSplitter3D.RotationAngle.Z := Z;
end;

procedure TFSplitter3D.RotationAngleX(X: Single);
begin
  ControlSplitter3D.RotationAngle.X := X;
end;

procedure TFSplitter3D.RotationAngleY(Y: Single);
begin
  ControlSplitter3D.RotationAngle.Y := Y;
end;

procedure TFSplitter3D.RotationAngleZ(Z: Single);
begin
  ControlSplitter3D.RotationAngle.Z := Z;
end;

procedure TFSplitter3D.Scale(X, Y, Z: Single);
begin
  ControlSplitter3D.Scale.X := X;
  ControlSplitter3D.Scale.Y := Y;
  ControlSplitter3D.Scale.Z := Z;
end;

procedure TFSplitter3D.ScaleX(X: Single);
begin
  ControlSplitter3D.Scale.X := X;
end;

procedure TFSplitter3D.ScaleY(Y: Single);
begin
  ControlSplitter3D.Scale.Y := Y;
end;

procedure TFSplitter3D.ScaleZ(Z: Single);
begin
  ControlSplitter3D.Scale.Z := Z;
end;

procedure TFSplitter3D.TwoSide(FValue: Boolean);
begin
  ControlSplitter3D.TwoSide := FValue;
end;

procedure TFSplitter3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlSplitter3D.VisibleContextMenu := FValue;
end;

procedure TFSplitter3D.ZWrite(FValue: Boolean);
begin
  ControlSplitter3D.ZWrite := FValue;
end;

procedure TFSplitter3D.Opacity(FOpacity: Single);
begin
  ControlSplitter3D.Opacity := FOpacity;
end;

procedure TFSplitter3D.Visible(FVisible: Boolean);
begin
  ControlSplitter3D.Visible := FVisible;
end;

procedure TFSplitter3D.HitTest(FEnabled: Boolean);
begin
  ControlSplitter3D.HitTest := FEnabled;
end;

function TFSplitter3D.IsVisible: Boolean;
begin
  Result := ControlSplitter3D.Visible;
end;

function TFSplitter3D.GetTag: Integer;
begin
  Result := ControlSplitter3D.Tag;
end;

function TFSplitter3D.GetHeight: Single;
begin
  Result := ControlSplitter3D.Height;
end;

function TFSplitter3D.GetWidth: Single;
begin
  Result := ControlSplitter3D.Width;
end;

function TFSplitter3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlSplitter3D);
end;

procedure TFSplitter3D.OnClick(Event: TNotifyEvent);
begin
  ControlSplitter3D.OnClick := TNotifyEvent(Event);
end;

procedure TFSplitter3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSplitter3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSplitter3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSplitter3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFSplitter3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlSplitter3D);
end;

// =============================================================================
// FSolidLayer3D
// =============================================================================
procedure TFSolidLayer3D.FCreate(FParent: TFmxObject);
begin
  ControlSolidLayer3D := TSolidLayer3D.Create(nil);
  ControlSolidLayer3D.Parent := TFmxObject(FParent);
end;

procedure TFSolidLayer3D.Cursor(FCursor: TCursor);
begin
  ControlSolidLayer3D.Cursor := TCursor(FCursor);
end;

procedure TFSolidLayer3D.Height(FHeight: Single);
begin
  ControlSolidLayer3D.Height := FHeight;
end;

procedure TFSolidLayer3D.Width(FWidth: Single);
begin
  ControlSolidLayer3D.Width := FWidth;
end;

procedure TFSolidLayer3D.Align(Al: TAlignLayout);
begin
  ControlSolidLayer3D.Align := TAlignLayout(Al);
end;

procedure TFSolidLayer3D.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSolidLayer3D.Margins.Left := FLeft;
  ControlSolidLayer3D.Margins.Top := FTop;
  ControlSolidLayer3D.Margins.Right := FRight;
  ControlSolidLayer3D.Margins.Bottom := FBottom;
end;

procedure TFSolidLayer3D.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlSolidLayer3D.Padding.Left := FLeft;
  ControlSolidLayer3D.Padding.Top := FTop;
  ControlSolidLayer3D.Padding.Right := FRight;
  ControlSolidLayer3D.Padding.Bottom := FBottom;
end;

procedure TFSolidLayer3D.BringToFront;
begin
  ControlSolidLayer3D.BringToFront;
end;

procedure TFSolidLayer3D.SendToBack;
begin
  ControlSolidLayer3D.SendToBack;
end;

procedure TFSolidLayer3D.SetTag(FTag: Integer);
begin
  ControlSolidLayer3D.Tag := FTag;
end;

procedure TFSolidLayer3D.Position(X, Y, Z: Single);
begin
  ControlSolidLayer3D.Position.X := X;
  ControlSolidLayer3D.Position.Y := Y;
  ControlSolidLayer3D.Position.Z := Z;
end;

procedure TFSolidLayer3D.PosX(X: Single);
begin
  ControlSolidLayer3D.Position.X := X;
end;

procedure TFSolidLayer3D.PosY(Y: Single);
begin
  ControlSolidLayer3D.Position.Y := Y;
end;

procedure TFSolidLayer3D.PosZ(Z: Single);
begin
  ControlSolidLayer3D.Position.Z := Z;
end;

procedure TFSolidLayer3D.Projection(FProjection: TProjection);
begin
  ControlSolidLayer3D.Projection := TProjection(FProjection);
end;

procedure TFSolidLayer3D.RotationAngle(X, Y, Z: Single);
begin
  ControlSolidLayer3D.RotationAngle.X := X;
  ControlSolidLayer3D.RotationAngle.Y := Y;
  ControlSolidLayer3D.RotationAngle.Z := Z;
end;

procedure TFSolidLayer3D.RotationAngleX(X: Single);
begin
  ControlSolidLayer3D.RotationAngle.X := X;
end;

procedure TFSolidLayer3D.RotationAngleY(Y: Single);
begin
  ControlSolidLayer3D.RotationAngle.Y := Y;
end;

procedure TFSolidLayer3D.RotationAngleZ(Z: Single);
begin
  ControlSolidLayer3D.RotationAngle.Z := Z;
end;

procedure TFSolidLayer3D.Scale(X, Y, Z: Single);
begin
  ControlSolidLayer3D.Scale.X := X;
  ControlSolidLayer3D.Scale.Y := Y;
  ControlSolidLayer3D.Scale.Z := Z;
end;

procedure TFSolidLayer3D.ScaleX(X: Single);
begin
  ControlSolidLayer3D.Scale.X := X;
end;

procedure TFSolidLayer3D.ScaleY(Y: Single);
begin
  ControlSolidLayer3D.Scale.Y := Y;
end;

procedure TFSolidLayer3D.ScaleZ(Z: Single);
begin
  ControlSolidLayer3D.Scale.Z := Z;
end;

procedure TFSolidLayer3D.TwoSide(FValue: Boolean);
begin
  ControlSolidLayer3D.TwoSide := FValue;
end;

procedure TFSolidLayer3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlSolidLayer3D.VisibleContextMenu := FValue;
end;

procedure TFSolidLayer3D.ZWrite(FValue: Boolean);
begin
  ControlSolidLayer3D.ZWrite := FValue;
end;

procedure TFSolidLayer3D.Opacity(FOpacity: Single);
begin
  ControlSolidLayer3D.Opacity := FOpacity;
end;

procedure TFSolidLayer3D.Visible(FVisible: Boolean);
begin
  ControlSolidLayer3D.Visible := FVisible;
end;

procedure TFSolidLayer3D.HitTest(FEnabled: Boolean);
begin
  ControlSolidLayer3D.HitTest := FEnabled;
end;

function TFSolidLayer3D.IsVisible: Boolean;
begin
  Result := ControlSolidLayer3D.Visible;
end;

function TFSolidLayer3D.GetTag: Integer;
begin
  Result := ControlSolidLayer3D.Tag;
end;

function TFSolidLayer3D.GetHeight: Single;
begin
  Result := ControlSolidLayer3D.Height;
end;

function TFSolidLayer3D.GetWidth: Single;
begin
  Result := ControlSolidLayer3D.Width;
end;

function TFSolidLayer3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlSolidLayer3D);
end;

procedure TFSolidLayer3D.OnClick(Event: TNotifyEvent);
begin
  ControlSolidLayer3D.OnClick := TNotifyEvent(Event);
end;

procedure TFSolidLayer3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlSolidLayer3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFSolidLayer3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlSolidLayer3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFSolidLayer3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlSolidLayer3D);
end;

// =============================================================================
// FImage3D
// =============================================================================
procedure TFImage3D.FCreate(FParent: TFmxObject);
begin
  ControlImage3D := TImage3D.Create(nil);
  ControlImage3D.Parent := TFmxObject(FParent);
end;

procedure TFImage3D.Cursor(FCursor: TCursor);
begin
  ControlImage3D.Cursor := TCursor(FCursor);
end;

procedure TFImage3D.Height(FHeight: Single);
begin
  ControlImage3D.Height := FHeight;
end;

procedure TFImage3D.Width(FWidth: Single);
begin
  ControlImage3D.Width := FWidth;
end;

procedure TFImage3D.Align(Al: TAlignLayout);
begin
  ControlImage3D.Align := TAlignLayout(Al);
end;

procedure TFImage3D.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImage3D.Margins.Left := FLeft;
  ControlImage3D.Margins.Top := FTop;
  ControlImage3D.Margins.Right := FRight;
  ControlImage3D.Margins.Bottom := FBottom;
end;

procedure TFImage3D.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlImage3D.Padding.Left := FLeft;
  ControlImage3D.Padding.Top := FTop;
  ControlImage3D.Padding.Right := FRight;
  ControlImage3D.Padding.Bottom := FBottom;
end;

procedure TFImage3D.BringToFront;
begin
  ControlImage3D.BringToFront;
end;

procedure TFImage3D.SendToBack;
begin
  ControlImage3D.SendToBack;
end;

procedure TFImage3D.SetTag(FTag: Integer);
begin
  ControlImage3D.Tag := FTag;
end;

procedure TFImage3D.LoadFromfile(FTextureFile: WideString;
  WrapMode: TImageWrapMode);
begin
  ControlImage3D.WrapMode := TImageWrapMode(WrapMode);
  ControlImage3D.Bitmap.LoadFromfile(string(FTextureFile));
end;

procedure TFImage3D.Position(X, Y, Z: Single);
begin
  ControlImage3D.Position.X := X;
  ControlImage3D.Position.Y := Y;
  ControlImage3D.Position.Z := Z;
end;

procedure TFImage3D.PosX(X: Single);
begin
  ControlImage3D.Position.X := X;
end;

procedure TFImage3D.PosY(Y: Single);
begin
  ControlImage3D.Position.Y := Y;
end;

procedure TFImage3D.PosZ(Z: Single);
begin
  ControlImage3D.Position.Z := Z;
end;

procedure TFImage3D.Projection(FProjection: TProjection);
begin
  ControlImage3D.Projection := TProjection(FProjection);
end;

procedure TFImage3D.RotationAngle(X, Y, Z: Single);
begin
  ControlImage3D.RotationAngle.X := X;
  ControlImage3D.RotationAngle.Y := Y;
  ControlImage3D.RotationAngle.Z := Z;
end;

procedure TFImage3D.RotationAngleX(X: Single);
begin
  ControlImage3D.RotationAngle.X := X;
end;

procedure TFImage3D.RotationAngleY(Y: Single);
begin
  ControlImage3D.RotationAngle.Y := Y;
end;

procedure TFImage3D.RotationAngleZ(Z: Single);
begin
  ControlImage3D.RotationAngle.Z := Z;
end;

procedure TFImage3D.Scale(X, Y, Z: Single);
begin
  ControlImage3D.Scale.X := X;
  ControlImage3D.Scale.Y := Y;
  ControlImage3D.Scale.Z := Z;
end;

procedure TFImage3D.ScaleX(X: Single);
begin
  ControlImage3D.Scale.X := X;
end;

procedure TFImage3D.ScaleY(Y: Single);
begin
  ControlImage3D.Scale.Y := Y;
end;

procedure TFImage3D.ScaleZ(Z: Single);
begin
  ControlImage3D.Scale.Z := Z;
end;

procedure TFImage3D.TwoSide(FValue: Boolean);
begin
  ControlImage3D.TwoSide := FValue;
end;

procedure TFImage3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlImage3D.VisibleContextMenu := FValue;
end;

procedure TFImage3D.ZWrite(FValue: Boolean);
begin
  ControlImage3D.ZWrite := FValue;
end;

procedure TFImage3D.Opacity(FOpacity: Single);
begin
  ControlImage3D.Opacity := FOpacity;
end;

procedure TFImage3D.Visible(FVisible: Boolean);
begin
  ControlImage3D.Visible := FVisible;
end;

procedure TFImage3D.HitTest(FEnabled: Boolean);
begin
  ControlImage3D.HitTest := FEnabled;
end;

function TFImage3D.IsVisible: Boolean;
begin
  Result := ControlImage3D.Visible;
end;

function TFImage3D.GetTag: Integer;
begin
  Result := ControlImage3D.Tag;
end;

function TFImage3D.GetHeight: Single;
begin
  Result := ControlImage3D.Height;
end;

function TFImage3D.GetWidth: Single;
begin
  Result := ControlImage3D.Width;
end;

function TFImage3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlImage3D);
end;

procedure TFImage3D.OnClick(Event: TNotifyEvent);
begin
  ControlImage3D.OnClick := TNotifyEvent(Event);
end;

procedure TFImage3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlImage3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFImage3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlImage3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFImage3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlImage3D);
end;

// =============================================================================
// FLayer3D
// =============================================================================
procedure TFLayer3D.FCreate(FParent: TFmxObject);
begin
  ControlLayer3D := TLayer3D.Create(nil);
  ControlLayer3D.Parent := TFmxObject(FParent);
end;

procedure TFLayer3D.Cursor(FCursor: TCursor);
begin
  ControlLayer3D.Cursor := TCursor(FCursor);
end;

procedure TFLayer3D.Height(FHeight: Single);
begin
  ControlLayer3D.Height := FHeight;
end;

procedure TFLayer3D.Width(FWidth: Single);
begin
  ControlLayer3D.Width := FWidth;
end;

procedure TFLayer3D.Align(Al: TAlignLayout);
begin
  ControlLayer3D.Align := TAlignLayout(Al);
end;

procedure TFLayer3D.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLayer3D.Margins.Left := FLeft;
  ControlLayer3D.Margins.Top := FTop;
  ControlLayer3D.Margins.Right := FRight;
  ControlLayer3D.Margins.Bottom := FBottom;
end;

procedure TFLayer3D.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlLayer3D.Padding.Left := FLeft;
  ControlLayer3D.Padding.Top := FTop;
  ControlLayer3D.Padding.Right := FRight;
  ControlLayer3D.Padding.Bottom := FBottom;
end;

procedure TFLayer3D.BringToFront;
begin
  ControlLayer3D.BringToFront;
end;

procedure TFLayer3D.SendToBack;
begin
  ControlLayer3D.SendToBack;
end;

procedure TFLayer3D.SetTag(FTag: Integer);
begin
  ControlLayer3D.Tag := FTag;
end;

procedure TFLayer3D.FillColor(FColor: TAlphaColor);
begin
  ControlLayer3D.Fill.Kind := TBrushKind.Solid;
  ControlLayer3D.Fill.Color := TAlphaColor(FColor);
end;

procedure TFLayer3D.FillPicture(const FImage: WideString; WrapMode: TWrapMode);
begin
  ControlLayer3D.Fill.Kind := TBrushKind.Bitmap;
  ControlLayer3D.Fill.Bitmap.Bitmap.LoadFromfile(string(FImage));
  ControlLayer3D.Fill.Bitmap.WrapMode := TWrapMode(WrapMode);
end;

procedure TFLayer3D.FillGradient(FColor1, FColor2: TAlphaColor;
  FStyle: TGradientStyle);
begin
  ControlLayer3D.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.ApplyGradient(ControlLayer3D.Fill, TAlphaColor(FColor1),
    TAlphaColor(FColor2), TGradientStyle(FStyle));
end;

procedure TFLayer3D.FillGradientLinearAngle(FAngle: Single);
begin
  ControlLayer3D.Fill.Kind := TBrushKind.Gradient;
  ControlLayer3D.Fill.Gradient.Style := TGradientStyle.Linear;
  TBrushHelper.ApplyLinearAngle(ControlLayer3D.Fill, FAngle);
end;

procedure TFLayer3D.FillGradientRadialAngle(FAngle: Single);
begin
  ControlLayer3D.Fill.Kind := TBrushKind.Gradient;
  ControlLayer3D.Fill.Gradient.Style := TGradientStyle.Radial;
  TBrushHelper.ApplyRadialAngle(ControlLayer3D.Fill, FAngle);
end;

procedure TFLayer3D.FillGradientPosition(X1, Y1, X2, Y2: Single);
begin
  ControlLayer3D.Fill.Kind := TBrushKind.Gradient;
  TBrushHelper.SetGradientPosition(ControlLayer3D.Fill, X1, Y1, X2, Y2);
end;

procedure TFLayer3D.AnimatedCaret(FValue: Boolean);
begin
  ControlLayer3D.AnimatedCaret := FValue;
end;

procedure TFLayer3D.Position(X, Y, Z: Single);
begin
  ControlLayer3D.Position.X := X;
  ControlLayer3D.Position.Y := Y;
  ControlLayer3D.Position.Z := Z;
end;

procedure TFLayer3D.PosX(X: Single);
begin
  ControlLayer3D.Position.X := X;
end;

procedure TFLayer3D.PosY(Y: Single);
begin
  ControlLayer3D.Position.Y := Y;
end;

procedure TFLayer3D.PosZ(Z: Single);
begin
  ControlLayer3D.Position.Z := Z;
end;

procedure TFLayer3D.Projection(FProjection: TProjection);
begin
  ControlLayer3D.Projection := TProjection(FProjection);
end;

procedure TFLayer3D.Resolution(FValue: Integer);
begin
  ControlLayer3D.Resolution := FValue;
end;

procedure TFLayer3D.RotationAngle(X, Y, Z: Single);
begin
  ControlLayer3D.RotationAngle.X := X;
  ControlLayer3D.RotationAngle.Y := Y;
  ControlLayer3D.RotationAngle.Z := Z;
end;

procedure TFLayer3D.RotationAngleX(X: Single);
begin
  ControlLayer3D.RotationAngle.X := X;
end;

procedure TFLayer3D.RotationAngleY(Y: Single);
begin
  ControlLayer3D.RotationAngle.Y := Y;
end;

procedure TFLayer3D.RotationAngleZ(Z: Single);
begin
  ControlLayer3D.RotationAngle.Z := Z;
end;

procedure TFLayer3D.Scale(X, Y, Z: Single);
begin
  ControlLayer3D.Scale.X := X;
  ControlLayer3D.Scale.Y := Y;
  ControlLayer3D.Scale.Z := Z;
end;

procedure TFLayer3D.ScaleX(X: Single);
begin
  ControlLayer3D.Scale.X := X;
end;

procedure TFLayer3D.ScaleY(Y: Single);
begin
  ControlLayer3D.Scale.Y := Y;
end;

procedure TFLayer3D.ScaleZ(Z: Single);
begin
  ControlLayer3D.Scale.Z := Z;
end;

procedure TFLayer3D.Transparency(FValue: Boolean);
begin
  ControlLayer3D.Transparency := FValue;
end;

procedure TFLayer3D.TwoSide(FValue: Boolean);
begin
  ControlLayer3D.TwoSide := FValue;
end;

procedure TFLayer3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlLayer3D.VisibleContextMenu := FValue;
end;

procedure TFLayer3D.ZWrite(FValue: Boolean);
begin
  ControlLayer3D.ZWrite := FValue;
end;

procedure TFLayer3D.Opacity(FOpacity: Single);
begin
  ControlLayer3D.Opacity := FOpacity;
end;

procedure TFLayer3D.Visible(FVisible: Boolean);
begin
  ControlLayer3D.Visible := FVisible;
end;

procedure TFLayer3D.HitTest(FEnabled: Boolean);
begin
  ControlLayer3D.HitTest := FEnabled;
end;

procedure TFLayer3D.StyleLookUp(FStyle: WideString);
begin
  ControlLayer3D.StyleLookUp := string(FStyle);
end;

function TFLayer3D.IsVisible: Boolean;
begin
  Result := ControlLayer3D.Visible;
end;

function TFLayer3D.GetTag: Integer;
begin
  Result := ControlLayer3D.Tag;
end;

function TFLayer3D.GetHeight: Single;
begin
  Result := ControlLayer3D.Height;
end;

function TFLayer3D.GetWidth: Single;
begin
  Result := ControlLayer3D.Width;
end;

function TFLayer3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlLayer3D);
end;

procedure TFLayer3D.OnClick(Event: TNotifyEvent);
begin
  ControlLayer3D.OnClick := TNotifyEvent(Event);
end;

procedure TFLayer3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlLayer3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFLayer3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlLayer3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFLayer3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlLayer3D);
end;

// =============================================================================
// FTextLayer3D
// =============================================================================
procedure TFTextLayer3D.FCreate(FParent: TFmxObject);
begin
  ControlTextLayer3D := TTextLayer3D.Create(nil);
  ControlTextLayer3D.Parent := TFmxObject(FParent);
end;

procedure TFTextLayer3D.Cursor(FCursor: TCursor);
begin
  ControlTextLayer3D.Cursor := TCursor(FCursor);
end;

procedure TFTextLayer3D.Height(FHeight: Single);
begin
  ControlTextLayer3D.Height := FHeight;
end;

procedure TFTextLayer3D.Width(FWidth: Single);
begin
  ControlTextLayer3D.Width := FWidth;
end;

procedure TFTextLayer3D.Align(Al: TAlignLayout);
begin
  ControlTextLayer3D.Align := TAlignLayout(Al);
end;

procedure TFTextLayer3D.Margins(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTextLayer3D.Margins.Left := FLeft;
  ControlTextLayer3D.Margins.Top := FTop;
  ControlTextLayer3D.Margins.Right := FRight;
  ControlTextLayer3D.Margins.Bottom := FBottom;
end;

procedure TFTextLayer3D.Padding(FLeft, FTop, FRight, FBottom: Single);
begin
  ControlTextLayer3D.Padding.Left := FLeft;
  ControlTextLayer3D.Padding.Top := FTop;
  ControlTextLayer3D.Padding.Right := FRight;
  ControlTextLayer3D.Padding.Bottom := FBottom;
end;

procedure TFTextLayer3D.BringToFront;
begin
  ControlTextLayer3D.BringToFront;
end;

procedure TFTextLayer3D.SendToBack;
begin
  ControlTextLayer3D.SendToBack;
end;

procedure TFTextLayer3D.SetTag(FTag: Integer);
begin
  ControlTextLayer3D.Tag := FTag;
end;

procedure TFTextLayer3D.Text(const FText: WideString);
begin
  ControlTextLayer3D.Text := string(FText);
end;

procedure TFTextLayer3D.FontSetting(const FontName: WideString;
  FontSize: Single);
begin
  ControlTextLayer3D.Font.Family := string(FontName);
  ControlTextLayer3D.Font.Size := FontSize;
end;

procedure TFTextLayer3D.Color(FColor: TAlphaColor);
begin
  ControlTextLayer3D.Color := TAlphaColor(FColor);
end;

procedure TFTextLayer3D.Position(X, Y, Z: Single);
begin
  ControlTextLayer3D.Position.X := X;
  ControlTextLayer3D.Position.Y := Y;
  ControlTextLayer3D.Position.Z := Z;
end;

procedure TFTextLayer3D.PosX(X: Single);
begin
  ControlTextLayer3D.Position.X := X;
end;

procedure TFTextLayer3D.PosY(Y: Single);
begin
  ControlTextLayer3D.Position.Y := Y;
end;

procedure TFTextLayer3D.PosZ(Z: Single);
begin
  ControlTextLayer3D.Position.Z := Z;
end;

procedure TFTextLayer3D.Projection(FProjection: TProjection);
begin
  ControlTextLayer3D.Projection := TProjection(FProjection);
end;

procedure TFTextLayer3D.Resolution(FValue: Integer);
begin
  ControlTextLayer3D.Resolution := FValue;
end;

procedure TFTextLayer3D.RotationAngle(X, Y, Z: Single);
begin
  ControlTextLayer3D.RotationAngle.X := X;
  ControlTextLayer3D.RotationAngle.Y := Y;
  ControlTextLayer3D.RotationAngle.Z := Z;
end;

procedure TFTextLayer3D.RotationAngleX(X: Single);
begin
  ControlTextLayer3D.RotationAngle.X := X;
end;

procedure TFTextLayer3D.RotationAngleY(Y: Single);
begin
  ControlTextLayer3D.RotationAngle.Y := Y;
end;

procedure TFTextLayer3D.RotationAngleZ(Z: Single);
begin
  ControlTextLayer3D.RotationAngle.Z := Z;
end;

procedure TFTextLayer3D.Scale(X, Y, Z: Single);
begin
  ControlTextLayer3D.Scale.X := X;
  ControlTextLayer3D.Scale.Y := Y;
  ControlTextLayer3D.Scale.Z := Z;
end;

procedure TFTextLayer3D.ScaleX(X: Single);
begin
  ControlTextLayer3D.Scale.X := X;
end;

procedure TFTextLayer3D.ScaleY(Y: Single);
begin
  ControlTextLayer3D.Scale.Y := Y;
end;

procedure TFTextLayer3D.ScaleZ(Z: Single);
begin
  ControlTextLayer3D.Scale.Z := Z;
end;

procedure TFTextLayer3D.TwoSide(FValue: Boolean);
begin
  ControlTextLayer3D.TwoSide := FValue;
end;

procedure TFTextLayer3D.VisibleContextMenu(FValue: Boolean);
begin
  ControlTextLayer3D.VisibleContextMenu := FValue;
end;

procedure TFTextLayer3D.ZWrite(FValue: Boolean);
begin
  ControlTextLayer3D.ZWrite := FValue;
end;

procedure TFTextLayer3D.Opacity(FOpacity: Single);
begin
  ControlTextLayer3D.Opacity := FOpacity;
end;

procedure TFTextLayer3D.Visible(FVisible: Boolean);
begin
  ControlTextLayer3D.Visible := FVisible;
end;

procedure TFTextLayer3D.HitTest(FEnabled: Boolean);
begin
  ControlTextLayer3D.HitTest := FEnabled;
end;

function TFTextLayer3D.IsVisible: Boolean;
begin
  Result := ControlTextLayer3D.Visible;
end;

function TFTextLayer3D.GetTag: Integer;
begin
  Result := ControlTextLayer3D.Tag;
end;

function TFTextLayer3D.GetHeight: Single;
begin
  Result := ControlTextLayer3D.Height;
end;

function TFTextLayer3D.GetWidth: Single;
begin
  Result := ControlTextLayer3D.Width;
end;

function TFTextLayer3D.GetObject: TFmxObject;
begin
  Result := TFmxObject(ControlTextLayer3D);
end;

procedure TFTextLayer3D.OnClick(Event: TNotifyEvent);
begin
  ControlTextLayer3D.OnClick := TNotifyEvent(Event);
end;

procedure TFTextLayer3D.OnMouseEnter(Event: TNotifyEvent);
begin
  ControlTextLayer3D.OnMouseEnter := TNotifyEvent(Event);
end;

procedure TFTextLayer3D.OnMouseLeave(Event: TNotifyEvent);
begin
  ControlTextLayer3D.OnMouseLeave := TNotifyEvent(Event);
end;

function TFTextLayer3D.Handle: TFmxObject;
begin
  Result := TFmxObject(ControlTextLayer3D);
end;

// =============================================================================
// FColorMaterialSource
// =============================================================================
procedure TFColorMaterialSource.FCreate(FParent: TFmxObject);
begin
  ControlColorMaterialSource := TColorMaterialSource.Create(nil);
  ControlColorMaterialSource.Parent := TFmxObject(FParent);
end;

procedure TFColorMaterialSource.Color(FColor: TAlphaColor);
begin
  ControlColorMaterialSource.Color := TAlphaColor(FColor);
end;

procedure TFColorMaterialSource.SetTag(FTag: Integer);
begin
  ControlColorMaterialSource.Tag := FTag;
end;

function TFColorMaterialSource.GetTag: Integer;
begin
  Result := ControlColorMaterialSource.Tag;
end;

function TFColorMaterialSource.Handle: TMaterialSource;
begin
  Result := TMaterialSource(ControlColorMaterialSource);
end;

// =============================================================================
// FTextureMaterialSource
// =============================================================================
procedure TFTextureMaterialSource.FCreate(FParent: TFmxObject);
begin
  ControlTextureMaterialSource := TTextureMaterialSource.Create(nil);
  ControlTextureMaterialSource.Parent := TFmxObject(FParent);
end;

procedure TFTextureMaterialSource.LoadFromfile(FTextureFile: WideString);
begin
  ControlTextureMaterialSource.Texture.LoadFromfile(string(FTextureFile));
end;

procedure TFTextureMaterialSource.SetTag(FTag: Integer);
begin
  ControlTextureMaterialSource.Tag := FTag;
end;

function TFTextureMaterialSource.GetTag: Integer;
begin
  Result := ControlTextureMaterialSource.Tag;
end;

function TFTextureMaterialSource.Handle: TMaterialSource;
begin
  Result := TMaterialSource(ControlTextureMaterialSource);
end;

// =============================================================================
// FLightMaterialSource
// =============================================================================
procedure TFLightMaterialSource.FCreate(FParent: TFmxObject);
begin
  ControlLightMaterialSource := TLightMaterialSource.Create(nil);
  ControlLightMaterialSource.Parent := TFmxObject(FParent);
end;

procedure TFLightMaterialSource.Ambient(FColor: TAlphaColor);
begin
  ControlLightMaterialSource.Ambient := TAlphaColor(FColor);
end;

procedure TFLightMaterialSource.Diffuse(FColor: TAlphaColor);
begin
  ControlLightMaterialSource.Diffuse := TAlphaColor(FColor);
end;

procedure TFLightMaterialSource.Emissive(FColor: TAlphaColor);
begin
  ControlLightMaterialSource.Emissive := TAlphaColor(FColor);
end;

procedure TFLightMaterialSource.Shininess(FValue: Integer);
begin
  ControlLightMaterialSource.Shininess := FValue;
end;

procedure TFLightMaterialSource.Specular(FColor: TAlphaColor);
begin
  ControlLightMaterialSource.Specular := TAlphaColor(FColor);
end;

procedure TFLightMaterialSource.LoadFromfile(FTextureFile: WideString);
begin
  ControlLightMaterialSource.Texture.LoadFromfile(string(FTextureFile));
end;

procedure TFLightMaterialSource.SetTag(FTag: Integer);
begin
  ControlLightMaterialSource.Tag := FTag;
end;

function TFLightMaterialSource.GetTag: Integer;
begin
  Result := ControlLightMaterialSource.Tag;
end;

function TFLightMaterialSource.Handle: TMaterialSource;
begin
  Result := TMaterialSource(ControlLightMaterialSource);
end;

// =============================================================================
// Exports
// =============================================================================
function InitViewport3DHandle: FViewport3D;
begin
  Result := TFViewport3D.Create;
end;

function InitCameraHandle: FCamera;
begin
  Result := TFCamera.Create;
end;

function InitLightHandle: FLight;
begin
  Result := TFLight.Create;
end;

function InitDummyHandle: FDummy;
begin
  Result := TFDummy.Create;
end;

function InitProxyObjectHandle: FProxyObject;
begin
  Result := TFProxyObject.Create;
end;

function InitPlaneHandle: FPlane;
begin
  Result := TFPlane.Create;
end;

function InitDiskHandle: FDisk;
begin
  Result := TFDisk.Create;
end;

function InitCubeHandle: FCube;
begin
  Result := TFCube.Create;
end;

function InitSphereHandle: FSphere;
begin
  Result := TFSphere.Create;
end;

function InitCylinderHandle: FCylinder;
begin
  Result := TFCylinder.Create;
end;

function InitRoundCubeHandle: FRoundCube;
begin
  Result := TFRoundCube.Create;
end;

function InitConeHandle: FCone;
begin
  Result := TFCone.Create;
end;

function InitGrid3DHandle: FGrid3D;
begin
  Result := TFGrid3D.Create;
end;

function InitStrokeCubeHandle: FStrokeCube;
begin
  Result := TFStrokeCube.Create;
end;

function InitText3DHandle: FText3D;
begin
  Result := TFText3D.Create;
end;

function InitPath3DHandle: FPath3D;
begin
  Result := TFPath3D.Create;
end;

function InitRectangle3DHandle: FRectangle3D;
begin
  Result := TFRectangle3D.Create;
end;

function InitEllipse3DHandle: FEllipse3D;
begin
  Result := TFEllipse3D.Create;
end;

function InitModel3DHandle: FModel3D;
begin
  Result := TFModel3D.Create;
end;

function InitLayout3DHandle: FLayout3D;
begin
  Result := TFLayout3D.Create;
end;

function InitBufferLayer3DHandle: FBufferLayer3D;
begin
  Result := TFBufferLayer3D.Create;
end;

function InitSplitter3DHandle: FSplitter3D;
begin
  Result := TFSplitter3D.Create;
end;

function InitSolidLayer3DHandle: FSolidLayer3D;
begin
  Result := TFSolidLayer3D.Create;
end;

function InitImage3DHandle: FImage3D;
begin
  Result := TFImage3D.Create;
end;

function InitLayer3DHandle: FLayer3D;
begin
  Result := TFLayer3D.Create;
end;

function InitTextLayer3DHandle: FTextLayer3D;
begin
  Result := TFTextLayer3D.Create;
end;

function InitColorMaterialSourceHandle: FColorMaterialSource;
begin
  Result := TFColorMaterialSource.Create;
end;

function InitTextureMaterialSourceHandle: FTextureMaterialSource;
begin
  Result := TFTextureMaterialSource.Create;
end;

function InitLightMaterialSourceHandle: FLightMaterialSource;
begin
  Result := TFLightMaterialSource.Create;
end;

exports
  InitViewport3DHandle,
  InitCameraHandle,
  InitLightHandle,
  InitDummyHandle,
  InitProxyObjectHandle,
  InitPlaneHandle,
  InitDiskHandle,
  InitCubeHandle,
  InitSphereHandle,
  InitCylinderHandle,
  InitRoundCubeHandle,
  InitConeHandle,
  InitGrid3DHandle,
  InitStrokeCubeHandle,
  InitText3DHandle,
  InitPath3DHandle,
  InitRectangle3DHandle,
  InitEllipse3DHandle,
  InitModel3DHandle,
  InitLayout3DHandle,
  InitBufferLayer3DHandle,
  InitSplitter3DHandle,
  InitSolidLayer3DHandle,
  InitImage3DHandle,
  InitLayer3DHandle,
  InitTextLayer3DHandle,
  InitColorMaterialSourceHandle,
  InitTextureMaterialSourceHandle,
  InitLightMaterialSourceHandle;

end.
