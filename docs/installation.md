# 🛠️ Installation

Requirements: Git, a C11 compiler (GCC, Clang, MinGW-w64), and GNU Make for Makefile targets (optional). No third-party runtime libraries are required.

Clone and build:
```sh
git clone https://github.com/Brajesh31/chatbot-C-.git
cd chatbot-C-
make
./build/chatbot
```

Direct Linux/macOS build:
```sh
cc -std=c11 -Wall -Wextra -Wpedantic -O2 chatbot/chatbot.c -o chatbot-build
./chatbot-build
```

Windows MinGW-w64:
```powershell
gcc -std=c11 -Wall -Wextra -Wpedantic -O2 chatbot/chatbot.c -o chatbot-build.exe
.\chatbot-build.exe
```

The prebuilt `chatbot/chatbot.exe` is Windows-specific. Build from source for the target system.
