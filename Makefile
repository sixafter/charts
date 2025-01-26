# Copyright (c) 2024 Six After, Inc.
#
# This source code is licensed under the Apache 2.0 License found in the
# LICENSE file in the root directory of this source tree.

SHELL := /bin/bash

.DEFAULT: ;: do nothing

.PHONY: all
all: lint test ## Run all the tests and linters

.PHONY: deps
deps: ## Get the dependencies and vendor
	@scripts/deps.sh

.PHONY: lint
lint: ## Lint the files
	@scripts/lint.sh

.PHONY: help
help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# %: - rule which match any task name;  @: - empty recipe = do nothing
%:
    @:
