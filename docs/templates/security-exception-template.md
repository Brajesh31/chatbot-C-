# 🔐 Security Control Exception

Use this record only when a project owner knowingly accepts a temporary deviation from an internal security control. It is not a vulnerability report, a public disclosure channel, or a substitute for fixing a defect.

## 1. Exception identity

| Field | Value |
|---|---|
| Exception ID | |
| Date raised (UTC) | |
| Requesting owner | |
| Approving owner | |
| Affected repository / component | |
| Control or requirement | |
| Status | Proposed / Approved / Rejected / Expired / Closed |

## 2. Requested deviation

Describe the exact control that cannot currently be met, the affected paths or workflows, and the proposed scope. Avoid broad statements such as "security checks can be skipped".

## 3. Business and technical justification

- Why the control cannot be met now:
- Why the work cannot be delayed:
- Alternatives considered:
- Why the least-risk alternative was selected:
- User or operational impact:

## 4. Threat and risk assessment

| Threat scenario | Likelihood | Impact | Existing protection | Residual risk |
|---|---|---|---|---|
| | | | | |

State assumptions and unknowns. Do not present qualitative ratings as measured probabilities.

## 5. Compensating controls

| Control | Owner | How it works | Verification evidence | Review frequency |
|---|---|---|---|---|
| | | | | |

Compensating controls must be operating, testable safeguards, not promises to be careful.

## 6. Scope and expiry

| Field | Value |
|---|---|
| Exact scope | |
| Start date | |
| Expiry date | |
| Review cadence | |
| Remediation owner | |
| Remediation issue / PR | |

Exceptions must be time-bound. Do not approve an indefinite exception. Expiry requires renewal review or closure.

## 7. Approval decision

| Reviewer | Decision | Conditions | Date |
|---|---|---|---|
| Security / maintainer | | | |
| Component owner | | | |

Approval does not remove the obligation to monitor the residual risk or to disclose material limitations to affected maintainers.

## 8. Monitoring and closure

- Events or changes that trigger immediate reassessment:
- Evidence reviewed at each check:
- Remediation commit:
- Final verification:
- Date exception closed:

Close the exception only after the original control is restored and its effectiveness is verified, or after a formally reviewed replacement control is adopted.
