# Modules

This directory contains the files required to build and run the FMXBridge demos that use Skia4Delphi.

## Required files

- `FMXBridge_x86.dll` — 32-bit FMXBridge library with Skia integration.
- `FMXBridge_x64.dll` — 64-bit FMXBridge library with Skia integration.
- `sk4d_x86.dll` — 32-bit Skia4Delphi native library.
- `sk4d_x64.dll` — 64-bit Skia4Delphi native library.

## Setup

The DLL binaries are not checked into the Git repository. The [FMXBridge v0.8 release](https://github.com/audiofeel/FMXBridge/releases/tag/v0.8) includes the prebuilt FMXBridge x86 and x64 DLLs and the demo package. Skia4Delphi's native runtime DLLs must be obtained separately unless they are already included in your local package.

To prepare this directory:

1. Download and extract `FMXBridge-Release.7z` from the v0.8 release.
2. Copy the matching `sk4d_x86.dll` and `sk4d_x64.dll` files from your Skia4Delphi installation into this directory.
3. If you are building FMXBridge from source instead, build for both Win32 and Win64 with the required Skia4Delphi integration enabled, then copy the resulting FMXBridge DLLs into this directory.

Make sure all DLLs match the architecture of the Inno Setup process that loads them.

The demo scripts expect these files to be available in `Examples/Skia/Modules/`.

See the [Skia4Delphi project](https://github.com/skia4delphi/skia4delphi) for installation instructions and additional requirements.
