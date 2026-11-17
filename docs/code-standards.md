# 📐 Code Standards

## C source requirements
- Target C11 unless a reviewed decision changes the baseline.
- Include only headers needed by the source.
- Keep helper functions private with static when they are not an external interface.
- Use descriptive names and enums for finite categories.
- Check input and library return values.
- Keep buffers bounded and document their capacity.
- Pass an unsigned-char value to C character-classification functions.
- Avoid global mutable state and unnecessary heap allocation.

## Build gate
The normal Makefile build treats common compiler warnings as errors. Do not weaken compiler flags to silence a warning. Fix the underlying issue or document a justified platform-specific exception.

## Documentation and tests
Behavior changes require test updates and documentation updates. Keep examples synchronized with response_text. See [testing](testing.md) and [contributing](../CONTRIBUTING.md).
