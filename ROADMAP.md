# 🗺️ Project Roadmap

This roadmap describes potential work for the current C command-line chatbot. Items are proposals, not delivery commitments. A capability is considered implemented only after source, tests, documentation, and verification are merged.

## Current status

| Area | Status |
|---|---|
| Deterministic phrase matching | Implemented |
| Bounded input and overlong-line handling | Implemented |
| EOF handling | Implemented |
| Unit and POSIX interactive tests | Implemented |
| Linux/Windows source build checks | Implemented |
| GCC analyzer and CodeQL workflows | Implemented |
| Documentation and asset validation | Implemented |
| AI model, network API, database, authentication, GUI | Not implemented |

## Near-term engineering priorities

| Priority | Proposal | Reason | Acceptance evidence |
|---|---|---|---|
| High | Add broader edge-case tests for input capacity and final unterminated lines | Protect C input boundary behavior | Tests pass on supported CI environments |
| Medium | Add sanitizer-enabled test job where runner support is stable | Detect additional memory/undefined behavior issues | Reproducible sanitizer run |
| Medium | Add a reliable Windows interactive input harness | Close current POSIX-only integration gap | PowerShell-driven end-to-end tests |
| Medium | Add measured branch/line coverage reporting | Avoid unsupported coverage claims | Retained tool output and threshold rationale |
| Low | Add property-based or fuzz tests for normalization/classification helpers | Explore unexpected input combinations | Reproducible corpus and regression cases |

## Longer-term possibilities

- Optional configurable phrase rules without introducing a network dependency.
- A more explicit command parser if user scenarios justify it.
- Separate translation units if source complexity grows beyond a single module.
- A small terminal help/version interface if there is a concrete usability need.

These ideas require feature proposals and maintainer review. They are not approved implementation commitments.

## Explicit non-goals

A hosted AI chatbot, database, user-account system, remote API, browser UI, mobile application, analytics platform, and cloud deployment are outside the current product definition. They should not be added merely to make this repository appear larger.

## Milestones

No delivery dates are assigned. A milestone should be created only when a scoped proposal has an owner, acceptance criteria, tests, and a realistic maintenance plan.

## Propose work

Use docs/templates/feature-specification-template.md or docs/templates/feature-proposal-template.md. Explain user value, input examples, rule precedence, portability, security/privacy impact, tests, and documentation changes.
