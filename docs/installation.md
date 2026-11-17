# 🛠️ Installation and First Run

## 1. Requirements

| Tool | Needed to run the app? | Needed for repository development? |
|---|---|---|
| C11 compiler (GCC, Clang, MinGW-w64 or compatible) | Yes, to build from source | Yes |
| Git | No, if source is already available | Yes, to clone and contribute |
| GNU Make | No, direct compiler commands work | Recommended |
| Python 3 | No | Yes, for docs and repository validators |
| POSIX shell and awk | No | Needed for the full shell integration test on Linux |

No third-party C runtime library, model SDK, database package, cloud credential or network connection is required.

## 2. Clone the repository

~~~sh
git clone https://github.com/Brajesh31/chatbot-C-.git
cd chatbot-C-
~~~

## 3. Check prerequisites

~~~sh
sh scripts/setup.sh
~~~

This script checks available tools. It does not install software or change global system configuration.

For Windows PowerShell:

~~~powershell
.\scripts\setup.ps1
~~~

## 4. Build with Make

~~~sh
make
~~~

The generated executable is build/chatbot. The build directory is ignored by Git.

## 5. Run

~~~sh
./build/chatbot
~~~

Type supported phrases, then enter exact bye to leave. Sending EOF also closes the program.

## 6. Build without Make

Linux/macOS:

~~~sh
cc -std=c11 -Wall -Wextra -Wpedantic -Werror chatbot/chatbot.c -o chatbot-build
./chatbot-build
~~~

Windows with MinGW-w64:

~~~powershell
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror chatbot/chatbot.c -o chatbot-build.exe
.\chatbot-build.exe
~~~

## 7. Verify installation

~~~sh
make check
~~~

This builds and tests the application, checks local documentation links and SVGs, validates Markdown fences, compares the tracked project tree with its documentation, and runs a repository secret-pattern scan.

## 8. Platform limitations

The source targets C11, but not every compiler/OS combination is tested. Linux CI runs unit and POSIX interactive tests. Windows CI builds the source and runs C unit tests with MinGW. The tracked chatbot/chatbot.exe is a historical Windows binary and is not the recommended installation path.

## Troubleshooting

See troubleshooting.md, compatibility.md, and environment-setup.md.
