# 🧩 Project Background

This repository contains a minimal C chatbot originally organized as a small console exercise. Its value is educational: a compact program can demonstrate how a terminal application reads input, performs string checks, selects a response, and controls its own lifetime.

The original rule set is deliberately narrow. It is small enough for a learner to trace from the application entry point into helper functions without introducing a framework or service architecture.

## Why engineering documentation matters
Even a small program benefits from reproducible builds, tests for edge cases, documented scope, and clear contribution rules. Input handling is a particularly useful teaching point: input-read failures must be checked, long lines must not become multiple user turns, and EOF must be handled deliberately.

## Current baseline
The checked-in Windows executable is retained as an existing repository artifact. It is not the canonical build output. The supported development path is to compile the C source from the current branch using a local C compiler.

For the file inventory, see [project structure](project-structure.md). For implementation choices, see the [architecture decisions](decisions/README.md).
