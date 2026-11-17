# 🔄 Migration Guide Template

## 1. Migration metadata

- Migration title:
- From version/tag:
- To version/tag:
- Source commit(s):
- Owner:
- Related issue/ADR:
- Planned date:

## 2. Summary and impact

Explain why the migration is needed, which users/platforms are affected, whether it is backward compatible, and what happens if users do nothing.

## 3. Compatibility assessment

| Area | Before | After | Breaking? | User action |
|---|---|---|---|---|

## 4. Preconditions

List required compiler/runtime versions, source backup, permissions, environment, and assumptions. State clearly when there is no persistent user data or external service involved.

## 5. Required steps

Give ordered, copyable commands. Explain expected output and where users should stop if a step fails.

## 6. Data/configuration changes

Document transformation rules, validation, backup, retention and deletion where real data exists. If no schema or persistent data exists, state that explicitly rather than inventing migrations.

## 7. Verification

| Check | Command/action | Expected result | Evidence |
|---|---|---|---|

## 8. Rollback

Explain when rollback is safe, exact revision/artifact to restore, command sequence, data-loss implications, and post-rollback tests.

## 9. Known issues and support

List known migration problems, workarounds, linked issues, and support route.

## 10. Completion

Record completed version, owner, date, test evidence and unresolved risks.
