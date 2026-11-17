# ♿ WCAG Applicability and Conformance Statement

## Current status

This repository's product is a command-line executable, not a website or web application. It does not claim WCAG 2.2 AA conformance. WCAG is a web-content accessibility standard and cannot be claimed as passed merely because terminal output is text-based.

The repository's Markdown pages are rendered by GitHub, whose web interface and accessibility implementation are not controlled by this source repository.

## Current accessibility practices

- Use readable text prompts and response sentences.
- Do not rely on color alone to communicate warnings.
- Avoid animation and terminal cursor manipulation.
- Keep output in a predictable reading order.
- Provide alt text and title/description metadata for SVG documentation assets.
- Document the current platform and assistive-technology testing limitations.

## Assessment boundary

A meaningful accessibility claim requires a defined product surface, user tasks, applicable success criteria, tested environments, evidence, and remediation records. For terminal use, document terminal emulator, screen reader, operating system, input method, and observed behavior.

## Future web interface

If a browser interface is added, establish WCAG 2.2 AA as an appropriate target, perform manual keyboard and screen-reader testing, measure contrast, and document exceptions. Do not retroactively apply a WCAG badge to this CLI project.
