# 📏 Responsive Design and Terminal Width

## Applicability
Responsive web design is not part of the current product. The executable does not query terminal dimensions, calculate breakpoints, render grids or reflow graphical components. It writes ordinary text and delegates wrapping to the terminal emulator.

The input limit is 255 **bytes**, unrelated to terminal columns.

## Current terminal behavior
| Environment | Behavior | Owner |
|---|---|---|
| Narrow terminal | Text may wrap naturally | Terminal emulator |
| Wide terminal | Same strings are printed | Application |
| Resized terminal | No resize event is processed | Terminal |
| Screen-reader terminal | Plain stdout text is emitted in order | Terminal/assistive technology |
| Redirected output | Text is sent to stdout | Receiving process |

## Writing guidance
- Keep prompts and replies concise.
- Do not align output with long runs of spaces.
- Do not assume a minimum terminal width.
- Avoid full-screen redraw and cursor positioning.
- Keep input-length limits separate from display width.
- Test narrow and standard widths before adding long output.

## What would make responsive design applicable
A terminal UI framework, desktop window, browser client or mobile client would create a real layout surface. Then document viewport sizes, breakpoints, overflow, text scaling, keyboard focus and device testing.

## Verification
Checks are behavioral, not breakpoint-based. Confirm prompt, accepted input, long-line warning, fallback, goodbye and EOF output. No responsive-conformance claim is made.

Related: [CLI UX](cli-ux-guidelines.md), [page documentation](page-documentation.md), [accessibility](accessibility.md), [compatibility](compatibility.md).
