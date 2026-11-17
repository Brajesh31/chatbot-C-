# 🔄 Development Workflow

~~~mermaid
flowchart TD
 I[Read issue and scope] --> B[Create focused branch]
 B --> C[Implement small change]
 C --> T[Add or update tests]
 T --> V[Run make check]
 V --> R{All checks pass?}
 R -->|No| C
 R -->|Yes| D[Update docs and diagrams]
 D --> P[Review diff and submit PR]
 P --> M[Maintainer review]
 M --> A[Merge after approval]
~~~

## Branch and commit expectations

Use a short branch name that describes the change. Keep commits focused. Prefer messages such as feat: add a new phrase rule, fix: handle final input line, test: cover empty input, and docs: clarify build steps.

## Review criteria

A reviewer checks user-visible behavior, rule precedence, input boundaries, compiler diagnostics, portability, tests, documentation accuracy, security implications, and whether the change introduces unnecessary dependencies.

## Maintainer path

Do not merge a behavior change solely because it compiles. Require tests that demonstrate the intended behavior and at least one relevant boundary case.
