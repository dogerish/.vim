" Dogerish's personal vim color scheme, based on slate.
hi clear
set background=dark
let colors_name = "dogerish"

hi Comment          term=bold      cterm=NONE           ctermfg=Gray        ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Gray50         guibg=NONE      guisp=NONE
hi Constant         term=NONE      cterm=NONE           ctermfg=Brown       ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Orange         guibg=NONE      guisp=NONE
hi Cursor           term=NONE      cterm=NONE           ctermfg=NONE        ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Black          guibg=Khaki     guisp=NONE
hi CursorLine       term=underline cterm=underline      ctermfg=NONE        ctermbg=NONE       ctermul=NONE gui=underline guifg=NONE           guibg=NONE      guisp=NONE
hi CursorLineNr     term=bold      cterm=bold           ctermfg=Yellow      ctermbg=NONE       ctermul=NONE gui=bold      guifg=Khaki          guibg=NONE      guisp=NONE
hi Define           term=NONE      cterm=NONE           ctermfg=Yellow      ctermbg=NONE       ctermul=NONE gui=bold      guifg=Gold           guibg=NONE      guisp=NONE
hi DiffAdd          term=NONE      cterm=NONE           ctermfg=NONE        ctermbg=DarkGreen  ctermul=NONE gui=NONE      guifg=NONE           guibg=DarkGreen guisp=NONE
hi DiffChange       term=NONE      cterm=NONE           ctermfg=NONE        ctermbg=DarkBlue   ctermul=NONE gui=NONE      guifg=NONE           guibg=DarkBlue  guisp=NONE
hi DiffDelete       term=NONE      cterm=bold           ctermfg=Red         ctermbg=DarkRed    ctermul=NONE gui=NONE      guifg=Red            guibg=DarkRed   guisp=NONE
hi DiffText         term=NONE      cterm=bold           ctermfg=Black       ctermbg=Yellow     ctermul=NONE gui=NONE      guifg=Black          guibg=Yellow    guisp=NONE
hi Directory        term=NONE      cterm=NONE           ctermfg=DarkCyan    ctermbg=NONE       ctermul=NONE gui=NONE      guifg=NONE           guibg=NONE      guisp=NONE
hi Error            term=NONE      cterm=bold           ctermfg=LightGray   ctermbg=DarkRed    ctermul=NONE gui=NONE      guifg=White          guibg=Red       guisp=NONE
hi ErrorMsg         term=NONE      cterm=bold           ctermfg=LightGray   ctermbg=DarkRed    ctermul=NONE gui=NONE      guifg=White          guibg=Red       guisp=NONE
hi FoldColumn       term=NONE      cterm=NONE           ctermfg=Gray        ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Gray           guibg=NONE      guisp=NONE
hi Folded           term=NONE      cterm=NONE           ctermfg=Gray        ctermbg=DarkGray   ctermul=NONE gui=NONE      guifg=Gray           guibg=Gray30    guisp=NONE
hi Function         term=NONE      cterm=NONE           ctermfg=Brown       ctermbg=NONE       ctermul=NONE gui=NONE      guifg=NavajoWhite    guibg=NONE      guisp=NONE
hi Identifier       term=NONE      cterm=NONE           ctermfg=Red         ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Salmon         guibg=NONE      guisp=NONE
hi Ignore           term=NONE      cterm=bold           ctermfg=LightGray   ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Gray40         guibg=NONE      guisp=NONE
hi IncSearch        term=bold      cterm=NONE           ctermfg=Black       ctermbg=Green      ctermul=NONE gui=NONE      guifg=Black          guibg=Green     guisp=NONE
hi Include          term=NONE      cterm=NONE           ctermfg=Red         ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Red            guibg=NONE      guisp=NONE
hi LineNr           term=italic    cterm=NONE           ctermfg=DarkGray    ctermbg=NONE       ctermul=NONE gui=NONE      guifg=DarkGray       guibg=NONE      guisp=NONE
hi ModeMsg          term=NONE      cterm=NONE           ctermfg=Brown       ctermbg=NONE       ctermul=NONE gui=NONE      guifg=GoldenRod      guibg=NONE      guisp=NONE
hi MoreMsg          term=NONE      cterm=NONE           ctermfg=DarkGreen   ctermbg=NONE       ctermul=NONE gui=NONE      guifg=SeaGreen       guibg=NONE      guisp=NONE
hi NonText          term=NONE      cterm=bold           ctermfg=blue        ctermbg=NONE       ctermul=NONE gui=NONE      guifg=RoyalBlue      guibg=Gray15    guisp=NONE
hi Normal           term=NONE      cterm=NONE           ctermfg=NONE        ctermbg=NONE       ctermul=NONE gui=NONE      guifg=White          guibg=Gray15    guisp=NONE
hi Operator         term=NONE      cterm=NONE           ctermfg=Red         ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Red            guibg=NONE      guisp=NONE
hi PreProc          term=NONE      cterm=NONE           ctermfg=Red         ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Red            guibg=NONE      guisp=NONE
hi Question         term=NONE      cterm=NONE           ctermfg=Green       ctermbg=NONE       ctermul=NONE gui=NONE      guifg=SpringGreen    guibg=NONE      guisp=NONE
hi Search           term=NONE      cterm=NONE           ctermfg=Gray        ctermbg=Blue       ctermul=NONE gui=NONE      guifg=Wheat          guibg=Peru      guisp=NONE
hi Special          term=NONE      cterm=NONE           ctermfg=Brown       ctermbg=NONE       ctermul=NONE gui=NONE      guifg=DarkKhaki      guibg=NONE      guisp=NONE
hi SpecialKey       term=NONE      cterm=NONE           ctermfg=DarkGreen   ctermbg=NONE       ctermul=NONE gui=NONE      guifg=YellowGreen    guibg=NONE      guisp=NONE
hi SpellBad         term=reverse   cterm=underline      ctermfg=Red         ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Red            guibg=DarkRed   guisp=NONE
hi SpellErrors      term=NONE      cterm=bold           ctermfg=LightGray   ctermbg=DarkRed    ctermul=NONE gui=NONE      guifg=White          guibg=Red       guisp=NONE
hi Statement        term=NONE      cterm=NONE           ctermfg=LightBlue   ctermbg=NONE       ctermul=NONE gui=NONE      guifg=CornflowerBlue guibg=NONE      guisp=NONE
hi StatusLine       term=bold      cterm=bold           ctermfg=DarkMagenta ctermbg=Black      ctermul=NONE gui=bold      guifg=Magenta        guibg=Black     guisp=NONE
hi StatusLineNC     term=NONE      cterm=NONE           ctermfg=DarkCyan    ctermbg=Black      ctermul=NONE gui=NONE      guifg=Cyan           guibg=Black     guisp=NONE
hi StatusLineTerm   term=bold      cterm=bold           ctermfg=Green       ctermbg=Black      ctermul=NONE gui=bold      guifg=Green          guibg=Black     guisp=NONE
hi StatusLineTermNC term=NONE      cterm=NONE           ctermfg=DarkGreen   ctermbg=Black      ctermul=NONE gui=NONE      guifg=DarkGreen      guibg=Black     guisp=NONE
hi String           term=NONE      cterm=NONE           ctermfg=DarkCyan    ctermbg=NONE       ctermul=NONE gui=NONE      guifg=SkyBlue        guibg=NONE      guisp=NONE
hi Structure        term=NONE      cterm=NONE           ctermfg=Green       ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Green          guibg=NONE      guisp=NONE
hi TabLine          term=italic    cterm=NONE           ctermfg=NONE        ctermbg=DarkGray   ctermul=NONE gui=NONE      guifg=NONE           guibg=DarkGray  guisp=NONE
hi TabLineFill      term=NONE      cterm=NONE           ctermfg=NONE        ctermbg=DarkGray   ctermul=NONE gui=NONE      guifg=NONE           guibg=DarkGray  guisp=NONE
hi TabLineSel       term=NONE      cterm=bold           ctermfg=Magenta     ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Magenta        guibg=NONE      guisp=NONE
hi Title            term=NONE      cterm=bold           ctermfg=Yellow      ctermbg=NONE       ctermul=NONE gui=bold      guifg=Gold           guibg=NONE      guisp=NONE
hi Todo             term=standout  cterm=reverse        ctermfg=Yellow      ctermbg=NONE       ctermul=NONE gui=reverse   guifg=NONE           guibg=NONE      guisp=NONE
hi Type             term=NONE      cterm=NONE           ctermfg=Green       ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Green3         guibg=NONE      guisp=NONE
hi Underlined       term=NONE      cterm=underline      ctermfg=DarkMagenta ctermbg=NONE       ctermul=NONE gui=NONE      guifg=NONE           guibg=NONE      guisp=NONE
hi VertSplit        term=NONE      cterm=NONE           ctermfg=White       ctermbg=Black      ctermul=NONE gui=NONE      guifg=White          guibg=Black     guisp=NONE
hi Visual           term=NONE      cterm=reverse        ctermfg=NONE        ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Khaki          guibg=OliveDrab guisp=NONE
hi VisualNOS        term=NONE      cterm=bold,underline ctermfg=NONE        ctermbg=NONE       ctermul=NONE gui=NONE      guifg=NONE           guibg=NONE      guisp=NONE
hi WarningMsg       term=NONE      cterm=NONE           ctermfg=DarkRed     ctermbg=NONE       ctermul=NONE gui=NONE      guifg=Salmon         guibg=NONE      guisp=NONE
hi WildMenu         term=NONE      cterm=NONE           ctermfg=Black       ctermbg=DarkYellow ctermul=NONE gui=NONE      guifg=NONE           guibg=NONE      guisp=NONE

" vim: set ve=all tw=0:
