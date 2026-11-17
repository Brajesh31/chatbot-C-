# ♿ Console Accessibility

The interface uses plain-text prompts and responses, with no color-only state, animation, or mouse-only interaction.

Checklist:
- [ ] Prompts distinguish user input from chatbot output.
- [ ] Errors describe the next action.
- [ ] Meaning does not rely on color or emoji.
- [ ] Keyboard-only interaction works.
- [ ] stdin/stdout redirection behaves predictably.
- [ ] Long input receives a clear warning.
- [ ] EOF closes the program cleanly.

Terminal screen-reader behavior depends on terminal and assistive technology. Test before making compatibility claims.
