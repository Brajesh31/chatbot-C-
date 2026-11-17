#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"
echo "Running release readiness checks..."
make check
make clean
make all
echo "Release candidate build created at build/chatbot"
echo "This script does not create tags, publish a GitHub Release, or sign artifacts."
