# 🔒 Encryption Applicability

## Current runtime behavior

The chatbot stores no persistent conversation history and performs no network communication. It therefore does not implement encryption at rest, TLS transport, encrypted session storage, key management, certificate pinning, or application-level cryptography.

The GitHub website and hosted CI services use platform transport/security controls. Those services are outside the C application and should not be counted as chatbot encryption features.

## Sensitive information

Users should not enter passwords, API keys, or sensitive personal information into shared terminal sessions. The terminal host, shell session recorder, operating system, or screen-sharing software may capture content independently of this program.

## Future requirements

A change introducing storage or network traffic must identify data classification, encryption boundaries, key ownership, algorithm/library selection, rotation, backup behavior, failure modes, and testing. Do not invent a custom cryptographic implementation for this project. Use a maintained, reviewed platform or library appropriate to the approved architecture.

See [data protection](data-protection.md), [privacy](data-privacy.md), and [secret management](secret-management.md).
