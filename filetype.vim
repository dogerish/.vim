if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    autocmd! BufRead,BufNewFile queue.txt setfiletype queue
    autocmd! BufRead,BufNewFile vocab.csv setfiletype vocab
augroup END
