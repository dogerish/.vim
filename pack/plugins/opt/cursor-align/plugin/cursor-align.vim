" align to the right from the cursor onward
command -bar RightCur silent call <SID>RightAlign()

function s:GetTextWidth()
    return &tw == 0 ? 80 : &tw
endfunction
function s:InsertSpaces(n)
    " insert at least one space or as many as requested
    exe "norm! " .. (a:n > 0 ? a:n : 1) .. "i "
endfunction

function s:RightAlign()
    " go to beginning of spaces
    call search('\s\+\%#', 'bc')
    " remove leading spaces
    let l:col = col('.')
    :s/\%#\s*//e
    call cursor(0, l:col)
    " calculate length
    let l:partlen = getline('.')[col('.')-1:]->strdisplaywidth() - 1
    " insert number of spaces needed
    call s:InsertSpaces(s:GetTextWidth() - l:partlen - virtcol('.'))
endfunction
