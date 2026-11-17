# 🧭 Architecture Decisions

The numbered records under docs/decisions/ are the authoritative Architecture Decision Records.

| Record | Decision | Status | Reason |
|---|---|---|---|
| 0001 | Keep the program as a standard C console application | Accepted | Current feature set does not justify a service or framework |
| 0002 | Use bounded line input and drain overlong lines | Accepted | Prevent unbounded reads and accidental splitting of logical input |

## Decision governance

Create an ADR when a change materially affects architecture, supported platforms, input semantics, dependencies, security boundaries, or maintenance cost. Use the [ADR template](templates/adr-template.md).

A decision record should include context, drivers, options, selected approach, consequences, security/privacy implications, and verification evidence. Superseded decisions remain in history and should link to the replacing ADR.
