# 🔗 Integration Inventory

## Current integrations

The chatbot has no external runtime integration. It does not call third-party services, web APIs, local daemons, databases, message queues, webhook receivers, model providers, or analytics endpoints.

| System | Current status | Reason |
|---|---|---|
| C standard library | Required runtime/build dependency | Standard I/O, strings and character operations |
| GCC/Clang/MinGW | Development toolchain | Compile source |
| GNU Make | Optional build tool | Convenience targets |
| GitHub Actions | Repository automation | Build, test and static analysis |
| CodeQL | Repository security analysis | Static source analysis |

## Data boundaries

User input and chatbot responses remain in the local process and terminal streams. GitHub Actions receives the checked-out repository source to run build and quality checks. This CI behavior is not a runtime chatbot integration.

## Integration policy

Any proposed integration must document its business need, data sent and received, network endpoints, credentials, failure modes, license, security boundaries, privacy effect, test environment, and operational owner. Do not add API keys to environment examples unless the application actually reads them.

See [third-party services](third-party-services.md), [external dependencies](external-dependencies.md), and [webhooks](webhooks.md).
