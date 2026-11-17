# 🖥️ UI and UX Guidelines

## Actual product interface

The only product interface is a line-oriented terminal conversation. There is no web page, mobile screen, desktop window, navigation bar, graphical component tree, responsive breakpoint, or animated UI.

## Terminal interaction principles

1. Print an opening message that explains the supported exit command.
2. Print a clear prompt before waiting for user input.
3. Flush stdout after the prompt so it is visible in interactive use.
4. Use short and understandable responses.
5. Keep warning messages distinct from normal chatbot replies.
6. Do not rely on color, icons, cursor positioning, or animation to communicate meaning.
7. Preserve predictable one-line input behavior.
8. Explain EOF and the maximum input length.
9. Keep sample transcripts synchronized with the source.

## Current interaction limitations

There is no command parser, built-in history, line editor, menu system, language selector, speech interface, theme switcher, or user preference store. Terminal editing is provided by the user's terminal environment.

## Frontend documentation applicability

A web or mobile design system, design tokens, component library, responsive design rules, page documentation, and animation guidelines are not active artifacts for this codebase. They should be added only if an actual graphical client is introduced. Do not create screenshots of screens that do not exist.

## Related guidance

See [CLI UX guidelines](cli-ux-guidelines.md), [accessibility](accessibility.md), [branding](branding-guidelines.md), and [visual asset policy](assets/README.md).
