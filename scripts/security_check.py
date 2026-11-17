#!/usr/bin/env python3
"""Scan tracked text files for a small set of high-confidence secret patterns.

This is a heuristic repository hygiene check, not a replacement for a dedicated
secret-scanning product or a review of Git history.
"""
from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PATTERNS = [
    ("GitHub token", re.compile(rb"\b(?:gh[pousr]_[A-Za-z0-9_]{30,}|github_pat_[A-Za-z0-9_]{30,})\b")),
    ("OpenAI-style API key", re.compile(rb"\bsk-[A-Za-z0-9]{20,}\b")),
    ("AWS access key ID", re.compile(rb"\bAKIA[0-9A-Z]{16}\b")),
    ("Google API key", re.compile(rb"\bAIza[0-9A-Za-z_-]{35}\b")),
    ("Private key header", re.compile(rb"-----BEGIN (?:RSA |EC |OPENSSH |DSA )?PRIVATE KEY-----")),
    ("Credential-bearing URL", re.compile(rb"https?://[^/\s:@]+:[^/\s@]+@")),
]
CONFLICT = re.compile(rb"^(?:<<<<<<< |>>>>>>> )", re.MULTILINE)


def main() -> int:
    result = subprocess.run(
        ["git", "ls-files", "-z"],
        cwd=ROOT,
        check=True,
        stdout=subprocess.PIPE,
    )
    findings: list[str] = []
    scanned = 0

    for raw_path in result.stdout.split(b"\0"):
        if not raw_path:
            continue
        path = ROOT / raw_path.decode("utf-8")
        try:
            content = path.read_bytes()
        except OSError as exc:
            findings.append(f"{path.relative_to(ROOT)}: cannot read file: {exc}")
            continue
        if b"\0" in content:
            continue
        scanned += 1
        for label, pattern in PATTERNS:
            if pattern.search(content):
                findings.append(f"{path.relative_to(ROOT)}: possible {label}")
        if CONFLICT.search(content):
            findings.append(f"{path.relative_to(ROOT)}: unresolved merge conflict marker")

    if findings:
        print("Repository secret/conflict check found possible issues:")
        for finding in findings:
            print(f" - {finding}")
        return 1

    print(f"Repository hygiene scan passed: {scanned} tracked text files checked.")
    print("Note: this heuristic does not scan unreachable Git objects or replace dedicated secret scanning.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
