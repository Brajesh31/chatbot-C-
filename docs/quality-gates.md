# 🚦 Quality Gates and Merge Criteria

## ✅ Required local command

~~~sh
make check
~~~

This target runs the application unit and POSIX interactive tests, documentation and SVG validation, tracked Markdown fence validation, project-tree consistency and local secret-pattern hygiene checks.

## Gate matrix

| Gate | Command / workflow | Expected evidence | Typical failure response |
|---|---|---|---|
| C build | `make`, `ci.yml` | C11 compilation with warnings-as-errors | Correct source/compiler warning |
| Unit tests | `make test` | All deterministic assertions pass | Add or fix regression assertion |
| Linux process tests | `make test` | Input/output, EOF, exit and boundary scenarios pass | Reproduce through stdin/stdout |
| Windows process tests | `ci.yml` Windows job | MinGW binary, C tests and PowerShell integration pass | Reproduce with the same executable and shell |
| Local links and SVGs | `make docs-check` | Every local reference resolves; top-level SVG XML contains title/desc | Correct path or asset |
| Markdown fences | `make markdown-check` | Tracked Markdown fences are balanced | Fix malformed fence |
| Project inventory | `make structure-check` | Docs reflect tracked Git files | Regenerate README/docs tree |
| Repository hygiene | `make security-check` | Selected secret patterns do not appear in tracked text | Review and remediate without exposing secrets |
| CodeQL | `codeql.yml` | C/C++ analysis completes and findings are triaged | Review findings and data flow |
| GCC analyzer | `security-scan.yml` | Configured analyzer reports no unresolved blocking issue | Review compiler diagnostics |

## Pull-request acceptance

1. The change has a clear purpose and does not introduce unrelated dependencies.
2. Behavior changes have tests that fail before the fix and pass after it.
3. Input-reader changes have exact 254/255/256-byte and EOF coverage on relevant platforms.
4. Documentation, README examples, diagrams and project inventory match the source.
5. New assets are valid and include meaningful accessible descriptions.
6. Security, privacy, portability and maintenance impacts are explained.
7. All applicable checks have run. Skipped checks are recorded with a reason.
8. The review does not claim features, coverage, certifications or platform support without evidence.

## Release criteria

A release candidate should identify an exact source commit/tag, pass the required build and test checks, include updated release notes, disclose known limitations, and have a maintainer review. The existing release workflow creates a Linux build artifact from an existing tag. It does not currently sign artifacts, publish a formal GitHub Release, attest provenance or deploy a service.

## Repository settings boundary

Workflow YAML does not prove that branch protection, mandatory approvals, signed commits or required status checks are enabled in GitHub settings. Verify repository rules directly before describing them as enforced.
