# 🧭 Architecture, Data and Workflow Diagram Catalogue

This catalogue indexes diagrams for the actual Simple C Chatbot source and repository automation. The visuals describe one local C process. They do not imply a backend, GUI, database, HTTP API, cloud deployment, authentication service or account system.

## 🧩 Product and runtime diagrams

### User interaction / use-case view

~~~mermaid
flowchart LR
    User([Terminal user]) --> Build[Build executable from source]
    Build --> Run[Launch local process]
    Run --> Turn[Submit one line]
    Turn --> Reply[Read fixed response]
    Reply --> Turn
    Turn -->|Exact bye or EOF| Exit([Process exits])
~~~

### Component interaction

~~~mermaid
flowchart TD
    Main[main: prompt loop]
    Reader[read_input_line]
    Normalize[normalize_input]
    Rules[classify_input]
    Exit[is_exit_command]
    Mapper[response_text]
    Main --> Reader
    Main --> Normalize
    Main --> Rules
    Rules --> Exit
    Main --> Mapper
~~~

The component view is a call-responsibility diagram, not an object-oriented class hierarchy. The source is procedural C with file-local helper functions.

### Runtime activity

~~~mermaid
flowchart TD
    A([Prompt]) --> B[Read one logical line]
    B --> C{Reader result}
    C -->|EOF or stream error| X([Exit process])
    C -->|Overlong| D[Drain remaining bytes]
    D --> E[Print length warning]
    E --> A
    C -->|Accepted| F[Normalize accepted bytes]
    F --> G{Contains hello?}
    G -->|Yes| H[Greeting response]
    G -->|No| I{Contains how are you?}
    I -->|Yes| J[Status response]
    I -->|No| K{Exact bye?}
    K -->|Yes| L[Goodbye response]
    K -->|No| M[Fallback response]
    H --> N[Print constant response]
    J --> N
    L --> N
    M --> N
    N --> O{Goodbye?}
    O -->|Yes| X
    O -->|No| A
~~~

### Accepted input sequence

~~~mermaid
sequenceDiagram
    actor User
    participant Main as main()
    participant Reader as read_input_line()
    participant Normalize as normalize_input()
    participant Classifier as classify_input()
    participant Mapper as response_text()
    User->>Main: Enter a line
    Main->>Reader: Read into 256-byte buffer
    Reader-->>Main: Accepted line
    Main->>Normalize: Lowercase accepted bytes
    Normalize-->>Main: Normalized string
    Main->>Classifier: Evaluate ordered rules
    Classifier-->>Main: ResponseKind
    Main->>Mapper: Map enum
    Mapper-->>Main: Static response
    Main-->>User: Print response
~~~

### Input-reader state model

~~~mermaid
stateDiagram-v2
    [*] --> Reading
    Reading --> Accepted: Newline captured
    Reading --> Probe: Buffer full without newline
    Reading --> Ended: EOF or stream error
    Probe --> Accepted: Next byte is newline
    Probe --> Accepted: Clean EOF after exact-fit line
    Probe --> Draining: Additional input byte exists
    Probe --> Ended: Stream error
    Draining --> Rejected: Newline or EOF consumed
    Draining --> Ended: Stream error
    Accepted --> [*]
    Rejected --> [*]
    Ended --> [*]
~~~

## 🔀 Data-flow diagrams

- [DFD levels 0, 1 and 2](data-flow.md) explain stdin, bounded reading, normalization, rule evaluation and stdout.
- [Level 0 SVG](assets/data-flow-level0.svg), [level 1 SVG](assets/data-flow.svg), and [level 2 SVG](assets/data-flow-level2.svg) provide visual summaries.
- No persistent store is present. A database ER model would be misleading.

## 🔐 Security and failure diagrams

- [Security architecture](security-architecture.md) shows the stdin trust boundary, bounded reader and fixed response path.
- [Trust-boundary SVG](assets/security-boundaries.svg) illustrates untrusted input and the process boundary.
- [Error-handling SVG](assets/error-handling.svg) distinguishes accepted, overlong and end-of-input paths.
- [Input-boundary SVG](assets/input-boundary.svg) explains the 256-byte buffer and 255-byte payload maximum.

## 🚀 Delivery and verification diagrams

| Diagram | Location | Purpose |
|---|---|---|
| Contributor workflow | [workflow SVG](assets/workflow-diagram.svg) | Scope, implementation, test and review |
| CI pipeline | [CI SVG](assets/ci-pipeline.svg) | Linux/Windows and analysis workflows |
| Testing workflow | [testing SVG](assets/testing-workflow.svg) | Unit, process, docs and static checks |
| Distribution | [deployment SVG](assets/deployment-flow.svg) | Source build and workflow artifact handoff |
| Rule precedence | [precedence SVG](assets/rule-precedence.svg) | Greeting, status, exact exit and fallback |
| Runtime state | [state SVG](assets/application-state.svg) | Session states |
| Terminal session | [session SVG](assets/terminal-session.svg) | Illustrative CLI interaction |

## 🚫 Deliberately absent diagrams

| Diagram type | Why it is not included as an implemented design |
|---|---|
| ER diagram | No application tables, keys or persistent data |
| UML class diagram | Procedural C, no class model |
| Authentication/authorization | No accounts, tokens or permissions |
| Frontend component hierarchy | No graphical frontend |
| API request flow | No HTTP or RPC interface |
| Cloud topology | No hosted service or deployment environment |
| Backup/restore architecture | No application data store to back up |

A diagram must be updated when its underlying source, workflow or test contract changes. Do not introduce a diagram as evidence of a future capability that has not been implemented.


## UML-aligned views and model boundaries

The repository uses diagram forms that fit a procedural, single-process C application:

| View | Source | What it explains |
|---|---|---|
| Use-case view | [System design](system-design.md) | Terminal user, build, run, message, response and exit interactions |
| Activity / control flow | [Bounded-input activity](#bounded-input-activity), [workflow SVG](assets/workflow-diagram.svg) | Validation, branching, retry and termination |
| Sequence view | [Sequence diagrams](sequence-diagrams.md), [CLI sequence SVG](assets/cli-sequence.svg) | Calls between `main` and the C helper functions |
| State view | [State diagrams](state-diagrams.md), [application-state SVG](assets/application-state.svg) | Startup, prompt, accepted/rejected input, response and exit |
| Component / process view | [Architecture overview](assets/architecture-overview.svg) | Responsibilities contained in one local process |
| Data-flow view | [DFD level 0](assets/data-flow-level0.svg), [DFD level 2](assets/data-flow-level2.svg) | Data entering, being normalized/classified and leaving the process |
| Delivery view | [Deployment flow](assets/deployment-flow.svg), [CI pipeline](assets/ci-pipeline.svg) | Local source build and repository verification |

A UML class diagram is deliberately omitted: the source has no classes, objects, inheritance, or object lifecycle. An ER diagram is also omitted because the application has no database or persisted domain records. These are intentional modeling decisions, not unfinished diagrams.
