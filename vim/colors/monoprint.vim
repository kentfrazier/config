" Vim color file
"
" Name:       monoprint.vim
" Version:    0.1
" Maintainer:	Kent Frazier <kentfrazier@gmail.com>
"
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

" --- Setup --- "

if &t_Co != 256 && ! has("gui_running")
  echomsg ""
  echomsg "err: please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
  echomsg ""
  finish
endif

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "monoprint"

" --- Definitions --- "

"" General colors
"hi Normal       ctermfg=252 guifg=#d0d0d0 ctermbg=234 guibg=#1c1c1c cterm=none gui=none
hi Normal       ctermfg=0 guifg=#000000 ctermbg=15  guibg=#ffffff cterm=none gui=none
hi clear CursorColumn
"hi clear Cursor
hi clear CursorLine
"hi FoldColumn   ctermfg=248 guifg=#a8a8a8 ctermbg=bg  guibg=bg
"hi Folded       ctermfg=255 guifg=#eeeeee ctermbg=60  guibg=#323247
hi Folded       ctermfg=0  guifg=#000000 ctermbg=0  guibg=#ffffff  cterm=bold  gui=bold
"hi IncSearch    ctermfg=0   guifg=#000000 ctermbg=223 guibg=#ffdfaf cterm=none gui=none
hi NonText      ctermfg=bg guifg=bg
hi SpecialKey   ctermfg=bg guifg=bg
"hi Pmenu        ctermfg=0   guifg=#000000 ctermbg=246 guibg=#949494
"hi PmenuSbar                              ctermbg=243 guibg=#767676
"hi PmenuSel     ctermfg=0   guifg=#000000 ctermbg=243 guibg=#767676
"hi PmenuThumb                             ctermbg=252 guibg=#d0d0d0
"hi Search       ctermfg=0   guifg=#000000 ctermbg=149 guibg=#afdf5f
"hi SignColumn                             ctermbg=238 guibg=#262626
"hi StatusLine                             ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
"hi StatusLineNC                           ctermbg=237 guibg=#3a3a3a cterm=none gui=none
"hi TabLine      ctermfg=fg  guifg=fg      ctermbg=242 guibg=#666666 cterm=underline gui=underline
"hi TabLineFill  ctermfg=fg  guifg=fg      ctermbg=242 guibg=#666666 cterm=underline gui=underline
"hi VertSplit    ctermfg=237 guifg=#3a3a3a ctermbg=237 guibg=#3a3a3a cterm=none gui=none
"hi Visual       ctermfg=24  guifg=#005f87 ctermbg=153 guibg=#afdfff
"hi VIsualNOS    ctermfg=24  guifg=#005f87 ctermbg=153 guibg=#afdfff cterm=none gui=none
"hi WildMenu     ctermfg=0   guifg=#000000 ctermbg=184 guibg=#dfdf00 cterm=bold gui=bold
"hi SpecialKey               guifg=#363636
"hi NonText                  guifg=#363636

"" Syntax highlighting
hi Comment      ctermfg=247 guifg=#9e9e9e cterm=italic gui=italic
hi Constant     ctermfg=234 guifg=#1c1c1c cterm=bold gui=bold
hi clear Error
hi Error        ctermfg=234 guifg=#1c1c1c ctermbg=253 guibg=#dadada cterm=undercurl  gui=undercurl
hi clear ErrorMsg
hi ErrorMsg     ctermfg=234 guifg=#1c1c1c ctermbg=253 guibg=#dadada cterm=undercurl  gui=undercurl
hi clear WarningMsg
hi WarningMsg   ctermfg=234 guifg=#1c1c1c ctermbg=253 guibg=#dadada
hi Identifier   ctermfg=237 guifg=#3a3a3a
hi Ignore       ctermfg=238 guifg=#444444
hi LineNr       ctermfg=247 guifg=#9e9e9e
hi clear MatchParen
hi Number       ctermfg=243 guifg=#767676
hi PreProc      ctermfg=247 guifg=#9e9e9e cterm=bold gui=bold
hi Special      ctermfg=247 guifg=#9e9e9e cterm=bold gui=bold
hi Statement    ctermfg=234 guifg=#1c1c1c cterm=bold gui=bold
hi Todo         ctermfg=255 guifg=#ffffff ctermbg=235 guibg=#262626 cterm=bold gui=bold
hi Type         ctermfg=242 guifg=#666666 cterm=bold gui=bold
hi clear Underlined
hi Underlined   cterm=underline gui=underline
hi clear Title
hi Title        ctermfg=239 guifg=#4e4e4e cterm=bold,underline gui=bold,underline
