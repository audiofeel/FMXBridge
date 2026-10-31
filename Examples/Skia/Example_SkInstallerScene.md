# Skia Installer Scene

This example uses one SkSL-rendered interface for the complete visible installer window. There are no visible Inno Setup buttons and no FMX button controls. Install, Cancel, Finish and the cancellation-confirmation buttons are vector shapes and bitmap-glyph labels drawn directly by the runtime shader.

## Interaction

- The FSkAnimatedPaintBox fills the FMX form and has mouse interaction enabled.
- OnMouseDown and OnMouseUp pass pointer coordinates to Pascal Script. Hit testing uses the same button rectangles that the shader draws.
- Hover feedback uses the system iMouse uniform; pressed states use the uPressedButton uniform.
- Install invokes the hidden wizard's NextButton.OnClick while it is on wpReady.
- Finish invokes the same hidden wizard action from wpFinished.
- Cancel opens a confirmation panel drawn in the shader. Confirming invokes CancelButton.OnClick; CancelButtonClick suppresses the native confirmation dialog.

The setup disables the optional Welcome, Directory and Program Group pages and hides the Ready memo. The Ready and Finished wizard states are retained internally because the SkSL buttons advance the normal Inno Setup state machine. FCreateBlankForm creates the top-level FMX form and hides the native Setup window.

## Event mapping

- CurPageChanged(wpReady) — ready state; the SkSL Install and Cancel buttons are available.
- CurStepChanged(ssInstall) — actual installation phase starts.
- CurInstallProgressChanged(CurProgress, MaxProgress) — actual native Setup progress, displayed as CurProgress / MaxProgress.
- CurStepChanged(ssPostInstall) — file and registry operations have finished; the scene enters finalization.
- CurPageChanged(wpFinished) — successful installation; the SkSL Finish button appears.

CurInstallProgressChanged reports Inno Setup's own operations. It does not provide separate progress for custom archive extraction or a child redistributable launched with Exec. Those operations require progress callbacks from the code that performs them; this example does not invent external progress.

## Test payload

The [Files] entries copy four existing FMXBridge sample assets to {tmp}\FMXBridgeSkiaScene and remove them after Setup. This creates real Setup work without installing application files on the machine.

## Files

- Example_SkInstallerScene.iss
- Files/Shaders/installer-scene.sksl
- Existing sample payload: two fonts, one SVG and one Lottie JSON asset.

## Build

Use the matching FMXBridge and Skia4Delphi DLL pair described in Examples/Skia/Modules/README.md. The sample targets x64 by default; change SetupArchitecture to x86 to test the 32-bit pair.

The included FMXBridgeHandle.iss has a compile-time guard requiring Inno Setup 7.0.0 or newer.
