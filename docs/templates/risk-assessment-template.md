# 📉 Risk Assessment Template

## 1. Assessment metadata

- Assessment title:
- Project/component:
- Source commit/tag:
- Assessor:
- Review date:
- Related issue/ADR:
- Scope and exclusions:

## 2. Scoring method

Define the scale before rating any risk.

| Score | Likelihood definition | Impact definition |
|---:|---|---|
| 1 | Rare under documented conditions | Negligible user or maintenance impact |
| 2 | Uncommon | Limited impact with simple workaround |
| 3 | Plausible | Material impact or repeated failure |
| 4 | Likely | Significant impact or difficult recovery |
| 5 | Expected/frequent | Severe impact or broad compromise |

Risk score = likelihood × impact. Explain any project-specific adjustment. Do not present qualitative scores as measured probabilities.

## 3. Risk inventory

| ID | Risk/event | Cause | Affected asset/user | Likelihood | Impact | Score | Existing control |
|---|---|---|---|---:|---:|---:|---|

## 4. Treatment plan

| Risk ID | Preventive control | Detection method | Contingency | Owner | Target date |
|---|---|---|---|---|---|

## 5. Residual risk and acceptance

For each accepted risk, record the reason it remains, expected impact, workaround, decision authority, and review date.

## 6. Reassessment triggers

Review after architecture or feature changes, new runtime dependencies or remote services, changes to input boundaries or credentials, security incidents, release failures, compatibility regressions, or material user-reported problems.

## 7. Verification evidence

Link tests, CI runs, static-analysis results, threat models, ADRs and incident reports. Mark checks not executed as Not tested rather than assuming a pass.

## 8. Approval

| Reviewer | Decision | Date | Conditions |
|---|---|---|---|
