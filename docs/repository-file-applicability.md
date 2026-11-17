# 📋 Master Checklist Applicability Register

This register maps checklist items that are intentionally consolidated, omitted, or not applicable to the current Simple C Chatbot architecture. A missing filename is not automatically a gap when the underlying feature does not exist. The project standard explicitly requires project-specific documentation and prohibits invented systems.

## Main repository files

| Checklist item | Decision | Reason |
|---|---|---|
| README.md, LICENSE, CODE_OF_CONDUCT.md, CONTRIBUTING.md, SECURITY.md, SUPPORT.md | Present | Root project and governance files. |
| CHANGELOG.md, ROADMAP.md, CITATION.cff, AUTHORS.md, CODEOWNERS | Present | History, planning, citation and ownership. |
| FUNDING.yml | Omitted | No verified funding page, sponsor destination, or funding program was supplied. Adding an empty funding file would be misleading. |
| .gitignore, .editorconfig, .gitattributes, .env.example | Present | Native C, local tooling, line endings and no-runtime-environment-variable boundary. |
| .nvmrc, JavaScript lockfiles, .prettierrc | Omitted | There is no Node.js or JavaScript build/runtime in this repository. |
| .markdownlint configuration | Omitted | A project-specific offline Markdown fence validator is used instead; no external linter is installed. |
| .gitleaks.toml | Omitted | The repository includes a small Python secret-pattern hygiene check. It is explicitly not a replacement for a dedicated scanner. |

## Documentation groups consolidated because features do not exist

| Checklist examples | Current treatment | Reason |
|---|---|---|
| docs/api.md, api-reference.md, api-errors.md | Present | Describe the terminal interface and internal helper contract, not HTTP endpoints. |
| docs/api-authentication.md, authentication.md, authorization.md, access-control.md | Present | Explicitly document the absence of app/API identity and access controls. |
| docs/database.md, database-schema.md, data-dictionary.md | Present | Explain transient in-memory data and why an ER/schema diagram would be fabricated. |
| docs/integrations.md, webhooks.md, third-party-services.md | Present | State that there are no runtime remote integrations. |
| UI design system, tokens, component library, responsive design, page docs, navigation, typography, product color system, animations | Consolidated in ui-ux-guidelines.md and branding-guidelines.md | There is no graphical application interface or page/component hierarchy. Repository SVG colors are documentation asset styles, not app design tokens. |
| Production setup, hosting, Docker, containerization, infrastructure, monitoring, observability, health checks | Consolidated in deployment-scope.md and operations.md | This is a local executable, not a hosted service or containerized production deployment. |
| Cookie policy, consent management, data retention/deletion | Present as applicability guides | No cookies, analytics, remote collection, or persistent chat data exist. |
| WCAG and graphical forms/components | Present as applicability and audit guides | The product is a terminal program. No WCAG 2.2 AA conformance is claimed. |

## Diagram applicability

| Diagram requested by master list | Decision |
|---|---|
| System architecture, application flow, user journey, data flow levels 0/1/2 | Present |
| Error handling, deployment, testing, CI/CD, security boundaries | Present |
| Sequence, state and component views | Present as Mermaid or SVG explanations |
| Authentication/authorization flow | Not applicable; no accounts or permissions |
| API request/backend lifecycle | Not applicable; no backend/API |
| Frontend rendering/component hierarchy | Not applicable; no frontend |
| Database ER/schema and backup/restore flow | Not applicable; no database or persistent application data |
| Infrastructure deployment topology | Not applicable; no hosted infrastructure |
| UML class diagram | Not applicable to the current procedural single-translation-unit implementation; no class-based language architecture exists |

## GitHub workflow consolidation

| Suggested workflow name | Current treatment |
|---|---|
| ci.yml | Present; combines platform build and test jobs. |
| build.yml and test.yml | Not added separately because their commands are already represented in ci.yml. Duplicating them would create redundant status checks. |
| lint.yml | Present; runs Markdown, local documentation and tree checks. |
| quality.yml | Quality gates are consolidated in ci.yml, lint.yml and security-scan.yml rather than a fourth duplicate aggregate. |
| security-scan.yml, codeql.yml, docs-validation.yml, dependency-review.yml, release.yml | Present. |
| stale.yml | Not enabled; automatic closure of user issues is not needed and could close valid reports without maintainer review. |
| .github/SECURITY.md | Not added separately because the root SECURITY.md is the single authoritative policy. |
| Discussion templates | Present, but GitHub Discussions must be enabled in repository settings before they are offered. |

## Visual asset applicability

- Original logo, banner, system design, architecture, data-flow, workflow, testing, deployment, error-handling, security, state and response-priority SVGs are present.
- The screenshots directory contains a README explaining that the app has no desktop/mobile GUI.
- The terminal transcript graphic is labelled illustrative, not a screenshot of a live UI.
- No fabricated dashboard, mobile, browser, or settings screenshot is included.

## Maintenance rule

When the architecture changes, revisit this register. An item should move from not applicable to implemented only after source code, tests, documentation, security/privacy analysis, and a passing verification result exist.
