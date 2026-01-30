TYPST_BIN = typst

INPUT_DIR = src

OUTPUT_DIR = build

MAIN_FILE = $(INPUT_DIR)/main.typ


.PHONY: help
help:
	@echo "Usage: make [all|watch|pt|en|clean]"


.PHONY: all
all: pt en


.PHONY: en
pt:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST_BIN) compile --root $(PWD) --input lang=pt $(MAIN_FILE) $(OUTPUT_DIR)/resume-pt.pdf


.PHONY: pt
en:
	@mkdir -p $(OUTPUT_DIR)
	$(TYPST_BIN) compile --root $(PWD) --input lang=en $(MAIN_FILE) $(OUTPUT_DIR)/resume-en.pdf


.PHONY: watch
watch:
	$(TYPST_BIN) watch --root $(PWD) --open zathura $(MAIN_FILE)


.PHONY: clean
clean:
	rm -rf $(OUTPUT_DIR)

# vim:sw=4:ts=4:noet:
