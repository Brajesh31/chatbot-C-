# 🏷️ Versioning Policy

## Current release state

The repository does not currently maintain a published package registry or a verified sequence of tagged semantic releases in this policy. The main branch is active development. A commit hash identifies a source revision; it is not automatically a product release.

## Proposed semantic versioning

When regular releases begin, use MAJOR.MINOR.PATCH:

| Change type | Version component | Example |
|---|---|---|
| Incompatible change to a published command-line contract or distribution format | MAJOR | 1.0.0 to 2.0.0 |
| Backward-compatible user-visible feature | MINOR | 1.2.0 to 1.3.0 |
| Backward-compatible bug fix or documentation/build correction | PATCH | 1.2.1 to 1.2.2 |

A change to internal helper functions that are not part of a published library ABI is not automatically a public API-breaking change.

## Release process

- Select a reviewed source commit.
- Update CHANGELOG.md with additions, changes, fixes, removals and known limitations.
- Review ROADMAP.md and project status.
- Run make check and all supported platform workflows.
- Create a version tag only after the release decision.
- Build artifacts from the exact tag.
- Record OS, architecture, compiler and flags.
- Preserve a source reference for every published binary.

The current manual release workflow expects an existing tag. It does not create the tag or publish a GitHub Release.

## Pre-release versions

When a pre-release is necessary, use an explicit suffix such as **1.0.0-alpha.1**. Do not imply that an alpha or release candidate is stable.

## Migration and deprecation

If a release changes supported phrases, input length, exit behavior, or build targets incompatibly, document the migration and deprecation period before tagging the release.

## Accuracy rule

Never add a version badge, changelog heading, release note or download link for a version that has not actually been tagged and built.
