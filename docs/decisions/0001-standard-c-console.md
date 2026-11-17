# ADR 0001: Keep a Dependency-Free C Console Application

- **Status:** Accepted
- **Date:** 2026-11-17
- **Decision owner:** Project maintainer
- **Related source:** chatbot/chatbot.c
- **Related documentation:** docs/architecture.md, docs/feature-scope.md

## 1. Context

The project is a small educational chatbot. Its actual runtime behavior is a terminal read/response loop with a few phrase checks and fixed response strings. The implementation uses the C standard library and can be built using a C11-capable compiler.

A web server, database, AI SDK, external framework, package manager, or deployment platform would introduce dependencies and operational complexity without solving a requirement in the current product definition.

## 2. Decision drivers

- Keep the source readable to C learners.
- Preserve a small and reproducible compiler command.
- Minimize runtime dependencies and external trust boundaries.
- Keep behavior deterministic and offline.
- Make tests easy to execute in local and hosted environments.
- Avoid falsely describing the project as a production AI chatbot.

## 3. Options considered

| Option | Advantages | Costs and risks | Decision |
|---|---|---|---|
| Standard C terminal application | Simple, portable, deterministic, no runtime packages | Limited interaction and no semantic understanding | Selected |
| Add a terminal UI framework | Richer terminal controls | New dependencies, platform differences, unnecessary abstraction | Rejected for current scope |
| Convert to HTTP service | Enables remote clients | Networking, authentication, hosting, operations and security obligations | Rejected for current scope |
| Add a model/API provider | Contextual generated responses | Secrets, network, privacy, reliability and cost | Rejected for current scope |

## 4. Decision

Keep the runtime as a single-process standard C console program using standard input, standard output, and the C standard library. Do not add a remote model or service unless a separately reviewed user requirement justifies a product redesign.

## 5. Consequences

**Positive:** build and run commands remain small; no service credential is required; execution is deterministic; privacy and threat boundaries remain narrow.

**Trade-offs:** responses are fixed, phrase matching is simplistic, there is no persistent history, and the program cannot serve remote or concurrent users.

## 6. Security, privacy and accessibility

The local process does not transmit or store chat messages. Input still comes from an untrusted terminal stream and must remain bounded. The interface is plain text and depends on the user's terminal and assistive technology.

## 7. Verification

The current source compiles with strict C11 flags. Unit and POSIX integration tests exercise rule and input behavior. GitHub Actions verifies Linux and Windows builds. These checks support the decision but do not prove universal compiler portability.

## 8. Reconsideration triggers

Reconsider this ADR only when a concrete user requirement needs a richer terminal UI, remote service, persistence, model inference, or multi-user capability. Any replacement must include security, privacy, operations, testing and maintenance analysis.
