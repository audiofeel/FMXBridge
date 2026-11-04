# Skia Cursor Text Glow

An isolated FMXBridge test for a cursor-following light field across a Skia scene, with a separate outer-shadow treatment for the main heading.

## Shared cursor light

\`FSkPaintBox.SetCursorLightShader\` adds a cached light paint to each supported paint-backed geometry/text command. The copied paint retains its stroke/fill style, stroke width, cap, join, anti-aliasing and alpha; its color is replaced with a neutral tint and a shared radial shader is applied.

The light pass uses the original command geometry and is drawn immediately after that command, preserving z-order. It therefore follows:

- \`AddDrawSimpleText\` and \`AddDrawTextBlob\` glyph contours;
- rectangles and rounded rectangles, including stroke-only custom borders;
- circles, arcs and paths.

The mouse event updates one radial shader in the coordinate space of the full paint box. The same shader drives every supported command in the scene, not just the title.

## Main title

The heading is placed on a separate paint box so its foreground glyphs are not included in the general tint pass.

Three text passes are drawn in order: a subtle fixed outer shadow, a cursor-colored outer blur using \`FSkPaint.MaskFilter(skbsOuter, ...)\`, and the crisp white text face. The moving highlight therefore illuminates the soft silhouette around the letters rather than painting the letters themselves.

## Scope

This light pass is for geometry and text recorded through \`FSkPaintBox\` paint-backed commands. Independently rendered FMX controls (for example, standalone \`FText\`, \`FLabel\`, or \`FSkLabel\` controls), paragraph commands and image commands are not automatically captured by this paint box and need their own rendering path.
