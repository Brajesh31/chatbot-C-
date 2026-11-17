# 🛡️ Data Protection

## Current data footprint

The executable processes one line of terminal input in memory and maps it to a fixed response. It does not persist conversations, profiles, analytics, identifiers, or remote records.

## Protection measures and limitations

| Area | Current behavior | Boundary |
|---|---|---|
| Collection | User-entered text only | Provided directly through stdin |
| Use | Local phrase classification | No semantic model |
| Storage | No application storage | Terminal/OS may independently record |
| Transmission | No runtime network requests | Repository hosting/CI is separate |
| Deletion | Buffer is reused; process exits | No persisted application record exists |
| Access | Local process and terminal | OS permissions are external |

## User guidance

Avoid entering secrets or sensitive information into a shared terminal. When capturing logs or screenshots for an issue, redact personal paths, usernames, credentials, and private messages.

## Future data features

Any retention or transfer feature requires a data inventory, purpose, lawful basis where applicable, notice, access control, encryption, retention schedule, deletion process, incident plan, and tests. Update privacy and security documents before release.
