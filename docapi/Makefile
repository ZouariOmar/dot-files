# Minimal Sphinx makefile for the dot-files API reference.
#   make html        build to _build/html
#   make clean       remove _build
#   make linkcheck   check external links
SPHINXBUILD ?= sphinx-build
SOURCEDIR   := .
BUILDDIR    := _build

.PHONY: help html clean linkcheck
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)"

clean:
	rm -rf "$(BUILDDIR)"

html linkcheck:
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" -W --keep-going
