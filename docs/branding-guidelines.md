# 🎨 Repository Branding Guidelines

## Identity

The visual identity is for the repository and its technical documentation, not an in-app theme. The original logo and banner use a dark terminal motif with cool cyan and blue accents to connect the visual presentation to the C console project.

## Assets

| File | Role | Use |
|---|---|---|
| docs/assets/logo.svg | Small project mark | README identity |
| docs/assets/project-banner.svg | Wide hero illustration | README opening |
| docs/assets/architecture-overview.svg | Technical visual | Architecture explanation |
| docs/assets/cli-sequence.svg | Illustrative transcript | Demonstrate a real supported interaction |

## Usage rules

- Preserve aspect ratio.
- Use the SVG's embedded title and description.
- Provide meaningful alt text in Markdown/HTML.
- Keep decorative marks secondary to technical explanations.
- Avoid unrelated stock imagery and unsupported product mockups.
- Do not create fake user interface screenshots.
- Clearly label illustrative terminal transcripts as illustrations rather than captures.

## Colors and typography

The SVG assets use local color definitions for their own diagrams. Those colors are not C application theme tokens. The terminal program uses ordinary text output and inherits visual styling from the terminal emulator.

## Change process

A branding update should preserve readability at small sizes, verify SVG rendering, check contrast within the asset, update README references, and run the asset validator.
