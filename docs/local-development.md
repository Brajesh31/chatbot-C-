# 🧑‍💻 Local Development

## Recommended setup

Use a local clone and a C11 compiler. GNU Make provides repeatable project targets. No package installation, database, API key, or environment file is needed to run the chatbot.

## Working loop

1. Pull the latest main branch.
2. Inspect the source and tests related to your change.
3. Make one small change.
4. Build with strict warnings.
5. Run unit and interactive tests.
6. Run documentation checks.
7. Review the final diff and update related docs.

## Commands

~~~sh
make
make test
make docs-check
make check
make clean
~~~

## Editing tools

Any editor capable of saving plain-text C and Markdown files can be used. The repository includes existing editor settings under chatbot/.vscode. Those settings are convenience configuration, not a runtime dependency.

## Environment cleanliness

Keep generated executables under build/ or another ignored local path. Do not commit temporary compiler outputs, editor swap files, test logs containing private data, or credentials.
