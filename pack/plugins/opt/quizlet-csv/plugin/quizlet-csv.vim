vim9script

command -bar -range=% QuizletToCSV
            \ call LinesToColumns(<line1>, <line2>)

def LinesToColumns(firstline: number, lastline: number)
    var lnum = firstline
    for i in range(lastline - firstline)
        if len(getline(lnum)) == 0
            deletebufline("%", lnum)
            continue
        endif
        if len(getline(lnum + 1)) > 0
            setline(lnum, getline(lnum) .. "|" .. getline(lnum + 1))
            deletebufline("%", lnum + 1)
            continue
        endif
        setline(lnum, getline(lnum) .. "|german::")
        lnum += 1
    endfor
    if len(getline(lnum)) == 0
        deletebufline("%", lnum)
    else
        setline(lnum, getline(lnum) .. "|german::")
    endif
enddef
