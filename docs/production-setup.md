# 🏭 Production Setup and Release Readiness

## Current production status
There is no production service deployment. The deliverable is a native local executable. There is no server, daemon, public endpoint, production database or uptime objective.

The manual GitHub workflow builds a Linux executable from an existing tag and uploads a workflow artifact. It does not publish a GitHub Release, sign binaries, generate checksums, attest provenance or certify a production build.

## Reproducible source build
~~~sh
git checkout <reviewed-tag>
make clean
make
make test
make check
~~~

Record source tag and commit SHA, OS/architecture, compiler/version, flags, Make version, test results, workflow links, artifact type and any checksum produced.

## Pre-distribution controls
- [ ] Review exact source revision.
- [ ] Confirm Linux and Windows builds as applicable.
- [ ] Run unit and interactive tests.
- [ ] Review CodeQL, GCC analyzer and secret-scan findings.
- [ ] Include the MIT license.
- [ ] Explain the 255-byte limit and exact exit command.
- [ ] Exclude temporary products and unknown binaries.
- [ ] Record artifact provenance and limitations.

No production secret store, TLS certificate, service account, health endpoint, migration, monitoring agent or backup schedule exists. Production readiness is not claimed. Related: [deployment](deployment.md), [hosting](hosting.md), [infrastructure](infrastructure.md), [release management](release-management.md).
