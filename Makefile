CC ?= cc
CFLAGS ?= -std=c11 -Wall -Wextra -Wpedantic -Werror -O2
PYTHON ?= python3
BUILD_DIR := build
APP := $(BUILD_DIR)/chatbot
TEST := $(BUILD_DIR)/test_chatbot

.PHONY: all run test docs-check markdown-check structure-check security-check check clean

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

docs-check:
	$(PYTHON) scripts/validate_docs.py

markdown-check:
	$(PYTHON) scripts/validate_markdown.py

structure-check:
	$(PYTHON) scripts/check_project_structure.py

security-check:
	sh scripts/security-check.sh

check: test docs-check markdown-check structure-check security-check

clean:
	rm -rf $(BUILD_DIR)
