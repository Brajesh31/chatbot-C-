# 🧰 Development Environment Setup

## Required tools

| Tool | Required? | Purpose |
|---|---|---|
| GCC, Clang, or compatible C11 compiler | Yes | Build source |
| GNU Make | Recommended | Standard build/test commands |
| Python 3 | For docs checks | Standard-library validator |
| POSIX shell and awk | For full shell integration suite | Linux test runner |
| Git | Yes for clone/contribution | Source control |

## Verify tools

~~~sh
cc --version
make --version
python3 --version
git --version
~~~

## No service configuration

The chatbot does not require database credentials, external API keys, cloud account access, or a runtime environment file. The root .env.example records that fact. Do not request production secrets to build this project.

## Platform notes

Linux is the primary environment for the full integration suite. Windows CI uses MinGW for source compilation and C unit tests. macOS portability is expected from standard C usage but is not currently verified by a dedicated hosted workflow.

## Reproducing CI

~~~sh
make check
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror -fanalyzer chatbot/chatbot.c -o /tmp/chatbot-analyzed
~~~
