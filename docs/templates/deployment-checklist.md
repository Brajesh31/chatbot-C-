# 📦 Deployment / Distribution Checklist

> Adapt to the actual delivery model. A local CLI distribution is not a hosted deployment.

## Before distribution
- [ ] Confirm target OS, architecture, and compiler/runtime assumptions.
- [ ] Build from a reviewed source tag.
- [ ] Run unit and applicable integration tests.
- [ ] Verify executable starts and exits as documented.
- [ ] Record compiler flags and build environment.
- [ ] Review source and build workflow security findings.

## Package contents
| Artifact | Included | Version/source |
|---|---|---|

## Delivery and verification
Document download location, checksum/signature where available, installation steps, and post-download test.

## Recovery
Document how to replace a faulty artifact and how users can rebuild from source.
