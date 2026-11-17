# 🧩 Compatibility Matrix

## Supported development baseline

The source targets the C11 language standard and relies on the standard C library. The primary compatibility checks are automated builds on hosted Linux and Windows runners.

| Environment | Build command | Automated coverage | Status |
|---|---|---|---|
| Linux hosted runner | Makefile with C11 warnings-as-errors | Unit tests and POSIX interactive tests | Verified by current CI run |
| Windows hosted runner | MinGW GCC C11 compile | Application compile, C unit tests and PowerShell interactive boundary tests | Configured and exercised by the default-branch CI workflow |
| macOS | Direct C11 compiler invocation | Not currently in CI | Expected to be portable, not yet verified here |
| Other Unix-like systems | Compatible C11 compiler | Not currently in CI | Not verified |

## Compiler expectations

See [compiler support](compiler-support.md) and the [build matrix](build-matrix.md) for the configured compiler paths and unverified platforms.

Use a compiler that supports C11, including the standard headers used by the source. The Makefile defaults to GCC/Clang-compatible flags. A compiler that does not understand the selected warning flags may require an explicit local CFLAGS override, but warnings should not be suppressed simply to obtain a build.

## Terminal expectations

The application uses stdin and stdout. It does not require a graphical desktop, terminal color support, a network connection, or an interactive terminal API. Shell editing behavior is supplied by the user's terminal and is not implemented by the chatbot.

## Known platform gap

The Linux integration suite uses POSIX utilities. Windows uses a separate PowerShell process-level test against the same executable behavior, including 254/255/256-byte boundaries. The Windows CI job does not run the POSIX shell suite. macOS and Clang toolchains are not currently in CI. A passing Linux and Windows run is not proof that every terminal, compiler, architecture, or operating-system release is supported.

## Adding a platform

A compatibility claim requires a reproducible compiler command, build result, unit-test result, and any platform-specific integration test. Add the environment to this table only after evidence exists.
