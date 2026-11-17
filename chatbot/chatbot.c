#include <ctype.h>
#include <limits.h>
#include <stdio.h>
#include <string.h>

#define INPUT_CAPACITY 256

typedef enum {
    RESPONSE_GREETING,
    RESPONSE_STATUS,
    RESPONSE_GOODBYE,
    RESPONSE_FALLBACK
} ResponseKind;

static void normalize_input(char *text) {
    for (size_t i = 0; text[i] != '\0'; ++i) {
        text[i] = (char)tolower((unsigned char)text[i]);
    }
}

static int is_exit_command(const char *text) {
    return strcmp(text, "bye") == 0;
}

static ResponseKind classify_input(const char *text) {
    if (strstr(text, "hello") != NULL) {
        return RESPONSE_GREETING;
    }
    if (strstr(text, "how are you") != NULL) {
        return RESPONSE_STATUS;
    }
    if (is_exit_command(text)) {
        return RESPONSE_GOODBYE;
    }
    return RESPONSE_FALLBACK;
}

static const char *response_text(ResponseKind kind) {
    switch (kind) {
        case RESPONSE_GREETING:
            return "Hello! How can I help you today?";
        case RESPONSE_STATUS:
            return "I'm just a program, but thanks for asking!";
        case RESPONSE_GOODBYE:
            return "Goodbye! Have a great day!";
        case RESPONSE_FALLBACK:
        default:
            return "I'm sorry, I don't understand that.";
    }
}

/*
 * Returns 1 for an accepted line, 0 for EOF/read error, and -1 for an
 * overlong logical line. A line of capacity - 1 bytes is accepted even
 * when its newline or EOF marker is the next character in the stream.
 */
static int read_input_line(char *buffer, size_t capacity) {
    if (buffer == NULL || capacity < 2 || capacity > (size_t)INT_MAX) {
        return 0;
    }

    if (fgets(buffer, (int)capacity, stdin) == NULL || ferror(stdin)) {
        return 0;
    }

    size_t length = strlen(buffer);
    if (length > 0 && buffer[length - 1] == '\n') {
        buffer[length - 1] = '\0';
        return 1;
    }

    if (feof(stdin)) {
        return 1;
    }

    /*
     * fgets may have filled capacity - 1 bytes without reading the line
     * terminator. Inspect one more character to distinguish an exact-fit
     * line from a genuinely overlong line.
     */
    int character = getchar();
    if (character == '\n') {
        return 1;
    }
    if (character == EOF) {
        return ferror(stdin) ? 0 : 1;
    }

    /* Discard the rest of an overlong logical line before the next prompt. */
    while (character != '\n' && character != EOF) {
        character = getchar();
    }

    if (ferror(stdin)) {
        return 0;
    }
    return -1;
}

int main(void) {
    char input[INPUT_CAPACITY];

    puts("Chatbot: Hi! I'm a simple chatbot. Type 'bye' to exit.");

    for (;;) {
        printf("You: ");
        fflush(stdout);

        int status = read_input_line(input, sizeof(input));
        if (status == 0) {
            puts("\nChatbot: Input closed. Goodbye!");
            break;
        }
        if (status < 0) {
            printf("Chatbot: Please keep your message to %d bytes or fewer.\n",
                   INPUT_CAPACITY - 1);
            continue;
        }

        normalize_input(input);
        ResponseKind kind = classify_input(input);
        printf("Chatbot: %s\n", response_text(kind));

        if (kind == RESPONSE_GOODBYE) {
            break;
        }
    }

    return 0;
}
