# ♿ Accessibility Guidelines

The product is a plain-text terminal program, not a web page or mobile interface. Accessibility work should focus on readable text, predictable interaction, and compatibility with assistive terminal environments.

## Current design choices
- Prompts and responses are textual.
- Meaning is not conveyed by color alone.
- There are no mouse-only controls.
- Input is line-oriented through standard input.
- The program does not emit decorative animation or rapidly updating output.

## Limitations
There is no configurable text size, speech output, localization, terminal capability detection, or explicit screen-reader integration. Actual accessibility depends partly on the user's terminal and assistive technology.

Review the application in a plain terminal, check that prompts remain understandable without color, and avoid introducing control sequences that disrupt assistive tools.
