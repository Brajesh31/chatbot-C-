# 🖼️ Visual Assets

| Asset | Purpose | Accessible description |
|---|---|---|
| [logo.svg](logo.svg) | Project mark | Terminal prompt and speech symbol |
| [project-banner.svg](project-banner.svg) | README hero banner | Terminal-inspired title banner for a C command-line chatbot |
| [architecture-overview.svg](architecture-overview.svg) | Component architecture | Input, reader, normalizer, classifier, response mapper and output |
| [system-design.svg](system-design.svg) | High-level system design | Terminal user, local C process, transient data and output boundary |
| [workflow-diagram.svg](workflow-diagram.svg) | Contribution workflow | Scope, implementation, testing, local check and review |
| [data-flow-level0.svg](data-flow-level0.svg) | DFD Level 0 | User and local chatbot process boundary |
| [data-flow.svg](data-flow.svg) | DFD Level 1 | Transient input pipeline, long-line warning and EOF exit |
| [data-flow-level2.svg](data-flow-level2.svg) | DFD Level 2 | Reader, length checks, normalization and response selection |
| [application-state.svg](application-state.svg) | State diagram | Startup, read, normalize, respond, retry and exit |
| [cli-sequence.svg](cli-sequence.svg) | Example session visual | Illustrative terminal transcript showing hello and bye |
| [error-handling.svg](error-handling.svg) | Error-handling flow | Valid line, EOF/error and overlong-line branches |
| [deployment-flow.svg](deployment-flow.svg) | Distribution | Tag, compile, test, package and user verification |
| [ci-pipeline.svg](ci-pipeline.svg) | CI workflow | Linux, Windows, docs and static-analysis jobs |
| [testing-workflow.svg](testing-workflow.svg) | Test pipeline | Build, unit tests, integration tests, docs and static analysis |
| [security-boundaries.svg](security-boundaries.svg) | Trust boundaries | Untrusted input crosses bounded local processing |
| [security-architecture.svg](security-architecture.svg) | Security architecture | Local application boundary and absent network/storage components |
| [chatbot-flow.svg](chatbot-flow.svg) | Original program flow | Read, classify, respond and continue/exit |
| [response-priority.svg](response-priority.svg) | Rule priority | Ordered greeting, status, exit and fallback rules |
| [screenshots/](screenshots/README.md) | Screenshot policy | Explains why no fabricated desktop/mobile UI screenshots are present |

## Asset policy

All SVGs are hand-authored vector explanations, not screenshots of a running UI. They include title and description metadata. The application has no graphical UI, so fabricated desktop/mobile screenshots are intentionally not included. The terminal visual is an illustrative transcript, not a screenshot claim.

Use meaningful alt text, preserve aspect ratio, and run python scripts/validate_docs.py after modifying an SVG.
