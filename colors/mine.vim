runtime colors/slate.vim
let colors_name = "mine"

" make tab bar less intense
hi TabLineFill ctermfg=DarkGray guifg=DarkGray
hi TabLineSel ctermfg=Magenta guifg=Magenta
hi TabLine term=italic cterm=italic ctermfg=Green gui=italic guifg=Lime

" make status lines less intense as well
" magenta on black
hi StatusLine term=bold cterm=bold ctermfg=DarkMagenta ctermbg=Black gui=bold guifg=Magenta guibg=Black
" dark cyan on black
hi StatusLineNC cterm=NONE ctermfg=DarkCyan ctermbg=Black guifg=Cyan guibg=Black
" bold green on black
hi StatusLineTerm term=bold cterm=bold ctermfg=Green ctermbg=Black gui=bold guifg=Green guibg=Black
" dark green on black
hi StatusLineTermNC cterm=NONE ctermfg=DarkGreen ctermbg=Black guifg=DarkGreen guibg=Black
" highlight instead of underline cursorline
hi CursorLine term=underline cterm=underline gui=underline

" make vertical splitter less intense; white on black
hi VertSplit cterm=NONE ctermbg=Black ctermfg=White guibg=Black guifg=White

" make search while typing readable
hi IncSearch term=bold cterm=NONE ctermbg=Green ctermfg=Black guibg=Green guifg=Black
" misspelling highlighting
hi SpellBad term=reverse cterm=underline ctermbg=none ctermfg=Red guibg=DarkRed guifg=Red

" so that todo highlight doesn't get blacked out by cursorline
hi Todo term=standout cterm=reverse ctermfg=yellow ctermbg=NONE
