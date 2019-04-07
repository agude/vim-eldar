![Eldar logo](https://raw.githubusercontent.com/agude/vim-eldar/image_rehost/images/eldar_logo.svg.png?raw=true "Eldar logo")

Eldar is a dark color theme for Vim using bright, high-contrast colors. It is
based on [elflord][elcs], one of the default Vim color schemes.

[elcs]: https://github.com/vim/vim/blob/master/runtime/colors/elflord.vim

Eldar looks great in both the GUI and terminal because it uses fewer than 16
colors. Eldar uses the [Tango color palette][tango] in the GUI by default, but
these colors can be overridden by setting `g:eldar_*` variables (see below).
Eldar uses both colors and font weight to differentiate various elements. It
is not a subtle scheme; it uses white on black text with high contrast colors.

[tango]: http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines#Color_Palette

## Installation

You can install Eldar by downloading the [`eldar.vim` file][file] and placing
it in `~/.vim/colors/`, or by using whatever plugin manager you prefer. For
example, with [vim-plug][plug]:

[file]: /colors/eldar.vim
[plug]: https://github.com/junegunn/vim-plug

```vim
Plug 'agude/vim-eldar'
```

You can activate the color scheme with:

```vim
:colorscheme eldar
```

Or put it in your `.vimrc` so it activates every time you open Vim:

```vim
"------------------------
" Syntax: highlighting
"------------------------
if has('syntax')
    syntax enable             " Turn on syntax highlighting
    silent! colorscheme eldar " Custom color scheme
endif
```

### Change Colors

To change the GUI colors, simply define the appropriate `g:eldar_*` variable
in your `.vimrc` before calling `colorscheme`:

```vim
"------------------------
" Syntax: highlighting
"------------------------
if has('syntax')
    " Override Eldar GUI colors
    g:eldar_red     = "#ff0000"
    g:eldar_yellow  = "#ffff00"
    g:eldar_green   = "#00ff00"
    g:eldar_cyan    = "#00ffff"
    g:eldar_blue    = "#0000ff"
    g:eldar_magenta = "#ff00ff"

    syntax enable             " Turn on syntax highlighting
    silent! colorscheme eldar " Custom color scheme
endif
```
The GUI text and background colors default to "White" and "Black"
respectively. To change these, set the following variables:

```vim
g:eldar_text        = "#D3D3D3"
g:eldar_background  = "#2B2B2B"
```

By default terminal vim will use the background color and text color defined
by your terminal profile. To override these colors, set:

```vim
g:eldar_term_text        = "White"
g:eldar_term_background  = "Black"
```

All these variables must be set before calling `colorscheme eldar`.

## Screenshots

### Python

![Example of Vim Eldar with Python](https://raw.githubusercontent.com/agude/vim-eldar/image_rehost/images/eldar_python.png?raw=true "Example of Vim Eldar with Python")

### C++

![Example of Vim Eldar with C++](https://raw.githubusercontent.com/agude/vim-eldar/image_rehost/images/eldar_cpp.png?raw=true "Example of Vim Eldar with C++")

### Markdown

![Example of Vim Eldar with Markdown](https://raw.githubusercontent.com/agude/vim-eldar/image_rehost/images/eldar_markdown.png?raw=true "Example of Vim Eldar with Markdown")

### Diff

![Example of Vim Eldar performing a diff](https://raw.githubusercontent.com/agude/vim-eldar/image_rehost/images/eldar_diff.png?raw=true "Example of Vim Eldar performing a diff")
