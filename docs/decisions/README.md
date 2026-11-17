# 🧭 Architecture Decision Records

Architecture Decision Records (ADRs) preserve the context and trade-offs behind choices that affect source behavior, dependencies, portability, data handling, security, or maintenance. They are a historical record, not a list of ideas that have not been accepted.

## Accepted decisions

| ADR | Decision | Status | Main impact |
|---|---|---|---|
| 0001 | Keep the application a dependency-free C console program | Accepted | Language, runtime, scope and deployment |
| 0002 | Use bounded line input, drain overlong lines and handle EOF | Accepted | Input safety, user turns and tests |

## When to write an ADR

Create an ADR when a change:
- Alters the input or command contract.
- Changes rule precedence or termination behavior.
- Adds a runtime dependency or supported platform requirement.
- Introduces persistence, networking, accounts or another trust boundary.
- Changes distribution, build or release responsibilities.
- Creates a material maintenance or compatibility trade-off.

A small text correction or test-only change usually does not need a new ADR.

## Lifecycle

1. Copy the ADR template.
2. Assign the next sequential identifier.
3. Describe context, constraints, options and consequences.
4. Include portability, security, privacy and accessibility considerations.
5. Link the proposal, implementation and verification evidence.
6. Mark it Proposed until the maintainer accepts it.
7. If replaced, mark the previous record Superseded and link the replacement.

## Governance

The maintainer owns acceptance. Contributors can propose a decision through an issue or pull request. Do not silently rewrite historical rationale after implementation has already relied on the decision.
