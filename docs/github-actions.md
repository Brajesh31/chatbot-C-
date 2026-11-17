# 🤖 GitHub Actions Guide

## Workflow inventory

| Workflow | Trigger | Responsibility |
|---|---|---|
| ci.yml | Push, pull request, manual | Linux full quality gate and Windows C source/unit-test build |
| lint.yml | Push, pull request, manual | Markdown fence, local link/SVG, and tracked-tree checks |
| docs-validation.yml | Push, pull request, manual | Dedicated offline documentation and SVG validation |
| security-scan.yml | Push, pull request, weekly, manual | Secret-pattern hygiene, tests, and GCC analyzer |
| codeql.yml | Push, pull request, weekly, manual | CodeQL C/C++ extraction and static analysis |
| dependency-review.yml | Pull request | Review dependency graph changes where GitHub can resolve them |
| release.yml | Manual with an existing tag | Build, test, and upload a Linux executable artifact |

Build and tests are intentionally consolidated in ci.yml rather than duplicated into separate build.yml and test.yml workflows. The quality checks are separated into focused validation workflows so a failure is easier to identify.

## Security and permissions

- Workflows declare minimal repository permissions.
- Read-only contents access is used where practical.
- Dependency review receives pull-request read permission only.
- CodeQL receives security-events write access because it uploads analysis.
- Avoid placing secrets in YAML files.
- Review action updates before merging them.

## Local reproduction

~~~sh
make check
sh scripts/security-check.sh
python3 scripts/validate_markdown.py
python3 scripts/check_project_structure.py
~~~

The Windows workflow uses MinGW and PowerShell-specific commands, so it is not an exact reproduction of the Linux shell integration job.

## Workflow troubleshooting

Open the failed run, inspect the exact step, reproduce the command locally where possible, and correct the underlying cause. A workflow definition is not evidence of a successful check. Report skipped platform tests explicitly.
