" Dogerish's personal vim color scheme, based on slate.
hi clear
set background=dark
let colors_name = "dogerish"
"" Group            term           cterm                ctermfg             ctermbg             ctermul       gui           guifg                guibg           guisp
hi Normal                                                                                                                   guifg=White          guibg=Gray15
hi VertSplit                       cterm=NONE           ctermfg=White       ctermbg=Black                     gui=NONE      guifg=White          guibg=Black
hi Folded                                               ctermfg=Gray        ctermbg=DarkGray                                guifg=Gray           guibg=Gray30
hi FoldColumn                                           ctermfg=Gray        ctermbg=NONE                                    guifg=Gray           guibg=NONE
hi IncSearch        term=bold      cterm=NONE           ctermfg=Black       ctermbg=Green                                   guifg=Black          guibg=Green
hi ModeMsg                         cterm=NONE           ctermfg=Brown                                                       guifg=GoldenRod
hi MoreMsg                                              ctermfg=DarkGreen                                                   guifg=SeaGreen
hi NonText                         cterm=bold           ctermfg=blue                                                        guifg=RoyalBlue      guibg=Gray15
hi Question                                             ctermfg=Green                                                       guifg=SpringGreen
hi Search                          cterm=NONE           ctermfg=Gray        ctermbg=Blue                                    guifg=Wheat          guibg=Peru
hi SpecialKey                                           ctermfg=DarkGreen                                                   guifg=YellowGreen
hi StatusLine       term=bold      cterm=bold           ctermfg=DarkMagenta ctermbg=Black                     gui=bold      guifg=Magenta        guibg=Black
hi StatusLineNC                    cterm=NONE           ctermfg=DarkCyan    ctermbg=Black                     gui=NONE      guifg=Cyan           guibg=Black
hi StatusLineTerm   term=bold      cterm=bold           ctermfg=Green       ctermbg=Black                     gui=bold      guifg=Green          guibg=Black
hi StatusLineTermNC                cterm=NONE           ctermfg=DarkGreen   ctermbg=Black                                   guifg=DarkGreen      guibg=Black
hi TabLine          term=italic    cterm=italic         ctermfg=Green                                         gui=italic    guifg=Green
hi TabLineFill                                          ctermfg=DarkGray                                                    guifg=DarkGray
hi TabLineSel                                           ctermfg=Magenta                                                     guifg=Magenta
hi Title                           cterm=bold           ctermfg=Yellow                                        gui=bold      guifg=Gold
hi Statement                                            ctermfg=LightBlue                                     gui=NONE      guifg=CornflowerBlue
hi Visual                          cterm=reverse                                                              gui=NONE      guifg=Khaki          guibg=OliveDrab
hi WarningMsg                                           ctermfg=DarkRed                                                     guifg=Salmon
hi String                                               ctermfg=DarkCyan                                                    guifg=SkyBlue
hi Comment          term=bold                           ctermfg=Gray                                                        guifg=Gray50
hi Constant                                             ctermfg=Brown                                                       guifg=Brown
hi Special                                              ctermfg=Brown                                                       guifg=DarkKhaki
hi Identifier                                           ctermfg=Red                                                         guifg=Salmon
hi Include                                              ctermfg=Red                                                         guifg=Red
hi PreProc                                              ctermfg=Red                                                         guifg=Red
hi Operator                                             ctermfg=Red                                                         guifg=Red
hi Define                                               ctermfg=Yellow                                        gui=bold      guifg=Gold
hi Type                                                 ctermfg=Green                                         gui=NONE      guifg=Green3
hi Function                                             ctermfg=Brown                                                       guifg=NavajoWhite
hi Structure                                            ctermfg=Green                                                       guifg=Green
hi LineNr           term=italic                         ctermfg=DarkGray                                                    guifg=DarkGray
hi Cursor                                                                                                     gui=NONE      guifg=Black          guibg=Khaki
hi CursorLine       term=underline cterm=underline                                                            gui=underline                      guibg=NONE
hi CursorLineNr     term=bold      cterm=bold           ctermfg=Yellow                                        gui=bold      guifg=Khaki
hi Ignore                          cterm=bold           ctermfg=LightGray                                                   guifg=Gray40
hi Todo             term=standout  cterm=reverse        ctermfg=Yellow      ctermbg=NONE                      gui=reverse
hi Directory                                            ctermfg=DarkCyan
hi ErrorMsg                        cterm=bold           ctermfg=LightGray   ctermbg=DarkRed                                 guifg=White          guibg=Red
hi VisualNOS                       cterm=bold,underline
hi WildMenu                                             ctermfg=Black       ctermbg=DarkYellow
hi DiffAdd                                                                  ctermbg=DarkBlue
hi DiffChange                                                               ctermbg=DarkMagenta
hi DiffDelete                      cterm=bold           ctermfg=DarkBlue    ctermbg=DarkCyan
hi DiffText                        cterm=bold                               ctermbg=DarkRed
hi Underlined                      cterm=underline      ctermfg=DarkMagenta
hi Error                           cterm=bold           ctermfg=LightGray   ctermbg=DarkRed                                 guifg=White          guibg=Red
hi SpellErrors                     cterm=bold           ctermfg=LightGray   ctermbg=DarkRed                                 guifg=White          guibg=Red
hi SpellBad         term=reverse   cterm=underline      ctermfg=Red         ctermbg=NONE                                    guifg=Red            guibg=DarkRed
