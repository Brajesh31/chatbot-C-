#!/usr/bin/env sh
set -eu
echo "Checking Simple C Chatbot development prerequisites..."
if command -v cc >/dev/null 2>&1; then
    cc --version | head -n 1
elif command -v gcc >/dev/null 2>&1; then
    gcc --version | head -n 1
elif command -v clang >/dev/null 2>&1; then
    clang --version | head -n 1
else
    echo "A C11 compiler (GCC or Clang) is required." >&2
    exit 1
fi
if command -v make >/dev/null 2>&1; then
    make --version | head -n 1
else
    echo "GNU Make is recommended. Direct compiler commands remain available."
fi
if command -v python3 >/dev/null 2>&1; then
    python3 --version
else
    echo "Python 3 is required for documentation validation." >&2
    exit 1
fi
if command -v git >/dev/null 2>&1; then
    git --version
else
    echo "Git is required to clone and contribute to the repository." >&2
    exit 1
fi
echo "Prerequisite check complete. No packages were installed or system settings changed."
