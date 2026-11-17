# 🌈 Color System

## Runtime behavior
The executable does not emit ANSI color sequences, set terminal colors or use color to signal meaning. Prompts, responses and warnings are plain text. The terminal theme controls colors.

## Semantic output
| Output | Indicator | Color dependency |
|---|---|---|
| Prompt | Literal `You:` label | None |
| Normal reply | Chatbot prefix and response text | None |
| Input warning | Explicit warning sentence | None |
| Shutdown | Goodbye or input-closed sentence | None |

## Documentation artwork
The logo, banner and diagrams use local SVG colors. These are not runtime design tokens and do not imply light/dark theme support.

## Accessibility requirements
- Warnings must not be identifiable only by red color.
- Keep warning wording explicit.
- Preserve readable contrast in SVGs.
- Include accessible SVG title/description and meaningful alt text.

If colored output is proposed, record a decision and test color-disabled terminals, limited-color terminals and screen-reader workflows. Provide plain-text fallback. Related: [color contrast](color-contrast.md), [branding](branding-guidelines.md), [design tokens](design-tokens.md), [accessibility](accessibility.md).
