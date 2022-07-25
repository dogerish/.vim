vim9script

# lists sessions in sessions_dir
command -bar ListSessions
            \ echo 'Sessions in ' .. s:GetSesDir() .. " ->\n"
                \ .. ListSes('', '', 0)
# saves a session in sessions_dir
command -nargs=? -bang -bar -complete=custom,<SID>ListSes SaveSession
            \ execute 'mks' .. <q-bang> .. ' ' .. GetSesName(<f-args>)
# loads a session from sessions_dir
command -nargs=? -bar -complete=custom,<SID>ListSes LoadSession
            \ execute 'source ' .. GetSesName(<f-args>)
# deletes a session from sessions_dir
command -nargs=? -bar -complete=custom,<SID>ListSes DelSession
            \ delete(GetSesName(<f-args>))

function s:GetSesDir()
    if !exists("g:sessions_dir") || g:sessions_dir == ""
        let g:sessions_dir = $HOME .. '/.vim/sessions'
    endif
    if !isdirectory(g:sessions_dir)
        call mkdir(g:sessions_dir, 'p')
    endif
    if g:sessions_dir !~# '/$'
        let g:sessions_dir ..= '/'
    endif
    return g:sessions_dir
endfunction

function s:ListSes(arglead, cmdline, cursorpos)
    return readdir(s:GetSesDir())
                \ ->join("\n")
                \ ->substitute('\.vim\(\n\|$\)', '\1', 'g')
endfunction

def s:GetSesName(ses = ""): string
    if v:this_session != "" && ses == ""
        return v:this_session
    endif
    return s:GetSesDir()
                \ .. substitute(
                    \ ses ?? fnamemodify(getcwd(), ':t'),
                    \ '\.', '_', 'g'
                \ )
                \ .. '.vim'
enddef
