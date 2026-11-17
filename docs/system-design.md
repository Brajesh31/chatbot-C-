# 🏛️ System Design and Design Constraints

## 1. Design summary

The application is a synchronous, single-process C11 terminal loop. It uses the C standard library, one fixed input buffer, ordered phrase matching and constant response strings. There is no persisted application state beyond the active process and no network communication.

## 2. Logical layers

| Layer | Source implementation | Responsibility | Contract |
|---|---|---|---|
| Console interface | main | Welcome text, prompt, flush, response and loop | Reads one line per turn |
| Input boundary | read_input_line | Bounded read, exact-fit probe, EOF and long-line drain | Returns accepted, end/error or overlong |
| Text normalization | normalize_input | Lowercase accepted bytes in place | Uses unsigned-char conversion before tolower |
| Exit predicate | is_exit_command | Check terminal command | Full normalized string must equal bye |
| Rule engine | classify_input | Ordered deterministic classification | Greeting, status, exit, fallback |
| Response mapping | response_text | Enum-to-text mapping | Returns fixed strings |

## 3. Context and data flow

~~~mermaid
flowchart LR
 U[Human at terminal] -->|stdin bytes| R[Bounded line reader]
 R -->|Accepted C string| N[Normalizer]
 N -->|Lowercase bytes| C[Rule classifier]
 C -->|ResponseKind enum| M[Response mapper]
 M -->|Static response| O[stdout]
 R -->|Overlong| D[Drain and warn]
 R -->|EOF or error| X[Process exit]
~~~

The data is transient. There is no storage, serialization, telemetry, API, or external integration.

## 4. Runtime control flow

~~~mermaid
flowchart TD
 A([Process start]) --> B[Print welcome]
 B --> C[Prompt and flush stdout]
 C --> D[Read logical line]
 D --> E{Read status}
 E -->|EOF/error| X([Exit])
 E -->|Overlong| F[Drain remainder and warn]
 F --> C
 E -->|Accepted| G[Normalize]
 G --> H{hello substring?}
 H -->|Yes| I[Greeting]
 H -->|No| J{how are you substring?}
 J -->|Yes| K[Status]
 J -->|No| L{exact bye?}
 L -->|Yes| M[Goodbye]
 L -->|No| N[Fallback]
 I --> O[Print constant response]
 K --> O
 M --> O
 N --> O
 O --> P{Goodbye?}
 P -->|Yes| X
 P -->|No| C
~~~

## 5. Input and memory constraints

- Buffer size: 256 bytes.
- Maximum accepted message: 255 bytes plus NUL terminator.
- Exactly 255 bytes are accepted when followed by newline or clean EOF.
- More than 255 bytes are drained and rejected as one logical line.
- Input is byte-oriented and depends on the active C locale for tolower.
- The input array is local to main and reused, not stored as conversation history.

## 6. Error handling

| Condition | Behavior |
|---|---|
| Accepted input | Normalize and classify |
| Overlong line | Drain remainder, print warning and prompt again |
| EOF | Print input-closed message and exit |
| Read error | Exit through the input-ended path |
| No rule match | Print fallback response and continue |

## 7. Design decisions and trade-offs

| Decision | Benefit | Trade-off |
|---|---|---|
| Standard C runtime only | Minimal runtime requirements | Limited abstraction and platform services |
| Single translation unit | Easy for learners to inspect | Tests include source to reach private helpers |
| Ordered substring rules | Transparent and deterministic | Not natural-language understanding |
| Fixed input capacity | Clear, auditable memory bound | Long messages are rejected |
| Fixed response enum | Avoids dynamic response construction | Very limited conversational capability |
| Exact exit equality | Prevents accidental exit on goodbye | Users must enter exact bye |

## 8. Non-functional considerations

| Concern | Current design | Boundary |
|---|---|---|
| Portability | C11 and standard library | Tested CI environments only |
| Performance | Small in-memory operations | No benchmark baseline |
| Reliability | Read-result checks and line draining | stdout errors not comprehensively handled |
| Security | Bounded input, fixed responses, static analysis | Not an independent audit |
| Privacy | No application conversation storage or network call | Does not control terminal/OS logging |
| Accessibility | Plain text and standard stdin/stdout | No formal accessibility certification |

## 9. Extension policy

Do not introduce a framework, database, server, GUI, authentication or cloud service without a concrete requirement. Any architectural expansion must include an ADR, threat/data-flow review, tests, updated structure inventory, migration and maintenance plan.

See [architecture](architecture.md), [diagrams](diagrams.md), [technology stack](technology-stack.md), and [scope](scope-and-limitations.md).
