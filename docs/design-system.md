# 🎛️ Design System and CLI Interaction Contract

## Scope
The product is a text-only command-line application. It has no graphical components, web layout, mobile screens, theme engine or reusable visual widgets. This guide defines the interaction system that exists, rather than inventing a graphical design system.

Repository SVGs are documentation assets. They are not loaded by the C executable. See [branding](branding-guidelines.md) and the [asset catalogue](assets/README.md).

## Interaction primitives
| Primitive | Implementation | Contract |
|---|---|---|
| Startup | `puts` in `main` | Explains chatbot and exit command |
| Prompt | `printf("You: ")` and `fflush(stdout)` | Displayed before blocking input |
| User turn | One accepted logical line | Maximum 255 bytes plus NUL |
| Normalization | `normalize_input` | Lowercases accepted bytes |
| Rule selection | `classify_input` | Greeting, status, exact exit, fallback |
| Response | `response_text` | Static response text |
| Rejected input | Long-line branch | Warn, then start a fresh prompt |
| Exit | Exact `bye`, EOF or read error | Leaves conversation loop |

## Consistency rules
1. Keep prompts, replies and warnings plain text.
2. Preserve rule priority when changing user-visible behavior.
3. Flush the prompt before waiting for input.
4. Drain overlong lines so the remainder cannot become another turn.
5. Avoid cursor movement, screen clearing and animation.
6. Keep examples synchronized with source and tests.
7. State input limits in bytes, not characters.

## State model
~~~mermaid
stateDiagram-v2
    [*] --> Startup
    Startup --> Prompt
    Prompt --> ReadLine
    ReadLine --> Warning: overlong
    Warning --> Prompt
    ReadLine --> Normalize: accepted
    Normalize --> Classify
    Classify --> Response
    Response --> Prompt: continue
    Response --> Exit: exact bye
    ReadLine --> Exit: EOF or error
    Exit --> [*]
~~~

## Interface-change checklist
- [ ] A defined user problem justifies the change.
- [ ] Input bounds and EOF behavior remain safe.
- [ ] Unit or interactive tests cover the change.
- [ ] Plain-text meaning does not depend on color.
- [ ] Usage, accessibility and diagrams are updated.
- [ ] No unimplemented graphical feature is claimed.

A future GUI requires an approved product decision, real screens and a UI runtime before responsive layout, component tokens or motion preferences become applicable. See [design tokens](design-tokens.md), [component library](component-library.md) and [CLI UX](cli-ux-guidelines.md).
