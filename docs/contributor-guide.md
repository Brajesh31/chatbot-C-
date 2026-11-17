# 🤝 Contributor Guide

## Start with project scope

This is a small C11 terminal chatbot. Read README.md, docs/scope-and-limitations.md, and docs/development-workflow.md before proposing a broad redesign. Do not assume the project has an API, GUI, database, or AI model.

## Local setup

Install a C11 compiler, Git, Python 3 for documentation checks, and GNU Make for convenient targets. The application has no third-party runtime package installation.

## Change workflow

1. Search existing issues and discuss larger changes first.
2. Create a focused branch.
3. Read the source and tests related to the proposed change.
4. Implement the smallest coherent modification.
5. Add unit or interactive tests for behavior.
6. Run make check.
7. Update README, technical guides, diagrams, and the project tree.
8. Review the diff for generated files, secrets, stale examples, and accidental deletions.
9. Open a pull request with commands and evidence.

## C code expectations

Use C11, descriptive helper names, bounded input, checked read results, clear ownership, and standard library facilities. Do not weaken warnings-as-errors to hide defects.

## Review and conduct

PRs must explain user impact, rule precedence, edge cases, platform testing, and any skipped checks. Follow CODE_OF_CONDUCT.md. Report vulnerabilities privately through SECURITY.md.

## Templates

Use the relevant feature, test, security, release, and review templates under docs/templates/.
