"HTML=============================
	"Style
	autocmd FileType html inoremap ;SEM <em></em><Space><§§><Esc>FeT>i
	autocmd FileType html inoremap ;SB <b></b><Space><§§><Esc>2?<<Enter>i
	autocmd FileType html inoremap ;SI <i></i><Space><§§><Esc>2?<<Enter>i
	autocmd FileType html inoremap ;SM <mark></markb><Space><§§><Esc>2?<<Enter>i
	autocmd FileType html inoremap ;SS <small></small><Space><§§><Esc>2?<<Enter>i
	autocmd FileType html inoremap ;SD <del></del><Space><§§><Esc>2?<<Enter>i

	"Special Characters - using <u> for tabbing, remarked in skeleton.html, implemnted in css
	autocmd FileType html inoremap ;T <u></u><§§><Esc>2?<<Enter>i
	autocmd FileType html inoremap ;> &gt;
	autocmd FileType html inoremap ;< &lt;

	"Structure
	autocmd FileType html inoremap ;B <br><Esc>o
	autocmd FileType html inoremap ;H <Esc>o<h1><§§></h1><Enter><p><Enter><Tab><§§><Enter><C-D></p><§§><Esc><Esc>3?<§§><Enter>"_c4l
	autocmd FileType html inoremap ;P <Esc>o<p><Enter><Tab><§§><Enter><C-D></p><§§><Esc>2?<§§><Enter>"_c4l
	autocmd FileType html inoremap ;A <Esc>i<a href="<§§>"><§§></a><§§><Esc>3?<§§><Enter>"_c4l

	"Divs
	autocmd FileType html inoremap ;D <Esc>o<div><Enter><Tab><§§><Enter><C-D></div><Esc>?<§§><Enter>"_c4l
	autocmd FileType html inoremap ;DC <Esc>o<div class="<§§>"><Enter><Tab><§§><Enter><C-D></div><Esc>2?<§§><Enter>"_c4l
	autocmd FileType html inoremap ;D:C <Esc>o<div class="console"><Enter><Tab><§§><Enter><C-D></div><Esc>?<§§><Enter>"_c4l



