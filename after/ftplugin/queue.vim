vim9script
nnoremap <buffer> <LocalLeader>n :QNext <bar> let b:last_q_oper = 'n'<CR>
nnoremap <buffer> <LocalLeader>a :QAdd  <bar> let b:last_q_oper = 'a'<CR>
# repeat last operation
nmap <buffer> <expr> <LocalLeader><LocalLeader>
			\ exists('b:last_q_oper') ? '<LocalLeader>' .. b:last_q_oper : ''

command -buffer -register -bar QNext
			\ echo QueueNext(<q-reg> ?? '+') | silent write
command -buffer -register -bar QAdd
			\ echo 'Added ' .. QueueAdd(<q-reg> ?? '+') | silent write

							   # queue saving #
var saves: list<dict<any>> = []
# List all saves
command -buffer -bar QSaveList echo Saves2String()
# QSaveAdd[!]
# Save queue state. If bang, overwrite the last existing state.
command -buffer -bang -bar QSaveAdd
			\ echo 'Saved in ' .. SaveBrief(SaveAdd(<q-bang>))
# QSaveRemove[!] [N]
# Remove save number N, or the last one. If bang, simply do nothing when the 
# save number is invalid.
command -buffer -bang -nargs=? -bar QSaveRemove
			\ echo 'Removed ' .. SaveBrief(SaveRemove(<q-bang>, <f-args>))
# Remove all saves
command -buffer -bar QSaveRemoveAll SaveRemoveAll() | echo 'Removed all'
# QSaveRestore[!] [N]
# Restore queue to state of last save or save number N. If bang, remove the 
# save after loading it.
command -buffer -bang -nargs=? -bar QSaveRestore
			\ echo 'Restored ' .. SaveBrief(SaveRestore(<q-bang>, <f-args>))

# returns the line that was copied
def QueueNext(reg: string): string
	var line = getline(1)
	setreg(reg, '!p ' .. line)
	silent execute ':1d'
	return line
enddef

# returns the number of lines added
def QueueAdd(reg: string): number
	var lines = getreg(reg)->trim()->split('\n')
				\ ->map('substitute(v:val, "&list=.*$", "", "")')
	if getline('$') == ""
		setline('$', lines[0])
		if len(lines) > 1
			append('$', lines[1 : ])
		endif
	else
		append('$', lines)
	endif
	return lines->len()
enddef

# returns list index from save number string (or the default number if the 
# string is empty), or -1 if it's invalid. when the index is 0 or lower, it 
# goes from the back (0 is the last element)
def IdToIndex(id: number): number
	if id <= 0
		return (saves->len() + id > 0) ? saves->len() - 1 + id : -1
	endif
	var index = 0
	for record in saves
		if record['id'] == id
			return index
		endif
		index += 1
	endfor
	return -1
enddef
# gets index from input string
def GetIndex(inp: string, default: number = 0): number
	return IdToIndex(inp == "" ? default : str2nr(inp))
enddef
# error message for invalid save number
const bad_save_n = 'Invalid save number'

def NewSave(): dict<any>
	return {
		'id': (saves->len() == 0 ? 1 : saves[-1]['id'] + 1),
		'f': tempname()
	}
enddef

def SaveDescr(saveObj: dict<any>): string
	return printf("#%d %s", saveObj['id'], saveObj['f'])
enddef
def SaveBrief(saveObj: dict<any>): string
	if saveObj != {}
		return '#' .. saveObj['id']
	endif
	return 'nothing'
enddef
def Saves2String(): string
	return saves->mapnew('SaveDescr(v:val)')->join("\n")
enddef

# returns the added save, or {}
def SaveAdd(bang: string): dict<any>
	if bang == ""
		saves->add(NewSave())
	endif
	if saves->len() > 0
		silent exe 'write!' saves[-1]['f']
		return saves[-1]
	endif
	throw 'No saves to be overwritten'
	return {}
enddef

# returns save that was deleted or {}
def SaveRemove(bang: string, inp: string = "0"): dict<any>
	var n = GetIndex(inp)
	if n >= 0
		var s = saves->remove(n)
		delete(s['f'])
		return s
	endif
	if bang == ""
		throw bad_save_n
	endif
	return {}
enddef

def SaveRemoveAll()
	for _ in range(saves->len())
		SaveRemove("")
	endfor
enddef

# returns the restored save
def SaveRestore(bang: string, inp: string = "0"): dict<any>
	var num = GetIndex(inp)
	if num == -1
		throw bad_save_n
	endif
	var s = saves[num]
	silent :%delete _
	var lines = readfile(s['f'])
	setline(1, lines[0])
	append(1, lines[1 : ])
	if bang != ""
		SaveRemove("", inp)
	endif
	return s
enddef


					 # Automatic actions for the script #
# Save initial state
SaveAdd("")

augroup Queue
	autocmd!
	# Remove all saves when the buffer is destroyed
	autocmd BufUnload,BufDelete <buffer> SaveRemoveAll()
augroup END
