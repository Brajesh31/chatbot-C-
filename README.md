<p align="center">
  <img src="docs/assets/project-banner.svg" alt="Simple C Chatbot, a deterministic C command-line chatbot, built with standard C" width="100%">
</p>

<p align="center">
  <img src="docs/assets/logo.svg" alt="Simple C Chatbot logo" width="84">
</p>

<h1 align="center">💬 Simple C Chatbot</h1>

<p align="center">
  <a href="https://github.com/Brajesh31/chatbot-C-/actions/workflows/ci.yml"><img src="https://github.com/Brajesh31/chatbot-C-/actions/workflows/ci.yml/badge.svg" alt="C build and test workflow"></a>
  <img src="https://img.shields.io/badge/Language-C11-00599C?logo=c" alt="C11">
  <img src="https://img.shields.io/badge/Build-Makefile-427819" alt="Makefile">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="MIT License">
  <img src="https://img.shields.io/github/stars/Brajesh31/chatbot-C-?style=flat&logo=github" alt="GitHub stars">
  <img src="https://img.shields.io/github/issues/Brajesh31/chatbot-C-" alt="Open GitHub issues">
  <img src="https://img.shields.io/github/last-commit/Brajesh31/chatbot-C-" alt="Last commit">
  <a href="https://github.com/Brajesh31/chatbot-C-/actions/workflows/codeql.yml"><img src="https://github.com/Brajesh31/chatbot-C-/actions/workflows/codeql.yml/badge.svg" alt="CodeQL workflow"></a>
  <a href="https://github.com/Brajesh31/chatbot-C-/actions/workflows/docs-validation.yml"><img src="https://github.com/Brajesh31/chatbot-C-/actions/workflows/docs-validation.yml/badge.svg" alt="Documentation validation"></a>
</p>

> A small deterministic, rule-based command-line chatbot written in standard C. **This is not an AI or LLM application.** It runs locally, uses fixed phrase rules, makes no network requests, and does not save conversation history.

## 📑 Table of Contents
- [🎯 Overview](#-overview)
- [❓ Problem and solution](#-problem-and-solution)
- [✨ Features](#-features)
- [🏗️ Architecture and workflows](#-architecture-and-workflows)
- [🧰 Technology stack](#-technology-stack)
- [🚀 Installation and usage](#-installation-and-usage)
- [🧪 Testing and quality](#-testing-and-quality)
- [🗂️ Project structure](#-project-structure)
- [🔐 Security, privacy and accessibility](#-security-privacy-and-accessibility)
- [⚠️ Scope and limitations](#-scope-and-limitations)
- [📚 Documentation and templates](#-documentation-and-templates)
- [🤝 Contributing](#-contributing)
- [🗺️ Roadmap](#-roadmap)
- [📄 License](#-license)

## 🎯 Overview
Simple C Chatbot demonstrates a terminal conversation loop using C11. It reads one line, normalizes ASCII case, evaluates ordered phrase rules, and prints a fixed response. It is intended for learners exploring arrays, functions, enums, strings, standard I/O, and defensive input handling.

## ❓ Problem and solution
A small classroom example can still hide unsafe input handling and unclear exit behavior. This version separates reading, normalization, classification, and response mapping. It checks input-read results, rejects overlong lines as one logical message, and exits cleanly on EOF.

## ✨ Features
- 🗣️ Interactive terminal conversation.
- 🔤 Case-insensitive byte-oriented phrase matching.
- 👋 Greeting and status responses.
- 🚪 Exact “bye” command exits, while “goodbye” does not.
- 🧱 Bounded 255-byte input and overlong-line draining.
- 🧯 Graceful EOF handling.
- 🧪 Unit and shell integration tests.
- 🧰 Makefile, GitHub Actions, CodeQL and GCC analyzer checks.
- 📚 Project-specific guides, decision records, diagrams and reusable templates.

## 🏗️ Architecture and workflows
<img src="docs/assets/architecture-overview.svg" alt="Architecture flow from terminal input through bounded reader, normalization, rule classifier, response mapper, and terminal output" width="100%">

### Application flow
~~~mermaid
flowchart TD
 A[Start] --> B[Prompt and read line]
 B --> C{EOF or error?}
 C -->|Yes| D[Clean exit]
 C -->|No| E{Overlong?}
 E -->|Yes| F[Drain remainder and warn]
 F --> B
 E -->|No| G[Normalize case]
 G --> H[Classify ordered rules]
 H --> I[Print fixed response]
 I --> J{Exact bye?}
 J -->|No| B
 J -->|Yes| D
~~~

### Rule priority
| Priority | Condition | Response |
|---:|---|---|
| 1 | Input contains “hello” after lowercasing | Greeting |
| 2 | Input contains “how are you” | Status |
| 3 | Entire input equals “bye” | Goodbye and exit |
| 4 | No rule matches | Fallback |

“hello and bye” matches the greeting rule and continues. Only exact “bye” exits.

## 🧰 Technology stack
| Area | Technology |
|---|---|
| Language | C11 |
| Runtime | C standard library |
| Build | Makefile and GCC/Clang/MinGW-compatible compiler |
| Tests | C assertions and POSIX shell tests |
| CI | GitHub Actions on Linux and Windows |
| Static analysis | CodeQL and GCC analyzer |
| Documentation visuals | Mermaid and accessible SVG |

No third-party runtime libraries, API credentials, database, cloud services, or JavaScript package manager are required.

## 🚀 Installation and usage
### Requirements
A C11 compiler such as GCC, Clang, or MinGW-w64. GNU Make is recommended on Linux/macOS but optional.

### Linux/macOS
~~~sh
git clone https://github.com/Brajesh31/chatbot-C-.git
cd chatbot-C-
make
./build/chatbot
~~~

### Windows with MinGW-w64
~~~powershell
gcc -std=c11 -Wall -Wextra -Wpedantic chatbot/chatbot.c -o chatbot-build.exe
.\chatbot-build.exe
~~~

### Direct compile
~~~sh
cc -std=c11 -Wall -Wextra -Wpedantic chatbot/chatbot.c -o chatbot-build
./chatbot-build
~~~

### Example session
~~~text
Chatbot: Hi! I'm a simple chatbot. Type 'bye' to exit.
You: hello
Chatbot: Hello! How can I help you today?
You: how are you?
Chatbot: I'm just a program, but thanks for asking!
You: bye
Chatbot: Goodbye! Have a great day!
~~~

The tracked chatbot/chatbot.exe is a historical Windows binary. Build from source for the target OS; generated files use separate names.

## 🧪 Testing and quality
~~~sh
make test
python3 scripts/validate_docs.py
~~~

Tests cover response classification, case normalization, exact exit matching, empty/unknown input, EOF, and long-line handling. Linux CI runs the interactive shell suite; Windows CI compiles the application and C unit tests. CodeQL and GCC analyzer workflows provide additional static analysis.

No numeric coverage percentage is claimed. See [test strategy](docs/test-strategy.md), [test plan](docs/test-plan.md), and [known limitations](docs/known-issues.md).

## 🗂️ Project structure
~~~text
chatbot-C-/
├── .github/                 Issue forms, PR template, CI and analysis workflows
├── chatbot/
│   ├── chatbot.c            C application
│   └── chatbot.exe          Existing historical Windows binary
├── docs/
│   ├── assets/              Banner, logo, SVG diagrams
│   ├── decisions/           Architecture decision records
│   └── templates/           Reusable engineering templates
├── scripts/                 Documentation validation
├── tests/                   Unit and interactive tests
├── Makefile                 Build, test, check and clean commands
├── README.md
├── AUTHORS.md
├── MAINTAINERS.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── SUPPORT.md
├── GOVERNANCE.md
├── CHANGELOG.md
├── ROADMAP.md
└── LICENSE
~~~

See [the complete structure guide](docs/project-structure.md).

## 🔐 Security, privacy and accessibility
The program runs locally, uses bounded input, does not read secrets, and does not persist messages. Plain-text prompts avoid color-only meaning. This is not a formal security audit or accessibility certification. Build from reviewed source when binary provenance matters. Read [security policy](SECURITY.md), [threat model](docs/threat-model.md), [privacy notes](docs/privacy.md), and [accessibility guide](docs/accessibility-guidelines.md).

## ⚠️ Scope and limitations
This project has no natural-language understanding, model, memory, personalization, language detection, GUI, voice support, database, HTTP API, or remote service. Responses are fixed and may be irrelevant. Matching is substring-based and input is limited to 255 bytes. See [scope](docs/feature-scope.md) and [known issues](docs/known-issues.md).

## 📚 Documentation and templates
- [Documentation index](docs/README.md)
- [Product overview](docs/product-overview.md)
- [System design](docs/system-design.md)
- [Technical overview](docs/technical-overview.md)
- [Data flow](docs/data-flow.md)
- [Installation](docs/installation.md)
- [Development guide](docs/development.md)
- [Testing and QA](docs/testing.md)
- [CI/CD](docs/ci-cd.md)
- [Release management](docs/release-management.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Documentation templates](docs/templates/README.md)
- [Architecture decisions](docs/decisions/README.md)

## 🤝 Contributing
Read [CONTRIBUTING.md](CONTRIBUTING.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md), and [developer guide](docs/coding-guidelines.md). Keep changes focused, tested, portable, and project-specific. Use the issue forms for bugs, features, documentation, accessibility, and performance reports.

## 🗺️ Roadmap
See [ROADMAP.md](ROADMAP.md). Proposed features are not current functionality.

## 📄 License
MIT License. Copyright Brajesh Kumar (@Brajesh31). See [LICENSE](LICENSE).
