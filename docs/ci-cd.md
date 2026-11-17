# ⚙️ CI/CD Overview

The repository uses GitHub Actions for continuous integration, static analysis, documentation validation, and an optional source-build artifact.

~~~mermaid
flowchart TD
 P[Push or pull request] --> C[Linux and Windows CI]
 C --> T[Compile and test]
 P --> Q[CodeQL analysis]
 P --> D[Documentation validation]
 S[Manual release dispatch with tag] --> R[Checkout tagged source]
 R --> B[Build and test]
 B --> A[Upload Linux executable artifact]
~~~

| Workflow | Trigger | Purpose |
|---|---|---|
| ci.yml | Push, PR, manual | Linux test suite and Windows source/unit-test build |
| codeql.yml | Push, PR, weekly, manual | C/C++ static analysis |
| docs-validation.yml | Push, PR, manual | Local documentation links and SVG validation |
| security-scan.yml | Push, PR, weekly, manual | GCC analyzer and strict build/test |
| release.yml | Manual with existing tag | Build/test and upload Linux executable |

Workflows use read-only repository permissions unless a specific capability requires more. The release workflow does not publish a GitHub Release.
