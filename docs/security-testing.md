# 🧪 Security Testing

Security checks focus on the native C input boundary, repository hygiene, and build pipeline.

| Check | Command/workflow | Purpose | Limitation |
|---|---|---|---|
| Strict compiler diagnostics | make test | Treat common warnings as errors | Not proof of correctness |
| GCC static analyzer | security-scan.yml | Analyze selected C code paths | Only checks supported patterns |
| CodeQL | codeql.yml | C/C++ static analysis | Findings depend on query and extraction |
| Local secret-pattern scan | security-check.sh | Scan tracked text files for selected patterns and conflict markers | Heuristic, not a full secret scanner |
| Gitleaks | security-scan.yml and .gitleaks.toml | Scan Git history with default rules | Findings require rotation/remediation; a clean scan is not proof of no past exposure |
| Long-line test | tests/test_interactive.sh | Exercise bounded input | POSIX shell suite |
| EOF test | tests/test_interactive.sh | Exercise end-of-stream exit | Does not model all I/O failures |

## Run locally

~~~sh
make check
sh scripts/security-check.sh
~~~

## Response

For a possible credential exposure, revoke or rotate the credential at the issuing service before focusing on repository cleanup. For code vulnerabilities, use private reporting and add a regression test with safe input.

These checks complement manual review. They are not fuzzing, penetration testing, a memory-safety proof, or a formal audit.
