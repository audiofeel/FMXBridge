# Skia Runtime Uniforms

This demo exercises the typed runtime-uniform API added to `FSkAnimatedPaintBox`.

## New API

The following methods were appended to the existing `FSkAnimatedPaintBox` interface:

```pascal
function SetUniformFloat(const UniformName: WideString;
  Value: Single): Boolean; stdcall;

function SetUniformFloat2(const UniformName: WideString;
  X, Y: Single): Boolean; stdcall;

function SetUniformFloat3(const UniformName: WideString;
  X, Y, Z: Single): Boolean; stdcall;

function SetUniformFloat4(const UniformName: WideString;
  X, Y, Z, W: Single): Boolean; stdcall;
```

Each method returns `True` only when a shader is loaded and the named uniform exists with the matching scalar/vector type. Uniform arrays are not accepted by these four setters.

`iTime` is reserved: `OnAnimDrawAdapter` supplies it from the Skia animation clock on every draw, so a user assignment would be overwritten. The other uniforms in the test shader are user-controlled.

After setting a value, the wrapper calls `TSkAnimatedPaintBox.Repaint`. Skia's animated control invokes its draw callback on an ordinary repaint too, so the new parameter is applied even when the animation is stopped. No timer or animation restart is required.

Call the methods on the FMX UI thread. They are not designed for concurrent calls from worker threads.

## Demo checks

- `NEXT PRESET` updates float, float2, float3 and float4 uniforms.
- `STOP ANIMATION` / `START ANIMATION` toggles the shader clock.
- With animation stopped, `NEXT PRESET` still changes the rendered composition.
- `TEST VALIDATION` checks that a mismatched type, unknown name and automatic `iTime` are rejected.

## Build

Place this script under `Examples/Skia/`. It uses the existing files in `Examples/Skia/Modules/`, and expects `Files/setup.ico` plus the new shader at `Files/Shaders/runtime-uniforms.sksl`.

The project DLLs and matching `sk4d.dll` must be built/copied as described in `Examples/Skia/Modules/README.md`.

The demo has not been compiled or run in RAD Studio/Inno Setup as part of this change. Source-level API correspondence was checked against the FMXBridge wrapper and Skia4Delphi's `ISkRuntimeShaderBuilder.SetUniform` overloads.
