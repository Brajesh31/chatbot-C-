# 🗺️ Technical Roadmap

This roadmap is directional and does not promise delivery dates.

## Current baseline
A single-file C console chatbot with bounded input, basic phrase classification, C unit tests, shell smoke tests, and cross-platform compile checks.

## Possible extensions
1. Move response rules into a small data-driven table.
2. Add a command listing supported phrases.
3. Split source into header/implementation files if complexity grows.
4. Add sanitizers and more static analysis to CI.
5. Publish source-built release artifacts for supported OS/architectures.
6. Add Unicode-aware text handling only after considering portability and dependencies.

Do not add an LLM or network backend without a separate design, privacy review, dependency review, and clear user-facing distinction from the rule-based application.
