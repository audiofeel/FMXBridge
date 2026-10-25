# FMXBridge

**FMXBridge is a Delphi DLL project that exposes FireMonkey (FMX) forms, controls, graphics, effects, and helper functionality to Windows host applications.** It is particularly aimed at using FMX UI from Inno Setup through a Pascal Script interface, without separately installing every component into the IDE.

The repository contains both sides of the integration:

- `FMXBridge.dpr` and the Pascal units that build the DLL.
- [`FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss), the Inno Setup include file containing the matching Pascal Script interface declarations, imported-function declarations, types, constants, and helper routines.

## Features

The source tree includes:

- **Forms and Windows integration** — main/message/splash forms, custom title-bar controls, and window helpers.
- **DWM and window appearance** — backdrop effects, blur, dark mode, border color, and rounded corners.
- **Standard and additional FMX controls** — buttons, labels, edit controls, check boxes, radio buttons, panels, lists, trees, menus, progress controls, spinners, page controls, and more.
- **Animations, effects, and transitions** — property animations, FMX effects, and transition effects.
- **2D and 3D graphics** — shapes, text, viewports, cameras, lights, models, and material sources.
- **Image and text support** — SVG, GIF, WebP, and HTML-formatted text.
- **Utilities** — storage/system information, timers, a stopwatch, network downloads, dialogs, and media-related functionality.
- **Optional integrations** — BASS audio, Skia4Delphi wrappers, and RadiantShapes wrappers.

The Pascal units and [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) are the definitive references for available interfaces, method signatures, parameter types, interface identifiers, and exported names.

## Examples

FMXBridge includes **75 Inno Setup demo scripts** showing how to use FireMonkey forms, controls, graphics, animations, and Windows integration from Pascal Script.

### FMXBridge examples

The [`Examples/`](Examples/) directory contains 55 demos covering:

- **Forms and navigation** — [Page Control](Examples/Example_PageControl.iss), [Tab Controls](Examples/Example_TabControls.iss), [Splash Screen](Examples/Example_Splash.iss), and [Uninstaller Form](Examples/Example_UninstallForm.iss).
- **Window appearance and effects** — [Blur Rectangle](Examples/Example_BlurRectangle.iss), [Glass Rectangle](Examples/Example_GlassRectangle.iss), and [Automatic Color Mode](Examples/Example_AutoColorMode.iss).
- **Custom controls and animations** — [PicShow effects](Examples/Example_PicShow.iss), [Spinners](Examples/Example_Spinners.iss), [Sprite Controls](Examples/Example_SpriteControls.iss), and [Rating Bar](Examples/Example_RatingBar.iss).
- **Graphics and media** — [3D Animation](Examples/Example_3D_Anim.iss), [GIF Images](Examples/Example_GifImage.iss), [SVG Images](Examples/Example_SVGImage.iss), [WebP Animation](Examples/Example_WebPImageAnim.iss), and [Video Player](Examples/Example_VideoPlayer.iss).
- **Utilities and system integration** — [Storage Information](Examples/Example_StorageInfo.iss), [System Information](Examples/Example_SystemInfo.iss), and [Downloader](Examples/Example_Downloader.iss).

Supporting assets used by these demos are stored in [`Examples/Files/`](Examples/Files/).

### Skia4Delphi examples

The [`Examples/Skia/`](Examples/Skia/) directory contains 20 additional demos showcasing Skia4Delphi integration, including animated images, custom fonts, text rendering, SVG, path effects, and interactive shaders.

Start with [Animated Paint Box — Mouse Interaction](Examples/Skia/Example_AnimPaintBox_InteractWithMouse.iss), [Animated Images](Examples/Skia/Example_AnimatedImage.iss), or [Path Shader](Examples/Skia/Example_Draw_Path_Shader.iss).

Supporting Skia assets, including shaders, fonts, styles, and SVG files, are stored in [`Examples/Skia/Files/`](Examples/Skia/Files/).

### Preparing the examples

The demo scripts are source files, not precompiled installer executables. The required FMXBridge DLL binaries and, for Skia demos, the matching Skia4Delphi runtime DLLs must be supplied locally.

Before compiling a demo, follow the instructions in [`Examples/Modules/README.md`](Examples/Modules/README.md) or [`Examples/Skia/Modules/README.md`](Examples/Skia/Modules/README.md), depending on the example.

Some demos also require optional third-party components or additional resources. Refer to the project requirements and [third-party notices](THIRD-PARTY-NOTICES.md) for details.

## Requirements

- **Embarcadero RAD Studio / Delphi with FireMonkey (FMX).** The project is configured for **Win32** and **Win64**. The checked-in `FMXBridgeHandle.iss` header identifies RAD Studio 13.2 / compiler build `37.0.60952.8797`.
- **Inno Setup 7.0.0 or later** to use the current [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss). The include file checks the Inno Setup version at compile time.
- A compatible **RadiantShapes FMX** package to build the project as currently listed in `FMXBridge.dpr`. `ThirdParty/FMXBridge.RadiantShapes.pas` contains FMXBridge's wrapper/calls, not the RadiantShapes implementation. If you do not have the required package and usage rights, remove the related unit/export references and wrapper declarations before building.
- A compatible **Skia4Delphi** installation if the `SKIA` conditional define is enabled. `ThirdParty/FMXBridge.Skia.pas` provides the FMXBridge-side wrapper; the full Skia4Delphi library is not vendored here.
- **BASS** is used by the optional audio integration. Its resources and DLL binaries are currently under `ThirdParty/Bass`; BASS is subject to its own terms. See [official BASS licensing](https://www.un4seen.com/bass.html).

Some other components are included as source under `ThirdParty/` or `Custom/`. See [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md) for the sources and known licensing boundaries. Not every dependency is covered by the FMXBridge license.

## Project structure

| Path | Purpose |
| --- | --- |
| `FMXBridge.dpr` | DLL project source, unit list, architecture suffixes, and resource inclusion. |
| `FMXBridge.dproj` | RAD Studio project settings. |
| `Examples/Modules/FMXBridgeHandle.iss` | Inno Setup / Pascal Script interface declarations and imports for the DLL, plus constants and helper functions. |
| `Examples/Skia/Modules/FMXSkiaHandle.iss` | Additional Inno Setup declarations for the Skia4Delphi integration. |
| `FMX/` | Standard and additional FMX controls, layouts, effects, graphics, media, networking, and 3D interfaces. |
| `Forms/` | Forms, splash screen, title-bar controls, DWM helpers, and Windows utilities. |
| `Custom/` | Custom controls and helpers, including SVG and WebP-related code. |
| `Helpers/` | Additional helper units. |
| `Fix/` | Modified `FMX.Platform.Win.pas` source. It retains Embarcadero's copyright notice and is excluded from the FMXBridge license. |
| `ThirdParty/` | Third-party source, wrappers, resources, and optional integrations. See [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md). |
| `Examples/` | 55 Inno Setup demos for FMXBridge, with supporting assets under `Examples/Files/`. |
| `Examples/Modules/` | Local module directory for FMXBridge demo scripts; see its README for setup instructions. |
| `Examples/Skia/` | 20 Skia4Delphi demos and their supporting assets. |
| `Examples/Skia/Modules/` | Local module directory for Skia4Delphi demos; see its README for setup instructions. |

## Build the DLL

1. Open `FMXBridge.dproj` in RAD Studio.
2. Select the `Release` configuration.
3. Select **Win32** and build the project.
4. Select **Win64** and build the project again.

The project uses architecture-specific DLL suffixes:

- Win32: `FMXBridge_x86.dll`
- Win64: `FMXBridge_x64.dll`

With the project's output settings, the expected output directories are `Win32\Release\` and `Win64\Release\`. Building from a clean machine may require the external packages described above. The source has not been independently built in a clean environment while preparing this README.

## Use FMXBridge from Inno Setup

[`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) is part of the project; it is not necessary to recreate all the Pascal Script interfaces and external declarations manually.

### 1. Include the handle file

The handle files are stored with the example modules, not in the repository root.

For demo scripts directly inside `Examples/`, include the main handle file like this:

```iss
#include "Modules\\FMXBridgeHandle.iss"
```

For Skia demo scripts inside `Examples/Skia/`, include both handle files:

```iss
#include "Modules\\FMXBridgeHandle.iss"
#include "Modules\\FMXSkiaHandle.iss"
```

The main handle file contains its own `[Code]` section and enforces Inno Setup 7.0.0 or later. If your installer script is stored elsewhere, adjust the relative include path accordingly.

### 2. Add the matching DLL to `[Files]`

The include imports FMXBridge functions using declarations of the form:

```pascal
external 'InitFormHandle@files:FMXBridge.dll stdcall delayload';
```

Therefore, the installer must contain the architecture-matching DLL in its `[Files]` section under the internal name `FMXBridge.dll`, normally with the `dontcopy` flag so Inno Setup can extract it to a temporary location when it is first needed. The DLL bitness must match the process that loads it. The build output is suffixed `_x86` or `_x64`, while the include expects `FMXBridge.dll`; select/rename the appropriate build output or use `DestName: "FMXBridge.dll"` in the matching `[Files]` entry.

Example for a Win32 build (adjust the path and architecture selection for your installer):

```iss
[Files]
Source: "Win32\Release\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
```

If solid compression is enabled, place the DLL entry near the top of `[Files]` to avoid unnecessary extraction delays. See the [Inno Setup documentation on using DLLs](https://jrsoftware.org/ishelp/topic_scriptdll.htm).

### 3. Create a form

For example, after including [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss), an installer can create a basic FMX form through the declared `FForm` interface:

```pascal
[Code]
var
  MainForm: FForm;

procedure InitializeWizard;
begin
  MainForm := InitFormHandle;
  MainForm.FCreateBlankForm(WizardForm.Handle, ALBlack, '', False);
  MainForm.Caption('FMXBridge test');
  MainForm.Show;
end;
```

This snippet demonstrates the interface flow only; it is not a complete installer or a substitute for choosing the correct DLL architecture and required external packages. See the interface declarations in [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) for other methods and controls.

### 4. Shutdown helpers

The include defines `FMXBridgeShutDown` and `FMXBridgeShutDownUn` helpers. Inspect their implementations before using them: they call the FMXBridge shutdown export and `EndTask` for the Setup or Uninstall progress window. They are host-shutdown helpers, **not** generic safe-DLL-unload routines. Do not assume that manually unloading the DLL while imported functions or FMX objects remain in use is safe.

## API model

The DLL exposes factory functions such as:

- `InitFormHandle` and `InitMsgFormHandle`
- `InitButtonHandle`
- `InitRectangleHandle`
- `InitShadowEffect`
- `InitViewport3DHandle`
- `InitTimer` and `InitStopwatch`

The corresponding Pascal units declare interfaces derived from `IUnknown`; interface methods generally use `stdcall`. Parameters can include FMX object handles (`TFmxObject`), Windows handles (`HWND`), `WideString` values, callbacks, and FMX-specific types. This is a Delphi/FireMonkey interface-based API rather than a generic C ABI. A host's declarations must match the exports, calling conventions, interface identifiers, and parameter/return types.

The DLL and [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) contain matching sides of this API. If you add, remove, or change an exported function or interface in the Delphi project, update the Inno Setup declarations accordingly. Optional modules can be removed, but remove the associated unit, export, wrapper, resource, and package references together.

## Credits and acknowledgements

FMXBridge is an independent project influenced by work from the Delphi and Inno Setup communities. Thank you to the following authors and projects:

- **[ISFMXFW](https://github.com/Jivanewstone/ISFMXFW)** — inspiration for exposing FireMonkey functionality to Inno Setup through a DLL. This is an acknowledgement of inspiration, not a claim that ISFMXFW source code is included.
- **[FMXComponents](https://github.com/zhaoyipeng/FMXComponents)** by Zhao Yipeng — component ideas and approaches. Thank you for the contribution to the FMX community.
- **[PicShow Components](https://www.delphiarea.com/products/delphi-components/picshow/)** from Delphi Area — inspiration for the image-transition effect ideas in `Custom/PicShow`. No PicShow source code was copied or included; the FMXBridge implementation was written independently.
- **[BASS](https://www.un4seen.com/)** — audio library and API.
- **[GIFImage for FireMonkey](https://github.com/TomDannert/GIFImage)** by Thomas Dannert — GIF support.
- **[DzHTMLText](https://github.com/digao-dalpiaz/DzHTMLText)** by Rodrigo Depiné Dalpiaz — HTML-formatted text support.
- **[FMXSVG](https://github.com/HemulGM/FMXSVG)** by HemulGM — SVG support and related source.
- **[Skia4Delphi](https://github.com/skia4delphi/skia4delphi)** — Skia integration and wrappers.
- **WebP support** — the original source repository and author could not be identified by the FMXBridge author. If you recognise the source, please open an issue so the attribution can be corrected.
- **RadiantShapes** — FMXBridge includes wrapper code/calls only, not the RadiantShapes implementation. Users need the required package and usage rights.
- **`FMX.Platform.Win.pas`** — this platform unit was adjusted for FMXBridge. The approach to modifying it was learned from [HemulGM](https://github.com/HemulGM); thanks for sharing the work.

See [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md) for more detail. Each third-party component remains subject to its own license or vendor terms. Those terms are not replaced by the FMXBridge license.

## Code style

The source intentionally contains very few comments. The author's preference is for comments to convey a directly useful fact rather than add a long explanation that merely restates the code.

## License

The [`LICENSE`](LICENSE) file applies **only to original FMXBridge code authored by audiofeel**. It does not grant rights to third-party code or binaries, the modified Embarcadero platform source, BASS, or the RadiantShapes package. Review [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md) before redistributing the complete source tree or a DLL built from it.

The reference to ISFMXFW is an acknowledgement of inspiration. If any code was copied or adapted from that GPL-3.0 project, the licensing implications for those portions must be assessed separately.

## Status

The repository includes the DLL source project, the Inno Setup handle include, and 75 demo scripts under `Examples/`, including a separate set of Skia4Delphi examples.

Prebuilt FMXBridge DLL binaries and compiled demo installers are not currently distributed with the repository. See the README files in `Examples/Modules/` and `Examples/Skia/Modules/` for instructions on preparing the local dependencies.

An automated build and test workflow is not currently included.

For questions, corrections, or attribution updates, use [GitHub Issues](https://github.com/audiofeel/FMXBridge/issues).

