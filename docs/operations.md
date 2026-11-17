# ⚙️ Maintainer Operations

Run `make test` before merging. Record compiler and version for release builds. Build release binaries from a tag and record OS, architecture, compiler, and commit. Linux CI does not rebuild the historical Windows executable.

Keep `build/`, object files, debug symbols, and temporary executables out of Git. For a suspicious binary or unsafe source change, stop distributing the build, inspect the last known-good commit, rebuild from reviewed source, and report security concerns privately.
