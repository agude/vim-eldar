# AGENTS.md

This file provides guidance to AI Agents when working with code in this
repository. `CLAUDE.md` and `GEMINI.md` are symlinks to this file.

## Project Overview

Eldar is a dark Vim/Neovim colorscheme using bright, high-contrast colors,
based on elflord. It is MIT licensed. The only distributable file is
`colors/eldar.vim`. The `code/` directory has sample files for visual testing
and is gitignored.

## Architecture

The colorscheme is a single Vimscript file (`colors/eldar.vim`) structured as:

1. **Color definitions** --- Six palette colors (`s:red`, `s:yellow`, etc.)
   defined as `[GUI_hex, cterm_name]` pairs. GUI colors are overridable via
   `g:eldar_*` variables; cterm colors are fixed to the 16 ANSI names.
2. **Helper function `s:HL()`** --- Sets highlight groups with signature
   `(group, fg, bg, [gui_attr], [cterm_attr], [guisp])`. Deleted at end of
   file to avoid polluting the namespace.
3. **Highlight group sections** --- Editor chrome, syntax groups, diff, completion
   menu, spelling, and text formatting. Uses `highlight! link` for groups that
   share styling.

## Development

There is no build system, linter, or test suite. To test changes, open a sample
file in Vim with the colorscheme loaded:

```sh
vim -c "colorscheme eldar" code/fib.py
```

The `code/` directory has sample `.py`, `.cpp`, and `.md` files for checking
syntax highlighting across languages.

## Design Decisions

- `Normal` is intentionally left unset so terminal default foreground and
  background colors show through. Users can override this via `g:eldar_*`
  variables documented in the README.
- The scheme targets both Vim and Neovim.

## Conventions

- Terminal colors use only the 16 standard ANSI color names (e.g., `red`,
  `cyan`, `DarkGray`), never 256-color numbers, so the scheme respects the
  user's terminal palette.
- GUI colors default to the Tango palette.
- All highlight definitions use the `s:HL()` helper; raw `highlight` commands
  are only used for `highlight! link` and `highlight clear`.
