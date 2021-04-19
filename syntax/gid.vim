" Vim syntax file
" Language: 		GID notetaking structuring for ascii-files
" Maintainer: 		Gian-Luca Fuhrmann
" Init:			2017-11-21
" Latest Revision: 	2018-10-24
" Reference:		http://vimdoc.sourceforge.net/htmldoc/syntax.html#:syn-pattern
"
"	Inspired by previous efforts to organize my life [see .lg] and by
"	constructs like markdown and latex.
"	The aim of this syntax is to provide the possibility to generate
"	html / latex->pdf / ... but also have the source be as structured and
"	visually pleasing as possible

if exists("b:current_syntax")
	finish
endif

"MEANING:
"
"TOPIC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Sub-Topic
"	'''''''''
"		>  Point
"		:= Definition
"		^=  Equal Meaning
"		-> Follow
"		=> Conclusion
"		-- Option / Type
"		+  Pro
"		-  Contra
"		:  Explenation
"		i  Info / Note
"		.  Side-Note
"		!  Important
"		(  Relativation  )
"		n) Enumeration
"		§  Example
"		$  Command-example
"		>> Code-example
"		:: Code-output
"		// (internet) source
"		?  Question
"		⚡  Error / Problem
"			= Solution
"		<  Counter-Point, Alternative
"		x  Condition
"		/  oposite, difference
"		00 overview
"		e  is element of parent
"		E  parent of previous points
"		~  Maybe / Approximation / Like
"		0  Goal/Aim/Focus
"		^  claim
"		*  reference
"		°  Idea
"		|- (Sub-)Directory
"		<- Reason
"		#  Innerff-Document Reference
"			{TAG}
"		¬ not  (AltGr+6)
"		!= not
"		d Date
"		v Location
"		{ inline p.s. }
"		~[inline concept definition]
"		*[inline concept reference]
"
"		_underline_
"		italic´
"		:this is bold:
"		´multiple italic´
"		reference** to other mention of reference**
"		!!!
"		 IMPORTANT
"		!!!
"!		IMPORTANT
"?		QUESTION
"
"		Reference	(123ff / (p123 / (s123 / (1.2.3 / (vii.1.2.3 / (++
"					//*plus plus used for tangents in lectures*//
"[ ] 		Tudu
"		.*(?).*	Not sure, need to check
"**		Comment
"**<	Multi-line-comment-start
"**>	Multi-line-comment-end
"ii		Meta-Note
"		TODO
"		[ABREV]~

"________________________________
"
" OUTSOURCE THE FOLLOWING:
"
" 	Todo [ ] open
" 	Todo [x] done
" 	Todo [?] unsure
" 	Todo [p] postponed
" 	Todo [*] marked
" 	Todo [!] important
" 	Todo [N] declined
" 	Todo [A] aborted
"________________________________
"________________________________
"
" NON OF THESE USED ≙ LINEBREAK
"________________________________

"Sections
syn match gidTopic	"^.\{1,}\n\"\{3,}$"
syn match gidSubTopic	"^\t\{1}.\{1,}\n\t\{1}\'\{3,}$"
syn match gidSubTopic2	"^\t\{2}.\{1,}\n\t\{2}°\{3,}$"
syn match gidSubTopic3	"^\t\{2}.\{1,}\n\t\{2}\*\{3,}$"
syn match gidSubTopic4	"^\t\{2}.\{1,}\n\t\{2}\^\{3,}$"

"Points
syn match gidPoint	"^\t*>\s"
syn match gidDef	"^\t*:=\s"
syn match gidEql	"^\t*\^=\s"
syn match gidFol	"^\t*->\s"
syn match gidFolInl	"\t*->\s"
syn match gidConc	"^\t*=>\s"
syn match gidOptTyp	"^\t*--\s"
syn match gidPro	"^\t*+\s"
syn match gidCont	"^\t*-\s"
syn match gidExpl	"^\t*:\s"
syn match gidInf	"^\t*i\s"
syn match gidNote	"^\t*\.\s"
syn match gidImp	"^\t*!\s"
syn match gidRel	"\(^\t\+(\s\)\|\([ ]\{1})\s*$\)"
syn match gidEnum	"^\t*[0-9A-Za-z]\+)\s"
syn match gidExmpl	"^\t*§\s"
syn match gidCmd	"^\t*$\s"
syn match gidCode	"^\t*>>\s"
syn match gidCOut	"^\t*::\s"
syn match gidISrc	"^\t*//\s"
syn match gidQuest	"^\t*?\s"
syn match gidProb	"^\t*⚡\s"
syn match gidProb2	"^\t*S\s"
syn match gidSol	"^\t\+=\s"
syn match gidCPoint	"^\t*<\s"
syn match gidCond	"^\t*x\s"
syn match gidDiff	"^\t*/\s"
syn match gidOver	"^\t*00\s"
syn match gidIsEle	"^\t*e\s"
syn match gidIsPar	"^\t*E\s"
syn match gidClaim	"^\t*^\s"
syn match gidMaybe	"^\t*\~\s"
syn match gidGoal	"^\t*0\s"
syn match gidRef	"^\t*\*\s"
syn match gidIDRef	"^\t*#\s"
syn match gidIdea	"^\t*°\s"
syn match gidDir	"^\t*|-\s"
syn match gidRes	"^\t*<-\s"
syn match gidNot	"^\t*¬\s"
syn match gidNot2	"^\t*!=\s"
syn match gidDate	"^\t*d\s"
syn match gidLocation	"^\t*v\s"

syn match gidAbrev	"\[[^\[\]\n\t ]\+\]\~"

"Style
syn match gid_s_UL	"_[A-Za-zß\-äüö0-9 ]\+_"
"syn match gid_s_UL	"_[^_\s\n]\+_" "make sure that preceded/succedet by space
syn match gid_s_IT	"[A-Za-zß\-äüöÄÜÖ0-9,]\+´"
syn match gid_s_MulIT	"´[A-Za-zß\-äüöÄÜÖ0-9(), ]\+´"
syn match gid_s_BOLD	":[A-Za-zß\-äüöÄÜÖ0-9][^:\n]*[A-Za-zß\-äüö0-9]:"
syn match gid_s_IMP	"[!]\{3}\([^!]\+\|\n\|\([^!]!\([^!]\|\n\)\)\)\+[!]\{3}"
syn match gid_s_IMPl	"^!.*$"
syn match gid_s_REF	"[^ \s\n\t]\+\*\*"
syn match gid_s_Q	"^?"
syn match gid_s_Q_line	"^?.*$"
syn match gid_s_Q_inline	"(?)"

"Meta
syn match gid_m_PAGE	"([ps]\{0,1}\([vixmVIXM]\|\.\|[0-9]\|++\)\+[f]\{0,2}$"
syn match gid_m_TUDU	"^\[ \].*$"
syn match gid_m_CMNT	"\*\*[ \t].*$"
syn match gid_m_CMNT_ml	"^\*\*<\([^\(\*\*>\)]\|[\n]\)*\(\*\*>\)\{0,1}"
syn match gid_m_NOTE	"^ii[ \t].*$"
syn match gid_m_TODO	"TODO"
syn match gid_m_TAG		"{[^\[\]\n\t ,.;:]\+}"
syn match gid_m_ADD		"{ [^\[\]\n\t,.;:{}]\+ }"
syn match gid_m_CDEF  "\*\[[^\[\]\n\t,.;:{}]\+\]"
syn match gid_m_CREF  "\~\[[^\[\]\n\t,.;:{}]\+\]"


"OUTSOURCE
syn match nmlPointT "^\t\+\[ \]\t"
syn match nmlPointTD "^\t\+\[x\]\t"
syn match nmlPointTQ "^\t\+\[?\]\t"
syn match nmlPointTP "^\t\+\[p\]\t"
syn match nmlPointTM "^\t\+\[\*\]\t"
syn match nmlPointTI "^\t\+\[\!\]\t"
syn match nmlPointTN "^\t\+\[N\]\t"
syn match nmlPointTA "^\t\+\[A\]\t"


"HIGHLIGHTS==========================
"https://jonasjacek.github.io/colors/
let b:current_syntax = "lg"


"Sections
hi def gidTopic		ctermfg=70 cterm=bold
hi def gidSubTopic	ctermfg=70
hi def gidSubTopic2	ctermfg=70
hi def gidSubTopic3	ctermfg=70
hi def gidSubTopic4	ctermfg=70


"Items
hi def gidPoint		ctermfg=70
hi def gidDef		ctermfg=70
hi def gidEql		ctermfg=70
hi def gidFol		ctermfg=70
hi def gidFolInl	ctermfg=70
hi def gidConc		ctermfg=70
hi def gidOptTyp	ctermfg=70
hi def gidPro		ctermfg=70
hi def gidCont		ctermfg=red
hi def gidExpl		ctermfg=70
hi def gidInf		ctermfg=70
hi def gidNote		ctermfg=70
hi def gidImp		ctermfg=black ctermbg=70
hi def gidRel		ctermfg=70
hi def gidEnum		ctermfg=70
hi def gidExmpl		ctermfg=70
hi def gidCmd		ctermfg=70
hi def gidCode		ctermfg=70
hi def gidCOut		ctermfg=70
hi def gidISrc		ctermfg=70
hi def gidQuest		ctermfg=70
hi def gidProb		ctermfg=red
hi def gidProb2		ctermfg=red
hi def gidSol		ctermfg=70
hi def gidCPoint	ctermfg=70
hi def gidCond		ctermfg=70
hi def gidDiff		ctermfg=70
hi def gidOver		ctermfg=70
hi def gidIsEle		ctermfg=70
hi def gidIsPar		ctermfg=70
hi def gidClaim		ctermfg=70
hi def gidMaybe		ctermfg=70
hi def gidGoal		ctermfg=70
hi def gidRef		ctermfg=70
hi def gidIDRef		ctermfg=70
hi def gidIdea		ctermfg=70
hi def gidDir		ctermfg=70
hi def gidRes		ctermfg=70
hi def gidNot		ctermfg=70
hi def gidNot2		ctermfg=70
hi def gidDate		ctermfg=70
hi def gidLocation		ctermfg=70

hi def gidAbrev		ctermfg=red cterm=bold


"Style
"hi def gid_s_UL		ctermfg=70 cterm=underline
hi def gid_s_IT		ctermfg=255 cterm=italic
hi def gid_s_MulIT	ctermfg=255 cterm=italic
hi def gid_s_BOLD	ctermfg=122 cterm=bold
"hi def gid_s_IMP	ctermfg=70 cterm=bold
hi def gid_s_IMP	cterm=underline
"hi def gid_s_IMPl	ctermfg=70 cterm=bold
hi def gid_s_IMP1	cterm=underline
hi def gid_s_REF	ctermfg=70 cterm=italic
" below does not work yet (only italic)
hi def gid_s_Q		cterm=underline cterm=bold
hi def gid_s_Q_line	cterm=italic,bold
hi def gid_s_Q_inline	ctermfg=15 ctermbg=131 cterm=bold


"Meta
hi def gid_m_PAGE		ctermfg=70
"hi def gid_m_TUDU		ctermfg=15 ctermbg=131 cterm=bold
hi def gid_m_TUDU       cterm=underline
hi def gid_m_CMNT		ctermfg=103
hi def gid_m_CMNT_ml	ctermfg=103
hi def gid_m_NOTE		ctermfg=15 ctermbg=131 cterm=bold
hi def gid_m_TODO		ctermfg=15 ctermbg=131 cterm=bold
hi def gid_m_TAG		ctermfg=103
hi def gid_m_ADD		ctermfg=103
hi def gid_m_CDEF		ctermfg=103
hi def gid_m_CREF		ctermfg=103


"OUTSOURCE
hi def nmlPointT        ctermfg=226
hi def nmlPointTD       ctermfg=70
hi def nmlPointTQ       ctermfg=190
hi def nmlPointTP       ctermfg=70
hi def nmlPointTM       ctermfg=70
"hi def nmlPointTI       ctermfg=15 ctermbg=131 cterm=bold
hi def nmlPointTI       cterm=underline
"hi def nmlPointTN       ctermfg=red
hi def nmlPointTN       cterm=underline
"hi def nmlPointTA       ctermfg=red
hi def nmlPointTN       cterm=underline

"COLOR-PROFILES
"BELLO:
"	IMPORTANT------->LESS
"	red:	213, 205, 199
"	green:	191, 185, 178
"	blue:	159, 153, 147
"	yellow:	220 / 226, 208, 202
"
"	GREEN:
"		70
"	YELLOW:
"		190
"	RED:
"		red
"	META:
"		103
