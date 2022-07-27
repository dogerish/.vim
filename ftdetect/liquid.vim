" set markdown files starting with '---' to be liquid files (detects the jekyll 
" header)
autocmd! BufRead * {
    if &filetype == 'markdown' && getline(1) == '---'
        set filetype=liquid
    endif
    }
