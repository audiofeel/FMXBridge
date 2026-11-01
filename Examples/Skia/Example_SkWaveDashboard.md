# Skia Wave Dashboard

This is a standalone visual demo displayed in a separate borderless top-level FMX form. It does not install files, extract archives, launch redistributables or use Inno Setup installation events to drive its progress.

## Pages

1. **Configure** — rotating wireframe sphere and a short description of the visual modules.
2. **Simulation** — animated resource graph with CPU/RAM/DISK selectors and a multi-layer liquid-wave progress indicator.
3. **Complete** — the sphere returns and a SkSL checkmark marks the end of the timed cycle.

The primary button starts the simulation, pauses/resumes it, and restarts it from the completed page. The secondary button returns to the first page or exits the demo.

## SkSL effects

- The sphere is generated from a spherical coordinate field. Latitude, longitude and diagonal mesh lines rotate over time; their intersections form the glowing nodes.
- The resource graph is generated in the shader and animated independently. The tabs select CPU, RAM or disk presentation.
- The progress field contains three moving liquid ribbons with separate wave profiles, highlights and a moving leading edge.

## Timer and animation

The progress percentage is advanced by the FMXBridge `FTimer` wrapper at a 50 ms interval. Each tick updates the `uProgress` shader uniform and the percentage label. The timer can be paused and resumed from the UI.

The continuous sphere, graph and wave motion uses the Skia animation clock supplied as `iTime`. The timer does not drive the shader animation and does not simulate Inno Setup progress.

## Files

- `Example_SkWaveDashboard.iss`
- `Files/Shaders/wave-dashboard.sksl`

## Build

Use the matching FMXBridge and Skia4Delphi DLL pair in `Examples/Skia/Modules/`. The demo uses the existing FMXBridge `FTimer` wrapper; no additional timer unit or WinAPI declarations are required. The example targets x64 by default; change `SetupArchitecture` to x86 to test the 32-bit pair. The included wrapper requires Inno Setup 7.0.0 or newer.
