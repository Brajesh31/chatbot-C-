# 🧪 QA Test Case Template

## 1. Test metadata

| Field | Value |
|---|---|
| Test ID | |
| Test title | |
| Feature/build | |
| Requirement/issue reference | |
| Author/date | |
| Priority/severity | |
| Environment | |
| Source commit/tag | |

## 2. Preconditions

List required setup, compiler/runtime, terminal, user state, installed tools and assumptions. Mark non-applicable conditions explicitly.

## 3. Test data

| Input/data | Purpose | Expected boundary | Sensitivity |
|---|---|---|---|

Use synthetic test data. Never add real credentials or private user messages.

## 4. Test procedure

| Step | Action | Expected result | Actual result | Pass/Fail |
|---:|---|---|---|---|

Include exact commands, input bytes, newline/EOF condition and process exit behavior when testing terminal input.

## 5. Boundary and negative coverage

- [ ] Empty input.
- [ ] Minimum valid input.
- [ ] Maximum accepted input.
- [ ] Input exceeding the configured limit.
- [ ] Unsupported phrase.
- [ ] Case variation.
- [ ] Phrase collision and rule precedence.
- [ ] EOF and input-error path, where reproducible.

## 6. Evidence

Attach sanitized terminal output, logs, CI run links, or test artifacts. Do not attach fabricated screenshots or binary output that cannot be tied to a source revision.

## 7. Defect reference

Link the issue and record reproduction frequency, severity, workaround, owner and retest status.

## 8. Result summary

- Overall result:
- Tests passed:
- Tests failed:
- Tests skipped:
- Known limitations:
- Reviewer/sign-off:
