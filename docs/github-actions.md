# 🤖 GitHub Actions Guide

## Workflow maintenance
- Keep default branch triggers aligned with main.
- Declare top-level permissions explicitly.
- Prefer read-only contents access.
- Pin action versions and review update proposals.
- Avoid credentials in workflow files.
- Keep jobs small and report which platform executes each test.

## Local reproduction
~~~sh
make test
python3 scripts/validate_docs.py
~~~

The GCC analyzer step can be run when the local compiler supports -fanalyzer. The Windows workflow uses MinGW and PowerShell-specific commands, so the Linux shell integration job is not an exact reproduction of the Windows job.

## Troubleshooting
Open the failed run, inspect the exact job and step, reproduce the command locally when possible, and fix the underlying issue. A configured workflow is not the same as a passing workflow.
