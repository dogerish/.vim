" use jq for formatting json
if executable("jq")
	setlocal formatprg=jq
endif
