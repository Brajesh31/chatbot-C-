# ADR 0001: Keep a dependency-free C console application

- Status: Accepted
- Date: 2026-11-17

## Context
The program is a single-file console application using standard input/output and string functions. It has no AI or network integration.

## Decision
Keep it as a small standard-C learning example. Do not add a web server, database, LLM SDK, or external dependency simply to increase apparent scope.

## Consequences
Builds remain straightforward, feature scope stays limited, and behavior changes require tests.
