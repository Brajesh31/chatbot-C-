# 🧰 Repository Validation and Setup Scripts

All scripts are project-specific and use local tools. They do not download dependencies or modify global machine settings.

| Script | Purpose | Failure behavior |
|---|---|---|
| setup.sh | Check compiler, Make, Python, and Git on POSIX systems | Non-zero if required tooling is absent |
| setup.ps1 | Check compiler, optional Make, Python, and Git on Windows | Non-zero if required tooling is absent |
| validate_docs.py | Check relative Markdown paths and SVG XML/accessibility metadata | Non-zero when a local reference or SVG check fails |
| validate-docs.py | Hyphenated alias for the documentation validator | Propagates validator exit code |
| validate-links.py | Focused command alias for the same offline local-link validator | Propagates validator exit code |
| validate_markdown.py | Check tracked Markdown files for unclosed fenced code blocks | Non-zero when a fence is not closed |
| check_project_structure.py | Compare complete tracked Git inventory with docs/project-structure.md | Non-zero when documentation is stale |
| check-project-structure.py | Hyphenated alias for tracked-tree validation | Propagates validator exit code |
| generate-docs.sh | Regenerate the file-tree section in docs/project-structure.md | Non-zero if Git inventory or document markers are unavailable |
| security_check.py | Scan tracked text files for selected high-confidence credential patterns and merge conflict markers | Non-zero when a possible issue is found |
| security-check.sh | POSIX wrapper for the secret-pattern scan | Propagates scanner exit code |
| release-check.sh | Run the quality gate and create a fresh local build | Stops on the first failing command |

## Common commands

~~~sh
sh scripts/setup.sh
make check
python3 scripts/validate_docs.py
python3 scripts/validate-docs.py
python3 scripts/validate-links.py
python3 scripts/validate_markdown.py
python3 scripts/check_project_structure.py
python3 scripts/check-project-structure.py
sh scripts/security-check.sh
sh scripts/release-check.sh
sh scripts/generate-docs.sh
~~~

Windows prerequisite check:

~~~powershell
.\scripts\setup.ps1
~~~

## Important limitations

The secret-pattern scan is a small heuristic over tracked text files. It does not scan unreachable Git objects, prove the absence of secrets, or replace dedicated secret-scanning tools. The Markdown validator checks fenced-code balance, not every Markdown style rule. The documentation-link validator does not test external URL availability.
