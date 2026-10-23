
library FMXBridge;

{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

{$IFDEF WIN32}
  {$LIBSUFFIX '_x86'}
  {$R 'ThirdParty\Bass\Bass_x86.res'}
{$ELSE}
  {$LIBSUFFIX '_x64'}
  {$R 'ThirdParty\Bass\Bass_x64.res'}
{$ENDIF}

{$R FMXBridge.res}

uses
  FMXBridge.Forms in 'Forms\FMXBridge.Forms.pas',
  FMXBridge.TitleBar in 'Forms\TitleBar\FMXBridge.TitleBar.pas',
  FMXBridge.SplashForm in 'Forms\FMXBridge.SplashForm.pas',
  {$IFDEF SKIA}
  FMXBridge.Skia in 'ThirdParty\FMXBridge.Skia.pas',
  {$ENDIF }
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
  FMXBridge.Utils in 'Custom\FMXBridge.Utils.pas',
  FMXBridge.Bass in 'ThirdParty\Bass\FMXBridge.Bass.pas',
  FMXBridge.HTMLText in 'ThirdParty\FMXBridge.HTMLText.pas',
  FMXBridge.RadiantShapes in 'ThirdParty\FMXBridge.RadiantShapes.pas',
  FMXBridge.BlurRectangle in 'Custom\FMXBridge.BlurRectangle.pas',
  FMXBridge.GlassRectangle in 'Custom\FMXBridge.GlassRectangle.pas',
  FMXBridge.GIFImage in 'ThirdParty\GIF\FMXBridge.GIFImage.pas',
  FMXBridge.PicShow in 'Custom\PicShow\FMXBridge.PicShow.pas',
  FMXBridge.ShapeControls in 'Custom\FMXBridge.ShapeControls.pas',
  FMXBridge.Spinners in 'Custom\FMXBridge.Spinners.pas',
  FMXBridge.Sprites in 'Custom\FMXBridge.Sprites.pas',
  FMXBridge.SVGImage in 'Custom\SVG\FMXBridge.SVGImage.pas',
  FMXBridge.WebPImage in 'Custom\WebP\FMXBridge.WebPImage.pas',
  FMXBridge.Custom in 'Custom\FMXBridge.Custom.pas',
  FMXBridge.SystemInfo in 'Custom\FMXBridge.SystemInfo.pas',
  FMXBridge.ThumbButtons in 'Forms\FMXBridge.ThumbButtons.pas';

end.
