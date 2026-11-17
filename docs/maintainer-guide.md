# 🧭 Maintainer Guide

## 1. Role and responsibilities

The maintainer is responsible for product scope, technical direction, review quality, release coordination, repository security and keeping documentation aligned with the code. Root MAINTAINERS.md, AUTHORS.md, CODEOWNERS and GOVERNANCE.md are the repository-level ownership references.

This is a small local C application. Avoid accepting infrastructure that does not solve an actual user problem. A database, hosted service, authentication layer, AI model or frontend is not part of the current product.

## 2. Issue triage

Classify incoming reports before implementation:
- Defect in current source behavior.
- Documentation or broken-link issue.
- Build/compiler/OS compatibility issue.
- Security vulnerability, which must be handled privately.
- Feature request or product-scope proposal.
- General usage question.

For bug reports, request the affected commit, OS/architecture, compiler, exact command, minimal input, expected and actual output, process exit code and reproducibility. Ask reporters to remove credentials and personal information from logs.

## 3. Pull request review checklist

| Review area | Questions |
|---|---|
| Scope | Does the change address an agreed need without introducing unrelated services? |
| Correctness | Does implementation match the described behavior and source-level contracts? |
| Input safety | Are read results, buffer bounds, overlong-line draining and EOF correct? |
| Rule precedence | Are overlapping phrases and exact exit semantics tested? |
| C quality | Does strict C11 compilation pass without weakening warnings? |
| Tests | Do tests cover normal cases, failure paths and boundaries? |
| Documentation | Are README, indexes, diagrams, structure and limitations accurate? |
| Security | Are data flows, secrets, workflow permissions and new dependencies reviewed? |
| Accessibility | Is terminal output clear, sequential and not color-dependent? |
| Maintenance | Is there an owner and realistic ongoing cost? |

Reject a change that only compiles when it changes observable behavior without tests.

## 4. Verification and merge flow

~~~mermaid
flowchart TD
 A[Issue or proposal accepted] --> B[Review scope and risks]
 B --> C[Inspect source and baseline tests]
 C --> D[Review implementation and regression tests]
 D --> E[Run Linux checks]
 E --> F[Run Windows process suite]
 F --> G[Review docs, links, assets and tree]
 G --> H[Review static/security checks]
 H --> I{Evidence complete?}
 I -->|No| D
 I -->|Yes| J[Approve and merge]
~~~

A workflow file existing in the repository is not proof that it ran. A passing badge may refer to a different commit. Use the exact workflow run and head SHA when recording verification.

## 5. Release coordination

Follow docs/release-process.md and the release checklists under docs/templates/. The current release workflow accepts an existing tag, runs tests and builds a Linux artifact. It does not create tags, publish a GitHub Release, sign binaries, produce checksums, attest provenance or deploy a service.

Before release:
- Confirm tag and reviewed source commit match.
- Review current CI and CodeQL/security findings.
- Update CHANGELOG.md and release notes with verified information.
- Identify skipped or unsupported platform checks.
- Download and smoke-test the produced artifact.
- Record the workflow run and artifact reference.
- Disclose the limitations of the historical checked-in executable.

## 6. Security reporting and incidents

Do not ask reporters to put vulnerability details in public issues. Root SECURITY.md describes private reporting. The maintainer should triage privately, establish safe reproduction steps, assess affected commits and impact, prepare a regression test, review the fix, coordinate disclosure and preserve non-sensitive evidence.

If a credential is exposed, revoke or rotate it with the issuing provider first. Deleting the visible value does not invalidate it.

## 7. Repository governance

Review CODEOWNERS and maintainer information when responsibilities change. Discussions templates exist, but repository Discussions can only be used when enabled in repository settings. Workflow files do not prove branch protection, mandatory approvals or required status checks are active.

## 8. Maintenance expectations

Use docs/maintenance.md for recurring and event-driven care. When adding, renaming or removing files, update README.md, docs/project-structure.md and docs/README.md. Keep templates discoverable through docs/templates/README.md. Preserve existing useful assets and source history.
