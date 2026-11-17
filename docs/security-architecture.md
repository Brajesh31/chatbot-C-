# 🛡️ Security Architecture and Trust Boundaries

## 1. Security model

The security boundary is intentionally small: bytes from stdin enter a bounded reader, accepted input is normalized and checked against fixed phrase rules, and a constant response is written to stdout.

~~~mermaid
flowchart LR
 U[Untrusted terminal input] --> R[Bounded input reader]
 R -->|accepted line| N[Byte normalization]
 N --> C[Deterministic classifier]
 C --> O[Static response text]
 O --> T[Terminal output]
 R -->|overlong line| W[Drain and warn]
 R -->|EOF or error| X[Process exit]
~~~

The program runs as a local process. There is no server, listener, HTTP client, remote model, database, account system or persistence subsystem.

## 2. Trust boundaries and assets

| Boundary / asset | Threat or failure | Current design response | Residual limitation |
|---|---|---|---|
| stdin to process | Malformed or excessive input | Fixed 256-byte buffer, 255-byte line limit, overlong-line drain | Byte-oriented; terminal/encoding behavior varies |
| Character conversion | Undefined behavior from negative signed char | Convert through unsigned char before tolower | Locale-dependent byte conversion, not Unicode case folding |
| Rule evaluation | Unexpected exit due to substring collision | Exit requires whole normalized string bye | Phrase rules remain simple substring matching |
| Response output | User text interpreted as format string | Select static response strings and print through fixed format | stdout errors are not comprehensively handled |
| Process memory | Input persists unexpectedly between turns | Reuses a local input buffer; no history store | OS/terminal may independently retain display/input |
| Source repository | Secret or malicious workflow change | Gitleaks, static analysis, minimal workflow permissions and code review | Tooling cannot prove absence of all vulnerabilities |
| Historical executable | Binary differs from current source | Label binary as historical; recommend source build | Binary is not reproducibly built or provenance-attested |

## 3. Implemented controls

### Input boundary

- The input array is 256 bytes, including the terminating NUL.
- At most 255 bytes of input are accepted in a single logical line.
- The reader checks the result of fgets before using the buffer.
- A full buffer without newline triggers an extra-byte probe, preserving exact-limit lines.
- An overlong line is drained through newline or EOF and rejected as one message.
- Read errors and EOF use an input-ended path rather than classifying stale data.

### String and response handling

- tolower receives the input byte after conversion to unsigned char.
- Exit matching compares the complete normalized input with bye.
- Responses are selected from a fixed enum-to-string mapping.
- User input is not passed as a format string or command.

### Repository and build controls

- Strict C11 compilation uses warnings-as-errors.
- Unit and process tests cover behavior and input boundaries.
- CodeQL and GCC analyzer workflows provide static analysis.
- Gitleaks scans Git history; a local text heuristic provides an additional, limited hygiene check.
- GitHub workflows declare read-only repository permissions where sufficient and use concurrency cancellation for duplicate branch runs.
- Dependency review is configured for pull requests. The runtime has no third-party package manifest.

## 4. Security process

~~~mermaid
flowchart TD
 A[Security concern identified] --> B{Potential vulnerability?}
 B -->|No| C[Use normal issue or support route]
 B -->|Yes| D[Submit private vulnerability report]
 D --> E[Maintainer triage]
 E --> F[Reproduce safely with synthetic data]
 F --> G[Assess impact and affected commits]
 G --> H[Prepare fix and regression test]
 H --> I[Review source and run checks]
 I --> J[Coordinate disclosure and release]
 J --> K[Close with remediation evidence]
~~~

Private reporting instructions and supported scope are in the root [SECURITY.md](../SECURITY.md). Public issues should not contain exploit details, credentials or sensitive personal information.

## 5. Absent security subsystems

| Subsystem | Current status | Implication |
|---|---|---|
| Authentication and authorization | Absent | No accounts, tokens, roles or permissions |
| Transport security | Absent | No network transport to configure |
| Database encryption | Absent | No application database |
| Secrets vault integration | Absent | No runtime service credentials |
| Audit event store | Absent | No durable application audit log |
| Backup and restore | Absent | No chatbot-owned persisted data |
| Rate limiting | Not applicable to the local stdin loop | No public remote endpoint |
| Multi-tenant isolation | Not applicable | No multi-user service |

These absences are documented rather than replaced with fictional controls or diagrams.

## 6. Security testing and evidence

| Verification | What it can establish | What it cannot establish |
|---|---|---|
| Unit tests | Selected classifier and normalization expectations | Exhaustive correctness for every input |
| Process tests | Real stdin/stdout and boundary behavior on tested OSes | Every terminal or locale |
| GCC analyzer | Findings supported by configured analyzer | Proof of memory safety |
| CodeQL | Findings within configured analysis model | Independent penetration test |
| Gitleaks | Matches from configured detectors in scanned history | Absence of every possible secret |
| Local secret heuristic | Selected high-confidence text patterns | Complete secret detection |

No independent security audit, certification, zero-vulnerability guarantee or formal verification is claimed.

## 7. Mandatory review for architecture changes

Any proposal adding persistence, networking, external services, user accounts or multi-user behavior must include:
1. Updated data-flow and threat models.
2. Data classification, purpose, retention, deletion and access requirements.
3. Authentication, authorization and secrets design where relevant.
4. Dependency and license review.
5. Security-focused tests and failure scenarios.
6. Monitoring, incident response and operational ownership.
7. Updated diagrams, privacy documentation and support guidance.

See [threat assessment](threat-assessment.md), [vulnerability management](vulnerability-management.md), [risk register](risk-register.md), and [privacy/data handling](data-privacy.md).
