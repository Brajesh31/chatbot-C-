# ✅ Quality Assurance

Quality assurance confirms that implemented behavior remains predictable and documented.

## Required checks
- Strict C11 compilation with warnings treated as errors.
- C unit tests for each classifier outcome and exact exit behavior.
- Interactive checks for EOF and long input.
- Linux and Windows source compilation through CI.
- Local Markdown-link and SVG validation.
- Review README examples against current response strings.
- Security and accessibility review when input or output changes.

## Acceptance
A change is ready when its acceptance criteria are met, checks pass, no relevant regression is known, and documentation no longer describes stale behavior. Test evidence must state what was actually run. Do not infer coverage percentages without a coverage tool run.
