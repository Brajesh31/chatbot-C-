# 🧭 Project Objectives

## Primary objectives
1. Keep the application small enough to understand in one sitting.
2. Demonstrate a predictable input-classification-response loop in C.
3. Use bounded input and handle EOF without reading invalid data.
4. Separate input reading, normalization, classification, and response text into functions.
5. Provide deterministic unit tests and terminal integration tests.
6. Make the project buildable with a standard C toolchain and no application dependencies.
7. Keep documentation aligned with checked-in source and actual workflows.

## Success criteria
| Objective | Evidence |
|---|---|
| Portable source build | Strict C11 compile on Linux and Windows CI |
| Deterministic behavior | Unit tests for each response category |
| Safe line handling | Integration tests for EOF and long input |
| Understandable structure | Function reference and project tree |
| Reproducible contribution | Documented Make targets and CI |

## Non-goals
The project does not attempt generative responses, semantic understanding, durable memory, a graphical interface, networking, multi-user sessions, or a database. Those would materially change scope and require an explicit proposal.
