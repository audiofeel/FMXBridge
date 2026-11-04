# Skia Cursor Text Glow

A small isolated FMXBridge test for the cursor-following red highlight shown in the reference recording.

## How it works

- \`FSkTypeface.FCreateFromFile\` loads the bundled Orbitron font directly into Skia. It does not register the font system-wide.
- \`FSkPaintBox.AddDrawSimpleText\` draws the title three times at the same baseline: white base text, a wide radial tint, and a smaller bright radial highlight.
- Each glow pass uses an \`FSkPaint\` with an \`FSkShader.MakeGradientRadial\` shader. Skia applies the paint shader only where the glyphs are covered, so the red highlight follows the letter shapes instead of drawing a rectangular overlay.
- A transparent FMX \`FText\` control receives mouse move/leave events. It has the same bounds as the Skia canvas, so its local mouse coordinates are also the shader coordinates.
- The draw commands are created once. On mouse movement, the two radial shaders are updated and \`FSkPaintBox.DoDrawing\` requests a redraw.

No Runtime Shader, custom glyph mask, DLL modification, or form modification is required.
