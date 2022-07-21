if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	autocmd! BufRead,BufNewFile queue.txt setfiletype queue
augroup END
