# 📜 Changelog

All notable repository changes are recorded here. The project has not published a verified semantic release tag in this changelog, so work is grouped under Unreleased. Earlier history remains available in Git and is not reconstructed where the exact change details are unknown.

## [Unreleased]

### Added
- Windows PowerShell interactive tests for real process input/output, EOF and exact 254/255/256-byte boundaries.
- Dedicated Mermaid sequence/state references, terminal accessibility guide, compiler/build matrix, testing matrix, release procedure and repeatable repository audit guide.
- C11 Makefile targets for build, run, unit tests, interactive tests, documentation checks, and combined verification.
- C unit tests for normalization, response classification, exact exit behavior, and fallback handling.
- POSIX shell integration tests for conversation flow, EOF, and overlong-line behavior.
- GitHub Actions workflows for Linux/Windows build testing, CodeQL, GCC static analysis, documentation validation, and tagged source artifacts.
- Documentation validation scripts and repository structure checks.
- Extensive project, architecture, requirements, setup, testing, security, accessibility, privacy, maintenance, and release documentation.
- Reusable templates for architecture decisions, features, testing, security, accessibility, releases, incidents, risk, and maintenance.
- Original SVG identity and technical diagrams with accessible title and description metadata.
- Structured GitHub issue forms and contribution guidance.

### Changed
- Main README expanded with project context, rule behavior, visual assets, build instructions, examples, testing, scope, and documentation index.
- Architecture and technical guides now distinguish implemented behavior from non-applicable or proposed functionality.
- Repository project-tree documentation expanded to include the complete tracked inventory.
- Main CI quality gate includes build, tests, and offline documentation validation.

### Fixed
- Input reading checks its return value and handles EOF without classifying uninitialized data.
- Exactly 255 bytes are accepted when followed by newline or EOF; 256-byte and longer lines are drained and rejected.
- The overlong-input warning now describes the limit in bytes, not characters.
- Exit behavior requires exact normalized bye rather than an incidental substring.
- Lowercase conversion uses an unsigned-char value before calling tolower.
- CodeQL workflow builds the C application before analysis so source extraction can take place.

### Security
- Added GCC analyzer and CodeQL analysis workflows.
- Documented private vulnerability reporting, input-boundary controls, data handling, and known security limitations.

### Preserved
- Existing source history and original chatbot/chatbot.exe remain in the repository.
- The historical binary is labelled as such; source builds are the recommended execution path.

### Known limitations
- No numeric test coverage percentage or independent security audit is claimed.
- The application is not an AI/LLM system and has no API, database, authentication, persistence, or graphical interface.
- Windows runs an equivalent PowerShell integration suite; macOS and Clang remain outside the current CI matrix.
