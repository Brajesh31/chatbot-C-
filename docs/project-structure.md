# 🗂️ Complete Project Structure

This inventory is generated from the tracked Git tree on the current default branch. It includes every tracked file and directory. Build output under build/ is generated locally and is not tracked.

## Complete tracked tree

~~~text
chatbot-C-/
.editorconfig
.env.example
.gitattributes
.github/
  dependabot.yml
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
  workflows/
    ci.yml
    codeql.yml
    dependency-review.yml
    docs-validation.yml
    lint.yml
    release.yml
    security-scan.yml
.gitignore
ACKNOWLEDGEMENTS.md
AUTHORS.md
CHANGELOG.md
chatbot/
  .vscode/
    settings.json
  chatbot.c
  chatbot.exe
CITATION.cff
CODE_OF_CONDUCT.md
CODEOWNERS
CONTRIBUTING.md
DISCLAIMER.md
docs/
  access-control.md
  accessibility-audit.md
  accessibility-guidelines.md
  accessibility-testing.md
  accessibility.md
  accessible-components.md
  accessible-forms.md
  api-authentication.md
  api-errors.md
  api-reference.md
  api-testing.md
  api.md
  application-lifecycle.md
  architecture-decisions.md
  architecture.md
  assets/
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
    logo.svg
    project-banner.svg
    README.md
    response-priority.svg
    screenshots/
      README.md
    security-architecture.svg
    security-boundaries.svg
    system-design.svg
    testing-workflow.svg
    workflow-diagram.svg
  audit-logging.md
  authentication.md
  authorization.md
  backup-and-restore.md
  branding-guidelines.md
  bug-reporting.md
  building.md
  ci-cd.md
  cli-sequence.md
  cli-ux-guidelines.md
  code-standards.md
  coding-guidelines.md
  color-contrast.md
  commands-reference.md
  compatibility.md
  compliance.md
  component-architecture.md
  configuration.md
  consent-management.md
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
  developer-guide.md
  development-workflow.md
  development.md
  disaster-recovery.md
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
  incident-response.md
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
  non-functional-requirements.md
  operations.md
  performance-testing.md
  performance.md
  privacy.md
  problem-statement.md
  product-overview.md
  project-background.md
  project-objectives.md
  project-status.md
  project-structure.md
  qa.md
  quality-gates.md
  README.md
  references.md
  release-management.md
  responsible-use.md
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
  solution-overview.md
  system-design.md
  technical-debt.md
  technical-overview.md
  technology-stack.md
  templates/
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
    README.md
    release-checklist-template.md
    release-checklist.md
    risk-assessment-template.md
    rollback-checklist.md
    security-audit-template.md
    security-review-template.md
    test-plan-template.md
    test-report-template.md
    threat-assessment-template.md
    user-feedback-template.md
  test-coverage.md
  test-plan.md
  test-strategy.md
  testing.md
  third-party-services.md
  threat-assessment.md
  threat-model.md
  troubleshooting.md
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
GOVERNANCE.md
LICENSE
MAINTAINERS.md
Makefile
README.md
ROADMAP.md
scripts/
  check_project_structure.py
  README.md
  release-check.sh
  security_check.py
  security-check.sh
  setup.ps1
  setup.sh
  validate_docs.py
  validate_markdown.py
SECURITY.md
SUPPORT.md
tests/
  README.md
  test_chatbot.c
  test_interactive.sh
~~~

## Directory responsibilities

| Directory | Responsibility |
|---|---|
| .github/DISCUSSION_TEMPLATE/ | Discussion starters for questions, ideas and maintainer announcements. GitHub Discussions must be enabled for the templates to be offered. |
| .github/ISSUE_TEMPLATE/ | Structured bug, feature, documentation, security hygiene, accessibility and performance reports. Sensitive vulnerability details are redirected to private reporting. |
| .github/workflows/ | Build/test CI, lint, CodeQL, GCC security analysis, dependency review, documentation validation and tagged source artifact workflow. |
| chatbot/ | Main C source, retained editor settings and historical Windows executable. |
| docs/assets/ | Original SVG logo, banner, system diagrams, workflow diagrams and screenshot applicability notes. |
| docs/decisions/ | Numbered architecture decision records. |
| docs/templates/ | Reusable product, architecture, testing, security, accessibility, incident, release and maintenance templates. |
| scripts/ | Setup checks, documentation/Markdown validation, structure validation, security hygiene scan and release readiness check. |
| tests/ | C unit tests and POSIX shell interactive integration tests. |
| build/ | Generated application and test binaries, ignored by Git. |

## Important application and build files

| File | Purpose |
|---|---|
| chatbot/chatbot.c | Complete application entry point, input reader, normalization, rule classifier and response mapping. |
| chatbot/chatbot.exe | Historical Windows executable retained from the original repository. Build from source for current behavior. |
| Makefile | Targets for build, run, test, documentation, Markdown, project tree, security hygiene and combined checks. |
| tests/test_chatbot.c | Unit assertions for private helper behavior. |
| tests/test_interactive.sh | POSIX shell tests for real stdin/stdout behavior, EOF and long input. |
| .env.example | States that no runtime environment variables are currently consumed. |
| .gitignore | Ignores local build products, secrets, compiler output and editor/OS state. |
| .editorconfig | Consistent text encoding, line endings and indentation. |
| .gitattributes | Line-ending normalization and binary treatment for executables. |

## GitHub configuration files

| File or path | Purpose |
|---|---|
| .github/README.md | Explains issue forms, discussion templates, workflows and permissions. |
| .github/ISSUE_TEMPLATE/ | Forms for bug reports, feature proposals, docs, non-sensitive security issues, accessibility and performance. |
| .github/DISCUSSION_TEMPLATE/ | Questions, ideas and announcements; requires Discussions to be enabled. |
| .github/PULL_REQUEST_TEMPLATE.md | Pull request evidence and review checklist. |
| .github/dependabot.yml | Monthly updates for GitHub Actions references. |
| .github/workflows/ci.yml | Linux full quality gate and Windows C build/unit tests. |
| .github/workflows/lint.yml | Markdown fences, internal docs links/SVGs and tracked-tree checks. |
| .github/workflows/docs-validation.yml | Dedicated documentation validation. |
| .github/workflows/security-scan.yml | Heuristic secret scan, tests and GCC analyzer. |
| .github/workflows/codeql.yml | CodeQL C/C++ source extraction and static analysis. |
| .github/workflows/dependency-review.yml | Pull-request dependency graph review where dependencies are recognized. |
| .github/workflows/release.yml | Manual build from an existing tag; does not publish a GitHub Release. |

## Root governance and project files

| File | Purpose |
|---|---|
| README.md | Main overview, rules, setup, examples, diagrams, quality checks, FAQ and links. |
| LICENSE | MIT license text and owner notice. |
| CODE_OF_CONDUCT.md | Community expectations, reporting and enforcement. |
| CONTRIBUTING.md | Setup, coding standards, tests, pull requests and review requirements. |
| SECURITY.md | Private vulnerability reporting and security limitations. |
| SUPPORT.md | Support routes, report requirements and escalation guidance. |
| GOVERNANCE.md / MAINTAINERS.md / CODEOWNERS | Project decision authority and repository ownership. |
| CHANGELOG.md / ROADMAP.md | Verified changes and proposed future work. |
| AUTHORS.md / ACKNOWLEDGEMENTS.md | Ownership, contributors, tooling and attribution. |
| CITATION.cff | Citation metadata for the software repository. |
| DISCLAIMER.md | Project-use limitations and warranty context. |

## Module and data organization

There is one C application translation unit. Input and classification state are transient in-memory values. No frontend/backend split, routes, database, model directory, API endpoints, account storage or persistent chat history exists. The application functions are documented in [API/function reference](api-reference.md) and [module documentation](module-documentation.md).

## Configuration, assets and dependencies

The runtime has no external configuration file or required environment variable. The editor configuration files apply to contributors. SVG assets are located in docs/assets/. The application depends on the C standard library; Make, Python and POSIX utilities are development/test tools. See [dependencies](dependencies.md) and [environment setup](environment-setup.md).

## Test and release organization

Unit tests live in tests/test_chatbot.c. The POSIX end-to-end shell suite lives in tests/test_interactive.sh. Source builds and checks are orchestrated by Makefile and GitHub Actions. The release workflow builds from an existing tag and uploads a Linux artifact; it does not publish, sign or attest a GitHub Release.

## Naming and maintenance conventions

- Use lowercase kebab-case for Markdown documentation filenames.
- Keep C helper names descriptive and macros uppercase.
- Put architectural records in docs/decisions/ and reusable templates in docs/templates/.
- Keep generated binaries under build/ or another ignored output directory.
- Preserve original source, assets and project data unless a reviewed change explicitly replaces them.
- Run make check after source or documentation changes.
- Regenerate this tree with python3 scripts/check_project_structure.py --write after adding or removing tracked paths.

## Applicability boundaries

This inventory reflects a local terminal application. No frontend screenshots, responsive pages, design-system components, database ER schema, API authentication lifecycle, webhook receiver, Docker image, hosting stack or production health endpoint is present. Their absence is documented in the relevant scope/applicability guides rather than represented as real features.

## Inventory counts

- Tracked files: 248
- Main documentation pages excluding assets, templates and ADR subfolder: 140
- Reusable templates: 30
- SVG and visual asset directory files: 20
- GitHub workflows: 7
- Issue form/configuration files: 7

The script scripts/check_project_structure.py verifies that the tracked file tree above matches the Git index.
