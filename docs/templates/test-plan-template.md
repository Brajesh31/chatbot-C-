# 🗒️ Test Plan Template

## 1. Plan metadata

- Test plan ID/title:
- Feature/release:
- Source commit/tag:
- Owner:
- Reviewers:
- Date:
- Related requirements/issues:

## 2. Objectives

State which user-visible behavior, technical contract or quality risk this plan verifies. Define measurable exit criteria.

## 3. Scope

| Included | Explicitly excluded |
|---|---|
| | |

Avoid testing nonexistent endpoints, databases, GUI flows or integrations.

## 4. Risk and priority analysis

| Risk | Likelihood | Impact | Test priority | Coverage strategy |
|---|---|---|---|---|

## 5. Test levels

| Level | Tools | Responsible owner | Entry criteria | Exit criteria |
|---|---|---|---|---|
| Unit | | | | |
| Integration | | | | |
| End-to-end | | | | |
| Static analysis | | | | |
| Manual | | | | |

## 6. Environment matrix

| OS/compiler/runtime | Version | Architecture | Required? | Result |
|---|---|---|---|---|

Record exact compiler flags, shell and terminal where relevant.

## 7. Test cases

List test IDs, inputs, expected results, boundary values, rule collisions, invalid conditions, EOF behavior and regression scenarios. Link detailed cases to the QA test-case template.

## 8. Automation and evidence

Provide copyable commands, CI workflow links, logs and artifact locations. State what each automated check does not cover.

## 9. Risks, dependencies and constraints

List test environment limitations, unavailable platforms, third-party dependencies and known nondeterministic conditions.

## 10. Defect management

Define severity, reproduction requirements, triage owner, retest procedure and closure criteria.

## 11. Sign-off

| Reviewer | Decision | Date | Notes |
|---|---|---|---|
