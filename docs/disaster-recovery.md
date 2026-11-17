# 🧯 Disaster Recovery Applicability

## No hosted application environment

The repository does not operate a production server, database cluster, cloud workload, persistent user-data store, or network service. There is no application failover region, service restoration objective, customer-data disaster recovery plan, or uptime commitment.

## What may need recovery

- Source history and tagged revisions hosted by GitHub.
- Contributor working copies.
- The historical Windows executable, which should be treated as an existing artifact rather than a verified release.
- Reproducible build instructions and workflow definitions.

## Recovery approach

If a working clone is lost, clone the repository again. If a local executable is lost, rebuild from a reviewed source commit. If the repository itself is unavailable, use an independently maintained local clone or backup of the Git history.

## Future production deployment

If the project becomes a service, define recovery objectives, infrastructure ownership, backups, restore tests, dependency availability, incident communication, secrets recovery, and annual exercises. Do not claim disaster recovery capability for the current console program.
