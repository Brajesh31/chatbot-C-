# Security Policy

## Supported versions

No release or support matrix is published. Reports should identify the affected commit or current default branch. This small command-line example has not received a security audit.

## Reporting a vulnerability

Do not post exploit details, credentials, or private information in a public issue. Use GitHub's private vulnerability reporting for this repository when available. Otherwise, contact `@brajesh31` privately using the contact method on the GitHub profile. Include the affected file, impact, reproducible steps, and a safe way to follow up. A maintainer will coordinate a response when possible; no response-time guarantee is made.

Ordinary behavior defects can be reported publicly. Do not include real credentials as proof.

## Current security considerations

- The program runs locally and contains no network, authentication, or persistent storage code.
- Input is read into a fixed 100-byte buffer with `fgets`, which bounds each read, but the return value is not checked. EOF handling should be fixed before using this as a robust interactive tool.
- The checked-in executable is a Windows binary. Prefer building from the reviewed C source for the target platform if binary provenance or integrity matters.
- Do not add unsafe formatting or shell execution of user input.
