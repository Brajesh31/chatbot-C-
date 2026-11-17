# 🧰 Maintenance and Repository Care

## 1. Maintenance objective

Keep the source behavior, tests, README, architecture diagrams, workflow definitions and governance material aligned. The project is a local C executable, so maintenance is focused on source, compiler compatibility, repository integrity and reproducible checks. No database backup, service uptime or customer-data retention job is part of the current system.

## 2. Maintenance schedule

| Trigger / cadence | Activity | Evidence to retain |
|---|---|---|
| Every source change | Compile with strict flags and run affected tests | Local output and CI run |
| Every input-reader change | Re-run 254/255/256-byte and EOF process cases on both supported CI paths | Linux and Windows test results |
| Every documentation change | Check links, SVG assets, Markdown fences and tracked tree | make check |
| When workflow files change | Review permissions, action versions, concurrency and triggers | Workflow diff and completed run |
| When dependencies are introduced | Record necessity, license, version policy and vulnerability checks | Dependency review and docs |
| Before a tagged release | Verify commit, changelog, test runs, artifact target and limitations | Release checklist and run URL |
| After a security report | Triage privately, reproduce safely, assess impact and add regression coverage | Sanitized report and remediation commit |
| When product scope changes | Update architecture, risk, privacy, applicability and roadmap docs | ADR and linked PR |

The table defines event-driven maintenance expectations. It does not promise a response SLA or imply that a review happened merely because a checklist exists.

## 3. Routine local commands

~~~sh
# Check prerequisites
sh scripts/setup.sh

# Complete local quality gate
make check

# Rebuild from a clean generated directory
make clean
make
make test
~~~

On Windows, use the setup.ps1 script, the MinGW compile commands in [building](building.md), and the PowerShell interactive suite.

## 4. Source maintenance

- Preserve the 255-byte accepted-input contract unless a feature change approves a new limit.
- Keep the extra-byte probe so exact-fit input is not misclassified as overlong.
- Keep the overlong-line drain so a message tail is not treated as a new turn.
- Retain unsigned-char conversion before tolower.
- Update tests when rule order, response text or exit behavior changes.
- Avoid introducing dependencies for functionality available in the C standard library.

## 5. Documentation maintenance

When adding or removing files:
1. Regenerate the tracked inventory in README and docs/project-structure.md.
2. Update docs/README.md and relevant cross-links.
3. Add or remove template references in docs/templates/README.md.
4. Update the changelog and applicability register when repository scope changes.
5. Run link, SVG, Markdown-fence and tree validation.
6. Review Mermaid diagrams against current source and workflow files.

The custom Markdown validator checks code-fence balance, not every Markdown style rule. The local link validator does not verify remote URL availability.

## 6. Security and dependency maintenance

Review CodeQL findings, GCC analyzer output, Gitleaks alerts, workflow permissions and third-party action updates. Treat static analysis as a signal that requires triage, not as proof that the application has no vulnerabilities. If a credential is exposed, revoke or rotate it at the issuing service before considering repository history cleanup.

No third-party runtime package is currently required. If one is introduced, record the reason, exact versioning approach, licensing implications, update ownership and security review. Do not add an empty lockfile.

## 7. Release maintenance

Follow [release process](release-process.md). The current workflow builds a Linux artifact from an existing tag and uploads a workflow artifact. It does not publish a GitHub Release, sign the output, generate a checksum, attest provenance or deploy a service. Document any future release automation only after it exists and is tested.

## 8. Ownership and escalation

The repository's current maintainer and ownership files are MAINTAINERS.md, AUTHORS.md and CODEOWNERS. Use root SUPPORT.md for general help and root SECURITY.md for private vulnerability disclosure. Do not publish sensitive exploit details or secrets in ordinary issues.

## 9. Maintenance completion criteria

A maintenance task is complete when the relevant source, tests, docs and workflow checks agree; generated inventories are current; any known limitation is recorded; and the final commit/run can be identified. An unchecked template or a green branch badge is not, by itself, evidence of completion.
