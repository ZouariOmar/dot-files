"""Sphinx configuration for the dot-files API reference."""

import os
import sys

sys.path.insert(0, os.path.abspath("_ext"))

# -- Project -----------------------------------------------------------------
project = "dot-files"
author = "Zouari Omar"
copyright = "2026, Zouari Omar"
with open(os.path.join(os.path.dirname(__file__), "..", "VERSION"), encoding="utf-8") as fh:
    release = version = fh.read().strip()

# -- General -----------------------------------------------------------------
extensions = [
    "myst_parser",
    "sphinxcontrib.mermaid",
    "bashdoc",  # docapi/_ext/bashdoc.py
]
source_suffix = {".md": "markdown", ".rst": "restructuredtext"}
root_doc = "index"
exclude_patterns = ["_build", "_ext", ".venv", "venv", "README.md", "requirements.txt"]
language = "en"

# -- MyST --------------------------------------------------------------------
myst_enable_extensions = ["colon_fence", "deflist"]
myst_heading_anchors = 3
myst_fence_as_directive = ["mermaid"]

# -- HTML --------------------------------------------------------------------
html_theme = "furo"
html_title = f"dot-files {release}"
html_logo = "../res/img/logo.png"
html_static_path = ["_static"]
html_show_sourcelink = False
