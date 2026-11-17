# 🖥️ UI and UX Guidelines

## Actual product interface

The only product interface is a line-oriented terminal conversation. There is no web page, mobile screen, desktop window, navigation bar, graphical component tree, responsive breakpoint, or animated UI.

## Terminal interaction principles

1. Print an opening message that explains the supported exit command.
2. Print a clear prompt before waiting for user input.
3. Flush stdout after the prompt so it is visible in interactive use.
4. Use short and understandable responses.
5. Keep warning messages distinct from normal chatbot replies.
6. Do not rely on color, icons, cursor positioning, or animation to communicate meaning.
7. Preserve predictable one-line input behavior.
8. Explain EOF and the maximum input length.
9. Keep sample transcripts synchronized with the source.

## Master checklist design-document applicability

| Requested UI/UX document | Current treatment |
|---|---|
| Design system | Not applicable: there are no reusable graphical product components. |
| Design tokens | Not applicable: the terminal app has no configurable product theme or token set. SVG colors belong to documentation assets only. |
| Component library | Not applicable: there are no graphical controls, component framework or frontend package. |
| Responsive design | Not applicable: the product has no viewport or responsive layout. |
| Navigation structure | Not applicable: the app has no pages, routes, menus or navigation hierarchy. |
| Page documentation | Not applicable: there are no application pages. |
| Typography | The executable emits ordinary terminal text; font selection belongs to the terminal environment. |
| Color system | The application does not emit color. SVG assets use local styling and are documented separately. |
| Animation guidelines | No app animation or terminal cursor animation is implemented. |
| Branding guidelines | Applicable to repository assets and documented in branding-guidelines.md. |

## Current interaction limitations

There is no command parser, built-in history, line editor, menu system, language selector, speech interface, theme switcher, or user preference store. Terminal editing is provided by the user's terminal environment.

## Frontend documentation boundary

The missing graphical UI documents are intentionally not created as empty or generic templates. They should be introduced if a genuine browser, desktop or mobile client is approved. The requirements should then include components, page states, responsive behavior, typography, colors, motion, keyboard behavior, screen-reader support, and validation evidence.

## Related guidance

See [CLI UX guidelines](cli-ux-guidelines.md), [accessibility](accessibility.md), [branding](branding-guidelines.md), and [visual asset policy](assets/README.md).
