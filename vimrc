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

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
	syntax on
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

" don't redraw during macros
set lazyredraw

" don't wrap lines when they go off screen
set nowrap
" draw line at column just after textwidth
set colorcolumn=+1
set textwidth=79
set tabstop=4 shiftwidth=4

" no more blinking cursor in gui
set guicursor=a:blinkon0
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

set formatoptions=croqanj
set spelllang=en_us,de
" keep indent
set autoindent
set copyindent
autocmd FileType html     set ts=2 sw=2
autocmd FileType markdown set spell formatoptions+=t
autocmd BufRead,BufNewFile */evobot/* set expandtab ts=2 sw=2
" put space after comments for nerdcommenter
let g:NERDSpaceDelims=1

" bind arrow keys to visual line movements
noremap <Up> gk
noremap <Down> gj

" escape sequence timeout to 5 seconds to reduce hanging
set ttimeoutlen=5

" collapse based on syntax with folds
set foldmethod=syntax
autocmd FileType javascript set foldmethod=indent
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

" always show tab line
set showtabline=2
" show line numbers
set number

" save only the buffers, window sizes, tab pages, and current directory of session
set sessionoptions=buffers,winsize,tabpages,curdir

" custom commands
" paste the output of a command into a new tab
command! -nargs=* -complete=shellcmd TabCmd tabe | execute 'r !' . expand('<args>') | 1del
" opens up header and implementation files with base name arg 1
command! -nargs=1 -complete=file OpenPair e <args>.h <bar> vsplit <args>.cpp
command! -nargs=1 -complete=file TabOpenPair tabe <bar> OpenPair <args>
