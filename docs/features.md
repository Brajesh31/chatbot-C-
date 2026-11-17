# ✨ Feature Catalogue and Behavior Contract

This page describes behavior present in `chatbot/chatbot.c`. A feature is not considered implemented merely because a roadmap or template mentions it.

## 🧩 Runtime features

| Feature | Trigger / input | Actual behavior | Session effect | Verification |
|---|---|---|---|---|
| Startup greeting | Process starts | Prints the program introduction | Session begins | Interactive tests |
| Prompting | Before each read | Prints `You:` and flushes stdout | Waits for input | Interactive tests |
| Greeting | Normalized input contains `hello` | Prints the fixed greeting response | Continues | C unit + process tests |
| Status | Greeting did not match and input contains `how are you` | Prints the fixed status response | Continues | C unit + process tests |
| Exact exit | Entire normalized input equals `bye` | Prints the fixed goodbye response | Exits loop | C unit + process tests |
| Fallback | No rule matches | Prints the fixed fallback response | Continues | C unit + process tests |
| Case normalization | Any accepted line | Converts bytes to lowercase using the C character API | Enables case-insensitive phrase matching | C unit tests |
| Empty input | A newline with no message bytes | Treated as an accepted empty string | Fallback, then continue | Unit + process tests |
| Bounded line input | One logical line up to 255 bytes | Accepts the line and keeps space for NUL | Normal rule processing | Boundary tests |
| Overlong-line rejection | More than 255 bytes before line ending | Drains the line tail and emits one warning | Continues with next logical line | POSIX + PowerShell process tests |
| EOF handling | Standard input closes | Prints input-closed message and exits | Ends session | Process tests |

## 🎯 Rule precedence

The classifier checks predicates in a fixed order:

1. `hello` substring.
2. `how are you` substring.
3. Exact full-string `bye`.
4. Fallback.

This order is observable. For example, `hello and bye` returns the greeting response, not goodbye. The program will ask for another line. Similarly, `goodbye` is not an exit command.

~~~mermaid
flowchart TD
 A[Normalized text] --> B{hello substring?}
 B -->|Yes| G[Greeting]
 B -->|No| C{how are you substring?}
 C -->|Yes| S[Status]
 C -->|No| D{exactly bye?}
 D -->|Yes| E[Goodbye and stop]
 D -->|No| F[Fallback and continue]
~~~

## 📏 Input-size behavior

| Logical input size | Followed by newline | Followed by EOF |
|---:|---|---|
| 0 bytes | Accepted | Empty EOF ends before a new line |
| 1–254 bytes | Accepted | Accepted as final unterminated line |
| 255 bytes | Accepted | Accepted as final unterminated line |
| 256 or more bytes | Rejected and drained | Rejected if additional data was observed before EOF |

The limit applies to bytes read by the C runtime, not displayed characters or Unicode code points. Multi-byte UTF-8 text can therefore consume more than one byte per displayed character.

## 🚫 Explicitly absent functionality

| Requested capability | Current state | Reason |
|---|---|---|
| AI / LLM response generation | Not implemented | Responses are fixed strings selected by local rules |
| Natural-language understanding | Not implemented | Matching uses simple substring and equality checks |
| Conversation memory or personalization | Not implemented | No persistence or profile subsystem |
| Voice input/output | Not implemented | The interface is stdin/stdout only |
| GUI, browser or mobile UI | Not implemented | The product is a terminal executable |
| HTTP API, webhook or remote service | Not implemented | No network stack is present |
| Database or analytics | Not implemented | No persistent application data |
| Login, roles or authentication | Not implemented | No user identity model |

## 🧪 Change requirements

A rule or input change must include:
- At least one unit assertion for each changed predicate or response.
- Process-level coverage for any change affecting line reading, EOF, prompting or termination.
- Boundary tests if the maximum accepted input or line-draining behavior changes.
- Updates to the README, [architecture](architecture.md), [API/interface reference](api-reference.md), [data flow](data-flow.md), [test matrix](testing-matrix.md) and [scope statement](scope-and-limitations.md), where affected.
- A reviewed update to the [risk register](risk-register.md) when trust boundaries or input handling change.
