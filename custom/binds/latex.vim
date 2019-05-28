let g:tex_flavor = 'tex' "default is plaintex when document is stil empty
autocmd FileType tex,cls set syntax=tex

"autocmd FileType tex inoremap ;init <Esc>i\documentclass{article}<Enter><Enter>\begin{document}<Enter><Enter><§§><Enter><Enter>\end{document}<Esc>?<§§><Enter>dwi

"saves the document + compiles it + returns to input mode (path is stored in
	"temp file which is deleted again)
	autocmd FileType tex nmap \c1 \compileOnce
	autocmd FileType tex imap \c1 <Esc>\compileOnce
	"compile, bib, compile (E34 -> dont use ! in command; had echo "DONE!" before)
	autocmd FileType tex map \c2 \compileTwiceWithBib
	autocmd FileType tex imap \c2 <Esc>\compileTwiceWithBib
	"compile main (when working in file that is imported in main)
	autocmd FileType tex,cls map \cm \compileMain
	autocmd FileType tex,cls imap \cm <Esc>\compileMain
	"compile thesis.tex
	autocmd FileType tex,cls map \ct \compileThesis
	autocmd FileType tex,cls imap \ct <Esc>\compileThesis
	"open pdf
	autocmd FileType tex map \co \openPDF
	autocmd FileType tex imap \co <Esc>\openPDF
	autocmd FileType tex map \cp \openPDFslides
	autocmd FileType tex imap \cp <Esc>\openPDFslides
	autocmd FileType tex map \com \openMain
	autocmd FileType tex imap \com <Esc>\openMain


		"outsourced from above
		"_tcp_ = temporary compile path
		autocmd FileType tex noremap \compileOnce <Esc>:w<Enter>:! _tcp_=$(echo %:p); echo $_tcp_; pdflatex $_tcp_<Enter><Enter><Esc>:echo "compiled"<Enter>
		"autocmd FileType tex noremap \compileTwiceWithBib <Esc>:w<Enter>:! _tcp_=$(echo %:p); echo "> pdflatex $_tcp_ (1)"; pdflatex $_tcp_; echo "> biber $_tcp_"; biber $_tcp_; echo "> pdflatex $_tcp_ (2)"; pdflatex $_tcp_; echo "DONE";<Enter><Enter><Esc>:echo "compile, biber, compile --NORMAL MODE--"<Enter>
		"Had to overwrite the outcommented above for thesis; this uses bibtex
		" which is only able to get direct path --> only runnable from within
		" main directory and main file
		autocmd FileType tex noremap \compileTwiceWithBib <Esc>:w<Enter>:! _wfn_=$(echo %:t); _wfn_=$( echo "$_wfn_" \| cut -d'.' -f1); echo "> pdflatex $_wfn_.tex (1)"; pdflatex $_wfn_.tex; echo "> bibtex $_wfn_.aux"; bibtex $_wfn_.aux; echo "> pdflatex $_wfn_.tex (2)"; pdflatex $_wfn_.tex; echo "DONE";<Enter><Enter><Esc>:echo "compile, bibtex, compile --NORMAL MODE--"<Enter>
		"autocmd FileType tex noremap \compileMain <Esc>:w<Enter>:! temp_main_path=$(echo %:h"/main.tex"); echo $temp_main_path; pdflatex $temp_main_path<Enter><Enter><Esc>:echo "compiled main.tex"<Enter>
		autocmd FileType tex noremap \compileMain <Esc>:w<Enter>:! temp_main_path=$(echo "main.tex"); echo $temp_main_path; pdflatex $temp_main_path<Enter><Enter><Esc>:echo "compiled main.tex"<Enter>
		autocmd FileType tex noremap \compileThesis <Esc>:w<Enter>:! temp_thesis_path=$(echo "thesis.tex"); echo $temp_thesis_path; pdflatex $temp_thesis_path<Enter><Enter><Esc>:echo "compiled thesis.tex"<Enter>

		"open without blocking terminal
		"_tpp_ = temporary pdf path
		autocmd FileType tex noremap \openPDF <Esc>:!(temp_pdf_path=$(echo %:p:h"/"%:r".pdf"); zathura $temp_pdf_path) & <Enter><Enter><Esc>a
		autocmd FileType tex noremap \openPDFslides <Esc>:!(temp_pdf_path=$(echo %:p:h"/"%:r".pdf"); zathura $temp_pdf_path --mode presentation) & <Enter><Enter><Esc>a
		autocmd FileType tex,cls noremap \openMain <Esc>:!(temp_pdf_path=$(echo "main.pdf"); zathura $temp_pdf_path) & <Enter><Enter><Esc>a

"workflow bindings
"
"begin + end (write class name then ;b)
	autocmd FileType tex,cls inoremap ;b <Esc>vbd<Esc>a\begin{<Esc>pa}<Enter><Tab><§§><Enter><C-D>\end{<Esc>pa}<Enter><§§><Esc>2?<§§><Enter>c4l
"list- (enumerate / itemize) / item
	autocmd FileType tex,cls inoremap ;le \begin{enumerate}<Enter>\item <§§><Enter>\end{enumerate}<Enter><§§><Esc>2?<§§><Enter>"_c4l
	autocmd FileType tex,cls inoremap ;li \begin{itemize}<Enter>\item <§§><Enter>\end{itemize}<Enter><§§><Esc>2?<§§><Enter>"_c4l
	autocmd FileType tex,cls inoremap ;i \item<Space>
"
"Labels + References
	"labled section
	autocmd FileType tex,cls inoremap ;sl \section{<§§>\label{<§§>}}<Enter><§§><Esc>3?<§§><Enter>"_c4l
	"label
	autocmd FileType tex,cls inoremap lbl \label{}<Esc>i
	"Reference
	autocmd FileType tex,cls inoremap ;r \ref{}<Esc>i
	"Acronym
	autocmd FileType tex,cls inoremap ;AC \ac{}<Esc>i

"section
	autocmd FileType tex,cls inoremap ;1 <Esc>:r ~/.vim/snippets/latex/s1_chapter.tex<Enter>?<§§><Enter>d4li
	autocmd FileType tex,cls inoremap ;2 <Esc>:r ~/.vim/snippets/latex/s2_section.tex<Enter>?<§§><Enter>d4li
	autocmd FileType tex,cls inoremap ;3 <Esc>:r ~/.vim/snippets/latex/s3_subsection.tex<Enter>?<§§><Enter>d4li
	autocmd FileType tex,cls inoremap ;4 <Esc>:r ~/.vim/snippets/latex/s4_subsubsection.tex<Enter>?<§§><Enter>d4li
	autocmd FileType tex,cls inoremap ;5 <Esc>:r ~/.vim/snippets/latex/s5_paragraph.tex<Enter>?<§§><Enter>d4li

"formatiing binds - STYLE
	"
	"BOLD
	autocmd FileType tex,cls inoremap ;SB \textbf{}<Esc>i
	"ITALIC
	autocmd FileType tex,cls inoremap ;SI \textit{}<Esc>i
	"SmallCaps
	autocmd FileType tex,cls inoremap ;SC \textsc{}<Esc>i
	"MONO
	autocmd FileType tex,cls inoremap ;ST \texttt{}<Esc>i
	"EMPHATIC
	autocmd FileType tex,cls inoremap ;SE \emph{}<Esc>i
	"MathScript
	autocmd FileType tex,cls inoremap ;MC \mathcal{}<Esc>i
	"DoubleStruck (Blackboard-Bold)
	autocmd FileType tex,cls inoremap ;MB \mathbb{}<Esc>i



	"Quotes
	autocmd FileType tex,cls inoremap ;" ``<§§>''<§§><Esc>2?<§§><Enter>"_c4l
	autocmd Filetype tex,cls inoremap ;np \newpage<Esc>o

"iabbr for latex only
	autocmd FileType tex inoremap --> \texttt{-->}
	autocmd FileType tex inoremap -> \texttt{->}
	autocmd FileType tex inoremap ==> \texttt{==>}
	autocmd FileType tex inoremap => \texttt{=>}
	autocmd FileType tex,cls inoremap \itme \item
autocmd FileType tex,cls inoremap ßß \\<Enter>

"make sure \usepackage{courier} is set
	autocmd FileType tex,cls inoremap ,, \texttt{[ ]}

"literature
	autocmd FileType tex,cls,lit inoremap ;dlit <Esc>:r ~/.vim/snippets/latex/lit_def.tex<Enter>i
	autocmd FileType tex,cls,lit inoremap ;lit <Esc>:r ~/.vim/snippets/latex/lit_use.tex<Enter>i
