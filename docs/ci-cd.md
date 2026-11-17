# ⚙️ CI/CD Overview

The repository uses GitHub Actions for source compilation, tests, documentation validation, security analysis, dependency review, and optional source artifact creation.

~~~mermaid
flowchart TD
 P[Push or pull request] --> C[CI build and tests]
 P --> L[Lint and documentation checks]
 P --> S[GCC security scan]
 P --> Q[CodeQL analysis]
 P --> D[Dependency review on pull requests]
 C --> R[Review actual results]
 L --> R
 S --> R
 Q --> R
 D --> R
 T[Manual dispatch with existing tag] --> B[Checkout tagged source]
 B --> V[Build and test]
 V --> A[Upload Linux artifact]
~~~

## Workflow inventory

| Workflow | Purpose |
|---|---|
| ci.yml | Linux make check and Windows compile/unit tests |
| lint.yml | Markdown, documentation paths, SVG and tree validation |
| docs-validation.yml | Dedicated link and asset validation |
| security-scan.yml | Repository hygiene, tests and GCC analyzer |
| codeql.yml | CodeQL source extraction and analysis |
| dependency-review.yml | Pull-request dependency graph review |
| release.yml | Manual tagged source build and artifact upload |

Build and test jobs are combined in ci.yml. Separate build.yml and test.yml files would repeat the same commands and produce conflicting status checks, so they are intentionally consolidated.

## Release behavior

The release workflow requires an existing tag and uploads a Linux executable artifact. It does not create a tag, publish a GitHub Release, sign an artifact, or attest binary provenance.

## Trust and limitations

Workflows use hosted runners and pinned major action references. Hosted toolchains change over time. A passing run demonstrates success for that run, not universal platform compatibility or a formal security certification.
