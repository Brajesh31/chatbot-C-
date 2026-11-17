# ❓ FAQ

## Is this AI?
No. It is a deterministic phrase-matching example in C.

## Does it need internet or an API key?
No. It uses local standard input/output and the C standard library.

## Does it remember messages?
No. History is not stored.

## Is matching case-sensitive?
No. Input is normalized to lowercase.

## How do I exit?
Enter exactly `bye`, case-insensitively. `goodbye` does not exit.

## What is the input limit?
255 bytes. Longer lines are discarded and a warning appears.

## Does it handle EOF?
Yes. It exits cleanly.

## How do I test?
Run `make test` with a C compiler and GNU Make installed.
