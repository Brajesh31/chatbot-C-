# 🏗️ Build and CI Environment Matrix

This matrix records configured workflow jobs. Hosted runner labels such as `ubuntu-latest` and `windows-latest` move over time, so this is a description of the configured jobs, not a promise about a permanently fixed operating-system image.

## Automated matrix

| Job | Runner | Build path | Checks | Coverage boundary |
|---|---|---|---|---|
| Linux build and test | `ubuntu-latest` | GCC-compatible `cc`, Make, C11 flags | `make check`: build, unit tests, POSIX interactive tests, docs, tree and local security heuristic | Full project quality gate on Linux |
| Windows build and test | `windows-latest` | MinGW GCC, direct C11 compile | Application compile, C unit tests, PowerShell interactive tests | Does not run Linux shell or GCC analyzer commands |
| CodeQL | `ubuntu-latest` | CodeQL C/C++ extraction and autobuild | Static code analysis | Not proof of absence of vulnerabilities |
| Security scan | `ubuntu-latest` | GCC, Python and repository scripts | Secret-pattern scan, tests and GCC analyzer | Heuristic scan complements human review |
| Documentation validation | `ubuntu-latest` | Python 3 | Local link and SVG validation | Offline checks only; external links are not verified |
| Repository lint | `ubuntu-latest` | Python 3 | Markdown fences, local docs references, SVG metadata and tracked tree | No full prose grammar review |
| Dependency review | Pull request event | GitHub dependency metadata | Third-party dependency change review | No application package lockfile currently exists |

## Reproduce the main jobs

~~~sh
sh scripts/setup.sh
make check
~~~

~~~powershell
gcc --version
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror chatbot/chatbot.c -o chatbot-ci.exe
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror tests/test_chatbot.c -o chatbot-tests.exe
.\chatbot-tests.exe
pwsh -NoProfile -File tests/test_interactive.ps1 -AppPath ".\chatbot-ci.exe"
~~~

## Targets not currently in CI

| Platform/toolchain | Status | Evidence needed before claiming support |
|---|---|---|
| macOS with Clang | Not currently tested | Hosted runner, clean build and behavior tests |
| Linux with Clang | Not currently tested | Clang job with equivalent warnings and tests |
| 32-bit targets | Not verified | Cross-compile/runtime test and documented size assumptions |
| Other C libraries or embedded targets | Not verified | Defined target constraints and tested standard I/O behavior |

Update this matrix whenever a runner, compiler, workflow or test command changes. See [compiler support](compiler-support.md), [testing matrix](testing-matrix.md), and [release process](release-process.md).
