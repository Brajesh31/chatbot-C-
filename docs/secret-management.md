# 🗝️ Secret Management

## Current state

The application does not read environment variables or require API keys, database passwords, signing keys, OAuth credentials, certificates, or cloud tokens. The root .env.example explains that no environment variables are currently consumed.

## Repository hygiene

- Never commit real credentials, private keys, tokens, passwords, or personal access tokens.
- Keep local environment files ignored by Git.
- Use GitHub repository or environment secrets only when a real workflow needs a credential.
- Grant workflows the smallest practical permissions.
- Rotate and revoke any credential accidentally exposed in a commit.
- Do not paste secrets into issues, pull requests, test transcripts, or screenshots.

## If a secret is exposed

Revoke it at the issuing service immediately. Remove or rotate dependent credentials, assess access logs where available, and follow the provider's incident procedure. Rewriting Git history does not revoke a credential.

## Future integration requirements

Any feature that adds remote services must define secret owner, storage location, access scope, rotation, revocation, incident handling, and local-development approach. Secret names in examples must be placeholders only.
