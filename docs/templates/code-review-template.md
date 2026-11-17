# 🔍 Code Review Checklist

## Change context
- Pull request:
- Related issue:
- Reviewer:
- Source commit:
- Summary of intended behavior:

## Correctness
- [ ] Change solves the stated problem.
- [ ] Rule precedence and exact exit behavior are deliberate.
- [ ] EOF and input errors are handled.
- [ ] Empty and overlong input behavior is considered.
- [ ] No unrelated behavior changed silently.

## C quality and portability
- [ ] C11 build succeeds.
- [ ] Compiler warnings are resolved.
- [ ] Bounds and string termination are correct.
- [ ] Character conversion avoids signed-char undefined behavior.
- [ ] Standard library use is portable.
- [ ] Allocation/resource ownership is clear.

## Tests and documentation
- [ ] Unit tests cover new helper or rule behavior.
- [ ] Integration tests cover observable terminal behavior.
- [ ] make check passes.
- [ ] README, API/function docs, and diagrams are current.
- [ ] No test coverage claims exceed actual evidence.

## Security, privacy and accessibility
- [ ] No credentials, unsafe input handling, or accidental persistence.
- [ ] Trust boundaries and dependencies remain accurate.
- [ ] Terminal output remains understandable without color.
- [ ] No fabricated API, database, or AI capabilities are described.

## Review outcome
- [ ] Approve
- [ ] Request changes
- [ ] Comment only

Blocking findings:
Non-blocking suggestions:
Evidence and CI links:
