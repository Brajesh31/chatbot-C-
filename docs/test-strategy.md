# 🧪 Test Strategy and Evidence Model

## 🎯 Purpose

The strategy prioritizes observable user behavior and the input boundary because this is a small interactive C process. It separates unit-level rule behavior from process-level input, output, EOF and line-draining behavior.

## Test layers

~~~mermaid
flowchart TD
 A[Static analysis and repository checks] --> B[Process integration tests]
 B --> C[C unit tests]
 C --> D[Small deterministic input fixtures]
~~~

The diagram represents verification layers, not a relative test count or coverage percentage.

## Test levels and ownership

| Layer | Primary artifact | Primary owner | Failure class |
|---|---|---|---|
| Unit | `tests/test_chatbot.c` | Change author | Rule, normalization or response mapping regression |
| POSIX process | `tests/test_interactive.sh` | Change author | stdin/stdout, EOF, prompt or line boundary defect |
| Windows process | `tests/test_interactive.ps1` | Change author | Windows executable or PowerShell process behavior |
| Build | Makefile and `ci.yml` | Maintainer | Compiler, warning or build regression |
| Documentation | `validate_docs.py`, `validate_markdown.py` | Documentation author | Broken links, malformed SVG or unbalanced fence |
| Structure | `check_project_structure.py` | Documentation author | Tracked file inventory drift |
| Security hygiene | `security_check.py`, Gitleaks, CodeQL, GCC analyzer | Maintainer | Secret pattern or supported static-analysis finding |

## Input partitioning and boundary strategy

| Partition | Representative data | Expected class |
|---|---|---|
| Greeting | `hello`, `HELLO`, phrase with hello | Greeting |
| Status | `how are you?` | Status |
| Overlapping phrases | `hello and how are you` | Greeting because it is first |
| Exit | `bye` | Goodbye and terminate |
| Exit near-match | `goodbye`, `bye!`, `bye now` | Fallback and continue |
| Empty | Empty line | Fallback |
| Ordinary text | Phrase with no known token | Fallback |
| Exact capacity | 255 bytes | Accept |
| Over capacity | 256+ bytes | Drain and reject |
| End of stream | EOF with no buffered line | Terminate |
| Final line | Bytes at EOF without newline | Accept if within capacity |

The exact-size test must include both newline-terminated and EOF-terminated variants. Testing only a 256-byte message is insufficient because it would not detect an implementation that incorrectly rejects the valid maximum-length message.

## Required test oracles

- Exact response text for each classifier result.
- A subsequent prompt after every non-exit response.
- No subsequent prompt after the exact exit response.
- A single warning for each overlong logical line.
- A valid message after an overlong line is read as a fresh message, not as leftover bytes.
- EOF terminates without reading stale or partially initialized input.
- Compilation remains warning-clean under the configured strict flags.

## Execution strategy

~~~mermaid
flowchart TD
 A[Change proposed] --> B[Review affected contracts]
 B --> C[Add or update regression tests]
 C --> D[Build with strict flags]
 D --> E[Run unit tests]
 E --> F[Run OS-specific process tests]
 F --> G[Run docs, Markdown, structure and security checks]
 G --> H{All applicable checks pass?}
 H -->|No| I[Fix and rerun]
 I --> C
 H -->|Yes| J[Review documentation and CI evidence]
 J --> K[Merge / release review]
~~~

## Test data and safety

Use synthetic text inputs. Avoid personal data, credentials, real user transcripts, or production environment dumps. Keep binary fixtures and generated executables out of new test cases unless the test specifically validates binary handling.

## What this strategy does not claim

It does not claim exhaustive testing, full Unicode support, full portability, performance qualification, memory-safety proof, 100% coverage or a formal security audit. Add a new platform to the support table only after its compiler and process-level tests have been executed and the evidence retained.
