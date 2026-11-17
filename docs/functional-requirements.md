# 📋 Functional Requirements

| ID | Requirement | Current status | Verification |
|---|---|---|---|
| FR-01 | Show an opening greeting when the program starts | Implemented | Interactive test |
| FR-02 | Prompt for one user line at a time | Implemented | Interactive test |
| FR-03 | Normalize accepted input to lowercase | Implemented | Unit test |
| FR-04 | Respond to input containing “hello” | Implemented | Unit test |
| FR-05 | Respond to input containing “how are you” if the prior rule did not match | Implemented | Unit test |
| FR-06 | Exit only for exact “bye” after normalization | Implemented | Unit and interactive tests |
| FR-07 | Return fallback for unmatched input | Implemented | Unit test |
| FR-08 | Handle EOF without using an uninitialized line | Implemented | Interactive test |
| FR-09 | Reject an overlong line as one message | Implemented | Interactive test |
| FR-10 | Build from source with a C11 compiler | Implemented | CI |

## Change control
A new requirement must include a user-visible example, expected behavior, impact on rule precedence, edge cases, and tests. Requirements implying persistence, networking, or model inference need an explicit scope discussion before implementation.
