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

procedure BeginUniformUpdate; stdcall;
procedure EndUniformUpdate; stdcall;

function SetUniformInt(const UniformName: WideString;
  Value: Integer): Boolean; stdcall;

function SetUniformInt2(const UniformName: WideString;
  X, Y: Integer): Boolean; stdcall;

function SetUniformInt3(const UniformName: WideString;
  X, Y, Z: Integer): Boolean; stdcall;

function SetUniformInt4(const UniformName: WideString;
  X, Y, Z, W: Integer): Boolean; stdcall;
```

Each setter returns `True` only when a shader is loaded and the named uniform exists with the matching scalar/vector type. Uniform arrays are not accepted by these setters. Integer setters accept `int`, `int2`, `int3` and `int4` uniforms respectively.

`BeginUniformUpdate` / `EndUniformUpdate` group multiple setter calls. Uniform values are written to the runtime-shader builder immediately, but repaint requests are deferred until the outermost `EndUniformUpdate`. Nested update blocks are supported. An `EndUniformUpdate` without a matching `BeginUniformUpdate` is ignored. If no successful setter call occurred inside the block, no repaint is requested.

`iResolution`, `iTime`, `iTimeDelta` and `iMouse` are reserved system uniforms. The draw callback refreshes `iResolution` from the actual destination rectangle (`float2`, `float3`, `int2` and `int3` are supported), supplies `iTime` from the Skia animation clock, and calculates `iTimeDelta` from consecutive animation-clock values. When `InteractWithMouse(True)` is enabled, the mouse callback updates `iMouse` (`float2` or `float4`) and requests a repaint. These values cannot be changed with the public setters.

Outside a batch, each successful setter calls `TSkAnimatedPaintBox.Repaint`. Inside a batch, the wrapper issues one repaint request when the outermost update block ends and at least one setter succeeded. Skia's animated control invokes its draw callback on an ordinary repaint too, so the new parameters are applied even when the animation is stopped. No timer or animation restart is required.

Call the methods on the FMX UI thread. They are not designed for concurrent calls from worker threads.

## Demo checks

- `NEXT PRESET` updates float, float2, float3, float4 and integer uniforms (`int`, `int2`, `int3`, `int4`) inside one batch, producing one repaint request after all assignments. The integer values control the visual mode, grid dimensions, individual effects and palette.
- `STOP ANIMATION` / `START ANIMATION` toggles the shader clock.
- With animation stopped, `NEXT PRESET` still changes the rendered composition.
- To test `iMouse`, enable `InteractWithMouse(True)` on a dedicated paint box. This demo intentionally disables mouse hit testing on its full-size background so the buttons remain clickable.
- While animation runs, the thin lower indicator reflects `iTimeDelta`; it is zero on the first frame after loading or restarting.
- `TEST VALIDATION` checks that mismatched float/integer types, an unknown uniform name and reserved `iTime`, `iResolution` and `iTimeDelta` are rejected.

## Build

Place this script under `Examples/Skia/`. It uses the existing files in `Examples/Skia/Modules/`, and expects `Files/setup.ico` plus the new shader at `Files/Shaders/runtime-uniforms.sksl`.

The project DLLs and matching `sk4d.dll` must be built/copied as described in `Examples/Skia/Modules/README.md`.

The source changes have not been compiled or run in RAD Studio/Inno Setup as part of this update. The behavior must be confirmed in the user's Delphi/Inno Setup test environment.
