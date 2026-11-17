# 🔤 Typography and Terminal Text

## Rendering ownership
The chatbot does not bundle or select a font. The terminal emulator chooses font family, size, ligatures, line spacing and text rendering. The C program emits narrow-character strings through standard I/O. SVG font declarations apply only to documentation art.

## Current characteristics
| Area | Behavior | Limitation |
|---|---|---|
| Character output | Narrow C strings | No wide-character UI |
| Language | Fixed English phrases | No localization |
| Normalization | `tolower` over input bytes | Not Unicode case folding |
| Input limit | 255 bytes | Not 255 visible characters |
| Line wrapping | Standard output | Terminal controlled |
| Font | Terminal configured | Not application configurable |

## Content guidance
- Prefer short, direct prompts and responses.
- Keep punctuation and capitalization consistent.
- Avoid decorative box-drawing characters in runtime output.
- Do not assume a particular font or glyph coverage.
- Keep warnings understandable with custom terminal themes.
- Test source encoding, compiler, terminal and platform if non-ASCII text is added.

No font files are included. Localization needs a deliberate encoding plan and platform tests. Related: [color system](color-system.md), [accessibility](accessibility.md), [compatibility](compatibility.md), [CLI UX](cli-ux-guidelines.md).
