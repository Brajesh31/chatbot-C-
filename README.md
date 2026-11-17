<p align="center">
  <img src="docs/assets/project-banner.svg" alt="Simple C Chatbot, a deterministic C command-line chatbot, built with standard C" width="100%">
</p>
<p align="center"><img src="docs/assets/logo.svg" alt="Simple C Chatbot project logo" width="84"></p>
<h1 align="center">💬 Simple C Chatbot</h1>

<p align="center">
  <a href="https://github.com/Brajesh31/chatbot-C-/actions/workflows/ci.yml"><img src="https://github.com/Brajesh31/chatbot-C-/actions/workflows/ci.yml/badge.svg" alt="C build and test workflow"></a>
  <a href="https://github.com/Brajesh31/chatbot-C-/actions/workflows/codeql.yml"><img src="https://github.com/Brajesh31/chatbot-C-/actions/workflows/codeql.yml/badge.svg" alt="CodeQL analysis"></a>
  <a href="https://github.com/Brajesh31/chatbot-C-/actions/workflows/security-scan.yml"><img src="https://github.com/Brajesh31/chatbot-C-/actions/workflows/security-scan.yml/badge.svg" alt="Security and secret scanning"></a>
  <a href="https://github.com/Brajesh31/chatbot-C-/actions/workflows/docs-validation.yml"><img src="https://github.com/Brajesh31/chatbot-C-/actions/workflows/docs-validation.yml/badge.svg" alt="Documentation validation"></a>
  <img src="https://img.shields.io/badge/Language-C11-00599C?logo=c" alt="C11 language">
  <img src="https://img.shields.io/badge/Build-Makefile-427819" alt="Makefile build">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="MIT license">
  <img src="https://img.shields.io/github/stars/Brajesh31/chatbot-C-?style=flat&logo=github" alt="GitHub stars">
  <img src="https://img.shields.io/github/issues/Brajesh31/chatbot-C-" alt="Open GitHub issues">
  <img src="https://img.shields.io/github/issues-pr/Brajesh31/chatbot-C-" alt="Open pull requests">
  <img src="https://img.shields.io/github/last-commit/Brajesh31/chatbot-C-" alt="Last commit">
  <img src="https://img.shields.io/github/repo-size/Brajesh31/chatbot-C-" alt="Repository size">
</p>

> A small, deterministic, rule-based command-line chatbot written in standard C. **This is not an AI or LLM application.** It runs locally, uses fixed phrase rules, makes no network requests, and does not save conversation history.

## 📑 Table of Contents
- [🎯 Overview](#-overview)
- [❓ Problem and solution](#-problem-and-solution)
- [✨ Features and differentiators](#-features-and-differentiators)
- [🏗️ Architecture and workflows](#-architecture-and-workflows)
- [🧰 Technology stack](#-technology-stack)
- [🚀 Installation and usage](#-installation-and-usage)
- [⚙️ Configuration](#-configuration)
- [🧪 Testing and quality](#-testing-and-quality)
- [🗂️ Project structure](#-project-structure)
- [🔐 Security, privacy and accessibility](#-security-privacy-and-accessibility)
- [⚠️ Scope and limitations](#-scope-and-limitations)
- [📚 Documentation and templates](#-documentation-and-templates)
- [❓ FAQ](#-faq)
- [🤝 Contributing](#-contributing)
- [🗺️ Roadmap](#-roadmap)
- [🙏 Acknowledgements](#-acknowledgements)
- [📄 License and author](#-license-and-author)

## 🎯 Overview

Simple C Chatbot demonstrates a terminal conversation loop using C11. It reads one line, normalizes byte values to lowercase, evaluates ordered phrase rules, and prints a fixed response. It is intended for learners exploring arrays, functions, enums, strings, standard I/O, control flow, and defensive input handling.

## ❓ Problem and solution

A quick classroom example can hide input-read failures, overlong-line fragmentation, unsafe character conversion, and accidental exit behavior. This implementation separates line reading, normalization, classification, and response mapping. It checks input-read results, rejects overlong lines as one logical message, and exits cleanly on EOF.

## ✨ Features and differentiators

### Core features
- 🗣️ Interactive terminal conversation.
- 🔤 Case-insensitive byte-oriented phrase matching.
- 👋 Greeting and status responses.
- 🚪 Exact normalized bye command exits; goodbye does not.
- 🧱 Bounded input with a maximum accepted line of 255 bytes.
- 🧯 Long-line draining and graceful EOF handling.
- 🧪 C unit tests and POSIX shell integration tests.

### Engineering features
- 🧰 Strict C11 Makefile build and test targets.
- 🐧 Linux and 🪟 Windows source-build CI.
- 🔎 CodeQL and GCC static analysis.
- 🔐 Gitleaks history scanning alongside local repository hygiene checks.
- 📚 Extensive technical documentation and architecture decision records.
- 🧩 Reusable feature, architecture, QA, security, release, and maintenance templates.
- 🖼️ Original SVG visual identity and technical diagrams.

### Unique selling points
- No third-party runtime package installation.
- No network connection or API key required.
- Small source footprint and deterministic behavior.
- Clear examples of input boundaries and C string handling.
- Easy to compile and inspect without a framework.

## 🏗️ Architecture and workflows

### High-level system design
<img src="docs/assets/system-design.svg" alt="System design showing a terminal user, bounded input, rule engine and terminal output within one local process" width="100%">

### Application architecture
<img src="docs/assets/architecture-overview.svg" alt="Terminal input flows through the bounded reader, normalization, rule classifier, response mapper and terminal output" width="100%">

### End-to-end workflow
<img src="docs/assets/workflow-diagram.svg" alt="Contribution workflow from reading scope through implementation, tests, local checks and pull request review" width="100%">

### Input and error-handling flow
<img src="docs/assets/error-handling.svg" alt="Input reader distinguishes valid lines, EOF or errors, and overlong lines" width="100%">

### Runtime rule flow
~~~mermaid
flowchart TD
 A[Start] --> B[Prompt and read line]
 B --> C{EOF or input error?}
 C -->|Yes| D[Clean exit]
 C -->|No| E{Overlong?}
 E -->|Yes| F[Drain remainder and warn]
 F --> B
 E -->|No| G[Normalize case]
 G --> H{Contains hello?}
 H -->|Yes| I[Greeting]
 H -->|No| J{Contains how are you?}
 J -->|Yes| K[Status]
 J -->|No| L{Exact bye?}
 L -->|Yes| M[Goodbye and exit]
 L -->|No| N[Fallback]
 I --> B
 K --> B
 N --> B
 M --> D
~~~

### Rule priority
| Priority | Condition | Response | Continues? |
|---:|---|---|---|
| 1 | Input contains hello after lowercasing | Greeting | Yes |
| 2 | Input contains how are you | Status | Yes |
| 3 | Entire normalized input equals bye | Goodbye | No |
| 4 | No rule matches | Fallback | Yes |

A message containing both hello and bye triggers the first rule and continues. This precedence is deliberate and covered by tests.

## 🧰 Technology stack

| Area | Technology | Purpose |
|---|---|---|
| Language | C11 | Program implementation |
| Runtime | C standard library | Character conversion, I/O, string operations |
| Build | Makefile and C compiler | Build application and tests |
| Unit tests | C assertions | Helper and rule verification |
| Integration tests | POSIX shell and awk | Real stdin/stdout behavior on Linux |
| CI | GitHub Actions | Linux/Windows build checks |
| Static analysis | CodeQL and GCC analyzer | Source-level analysis |
| Documentation | Markdown, Mermaid, SVG, Python standard library | Technical guides and validation |

No frontend framework, backend server, database, model provider, cloud service, package manager, or third-party C runtime library is used by the application.

## 🚀 Installation and usage

### Requirements
A C11 compiler such as GCC, Clang, or MinGW-w64. GNU Make and Python 3 are recommended for the full local quality gate. The application itself does not need Python.

### Linux/macOS
~~~sh
git clone https://github.com/Brajesh31/chatbot-C-.git
cd chatbot-C-
make
./build/chatbot
~~~

### Windows with MinGW-w64
~~~powershell
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror chatbot/chatbot.c -o chatbot-build.exe
.\chatbot-build.exe
~~~

### Direct compilation
~~~sh
cc -std=c11 -Wall -Wextra -Wpedantic -Werror chatbot/chatbot.c -o chatbot
./chatbot
~~~

### Example conversation
~~~text
Chatbot: Hi! I'm a simple chatbot. Type 'bye' to exit.
You: hello
Chatbot: Hello! How can I help you today?
You: how are you?
Chatbot: I'm just a program, but thanks for asking!
You: bye
Chatbot: Goodbye! Have a great day!
~~~

The tracked chatbot/chatbot.exe is a historical Windows binary. Prefer building from the current source for the target platform.

## ⚙️ Configuration

There is no runtime configuration file and the program reads no environment variables. Phrase rules, input capacity, and response strings are defined in the C source. The root .env.example exists only to state that no environment variables are currently required.

Build flags may be overridden through Make, for example:

~~~sh
make CC=clang
make CFLAGS="-std=c11 -Wall -Wextra -Wpedantic -Werror -g"
~~~

There are no API keys, database credentials, or service URLs to configure.

## 🧪 Testing and quality

Run the local quality gate:

~~~sh
make check
~~~

Individual targets:
~~~sh
make
make test
make docs-check
make markdown-check
make structure-check
make security-check
make clean
~~~

Tests cover greeting/status/fallback rules, case normalization, exact exit behavior, empty input, EOF, and long-line handling. Linux CI runs the interactive shell suite. Windows CI compiles the application and C unit tests with MinGW. Documentation validation checks local links and SVG assets. Repository quality scripts check Markdown fences, tree accuracy, and common secret patterns.

No numeric coverage percentage, performance benchmark, or formal security certification is claimed. See [test strategy](docs/test-strategy.md), [end-to-end tests](docs/e2e-testing.md), and [known limitations](docs/scope-and-limitations.md).

## 🗂️ Project structure

The repository contains **289 tracked files** across source code, documentation, tests, automation and governance. The complete file-level tree is available below and in [docs/project-structure.md](docs/project-structure.md).

<details>
<summary>Expand complete tracked file and directory inventory (289 files)</summary>

~~~text
chatbot-C-/
.clang-format
.editorconfig
.env.example
.gitattributes
.github/
  DISCUSSION_TEMPLATE/
    announcements.yml
    ideas.yml
    questions.yml
  ISSUE_TEMPLATE/
    accessibility_report.yml
    bug_report.yml
    config.yml
    documentation.yml
    feature_request.yml
    performance_issue.yml
    security_report.yml
  PULL_REQUEST_TEMPLATE.md
  README.md
  dependabot.yml
  workflows/
    ci.yml
    codeql.yml
    dependency-review.yml
    docs-validation.yml
    lint.yml
    release.yml
    security-scan.yml
.gitignore
.gitleaks.toml
ACKNOWLEDGEMENTS.md
AUTHORS.md
CHANGELOG.md
CITATION.cff
CODEOWNERS
CODE_OF_CONDUCT.md
CONTRIBUTING.md
DISCLAIMER.md
GOVERNANCE.md
LICENSE
MAINTAINERS.md
Makefile
README.md
ROADMAP.md
SECURITY.md
SUPPORT.md
chatbot/
  .vscode/
    settings.json
  chatbot.c
  chatbot.exe
docs/
  README.md
  access-control.md
  accessibility-audit.md
  accessibility-guidelines.md
  accessibility-testing.md
  accessibility.md
  accessible-components.md
  accessible-forms.md
  animation-guidelines.md
  api-authentication.md
  api-errors.md
  api-reference.md
  api-testing.md
  api.md
  application-lifecycle.md
  architecture-decisions.md
  architecture.md
  assets/
    README.md
    application-state.svg
    architecture-overview.svg
    chatbot-flow.svg
    ci-pipeline.svg
    cli-sequence.svg
    data-flow-level0.svg
    data-flow-level2.svg
    data-flow.svg
    deployment-flow.svg
    error-handling.svg
    input-boundary.svg
    logo.svg
    project-banner.svg
    response-priority.svg
    rule-precedence.svg
    screenshots/
      README.md
    security-architecture.svg
    security-boundaries.svg
    system-design.svg
    terminal-session.svg
    testing-matrix.svg
    testing-workflow.svg
    workflow-diagram.svg
  audit-logging.md
  authentication.md
  authorization.md
  backup-and-restore.md
  branding-guidelines.md
  bug-reporting.md
  build-matrix.md
  building.md
  ci-cd.md
  cli-sequence.md
  cli-ux-guidelines.md
  code-standards.md
  coding-guidelines.md
  color-contrast.md
  color-system.md
  commands-reference.md
  compatibility.md
  compiler-support.md
  compliance.md
  component-architecture.md
  component-library.md
  configuration.md
  consent-management.md
  containerization.md
  contributor-guide.md
  cookie-policy.md
  data-deletion.md
  data-dictionary.md
  data-flow.md
  data-privacy.md
  data-protection.md
  data-retention.md
  data-validation.md
  database-schema.md
  database.md
  debugging.md
  decision-log.md
  decisions/
    0001-standard-c-console.md
    0002-bounded-line-input.md
    README.md
  dependencies.md
  dependency-security.md
  deployment-scope.md
  deployment.md
  deprecation-policy.md
  design-patterns.md
  design-system.md
  design-tokens.md
  developer-guide.md
  development-workflow.md
  development.md
  diagrams.md
  disaster-recovery.md
  docker.md
  e2e-testing.md
  encryption.md
  environment-setup.md
  environment-variables.md
  error-handling.md
  external-dependencies.md
  faq.md
  feature-scope.md
  features.md
  functional-requirements.md
  getting-started.md
  github-actions.md
  glossary.md
  health-checks.md
  hosting.md
  incident-response.md
  infrastructure.md
  installation.md
  integration-testing.md
  integrations.md
  keyboard-navigation.md
  known-issues.md
  legal-considerations.md
  limitations.md
  local-development.md
  logging.md
  maintainer-guide.md
  maintenance.md
  migration-guide.md
  module-documentation.md
  monitoring.md
  navigation-structure.md
  non-functional-requirements.md
  observability.md
  operations.md
  page-documentation.md
  performance-testing.md
  performance.md
  privacy.md
  problem-statement.md
  product-overview.md
  production-setup.md
  project-background.md
  project-objectives.md
  project-status.md
  project-structure.md
  qa.md
  quality-gates.md
  references.md
  release-management.md
  release-process.md
  repository-audit.md
  repository-file-applicability.md
  responsible-use.md
  responsive-design.md
  risk-register.md
  roadmap.md
  rollback.md
  running-locally.md
  scalability.md
  scope-and-limitations.md
  screen-reader-support.md
  secret-management.md
  security-architecture.md
  security-best-practices.md
  security-risk-register.md
  security-testing.md
  security.md
  sequence-diagrams.md
  solution-overview.md
  state-diagrams.md
  system-design.md
  technical-debt.md
  technical-overview.md
  technology-stack.md
  templates/
    README.md
    accessibility-audit-template.md
    adr-template.md
    api-documentation-template.md
    architecture-template.md
    benchmark-template.md
    bug-report-template.md
    change-request-template.md
    code-review-template.md
    compatibility-matrix-template.md
    database-schema-template.md
    deployment-checklist.md
    feature-proposal-template.md
    feature-specification-template.md
    incident-report-template.md
    maintenance-checklist.md
    meeting-notes-template.md
    migration-template.md
    project-status-template.md
    qa-test-case-template.md
    release-checklist-template.md
    release-checklist.md
    release-notes-template.md
    reproduction-record-template.md
    risk-assessment-template.md
    rollback-checklist.md
    security-audit-template.md
    security-exception-template.md
    security-review-template.md
    test-plan-template.md
    test-report-template.md
    threat-assessment-template.md
    user-feedback-template.md
  terminal-accessibility.md
  test-coverage.md
  test-plan.md
  test-strategy.md
  testing-matrix.md
  testing.md
  third-party-services.md
  threat-assessment.md
  threat-model.md
  troubleshooting.md
  typography.md
  ui-ux-guidelines.md
  unit-testing.md
  upgrade-guide.md
  usage.md
  use-cases.md
  user-journeys.md
  user-personas.md
  versioning.md
  visual-regression-testing.md
  vulnerability-management.md
  wcag-compliance.md
  webhooks.md
  workflow.md
scripts/
  README.md
  check-project-structure.py
  check_project_structure.py
  generate-docs.sh
  release-check.sh
  security-check.sh
  security_check.py
  setup.ps1
  setup.sh
  validate-docs.py
  validate-links.py
  validate_docs.py
  validate_markdown.py
tests/
  README.md
  test_chatbot.c
  test_interactive.ps1
  test_interactive.sh
~~~

</details>

## 🧠 Runtime contract and input boundaries

The runtime uses a 256-byte buffer, allowing a maximum accepted message of 255 bytes plus the terminating NUL. The limit is measured in bytes, not visible characters. UTF-8 characters may occupy multiple bytes. Input is normalized byte-by-byte with the C character API; this is not Unicode case folding or natural-language understanding.

| Input | Result | Session behavior |
|---|---|---|
| Line shorter than 255 bytes | Accepted | Processed once |
| Exactly 255 bytes followed by newline | Accepted | Processed once |
| Exactly 255 bytes followed by clean EOF | Accepted as final unterminated line | Processed, then next read exits |
| More than 255 bytes | Rejected after draining the line remainder | One warning, then next prompt |
| EOF before a new line | Input-ended status | Prints input-closed message and exits |
| Input stream error | Input-ended status | Exits without classifying stale buffer data |

When the buffer fills without capturing a newline, the reader probes one more byte. A newline or clean EOF proves the line is exactly within the limit. Any additional data makes the whole logical line overlong, so the remainder is drained before the next prompt. This prevents the tail of one long message from being interpreted as another message.

### Deterministic rule precedence

~~~mermaid
flowchart TD
 A[Accepted input] --> B[Lowercase bytes]
 B --> C{Contains hello?}
 C -->|Yes| G[Greeting]
 C -->|No| D{Contains how are you?}
 D -->|Yes| H[Status]
 D -->|No| E{Whole string equals bye?}
 E -->|Yes| I[Goodbye and exit]
 E -->|No| F[Fallback and continue]
~~~

The order is observable. `hello and bye` triggers the greeting rule and continues. `goodbye` is not an exit command because only the entire normalized string `bye` exits. Empty input receives the fallback response.

### Internal function responsibilities

| Function | Contract |
|---|---|
| `read_input_line` | Returns 1 for accepted line, 0 for EOF/read error/invalid buffer, -1 for overlong input |
| `normalize_input` | Lowercases accepted bytes in place using an unsigned-char conversion |
| `is_exit_command` | Matches the whole string against `bye` |
| `classify_input` | Applies greeting, status, exit and fallback precedence |
| `response_text` | Maps the finite `ResponseKind` enum to a static string |
| `main` | Owns prompt, flush, read, classify, response and process termination |

These helper functions are file-local implementation details, not a published C library API.

## 🔁 Runtime sequence

~~~mermaid
sequenceDiagram
 actor User
 participant Main as main()
 participant Reader as read_input_line()
 participant Rules as normalize/classify
 participant Output as stdout
 Main->>Output: Print welcome
 loop Until exact bye, EOF or read error
  Main->>Output: Print prompt and flush
  User->>Reader: Enter one logical line
  alt Accepted line
   Reader-->>Main: NUL-terminated text
   Main->>Rules: Normalize and classify
   Rules-->>Main: ResponseKind
   Main->>Output: Print fixed response
  else Overlong line
   Reader-->>Main: Drain remainder and reject
   Main->>Output: Print 255-byte warning
  else EOF or read error
   Reader-->>Main: End status
   Main->>Output: Print input-closed message
  end
 end
~~~

## 🧪 Test matrix

| Scenario | Unit tests | Linux process tests | Windows PowerShell tests |
|---|---:|---:|---:|
| Greeting, status, fallback | Yes | Yes | Yes |
| Case normalization and rule precedence | Yes | Yes | Yes |
| Exact `bye` versus `goodbye` | Yes | Yes | Yes |
| Empty input and EOF | Unit where applicable | Yes | Yes |
| 254/255/256-byte boundaries | Helper checks | Yes | Yes |
| Overlong-line drain and next valid turn | Helper checks | Yes | Yes |

The matrix describes checked-in test intent, not exhaustive testing of every byte sequence, locale, compiler or terminal. Read [testing](docs/testing.md), [test strategy](docs/test-strategy.md) and [testing matrix](docs/testing-matrix.md).

## 🧰 Build and quality commands

| Command | Purpose |
|---|---|
| `make` | Build `build/chatbot` |
| `make run` | Build and launch the program |
| `make test` | Run C unit tests and POSIX process tests |
| `make docs-check` | Validate local documentation links and SVG assets |
| `make markdown-check` | Check tracked Markdown code fences |
| `make structure-check` | Verify the tracked-file inventory |
| `make security-check` | Run local secret-pattern hygiene checks |
| `make check` | Run the full local quality gate |
| `make clean` | Remove generated build output |

Linux CI runs `make check`. Windows CI compiles with MinGW, runs C unit tests and executes the PowerShell interactive boundary suite. macOS and Clang are not currently in the CI matrix.

## 🖼️ Terminal visual reference

<img src="docs/assets/terminal-session.svg" alt="Illustrative terminal session diagram showing greeting, status, fallback and exact bye responses; it is not a captured application screenshot." width="100%">

The repository does not fabricate browser, dashboard or mobile screenshots. The current application has no graphical interface. See the [asset and screenshot policy](docs/assets/README.md).

## 🔐 Security, privacy and accessibility

The program uses bounded input and does not persist or transmit chat messages. It has no account, network, database, or secret-management subsystem. The plain-text interface avoids color-only meaning. SVG documentation assets include title and description metadata.

This is not a formal security audit, WCAG conformance statement, or accessibility certification. Build from reviewed source when binary provenance matters. Read [SECURITY.md](SECURITY.md), [threat assessment](docs/threat-assessment.md), [data privacy](docs/data-privacy.md), and [accessibility audit](docs/accessibility-audit.md).

## ⚠️ Scope and limitations

This project has no natural-language understanding, model, memory, personalization, language detection, GUI, voice support, database, HTTP API, authentication, webhooks, or remote service. Responses are fixed and may be irrelevant. Matching is substring-based and input is limited to 255 bytes. There is no hosted demo or deployment endpoint.

See [scope and limitations](docs/scope-and-limitations.md), [known issues](docs/known-issues.md), and [roadmap](ROADMAP.md).

## 📚 Documentation and templates

Start with the [documentation index](docs/README.md). Important guides:
- [Product overview](docs/product-overview.md)
- [Project objectives and requirements](docs/project-objectives.md)
- [System design](docs/system-design.md)
- [API/function reference](docs/api-reference.md)
- [Installation and getting started](docs/getting-started.md)
- [Usage examples](docs/usage.md)
- [Development workflow](docs/development-workflow.md)
- [Testing and QA](docs/testing.md)
- [Security architecture](docs/security-architecture.md)
- [Privacy and data handling](docs/data-privacy.md)
- [CI/CD and releases](docs/ci-cd.md)
- [Templates index](docs/templates/README.md), including [reproduction records](docs/templates/reproduction-record-template.md), [release notes](docs/templates/release-notes-template.md), and [security exceptions](docs/templates/security-exception-template.md)
- [Visual assets index](docs/assets/README.md)
- [Master checklist applicability register](docs/repository-file-applicability.md), [complete project structure](docs/project-structure.md), [architecture reference](docs/architecture.md), and [function/API contracts](docs/api-reference.md)
- [Diagram catalogue](docs/diagrams.md)
- [CLI design system](docs/design-system.md), [tokens](docs/design-tokens.md), [component boundaries](docs/component-library.md)
- [Responsive terminal](docs/responsive-design.md), [navigation](docs/navigation-structure.md), [terminal output surfaces](docs/page-documentation.md)
- [Typography](docs/typography.md), [color](docs/color-system.md), [animation](docs/animation-guidelines.md)
- [Production setup](docs/production-setup.md), [hosting](docs/hosting.md), [infrastructure](docs/infrastructure.md)
- [Monitoring](docs/monitoring.md), [observability](docs/observability.md), [health checks](docs/health-checks.md)
- [Containerization](docs/containerization.md), [Docker applicability](docs/docker.md)
- [Runtime sequence diagrams](docs/sequence-diagrams.md), [state diagrams](docs/state-diagrams.md), [terminal accessibility](docs/terminal-accessibility.md)
- [Compiler support](docs/compiler-support.md), [build matrix](docs/build-matrix.md), [testing matrix](docs/testing-matrix.md)
- [Release process](docs/release-process.md), [repository audit guide](docs/repository-audit.md)

## ❓ FAQ

**Is this powered by AI?** No. It uses a few deterministic phrase checks and fixed response strings.

**Does it need an internet connection?** No runtime internet connection is required.

**Does it store chat history?** No. The application does not persist conversation content.

**Why does goodbye not exit?** Only exact normalized bye is an exit command. The goodbye string is not equal to bye.

**What is the maximum input length?** 255 bytes per line in the current 256-byte buffer.

**Does it have a graphical interface or API?** No. It is a terminal program.

More answers are in [docs/faq.md](docs/faq.md).

## 🤝 Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md), and [the contributor guide](docs/contributor-guide.md). Use the issue forms for bugs, features, documentation, accessibility, and performance reports. Keep changes focused, tested, portable, and project-specific.

## 🗺️ Roadmap

See [ROADMAP.md](ROADMAP.md). Proposed ideas are not implemented features or delivery commitments.

## 🙏 Acknowledgements

See [ACKNOWLEDGEMENTS.md](ACKNOWLEDGEMENTS.md) for tooling and attribution notes. The application intentionally relies on the C standard library and a small development toolchain.

## 📄 License and author

Released under the MIT License. Copyright Brajesh Kumar (@Brajesh31). See [LICENSE](LICENSE) and [AUTHORS.md](AUTHORS.md).
