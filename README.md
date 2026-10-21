# FMXBridge

**FMXBridge is a Delphi DLL project that exposes FireMonkey (FMX) forms, controls, effects, graphics, and helper functionality through exported factory functions and Delphi interfaces.** It is intended for Windows hosts that want to create and manage FMX objects through a DLL API instead of installing each component into the host application.

The project is particularly relevant to integrations with **Inno Setup**, but this repository currently contains the DLL source project rather than a complete Inno Setup wrapper or a ready-made installer.

## Why FMXBridge?

FMXBridge groups many controls and helper modules in one source project. The integrations are kept in separate units so that optional functionality can be removed without having to install and register every component separately. When removing a module, also remove its corresponding unit/export entries and any related resource or package references.

Most of the included component implementations and wrappers live in the repository already. The exception is functionality that calls an external library or package, such as RadiantShapes and the optional Skia integration.

## Features

The current source tree includes:

- **Forms and Windows integration** — main and message forms, splash forms, custom title-bar controls, and Windows helpers.
- **DWM and window appearance** — helpers for Windows backdrop effects, blur, dark mode, border color, and rounded corners.
- **Standard FMX controls** — buttons, labels, edit controls, check boxes, radio buttons, panels, lists, trees, menus, progress controls, and related controls.
- **Additional controls and layouts** — custom shapes, page controls, spinners, sprites, layout helpers, and other UI components.
- **Effects and transitions** — FMX visual effects and transition effects.
- **2D and 3D graphics** — shapes, text, viewport and camera-related controls, lights, models, and material sources.
- **Image and text support** — SVG, GIF, WebP, and HTML-text-related units.
- **Utilities** — storage/system information, timers, a stopwatch, brush helpers, network downloads, and media-related functionality.
- **Optional integrations** — BASS-based audio functionality, a Skia4Delphi wrapper, and RadiantShapes wrappers.

The source units are the definitive reference for the available methods, parameters, interface identifiers, and exports.

## Requirements

- Embarcadero **RAD Studio / Delphi with FireMonkey (FMX)**. The project is configured for **Win32** and **Win64**.
- A compatible **RadiantShapes FMX** package if you intend to build the RadiantShapes wrappers. The RadiantShapes implementation itself is **not** included in this repository; only the FMXBridge wrapper/calls are present.
- A compatible **Skia4Delphi** installation if the `SKIA` conditional define is enabled. `FMXBridge.Skia.pas` is the bridge/wrapper; it is not a copy of the complete Skia4Delphi library.
- The optional BASS integration uses BASS resources and binaries under `ThirdParty/Bass`. BASS is subject to its own terms; see [BASS licensing](https://www.un4seen.com/bass.html).

Some optional integrations depend on external packages. If you do not have a dependency, remove the corresponding integration from the project and update its related unit, export, resource, and package references.

## Project structure

| Path | Purpose |
| --- | --- |
| `FMXBridge.dpr` | DLL project source, unit list, architecture suffixes, and resource inclusion. |
| `FMXBridge.dproj` | RAD Studio project settings. |
| `FMX/` | Standard and additional FMX controls, layouts, effects, graphics, media, networking, and 3D interfaces. |
| `Forms/` | Forms, splash screen, title-bar controls, DWM helpers, and Windows utilities. |
| `Custom/` | Custom controls and helpers, including SVG and WebP-related code. |
| `Helpers/` | Additional helper units. |
| `Fix/` | Modified `FMX.Platform.Win.pas` source. It retains Embarcadero's copyright notice and is excluded from the FMXBridge license. |
| `ThirdParty/` | Third-party source, wrappers, resources, and optional integrations. See [third-party notices](THIRD-PARTY-NOTICES.md). |

## Build

1. Open `FMXBridge.dproj` in RAD Studio.
2. Select the `Release` configuration.
3. Select **Win32** and build the project.
4. Select **Win64** and build the project again.

The project defines architecture-specific library suffixes:

- Win32: `FMXBridge_x86.dll`
- Win64: `FMXBridge_x64.dll`

With the output settings in the project file, the expected output directories are `Win32\Release\` and `Win64\Release\`.

The source has not been independently built in a clean environment as part of preparing this README. Build success depends on the installed RAD Studio version and any external packages enabled in the project.

## API model

The DLL exports factory functions with names such as:

- `InitFormHandle` and `InitMsgFormHandle`
- `InitButtonHandle`
- `InitRectangleHandle`
- `InitShadowEffect`
- `InitViewport3DHandle`
- `InitTimer` and `InitStopwatch`

The corresponding units declare interfaces such as `FForm` and `FButton`. These interfaces derive from `IUnknown`; interface methods generally use the `stdcall` calling convention. Parameters can include FMX object handles (`TFmxObject`), Windows handles (`HWND`), Delphi strings such as `WideString`, and FMX-specific types.

When calling the DLL from another host, declarations must match the exported function names, calling conventions, parameter/return types, and interface identifiers. This is a Delphi/FM X interface-based API, not a generic C ABI.

### Inno Setup

To use the DLL from Inno Setup, you need host-side Pascal Script declarations/wrappers that match the exports you intend to call. A complete `.iss` wrapper and demo installer are not included in the current repository snapshot.

## Credits and acknowledgements

FMXBridge is an independent project inspired by existing work in the Delphi and Inno Setup communities. The projects below deserve explicit credit:

- **[ISFMXFW](https://github.com/Jivanewstone/ISFMXFW)** — inspiration for using a DLL to expose FireMonkey functionality to Inno Setup.
- **[FMXComponents](https://github.com/zhaoyipeng/FMXComponents)** by Zhao Yipeng — inspiration for component ideas and approaches. Thank you for the contribution to the FMX community.
- **[BASS](https://www.un4seen.com/)** — audio library and API.
- **[GIFImage for FireMonkey](https://github.com/TomDannert/GIFImage)** by Thomas Dannert — GIF support.
- **[DzHTMLText](https://github.com/digao-dalpiaz/DzHTMLText)** by Rodrigo Depiné Dalpiaz — HTML-formatted text support.
- **[FMXSVG](https://github.com/HemulGM/FMXSVG)** by HemulGM — SVG-related source.
- **[Skia4Delphi](https://github.com/skia4delphi/skia4delphi)** — Skia integration and related wrappers.
- **WebP support** — the original source repository/author could not be identified by the FMXBridge author. If you recognise its origin, please open an issue so the attribution can be corrected.
- **RadiantShapes** — FMXBridge includes wrapper code/calls only, not the RadiantShapes implementation. Users must have the required rights and dependencies to use that package.
- **`FMX.Platform.Win.pas`** — the platform unit was adjusted for FMXBridge. The approach to modifying it was learned from [HemulGM](https://github.com/HemulGM); thanks for sharing your work.

See [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) for a summary of file locations and licensing boundaries. Third-party components retain their own license terms; the FMXBridge license does not replace them.

## Code style

The source intentionally contains very few comments. The author's view is that comments should either tell you something immediately useful—“the green button can be clicked”—or risk becoming an overcomplicated explanation that says less than the code itself.

## License

The MIT license in [`LICENSE`](LICENSE) applies **only to original FMXBridge code authored by audiofeel**. It does not cover third-party code or binaries, the modified Embarcadero platform unit, BASS, or the RadiantShapes package. Review [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) before redistributing the full source tree or a DLL built from it.

The mention of ISFMXFW is an acknowledgement of inspiration, not a claim that its source code is included. If any code has been copied or adapted from that GPL-3.0 project, the license implications for those portions must be assessed separately.

## Status

This repository currently provides the DLL source project and related units. It does not include a prebuilt FMXBridge DLL release, a complete Inno Setup wrapper, a demo host, or an automated build/test workflow.

For questions, corrections, or attribution updates, use [GitHub Issues](https://github.com/audiofeel/FMXBridge/issues).
