# Deployment and Distribution

## Current distribution

This repository is a console program, not a web service. There is no deployment platform, server, API, database, or installer configuration. Build a native executable for the target operating system and distribute that executable with its source and license information as appropriate.

## Build from source

Use a C compiler on the target platform. From the repository root:

```sh
cc chatbot/chatbot.c -o chatbot/chatbot-build
```

Use the operating system's compiler command and executable suffix where they differ. The committed `chatbot/chatbot.exe` is Windows-specific; it is not a portable binary for Linux or macOS.

## Before distributing

- Build and run the source on the target OS and architecture.
- Review the complete diff and confirm the binary corresponds to the intended source revision.
- Include the repository's MIT License and copyright notice with copies.
- Identify the compiler/toolchain if reproducible builds are important.
- Do not represent this local phrase matcher as an online or AI service.

There is no automated release process or signed-binary procedure in the repository.
