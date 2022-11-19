vim9script

# lists sessions in sessions_dir
command -bar ListSessions
            \ echo 'Sessions in ' .. GetSesDir() .. " ->\n"
                \ .. ListSes('', '', 0)
# saves a session in sessions_dir
command -nargs=? -bang -bar -complete=custom,ListSes SaveSession
            \ execute 'mks' .. <q-bang> .. ' ' .. GetSesName(<f-args>)
# loads a session from sessions_dir
command -nargs=? -bar -complete=custom,ListSes LoadSession
            \ execute 'source ' .. GetSesName(<f-args>)
# deletes a session from sessions_dir
command -nargs=? -bar -complete=custom,ListSes DelSession
            \ delete(GetSesName(<f-args>))

def GetSesDir(): string
    if !exists("g:sessions_dir") || g:sessions_dir == ""
        g:sessions_dir = $HOME .. '/.vim/sessions'
    endif
    if !isdirectory(g:sessions_dir)
        mkdir(g:sessions_dir, 'p')
    endif
    if g:sessions_dir !~# '/$'
        g:sessions_dir ..= '/'
    endif
    return g:sessions_dir
enddef

def ListSes(arglead: string, cmdline: string, cursorpos: number): string
    return readdir(GetSesDir())
                \ ->join("\n")
                \ ->substitute('\.vim\(\n\|$\)', '\1', 'g')
enddef

def GetSesName(ses = ""): string
    if v:this_session != "" && ses == ""
        return v:this_session
    endif
    return GetSesDir()
                \ .. substitute(
                    \ ses ?? fnamemodify(getcwd(), ':t'),
                    \ '\.', '_', 'g'
                \ )
                \ .. '.vim'
enddef
