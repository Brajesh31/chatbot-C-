# 🚶 User Journeys

## Journey 1: Run a conversation
~~~mermaid
journey
 title Basic terminal conversation
 section Start
   Build from source: 5: Learner
   Launch executable: 5: Learner
 section Interact
   Read prompt: 5: Learner
   Enter supported phrase: 4: Learner
   Read fixed response: 4: Learner
 section Finish
   Type exact bye or send EOF: 5: Learner
   Process exits: 5: Learner
~~~

## Journey 2: Submit an overlong message
1. The user types more than 255 bytes before pressing Enter.
2. The bounded reader detects that the buffer filled without consuming a newline.
3. The remainder of that logical line is drained.
4. The program prints a length warning.
5. The next prompt starts with a fresh line, not the tail of the discarded message.

## Journey 3: Contribute a change
Read the scope and coding guidelines, build and test the baseline, implement one focused change, add tests, run the full checks, and submit a pull request with evidence and updated documentation.
