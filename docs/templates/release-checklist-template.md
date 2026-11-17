# 🚀 Source Release Checklist Template

## Release metadata
- Release name/version:
- Source tag:
- Commit SHA:
- Release owner:
- Planned artifact platforms:

## Source readiness
- [ ] Changes merged and reviewed on the default branch.
- [ ] Changelog and roadmap reviewed.
- [ ] Version/tag follows the versioning policy.
- [ ] No temporary or generated files are committed.
- [ ] Source tree and project structure documentation are current.

## Quality gates
- [ ] Strict C11 build passes.
- [ ] C unit tests pass.
- [ ] POSIX interactive tests pass on Linux.
- [ ] Documentation link and SVG checks pass.
- [ ] CodeQL analysis completed successfully.
- [ ] GCC analyzer completed successfully.
- [ ] Windows compile/unit-test job passes.
- [ ] Any skipped platform check is stated explicitly.

## Artifact verification
- [ ] Artifact built from the exact tag.
- [ ] Platform and architecture are labelled.
- [ ] Executable starts and exits as documented.
- [ ] Artifact hash recorded where appropriate.
- [ ] Source provenance and compiler flags recorded.

## Communication
- [ ] Release notes distinguish implemented changes from planned work.
- [ ] Known issues and compatibility limits are listed.
- [ ] Existing artifact is not silently overwritten.
- [ ] Rollback/rebuild guidance is available.

## Sign-off
| Role | Name | Date | Decision |
|---|---|---|---|
