# 🧩 Component Library and Module Boundaries

## Current status
There is no React app, widget toolkit, terminal UI framework, HTML component layer or separately packaged C library. No public component registry or component API exists.

The useful component model is the set of private helper functions in the single C translation unit. They are functional units, not graphical widgets or deployable modules.

## Current functional components
| Function | Responsibility | Input | Result |
|---|---|---|---|
| `read_input_line` | Bounded logical-line reader | Buffer and capacity | 1 accepted, 0 EOF/error, -1 overlong |
| `normalize_input` | Lowercases bytes | Mutable NUL-terminated string | Mutates input |
| `is_exit_command` | Exact exit comparison | Normalized text | Boolean-like integer |
| `classify_input` | Ordered phrase rules | Normalized text | `ResponseKind` |
| `response_text` | Category-to-copy mapping | `ResponseKind` | Static response |
| `main` | Session orchestration | stdin | Writes to stdout |

## Dependency direction
~~~mermaid
flowchart TD
    Main[main: session loop]
    Reader[read_input_line: input boundary]
    Normalize[normalize_input]
    Rules[classify_input]
    Exit[is_exit_command]
    Map[response_text]
    Main --> Reader
    Main --> Normalize
    Main --> Rules
    Main --> Map
    Rules --> Exit
~~~

## Extension rules
- Extract a helper when it isolates a coherent behavior or improves testability.
- Keep helpers `static` unless an external interface is required.
- Use enums for finite response categories.
- Avoid framework abstractions for this small console program.
- Test every new rule or input branch.
- Update module and tree documentation when source files change.

A component library becomes applicable only after an approved UI implementation exists. See [module documentation](module-documentation.md), [architecture](architecture.md) and [design system](design-system.md).
