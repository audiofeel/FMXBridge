# FMXBridge GIF module

## Goal

Replace the vendored Tom Dannert `TGIFImage` implementation with an FMXBridge-owned GIF image control. The control must keep the normal FMX control behavior and playback operations while GIF preparation must not stall the main FMX thread.

## Target

- RAD Studio 13.2 Florence, Windows 10/11, Win32 and Win64.
- Decoder backend: Windows Imaging Component (WIC).
- Animation scheduling: a `TAnimation` descendant driven by the FMX Display Link Service.
- No `TTimer` for GIF playback.
- The worker thread may use WIC and CPU-owned byte buffers only. It must not access `TFmxObject`, `TBitmap`, a canvas, or other FMX objects.
- The main FMX thread owns the control, its current `TBitmap`, painting, events, and animation clock.

## Proposed units

| Unit | Responsibility |
|---|---|
| `Custom/GIF/FMXBridge.GIF.Types.pas` | Frame metadata and CPU-owned frame packet types |
| `Custom/GIF/FMXBridge.GIF.WIC.pas` | WIC file/frame decoding and GIF metadata extraction |
| `Custom/GIF/FMXBridge.GIF.Compositor.pas` | GIF canvas composition, transparency, and disposal methods |
| `Custom/GIF/FMXBridge.GIF.Worker.pas` | Background decode producer and bounded frame queue |
| `Custom/GIF/FMXBridge.GIF.Animation.pas` | `TAnimation` descendant; time-based frame selection through Display Link |
| `Custom/GIF/FMXBridge.GIFImage.pas` | FMX `TGIFImage` control and playback API |
| `Custom/FMXBridge.GIFImage.pas` | FMXBridge/Inno Setup adapter after the control is validated |

## Data flow

1. `LoadFromFile` validates the request, starts a worker, and returns.
2. The worker opens WIC, reads metadata, decodes the next raw frame to premultiplied BGRA, composes it into a CPU canvas, and places the completed frame in a bounded queue.
3. The `TGIFImage` animation object is a `TAnimation` descendant. FMX calls its `ProcessAnimation` through the Display Link animation machinery.
4. On the main thread, the animation object reads an available frame packet, updates the owned `TBitmap`, and invalidates the control.
5. If the worker is behind, the last displayed frame remains visible. The UI thread never waits for decoding.
6. The queue is bounded so a large GIF cannot allocate one full RGBA bitmap per source frame without limit.

## Correctness requirements

- GIF frame rectangles and logical-screen dimensions are distinct.
- Frame disposal methods 0/1, 2 and 3 must be handled.
- Transparency must be preserved in premultiplied BGRA.
- Frame delays are stored in milliseconds; zero/very small delays require an explicit policy and tests.
- The animation clock uses elapsed high-resolution time and must not advance one frame blindly per display tick.
- Stop/pause must preserve the current frame; loop and speed behavior must be deterministic.
- Destruction cancels the worker, waits for it to leave WIC, and only then releases the shared queue/state.
- Exceptions from WIC are transferred to the main thread as load errors; no exception crosses a thread boundary.

## Implementation and validation stages

1. Implement and validate WIC metadata/frame extraction without FMX objects.
2. Implement and validate the CPU compositor against disposal/transparency test GIFs.
3. Add the worker and bounded queue; verify the UI remains responsive while large GIFs are decoded.
4. Add the Display Link animation clock and the FMX control.
5. Replace the current adapter and add an Inno Setup demo.
6. Test Win32 and Win64, multiple reloads, component destruction during loading, pause/resume, speed, loop, and malformed GIFs.

## Licensing

The new decoder/compositor/control are to be authored independently. The new implementation must not copy the Tom Dannert source file. WIC is a Windows platform API. The old vendored source and its license notices remain untouched until the replacement is validated and the old dependency can be removed.
