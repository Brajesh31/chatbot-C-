# 📋 Master Checklist Applicability Register

This register maps the master checklist to the actual Simple C Chatbot. A requested filename is added when it can contain useful project-specific guidance, including an applicability guide. Executable infrastructure is added only when the product needs it.

## Main repository files
| Item | Status | Decision |
|---|---|---|
| README, LICENSE, CODE_OF_CONDUCT, CONTRIBUTING, SECURITY, SUPPORT | Present | Root project and governance files |
| CHANGELOG, ROADMAP, CITATION.cff, AUTHORS, CODEOWNERS | Present | History, planning, citation and ownership |
| FUNDING.yml | Omitted | No verified funding destination was provided |
| .gitignore, .editorconfig, .gitattributes, .env.example | Present | Native C and local development |
| .clang-format | Present | Optional C source formatting defaults |
| .gitleaks.toml | Present | Extends Gitleaks default detectors |
| .nvmrc, JS lockfiles, .prettierrc | Not applicable | No JavaScript or Node runtime |
| Application lockfile | Not applicable | No third-party runtime package manager |

## Documentation coverage
| Checklist group | Coverage |
|---|---|
| Project/product and requirements | Product overview, background, objectives, problem/solution, features, functional/non-functional requirements, personas, journeys, use cases, scope, FAQ and glossary |
| Architecture and engineering | Architecture, system design, component/module boundaries, lifecycle, dependencies, technology, configuration, data flow, error handling, logging, performance, scalability, compatibility and code standards |
| Setup and development | Installation, getting started, local development, workflow, build/run, debugging, commands and developer/maintainer/contributor guides |
| API and data | API guides describe terminal/function interfaces and explicitly state no HTTP API exists; database guides state there is no database/ER model |
| UI/UX | Design system, tokens, component library, responsive behavior, navigation, terminal surfaces, typography, color and animation |
| Security | Security guide/architecture, threat model/assessment, secrets, vulnerability management, incident response, dependency security, audit logging, risks and security tests |
| Accessibility | CLI accessibility, keyboard interaction, screen-reader notes, contrast, testing and audit, including a consolidated terminal accessibility guide. No WCAG conformance claim |
| Quality | Test strategy/plan, unit tests, Linux shell and Windows PowerShell process-level tests, scenario-to-runner test matrix, QA, quality gates and coverage limitations |
| Deployment/DevOps | Deployment, production setup, hosting, infrastructure, CI/CD, GitHub Actions, release procedure, rollback, monitoring, observability, health checks, containerization and Docker applicability |
| Privacy/compliance | Privacy, data handling, retention/deletion, cookies, consent, compliance scope and legal considerations |
| Maintenance | Maintenance, known issues, technical debt, risk, deprecation, migration, upgrade, decisions, status and roadmap |

## Actual product boundary
The application is a single-process C terminal program. It has no HTTP server, endpoint, remote API, authentication, roles, database, webhook, external model provider or runtime network integration. API/database/security/UX documents with those names are boundary records, not evidence that such capabilities exist. No fictional routes, payloads, credentials, tables, migrations or integration status are documented.

## UX documents and actual equivalents
| Requested document | Treatment |
|---|---|
| Design system | CLI prompts, response classes, warnings and session states |
| Design tokens | No visual token engine; source constants and SVG styles are distinguished |
| Component library | Private C helper boundaries, not widgets |
| Responsive design | Terminal wrapping; byte limit is separate |
| Navigation | Conversation flow, no routes or menus |
| Page documentation | Startup, prompt, reply, warning, EOF and exit states |
| Typography | Terminal-controlled font rendering |
| Color system | Plain text, no ANSI color |
| Animation | No runtime motion or screen redraw |

## Deployment and operations
Production setup, hosting, infrastructure, monitoring, observability, health-check, containerization and Docker guides describe the current local-executable model and future adoption criteria. No production server, container image, cloud topology, monitoring agent or health endpoint is claimed.

The release workflow builds a Linux artifact from an existing tag. It does not publish a GitHub Release, sign binaries, create checksums, attest provenance or deploy a service.

## Diagrams and visual assets
System, application flow, user journey, DFD levels 0/1/2, dedicated runtime sequence and state diagrams, testing, CI, security, error-handling and distribution diagrams are documented. ER diagrams are not applicable because there are no tables or persisted application data. UML class diagrams are not applicable to procedural C. Authentication and frontend component diagrams are not applicable. The screenshot directory explains why no fake GUI screenshots are included.

## Templates
The templates directory contains 32 reusable templates, including ADR, architecture, API, database, feature, bug, QA, test, threat, security, accessibility, incident, release, release notes, deployment, rollback, migration, risk, change-request, code-review, status, meeting-notes, maintenance, reproduction records and security exceptions. API/database templates are reusable proposal tools only. Every template must be completed with evidence, ownership and review details before it is treated as a project record.

## GitHub automation
| Requirement | Treatment |
|---|---|
| Issue forms and config | Present |
| PR template | Present |
| Discussion templates | Present; Discussions setting remains disabled |
| Dependabot | Monthly GitHub Actions updates |
| Build/test | Consolidated in ci.yml, Linux `make check` plus Windows MinGW compile, C unit and PowerShell process tests |
| Lint/docs/tree | Focused lint and docs workflows; local Markdown-fence, link, SVG and tree validators |
| CodeQL and dependency review | Dedicated workflows |
| Secret scanning | Gitleaks full-history scan plus local tracked-text heuristic |
| Release | Manual artifact from existing tag |
| Separate build/test/quality workflows | Consolidated to avoid duplicate checks |
| stale.yml | Not enabled to avoid auto-closing valid reports |
| .github/SECURITY.md | Not duplicated; root SECURITY.md is authoritative |

## Documentation and validation standard

The root README contains the user-facing setup and behavior contract, the complete generated tracked-file inventory, architecture and test references. The detailed documentation index groups the supporting guides. The tracked tree must be regenerated whenever files are added, renamed or removed. The custom Markdown validator checks fence balance; the documentation validator checks local links and SVG XML/metadata. These are offline structural checks, not a full CommonMark or external-link certification.

## Additional project-specific guides

- `sequence-diagrams.md` and `state-diagrams.md` provide editable Mermaid runtime diagrams.
- `terminal-accessibility.md` consolidates the CLI accessibility behavior and limitations without claiming certification.
- `compiler-support.md` and `build-matrix.md` separate CI-verified toolchains from untested ones.
- `testing-matrix.md` maps behaviors to Linux, Windows and C unit tests.
- `release-process.md` describes the manual tagged Linux artifact workflow and what it does not do.
- `repository-audit.md` describes repeatable inspection and validation commands.

## Intentionally omitted
- `FUNDING.yml`: no verified destination.
- Docker assets and container publishing: no approved use case.
- Node/frontend configuration: no JavaScript UI.
- Application API, database, authentication or network integration: absent from source.
- Fake UI screenshots, demo links, cloud topology, performance results, security certification or coverage percentages: unsupported by evidence.

Revisit this register whenever architecture changes. A filename alone does not make a feature implemented. Preserve useful existing files and never add empty placeholders.
