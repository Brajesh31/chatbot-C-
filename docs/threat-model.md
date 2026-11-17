# 🛡️ Threat Model

## Scope and assets
The application is a local C process that reads terminal input and prints fixed responses. Relevant assets are process memory, input handling correctness, source/build integrity, and the user's terminal session.

## Trust boundaries
~~~mermaid
flowchart LR
 U[Untrusted terminal input] --> R[Bounded input reader]
 R --> N[Local normalization]
 N --> C[Deterministic rules]
 C --> O[Terminal output]
 B[Reviewed source and compiler] --> P[Executable process]
~~~

## Threat table
| Threat | Existing mitigation | Residual risk |
|---|---|---|
| Overlong line disrupts next prompt | Drain the remainder of the logical line | Stream errors are not richly diagnosed |
| EOF causes invalid buffer use | Check fgets result | Future input paths could regress |
| Unsafe character conversion | Cast to unsigned char before tolower | Not Unicode-aware |
| Malicious source change | Code review, CI and CodeQL | CI cannot guarantee absence of defects |
| Tampered checked-in executable | Build from reviewed source | Binary provenance is not independently attested |

There is no authentication, authorization, network surface, database, service account, or remote data store to threat-model. Do not invent controls for systems that do not exist.

## Verification
Review input-boundary tests, run strict compilation, inspect CodeQL alerts, and build from source when executable provenance matters.
