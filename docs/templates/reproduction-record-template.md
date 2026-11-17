# 🧪 Reproduction Record

Use this record when a defect needs repeatable reproduction. Keep the steps minimal, deterministic, and safe to share. Do not include passwords, API keys, private user data, or production secrets.

## 1. Record metadata

| Field | Value |
|---|---|
| Record ID | |
| Related issue / pull request | |
| Reporter | |
| Date created (UTC) | |
| Affected commit or tag | |
| Status | Draft / Reproduced / Not reproduced / Blocked / Resolved |
| Triage owner | |

## 2. Problem statement

Describe the observed defect in one or two precise sentences. Identify whether the behavior is a crash, incorrect output, build failure, documentation defect, security concern, or environment-specific issue.

## 3. Environment

| Item | Exact value |
|---|---|
| Operating system and version | |
| Architecture | |
| Compiler and version | |
| Compiler flags | |
| Shell / terminal | |
| Python / Make versions, if relevant | |
| Repository commit | |
| Build artifact source | |

Include only environment details that can influence the behavior.

## 4. Preconditions

List required setup, input files, permissions, environment variables, working directory, and process state. State explicitly when no special precondition is required.

## 5. Minimal reproduction

1. Start from a clean checkout of the affected commit.
2. Run the exact build command.
3. Run the exact command or test that exposes the problem.
4. Supply the smallest input that still reproduces it.
5. Capture the process exit code and relevant output.

~~~sh
# Replace these lines with the actual, safe reproduction commands.
git rev-parse HEAD
make clean
make
~~~

### Input fixture

~~~text
# Include only minimal non-sensitive input.
~~~

## 6. Expected versus actual behavior

| Dimension | Expected | Actual |
|---|---|---|
| Process exit code | | |
| stdout | | |
| stderr | | |
| Files created or changed | | |
| Timing / repeatability | | |

Avoid vague descriptions such as "does not work". Record exact output or a short, faithful excerpt.

## 7. Reproducibility assessment

| Attempt | Same commit? | Same environment? | Result | Evidence |
|---:|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |

Choose one: Always / Intermittent / Once only / Unable to reproduce. Explain any environmental differences.

## 8. Evidence

- Sanitized logs:
- Test output:
- Relevant source path and line:
- Screenshot or terminal capture, if it adds evidence:
- Hash of any safe fixture:

Do not attach a fabricated screenshot or an unredacted environment dump.

## 9. Triage and root cause

| Question | Finding |
|---|---|
| Severity and user impact | |
| Triggering condition | |
| Root cause, if known | |
| Regression range, if known | |
| Security/privacy implications | |
| Workaround | |

Separate verified root cause from hypotheses.

## 10. Resolution and regression prevention

- Fix commit:
- Regression test:
- Documentation updated:
- Cross-platform checks:
- Remaining risk:
- Follow-up owner and due date:

## 11. Review and closure

| Role | Name | Decision | Date |
|---|---|---|---|
| Reporter | | | |
| Triage owner | | | |
| Reviewer | | | |

Close only when the reproduction is resolved or the issue is explicitly classified as not reproducible, out of scope, or superseded, with evidence recorded.
