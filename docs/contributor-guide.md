# 🤝 Contributor Guide

## 1. Project scope before contributing

Simple C Chatbot is a deterministic C11 terminal application. It reads one line, normalizes bytes, applies ordered phrase rules and prints fixed responses. It is not an AI/LLM product and does not include an HTTP API, web frontend, database, user-account system, analytics or hosted deployment.

Read the root README.md, CONTRIBUTING.md, CODE_OF_CONDUCT.md and SECURITY.md, along with:
- docs/scope-and-limitations.md
- docs/architecture.md
- docs/development-workflow.md
- docs/testing.md
- docs/quality-gates.md

## 2. Environment setup

| Tool | Purpose | Required for runtime? |
|---|---|---|
| C11 compiler | Build the application | Yes, when building from source |
| Git | Clone and manage branches | No, if source is already available |
| GNU Make | Convenient build/test targets | No |
| Python 3 | Offline docs and repository validators | No |
| POSIX shell and awk | Linux interactive integration suite | No, except for full Linux test workflow |

Check prerequisites with sh scripts/setup.sh on POSIX or scripts/setup.ps1 in PowerShell.

## 3. Contribution lifecycle

~~~mermaid
flowchart TD
 A[Read issue and scope] --> B[Discuss major changes]
 B --> C[Create focused branch]
 C --> D[Inspect source and tests]
 D --> E[Implement minimal coherent change]
 E --> F[Add regression tests]
 F --> G[Run make check]
 G --> H[Update docs and visuals]
 H --> I[Review diff and file tree]
 I --> J[Open pull request]
 J --> K[Maintainer review]
 K --> L[Merge after approval]
~~~

## 4. Branch and commit practices

Use a short branch name that describes the work, such as fix/input-eof or docs/build-guide. Keep unrelated refactors out of a behavior fix. Use commit messages that summarize the outcome, for example:
- fix: preserve exact-limit input lines
- test: cover overlong line drain
- docs: clarify rule precedence
- chore: update compiler workflow

Do not commit generated build output or unrelated local binaries.

## 5. C code expectations

- Target C11.
- Preserve strict warning flags.
- Use descriptive identifiers and small functions with clear responsibilities.
- Keep input bounded and handle EOF/read errors.
- Convert to unsigned char before tolower.
- Use explicit rule precedence and test overlap behavior.
- Avoid unsafe input formatting or shell execution.
- Avoid unnecessary dynamic memory or dependencies.

## 6. Tests and evidence

Run:

~~~sh
make check
~~~

At minimum, a behavior change should include unit assertions and process-level cases when stdin/stdout, EOF, prompting or termination changes. Input-reader changes must consider 254-byte, 255-byte and 256-byte cases, both newline-terminated and final-at-EOF input, plus a valid message after a rejected long line.

In the pull request, report the exact commands run and their results. Do not claim Windows or macOS testing from a Linux-only run.

## 7. Documentation requirements

Update every affected page, not only the README. Review examples, Mermaid diagrams, SVG descriptions, function references, compatibility notes and complete tracked-file inventory. If a change introduces a new file, update the root README and docs/project-structure.md tree in the same change.

Use the records in docs/templates/ for features, ADRs, tests, threat review, bugs, incidents and release notes. Templates are forms for future records, not evidence that the underlying subsystem exists.

## 8. Pull request expectations

A useful pull request includes:
- Problem and intended user impact.
- Summary of implementation decisions.
- Before/after behavior where relevant.
- Tests executed with runner/platform details.
- Screenshots only if a real visual interface exists and has actually been captured.
- Risks, compatibility impact and limitations.
- Documentation and diagram updates.
- Any checks not executed and why.

## 9. Security, privacy and conduct

Never commit secrets, real user transcripts or private data. Report vulnerabilities through the private route in SECURITY.md, not public issues. Follow CODE_OF_CONDUCT.md and treat reviewers and other contributors respectfully.
