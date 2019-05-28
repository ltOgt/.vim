if exists("b:current_syntax")
	finish
endif

source ~/.vim/syntax/gid.vim

"============================================= Regex

"Sections
syn match litTag	"^\[\(tags\|toc\|summary\|notes\|refby\|refto\|litbib\)\]"

"Items
syn match litTODO	"TODO"
syn match litHARD	"HARD"

"============================================= Style

"Sections
hi def litTag		ctermfg=70 cterm=bold

"Items
hi def litTODO		ctermfg=15 ctermbg=131 cterm=bold
hi def litHARD		ctermfg=15 ctermbg=131 cterm=bold
