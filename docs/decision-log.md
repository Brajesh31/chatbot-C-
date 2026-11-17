# 🧾 Architecture Decision Log

The numbered records in decisions/ are the authoritative Architecture Decision Records (ADRs). This index summarizes decisions that shape current source behavior.

## Accepted decisions

| ADR | Decision | Status | Affected areas | Rationale |
|---|---|---|---|---|
| 0001 | Keep the application a dependency-free C console program | Accepted | Language, runtime, scope and deployment | Current feature set does not justify a service or framework |
| 0002 | Use bounded input, drain overlong lines, and handle EOF | Accepted | Input reader, buffer, tests | Predictable user turns and safe input termination |

## Decision authority

A decision that materially affects the language baseline, runtime dependencies, input contract, rule precedence, distribution method, data handling, or security boundary should be recorded as an ADR.

The maintainer owns acceptance decisions. Contributors can propose changes by linking an issue or pull request. A decision is not accepted merely because code has been pushed.

## Updating decisions

1. Create a new numbered ADR using templates/adr-template.md.
2. Explain context, constraints, alternatives, trade-offs and consequences.
3. Include security, privacy, accessibility and portability implications.
4. Link the proposal, implementation and tests.
5. Mark the new ADR Proposed until a maintainer accepts it.
6. When a decision replaces an older one, update this index and mark the old record Superseded while keeping it in history.

Do not silently edit the rationale of an accepted decision to make it appear that the original choice was different.
