# ✅ Solution Overview

The solution is a single C11 executable with a straightforward processing pipeline:

1. Print the initial greeting.
2. Display the prompt and flush stdout.
3. Read one bounded line from stdin.
4. Exit cleanly on EOF, or reject and drain an overlong line.
5. Normalize the accepted text to lowercase.
6. Classify it using ordered rules.
7. Print a fixed response.
8. Continue unless the classification is the exact exit command.

~~~mermaid
flowchart TD
 A[Terminal input] --> B[Bounded line reader]
 B --> C{Read result}
 C -->|EOF or error| D[Exit]
 C -->|Overlong| E[Discard remainder and warn]
 E --> A
 C -->|Valid line| F[Normalize case]
 F --> G[Ordered phrase rules]
 G --> H[Static response text]
 H --> I[Terminal output]
 I --> J{Exact bye?}
 J -->|No| A
 J -->|Yes| D
~~~

## Why this design
A single-process console design is sufficient for the current feature set. Separating functions makes the rules easy to test without inventing a client/server boundary, database, or plugin layer.

## Trade-offs
Substring matching is simple but imprecise. The fixed buffer bounds memory use but places a maximum length on messages. Static strings are reliable and easy to audit, but cannot respond contextually.
