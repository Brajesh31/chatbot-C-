# 🧠 Design Patterns and Coding Choices

The code uses a few simple structural ideas, not a framework-heavy pattern catalogue.

| Choice | Where used | Why it fits |
|---|---|---|
| Functional decomposition | Static helper functions | Separates input, normalization, classification, and response mapping |
| Enum-based result | ResponseKind | Makes finite categories explicit |
| Ordered dispatch | Rule checks | Small rule set is easiest to read directly |
| Fail-fast input boundary | read_input_line result checked immediately | Prevents invalid input entering the rule engine |

There is no object system, dependency injection container, plugin registry, persistence layer, asynchronous event loop, or model adapter. Adding those would be unnecessary for the current feature set.

Before adding an abstraction, ask whether it makes a real current behavior easier to test or maintain. Keep hypothetical architecture out until it is needed.
