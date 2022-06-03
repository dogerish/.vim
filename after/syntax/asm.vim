" highlight ALGO
syn keyword AlgoMarker ALGO containedin=asmComment contained
hi AlgoMarker term=bold ctermfg=green ctermbg=NONE

" highlight 32bit, 64bit, and special registers
syn match asm64Register /x\d\d*/
syn keyword asmSpecialRegister sp fp lr pc
syn match asm32Register /w\d\d*/

hi asm64Register ctermfg=gray
hi def link asmSpecialRegister asm64Register
hi asm32Register ctermfg=brown
