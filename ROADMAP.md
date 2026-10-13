# Roadmap

This is a directional list for the current C example. It has no delivery dates and does not promise that any item will be implemented.

## Possible improvements

- Check `fgets`' return value and exit cleanly on EOF.
- Handle long lines explicitly: discard the remainder or grow the input buffer safely.
- Normalize input case and match whole words or clearly documented phrases.
- Exit only when the complete command is `bye`, rather than when that substring appears anywhere.
- Separate response selection from printing so it can be tested.
- Add a small test harness for greeting, fallback, case, length, and EOF behavior.
- Add a build script or Makefile if more source files or platform-specific steps are introduced.

## Propose work

Open an issue describing the problem, expected behavior, platform impact, and validation plan. Follow [CONTRIBUTING.md](CONTRIBUTING.md). Priorities may change as the project evolves.
