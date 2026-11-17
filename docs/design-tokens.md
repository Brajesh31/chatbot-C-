# 🎨 Design Tokens and Runtime Constants

## Current status
The executable has no design-token engine, CSS variables, theme configuration, selectable palette or runtime typography settings. It emits ordinary standard-output text rendered by the user's terminal.

This guide distinguishes visual design values from implementation constants.

## Source constants and text
| Element | Current value/location | Meaning | Visual token? |
|---|---|---|---|
| `INPUT_CAPACITY` | `256` in `chatbot/chatbot.c` | Buffer capacity including NUL | No, input-safety constant |
| Accepted input | 255 bytes | Maximum accepted line | No, behavioral limit |
| Startup message | Literal in `main` | Explains session | No, interface copy |
| Prompt | `You: ` | Identifies input position | No, interface copy |
| Response strings | `response_text` | Fixed replies | No, application content |

## Documentation artwork
SVGs define colors and typography locally. These styles belong only to diagrams, not the executable. Preserve contrast, title/description metadata and meaningful alt text. Run `python3 scripts/validate_docs.py` after asset changes.

## Configuration boundary
There are no runtime environment variables, settings files, theme files, locale selector or external style resources. `.env.example` documents that no application variables are currently required.

## Future policy
If a graphical or themed terminal interface is introduced, define semantic tokens from approved requirements. Each needs a purpose, value, contrast context, owner and verification. Do not transfer SVG colors into runtime behavior by assumption.

Related: [design system](design-system.md), [color system](color-system.md), [typography](typography.md), [configuration](configuration.md).
