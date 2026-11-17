#!/usr/bin/env python3
"""Check Markdown files for unclosed fenced code blocks.

This deliberately small, offline validator uses only the Python standard library.
"""
from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OPENING = re.compile(r"^ {0,3}(`{3,}|~{3,})(.*)$")


def tracked_markdown() -> list[Path]:
    result = subprocess.run(
        ["git", "ls-files", "-z", "--", "*.md"],
        cwd=ROOT,
        check=True,
        stdout=subprocess.PIPE,
    )
    return [ROOT / item.decode("utf-8") for item in result.stdout.split(b"\0") if item]


def check_file(path: Path) -> list[str]:
    errors: list[str] = []
    active_char: str | None = None
    active_length = 0
    opening_line = 0

    try:
        lines = path.read_text(encoding="utf-8").splitlines()
    except (OSError, UnicodeDecodeError) as exc:
        return [f"{path.relative_to(ROOT)}: unable to read UTF-8 Markdown: {exc}"]

    for number, line in enumerate(lines, start=1):
        match = OPENING.match(line)
        if active_char is None:
            if match:
                fence = match.group(1)
                active_char = fence[0]
                active_length = len(fence)
                opening_line = number
        else:
            stripped = line.lstrip(" ")
            if stripped.startswith(active_char):
                run = len(stripped) - len(stripped.lstrip(active_char))
                remainder = stripped[run:].strip()
                if run >= active_length and not remainder:
                    active_char = None
                    active_length = 0
                    opening_line = 0

    if active_char is not None:
        errors.append(
            f"{path.relative_to(ROOT)}:{opening_line}: unclosed {active_char * active_length} code fence"
        )
    return errors


def main() -> int:
    errors: list[str] = []
    files = tracked_markdown()
    for path in files:
        errors.extend(check_file(path))
    if errors:
        print("Markdown validation failed:")
        for error in errors:
            print(f" - {error}")
        return 1
    print(f"Markdown fence validation passed: {len(files)} tracked Markdown files checked.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
