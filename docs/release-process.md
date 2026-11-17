# 📦 Source Build and Release Process

## Current workflow

`.github/workflows/release.yml` is a manually dispatched source-build workflow. It accepts an existing Git tag, checks out that tag, runs the C tests, builds the Linux executable and uploads it as a GitHub Actions artifact.

It does not create tags, publish a GitHub Release, build Windows/macOS artifacts, sign binaries, create checksums, generate an SBOM, attest provenance, or deploy a service. An uploaded workflow artifact is not the same thing as a GitHub Release.

## Maintainer procedure

1. Review the intended source diff and confirm the default branch is green.
2. Update `CHANGELOG.md` with verified changes and known limitations.
3. Run `make check` on a supported POSIX environment.
4. Confirm the Windows CI job passed, including interactive boundary tests.
5. Create and push an annotated tag for the reviewed commit. Do not reuse an existing tag.
6. Open GitHub Actions and select **Source release**.
7. Choose **Run workflow**, enter the existing tag exactly, and start the workflow.
8. Confirm the run checked out the intended tag, tests passed and the Linux artifact uploaded.
9. Download the artifact and run a smoke test on the target Linux environment before distribution.
10. Record artifact/run links and manual verification in release notes or project status.

## Workflow inputs and outputs

| Item | Current value |
|---|---|
| Trigger | Manual `workflow_dispatch` |
| Required input | Existing tag string |
| Runner | `ubuntu-latest` |
| Checkout | Supplied tag |
| Test step | `make test` |
| Build step | `make` |
| Artifact | `build/chatbot` |
| Artifact name | `chatbot-linux-<tag>` |
| Not performed | Release publication, signing, checksums or attestation |

## Release gate

Do not distribute when the tag does not identify the reviewed commit, tests fail, the artifact is missing or has an unexpected target, the changelog describes changes absent from the tag, or a known security/correctness issue has not been assessed.

## Rollback and future hardening

Do not silently replace an artifact already distributed. Preserve the original tag and workflow evidence. For a faulty release, prepare a corrective commit and new tag, repeat the process, and identify the superseded version. Before public binary distribution, consider reproducible builds, versioned toolchains, SHA-256 checksums, signing, provenance, SBOM generation, a Windows build, and a documented support policy. These are proposals, not current features.

See [rollback](rollback.md), [release management](release-management.md), and [project status](project-status.md).
