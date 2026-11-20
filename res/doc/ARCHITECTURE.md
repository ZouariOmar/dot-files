# Architecture

<!--toc:start-->

- [Architecture](#architecture)
  - [Repository Layout](#repository-layout)
  - [Components](#components)
  - [Import Flow](#import-flow)
  - [Export Flow](#export-flow)
  - [Design Principles](#design-principles)

<!--toc:end-->

## Repository Layout

```mermaid
flowchart TD
    A["import"] --> L["lib/common"]
    B["export"] --> L
    L --> D["dots/name/"]
    D --> C["dot.conf"]
    D --> H["import / export hooks"]
    D --> F["config files"]
```

```text
.
├── import          # repo -> system
├── export          # system -> archive / repo
├── lib/common      # shared functions and variables
├── dots/<name>/    # one directory per dot
├── docapi/         # API reference
└── res/            # images and documentation
```

## Components

| Component      | Responsibility                                                     |
| -------------- | ------------------------------------------------------------------ |
| `import`       | CLI: select dots, then link or render them into `DEST`             |
| `export`       | CLI: collect live host files into an archive or back into `dots/`  |
| `lib/common`   | Logging, backups, symlinks, templates, dot discovery and selection |
| `dots/<name>/` | Config files plus optional `dot.conf` and hooks                    |
| Hooks          | `dot_import`, `dot_post`, `dot_export` for non-file configs        |

## Import Flow

```mermaid
sequenceDiagram
    participant U as User
    participant I as import
    participant C as lib/common
    participant H as Host
    U->>I: ./import nvim git
    I->>C: discover, select_dots
    loop each dot
        I->>C: link_contents(dot, DEST)
        C->>C: has_template?
        alt template
            C->>U: ask_var
            C->>H: render_file, backup_existing
        else plain
            C->>H: symlink, backup_existing
        end
    end
```

## Export Flow

```mermaid
flowchart TD
    A["select dots"] --> B{"--to-repo?"}
    B -- No --> C["Stage host files in temp dir"]
    C --> D["tar + compressor / zip"]
    D --> E["host-dots-timestamp.ext"]
    B -- Yes --> F["Back up repo copy"]
    F --> G["Copy host file into dots/name/"]
    G --> H["Review with git diff"]
```

## Design Principles

- Convention over configuration: a directory is a dot; no registry to maintain.
- Non-destructive: replaced files are always backed up, never deleted.
- Idempotent: running a command twice changes nothing the second time.
- Safe previews: `--dry-run` everywhere, with no prompts.
- Extensible through small, documented hooks.
- Shell-lint clean (`shellcheck -x`) and every function documented in its source.
