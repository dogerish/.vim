" add spell check and autoformat on textwidth
setlocal spell formatoptions+=t

				   " keybinds for bolding and italicizing "
let s:markdown_types = {
				\ 'bold': #{ pat: '\*\*', ins: '**' },
				\ 'italic': #{ pat: '\*\ze[^*]\?', ins: '*' }
			\ }
vnoremap <silent> <buffer> <C-B> <Esc>:call ActivateMarkdown('bold')<CR>
vnoremap <silent> <buffer> <C-S> <Esc>:call ActivateMarkdown('italic')<CR>
nnoremap <silent> <buffer> <C-B> :set opfunc=MarkdownOpBold<CR>g@
nnoremap <silent> <buffer> <C-S> :set opfunc=MarkdownOpItalic<CR>g@
nmap <silent> <buffer> <C-B><C-B> <C-B>iW
nmap <silent> <buffer> <C-S><C-S> <C-S>iW
imap <buffer> <C-B> <Esc><C-B><C-B>gi
imap <buffer> <C-S> <Esc><C-S><C-S>gi

function MarkdownOpBold(type)
	call MarkdownOpFunc('bold')
endfunction
function MarkdownOpItalic(type)
	call MarkdownOpFunc('italic')
endfunction
function MarkdownOpFunc(type)
	norm! `[v`]v
	call ActivateMarkdown(a:type)
endfunction

function s:isActive(type, marker, direction)
	let l:col = col(a:marker)
	let l:lnum = line(a:marker)
	for l:i in range(2)
		if l:col == 0 || l:col == col('$') || synID(l:lnum, l:col, 0)->synIDattr("name") !~? a:type
			return 0
		endif
		let l:col += a:direction
	endfor
	return 1
endfunction

" TODO: Deactivate and toggle
function ActivateMarkdown(type)
	let l:marker = "'<"
	let [l:sline, l:scol] = [line("'<"), col("'<")]
	let [l:eline, l:ecol] = [line("'>"), col('$') - col("'>")]
	let [l:open, l:close] = [!s:isActive(a:type, "'<", -1), !s:isActive(a:type, "'>", 1)]
	" remove all existing markers
	exe ':s/\%V' .. s:markdown_types[a:type]['pat'] .. '//Ieg'
	" mark as needed
	if l:open
		let l:toins = s:markdown_types[a:type]['ins']
		call cursor(l:sline, l:scol)
		silent exe "norm! i" .. l:toins
	endif
	if l:close
		call cursor(l:eline, col('$') - l:ecol)
		silent exe "norm! a" .. s:markdown_types[a:type]['ins']
	endif
endfunction
