# Changelog for dot-files

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.0.1] - 2026-03-07

### Added

- `dot-files/` subdirectory consolidating all configuration modules (`bash`, `browsers`, `clang`, `docker`, `git`, `linux`, `neofetch`, `nvidia`, `nvim`, `obs`, `servers`, `vim`, `vscode`).
- `res/` directory for project assets (logo).
- `install_dot_files` installation script at the repository root.

### Removed

- Removed top-level configuration directories (`bash/`, `browsers/`, `clang/`, `docker/`, `fonts/`, `git/`, `neofetch/`, `nvidia/`, `nvim/`, `obs/`, `root/`, `servers/`, `soft_backup/`, `vscode/`) — content moved under `dot-files/`.
- `assets/logo.png` — replaced by `res/logo.png`.
- `install_all` script — replaced by `install_dot_files`.

## [1.0.0] - 2026-01-01

### Added

- Initial structured release of dot-files.
- `CONTRIBUTING.md`, `CHANGELOG.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md` project documentation.
- `install_dot_files` bash script for automated installation.
- Refactored project structure: reorganized `bash/`, added `soft_backup/`, `root/`, and other directories.
- Multiple Neovim configuration improvements and snippet updates.
- Bash `.bashrc` enhancements and shell automation scripts.
- Linux backup file management (`arch_backup`, `linux_backup`).
- Shell backup installation automation (`install_dot_files`).

---

<!--
  Use this section to add more versions as needed, following the format below:

## [X.Y.Z] - YYYY-MM-DD
### Added
- ...

### Changed
- ...

### Deprecated
- ...

### Removed
- ...

### Fixed
- ...

### Security
- ...
-->

<!-- Link references for comparing changes between versions -->

> [!NOTE]
> [1.0.1]: <https://github.com/ZouariOmar/dot-files/releases/tag/v1.0.1>
> [1.0.0]: <https://github.com/ZouariOmar/dot-files/releases/tag/v1.0.0>
