# 📦 Dependency Security

The chatbot has no third-party runtime library dependency. Its runtime surface is the C standard library supplied by the selected toolchain and operating environment.

## What is still a dependency
- The C compiler and linker used to create the executable.
- The Make implementation used for convenience targets.
- GitHub-hosted Actions used for CI, CodeQL, and release artifacts.
- POSIX shell and awk for Linux integration tests.

## Review expectations
- Keep GitHub Actions permissions minimal.
- Review action version changes and changelogs.
- Prefer supported compiler toolchains.
- Do not add a library solely for convenience when standard C is sufficient.
- Record any new runtime dependency, version constraints, license, and update strategy.

Dependabot monitors GitHub Actions references. It does not replace review of compiler updates or source changes.
