# 🧰 Repository Validation and Setup Scripts

All scripts are project-specific and use local tools. They do not download dependencies or modify global machine settings.

| Script | Purpose | Failure behavior |
|---|---|---|
| setup.sh | Check compiler, Make, Python, and Git on POSIX systems | Non-zero if required tooling is absent |
| setup.ps1 | Check compiler, optional Make, Python, and Git on Windows | Non-zero if required tooling is absent |
| validate_docs.py | Check relative Markdown paths and SVG XML/accessibility metadata | Non-zero when a local reference or SVG check fails |
| validate_markdown.py | Check tracked Markdown files for unclosed fenced code blocks | Non-zero when a fence is not closed |
| check_project_structure.py | Compare complete tracked Git file inventory to docs/project-structure.md | Non-zero when documentation is stale |
| security_check.py | Scan tracked text files for selected high-confidence credential patterns and merge conflict markers | Non-zero when a possible issue is found |
| security-check.sh | POSIX wrapper for the security scan | Propagates scanner exit code |
| release-check.sh | Run the quality gate and produce a fresh local build | Stops on the first failing command |

## Common commands

~~~sh
sh scripts/setup.sh
make check
python3 scripts/validate_docs.py
python3 scripts/validate_markdown.py
python3 scripts/check_project_structure.py
sh scripts/security-check.sh
sh scripts/release-check.sh
~~~

Windows prerequisite check:

~~~powershell
.\scripts\setup.ps1
~~~

## Important limitations

The secret-pattern scan is a small heuristic over tracked text files. It does not scan all unreachable Git objects, prove the absence of secrets, or replace dedicated secret-scanning tools. The Markdown validator checks fenced-code balance, not every Markdown style rule. The documentation-link validator does not test external URL availability.
