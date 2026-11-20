# docapi

![Docs](https://img.shields.io/badge/docs-sphinx-blue?style=for-the-badge&logo=sphinx&logoColor=white)
![Markdown](https://img.shields.io/badge/markdown-myst-black?style=for-the-badge&logo=markdown&logoColor=white)
![API](https://img.shields.io/badge/api-reference-success?style=for-the-badge&logo=swagger&logoColor=white)

`docapi` contains the complete API reference for dot-files, built with [Sphinx](https://www.sphinx-doc.org) (MyST Markdown, Furo theme).

## Includes

| Page                      | Covers                                                           |
| ------------------------- | ---------------------------------------------------------------- |
| [IMPORT](IMPORT.md)       | `import` options, behavior, exit codes, template mode            |
| [EXPORT](EXPORT.md)       | `export` options, archive formats, `--to-repo` sync mode         |
| [DOT-SPEC](DOT-SPEC.md)   | `dot.conf` keys, `import`/`export` hooks, how to add a new dot   |
| [LIB](LIB.md)             | Global variables and every function of `lib/common` (generated)  |
| [INTERNALS](INTERNALS.md) | Functions of `import`, `export` and the bundled hooks (generated)|

The function reference is generated from the `# .FUNCTION` header comments by `_ext/bashdoc.py`, so documenting a function in the source is enough to publish it.

Project guides live in `res/doc/`: [Installation](../res/doc/INSTALL.md), [Usage](../res/doc/USAGE.md), [Architecture](../res/doc/ARCHITECTURE.md), [Support](../res/doc/SUPPORT.md).

## Usage

```bash
# Install the toolchain (once)
python3 -m venv .venv && . .venv/bin/activate
pip install -r docapi/requirements.txt

# Build the site
make -C docapi html
xdg-open docapi/_build/html/index.html
```

| Target                  | Description                         |
| ----------------------- | ----------------------------------- |
| `make -C docapi html`   | Build the HTML site (warnings are errors) |
| `make -C docapi linkcheck` | Check external links             |
| `make -C docapi clean`  | Remove `docapi/_build`              |
