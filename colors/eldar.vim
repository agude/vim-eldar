" ---------------------------------------------------------
"  ______ _     _
" |  ____| |   | |
" | |__  | | __| | __ _ _ __
" |  __| | |/ _` |/ _` | '__|
" | |____| | (_| | (_| | |
" |______|_|\__,_|\__,_|_|
"
" ---------------------------------------------------------
"
" Maintainer:   Alexander Gude
" Email:        alex.public.account@gmail.com
" File:         eldar.vim
" URL:          github.com/agude/vim-eldar
" License:      MIT
"
" ---------------------------------------------------------
"
" Copyright (c) 2016--2024 Alexander Gude
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation  files  (the "Software"), to deal in the Soft‐
" ware without restriction,  including  without  limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software,  and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice  and  this  permission  notice
" shall  be  included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
" KIND,  EXPRESS  OR  IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR  PURPOSE  AND  NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE  LIABLE  FOR  ANY  CLAIM,
" DAMAGES  OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" ---------------------------------------------------------

" Eldar is designed for dark backgrounds
set background=dark

highlight clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'eldar'

" Define colors as [GUI, cterm] pairs
" GUI colors can be overridden via g:eldar_* variables
let s:red     = [get(g:, 'eldar_red', '#EF2929'), 'red']
let s:yellow  = [get(g:, 'eldar_yellow', '#FCE94F'), 'yellow']
let s:green   = [get(g:, 'eldar_green', '#8AE234'), 'green']
let s:cyan    = [get(g:, 'eldar_cyan', '#34E2E2'), 'cyan']
let s:blue    = [get(g:, 'eldar_blue', '#729FCF'), 'blue']
let s:magenta = [get(g:, 'eldar_magenta', '#AD7FA8'), 'magenta']

" Normal text and background (GUI and terminal can differ)
let s:fg = [get(g:, 'eldar_text', 'White'), get(g:, 'eldar_term_text', 'NONE')]
let s:bg = [get(g:, 'eldar_background', 'Black'), get(g:, 'eldar_term_background', 'NONE')]

" UI colors
let s:none     = ['NONE', 'NONE']
let s:white    = ['White', 'White']
let s:black    = ['Black', 'Black']
let s:slate    = ['#2e3436', 'DarkGray']  " Tango Slate shadow (very dark gray)
let s:darkgray = ['DarkGray', 'DarkGray']
let s:darkgrey = ['DarkGrey', 'DarkGrey']
let s:gray     = ['Gray', 'Gray']
let s:grey     = ['Grey', 'Grey']

" Helper function to set highlight groups
" Arguments: group, fg, bg, [gui_attr], [cterm_attr], [guisp]
function! s:HL(group, fg, bg, ...)
  let l:gui   = a:0 >= 1 ? a:1 : 'NONE'
  let l:cterm = a:0 >= 2 ? a:2 : l:gui
  let l:guisp = a:0 >= 3 ? a:3 : 'NONE'
  execute 'highlight' a:group
        \ 'guifg='   . a:fg[0]
        \ 'ctermfg=' . a:fg[1]
        \ 'guibg='   . a:bg[0]
        \ 'ctermbg=' . a:bg[1]
        \ 'gui='     . l:gui
        \ 'cterm='   . l:cterm
        \ 'guisp='   . l:guisp
endfunction


" Editor settings
" ---------------
if has("gui_running")
  call s:HL('Normal', [s:fg[0], 'NONE'], [s:bg[0], 'NONE'])
else
  call s:HL('Normal', ['NONE', s:fg[1]], ['NONE', s:bg[1]])
endif
call s:HL('Cursor', s:none, s:none, 'Reverse')
call s:HL('CursorLine', s:none, s:slate)
call s:HL('LineNr', s:darkgray, s:none)
call s:HL('CursorLineNr', s:white, s:none)

" Number column
" -------------
highlight! link CursorColumn CursorLine
highlight! link CursorLineSign CursorLine
highlight! link CursorLineFold CursorLine
call s:HL('Folded', s:darkgrey, s:black)
call s:HL('FoldColumn', s:none, s:darkgrey)
highlight! link SignColumn FoldColumn

" Window/Tab delimiters
" ---------------------
call s:HL('VertSplit', s:white, s:none)
call s:HL('ColorColumn', s:none, s:darkgray)
call s:HL('TabLine', s:white, s:darkgray)
call s:HL('TabLineFill', s:none, s:darkgray)
call s:HL('TabLineSel', s:black, s:gray)

" File Navigation / Searching
" ---------------------------
call s:HL('Directory', s:blue, s:none, 'Bold')
call s:HL('Search', s:black, s:yellow, 'Bold')
call s:HL('IncSearch', s:none, s:none, 'Reverse')

" Prompt/Status
" -------------
call s:HL('StatusLine', s:white, s:bg, 'Bold,Reverse')
call s:HL('StatusLineNC', s:white, s:bg, 'Reverse')
call s:HL('WildMenu', s:white, s:darkgrey, 'Bold')
call s:HL('Question', s:blue, s:none)
call s:HL('Title', s:none, s:none, 'Bold')
call s:HL('ModeMsg', s:none, s:none, 'Bold')
call s:HL('MoreMsg', s:green, s:none)

" Visual aid
" ----------
call s:HL('MatchParen', s:none, s:cyan)
call s:HL('Visual', s:none, s:darkgrey)
highlight! link VisualNOS Visual
call s:HL('NonText', s:blue, s:none)
call s:HL('Todo', s:black, s:yellow)
call s:HL('Underlined', s:cyan, s:none, 'Underline', 'Underline', s:cyan[0])
call s:HL('EndOfBuffer', s:blue, s:none)
call s:HL('Error', s:red, s:black, 'Reverse,Bold')
call s:HL('ErrorMsg', s:red, s:white, 'Reverse,Bold')
call s:HL('WarningMsg', s:red, s:none)
" 'bg' is a special Vim color meaning "use background color" (makes text invisible)
call s:HL('Ignore', ['bg', s:black[1]], s:none)
call s:HL('SpecialKey', s:cyan, s:none)

" Variable types
" --------------
call s:HL('Constant', s:magenta, s:none)
call s:HL('Number', s:red, s:none)
highlight! link String Constant
highlight! link Boolean Constant
highlight! link Float Number
call s:HL('Identifier', s:green, s:none, 'Bold')
highlight! link Function Identifier

" Comments
" --------
call s:HL('Comment', s:cyan, s:none)
highlight! link SpecialComment Special

" Language constructs
" -------------------
call s:HL('Statement', s:yellow, s:none, 'Bold')
highlight! link Conditional Statement
highlight! link Repeat Statement
highlight! link Label Statement
highlight! link Operator Statement
highlight! link Keyword Statement
highlight! link Exception Statement
call s:HL('Special', s:red, s:none)
highlight! link SpecialChar Special
highlight! link Tag Special
highlight! link Delimiter Special
highlight! link Debug Special

" C like
" ------
call s:HL('PreProc', s:blue, s:none, 'Bold')
highlight! link Include PreProc
highlight! link Define PreProc
highlight! link Macro PreProc
highlight! link PreCondit PreProc
call s:HL('Type', s:green, s:none, 'Bold')
call s:HL('Structure', s:magenta, s:none)
highlight! link StorageClass Type
highlight! link Typedef Type

" Diff
" ----
call s:HL('DiffAdd', s:green, s:black, 'Reverse,Bold')
call s:HL('DiffChange', s:none, s:none)
call s:HL('DiffDelete', s:red, s:black, 'Reverse,Bold')
call s:HL('DiffText', s:blue, s:black, 'Reverse,Bold')

" Completion menu
" ---------------
call s:HL('Pmenu', s:black, s:grey)
call s:HL('PmenuSel', s:yellow, s:darkgrey, 'Bold')
call s:HL('PmenuThumb', s:none, s:darkgrey)
highlight! link PmenuSbar Pmenu

" Spelling
" --------
call s:HL('SpellBad', s:red, s:none, 'undercurl', 'undercurl', s:red[0])
call s:HL('SpellCap', s:blue, s:none, 'undercurl', 'undercurl', s:blue[0])
call s:HL('SpellLocal', s:yellow, s:none, 'undercurl', 'undercurl', s:yellow[0])
call s:HL('SpellRare', s:green, s:none, 'undercurl', 'undercurl', s:green[0])

" Text Formatting
" ---------------
call s:HL('Italic', s:white, s:none, 'Italic')
call s:HL('Bold', s:white, s:none, 'Bold')
call s:HL('BoldItalic', s:white, s:none, 'Italic,Bold')
highlight! link htmlItalic Italic
highlight! link htmlBold Bold
highlight! link htmlBoldItalic BoldItalic


" Clean up
delfunction s:HL
