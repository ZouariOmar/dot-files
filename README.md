[![Contributors](https://img.shields.io/badge/CONTRIBUTORS-01-blue?style=plastic)](https://gitlab.com/zouariomar/dot-files/-/graphs/main)
[![Forks](https://img.shields.io/badge/FORKS-00-blue?style=plastic)](https://gitlab.com/zouariomar/dot-files/-/forks)
[![Stargazers](https://img.shields.io/badge/STARS-01-blue?style=plastic)](https://gitlab.com/zouariomar/dot-files/-/starrers)
[![Issues](https://img.shields.io/badge/ISSUES-00-blue?style=plastic)](https://gitlab.com/zouariomar/dot-files/-/issues)
[![GPL-3.0 License](https://img.shields.io/badge/LICENSE-GPL_3.0-blue?style=plastic)](https://gitlab.com/zouariomar/dot-files/-/blob/main/LICENSE)
[![Linkedin](https://img.shields.io/badge/Linkedin-7.2k-blue?style=plastic)](https://www.linkedin.com/in/zouari-omar)

<div align="center">
<img src="res/img/logo.png" width="300" alt="dot-files_logo">
<h1>dot-files</h1>
<h4>Personal dotfiles with an interactive import/export toolkit</h4>

![Open Source](https://img.shields.io/badge/open_source-yes-brightgreen?style=for-the-badge&logo=opensourceinitiative&logoColor=white)
![Status](https://img.shields.io/badge/status-active-success?style=for-the-badge&logo=statuspage&logoColor=white)
![Version](https://img.shields.io/badge/version-1.2-orange?style=for-the-badge&logo=semver&logoColor=white)
![License](https://img.shields.io/badge/license-GPL_3.0-green?style=for-the-badge&logo=open-source-initiative&logoColor=white)
![Bash](https://img.shields.io/badge/bash-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Arch](https://img.shields.io/badge/arch-1793D1?style=for-the-badge&logo=archlinux&logoColor=white)
![Neovim](https://img.shields.io/badge/neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![Git](https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white)
![Sphinx](https://img.shields.io/badge/docs-sphinx-0A507A?style=for-the-badge&logo=sphinx&logoColor=white)
</div>

<!--toc:start-->

- [Overview](#overview)
- [Key Features](#key-features)
- [Included Dots](#included-dots)
- [Documentation](#documentation)
- [Quick Start](#quick-start)
- [Download](#download)
- [Emailware](#emailware)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgments](#acknowledgments)

<!--toc:end-->

## Overview

dot-files keeps a consistent, minimal development setup across machines.
Two interactive scripts move your configuration in both directions:
`import` installs it onto a host, and `export` captures the real state of a
host back into an archive or into this repository.

## Key Features

- **Interactive:** Pick dots from a menu, or pass names and flags for scripted use.
- **Auto-discovery:** Add a directory under `dots/` and it appears everywhere, with no registry to edit.
- **Safe by default:** Replaced files are moved to `~/.dot-files-backup/<timestamp>/`, never deleted; `--dry-run` previews everything.
- **Templates:** `{{VAR}}` placeholders are rendered per machine (asked once, or preset with `-s`).
- **Host export:** Archive your live configs as `tar`, `gz`, `bz2`, `xz`, `zst` or `zip`.
- **Repo sync:** `export --to-repo` refreshes `dots/` from your machine, ready for `git diff`.
- **Hooks:** Per-dot `import`/`export` hooks handle non-file settings such as GNOME's `dconf`.
- **Documented:** Every function is documented in its source and published with Sphinx.

## Included Dots

| Dot            | Description                                        |
| -------------- | -------------------------------------------------- |
| `aws`          | AWS CLI config and credentials                     |
| `bash`         | Bash shell configuration (aliases, env, functions) |
| `browsers`     | Browser bookmarks                                  |
| `clang`        | C/C++ formatter and language-server configuration  |
| `docker`       | Docker client configuration                        |
| `git`          | Git global configuration                           |
| `gnome`        | GNOME settings, loaded with `dconf`                |
| `neofetch`     | System info display customization                  |
| `nvidia`       | NVIDIA settings                                    |
| `nvim`         | Neovim (LazyVim) configuration                     |
| `obs`          | OBS Studio templates                               |
| `soft_backups` | Software backup scripts (Arch, Debian, generic)    |
| `vim`          | Vim configuration                                  |
| `vscode`       | VS Code settings                                   |

## Documentation

| Document                                   | Description                                                     |
| ------------------------------------------ | --------------------------------------------------------------- |
| [USAGE.md](res/doc/USAGE.md)               | Import, export, templates and syncing in practice.              |
| [ARCHITECTURE.md](res/doc/ARCHITECTURE.md) | Repository layout and import/export flows.                      |
| [INSTALL.md](res/doc/INSTALL.md)           | Prerequisites, installation and restoring backups.              |
| [SUPPORT.md](res/doc/SUPPORT.md)           | Support resources and guidance for getting help with dot-files. |
| [docapi/](docapi/README.md)                | Sphinx API reference: CLI options, dot specification, library.  |

## Quick Start

Clone the repository and follow the [installation guide](res/doc/INSTALL.md).

```bash
git clone https://gitlab.com/zouariomar/dot-files.git
cd dot-files
chmod u+x import export
./import        # interactive menu
```

Common commands:

```bash
./import -n -a                   # preview everything, change nothing
./import nvim git                # import selected dots
./export -a -f zst -o ~/bk.tar.zst   # archive your live configs
./export -r nvim                 # sync host files back into dots/
```

Build the API reference locally:

```bash
pip install -r docapi/requirements.txt
make -C docapi html
```

## Download

Visit the [dot-files Releases](https://gitlab.com/zouariomar/dot-files/-/releases) page for available releases.

## Emailware

dot-files is an [emailware](https://en.wiktionary.org/wiki/emailware). Meaning, if you liked using this repository or it has helped you in any way,
I'd like you to send me an email at <zouariomar20@gmail.com> about anything you'd want to say about
this repository. I'd really appreciate it!

## Contributing

Contributions are welcome! Open an issue to report a problem or propose an
improvement, then submit a merge request. See [CONTRIBUTING.md](CONTRIBUTING.md).

[Report an issue](https://gitlab.com/zouariomar/dot-files/-/issues)

## License

dot-files is distributed under the [GNU General Public License v3.0](LICENSE).

## Contact

For questions or suggestions, feel free to reach out:

- **GitLab**: [ZouariOmar](https://gitlab.com/zouariomar)
- **Email**: <zouariomar20@gmail.com>
- **LinkedIn**: [Zouari Omar](https://www.linkedin.com/in/zouari-omar)

## Acknowledgments

<div align="center">Built with ❤️ for the open-source community</div>
