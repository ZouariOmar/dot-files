# Dot Specification

## Layout

A dot is a directory under `dots/`. No registry exists: adding a directory is enough.

```text
dots/<name>/
├── dot.conf    # optional metadata (sourced)
├── import      # optional hook, import side (sourced)
├── export      # optional hook, export side (sourced)
└── ...         # files/directories to place into DEST
```

`dot.conf`, `import` and `export` are never placed on the host or treated as content.

## dot.conf

Plain Bash, sourced by the scripts.

| Key        | Default | Description                                                  |
| ---------- | ------- | ------------------------------------------------------------ |
| `DESC`     | empty   | One-line description shown in the menu                       |
| `DEST`     | `$HOME` | Directory that receives the dot's entries                    |
| `TEMPLATE` | `true`  | Set `false` to disable `{{VAR}}` rendering for this dot      |

```bash
DESC="Neovim (LazyVim) config"
DEST="$HOME/.config/nvim"
```

## Hooks

Hooks are sourced Bash files that may define functions. Variables available: `DOT_NAME`, `DOT_DIR`, `DEST`, `DRY_RUN`, plus the `lib/common` helpers.

| File     | Function       | When / purpose                                                       |
| -------- | -------------- | -------------------------------------------------------------------- |
| `import` | `dot_import()` | Replaces the default linking (e.g. `gnome` runs `dconf load`)        |
| `import` | `dot_post()`   | Runs after the dot is imported                                       |
| `export` | `dot_export()` | Replaces the default host copy; write files into `$STAGE_DIR`        |

Rules: honor `DRY_RUN` (print, change nothing), use the `log_*` helpers, and return non-zero on failure.

```bash
# dots/gnome/export
dot_export() {
  command -v dconf >/dev/null || { log_error "dconf not found"; return 1; }
  dconf dump /org/ >"$STAGE_DIR/org-settings.ini"
}
```

## Template Placeholders

| Syntax              | Meaning                                  |
| ------------------- | ---------------------------------------- |
| `{{NAME}}`          | Required value, asked or given with `-s` |
| `{{NAME:default}}`  | Optional; default used with `-y`/no TTY  |

`NAME` must match `[A-Z][A-Z0-9_]*`. Binary files are never scanned. See [IMPORT](IMPORT.md#template-mode).

## Adding a New Dot

```bash
mkdir dots/mytool
cp ~/.config/mytool/config.toml dots/mytool/
cat > dots/mytool/dot.conf <<'CONF'
DESC="My tool config"
DEST="$HOME/.config/mytool"
CONF
./import -n mytool      # preview
./import mytool
```

It appears in both `./import` and `./export` menus automatically.

## Included Dots

| Dot            | Destination                     | Description                              |
| -------------- | ------------------------------- | ---------------------------------------- |
| `aws`          | `$HOME`                         | AWS CLI config and credentials           |
| `bash`         | `$HOME`                         | Bash rc, profile, aliases, functions     |
| `browsers`     | `~/.dot-backups/browsers`       | Browser bookmarks (import manually)      |
| `clang`        | `$HOME`                         | clang-format and clangd                  |
| `docker`       | `~/.docker`                     | Docker client config                     |
| `git`          | `$HOME`                         | Git global config                        |
| `gnome`        | dconf (hooks)                   | GNOME settings                           |
| `hyper`        | `$HOME`                         | Hyper terminal (empty)                   |
| `neofetch`     | `~/.config/neofetch`            | Neofetch config and themes               |
| `nvidia`       | `$HOME`                         | NVIDIA settings                          |
| `nvim`         | `~/.config/nvim`                | Neovim (LazyVim)                         |
| `obs`          | `~/.config/obs-studio`          | OBS Studio templates                     |
| `soft_backups` | `~/.dot-backups/soft_backups`   | Software backup/restore scripts          |
| `vim`          | `$HOME`                         | Vim config                               |
| `vscode`       | `~/.config/Code/User`           | VS Code settings                         |
