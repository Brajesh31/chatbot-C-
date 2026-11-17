# 🔐 Security Policy

## 1. Supported code

No tagged release support matrix is currently published. Security reports should identify the affected commit or tag. The default branch is the primary maintained source. The project has not undergone an independent security audit.

## 2. Private vulnerability reporting

Do not publish exploit details, credentials, access tokens, private user data, or weaponized proof-of-concept code in a public issue.

Use GitHub's private vulnerability reporting for this repository:
https://github.com/Brajesh31/chatbot-C-/security/advisories/new

If private reporting is unavailable, contact @Brajesh31 privately using the contact method provided on the GitHub profile. Include:
- Affected commit, file, or workflow.
- Impact and realistic threat scenario.
- Reproduction steps using non-sensitive data.
- Any suggested mitigation.
- A safe way to ask follow-up questions.

No fixed response-time or coordinated-disclosure deadline is promised. A maintainer will review and coordinate a response as practical.

## 3. In-scope security concerns

Examples include unsafe input handling, memory or buffer errors, denial of service caused by input processing, source or release artifact tampering, accidental credential exposure, unsafe GitHub Actions permissions, and security defects in repository automation.

Ordinary behavior defects should use the public bug-report form. General questions belong in SUPPORT.md.

## 4. Current security design

- The program is a local process and has no network listener or remote API.
- User input is read through a fixed 256-byte array, allowing at most 255 bytes per line.
- The input reader checks the result of the read before classification.
- Overlong logical lines are drained and rejected rather than split into multiple turns.
- Character conversion uses an unsigned-char value before tolower.
- Exit matching compares the complete normalized input to bye.
- The application does not persist chat history or read runtime secrets.
- CI includes strict compiler diagnostics, C unit tests, POSIX interactive checks, GCC static analysis, and CodeQL.

These controls reduce specific risks but do not prove that the program is secure.

## 5. Known limitations

- Byte-oriented lowercase conversion is not Unicode case folding.
- Output-stream errors are not comprehensively handled.
- The tracked chatbot/chatbot.exe is a historical artifact and is not provenance-attested by source CI.
- Windows CI runs C unit tests and the PowerShell process-level interactive suite. The POSIX shell integration script is Linux-specific.
- Static analysis is not a formal audit or a memory-safety proof.

## 6. Contributor security expectations

- Preserve input bounds and check library return values.
- Avoid unsafe string handling and shell execution of user input.
- Keep credentials and private data out of source, commits, issues, and test captures.
- Review new dependencies, licenses, workflow permissions, and action updates.
- Add tests for security-relevant boundary changes.
- Update threat-model, privacy, and security documentation when trust boundaries change.

## 7. Vulnerability handling

The maintainer should triage the report, attempt safe reproduction, assess impact, prepare a regression test, review the fix, run build and security checks, and coordinate any disclosure. Credential exposure requires revocation or rotation at the issuing service; deleting a file or rewriting Git history does not revoke a credential.

See docs/vulnerability-management.md, docs/incident-response.md, docs/security-architecture.md, and docs/threat-assessment.md.
