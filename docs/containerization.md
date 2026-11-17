# 📦 Containerization

## Current decision
This is a native C command-line executable. Containerization is not required to build or run it. There is no Dockerfile, OCI image, compose file, registry or orchestrator configuration.

## Why a container is not justified today
- No external service dependencies.
- Uses host C runtime and stdin/stdout.
- No network listener or persistent data directory.
- Local compilation is already a short reproducible command.
- Container images would add maintenance without solving a present requirement.

## Current build and run
~~~sh
make
./build/chatbot
make test
~~~

## Adoption requirements
A future proposal must define OS/architecture, base image, build stage, non-root execution, writable paths, stdin/stdout and signal behavior, image scanning, provenance, tags, registry ownership and patch policy.

This is an applicability decision, not an implemented feature. Do not add Docker badges or publish images until a real image is built and tested. Related: [Docker applicability](docker.md), [infrastructure](infrastructure.md), [deployment](deployment.md).
