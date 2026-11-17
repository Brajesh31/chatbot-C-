# 🛡️ Security Architecture

## Runtime boundary

The security boundary is intentionally small: bytes from stdin enter a bounded reader, accepted input is normalized and checked against fixed rules, and a constant response is written to stdout.

~~~mermaid
flowchart LR
 U[Untrusted terminal input] --> R[Bounded input reader]
 R -->|valid line| N[Byte normalization]
 N --> C[Deterministic classifier]
 C --> O[Static response text]
 O --> T[Terminal output]
 R -->|EOF or error| X[Process exit]
 R -->|overlong| W[Drain and warn]
~~~

## Build and repository boundary

Reviewed source is compiled by a local or hosted toolchain. GitHub Actions checks the source; CodeQL and GCC analyzer provide static analysis. The checked-in Windows executable is historical and is not a trusted reproducible release artifact.

## Security controls

| Control | Current implementation | Limitation |
|---|---|---|
| Input bounds | Fixed 256-byte buffer | Max 255 bytes |
| EOF handling | Read result checked | Output errors not comprehensively checked |
| Long-line behavior | Remainder drained and rejected | Shell test runs on POSIX |
| String normalization | Unsigned-char conversion before tolower | Not Unicode case folding |
| Exit matching | Exact whole-string comparison | Rule matching remains simple |
| Static checks | CodeQL and GCC analyzer workflows | Not a formal audit |

## Absent security subsystems

There are no application accounts, authentication tokens, role/permission engine, network transport, database, encryption-at-rest system, audit-log store, or service secrets. Those boundaries are described as non-applicable in their respective guides, rather than represented as implemented controls.

## Review requirements

Any change adding persistence, network access, external services, or multi-user operation requires an updated threat model, data-flow review, credentials strategy, privacy assessment, security tests, and operational owner.
