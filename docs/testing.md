# 🧪 Testing and Verification Guide

## 1. Test objectives

The test suite protects the deterministic rule contract, safe handling of accepted and overlong input, EOF behavior, strict compilation and documentation consistency. Tests are local and deterministic; the application does not require external services.

## 2. Test assets

| Level | File / command | What it verifies |
|---|---|---|
| Unit | `tests/test_chatbot.c` | Normalization, response classification, rule order, exact exit and fallback |
| Linux process integration | `tests/test_interactive.sh` | Real stdin/stdout, prompting, output, EOF, accepted and rejected line lengths |
| Windows process integration | `tests/test_interactive.ps1` | Same user-visible process behavior through PowerShell |
| Build | `make` / CI | C11 compilation with strict warnings |
| Documentation | `scripts/validate_docs.py` | Local Markdown links and top-level SVG XML/accessibility metadata |
| Markdown structure | `scripts/validate_markdown.py` | Balanced fenced code blocks in tracked Markdown |
| Repository structure | `scripts/check_project_structure.py` | Documented inventory equals tracked Git files |
| Repository hygiene | `scripts/security_check.py` | Selected secret-like patterns in tracked text |
| Static analysis | CodeQL and GCC analyzer workflows | Supported static analysis of C source |

## 3. Run locally

~~~sh
make
make run
make test
make docs-check
make markdown-check
make structure-check
make security-check
make check
~~~

The POSIX interactive script requires a POSIX-compatible shell and the utilities it invokes. The full Linux CI job installs build tools and Python before running `make check`.

## 4. Behavior matrix

| Scenario | Expected result | Relevant check |
|---|---|---|
| `hello` | Greeting response | Unit + process |
| `HELLO` | Same greeting after normalization | Unit + process |
| `how are you?` | Status response unless greeting also matched | Unit + process |
| `hello and bye` | Greeting; session continues | Unit + process |
| `bye` | Goodbye; process exits | Unit + process |
| `goodbye` | Fallback; session continues | Unit + process |
| Empty line | Fallback | Unit + process |
| EOF before next line | Input-closed message and exit | Process |
| 254-byte message | Accepted | Process |
| Exactly 255 bytes with newline | Accepted | Process |
| Exactly 255 bytes followed by EOF | Accepted as final line | Process |
| 256-byte or longer line | Entire line rejected and drained | Process |
| Valid line after overlong line | Read as a new independent turn | Process |

## 5. CI platform matrix

| Runner | Compiler / tooling | Checks executed | Not implied |
|---|---|---|---|
| Ubuntu hosted runner | GCC-compatible `cc`, Make, Python 3, POSIX shell | `make check`, C unit tests, POSIX interactive tests, local docs/structure/security checks | macOS or every Linux distribution |
| Windows hosted runner | MinGW GCC, PowerShell | Application compile, C unit tests, PowerShell interactive tests | POSIX shell suite or all Windows terminals |
| CodeQL runner | GitHub CodeQL C/C++ analysis | Build and static analysis | Independent penetration test |
| Security scan runner | Gitleaks and GCC analyzer | Repository secret-history scan and static analysis | Proof that no vulnerability exists |

## 6. Test design rules

- Test observable behavior through the process when the contract includes stdin, stdout, prompt flushing, EOF or process exit.
- Keep unit tests deterministic and independent from network access.
- Test the exact boundary, one byte below, and one byte above.
- Test both newline-terminated and EOF-terminated final lines.
- Ensure an overlong line cannot leak its remaining bytes into a subsequent turn.
- Check process termination and exit codes, not only response text.
- Keep logs free of secrets and private user data.
- Add a regression case for every fixed defect.

## 7. Acceptance criteria for a code change

A behavior-affecting pull request should pass strict compilation, relevant unit tests, process-level tests, repository checks, and documentation review. A change to line input must rerun both platform process suites. A change to project files must regenerate and validate the tracked tree. Security-sensitive changes must update the threat assessment and be reviewed before release.

## 8. Coverage limitations

The repository does not publish a numeric coverage percentage. Tests do not exhaust every possible byte sequence, C locale, compiler version, architecture, terminal emulator or operating-system release. No performance benchmark or formal security certification is claimed. See [test coverage](test-coverage.md), [compatibility](compatibility.md) and [quality gates](quality-gates.md).
