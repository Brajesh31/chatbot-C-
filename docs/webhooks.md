# 🪝 Webhook Applicability

## Current status

No webhook sender or receiver exists in the application. The C executable does not expose a network port, receive HTTP requests, sign webhook payloads, retry deliveries, or process remote events.

GitHub Actions and repository notifications are GitHub platform features. They are not webhooks implemented by the chatbot source.

## If webhook support is proposed

A real webhook design must specify:
- Event names and payload schema.
- Authentication/signature verification.
- Replay protection and timestamp validation.
- Request size and content-type limits.
- Idempotency and duplicate delivery behavior.
- Retry policy, timeout and dead-letter behavior.
- Logging, privacy, retention and redaction.
- Integration and security tests.

Do not create webhook configuration or pretend callback URLs are available until a service endpoint exists. See [integration inventory](integrations.md) and [threat model](threat-model.md).
