# 🧭 Maintainer Guide

## Responsibilities

The maintainer owns scope decisions, technical review, release coordination, security-report triage, and keeping repository metadata and docs accurate. See the root MAINTAINERS.md and GOVERNANCE.md.

## Pull request review

Check that:
- the issue and expected behavior are clear;
- source changes stay within the project's scope;
- C code compiles with warnings-as-errors;
- tests cover normal and boundary behavior;
- README and documentation match the implementation;
- Mermaid/SVG assets remain valid and accessible;
- dependencies and workflow permissions are justified;
- no existing useful files were removed;
- any skipped check is stated explicitly.

## Release management

Follow release-management.md and the release checklist template. Use an existing reviewed tag for the manual artifact workflow. Verify the artifact and preserve its source provenance. The current workflow does not create GitHub Releases automatically.

## Security

Do not ask reporters to publish vulnerability details in public issues. Use the private security advisory URL in the GitHub issue configuration and follow SECURITY.md.
