# 🛂 Authorization Applicability

## Current implementation

There is no application authorization system. The chatbot does not define roles, permissions, capabilities, tenant boundaries, resource ownership, or privileged commands. Every local user who can launch the executable receives the same fixed interaction.

Operating-system file permissions and process privileges are controlled outside this program. They should not be described as application role-based access control.

## Why authorization is absent

The current application has no accounts, shared resources, administrative operation, or remote endpoint requiring differentiated access. A role matrix would be fabricated.

## Requirements if scope changes

A future multi-user system must define protected resources, actions, role or policy model, default-deny behavior, privilege escalation protections, audit requirements, and authorization tests. Authorization must be enforced on the trusted side of every operation, not merely hidden in a user interface.

See [authentication](authentication.md), [access control](access-control.md), and [threat assessment](threat-assessment.md).
