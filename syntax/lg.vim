" Vim syntax file
" Language: Note Markup Language
" Maintainer: Gian-Luca Fuhrmann
" Latest Revision: 26 July 2017

if exists("b:current_syntax")
	finish
endif

"MEANIG:
"
"nmlTags:		Tags (CONT / MAPS / LOGS)
"nmlTimeDrt:		1453 etc
"nmlTimeStd:		1430 etc
"nmlLog:		Reference to .log
"nmlComment:		Comment
"
"nmlPointRoot:		2nd column point (+-...)
"nmlPointChild:		3+i column point (+-...)
"nmlPointChildA:	Arrow (-> / --> / ..)
"nmlPointLinkC:		> in 1st column (ref to CONT)
"nmlPointC:		CONT point (>)
"nmlPointT:		Todo [ ] open
"nmlPointTD:		Todo [x] done
"nmlPointTQ:		Todo [?] unsure
"nmlPointTP:		Todo [p] postponed
"nmlPointTM:		Todo [*] marked
"
"nmlRR:			normal reference like 		{:FILE:SECTION:POINT:name:}
"nmlRF:			file reference like		{::FILE::}
"nmlRN:			reference conector ("n"ext)	{:...:}{&}{:...:}
"nmlRM:			reference Mapping (REFS)	{:...:}{>}{{...}}
"nmlRK:			reference keyword (maped)	{{KEYWORD}}
"
"nmlJP:			jump point <§§>
"nmlHL			high Light			:WORD:

"Keywords
syn match nmlTags "^CONT"
syn match nmlTags "^LOGS"
syn match nmlTags "^MAPS"
"Dirty Time 1234 etc
syn match nmlTimeDrt "^[01][0123456789][012345][0123456789]"
syn match nmlTimeDrt "^2[0123][012345][0123456789]"
"Std Time 1200 / 1230 etc
syn match nmlTimeStd "^[01][0123456789][03]0"
syn match nmlTimeStd "^2[0123][03]0"

syn match nmlLog "^\t[01][0123456789][012345][0123456789]:"
syn match nmlLog "^\t2[0123][012345][0123456789]:"

"Comments
syn match nmlComment "# .*$" ""
syn match nmlComment "^#::.*$" ""

"Points
syn match nmlPointRoot "^\t[+\-?tci~]"
syn match nmlPointChild "^\t\{2,}[+\-?tc§i~]"
syn match nmlPointChildA "^\t\{1,}\(-\|=\)\+>"
syn match nmlPointLinkC "^>\t\+[+\-?tc]"
syn match nmlPointC "^\t> "
syn match nmlPointT "^\t\+\[ \]\t"
syn match nmlPointTD "^\t\+\[x\]\t"
syn match nmlPointTQ "^\t\+\[?\]\t"
syn match nmlPointTP "^\t\+\[p\]\t"
syn match nmlPointTM "^\t\+\[\*\]\t"

"Refs	[^] -> every char not in there 	TODO: phase out basic regex, fix
"complex and thus allow for nmlRK inside others like nmlRF etc
syn match nmlRR "{:\([^:{]*|{{[a-zA-Z_\-0-9]}}\)[^{}]*[^:}]*:}"
"syn match nmlRR "{:\([a-zA-Z0-9/_\-]\+:\){0,1}\([a-zA-Z0-9\s-_]\+:\){1}\([0-9]+[+\-tc>]*\(\.{0,1}\[0-9]+)\)*:\){1}\([^{}:]*\):}"
"		   |----------PATH-----------|----------TAG-----------|---------POINT---'----SubPOINT------'------|--TITLE--|
"syn match nmlRF "{::[^{}:]*::}"
syn match nmlRF "{::\([^{}:\\]\|{{[^:{}/\\]*}}\)*::}"
syn match nmlRN "{&}"
syn match nmlRM "{>}"
syn match nmlRK "{{[^:{}/\\]*}}"
syn match nmlJP "<§§>"
syn match nmlHL ":[a-zA-Z0-9\-_]\+:"



"HIGHLIGHTS==========================
"https://jonasjacek.github.io/colors/
let b:current_syntax = "lg"


"Sections
hi def link nmlTags	Statement
hi def link nmlTimeStd	Statement
hi def link nmlTimeDrt	Todo

"References
hi def nmlLog		ctermfg=70 
hi def nmlRR		ctermfg=70
hi def nmlRF		ctermfg=70
hi def nmlRN		ctermfg=93
hi def nmlRM		ctermfg=93
hi def nmlRK		ctermfg=70

hi def nmlJP		ctermfg=70
hi def nmlHL		ctermfg=70

"Comments
hi def link nmlComment	Comment

"Lines
hi def nmlPointRoot	ctermfg=70
hi def nmlPointChild	ctermfg=70
hi def nmlPointChildA	ctermfg=70
hi def nmlPointLinkC	ctermfg=70
hi def nmlPointC	ctermfg=70
hi def nmlPointT	ctermfg=226
hi def nmlPointTD	ctermfg=70
hi def nmlPointTQ	ctermfg=70
hi def nmlPointTP	ctermfg=70
hi def nmlPointTM	ctermfg=70


"COLOR-PROFILES
"BELLO:
"	IMPORTANT------->LESS
"	red:	213, 205, 199
"	green:	191, 185, 178
"	blue:	159, 153, 147
"	yellow:	220 / 226, 208, 202
"
