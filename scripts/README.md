# 🧰 Repository Validation Scripts

## validate_docs.py
Checks local Markdown links and image paths and parses SVG files in docs/assets using Python's standard library. It exits non-zero when a local reference is missing or an SVG is malformed.

~~~sh
python3 scripts/validate_docs.py
~~~

The script intentionally does not fetch external URLs. Network link checking is non-deterministic and should not make local contribution checks depend on remote uptime.

Keep the validator dependency-free. When adding a rule, include a test or fixture showing both success and failure.
