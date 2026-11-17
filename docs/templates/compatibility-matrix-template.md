# 🧩 Platform Compatibility Matrix Template

## Purpose
Define the actual compiler, OS, architecture, and terminal environments supported by a release.

## Environment matrix
| OS/version | Architecture | Compiler/version | Build command | Build | Unit tests | Integration tests | Notes |
|---|---|---|---|---|---|---|---|
| Linux | | GCC | | | | | |
| Linux | | Clang | | | | | |
| Windows | | MinGW GCC | | | | | |
| macOS | | Clang | | | | | |
| Other | | | | | | | |

## Language and runtime assumptions
- C language standard:
- Required C library facilities:
- Required shell tools:
- Build tooling:
- Platform-specific code:

## Terminal matrix
| Terminal | Input behavior | Output behavior | Accessibility notes | Result |
|---|---|---|---|---|

## Evidence requirements
For each verified cell, record the CI run or reproduction steps, compiler version, exact flags, and test results. Use Not tested for unknown combinations. Do not mark expected portability as verified support.

## Known incompatibilities and support policy
Document unsupported toolchains, workarounds, minimum versions where evidenced, and owner of follow-up.
