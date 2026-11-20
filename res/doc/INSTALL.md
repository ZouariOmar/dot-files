# Installation

<!--toc:start-->

- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Clone the Repository](#clone-the-repository)
  - [Preview the Import](#preview-the-import)
  - [Import Your Dots](#import-your-dots)
  - [Verify Installation](#verify-installation)
  - [Restore a Backup](#restore-a-backup)

<!--toc:end-->

## Prerequisites

- Git
- Bash 4.4 or newer
- Standard tools: `sed`, `grep`, `find`, `tar`
- Optional, for `export` formats: `gzip`, `bzip2`, `xz`, `zstd`, `zip`
- Optional, for the `gnome` dot: `dconf`

## Clone the Repository

```bash
git clone https://gitlab.com/zouariomar/dot-files.git
cd dot-files
chmod u+x import export
```

## Preview the Import

Nothing is changed in dry-run mode:

```bash
./import -n -a
```

## Import Your Dots

Interactive menu:

```bash
./import
```

Or choose directly:

```bash
./import nvim git
./import -a
```

Files containing `{{VAR}}` placeholders ask for their values; see [Usage](USAGE.md#templates).

## Verify Installation

List the dots and check the links:

```bash
./import -l
ls -l ~/.gitconfig ~/.config/nvim
```

## Restore a Backup

Replaced files are kept in `~/.dot-files-backup/<timestamp>/`, mirroring their original path:

```bash
ls ~/.dot-files-backup/
cp -a ~/.dot-files-backup/<timestamp>/home/<user>/.gitconfig ~/.gitconfig
```
