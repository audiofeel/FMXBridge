# Third-party notices

FMXBridge is a mixed-source repository. The project license applies only to original code authored by `audiofeel`; it does not supersede the terms of third-party code, binaries, platform source, or external packages.

This file records the origins and licensing boundaries currently identified by the project author. It is not a substitute for each upstream project's license or the applicable vendor agreement.

## Inspirations and acknowledgement

| Project | Role in FMXBridge | Upstream terms / note |
| --- | --- | --- |
| [ISFMXFW](https://github.com/Jivanewstone/ISFMXFW) | Architectural inspiration for exposing FMX functionality to Inno Setup through a DLL. | Upstream repository is GPL-3.0. It is acknowledged as inspiration; its source is not intended to be included in FMXBridge. If code was copied or adapted, the affected portions need a separate GPL compliance review. |
| [FMXComponents](https://github.com/zhaoyipeng/FMXComponents) | Ideas and component approaches. | Upstream repository uses MIT. This is an acknowledgement of inspiration; check individual files before assuming any code is included. |

## Integrated or vendored components

### BASS — Un4seen Developments

- Upstream: https://www.un4seen.com/
- Related files: `ThirdParty/Bass/`, including `Win32/bass.dll`, `Win64/bass.dll`, the resource scripts, and compiled `.res` resources that embed the BASS binaries. The FMXBridge-side adapter is in `FMXBridge.Bass.pas`; `DynamicBass.pas` provides Pascal-side declarations/loading support. Any original wrapper code authored by audiofeel remains subject to the root `LICENSE`, but that does not grant rights to the BASS engine.
- License: BASS is governed by Un4seen's own terms. Free use is subject to the vendor's stated conditions; commercial use requires an applicable license. The vendor also states that BASS licenses do not cover publishing other people's software and that resale/sublicensing is not permitted.
- The FMXBridge MIT license does not cover the BASS binaries or grant downstream developers a BASS license. Review the current [official BASS licensing terms](https://www.un4seen.com/bass.html) before using or redistributing the related functionality.

### GIFImage for FireMonkey — Thomas Dannert

- Upstream: https://github.com/TomDannert/GIFImage
- Third-party source: `ThirdParty/GIF/FMX.GIFImage.pas`. `ThirdParty/GIF/FMXBridge.GIFImage.pas` is the FMXBridge adapter; the root license applies to that adapter only to the extent that its code was authored by audiofeel and is not derived from third-party code.
- The vendored `FMX.GIFImage.pas` source header identifies the GNU Lesser General Public License (LGPL), while the upstream repository currently has a GPL-3.0 `LICENSE` file. Because those notices do not agree, the applicable terms for the exact vendored snapshot should be confirmed against its originating revision or with the maintainer. Do not treat this unit as covered by the FMXBridge MIT license.

### DzHTMLText — Rodrigo Depiné Dalpiaz

- Upstream: https://github.com/digao-dalpiaz/DzHTMLText
- Third-party source: `ThirdParty/HTML/`. `ThirdParty/FMXBridge.HTMLText.pas` is the FMXBridge adapter; the root license applies to original audiofeel-authored portions of that adapter.
- Upstream `LICENSE.md` specifies the MIT License. Retain the original copyright and license notices in any redistributed copies of that component's code.

### FMXSVG — HemulGM

- Upstream: https://github.com/HemulGM/FMXSVG
- Third-party source: the upstream SVG parser/renderer/types/control files under `Custom/SVG/`. `Custom/SVG/FMXBridge.SVGImage.pas` is the FMXBridge adapter; the root license applies to original audiofeel-authored portions of that adapter.
- Upstream repository specifies the MIT License. Retain the original copyright and license notices in any redistributed copies of that code.

### WebP support

- Related files: `Custom/WebP/`, including `FMXBridge.WebPImage.pas` and codec/decoder/encoder units. The FMXBridge author has not been able to identify the original source repository or author of the WebP implementation. Therefore the origin and license of the vendored codec code remain unverified. The root MIT license applies to the adapter only to the extent it is original audiofeel-authored code; it does **not** cover unknown-origin implementation code. Anyone redistributing those units should establish their provenance and applicable license first; attribution updates are welcome via GitHub Issues.

### Skia4Delphi

- Upstream: https://github.com/skia4delphi/skia4delphi
- Related file: `ThirdParty/FMXBridge.Skia.pas` is the FMXBridge bridge/wrapper unit. The complete Skia4Delphi library is not vendored here; the conditional integration depends on the installed Skia4Delphi packages/units. The wrapper itself is covered by the root license to the extent that its code is original and authored by audiofeel.
- Upstream Skia4Delphi repository specifies the MIT License. That license applies to Skia4Delphi's own code, not automatically to FMXBridge's wrapper code or other included files. Retain upstream notices wherever upstream code is included.

### RadiantShapes

- Related file: `ThirdParty/FMXBridge.RadiantShapes.pas`, which is an FMXBridge wrapper and is covered by the root license to the extent that its code is original and authored by audiofeel.
- This repository contains FMXBridge wrappers/calls that reference `Radiant.Shapes`; it does **not** contain the RadiantShapes implementation. The external package and its use are subject to the applicable vendor/Embarcadero terms and any license required to obtain the package.

### Embarcadero FireMonkey platform source

- Related file: `Fix/FMX.Platform.Win.pas`.
- This is a modified copy of the Embarcadero FireMonkey Windows platform unit and retains its Embarcadero copyright and “All rights reserved” notice. It is explicitly excluded from the FMXBridge MIT license. Use and redistribution must comply with the applicable RAD Studio license and Embarcadero's distribution requirements; see [Embarcadero's Software License Requirements](https://docwiki.embarcadero.com/RADStudio/Athens/en/Software_License_Requirements).

## License for original FMXBridge code

See the root `LICENSE` file. It applies only to the original code authored by `audiofeel`, subject to the exclusions described above and in this file. No license is granted here for third-party software or components whose terms are controlled by someone else.
