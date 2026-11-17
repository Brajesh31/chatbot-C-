# 🎯 Feature Scope and Product Boundaries

## Product definition

Simple C Chatbot is a small deterministic command-line demonstration written in C11. It reads a bounded line from stdin, normalizes the text, evaluates a fixed set of rules, prints a fixed response, and continues until exact bye or EOF.

## Current in-scope behavior

| Area | Included behavior |
|---|---|
| Startup | Print an introductory greeting |
| Input | Read one line at a time, up to the fixed capacity |
| Normalization | Lowercase byte values using the C character library |
| Classification | Greeting, status, exact goodbye, or fallback |
| Output | Print a static response string |
| Resilience | Handle EOF and reject overlong logical lines |
| Engineering | C unit tests, POSIX integration tests, Makefile and CI |

## Explicitly out of scope

- Generative AI, large language models, prompt engineering, embeddings, or retrieval.
- Conversation memory, user profiles, personalization, or persistent chat logs.
- HTTP endpoints, sockets, APIs, webhooks, or remote integrations.
- Authentication, authorization, user accounts, or role-based access.
- Database storage, analytics, telemetry, or hosted operations.
- Web frontend, graphical UI, mobile application, voice input/output, or browser features.
- Multilingual natural-language understanding or semantic intent detection.

## Rule semantics

The current rules are ordered. A greeting substring is checked first, then the status phrase, then exact bye, then fallback. This means that a string containing both hello and bye receives the greeting and continues. The exit check is not a substring check.

## Change-control requirements

A proposed feature must include:
1. The user problem and a real example.
2. A clear statement of goals and non-goals.
3. Rule precedence and edge cases.
4. Impact on input capacity, portability, dependencies, and terminal behavior.
5. Unit and/or integration tests.
6. Security, privacy, and accessibility implications.
7. Documentation and roadmap changes.

The maintainer should reject changes that add framework-style complexity without a concrete user need. The [feature specification template](templates/feature-specification-template.md) provides a review format.
