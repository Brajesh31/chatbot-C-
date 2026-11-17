# 🗂️ Project Structure

This tree reflects the main repository areas, not a proposed future architecture.

~~~text
chatbot-C-/
├── .github/
│   ├── DISCUSSION_TEMPLATE/
│   ├── ISSUE_TEMPLATE/
│   ├── workflows/
│   └── PULL_REQUEST_TEMPLATE.md
├── chatbot/
│   ├── .vscode/
│   ├── chatbot.c
│   └── chatbot.exe
├── docs/
│   ├── assets/
│   ├── decisions/
│   └── templates/
├── scripts/
│   ├── README.md
│   └── validate_docs.py
├── tests/
│   ├── README.md
│   ├── test_chatbot.c
│   └── test_interactive.sh
├── AUTHORS.md
├── CHANGELOG.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── GOVERNANCE.md
├── LICENSE
├── MAINTAINERS.md
├── Makefile
├── README.md
├── ROADMAP.md
├── SECURITY.md
└── SUPPORT.md
~~~

## Directory responsibilities
| Path | Responsibility |
|---|---|
| .github/ISSUE_TEMPLATE | Structured bug, feature, docs, accessibility and performance reports |
| .github/workflows | Build, test, static analysis, docs validation and source artifact workflows |
| chatbot/ | Application source and retained historical Windows executable |
| docs/assets/ | Hand-authored SVG logo, banner and diagrams |
| docs/decisions/ | Accepted technical decision records |
| docs/templates/ | Reusable review, release, testing and security templates |
| scripts/ | Offline documentation and asset validation |
| tests/ | Unit tests and POSIX shell integration tests |
| build/ | Generated build output, ignored by Git |

## Important files
- chatbot/chatbot.c contains the application logic.
- Makefile defines local build and test targets.
- tests/test_chatbot.c covers helper functions.
- tests/test_interactive.sh checks real terminal stream behavior on POSIX.
- scripts/validate_docs.py checks local references and SVG XML.
- ci.yml contains Linux and Windows compilation/test jobs.
- codeql.yml and security-scan.yml run static analysis.
- docs-validation.yml checks Markdown links and SVG assets.

## Naming conventions
Use lowercase kebab-case for documentation filenames. Use descriptive C function names and uppercase macro names. Place reusable templates under docs/templates and architecture decisions under docs/decisions. Generated outputs belong under build/ and must not be committed.
