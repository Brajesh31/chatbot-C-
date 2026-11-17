#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"
python3 scripts/check_project_structure.py --write
echo "Generated the tracked file inventory in docs/project-structure.md."
echo "Review and commit the documentation change."
