# 🚀 Release Checklist

## Release identity

- [ ] Confirm the release commit and source tag.
- [ ] Confirm the tag points to the intended commit.
- [ ] Record compiler/toolchain and build flags.
- [ ] Confirm target OS and architecture.
- [ ] Review merged changes and CHANGELOG.md.

## Source and quality

- [ ] Confirm no unreviewed or generated files are committed.
- [ ] Run strict C11 compilation with warnings-as-errors.
- [ ] Run C unit tests.
- [ ] Run POSIX interactive tests on Linux.
- [ ] Run documentation/SVG validation.
- [ ] Run Markdown fence validation.
- [ ] Verify the complete tracked project tree.
- [ ] Run secret-pattern hygiene check.
- [ ] Review CodeQL and GCC analyzer results.
- [ ] Verify Windows compile/unit-test result.
- [ ] Record any unsupported platform or skipped test.

## Release artifact

- [ ] Build from the exact tagged source, not a working directory snapshot.
- [ ] Confirm executable format, platform and architecture.
- [ ] Run the artifact in a clean environment where practical.
- [ ] Record the artifact hash if distributing it.
- [ ] Record source commit, compiler/version and flags.
- [ ] Include source reference and MIT license.
- [ ] Do not overwrite the historical checked-in Windows binary silently.

## Documentation and communication

- [ ] Update release notes with additions, fixes, changes and limitations.
- [ ] Ensure README examples match source behavior.
- [ ] List known issues and compatibility limits.
- [ ] Do not claim formal certification, coverage or performance without evidence.
- [ ] Publish release notes only after artifact and test evidence are verified.

## Recovery and sign-off

- [ ] Preserve previous source tags/artifact references for recovery.
- [ ] Confirm rollback or rebuild steps.
- [ ] Record owner and reviewer sign-off.
- [ ] Capture CI links and unresolved risks.

The current release workflow builds from an existing tag and uploads a Linux artifact. It does not create a tag, publish a GitHub Release, sign, or attest binaries.
