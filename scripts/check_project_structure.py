#!/usr/bin/env python3
"""Check that docs/project-structure.md matches the tracked Git file tree."""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DOC = ROOT / "docs" / "project-structure.md"
START = "## Complete tracked tree\n\n~~~text\n"
END = "\n~~~"


def tracked_paths() -> list[str]:
    result = subprocess.run(
        ["git", "ls-files", "-z"],
        cwd=ROOT,
        check=True,
        stdout=subprocess.PIPE,
    )
    return sorted(item.decode("utf-8") for item in result.stdout.split(b"\0") if item)


def render_tree(paths: list[str]) -> str:
    directories: set[str] = set()
    for path in paths:
        parts = path.split("/")
        for index in range(1, len(parts)):
            directories.add("/".join(parts[:index]))

    entries: list[tuple[str, bool]] = [(p, True) for p in directories]
    entries.extend((p, False) for p in paths)

    def sort_key(item: tuple[str, bool]):
        path, is_dir = item
        return (path.split("/"), 0 if is_dir else 1)

    lines = ["chatbot-C-/"]
    for path, is_dir in sorted(entries, key=sort_key):
        parts = path.split("/")
        name = parts[-1] + ("/" if is_dir else "")
        lines.append("  " * (len(parts) - 1) + name)
    return "\n".join(lines)


def replace_tree(content: str, rendered: str) -> str:
    start = content.find(START)
    if start < 0:
        raise ValueError("Missing tracked-tree section marker")
    body_start = start + len(START)
    end = content.find(END, body_start)
    if end < 0:
        raise ValueError("Missing closing tree fence")
    return content[:body_start] + rendered + content[end:]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--write", action="store_true", help="Regenerate the tracked tree in the documentation")
    args = parser.parse_args()

    try:
        rendered = render_tree(tracked_paths())
        content = DOC.read_text(encoding="utf-8")
        updated = replace_tree(content, rendered)
    except (OSError, subprocess.CalledProcessError, ValueError) as exc:
        print(f"Project structure validation failed: {exc}")
        return 1

    if args.write:
        DOC.write_text(updated, encoding="utf-8")
        print("Project tree regenerated. Commit the updated documentation.")
        return 0

    if updated != content:
        print("Project structure documentation is stale. Run:")
        print("  python3 scripts/check_project_structure.py --write")
        return 1

    print(f"Project structure validation passed: {len(tracked_paths())} tracked files matched.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
