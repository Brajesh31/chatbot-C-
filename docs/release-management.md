# 📦 Release Management

## Release model
The repository does not currently publish to a package registry. The optional workflow accepts an existing Git tag, checks out that tag, runs tests and builds a Linux executable artifact.

## Release checklist
1. Confirm the intended source is merged to main.
2. Run make test and documentation validation.
3. Review source, tests, README, roadmap, and changelog.
4. Create and verify a version tag using the versioning policy.
5. Dispatch the source release workflow with that existing tag.
6. Download and inspect the generated artifact.
7. Record the release and known limitations.

The workflow does not create a tag or publish a public GitHub Release automatically.
