# 🏗️ Infrastructure and Environment Model

## Runtime footprint
The app requires an operating-system process, a C11-capable compiler for building and the C standard library. There is no infrastructure-as-code, cloud account, VM, container cluster, managed database, queue, network policy or service mesh.

GitHub Actions uses ephemeral runners for repository automation. They are CI environments, not production infrastructure.

## Environment inventory
| Environment | Purpose | Current configuration |
|---|---|---|
| Developer workstation | Build and run locally | C compiler, optional Make, Git |
| Linux CI runner | Full build/test/checks | Ubuntu GitHub-hosted runner |
| Windows CI runner | Compile and unit tests | Windows runner with MinGW |
| Release runner | Build artifact from existing tag | Ephemeral Ubuntu runner |
| Production server | Not used | No service deployment |

## Controls
- Keep runtime dependencies in the C standard library unless an approved requirement changes this.
- Treat workflow permissions and third-party Actions as supply-chain inputs.
- Keep credentials and machine-specific settings out of commits.
- Keep generated output out of version control.
- Record compiler and OS assumptions in [compatibility](compatibility.md).

There is intentionally no cloud topology. Add infrastructure only for an approved need involving remote execution, persistence or multi-user access. Related: [system design](system-design.md), [CI diagram](assets/ci-pipeline.svg), [deployment scope](deployment-scope.md).
