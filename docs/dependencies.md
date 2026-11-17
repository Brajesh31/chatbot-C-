# 📦 Dependencies

## Runtime dependency inventory
| Dependency | Type | Purpose | Required |
|---|---|---|---|
| C standard library | System/compiler runtime | Character conversion, console I/O, string functions | Yes |
| GCC, Clang, or compatible C11 compiler | Build tool | Compile source | Development |
| GNU Make | Build convenience | Run named build/test targets | Optional |
| POSIX shell and awk | Test tooling | Run interactive shell tests and generate long input | Linux tests |

No third-party application library is linked by the chatbot.

## Updating dependencies
There is no package manifest or application lockfile because there are no third-party C packages. Compiler and CI action versions should still be reviewed. Dependabot monitors GitHub Actions references; it does not manage host compiler toolchains.

A dependency proposal must explain user-visible need, portability, license, maintenance, build integration, and security impact. Add a reproducible build check before documenting a dependency as required.
