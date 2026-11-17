# ☁️ Hosting and Distribution

## Applicability
The chatbot runs on the user's computer as a command-line process. It is not hosted by GitHub Pages, a cloud provider, a container platform or a web host. There is no live demo URL or remote endpoint. GitHub hosts the source repository and runs automation; that is not application hosting.

## How users run it
Users clone the repository and compile the source with a C11-capable compiler. See [installation](installation.md) and [building](building.md). The manual workflow can create a Linux artifact from an existing tag.

## Hosting services not used
| Category | Current use | Reason |
|---|---|---|
| Static website hosting | None | No frontend |
| Application hosting | None | No server process |
| Database hosting | None | No persistent model |
| Object storage | None | No app upload/storage |
| Serverless functions | None | No HTTP/event handler |
| CDN/reverse proxy | None | No remote app content |

Build from reviewed source and run checks before distribution. The tracked `chatbot/chatbot.exe` is a historical binary, not a reproducible release.

A hosted version creates a network trust boundary and requires service design, abuse controls, privacy/retention policy, deployment, monitoring and incident ownership. Hosting must follow architecture, not precede it.
