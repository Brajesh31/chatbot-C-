# ✅ Consent Management Applicability

## Current application

The executable does not collect analytics, send user input to a third party, store account data, use cookies, or create a persistent conversation profile. It therefore has no in-app consent banner, preference center, or consent record.

The user chooses to type into the local terminal. That interaction should not be described as consent to data collection or external processing.

## External systems

GitHub, terminal emulators, screen recorders, and operating-system tools may have their own data controls and notices. They are not managed by the chatbot.

## Future telemetry or remote processing

Before adding analytics, storage, or model/API calls, document data categories, purpose, recipients, retention, user notice, opt-in/opt-out behavior where required, proof of consent if needed, and how preferences are withdrawn. Tests should verify that collection does not occur before the required user choice.
