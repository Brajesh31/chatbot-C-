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
    ideas.yml
    questions.yml
  ISSUE_TEMPLATE/
    accessibility_report.yml
    bug_report.yml
    config.yml
    documentation.yml
    feature_request.yml
    performance_issue.yml
  PULL_REQUEST_TEMPLATE.md
  workflows/
    ci.yml
    codeql.yml
    docs-validation.yml
    release.yml
    security-scan.yml
.gitignore
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
  accessibility-guidelines.md
  accessibility-testing.md
  accessibility.md
  api.md
  application-lifecycle.md
  architecture.md
  assets/
    application-state.svg
    architecture-overview.svg
    chatbot-flow.svg
    ci-pipeline.svg
    cli-sequence.svg
    data-flow.svg
    deployment-flow.svg
    logo.svg
    project-banner.svg
    README.md
    response-priority.svg
    security-boundaries.svg
  building.md
  ci-cd.md
  cli-sequence.md
  cli-ux-guidelines.md
  code-standards.md
  coding-guidelines.md
  commands-reference.md
  compatibility.md
  component-architecture.md
  configuration.md
  data-flow.md
  database.md
  debugging.md
  decision-log.md
  decisions/
    0001-standard-c-console.md
    0002-bounded-line-input.md
    README.md
  dependencies.md
  dependency-security.md
  deployment.md
  deprecation-policy.md
  design-patterns.md
  developer-guide.md
  development-workflow.md
  development.md
  environment-variables.md
  error-handling.md
  faq.md
  feature-scope.md
  features.md
  functional-requirements.md
  getting-started.md
  github-actions.md
  glossary.md
  installation.md
  integration-testing.md
  keyboard-navigation.md
  known-issues.md
  local-development.md
  logging.md
  maintainer-guide.md
  maintenance.md
  migration-guide.md
  module-documentation.md
  non-functional-requirements.md
  operations.md
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
  screen-reader-support.md
  security-best-practices.md
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
  threat-model.md
  troubleshooting.md
  unit-testing.md
  use-cases.md
  user-journeys.md
  user-personas.md
  versioning.md
GOVERNANCE.md
LICENSE
MAINTAINERS.md
Makefile
README.md
ROADMAP.md
scripts/
  README.md
  validate_docs.py
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
| .github/DISCUSSION_TEMPLATE/ | Discussion starters. GitHub Discussions must be enabled in repository settings for these templates to be offered. |
| .github/ISSUE_TEMPLATE/ | Structured bug, feature, documentation, accessibility, and performance reports. Security concerns are redirected to private reporting. |
| .github/workflows/ | Build/test CI, CodeQL, GCC static analysis, documentation validation, and tagged source artifact workflow. |
| chatbot/ | Main C source, existing editor settings, and the preserved historical Windows executable. |
| docs/assets/ | Original SVG identity assets, architecture diagrams, and visual explanation files. |
| docs/decisions/ | Architecture decision records documenting accepted implementation choices. |
| docs/templates/ | Reusable product, architecture, testing, security, accessibility, release, and maintenance templates. |
| scripts/ | Offline repository documentation and SVG validation utility. |
| tests/ | C unit tests and POSIX shell integration tests. |
| build/ | Generated output from Makefile. Ignored by Git and created on local builds. |

## Important source and build files

| File | Purpose |
|---|---|
| chatbot/chatbot.c | Complete application implementation and deterministic phrase rules. |
| chatbot/chatbot.exe | Existing Windows executable retained from the original repository. Source builds are preferred. |
| Makefile | Build, run, test, documentation check, combined check, and clean targets. |
| tests/test_chatbot.c | Unit-level assertions for private helper behavior. |
| tests/test_interactive.sh | End-to-end stdin/stdout checks for the actual executable on POSIX shells. |
| scripts/validate_docs.py | Validates local Markdown references and SVG XML/accessibility metadata. |
| .github/workflows/ci.yml | Linux full check and Windows source/unit-test build. |
| .github/workflows/codeql.yml | CodeQL C/C++ static analysis with an autobuild step. |
| .github/workflows/security-scan.yml | GCC analyzer and project test workflow. |
| .github/workflows/docs-validation.yml | Standalone offline documentation validation. |
| .github/workflows/release.yml | Manually builds an artifact from an existing tag; it does not publish a GitHub Release. |

## File organization conventions

- Keep C implementation in chatbot/ until a real second module warrants splitting it.
- Keep tests in tests/ and ensure tests cover normal and boundary inputs.
- Use lowercase kebab-case for documentation names.
- Store architecture records in docs/decisions/ and reusable templates in docs/templates/.
- Keep original assets and binaries unless an explicit reviewed change replaces them.
- Place generated build products under build/ or another ignored local output directory.
- Update this inventory whenever tracked paths change.

## Applicability boundaries

This application has no frontend, backend service, HTTP API, authentication layer, database, mobile screens, or external integration. Therefore, there are no active route/component folders, ER diagrams, database migrations, authentication sequence diagrams, API endpoints, or mobile screenshots. The corresponding reusable API and database templates are present for future use, but do not describe current functionality.
