CC ?= cc
CFLAGS ?= -std=c11 -Wall -Wextra -Wpedantic -Werror -O2
BUILD_DIR := build
APP := $(BUILD_DIR)/chatbot
TEST := $(BUILD_DIR)/test_chatbot

.PHONY: all run test clean check

all: $(APP)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(APP): chatbot/chatbot.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) $< -o $@

$(TEST): tests/test_chatbot.c chatbot/chatbot.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) tests/test_chatbot.c -o $@

run: $(APP)
	./$(APP)

test: $(TEST) $(APP)
	./$(TEST)
	sh tests/test_interactive.sh ./$(APP)

check: test

clean:
	rm -rf $(BUILD_DIR)
