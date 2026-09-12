SHELL := /bin/bash

.PHONY: help init sync

help:
	@echo "Targets:"
	@echo "  init  - clone/initialize all submodules and check out main/master"
	@echo "  sync  - pull the latest changes for all submodules"

# Clone any missing submodules, then make sure each one is on its main
# (or master, for older repos) branch rather than left in detached HEAD.
init:
	git submodule update --init --recursive
	git submodule foreach --recursive '\
		git checkout main 2>/dev/null || git checkout master 2>/dev/null || \
		echo "warning: no main or master branch in $$name"'

# Fast-forward every submodule on its current branch to the latest remote
# commit. Run `make init` first if a submodule hasn't been cloned yet.
sync:
	git submodule sync --recursive
	git submodule foreach --recursive '\
		(git checkout main 2>/dev/null || git checkout master 2>/dev/null) && \
		git pull --ff-only'
