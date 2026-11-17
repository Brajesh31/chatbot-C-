# 🗑️ Deprecation Policy

The project currently exposes no stable external library ABI, network API, persisted schema, or package interface. Most behavior is a local CLI contract.

If a user-visible command, response rule, build target, or distribution path must be removed:
1. Explain the reason and affected users.
2. Identify a replacement, if one exists.
3. Update README, guides, tests, and changelog.
4. Keep previous behavior available for a transition period when practical.
5. Remove it only after an explicit maintainer decision.

Do not label a change deprecated when the feature was only a proposal and never shipped.
