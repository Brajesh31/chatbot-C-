# 🔀 Data Flow

## Context level (DFD 0)
~~~mermaid
flowchart LR
 User[Terminal user] -->|Text line| Chatbot((C chatbot process))
 Chatbot -->|Prompt and response text| User
~~~

## Process level (DFD 1)
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

No persistent data store or external data source exists. Data is held in a local buffer and discarded as the next input line overwrites it.
