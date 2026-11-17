# 🛠️ Technology Stack

| Area | Technology | Use |
|---|---|---|
| Programming language | C11 | Program logic |
| Standard headers | ctype.h, stdio.h, string.h | Character conversion, streams, string functions |
| Build | Makefile and C compiler | Compile application and tests |
| Tests | C assertions and POSIX shell | Unit and interactive checks |
| CI | GitHub Actions | Linux and Windows compile/test jobs |
| Static analysis | CodeQL and compiler diagnostics | Source-level analysis |
| Documentation diagrams | Mermaid and SVG | Explain current logic and architecture |

The code targets C11. The repository does not pin one exact GCC or Clang release. CI uses hosted runner toolchains, which can change over time; a passing run establishes compatibility with that run, not every compiler.

No frontend framework, backend server, database, browser runtime, model API, cloud service, container runtime, or JavaScript package manager is part of this repository.
