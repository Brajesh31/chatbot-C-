# Contributing

Thanks for considering a contribution. This is a small C learning project; keep changes simple, explain behavior clearly, and avoid adding infrastructure that the program does not need.

## Before starting

1. Read the README and the relevant files under `docs/`.
2. Check open issues for an existing report or proposal.
3. Discuss larger changes, such as adding a response parser or external service, in an issue first.
4. Never include credentials, personal data, or unrelated compiled files.

## Build locally

Use GCC, MinGW-w64, Clang, or another compatible C compiler. Example commands are in [docs/development.md](docs/development.md). Build to an ignored output name so the checked-in Windows executable is not overwritten.

## Change guidelines

- Make a focused change and use clear, descriptive names.
- Keep user input bounds explicit and check the return value of input functions.
- Preserve correct behavior for empty input, longer lines, case differences, and end-of-file.
- Avoid unsafe string operations and explain any buffer-size assumptions.
- Add tests or reproducible manual cases for new matching and exit behavior; this repository currently has no automated test harness.
- Update the README and relevant API, architecture, or troubleshooting docs when behavior changes.

## Pull requests

Explain the intended behavior, compiler and platform used, commands run, and any known limitations. Include example input/output for response-rule changes. Do not claim tests passed unless they were actually run. Review the final diff for generated executables, object files, editor state, and unrelated changes.

## License

By contributing, you confirm that you have the right to submit your work under the repository's MIT License and identify any third-party material. Follow the [Code of Conduct](CODE_OF_CONDUCT.md).
