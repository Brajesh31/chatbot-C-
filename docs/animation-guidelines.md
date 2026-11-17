# 🎞️ Animation and Motion Guidelines

## Current behavior
The C executable has no animation, progress bar, spinner, blinking cursor control, timed transition, audio or screen redraw. It writes a prompt, waits for a line and prints a response. It does not query motion preferences. SVG diagrams are static documentation assets.

## Why static output is preferred
- Predictable interaction and readable redirected output.
- No terminal escape-sequence assumptions.
- No unnecessary flashing or distraction.
- Simpler automated interaction tests.

## Future terminal effects
Any effect must solve a real user problem, have a plain-text fallback, stop promptly, avoid rapid flashing, work when stdout is redirected and be tested in non-interactive mode.

## GUI motion
Reduced-motion settings and animation curves are not applicable until a graphical interface exists. If introduced, document framework support and verify OS reduced-motion preferences. Related: [CLI UX](cli-ux-guidelines.md), [accessibility](accessibility.md), [design system](design-system.md).
