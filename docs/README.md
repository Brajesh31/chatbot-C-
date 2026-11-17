# 📚 Documentation Index

| Task | Guide |
|---|---|
| Understand behavior | [Architecture](architecture.md), [API](api.md), [feature scope](feature-scope.md) |
| Install and build | [Installation](installation.md), [development](development.md), [compatibility](compatibility.md) |
| Test changes | [Testing](testing.md) |
| Distribute builds | [Deployment](deployment.md), [operations](operations.md) |
| Review security | [Security notes](security.md), [root policy](../SECURITY.md) |
| Console usability | [Accessibility](accessibility.md) |
| Understand files | [Project structure](project-structure.md) |
| Terms | [Glossary](glossary.md) |
| Performance | [Performance](performance.md) |
| Prepare reviews | [Templates](templates/README.md), [decisions](decisions/README.md) |

## Project boundary
This is a local deterministic phrase matcher. It has no model, network client, database, or persistence. Never describe roadmap items as implemented.

## Maintenance
Keep examples consistent with source and Makefile, update API/architecture docs when behavior changes, preserve the distinction between source builds and the historical Windows executable, and never put credentials or personal data in documentation.
