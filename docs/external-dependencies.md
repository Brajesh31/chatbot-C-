# 📦 External Dependency Inventory

## Runtime dependencies

The application itself depends only on the C standard library supplied by the selected compiler/runtime environment. No third-party C library is linked.

## Development and automation dependencies

| Tool | Usage | Dependency management |
|---|---|---|
| C compiler | Build application and unit tests | Installed by contributor/runner |
| GNU Make | Named build/test targets | Optional host tool |
| Python 3 | Documentation validation | Standard-library-only scripts |
| POSIX shell and awk | Linux interactive test | Hosted Linux utilities |
| GitHub Actions | CI and automation | Workflow action references |
| CodeQL action | Static analysis | GitHub Actions workflow |
| Dependabot | Action update proposals | GitHub repository service |

## Lockfiles

No package lockfile is required because the C application has no third-party package manager dependency. The toolchain versions are provided by the local environment or hosted runner and are not pinned to an exact compiler build.

## Dependency change requirements

Before adding a runtime or build dependency, document purpose, source, supported version range, license, security history, maintenance status, platform support, update mechanism, and removal strategy. Update CI and this inventory in the same change.
