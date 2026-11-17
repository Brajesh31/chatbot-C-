#!/usr/bin/env python3
"""Validate local Markdown references and repository SVG assets.

External URL reachability is intentionally not tested, so this script works offline.
"""
from __future__ import annotations

import re
import xml.etree.ElementTree as ET
from pathlib import Path
from urllib.parse import unquote, urlparse

ROOT = Path(__file__).resolve().parents[1]
MARKDOWN_LINK = re.compile(r"!?(?:\[[^\]]*\])\(([^)]+)\)")
HTML_SOURCE = re.compile(r"""(?:src|href)\s*=\s*["']([^"']+)["']""", re.IGNORECASE)


def local_target(source: Path, value: str) -> Path | None:
    value = value.strip().strip("<>")
    parsed = urlparse(value)
    if parsed.scheme or parsed.netloc or value.startswith("//") or value.startswith("#"):
        return None
    path_part = unquote(parsed.path)
    if not path_part:
        return None
    target = (source.parent / path_part).resolve()
    try:
        target.relative_to(ROOT)
    except ValueError:
        return Path("__OUTSIDE_REPOSITORY__")
    return target


def main() -> int:
    errors: list[str] = []
    markdown_files = sorted(ROOT.rglob("*.md"))
    markdown_files = [p for p in markdown_files if ".git" not in p.parts and "build" not in p.parts]

    for doc in markdown_files:
        content = doc.read_text(encoding="utf-8")
        references = [m.group(1) for m in MARKDOWN_LINK.finditer(content)]
        references.extend(m.group(1) for m in HTML_SOURCE.finditer(content))
        for raw in references:
            target = local_target(doc, raw)
            if target is None:
                continue
            if str(target) == "__OUTSIDE_REPOSITORY__":
                errors.append(f"{doc.relative_to(ROOT)}: reference escapes repository: {raw}")
            elif not target.exists():
                errors.append(f"{doc.relative_to(ROOT)}: missing local reference: {raw}")

    for svg in sorted((ROOT / "docs" / "assets").glob("*.svg")):
        try:
            root = ET.parse(svg).getroot()
            tags = {element.tag.split("}")[-1] for element in root.iter()}
            if "svg" not in tags or "title" not in tags or "desc" not in tags:
                errors.append(f"{svg.relative_to(ROOT)}: SVG must include svg, title and desc elements")
        except ET.ParseError as exc:
            errors.append(f"{svg.relative_to(ROOT)}: invalid XML: {exc}")

    if errors:
        print("Documentation validation failed:")
        for error in errors:
            print(f" - {error}")
        return 1
    print(f"Documentation validation passed: {len(markdown_files)} Markdown files and SVG assets checked.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
