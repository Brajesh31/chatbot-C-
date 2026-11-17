#include <assert.h>
#include <stdio.h>
#include <string.h>

#define main chatbot_program_main
#include "../chatbot/chatbot.c"
#undef main

static void test_greeting(void) {
    char input[] = "hello";
    normalize_input(input);
    assert(classify_input(input) == RESPONSE_GREETING);
}

static void test_case_normalization(void) {
    char input[] = "HELLO THERE";
    normalize_input(input);
    assert(classify_input(input) == RESPONSE_GREETING);
}

static void test_status_phrase(void) {
    char input[] = "how are you today?";
    normalize_input(input);
    assert(classify_input(input) == RESPONSE_STATUS);
}

static void test_exit_is_exact_command(void) {
    char command[] = "bye";
    char embedded[] = "goodbye";
    normalize_input(command);
    normalize_input(embedded);
    assert(classify_input(command) == RESPONSE_GOODBYE);
    assert(classify_input(embedded) == RESPONSE_FALLBACK);
}

static void test_unknown_and_empty(void) {
    char unknown[] = "tell me a story";
    char empty[] = "";
    normalize_input(unknown);
    normalize_input(empty);
    assert(classify_input(unknown) == RESPONSE_FALLBACK);
    assert(classify_input(empty) == RESPONSE_FALLBACK);
}

int main(void) {
    test_greeting();
    test_case_normalization();
    test_status_phrase();
    test_exit_is_exact_command();
    test_unknown_and_empty();
    puts("All chatbot unit tests passed.");
    return 0;
}
