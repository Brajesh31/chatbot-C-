# 🗑️ Deprecation Policy

## Current interface stability

The project is a local C command-line program. It does not currently publish a stable external library ABI, HTTP API, persisted schema, package manager artifact or long-term release support promise. The most relevant compatibility surface is the documented terminal behavior and build workflow.

## What may be deprecated

- A user-visible phrase or response rule.
- The exact exit command or its behavior.
- The maximum accepted input length.
- A documented Make target or compiler requirement.
- A published distribution artifact or source-release procedure.
- A template or workflow used by contributors.

## Required process

1. Identify the user or contributor problem that requires removal.
2. State which versions, platforms and scripts are affected.
3. Identify a replacement or explain why none is needed.
4. Open an issue and discuss impact before implementation.
5. Add a deprecation notice to relevant docs and changelog.
6. Keep the previous behavior available for a reasonable transition period when practical.
7. Add migration instructions and tests.
8. Remove the behavior only after a maintainer decision.
9. Record the final removal in CHANGELOG.md and update roadmap/status.

## What is not deprecation

A roadmap idea that was never implemented is not a deprecated feature. A speculative API, database, UI, or integration must not be described as deprecated because it was never part of the product.

## Compatibility and security exceptions

A security defect may require faster removal or behavior change. In that case, document the risk, mitigation, user impact, and release path without exposing exploit details.

## Ownership

The maintainer owns deprecation decisions. Use the change-request and migration templates when a change is substantial.
