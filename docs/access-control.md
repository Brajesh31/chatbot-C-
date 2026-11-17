# 🔐 Access Control Applicability

## Current application boundary

The C chatbot has no internal user identity, role table, permissions file, administrator command, or shared data resource. It therefore has no application-level access-control decision to make.

The operating system and repository hosting platform apply their own access controls to files, processes, GitHub permissions, and security advisories. These are external platform controls and are not implemented by chatbot.c.

## Current maintainer controls

Repository ownership and review responsibility are documented in CODEOWNERS, MAINTAINERS.md, and GOVERNANCE.md. GitHub permissions determine who can change the repository. The executable itself does not inspect GitHub identities.

## Before adding shared or protected functionality

Define principals, resources, actions, policy evaluation, default behavior on failure, least-privilege roles, audit needs, and tests. The design must distinguish operating-system permissions from application authorization.

Related: [authentication](authentication.md), [authorization](authorization.md), and [security architecture](security-architecture.md).
