# 🗺️ Project Roadmap

This roadmap describes potential work for the current C command-line chatbot. Items are proposals, not delivery commitments. A capability is implemented only after source, tests, documentation and verification are merged.

## 📍 Current status

| Area | Status | Evidence / boundary |
|---|---|---|
| Deterministic phrase matching | Implemented | Ordered rules in `chatbot/chatbot.c` |
| Bounded input and overlong-line draining | Implemented | 256-byte buffer, 255-byte input limit, boundary tests |
| Exact-fit line and EOF handling | Implemented | Extra-byte probe and integration coverage |
| C unit tests | Implemented | `tests/test_chatbot.c` |
| Linux POSIX interactive tests | Implemented | `tests/test_interactive.sh` |
| Windows process-level tests | Implemented | `tests/test_interactive.ps1` |
| Linux and Windows source CI | Implemented | `.github/workflows/ci.yml` |
| Documentation/tree/asset checks | Implemented | Python validators and GitHub workflows |
| CodeQL and GCC static analysis | Configured | Static-analysis workflows, not a formal audit |
| AI model, network API, database, authentication, GUI | Not implemented | Explicit product non-goals |

## 🎯 Near-term engineering priorities

| Priority | Proposal | Reason | Acceptance evidence |
|---|---|---|---|
| High | Add compiler sanitizers to a separate CI job | Catch memory and undefined-behavior defects beyond ordinary warnings | Reproducible sanitizer run on supported hosted runner |
| Medium | Add Clang and macOS build coverage | Reduce reliance on GCC and two OS families | Build and tests pass with recorded compiler versions |
| Medium | Add fuzz/property tests for input reader and classifier | Explore unusual byte sequences and line endings | Bounded, repeatable corpus with regression cases |
| Medium | Add measured branch/line coverage reporting | Show what tests execute without inventing percentages | Retained tool output and documented limitations |
| Low | Add optional help/version output | Improve first-run discoverability | User need, command contract, tests and docs approved |

## 🧭 Longer-term possibilities

- Configurable phrase rules if users need customization and a safe data format is selected.
- A clearer command parser if the rule set grows beyond a few fixed phrase checks.
- Separate translation units if the single source file becomes difficult to maintain.
- A terminal help/version interface with documented exit codes.
- A packaging script for source-built binaries if a supported distribution target is selected.

Each proposal needs a feature specification, impact/risk review, acceptance criteria, test plan, documentation changes and a named maintainer before implementation.

## 🚫 Explicit non-goals

A hosted AI chatbot, database, user-account system, remote API, browser UI, mobile application, analytics platform and cloud deployment are outside the current product definition. Do not add these merely to make the repository appear larger.

## 🗓️ Milestones and release policy

No delivery dates are assigned. A milestone requires a scoped proposal, owner, acceptance criteria, test evidence and realistic maintenance plan. Releases should follow the [release process](docs/release-process.md) and [release checklist](docs/templates/release-checklist-template.md).

## 🤝 Propose work

Use [feature specification](docs/templates/feature-specification-template.md), [feature proposal](docs/templates/feature-proposal-template.md), or [change request](docs/templates/change-request-template.md). Include user value, exact input examples, rule-precedence impact, portability, security/privacy impact, tests and documentation changes.
