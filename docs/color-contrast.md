# 🎨 Color and Contrast Applicability

## Product terminal

The application prints ordinary text and does not emit ANSI color, status badges, colored warnings, or background fills. Its foreground/background contrast is controlled by the user's terminal theme.

## Repository graphics

SVG diagrams use color to separate visual groups. They also include labels, arrows, and text descriptions so meaning is not conveyed by color alone. The assets should remain understandable when viewed in grayscale or with color-vision differences.

## Review guidance

- Keep diagram labels explicit.
- Use sufficient contrast between text and its immediate background.
- Do not use red/green alone to signal success or failure.
- Ensure arrow direction and node names remain legible at README display size.
- Retain descriptive SVG title and desc elements.
- Provide meaningful alt text for embedded assets.

## Verification status

The current SVG validator checks XML validity and the presence of title and desc elements. It does not calculate contrast ratios or provide a formal color-vision simulation. No numeric contrast compliance claim is made.
