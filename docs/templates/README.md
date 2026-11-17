# 🧩 Documentation Templates

The repository includes **32 reusable templates**. These forms are intended to capture evidence, decisions, ownership and review outcomes. They do not assert that the corresponding subsystem exists in the current chatbot. API and database templates are future-change formats only.

## Product and engineering

| Template | Use |
|---|---|
| [ADR](adr-template.md) | Record a durable technical decision, context, alternatives and consequences |
| [Architecture](architecture-template.md) | Propose a system design with constraints and trade-offs |
| [Feature specification](feature-specification-template.md) | Define behavior, acceptance criteria and failure paths |
| [Feature proposal](feature-proposal-template.md) | Evaluate user value, scope, dependencies and maintenance cost |
| [Change request](change-request-template.md) | Review a controlled scope or behavior change |
| [Code review](code-review-template.md) | Review correctness, maintainability, tests and risks |
| [Project status](project-status-template.md) | Publish evidence-backed delivery status |
| [Meeting notes](meeting-notes-template.md) | Preserve decisions, actions, owners and deadlines |
| [Maintenance checklist](maintenance-checklist.md) | Schedule repeatable repository and release upkeep |
| [Migration](migration-template.md) | Plan compatibility, data or version transitions |
| [Compatibility matrix](compatibility-matrix-template.md) | Record platform/compiler support evidence |
| [Benchmark](benchmark-template.md) | Record reproducible measurements and environment |

## API, data and release management

| Template | Use |
|---|---|
| [API documentation](api-documentation-template.md) | Document an actual programmatic interface |
| [Database schema](database-schema-template.md) | Document a real schema if a data store is introduced |
| [Release checklist](release-checklist.md) | Verify a tagged source release |
| [Release checklist template](release-checklist-template.md) | Plan release readiness and sign-off |
| [Release notes](release-notes-template.md) | Communicate verified user-facing changes and artifacts |
| [Deployment checklist](deployment-checklist.md) | Prepare executable distribution or deployment |
| [Rollback checklist](rollback-checklist.md) | Recover a faulty release |
| [Reproduction record](reproduction-record-template.md) | Capture minimal steps, environment and expected/actual results |

## Quality and incident response

| Template | Use |
|---|---|
| [Bug report](bug-report-template.md) | Capture a reproducible defect |
| [QA test case](qa-test-case-template.md) | Define one deterministic verification case |
| [Test plan](test-plan-template.md) | Define test scope, risks and exit criteria |
| [Test report](test-report-template.md) | Record executed verification evidence |
| [Incident report](incident-report-template.md) | Capture an incident timeline and impact |
| [Accessibility audit](accessibility-audit-template.md) | Record terminal accessibility observations |
| [User feedback](user-feedback-template.md) | Capture a user need and actionable feedback |

## Security and risk

| Template | Use |
|---|---|
| [Threat assessment](threat-assessment-template.md) | Identify trust boundaries and threat scenarios |
| [Security audit](security-audit-template.md) | Record scope, findings and remediation evidence |
| [Security review](security-review-template.md) | Review a change for security impact |
| [Security exception](security-exception-template.md) | Approve a time-bound control deviation with compensating controls |
| [Risk assessment](risk-assessment-template.md) | Rate risks and assign mitigation owners |

## How to use these templates

1. Copy the closest template into the relevant issue, pull request, or project record.
2. Replace instructions with observed facts and link supporting evidence.
3. Mark unknown or untested items explicitly. Do not invent dates, results, owners, approvals or measurements.
4. Remove sections that genuinely do not apply and explain why.
5. Link the completed record from the affected issue, code change, release or decision.

Templates should evolve with the project. Keep them aligned with the actual C CLI architecture and do not create pretend records for non-existent services.
