# 🔐 Security Best Practices

1. Treat terminal input as untrusted.
2. Preserve bounded input reads and explicit EOF handling.
3. Avoid unbounded copies and unchecked string operations.
4. Pass unsigned-char values to C character-classification functions.
5. Keep secrets out of source, commits, test transcripts, and issue reports.
6. Build from reviewed source rather than blindly trusting a prebuilt binary.
7. Keep compiler warnings enabled and resolve new warnings.
8. Review dependency and GitHub Actions changes before merging.
9. Update threat-model and security documentation after changing input, storage, or network behavior.
10. Report vulnerabilities privately using the process in the root SECURITY.md.

Following this checklist is useful hygiene. It does not establish a formal audit, guarantee memory safety, or imply compliance with a security framework.
