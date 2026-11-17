# 🚨 Incident Response

## Applicable incidents

The project is a local executable with GitHub-hosted source and CI. Relevant incidents include exposed repository credentials, malicious source changes, compromised release artifacts, unsafe workflow changes, and reproducible input-handling defects with security impact.

There is no production service, customer database, uptime SLA, or 24/7 operations team.

## Response phases

~~~mermaid
flowchart TD
 D[Detect and receive report] --> T[Triage scope and impact]
 T --> C[Contain credential or artifact exposure]
 C --> I[Investigate source and workflow history]
 I --> F[Prepare fix and regression test]
 F --> V[Verify build and security checks]
 V --> R[Coordinate disclosure and corrected release]
 R --> L[Record lessons and follow-up]
~~~

## Credential exposure

Revoke or rotate the affected credential with its issuing provider immediately. Do not rely on deleting the visible file or rewriting Git history as remediation. Review available audit activity and update affected workflows.

## Vulnerable source or binary

Identify affected commit and artifact. Stop distributing the artifact where practical, prepare a reviewed source fix, add a regression test, rebuild from a known tag, and preserve provenance.

## Records

Use the [incident report template](templates/incident-report-template.md). Store sensitive details in the private security report, not the public incident record. No response-time guarantee is made.
