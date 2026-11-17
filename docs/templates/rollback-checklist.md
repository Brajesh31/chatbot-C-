# ↩️ Rollback Checklist

- [ ] Identify the affected version/tag/commit.
- [ ] Confirm the last known-good source revision.
- [ ] Determine whether the issue affects source, build artifact, or documentation.
- [ ] Revert through a reviewed commit; do not rewrite shared history.
- [ ] Rebuild from the known-good revision.
- [ ] Run all relevant tests and validators.
- [ ] Verify the replacement artifact.
- [ ] Notify users with affected-version guidance.
- [ ] Update changelog and incident record.
- [ ] Document root cause and prevention work.
