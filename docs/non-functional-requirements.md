# 🛡️ Non-Functional Requirements

| Area | Requirement | Current approach / limitation |
|---|---|---|
| Portability | Use standard C facilities | C11 source; compiler and terminal differences remain |
| Reliability | Handle input failure and EOF | Input-read result checked |
| Bounded memory | Do not accept unbounded lines | Fixed 256-byte array |
| Determinism | Same input yields same response | Fixed ordered rules |
| Privacy | Do not persist messages | No storage code |
| Network safety | No outbound requests | No networking code |
| Maintainability | Separate behavior into named helpers | Static helper functions |
| Testability | Cover rule and interactive behavior | Unit and shell tests |
| Accessibility | Work with a plain text terminal | No color-only signaling; terminal behavior varies |

## Measurable checks
Strict compilation uses warnings-as-errors. CI builds and tests on Linux and Windows. These checks do not prove universal portability, formal accessibility conformance, or absence of every security defect.

## Resource expectations
The program is intentionally lightweight. Its primary input buffer is 256 bytes; runtime memory use is effectively constant for this implementation. No performance SLA is claimed.
