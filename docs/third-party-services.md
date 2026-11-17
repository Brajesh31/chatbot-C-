# 🌐 Third-Party Services

## Runtime service inventory

The chatbot has no third-party runtime service dependency. It does not connect to OpenAI, Google Gemini, a database provider, an authentication provider, a cloud function, a telemetry platform, or any other network service.

## Repository development services

| Service/tool | Used for | Runtime dependency? |
|---|---|---|
| GitHub | Source hosting and issue tracking | No |
| GitHub Actions | Build and repository automation | No |
| GitHub CodeQL | Static source analysis | No |
| GCC/Clang/MinGW | Local compile and test | Development toolchain |
| GNU Make | Build target orchestration | Optional development tool |

## Credentials

No service API key or runtime token is required. The example environment file explicitly states that no environment variables are consumed. Never add real credentials to tracked files.

## Review before adoption

A new hosted service requires a reason, data-flow review, vendor dependency assessment, credential lifecycle, privacy notice, failure fallback, cost/availability ownership, and tests. Document the service in this inventory once it is genuinely used.
