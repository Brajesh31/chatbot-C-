# 🧑‍🔧 Developer Guide

## 1. Start with the real program boundary

Simple C Chatbot is one C11 translation unit and a terminal interaction loop. Start with README.md, docs/architecture.md, docs/features.md, docs/api-reference.md and chatbot/chatbot.c. The source does not contain a web frontend, an API server, a database, account management, an AI model, or a package-based runtime.

The important processing path is:

~~~mermaid
flowchart TD
 A[main prompt loop] --> B[read_input_line]
 B -->|accepted| C[normalize_input]
 C --> D[classify_input]
 D --> E[response_text]
 E --> F[stdout]
 B -->|overlong| G[drain and warn]
 B -->|EOF or error| H[exit]
 F --> I{exact bye?}
 I -->|No| A
 I -->|Yes| H
~~~

## 2. Understand the source responsibilities

| Source symbol | Responsibility | Change impact |
|---|---|---|
| ResponseKind | Finite response categories | Update enum mapping and unit expectations together |
| read_input_line | Bounded logical-line reader | Requires process-level boundary and EOF tests |
| normalize_input | Byte normalization | Consider locale and unsigned-char behavior |
| is_exit_command | Exact exit predicate | Test near-matches and collisions |
| classify_input | Ordered phrase rules | Rule order is a user-visible contract |
| response_text | Fixed response mapping | Keep enum and response table synchronized |
| main | Prompt, flush, read, output and termination | Verify complete process behavior |

Helpers are file-local. They are not a published C library interface. Tests include or compile the source to verify internal behavior, so renaming a helper may require test updates.

## 3. Local development setup

Requirements:
- A C11-capable compiler such as GCC, Clang or MinGW-w64.
- Git to clone and manage changes.
- GNU Make for convenient build and test targets.
- Python 3 for offline repository validation.
- A POSIX shell and awk for the Linux interactive suite.

Run prerequisite checks:

~~~sh
sh scripts/setup.sh
~~~

Build and run:

~~~sh
make
make run
~~~

Run all local checks:

~~~sh
make check
~~~

On Windows, use scripts/setup.ps1, compile using MinGW, run the C unit-test executable, and run tests/test_interactive.ps1 as shown in tests/README.md.

## 4. Safe change workflow

~~~mermaid
flowchart TD
 A[Identify user-visible behavior] --> B[Read implementation and existing tests]
 B --> C[Write expected examples and edge cases]
 C --> D[Make the smallest coherent source change]
 D --> E[Add regression tests]
 E --> F[Build with strict warnings]
 F --> G[Run unit and process suites]
 G --> H[Update docs and diagrams]
 H --> I[Run make check]
 I --> J{All applicable checks pass?}
 J -->|No| D
 J -->|Yes| K[Review diff and submit PR]
~~~

Before editing, identify affected behavior:
- Input size, newline handling or EOF affects the reader contract and process tests.
- Phrase rules affect ordering and overlap expectations.
- Response text affects user examples, tests and README examples.
- Build configuration affects toolchain support and CI.
- Repository file paths affect the complete tracked tree and docs index.

## 5. Adding or changing a phrase rule

A new rule must define:
1. Whether matching is a substring or exact match.
2. Its position in the rule-precedence order.
3. How case normalization affects it.
4. What happens when multiple rules match.
5. What input should not match.
6. Whether the rule can change process termination.

Add at least one positive case, one negative case and one collision case. If it modifies exit behavior, add process-level tests proving whether the session continues or stops.

## 6. C implementation expectations

- Keep the C11 target and warnings-as-errors.
- Prefer clear helper contracts over clever compact code.
- Check input/read results before using buffers.
- Preserve the input buffer bound and logical line drain.
- Convert through unsigned char before character classification functions.
- Use fixed response constants and safe formatting.
- Avoid global mutable state unless a reviewed design requires it.
- Keep resource ownership obvious and avoid unnecessary heap allocation.
- Do not silence compiler diagnostics simply to obtain a passing build.

## 7. Dependency policy

The C standard library is sufficient for the current feature set. A new dependency requires a documented user need, a license review, an update and vulnerability strategy, a build integration plan, and an estimate of maintenance cost. Do not create an empty lockfile or package manifest merely for appearance.

## 8. Documentation and diagrams

After a behavior change, check:
- README behavior description and terminal examples.
- Architecture, feature and function references.
- Input data flow and state/sequence diagrams.
- Test strategy and compatibility matrix.
- Security/threat assessment if the trust boundary changes.
- Changelog, roadmap and tracked file tree when applicable.

The docs validators check local references, SVG structure and Markdown fence balance. They do not establish that external URLs remain live or that every Markdown style rule is met.

## 9. Before opening a pull request

Include a clear problem statement, the intended behavior, the changed files, commands executed, actual test results, platform coverage, skipped checks, limitations and any relevant issue. Use the templates in docs/templates/ when a durable design, feature, risk or release record is needed.
