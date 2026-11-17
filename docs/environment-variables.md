# 🌱 Environment Variables

## Current behavior
The chatbot does not read environment variables. There are no required API keys, tokens, service URLs, database connection strings, or feature flags.

| Variable | Used by application? | Meaning |
|---|---:|---|
| OPENAI_API_KEY | No | Not used |
| GEMINI_API_KEY | No | Not used |
| DATABASE_URL | No | Not used |

These examples prevent the assumption that the project integrates with external services. Do not add real credentials to the repository.

The root .env.example is retained as an existing repository file, but it is not loaded by the C application. If future code introduces configuration, update this guide and the example file together and validate missing or invalid values.
