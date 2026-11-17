# 🧪 C and Interactive Test Suite

The test suite is divided by responsibility. The C unit tests cover deterministic helper behavior. The interactive tests launch the actual compiled chatbot and exercise stdin/stdout behavior, including the byte boundary and EOF cases.

## Test files

| File | Purpose | Where it runs |
|---|---|---|
| `test_chatbot.c` | Unit checks for greeting, normalization, status phrase, exact exit matching and fallback | Linux and Windows CI |
| `test_interactive.sh` | POSIX process-level tests for conversation flow, EOF, and 254/255/256-byte input boundaries with and without newline | Linux CI and compatible POSIX shells |
| `test_interactive.ps1` | Windows process-level checks using redirected standard streams | Windows CI |

## Run on Linux or compatible POSIX shell

~~~sh
make test
~~~

The Makefile builds the application and unit test binary, runs the C tests, and then runs the POSIX integration script against the freshly built program.

## Run on Windows with MinGW-w64 and PowerShell

~~~powershell
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror chatbot/chatbot.c -o chatbot-ci.exe
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror tests/test_chatbot.c -o chatbot-tests.exe
.\chatbot-tests.exe
pwsh -NoProfile -File tests/test_interactive.ps1 -AppPath ".\chatbot-ci.exe"
~~~

## Boundary scenarios

| Input | Expected behavior |
|---|---|
| 254 bytes, newline | Accepted |
| 255 bytes, newline | Accepted |
| 255 bytes, EOF without newline | Accepted |
| 256 bytes, newline | Rejected, rest of line drained |
| 256 bytes, EOF without newline | Rejected, next read observes EOF |
| Empty stream | Input-closed message and clean exit |
| `goodbye` | Fallback response, session continues |
| Exact `bye` | Goodbye response, session exits |

All tests use synthetic input. They do not access a network service, write chat transcripts to the repository, or require secrets.
