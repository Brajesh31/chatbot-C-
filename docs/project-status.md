# 📍 Project Status and Delivery Baseline

## Overview

Simple C Chatbot is a learning-oriented, deterministic C11 terminal program. It demonstrates bounded input, string normalization, ordered rule evaluation, fixed response mapping and safe termination on EOF. It is not an AI chatbot and does not connect to a model provider.

## Capability status

| Area | Status | Evidence / limitation |
|---|---|---|
| Terminal conversation loop | Implemented | `main` in `chatbot/chatbot.c` |
| Greeting, status and fallback rules | Implemented | `ResponseKind` classifier |
| Exact `bye` exit | Implemented | Full-string equality after normalization |
| Bounded line reader | Implemented | Fixed 256-byte buffer, 255-byte maximum message |
| Overlong-line draining | Implemented | Reader consumes the rest of the logical line |
| EOF and stream-read handling | Implemented | Reader returns a non-accepted status |
| C unit tests | Implemented | `tests/test_chatbot.c` |
| Linux process integration | Implemented | POSIX shell suite |
| Windows process integration | Implemented | PowerShell suite |
| Linux/Windows CI | Configured | Source compile and platform-specific tests |
| Documentation validation | Implemented | Offline Python validators |
| Static analysis | Configured | CodeQL and GCC analyzer |
| Graphical interface | Not implemented | No GUI or frontend framework |
| AI / LLM integration | Not implemented | Fixed rule engine only |
| API / database / persistence | Not implemented | No server, schema or history store |
| Authentication / accounts | Not implemented | Single local process |
| Hosted deployment | Not implemented | Source executable only |

## Runtime contract

The process accepts one line at a time, lowercases each accepted byte, checks `hello` first, `how are you` second, exact `bye` third, and otherwise returns the fallback response. Lines longer than 255 bytes are drained and rejected. The final line without a newline is accepted when it fits.

## Engineering and governance baseline

- Source of truth: tracked C source and the default Git branch.
- Build entry point: Makefile.
- Test entry points: C unit test, POSIX shell process test and Windows PowerShell process test.
- Local quality gate: `make check`.
- CI: Linux full checks and Windows compile/unit/process checks.
- Documentation: project guides, Mermaid diagrams and SVG illustrations.
- Governance: root contribution, conduct, security, support, changelog, roadmap, citation and ownership files.
- Reusable records: 32 templates under `docs/templates/`.

## Verification status discipline

A workflow definition is not a successful run. Record the commit SHA, run URL, runner and result when publishing a specific verification claim. A green badge is branch-level information and may refer to a different commit from a release candidate.

## Known limitations

No numeric coverage threshold, benchmark result, independent security audit, formal certification, signed binary provenance or universal platform support is claimed. The historical `chatbot/chatbot.exe` is retained but should not be treated as a current reproducible release.

## Update procedure

Update this document when a capability is merged, removed or materially changed. Link the implementation and verification evidence. Do not convert a proposal into an implemented status merely because its documentation or template exists.
