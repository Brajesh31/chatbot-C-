#include <stdio.h>
#include <string.h>

void respond(char *input) {
    if (strstr(input, "hello") != NULL) {
        printf("Chatbot: Hello! How can I help you today?\n");
    } else if (strstr(input, "how are you") != NULL) {
        printf("Chatbot: I'm just a program, but thanks for asking!\n");
    } else if (strstr(input, "bye") != NULL) {
        printf("Chatbot: Goodbye! Have a great day!\n");
    } else {
        printf("Chatbot: I'm sorry, I don't understand that.\n");
    }
}

int main() {
    char input[100];
    printf("Chatbot: Hi! I'm a simple chatbot. Type 'bye' to exit.\n");
    
    while (1) {
        printf("You: ");
        fgets(input, sizeof(input), stdin);
        input[strcspn(input, "\n")] = 0; // Remove newline character
        
        respond(input);
        
        if (strstr(input, "bye") != NULL) {
            break;
        }
    }
    
    return 0;
}
