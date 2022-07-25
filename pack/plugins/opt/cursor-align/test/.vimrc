edit ../plugin/cursor-align.vim
vsplit testfile.txt
augroup TESTSESSION
    autocmd BufWritePost cursor-align.vim so ../plugin/cursor-align.vim
augroup END
