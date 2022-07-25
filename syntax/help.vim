" Vim syntax file
" Language:	Vim help file
" Maintainer:	Bram Moolenaar (Bram@vim.org)
" Last Change:	2021 Jun 13

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match helpHeadline		"^[-A-Z .][-A-Z0-9 .()_]*\ze\(\s\+\*\|$\)" contains=@NoSpell
syn match helpSectionDelim	"^===.*===$" contains=@NoSpell
syn match helpSectionDelim	"^---.*--$" contains=@NoSpell
if has("conceal")
  syn region helpExample	matchgroup=helpIgnore start=" >$" start="^>$" end="^[^ \t]"me=e-1 end="^<" concealends contains=@NoSpell
else
  syn region helpExample	matchgroup=helpIgnore start=" >$" start="^>$" end="^[^ \t]"me=e-1 end="^<" contains=@NoSpell
endif
if has("ebcdic")
  syn match helpHyperTextJump	"\\\@<!|[^"*|]\+|" contains=helpBar,@NoSpell
  syn match helpHyperTextEntry	"\*[^"*|]\+\*\s"he=e-1 contains=helpStar,@NoSpell
  syn match helpHyperTextEntry	"\*[^"*|]\+\*$" contains=helpStar,@NoSpell
else
  syn match helpHyperTextJump	"\\\@<!|[#-)!+-~]\+|" contains=helpBar,@NoSpell
  syn match helpHyperTextEntry	"\*[#-)!+-~]\+\*\s"he=e-1 contains=helpStar,@NoSpell
  syn match helpHyperTextEntry	"\*[#-)!+-~]\+\*$" contains=helpStar,@NoSpell
endif
if has("conceal")
  syn match helpBar		contained "|" conceal contains=@NoSpell
  syn match helpBacktick	contained "`" conceal contains=@NoSpell
  syn match helpStar		contained "\*" conceal contains=@NoSpell
else
  syn match helpBar		contained "|" contains=@NoSpell
  syn match helpBacktick	contained "`" contains=@NoSpell
  syn match helpStar		contained "\*" contains=@NoSpell
endif
syn match helpNormal		"|.*====*|" contains=@NoSpell
syn match helpNormal		"|||" contains=@NoSpell
syn match helpNormal		":|vim:|"	" for :help modeline contains=@NoSpell
syn match helpVim		"\<Vim version [0-9][0-9.a-z]*" contains=@NoSpell
syn match helpVim		"VIM REFERENCE.*" contains=@NoSpell
syn match helpOption		"'[a-z]\{2,\}'" contains=@NoSpell
syn match helpOption		"'t_..'" contains=@NoSpell
syn match helpCommand		"`[^` \t]\+`"hs=s+1,he=e-1 contains=helpBacktick,@NoSpell
syn match helpCommand		"\(^\|[^a-z"[]\)\zs`[^`]\+`\ze\([^a-z\t."']\|$\)"hs=s+1,he=e-1 contains=helpBacktick,@NoSpell
syn match helpHeader		"\s*\zs.\{-}\ze\s\=\~$" nextgroup=helpIgnore contains=@NoSpell
syn match helpGraphic		".* \ze`$" nextgroup=helpIgnore contains=@NoSpell
if has("conceal")
  syn match helpIgnore		"." contained conceal contains=@NoSpell
else
  syn match helpIgnore		"." contained contains=@NoSpell
endif
syn keyword helpNote		note Note NOTE note: Note: NOTE: Notes Notes:
syn keyword helpWarning		WARNING WARNING: Warning:
syn keyword helpDeprecated	DEPRECATED DEPRECATED: Deprecated:
syn match helpSpecial		"\<N\>" contains=@NoSpell
syn match helpSpecial		"\<N\.$"me=e-1 contains=@NoSpell
syn match helpSpecial		"\<N\.\s"me=e-2 contains=@NoSpell
syn match helpSpecial		"(N\>"ms=s+1 contains=@NoSpell

syn match helpSpecial		"\[N]" contains=@NoSpell
" avoid highlighting N  N in help.txt
syn match helpSpecial		"N  N"he=s+1 contains=@NoSpell
syn match helpSpecial		"Nth"me=e-2 contains=@NoSpell
syn match helpSpecial		"N-1"me=e-2 contains=@NoSpell
syn match helpSpecial		"{[-a-zA-Z0-9'"*+/:%#=[\]<>.,]\+}" contains=@NoSpell
syn match helpSpecial		"\s\[[-a-z^A-Z0-9_]\{2,}]"ms=s+1 contains=@NoSpell
syn match helpSpecial		"<[-a-zA-Z0-9_]\+>" contains=@NoSpell
syn match helpSpecial		"<[SCM]-.>" contains=@NoSpell
syn match helpNormal		"<---*>" contains=@NoSpell
syn match helpSpecial		"\[range]" contains=@NoSpell
syn match helpSpecial		"\[line]" contains=@NoSpell
syn match helpSpecial		"\[count]" contains=@NoSpell
syn match helpSpecial		"\[offset]" contains=@NoSpell
syn match helpSpecial		"\[cmd]" contains=@NoSpell
syn match helpNormal		"vim9\[cmd]" contains=@NoSpell
syn match helpSpecial		"\[num]" contains=@NoSpell
syn match helpSpecial		"\[+num]" contains=@NoSpell
syn match helpSpecial		"\[-num]" contains=@NoSpell
syn match helpSpecial		"\[+cmd]" contains=@NoSpell
syn match helpSpecial		"\[++opt]" contains=@NoSpell
syn match helpSpecial		"\[arg]" contains=@NoSpell
syn match helpSpecial		"\[arguments]" contains=@NoSpell
syn match helpSpecial		"\[ident]" contains=@NoSpell
syn match helpSpecial		"\[addr]" contains=@NoSpell
syn match helpSpecial		"\[group]" contains=@NoSpell
" Don't highlight [converted] and others that do not have a tag
syn match helpNormal		"\[\(readonly\|fifo\|socket\|converted\|crypted\)]" contains=@NoSpell

syn match helpSpecial		"CTRL-." contains=@NoSpell
syn match helpSpecial		"CTRL-SHIFT-." contains=@NoSpell
syn match helpSpecial		"CTRL-Break" contains=@NoSpell
syn match helpSpecial		"CTRL-PageUp" contains=@NoSpell
syn match helpSpecial		"CTRL-PageDown" contains=@NoSpell
syn match helpSpecial		"CTRL-Insert" contains=@NoSpell
syn match helpSpecial		"CTRL-Del" contains=@NoSpell
syn match helpSpecial		"CTRL-{char}" contains=@NoSpell
syn region helpNotVi		start="{Vi[: ]" start="{not" start="{only" end="}" contains=helpLeadBlank,helpHyperTextJump,@NoSpell
syn match helpLeadBlank		"^\s\+" contained contains=@NoSpell

" Highlight group items in their own color.
syn match helpComment		"\t[* ]Comment\t\+[a-z].*" contains=@NoSpell
syn match helpConstant		"\t[* ]Constant\t\+[a-z].*" contains=@NoSpell
syn match helpString		"\t[* ]String\t\+[a-z].*" contains=@NoSpell
syn match helpCharacter		"\t[* ]Character\t\+[a-z].*" contains=@NoSpell
syn match helpNumber		"\t[* ]Number\t\+[a-z].*" contains=@NoSpell
syn match helpBoolean		"\t[* ]Boolean\t\+[a-z].*" contains=@NoSpell
syn match helpFloat		"\t[* ]Float\t\+[a-z].*" contains=@NoSpell
syn match helpIdentifier	"\t[* ]Identifier\t\+[a-z].*" contains=@NoSpell
syn match helpFunction		"\t[* ]Function\t\+[a-z].*" contains=@NoSpell
syn match helpStatement		"\t[* ]Statement\t\+[a-z].*" contains=@NoSpell
syn match helpConditional	"\t[* ]Conditional\t\+[a-z].*" contains=@NoSpell
syn match helpRepeat		"\t[* ]Repeat\t\+[a-z].*" contains=@NoSpell
syn match helpLabel		"\t[* ]Label\t\+[a-z].*" contains=@NoSpell
syn match helpOperator		"\t[* ]Operator\t\+["a-z].*" contains=@NoSpell
syn match helpKeyword		"\t[* ]Keyword\t\+[a-z].*" contains=@NoSpell
syn match helpException		"\t[* ]Exception\t\+[a-z].*" contains=@NoSpell
syn match helpPreProc		"\t[* ]PreProc\t\+[a-z].*" contains=@NoSpell
syn match helpInclude		"\t[* ]Include\t\+[a-z].*" contains=@NoSpell
syn match helpDefine		"\t[* ]Define\t\+[a-z].*" contains=@NoSpell
syn match helpMacro		"\t[* ]Macro\t\+[a-z].*" contains=@NoSpell
syn match helpPreCondit		"\t[* ]PreCondit\t\+[a-z].*" contains=@NoSpell
syn match helpType		"\t[* ]Type\t\+[a-z].*" contains=@NoSpell
syn match helpStorageClass	"\t[* ]StorageClass\t\+[a-z].*" contains=@NoSpell
syn match helpStructure		"\t[* ]Structure\t\+[a-z].*" contains=@NoSpell
syn match helpTypedef		"\t[* ]Typedef\t\+[Aa-z].*" contains=@NoSpell
syn match helpSpecial		"\t[* ]Special\t\+[a-z].*" contains=@NoSpell
syn match helpSpecialChar	"\t[* ]SpecialChar\t\+[a-z].*" contains=@NoSpell
syn match helpTag		"\t[* ]Tag\t\+[a-z].*" contains=@NoSpell
syn match helpDelimiter		"\t[* ]Delimiter\t\+[a-z].*" contains=@NoSpell
syn match helpSpecialComment	"\t[* ]SpecialComment\t\+[a-z].*" contains=@NoSpell
syn match helpDebug		"\t[* ]Debug\t\+[a-z].*" contains=@NoSpell
syn match helpUnderlined	"\t[* ]Underlined\t\+[a-z].*" contains=@NoSpell
syn match helpError		"\t[* ]Error\t\+[a-z].*" contains=@NoSpell
syn match helpTodo		"\t[* ]Todo\t\+[a-z].*" contains=@NoSpell

syn match helpURL `\v<(((https?|ftp|gopher)://|(mailto|file|news):)[^' 	<>"]+|(www|web|w3)[a-z0-9_-]*\.[a-z0-9._-]+\.[^' 	<>"]+)[a-zA-Z0-9/]` contains=@NoSpell

" Additionally load a language-specific syntax file "help_ab.vim".
let s:i = match(expand("%"), '\.\a\ax$')
if s:i > 0
  exe "runtime syntax/help_" . strpart(expand("%"), s:i + 1, 2) . ".vim"
endif

" Italian
if v:lang =~ '\<IT\>' || v:lang =~ '_IT\>' || v:lang =~? "italian"
  syn keyword helpNote		nota Nota NOTA nota: Nota: NOTA: notare Notare NOTARE notare: Notare: NOTARE:
  syn match helpSpecial		"Nma"me=e-2 contains=@NoSpell
  syn match helpSpecial		"Nme"me=e-2 contains=@NoSpell
  syn match helpSpecial		"Nmi"me=e-2 contains=@NoSpell
  syn match helpSpecial		"Nmo"me=e-2 contains=@NoSpell
  syn match helpSpecial		"\[interv.]" contains=@NoSpell
  syn region helpNotVi		start="{non" start="{solo" start="{disponibile" end="}" contains=helpLeadBlank,helpHyperTextJump,@NoSpell
endif

syn sync minlines=40


" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link helpIgnore		Ignore
hi def link helpHyperTextJump	Identifier
hi def link helpBar		Ignore
hi def link helpBacktick	Ignore
hi def link helpStar		Ignore
hi def link helpHyperTextEntry	String
hi def link helpHeadline	Statement
hi def link helpHeader		PreProc
hi def link helpSectionDelim	PreProc
hi def link helpVim		Identifier
hi def link helpCommand		Comment
hi def link helpExample		Comment
hi def link helpOption		Type
hi def link helpNotVi		Special
hi def link helpSpecial		Special
hi def link helpNote		Todo
hi def link helpWarning		Todo
hi def link helpDeprecated	Todo

hi def link helpComment		Comment
hi def link helpConstant	Constant
hi def link helpString		String
hi def link helpCharacter	Character
hi def link helpNumber		Number
hi def link helpBoolean		Boolean
hi def link helpFloat		Float
hi def link helpIdentifier	Identifier
hi def link helpFunction	Function
hi def link helpStatement	Statement
hi def link helpConditional	Conditional
hi def link helpRepeat		Repeat
hi def link helpLabel		Label
hi def link helpOperator	Operator
hi def link helpKeyword		Keyword
hi def link helpException	Exception
hi def link helpPreProc		PreProc
hi def link helpInclude		Include
hi def link helpDefine		Define
hi def link helpMacro		Macro
hi def link helpPreCondit	PreCondit
hi def link helpType		Type
hi def link helpStorageClass	StorageClass
hi def link helpStructure	Structure
hi def link helpTypedef		Typedef
hi def link helpSpecialChar	SpecialChar
hi def link helpTag		Tag
hi def link helpDelimiter	Delimiter
hi def link helpSpecialComment	SpecialComment
hi def link helpDebug		Debug
hi def link helpUnderlined	Underlined
hi def link helpError		Error
hi def link helpTodo		Todo
hi def link helpURL		String

let b:current_syntax = "help"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8 sw=2
