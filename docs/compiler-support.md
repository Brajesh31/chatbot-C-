# 🧑‍💻 Compiler and C Language Support

## Language and library requirements

The application targets C11 and uses only the C standard library:

| Header | Purpose |
|---|---|
| `<ctype.h>` | Character conversion through `tolower` |
| `<limits.h>` | Bound for the integer size argument passed to `fgets` |
| `<stdio.h>` | Standard input and output |
| `<string.h>` | String length, phrase search and exact exit comparison |

There is no third-party C library dependency, package manager, GUI toolkit, network SDK, database client, or model runtime.

## Compiler support status

| Toolchain | Status | Evidence |
|---|---|---|
| GCC on hosted Linux | CI tested | Linux workflow builds and runs `make check` |
| MinGW-w64 GCC on hosted Windows | CI tested | Windows workflow compiles the app and tests, then runs C and PowerShell tests |
| Clang on Linux | Not yet verified in CI | Portable C11 is intended, but no current job establishes support |
| Apple Clang on macOS | Not yet verified in CI | No macOS workflow job |
| MSVC | Not configured | Current Makefile and CI commands use GCC-compatible flags |

A compiler is not called supported solely because it is expected to understand C11. Promote an unverified toolchain only after a clean build, unit tests, interactive boundary tests and documentation checks have run on it.

## Standard Makefile command

~~~sh
make
./build/chatbot
~~~

Default flags:

~~~text
-std=c11 -Wall -Wextra -Wpedantic -Werror -O2
~~~

The `CC` and `CFLAGS` variables can be overridden for local experimentation. Keep C11 mode and warnings enabled for normal development.

~~~sh
make clean
make CC=gcc CFLAGS="-std=c11 -Wall -Wextra -Wpedantic -Werror -O2"
make test
~~~

## Direct compiler examples

~~~sh
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror -O2 chatbot/chatbot.c -o chatbot
clang -std=c11 -Wall -Wextra -Wpedantic -Werror -O2 chatbot/chatbot.c -o chatbot
~~~

The Clang command is a local trial command, not proof of a maintained Clang support commitment.

Keep application behavior within the C standard library unless a dependency decision is approved. Preserve safe character handling for `<ctype.h>`, isolate platform-specific tests, and record compiler name/version in compiler bug reports.

See [build matrix](build-matrix.md), [compatibility](compatibility.md), [dependencies](dependencies.md), and [building](building.md).
