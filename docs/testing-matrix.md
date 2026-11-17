# 🧪 Automated Testing Matrix

This matrix maps behavior to test suites and execution environments. It does not claim exhaustive correctness or a numeric coverage percentage.

## Behavior coverage

| Scenario | Linux POSIX | Windows PowerShell | C unit suite | Expected result |
|---|---:|---:|---:|---|
| Greeting phrase | Yes | Yes | Yes | Fixed greeting |
| Uppercase normalization | Yes | Yes | Yes | Same greeting classification |
| Status phrase | Yes | Yes | Yes | Fixed status response |
| Exact `bye` command | Yes | Yes | Yes | Goodbye response and exit |
| `goodbye` is not exit command | Yes | Yes | Yes | Fallback, then continue |
| Empty string classification | No separate process case | No separate process case | Yes | Fallback response |
| EOF before input | Yes | Yes | No | Input-closed message and exit |
| 254-byte final line | Yes | Yes | No | Accepted |
| 255 bytes plus newline | Yes | Yes | No | Accepted |
| 255 bytes followed by EOF | Yes | Yes | No | Accepted |
| 256 bytes plus newline | Yes | Yes | No | Rejected as one logical line |
| 256 bytes followed by EOF | Yes | Yes | No | Rejected, next read handles EOF |
| Remainder after overlong line | Yes | Yes | No | Drained before next prompt |

## C unit tests

The C unit test translation unit includes the application source with its `main` renamed for the test build. It covers greeting detection, uppercase normalization, status phrase detection, exact exit comparison, and fallback for unknown and empty strings. It does not directly claim coverage of terminal I/O or every C library error condition.

## Interactive tests

The Linux shell test and Windows PowerShell test launch the compiled executable with redirected stdin/stdout. They verify actual user-visible responses and line-reader boundaries. Both newline-terminated lines and final lines without a newline are tested because these are different stream conditions.

All inputs are synthetic. Tests do not access a network service, write conversation transcripts to the repository, or require secrets.

## Repository and static checks

| Check | Command/workflow | What it verifies | What it does not prove |
|---|---|---|---|
| Linux quality gate | `make check` | Build, C tests, interactive tests, docs, tree and local security heuristic | Exhaustive or all-platform correctness |
| Windows behavior | Windows CI job | MinGW build, C tests and PowerShell process scenarios | macOS, other compilers or every terminal |
| CodeQL | `.github/workflows/codeql.yml` | Configured static analysis completed | Absence of all vulnerabilities |
| GCC analyzer | `.github/workflows/security-scan.yml` | GCC static analyzer ran | Complete memory-safety proof |
| Documentation lint | Python validators | Local links/assets and fenced blocks validate | External links are live or prose is correct |

Run `make test` and `make check` before opening a pull request. On Windows, compile the app and unit test with the commands in [tests/README](../tests/README.md), then run the PowerShell integration test.

Update this matrix with every behavior or platform change. See [test strategy](test-strategy.md), [build matrix](build-matrix.md), and [compiler support](compiler-support.md).
