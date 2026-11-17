# 🏛️ Project Governance

## Purpose
This repository is a small standard-C command-line learning project. It is maintained as a phrase-matching chatbot, not an AI service.

## Maintainer
The project is maintained by Brajesh Kumar through [@brajesh31](https://github.com/Brajesh31). No response-time guarantee is made.

## Principles
- Prefer simple, portable C code.
- Keep input bounded and check input results.
- Add dependencies only when justified.
- Keep documentation aligned with code.
- Require tests for behavior changes.
- Do not present fixed phrase matching as natural-language understanding.

## Review
Changes to input parsing, character handling, rule priority, or exit semantics require regression tests. Platform/build changes must record the compiler commands and test evidence. Significant design decisions should have an ADR.

## Release authority
Build release binaries from a tagged source revision, record toolchain details, run tests, and include the MIT license. Do not overwrite the historical Windows executable without an intentional release update.
