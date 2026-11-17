# 🗓️ Data Retention

## Current application policy

The chatbot has no persistent message store or user profile. Each line is processed in the current input buffer and then overwritten by a later read. When the process exits, its process memory is released by the operating system.

There is no application-defined retention period, archive, deletion queue, or backup for conversation content because the program does not retain conversations.

## External terminal records

A terminal host, shell recording facility, operating system, remote terminal service, or screen recorder may retain content independently. Users and administrators must review those external configurations separately.

## Future persistence requirements

If storage is introduced, document:
- Data categories and their purposes.
- Retention period and deletion trigger.
- Legal/business owner and user notice.
- Backup copies and their expiry.
- Access controls and audit requirements.
- Deletion verification and failure recovery.

Do not create a retention duration for data that the current application does not store.
