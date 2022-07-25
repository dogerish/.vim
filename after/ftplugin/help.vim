" don't hide markers
setlocal conceallevel=0
if &modifiable == 1
    runtime! ftplugin/text.vim
    packadd cursor-align
else
    setlocal cc=
endif
