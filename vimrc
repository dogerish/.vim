source $VIMRUNTIME/defaults.vim
language message en_us
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" color scheme
set background=dark
colorscheme dogerish

filetype on
filetype plugin indent on
helptags ALL

" read 5 lines for modelines
set modelines=5

" Set up bindings for easy-align plugin
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
" add //-comment based alignment
let g:easy_align_delimiters = {
\ '/': {
    \ 'pattern': '//\+',
    \ 'delimiter_align': 'l',
    \ 'ignore_groups': ['!Comment']
    \ }
\ }

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
    syntax on
endif
" fix mac terminal italics issue
if &t_Co > 2 && has("macunix")
    let &t_ZH = "\e[3m"
    let &t_ZR = "\e[23m"
endif
" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
    packadd! matchit
endif
" load session manager
packadd! doggy-sessions

" don't redraw during macros
set lazyredraw

" don't wrap lines when they go off screen
set nowrap
" draw line at column just after textwidth
set colorcolumn=+1
set textwidth=79
" tabstop at 8, shift 4 spaces with < or >, and <tab> and <BS> add or delete 
" shiftwidth spaces. i use expandtab by default so that the visual line length 
" is consistent, making textwidth make sense on all platforms.
set tabstop=8 shiftwidth=4 softtabstop=-1 expandtab

" no more blinking cursor in gui
set guicursor=a:blinkon0
set guioptions=egm
" set gui font (yoinked from setting-guifont help tag)
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Luxi\ Mono\ 12
    elseif has("x11")
        " Also for GTK 1
        set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_win32")
        set guifont=Luxi_Mono:h12:cANSI
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h12
    endif
endif

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" :h fo-table
set formatoptions=croqwan2j
" don't join to use two spaces after end of sentence
set nojoinspaces
set spelllang=en_us,de
" indentation smartness
set copyindent autoindent
" only do one shiftwidth inside of unclosed paranthesis, and line up closing 
" parenthesis with indentation level of the matching one
set cinoptions+=(s,m1,:0
" read config files in current directory for project-specific settings
set exrc secure
" put space after comments for nerdcommenter
let g:NERDSpaceDelims=1

" bind arrow keys to visual line movements
noremap <Up> gk
noremap <Down> gj
" close help window
noremap <C-W>hc :helpclose<CR>

" escape sequence timeout to 5 seconds to reduce hanging
set ttimeoutlen=5

" collapse based on syntax with folds
set foldmethod=syntax
" not by default tho
set nofoldenable

" show line number and character numbers at bottom right
set ruler
" highlight which line the cursor is on
set cursorline
set cursorlineopt=screenline,number
" show incomplete commands
set showcmd
" show line with completion options
set wildmenu
" disable mouse usage for all modes
set mouse=

" backups and undo files in /tmp
set nobackup
set undofile
set undodir=$HOME/.vim/.undo
" make swap files
set swapfile

" match while typing, don't highlight
set incsearch
set ignorecase
" if a capital letter is included, use case sensitive
set smartcase
set nohls

" 2 lines more context before scrolling up
set scrolloff=2

" no beeping please
set novisualbell
set noerrorbells

" auto read when file changed outside of vim
set autoread

" always show status line
set laststatus=2
" allow switching buffers when unsaved changes exist
set hidden
" show line numbers
set number

" save only the buffers, window sizes, tab pages, and current directory of 
" session
set sessionoptions=buffers,winsize,tabpages,curdir

" highlight modelines
augroup GLOBALSYNTAX
    autocmd!
    autocmd Syntax * {
        syn match ModeLine
                    \ '^.*\%(vim\=\|ex\)\%(:\s*set\=\)\@!\%(:[^:]\+\)\+.*$'
                    \ contains=@NoSpell
        syn match ModeLine
                    \ '^.*\%(vi\|[vV]im\%([<=>]\=[0-9]\+\)\=\|ex\):\s*set\= .\+:.*$'
                    \ contains=@NoSpell
        hi def link ModeLine SpecialComment
        }
augroup END
                             " custom commands "
" commands for inserting a separator that spans the textwidth or 80 chars
def GetSep(char = "="): string
    return repeat(char, &tw ?? 80)
enddef
command! -nargs=? -bar Separator vim9cmd
            \ append(line('.') - 1, ['', GetSep(<f-args>)])
command! -nargs=? -bar SetSeparator vim9cmd setline('.', GetSep(<f-args>))
" paste the output of a command into a new tab
command! -nargs=* -complete=shellcmd TabCmd {
    tabe
    execute 'r !' .. <q-args>
    :1d
    }
" opens up header and implementation files with base name arg 1
command! -nargs=1 -complete=file OpenPair e <args>.h <bar> vsplit <args>.cpp
command! -nargs=1 -complete=file TabOpenPair tabe <bar> OpenPair <args>
