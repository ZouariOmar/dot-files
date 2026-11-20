# lib/common

## Usage

Source it from a script that has defined `DOT_FILES_DIR`:

```bash
readonly DOT_FILES_DIR="$SCRIPT_DIR/dots"
. "$SCRIPT_DIR/lib/common"
```

It enables `set -euo pipefail`. Every function carries a header comment in the source with `.SYNOPSIS`, `.DESCRIPTION`, `.PARAMETERS` and `.EXAMPLES`.

## Global Variables

| Variable       | Purpose                                                              |
| -------------- | -------------------------------------------------------------------- |
| `BACKUP_DIR`   | Per-run backup dir `~/.dot-files-backup/<timestamp>` (overridable)   |
| `DRY_RUN`      | `true` makes filesystem functions print instead of act               |
| `ASSUME_YES`   | `true` stops prompts (defaults are used)                             |
| `NO_TEMPLATE`  | `true` disables template rendering globally                          |
| `TEMPLATE`     | Per-dot switch from `dot.conf` (default `true`)                      |
| `VARS`         | Associative array `NAME -> value` for template variables             |
| `NAMES`, `DESCS` | Discovered dots and their descriptions                             |
| `ALL`, `REQUESTED`, `SELECTED` | Selection state used by `select_dots`                |

## Function Reference

Generated from the header comments in `lib/common`.

```{bashdoc} ../lib/common
```
