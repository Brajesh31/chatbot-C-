# 🏛️ System Design

## Design summary
The application is a synchronous, single-process terminal loop. It has no persistent state beyond the current input buffer and local response classification.

## Logical layers
| Layer | Implementation | Responsibility |
|---|---|---|
| Console interface | main function | Prompting, printing, loop and exit |
| Input boundary | read_input_line | Bounded input, EOF and long-line handling |
| Text normalization | normalize_input | Lowercase transformation |
| Rule engine | classify_input and is_exit_command | Ordered deterministic classification |
| Response mapping | response_text | Static enum-to-text mapping |

## Data boundaries
~~~mermaid
flowchart LR
 U[Human at terminal] -->|stdin line| R[Line reader]
 R -->|bounded C string| N[Normalizer]
 N -->|normalized bytes| C[Classifier]
 C -->|enum value| M[Response mapper]
 M -->|constant string| O[stdout]
~~~

The data is transient. There is no storage, serialization, telemetry, API, or external integration.

## Failure behavior
EOF or an input error ends the loop. An overlong line is discarded and the session continues. A valid line always maps to one known response category, including fallback.

## Architectural constraints
Keep runtime dependencies to the C standard library unless a documented, tested requirement justifies a change. Avoid speculative abstractions for a program with one input source and one output channel.
