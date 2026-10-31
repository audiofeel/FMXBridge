# Skia Installer Scene

This example demonstrates a wide, animated liquid-wave progress field rendered by a SkSL runtime shader. The shader is the central visual element of the installer scene.

## Wave progress field

- The filled horizontal extent is driven by the actual `uProgress` value.
- `CurInstallProgressChanged(CurProgress, MaxProgress)` supplies the Inno Setup progress ratio. No timer-generated or simulated percentage is used.
- The upper waterline and two internal wave ridges move continuously through `iTime`. Their motion continues while Setup is temporarily not reporting a new progress value; the filled extent remains unchanged.
- The advancing liquid front follows the measured progress and has only a small visual oscillation. That oscillation does not alter the percentage supplied by Setup.
- The color palette changes with the installation stage: ready, installing, finalizing and completed.

The previous circular gauge and the separate flat progress strip have been removed. The wave field is the only progress visualization.

## Interaction

- The FSkAnimatedPaintBox fills the borderless FMX form and has mouse interaction enabled. The form has no FMX titlebar component.
- Install, Cancel, Finish, Close, Exit and Stay surfaces are painted by SkSL; Pascal Script hit-tests the same coordinate regions and performs the corresponding hidden Inno Setup actions.
- Button captions are ordinary FMX text overlays. The shader does not contain a hand-written bitmap font.
- Hover feedback uses the system `iMouse` uniform; pressed states use `uPressedButton`.
- Install invokes the hidden wizard's `NextButton.OnClick` while it is on `wpReady`.
- Finish invokes the same hidden wizard action from `wpFinished`.
- Cancel opens a confirmation panel drawn in SkSL. Confirming invokes `CancelButton.OnClick`; `CancelButtonClick` suppresses the native confirmation dialog.

The setup disables the optional Welcome, Directory and Program Group pages and hides the Ready memo. The Ready and Finished wizard states are retained internally because the SkSL-painted controls advance the normal Inno Setup state machine. `FCreateImageForm` creates a borderless top-level FMX form; the native Setup window remains hidden. The top strip starts window dragging.

## Event mapping

- `CurPageChanged(wpReady)` — ready state; the SkSL Install and Cancel surfaces are available.
- `CurStepChanged(ssInstall)` — actual installation phase starts.
- `CurInstallProgressChanged(CurProgress, MaxProgress)` — actual native Setup progress, displayed as `CurProgress / MaxProgress`.
- `CurStepChanged(ssPostInstall)` — file and registry operations have finished; the scene enters finalization.
- `CurPageChanged(wpFinished)` — successful installation; the SkSL Finish surface appears.

`CurInstallProgressChanged` reports Inno Setup's own operations. It does not provide separate progress for custom archive extraction or a child redistributable launched with `Exec`. Those operations require progress callbacks from the code that performs them; this example does not invent external progress.

## Test payload

The `[Files]` entries copy four existing FMXBridge sample assets to `{tmp}\FMXBridgeSkiaScene` and remove them after Setup. This creates real Setup work without installing application files on the machine.

## Files

- `Example_SkInstallerScene.iss`
- `Files/Shaders/installer-scene.sksl`
- Existing sample payload: two fonts, one SVG and one Lottie JSON asset.

## Build

Use the matching FMXBridge and Skia4Delphi DLL pair described in `Examples/Skia/Modules/README.md`. The sample targets x64 by default; change `SetupArchitecture` to x86 to test the 32-bit pair.

The included `FMXBridgeHandle.iss` has a compile-time guard requiring Inno Setup 7.0.0 or newer.
