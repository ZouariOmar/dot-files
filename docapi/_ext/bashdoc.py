"""bashdoc: Sphinx directive turning dot-files function header blocks into docs.

Every documented shell function carries a header such as::

    # -----------------------------------------
    # .FUNCTION
    #   symlink
    # .SYNOPSIS
    #   Create a symbolic link.
    # .DESCRIPTION
    #   ...
    # .PARAMETERS / .OPTIONS / .EXAMPLES
    #   ...
    # -----------------------------------------

Usage (MyST)::

    ```{bashdoc} ../lib/common
    ```

The path is relative to the Sphinx source directory. The reference is thus
generated from the code and cannot drift from it.
"""

import re
from pathlib import Path

from docutils import nodes
from docutils.parsers.rst import Directive, directives

RULE = re.compile(r"^# -{10,}\s*$")
FIELD = re.compile(r"^# \.([A-Z]+)\s*$")
BODY = re.compile(r"^#   ?(.*)$")
TEXT_FIELDS = ("SYNOPSIS", "DESCRIPTION")
CODE_FIELDS = (("PARAMETERS", "Parameters", "text"),
               ("OPTIONS", "Options", "text"),
               ("EXAMPLES", "Examples", "bash"))


def parse_blocks(path):
    """Return a list of {field: [lines]} dicts, one per documented function."""
    blocks, cur, field, inside = [], None, None, False
    for line in path.read_text(encoding="utf-8").splitlines():
        if RULE.match(line):
            if inside:  # closing rule
                if cur and "FUNCTION" in cur:
                    blocks.append(cur)
                cur, field, inside = None, None, False
            else:
                cur, field, inside = {}, None, True
            continue
        if not inside:
            continue
        m = FIELD.match(line)
        if m:
            field = m.group(1)
            cur[field] = []
            continue
        m = BODY.match(line)
        if m and field:
            cur[field].append(m.group(1).rstrip())
    return blocks


def inline(text):
    """Turn `code` spans into literal nodes, everything else into Text."""
    out = []
    for i, part in enumerate(re.split(r"`([^`]+)`", text)):
        if not part:
            continue
        out.append(nodes.literal(part, part) if i % 2 else nodes.Text(part))
    return out


class BashDoc(Directive):
    required_arguments = 1
    has_content = False
    option_spec = {"prefix": directives.unchanged}

    def run(self):
        env = self.state.document.settings.env
        src = Path(env.srcdir) / self.arguments[0]
        env.note_dependency(str(src))
        if not src.is_file():
            return [self.state.document.reporter.error(
                f"bashdoc: file not found: {src}", line=self.lineno)]

        prefix = self.options.get("prefix", src.name)
        result = []
        for block in parse_blocks(src):
            name = " ".join(block["FUNCTION"]).strip()
            section = nodes.section(ids=[nodes.make_id(f"{prefix}-{name}")])
            section += nodes.title(name, "", nodes.literal(name + "()", name + "()"))

            synopsis = " ".join(block.get("SYNOPSIS", []))
            if synopsis:
                p = nodes.paragraph()
                p += nodes.strong("", synopsis)
                section += p

            desc = " ".join(l for l in block.get("DESCRIPTION", []) if l)
            if desc:
                section += nodes.paragraph("", "", *inline(desc))

            for key, label, lang in CODE_FIELDS:
                lines = [l for l in block.get(key, []) if l]
                if not lines:
                    continue
                section += nodes.paragraph("", "", nodes.strong("", label))
                lit = nodes.literal_block("\n".join(lines), "\n".join(lines))
                lit["language"] = lang
                section += lit

            meta = []
            created = " ".join(block.get("CREATED", [])).strip()
            updated = " ".join(block.get("UPDATED", [])).strip()
            if created:
                meta.append(f"created {created}")
            if updated:
                meta.append(f"updated {updated}")
            if meta:
                section += nodes.paragraph("", "", nodes.emphasis("", ", ".join(meta)))

            self.state.document.note_implicit_target(section, section)
            result.append(section)
        if not result:
            result.append(self.state.document.reporter.warning(
                f"bashdoc: no documented functions in {src}", line=self.lineno))
        return result


def setup(app):
    app.add_directive("bashdoc", BashDoc)
    return {"parallel_read_safe": True, "parallel_write_safe": True}
