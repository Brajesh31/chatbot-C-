# 🔎 Repository Audit and Completion Evidence

This guide defines how to audit the repository against the master enhancement checklist without equating file count with quality. The actual application is a small C command-line program, so the checklist must be adapted to that architecture.

## Audit objectives

- Inspect the complete tracked tree before changing files.
- Check root governance and project files.
- Compare required documentation paths against tracked files.
- Inspect content quality and accuracy, not only filename presence.
- Validate diagrams, SVG metadata, internal links, scripts and CI.
- Preserve source, historical assets and useful project files.
- Record non-applicable items instead of inventing subsystems.

## Repeatable local audit

~~~sh
git status --short --branch
git branch --show-current
git ls-files

# Inspect counts by repository area
git ls-files | awk '
  /^docs\// { docs++ }
  /^docs\/templates\// { templates++ }
  /^docs\/assets\/.*\.svg$/ { svg++ }
  /^scripts\// { scripts++ }
  /^tests\// { tests++ }
  /^\.github\/workflows\// { workflows++ }
  END {
    printf "docs=%d templates=%d svg=%d scripts=%d tests=%d workflows=%d\n",
      docs, templates, svg, scripts, tests, workflows
  }'

make check
git diff --check
git status --short
git diff --stat
~~~

The tracked-tree generator is `scripts/check_project_structure.py --write`. CI runs the check without `--write`, so a stale inventory fails instead of being silently rewritten.

## Audit dimensions

| Area | Evidence | Pass condition |
|---|---|---|
| Application behavior | `chatbot/chatbot.c`, `tests/` | Behavior and boundary conditions are tested |
| Build | `Makefile`, workflows | Build commands work with documented toolchain |
| Documentation | `docs/`, root Markdown | Paths exist, claims match code, cross-links resolve |
| Visuals | `docs/assets/` | SVGs parse, have title/description and are referenced |
| Templates | `docs/templates/` | Templates contain usable fields and review guidance |
| GitHub configuration | `.github/` | Forms/workflows map to actual commands and risks |
| Security | `SECURITY.md`, scanners, static analysis | Reporting path and automated checks are described accurately |
| Compatibility | CI matrix and compiler docs | Verified targets separated from untested targets |
| Governance | Root policy and ownership files | Contribution, support, conduct and ownership are clear |

## Decisions that prevent checklist inflation

- No API endpoints are invented for the local terminal program.
- No database schema or ER model is invented because no database exists.
- No login, roles or authorization layer is added without accounts.
- No Docker image or cloud topology is published without a deployment target.
- No front-end screenshots are fabricated for a command-line application.
- No funding destinations, coverage percentages, security certifications or performance benchmarks are fabricated.
- Separate build/test/quality workflows are not added when they duplicate consolidated jobs.

## Review record

Record each audit in the pull request or commit description:

| Field | Value to record |
|---|---|
| Audited commit | Full Git SHA |
| Reviewer | Person who performed the review |
| Checklist revision | Link or commit of the checklist used |
| Files added/updated | Exact tracked paths |
| Files intentionally omitted | Path or feature and reason |
| Validation | Commands and workflow run links |
| Remaining gaps | Specific follow-up actions |

The authoritative inventory is [project structure](project-structure.md). The item-by-item applicability mapping is [repository-file applicability](repository-file-applicability.md). A large tree is not proof of quality; build, tests, accurate documentation and review evidence matter.
