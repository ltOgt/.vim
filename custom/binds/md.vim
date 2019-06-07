"autocmd FileType tex inoremap ;init <Esc>i\documentclass{article}<Enter><Enter>\begin{document}<Enter><Enter><§§><Enter><Enter>\end{document}<Esc>?<§§><Enter>dwi

"saves the document + compiles it + returns to input mode (path is stored in
	"temp file which is deleted again)
	autocmd FileType markdown nmap \c1 \compile
	autocmd FileType markdown imap \c1 <Esc>\compile
	"open pdf
	autocmd FileType markdown map \co \openPDF
	autocmd FileType markdown imap \co <Esc>\openPDF



		"Compile usind pandoc
		autocmd FileType markdown noremap \compile <Esc>:echo "Compiling..."<Enter><Esc>:w<Enter>:!(base_path=$(echo %:p:h"/"%:r); pandoc $(echo $base_path".md") -o $(echo $base_path".pdf")) & <Enter><Enter><Esc>:echo "compiled!"<Enter>
		"open without blocking terminal
		autocmd FileType markdown noremap \openPDF <Esc>:!(temp_pdf_path=$(echo %:p:h"/"%:r".pdf"); zathura $temp_pdf_path) & <Enter><Enter><Esc>a
