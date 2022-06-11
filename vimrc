source $VIMRUNTIME/defaults.vim
filetype plugin on

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
	syntax on
endif
filetype on
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

" draw line at column 100
set cc=100

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" keep indent
set autoindent
set copyindent
" do be so smart
filetype indent on
autocmd FileType html     set ts=2 sw=2
autocmd FileType markdown set spell
autocmd BufRead,BufNewFile */evobot/* set expandtab ts=2 sw=2

" visual line movement (for line wrapping)
nnoremap <C-K> gk
nnoremap <C-J> gj

" collapse based on syntax with folds
set foldmethod=syntax
autocmd FileType javascript set foldmethod=indent
" not by default tho
set nofoldenable

" show line number and character numbers at bottom right
set ruler
" highlight which line the cursor is on
set cursorline
" show incomplete commands
set showcmd
" show line with completion options
set wildmenu
" enable mouse usage for all modes
set mouse=a

" backups and undo files in /tmp
set backup
set backupdir=/tmp/
set undofile
set undodir=/tmp/
" make swap files
set swapfile

" match while typing, don't highlight
set incsearch
set ignorecase
" if a capital letter is included, use case sensitive
set smartcase
set nohls

" color scheme
set background=dark
colorscheme mine

" 2 lines more context before scrolling up
set scrolloff=2

" no beeping please
set novisualbell
set noerrorbells

" auto read when file changed outside of vim
set autoread

" always show tab line
set showtabline=2

" save only the buffers, window sizes, tab pages, and current directory of session
set sessionoptions=buffers,winsize,tabpages,curdir

" custom commands
" opens up header and implementation files with base name arg 1
command! -nargs=1 -complete=file OpenPair e <args>.h <bar> vsplit <args>.cpp
command! -nargs=1 -complete=file TabOpenPair tabe <bar> OpenPair <args>