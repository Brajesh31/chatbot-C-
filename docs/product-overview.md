# 🎯 Product Overview

## What the product is
Simple C Chatbot is a small interactive terminal program that demonstrates a deterministic, rule-based conversation loop. A user enters a line, the program normalizes its case, checks a fixed set of phrase rules, and prints one predefined response.

It is intentionally a learning-sized program. It is not a conversational AI service, language model, customer-support platform, or production messaging system.

## Intended audience
- C beginners learning standard input/output, arrays, strings, functions, enums, and control flow.
- Students who need a small example that can be compiled without a package manager.
- Contributors learning to add tests and document a native-code project.

## Product qualities
| Quality | Current implementation |
|---|---|
| Execution | Local process in a terminal |
| Conversation | One line at a time |
| Matching | Ordered, case-insensitive byte-oriented phrase checks plus exact exit |
| Responses | Static strings compiled into the program |
| Persistence | None |
| Network access | None |
| External runtime dependencies | None beyond the C runtime |

## Typical interaction
The user starts the executable, receives a greeting, enters a supported phrase, and sees a fixed response. Unknown input receives a fallback response. The session ends on exact “bye” or standard input reaching EOF.

## Product boundary
Model inference, retrieval, memory, accounts, APIs, databases, analytics, and remote deployment are outside the present product. Potential ideas belong in [ROADMAP.md](../ROADMAP.md) and must not be documented as working features.
