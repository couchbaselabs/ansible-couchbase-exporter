.DEFAULT_GOAL:= lint
MAKEFLAGS = -j1
.PHONY: all lint lint-sh lint-shell lint-yaml lint-md lint-markdown lint-text ci-lint install init

default: all

all: lint validate

init: install

install:
	pipenv install
	npm install

lint: lint-shell lint-yaml lint-markdown lint-text

lint-sh: lint-shell

lint-shell:
	@./tools/lint-shell.sh

lint-yaml:
	@./tools/lint-yaml.sh

lint-md: lint-markdown

lint-markdown:
	@./tools/lint-markdown.sh

lint-text:
	@./tools/lint-text.sh

ci-lint:
	@./tools/ci-lint.sh
