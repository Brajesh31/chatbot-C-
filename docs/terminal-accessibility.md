# ♿ Terminal Accessibility Guide

This project is a text-only command-line program. Terminal font selection, color themes, screen-reader configuration and keyboard editing are mainly controlled by the operating system and terminal application.

This guide describes current behavior and practical usage. It is not a WCAG 2.2 AA conformance report or an accessibility certification.

## Current interaction surface

| Surface | Current implementation | User impact |
|---|---|---|
| Input | Standard input, one line at a time | Works with keyboard entry and shell redirection |
| Prompt | Visible `You:` prompt, stdout flushed before waiting | Prompt appears before input is requested |
| Response | Plain text on standard output | Meaning does not depend on color or animation |
| Warning | Text warning for input longer than 255 bytes | Explains the byte limit and correction |
| Exit | Exact normalized `bye`, or EOF | Exit instruction is visible at startup |
| Focus | No custom focus handling | Terminal owns focus and caret behavior |
| Motion | No animation or screen redraw | No application-level motion setting is required |
| Persistence | No transcript file or history | Conversation content is not stored by the application |

## Practical guidance

- Increase terminal font size in the terminal settings when text is difficult to read.
- Select a theme with sufficient foreground/background contrast. The application does not set colors.
- Use normal terminal keyboard editing before pressing Enter. The program reads the submitted line; it does not implement an editor.
- Enter `bye` as the complete line to exit.
- Keep a message at or below 255 bytes. The limit is in bytes, not necessarily Unicode characters.
- When using shell redirection or assistive technology, ensure the input source sends ordinary newline-delimited text.

## Screen readers and assistive technology

The application emits ordinary text to stdout and reads ordinary text from stdin. It does not use terminal control sequences, custom widgets, color-only status, or a graphical canvas. This is a favorable baseline for text-oriented workflows, but it does not establish compatibility with every screen reader, terminal emulator, locale, speech rate, or keyboard configuration.

No dedicated screen-reader certification has been performed. Report a reproducible problem with the terminal name, operating system, screen reader and versions, steps, and observed output. Do not include private conversation text in a public issue.

## Validation checklist

| Check | Current evidence | Limitation |
|---|---|---|
| Prompt appears before blocking input | `fflush(stdout)` follows the prompt | Automated tests do not cover every terminal |
| Status is conveyed without color | All messages are plain text | Terminal theme still affects contrast |
| Long-input guidance is textual | Warning includes a byte limit | No localized message catalogue |
| Keyboard input is supported | Reads from stdin | No custom shortcuts or command history |
| Screen-reader path uses text streams | stdout/stdin only | No assistive-technology test lab is configured |
| Motion is not required | No app animation | Terminal cursor behavior is external |

Any future menus or terminal formatting must preserve a plain-text path. Do not encode meaning through color alone. If ANSI styling is introduced, provide a no-color mode and test redirected output.

See [CLI UX](cli-ux-guidelines.md), [keyboard navigation](keyboard-navigation.md), [screen-reader support](screen-reader-support.md), [contrast guidance](color-contrast.md), and [accessibility testing](accessibility-testing.md).
