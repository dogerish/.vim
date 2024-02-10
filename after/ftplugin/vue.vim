" add @ character to filename recognition
set isfname+=@-@
" replace @ with src when finding file
set includeexpr=substitute(v:fname,'@','src','')
" don't indent after script tag
let b:html_indent_script1 = "zero"
" only indent one level for open tags
let b:html_indent_attribute = 1
" indent 2 spaces
set tabstop=2 shiftwidth=2 expandtab
