# 🧪 Security Testing

Security checks focus on the native C input boundary and supply-chain hygiene.

| Check | Command or system | What it can detect |
|---|---|---|
| Strict compiler diagnostics | make test | Common compiler warnings treated as errors |
| GCC static analyzer | security workflow | Some classes of path and memory misuse |
| CodeQL | codeql.yml | Static analysis findings supported by CodeQL |
| Long-line test | interactive shell suite | Incorrect handling of overlong input |
| EOF test | interactive shell suite | Process behavior when stdin closes |

These checks complement manual review. They are not fuzzing, a penetration test, a memory-safety proof, or a formal audit. A security-sensitive finding must follow the private disclosure process.
