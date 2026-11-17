# 🗂️ Complete Project Structure

This inventory reflects the tracked Git tree on the default branch. Temporary build output under `build/` is generated locally and is not tracked.

## Complete tracked tree

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
  solution-overview.md
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
  test_interactive.sh
~~~

## Top-level layout
| Path | Purpose |
|---|---|
| `.github/` | Issue forms, discussions, PR template, Dependabot and CI/security/release workflows |
| `chatbot/` | C source, editor settings and retained historical Windows executable |
| `docs/` | Product, architecture, security, accessibility, testing, operations and maintenance guides |
| `docs/assets/` | SVG identity, architecture diagrams, sequence visuals and workflow illustrations |
| `docs/decisions/` | Accepted Architecture Decision Records |
| `docs/templates/` | Reusable engineering, QA, security, release and governance templates |
| `scripts/` | Setup, documentation, Markdown, tree, security-hygiene and release scripts |
| `tests/` | C unit assertions and POSIX interactive smoke tests |

## Runtime entry points
- `chatbot/chatbot.c` is the only application source file and contains `main` plus input, normalization, classification and response helpers.
- `Makefile` builds `build/chatbot`, unit tests and the local quality gate.
- `tests/test_chatbot.c` verifies classifier and normalization behavior.
- `tests/test_interactive.sh` checks stdin/stdout, long lines and EOF on POSIX.
- `chatbot/chatbot.exe` is a retained historical binary, not rebuilt or provenance-attested by source CI.

## Important root files
| File | Responsibility |
|---|---|
| `README.md` | Project presentation, setup, examples, scope and docs index |
| `LICENSE` | MIT license |
| `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md` | Contributor workflow and community behavior |
| `SECURITY.md`, `SUPPORT.md` | Private vulnerability route and support guidance |
| `CHANGELOG.md`, `ROADMAP.md` | Implemented changes and proposed future work |
| `CITATION.cff`, `AUTHORS.md`, `CODEOWNERS` | Citation and ownership metadata |
| `.clang-format` | Optional C formatting defaults |
| `.gitleaks.toml` | Gitleaks default detector extension |
| `.env.example` | Confirms no runtime environment variables are required |

## GitHub automation
- `ci.yml`: Linux full checks and Windows source build/unit tests.
- `lint.yml`: Markdown, local documentation and project-tree checks.
- `docs-validation.yml`: documentation links and SVG validation.
- `security-scan.yml`: Gitleaks history scan, local heuristic, tests and GCC analyzer.
- `codeql.yml`: C/C++ static analysis.
- `dependency-review.yml`: pull-request dependency review.
- `release.yml`: manual Linux source-artifact build from an existing tag.

See [GitHub configuration](../.github/README.md) and [GitHub Actions guide](github-actions.md).

## Documentation boundaries
API/database guides explicitly document that those features do not exist. UX and operations guides explain the actual CLI and inapplicable service features. See the [master checklist applicability register](repository-file-applicability.md).
