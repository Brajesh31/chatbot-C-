# ↩️ Rollback and Recovery

This is a local executable, not a deployed service. A production traffic rollback procedure is therefore not applicable.

## Recovering from a bad source release
1. Identify the last known-good Git tag or commit.
2. Revert the faulty change on the development branch rather than rewriting shared history.
3. Rebuild from the selected source revision.
4. Run the full test suite and documentation validator.
5. Replace the distributed artifact with a clearly versioned corrected build.
6. Update the changelog with the issue and correction.

Do not overwrite an existing release artifact silently. Preserve provenance between a source tag and the binary built from it.
