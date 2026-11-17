# ♿ Accessibility Guide

## Product surface

This repository ships a line-oriented terminal program. It does not contain a browser UI, mobile screens, graphical controls, or a web document. Accessibility work should therefore be grounded in terminal interaction and the actual assistive technology environments available to users.

## Current accessibility characteristics

| Characteristic | Current behavior | Limitation |
|---|---|---|
| Text output | Prompts and replies are ordinary stdout text | No user-configurable output format |
| Color dependence | Meaning is not conveyed through color | Terminal theme can still affect readability |
| Interaction | Standard input and Enter | No built-in key rebinding or history |
| Reading order | Output is emitted sequentially | No formal assistive-technology test matrix |
| Motion | No animation or screen refresh behavior | None relevant to the current CLI |
| Language | English fixed strings | No localization or language selection |

## Practical guidance

- Keep prompts explicit and avoid abbreviations that rely on context.
- Do not use terminal color as the only indicator of warnings or state.
- Avoid cursor-positioning escape sequences and animated terminal output.
- Keep error messages near the action that caused them.
- Preserve a predictable line-oriented input model.
- Describe EOF and the exact exit command clearly.
- Verify that documentation screenshots or visual diagrams also have text descriptions.

## Testing

Use the checklist in [accessibility testing](accessibility-testing.md). Record terminal emulator, operating system, assistive technology/version, reproduction steps, and observed results. No formal WCAG conformance or screen-reader certification is claimed. WCAG 2.2 AA is not directly a conformance target for this command-line executable.

## Related material

See [accessibility guidelines](accessibility-guidelines.md), [keyboard interaction](keyboard-navigation.md), and [screen-reader notes](screen-reader-support.md).
