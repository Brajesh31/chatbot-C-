# 🐙 GitHub Repository Configuration

## Issue forms

The issue templates cover bug reports, feature requests, documentation corrections, non-sensitive security hygiene concerns, terminal accessibility issues, and performance reports. Sensitive vulnerabilities must use the private GitHub Security Advisory route configured in ISSUE_TEMPLATE/config.yml.

## Discussions

The DISCUSSION_TEMPLATE directory contains questions, ideas, and announcement templates. Repository Discussions are currently disabled in repository metadata, so GitHub may not display these templates until the feature is enabled in repository settings.

## Workflows

| File | Responsibility |
|---|---|
| workflows/ci.yml | Linux quality gate and Windows source/unit-test build |
| workflows/lint.yml | Markdown fence, link/asset and tree checks |
| workflows/docs-validation.yml | Documentation link and SVG validation |
| workflows/security-scan.yml | Secret-pattern scan, tests and GCC analyzer |
| workflows/codeql.yml | CodeQL C/C++ analysis |
| workflows/dependency-review.yml | Pull-request dependency review |
| workflows/release.yml | Manual build from an existing tag |

Build and test jobs are consolidated into ci.yml rather than duplicated as independent build.yml and test.yml files. Automated stale-issue closure is intentionally not enabled.

## Dependabot

dependabot.yml checks GitHub Actions references monthly. The C application has no third-party package manifest or lockfile.

## Permission policy

Workflows declare minimal permissions. Do not add broad write access or secrets without a concrete workflow requirement. Review action changes, permissions and third-party code before merging.
