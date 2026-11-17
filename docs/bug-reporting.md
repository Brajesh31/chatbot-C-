# 🐛 Bug Reporting Guide

## Before opening an issue

Search existing issues and read the troubleshooting guide. Confirm the issue against a current source build rather than relying on the retained historical Windows executable.

## Information to include

- Affected commit or tag.
- Operating system and architecture.
- Compiler name/version and flags.
- Exact build or run command.
- Minimal reproducible input.
- Expected output and actual output.
- Exit status and whether the issue is repeatable.
- Relevant CI job or sanitized log.

## Reproduction quality

A good report contains the shortest sequence that reproduces the problem. For rule behavior, include the exact phrase and explain which earlier rule should or should not take precedence. For input-boundary problems, state the input length in bytes and whether the line ends with newline or EOF.

## Sensitive data

Do not include credentials, private messages, personal identifiers, or untrusted binaries. Use private vulnerability reporting for security-sensitive defects. Public issue forms are for non-sensitive behavior and documentation problems.

## Maintainer workflow

The maintainer should reproduce the issue, identify the affected source path, label severity, add a regression test, and update documentation when behavior changes. Use the [bug report template](templates/bug-report-template.md).
