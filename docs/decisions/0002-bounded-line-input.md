# ADR 0002: Bounded input and clean EOF behavior

- Status: Accepted
- Date: 2026-11-17

## Context
The initial program ignored `fgets` return values at EOF and could split overlong physical lines into multiple logical messages.

## Decision
Use a 256-byte input buffer, validate read status, drain overlong lines, terminate cleanly on EOF, and exit only on exact normalized `bye`.

## Consequences
Input behavior is predictable, accepted lines are limited to 255 bytes, and no dynamic allocation is required.
