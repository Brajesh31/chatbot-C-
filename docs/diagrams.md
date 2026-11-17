# 🧭 Architecture and Workflow Diagram Catalogue

This catalogue indexes diagrams for the real local C program and repository automation. It does not imply a backend, GUI, database, HTTP API, cloud deployment or account system.

## Product and runtime diagrams

### Use-case view
~~~mermaid
flowchart LR
    User([Terminal user]) --> Build[Build from source]
    Build --> Run[Launch executable]
    Run --> Turn[Submit a line]
    Turn --> Reply[Read fixed response]
    Reply --> Turn
    Turn -->|bye or EOF| Exit([Process exits])
~~~

### Component interaction
~~~mermaid
flowchart TD
    Main[main: loop]
    Reader[read_input_line]
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

### Accepted input sequence
~~~mermaid
sequenceDiagram
    actor User
    participant Main as main()
    participant Reader as read_input_line()
    participant Normalize as normalize_input()
    participant Rules as classify_input()
    participant Mapper as response_text()
    User->>Main: Enter a line
    Main->>Reader: Read into 256-byte buffer
    Reader-->>Main: Accepted line
    Main->>Normalize: Lowercase bytes
    Main->>Rules: Evaluate ordered phrases
    Rules-->>Main: ResponseKind
    Main->>Mapper: Select fixed reply
    Mapper-->>Main: Static response
    Main-->>User: Print response
~~~

### Bounded-input activity
~~~mermaid
flowchart TD
    A([Prompt]) --> B[Read logical line]
    B --> C{Read result}
    C -->|EOF/error| X([Exit])
    C -->|Overlong| D[Drain remainder]
    D --> E[Print warning]
    E --> A
    C -->|Accepted| F[Normalize]
    F --> G[Classify]
    G --> H[Print response]
    H --> I{Exact bye?}
    I -->|No| A
    I -->|Yes| X
~~~

## Existing DFD and state diagrams
- [Data flow](data-flow.md) has DFD levels 0, 1 and 2.
- [Application lifecycle](application-lifecycle.md) covers startup, reading, normalization, classification, response and termination.
- [User journeys](user-journeys.md) covers conversation, overlong input and contribution.
- [Security architecture](security-architecture.md) and [trust boundary SVG](assets/security-boundaries.svg) explain untrusted input.

## Delivery and verification diagrams
| Diagram | Location | Purpose |
|---|---|---|
| Contribution | [workflow SVG](assets/workflow-diagram.svg) | Scope, implementation, test and review |
| CI | [CI SVG](assets/ci-pipeline.svg) | Platform and analysis jobs |
| Tests | [testing SVG](assets/testing-workflow.svg) | Unit, interactive, docs and static checks |
| Distribution | [deployment SVG](assets/deployment-flow.svg) | Source build and artifact handoff |
| Error handling | [error SVG](assets/error-handling.svg) | Valid, overlong and EOF paths |
| Terminal session | [session SVG](assets/terminal-session.svg) | Illustrative CLI interaction |
| Input bounds | [boundary SVG](assets/input-boundary.svg) | Buffer, limit, drain and EOF |
| Rule priority | [precedence SVG](assets/rule-precedence.svg) | Greeting, status, exact exit, fallback |
| Verification | [matrix SVG](assets/testing-matrix.svg) | Unit, interactive, platform, docs, security |

## Diagrams intentionally absent
- ER diagram: no tables, keys or persistent application data.
- UML class diagram: procedural C, no class model.
- Authentication/authorization: no accounts or permissions.
- Frontend hierarchy: no graphical frontend.
- Cloud topology: no hosted service.

Add diagrams when architecture changes, and make them match source, tests and trust boundaries.
