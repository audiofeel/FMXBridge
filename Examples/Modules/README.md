# Modules

This directory is intended to contain the files required to build and run the FMXBridge demo installers.

## Required files

- `FMXBridge_x86.dll` — 32-bit FMXBridge library.
- `FMXBridge_x64.dll` — 64-bit FMXBridge library.

## Setup

The DLL binaries are not checked into the Git repository. Prebuilt x86 and x64 DLLs are included in the [FMXBridge v0.8 release](https://github.com/audiofeel/FMXBridge/releases/tag/v0.8).

To use the standard demos:

1. Download and extract `FMXBridge-Release.7z` from the v0.8 release.
2. Use the included files to compile the demo scripts in Inno Setup.

If you are building FMXBridge from source instead, build the project in RAD Studio for both Win32 and Win64, then copy the resulting DLLs into this directory using the filenames listed above.

Make sure the DLL architecture matches the Inno Setup process that loads it.

The demo scripts expect these files to be available in the `Examples/Modules/` directory.
