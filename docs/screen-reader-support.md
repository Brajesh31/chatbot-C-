# 🔊 Screen Reader and Assistive Terminal Notes

The program emits prompts and responses as ordinary text to stdout. It does not draw a screen, use color-coded status, or update terminal regions in place. These choices reduce unnecessary complexity for assistive terminal environments.

The program has not been formally tested against a defined matrix of screen readers and terminal emulators. Support should therefore be described as text-based compatibility, not certified screen-reader conformance.

When changing output, keep labels explicit, avoid relying on spacing or color alone, avoid terminal escape sequences unless documented, keep messages in logical reading order, and update the transcript and manual test plan.
