
library FMXBridge;

{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

{$IFDEF WIN32}
  {$LIBSUFFIX '_x86'}
{$ELSE}
  {$LIBSUFFIX '_x64'}
{$ENDIF}

{$R FMXBridge.res}

uses
  FMXBridge.Forms in 'Forms\FMXBridge.Forms.pas',
  FMXBridge.TitleBar in 'Forms\TitleBar\FMXBridge.TitleBar.pas',
  FMXBridge.ThumbButtons in 'Forms\FMXBridge.ThumbButtons.pas',
  FMXBridge.TrayIcon in 'Forms\FMXBridge.TrayIcon.pas',
  FMXBridge.SplashForm in 'Forms\FMXBridge.SplashForm.pas',
  FMXBridge.Additional in 'FMX\FMXBridge.Additional.pas',
  FMXBridge.Animations in 'FMX\FMXBridge.Animations.pas',
  FMXBridge.Colors in 'FMX\FMXBridge.Colors.pas',
  FMXBridge.CommonControls in 'FMX\FMXBridge.CommonControls.pas',
  FMXBridge.Dialogs in 'FMX\FMXBridge.Dialogs.pas',
  FMXBridge.Effects in 'FMX\FMXBridge.Effects.pas',
  FMXBridge.Layouts in 'FMX\FMXBridge.Layouts.pas',
  FMXBridge.Media in 'FMX\FMXBridge.Media.pas',
  FMXBridge.Net in 'FMX\FMXBridge.Net.pas',
  FMXBridge.Shapes in 'FMX\FMXBridge.Shapes.pas',
  FMXBridge.Standard in 'FMX\FMXBridge.Standard.pas',
  FMXBridge.System in 'FMX\FMXBridge.System.pas',
  FMXBridge.ThreeD in 'FMX\FMXBridge.ThreeD.pas',
  FMXBridge.AudioPlayer in 'ThirdParty\FMXBridge.AudioPlayer.pas',
  FMXBridge.GIFImage in 'ThirdParty\FMXBridge.GIFImage.pas',
  FMXBridge.HTMLText in 'ThirdParty\FMXBridge.HTMLText.pas',
  FMXBridge.Input in 'ThirdParty\FMXBridge.Input.pas',
  FMXBridge.RadiantShapes in 'ThirdParty\FMXBridge.RadiantShapes.pas',
  {$IFDEF SKIA}
  FMXBridge.Skia in 'ThirdParty\FMXBridge.Skia.pas',
  {$ENDIF }
  FMXBridge.SVGImage in 'ThirdParty\FMXBridge.SVGImage.pas',
  FMXBridge.Toast in 'ThirdParty\FMXBridge.Toast.pas',
  FMXBridge.BlurRectangle in 'Custom\FMXBridge.BlurRectangle.pas',
  FMXBridge.CheckBoxTree in 'Custom\FMXBridge.CheckBoxTree.pas',
  FMXBridge.Custom in 'Custom\FMXBridge.Custom.pas',
  FMXBridge.GlassRectangle in 'Custom\FMXBridge.GlassRectangle.pas',
  FMXBridge.PicShow in 'Custom\FMXBridge.PicShow.pas',
  FMXBridge.RatingBar in 'Custom\FMXBridge.RatingBar.pas',
  FMXBridge.ShapeControls in 'Custom\FMXBridge.ShapeControls.pas',
  FMXBridge.Spinners in 'Custom\FMXBridge.Spinners.pas',
  FMXBridge.Sprites in 'Custom\FMXBridge.Sprites.pas',
  FMXBridge.SystemInfo in 'Custom\FMXBridge.SystemInfo.pas',
  FMXBridge.WebPImage in 'Custom\FMXBridge.WebPImage.pas',
  FMXBridge.Utils in 'Custom\FMXBridge.Utils.pas';

begin
//
end.
