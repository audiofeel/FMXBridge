# Modules

This directory is intended to contain the files required to build and run the FMXBridge demo installers.

## Required files

- `FMXBridge_x86.dll` — 32-bit FMXBridge library.
- `FMXBridge_x64.dll` — 64-bit FMXBridge library.

## Setup

The DLL binaries are not included in this repository due to their size and GitHub file-size limitations.

To use the demos:

1. Build FMXBridge in RAD Studio for both Win32 and Win64.
2. Copy the resulting DLLs into this directory, using the filenames listed above.

Make sure the DLL architecture matches the Inno Setup process that loads it.

The demo scripts expect these files to be available in the `Examples/Modules/` directory.
