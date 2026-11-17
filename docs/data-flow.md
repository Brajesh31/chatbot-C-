# 🔀 Data Flow

## Context-level diagram (DFD Level 0)

~~~mermaid
flowchart LR
 User[Terminal user] -->|Input line| App((Simple C Chatbot))
 App -->|Prompt and fixed response| User
~~~

![DFD Level 0](assets/data-flow-level0.svg)

## Process-level diagram (DFD Level 1)

~~~mermaid
flowchart TD
 U[stdin bytes] --> R[Read bounded line]
 R -->|valid line| N[Normalize case]
 R -->|EOF/error| X[Terminate]
 R -->|too long| W[Warn and discard remainder]
 W --> U
 N --> C[Classify using fixed rules]
 C --> M[Select static response]
 M --> O[stdout]
 O --> E{Exit category?}
 E -->|No| U
 E -->|Yes| X
~~~

![DFD Level 1](assets/data-flow.svg)

## Detailed processing (DFD Level 2)

~~~mermaid
flowchart TD
 A[stdin] --> B[fgets]
 B --> C{Read success?}
 C -->|No| X[EOF or input error, exit]
 C -->|Yes| D{Line fits?}
 D -->|No| E[Drain rest of logical line]
 E --> F[Print length warning]
 F --> A
 D -->|Yes| G[Remove newline if present]
 G --> H[Lowercase bytes]
 H --> I{Contains hello?}
 I -->|Yes| J[Greeting]
 I -->|No| K{Contains how are you?}
 K -->|Yes| L[Status]
 K -->|No| M{Exact bye?}
 M -->|Yes| N[Goodbye and exit]
 M -->|No| O[Fallback]
 J --> A
 L --> A
 O --> A
~~~

![DFD Level 2](assets/data-flow-level2.svg)

## Data persistence

No data store exists. The current line and classification are transient process state. No conversation history is retained by the application.
