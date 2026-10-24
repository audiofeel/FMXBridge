# Modules

This directory contains the files required to build and run the FMXBridge demos that use Skia4Delphi.

## Required files

- `FMXBridge_x86.dll` — 32-bit FMXBridge library.
- `FMXBridge_x64.dll` — 64-bit FMXBridge library.
- `sk4d_x86.dll` — 32-bit Skia4Delphi native library.
- `sk4d_x64.dll` — 64-bit Skia4Delphi native library.

## Setup

The DLL binaries are not included in this repository due to their size and GitHub file-size limitations.

To prepare this directory:

1. Build FMXBridge for both Win32 and Win64 with the required Skia4Delphi integration enabled.
2. Copy the resulting FMXBridge DLLs into this directory, using the filenames listed above.
3. Obtain the matching `sk4d_x86.dll` and `sk4d_x64.dll` binaries from your Skia4Delphi installation and copy them into this directory.

Make sure all DLLs match the architecture of the Inno Setup process that loads them.

The demo scripts expect these files to be available in `Examples/Skia/Modules/`.

See the Skia4Delphi project for installation instructions and additional requirements: https://github.com/skia4delphi/skia4delphi
