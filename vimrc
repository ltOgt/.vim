" FIXES ===================================================================
" <Esc>+O waits for escape sequence -> FIX
	set timeout timeoutlen=1000 ttimeoutlen=100
" better safe than sorry
	set nocompatible


" PLUGINS =================================================================
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
	nnoremap nerd :NERDTreeToggle<Enter>
	let g:ycm_global_ycm_extra_conf = "~/.vim/custom/plugins/.ycm_extra_conf.py"
	let g:ycm_filetype_blacklist = {
			\ 'gid': 1,
			\ 'lit': 1,
			\ 'tex': 1
			\}
	filetype plugin on


" NOPS ====================================================================
	noremap <F1> <nop>
	noremap <S-F1> <nop>


" COMMANDS ================================================================
	" Write as sudo
	command W w !sudo tee "%" > /dev/null


" APPEARANCE ==============================================================
	" show line numbers
		set number
	" set line numbers relative to current row
		set relativenumber

	" enable syntax highlighting
		syntax on

	" Define TAB
		set tabstop=2					" width of tab as it appears in vim (measured in spaces)
		set softtabstop=0 noexpandtab	" non-zero -> inserts actual spaces + tabs | all spaces
		set shiftwidth=2

	" Visual Folding
		set foldmethod=indent			" define scope_of_fold=same indent
		set foldlevel=2					" inital folds at level 2
		" use ^^ to open all folds
			nnoremap ^ zR
		" use ° to close all folds
			nnoremap ° zM
		" use °°(/Shift+^) to toggle fold
			noremap °° za

	" Linebreak with visualindent
		set linebreak
		set breakindent
		let &showbreak = "↳ "

	" trailing Whitespace (http://vim.wikia.com/wiki/Highlight_unwanted_spaces)
		highlight ExtraWhitespace ctermbg=red guibg=red
		match ExtraWhitespace /\s\+$/
		autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
		autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
		autocmd InsertLeave * match ExtraWhitespace /\s\+$/
		autocmd BufWinLeave * call clearmatches()


" BEHAVIOUR ===============================================================
	" Keep indentation on ENTER
		set autoindent
	" omni completion
		" FILEPATH
			" <c-x><c-f>
		" Filetype Specific (attribute)
			" <c-x><c-o>


" NAVIGATION=======================
	nnoremap ;;nav :call ToggleNavigation()<cr>
	nnoremap ;;n :call ToggleNavigation()<cr>

	let g:is_nav_off = 1
	function! ToggleNavigation()
		if g:is_nav_off
			" Goto next <§§> and replace
				inoremap ## <Esc>/<§§><Enter>"_c4l
			" Goto prev <§§> and replace
				inoremap '' <Esc>?<§§><Enter>"_c4l
			" Goto next <§§> but keep (go behind <§§>)
				inoremap ++ <Esc>/<§§><Enter>4li
			" Goto prev <§§> but keep (go before <§§> -> otherwise ** will find same one)
				inoremap ** <Esc>?<§§><Enter>i
			" Set marker
				inoremap ;§ <§§>
			let g:is_nav_off = 0
			echo "NAV ON"
		else
				iunmap ##
				iunmap ''
				iunmap ++
				iunmap **
				iunmap ;§
			let g:is_nav_off = 1
			echo "NAV OFF"
		endif
	endfunction

	" Navigate on screen lines with shift+arrow (visible lines)
		noremap <S-Up> gk
		noremap <S-Down> gj
		inoremap <S-Up> <Esc>gki
		inoremap <S-Down> <Esc>gji

	" Navigate up and down and focus on current line with ctrl+arrow
		nnoremap \up_center <Up>zz
			map <C-Up> \up_center
			imap <C-Up> <Esc>\up_center<Esc>
		nnoremap \down_center <Down>zz
			map <C-Down> \down_center
			imap <C-Down> <Esc>\down_center<Esc>

	" Navigate between splits
		" close all windows but the curent one
			" <Ctrl+W><O>
		" move between splits
			nnoremap <C-W><Down>  <C-W><C-J>
			nnoremap <C-W><Up>    <C-W><C-K>
			nnoremap <C-W><Left>  <C-W><C-L>
			nnoremap <C-W><Right> <C-W><C-H>
		" close the preview split
			inoremap <C-Space>    <Esc><C-W><C-Z>a
			nnoremap <C-Space>    <C-W><C-Z>


" BINDS; CHANGE APPEARANCE ================================================
	" toggle (relative) number
		map ;r :set relativenumber!<Enter>
		map ;n :set number!<Enter>

	" toggle autoindent
		map ;a :set autoindent!<Enter>

	" toggle line + column highlight
			hi CursorLine 	cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkgrey guifg=white
			hi CursorColumn	cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkgrey guifg=white
		nnoremap ;h :set cursorcolumn!<Bar>set cursorline!<Enter>

	"Toggle Spelling
		noremap <F6> :setlocal spell! spelllang=en_us<CR>
			inoremap <F6> <C-o>:setlocal spell! spelllang=en_us<CR>
		noremap <F7> :setlocal spell! spelllang=de<CR>
			inoremap <F7> <C-o>:setlocal spell! spelllang=de<CR>
		noremap ;z z=
			inoremap ;z <Esc>z=
		noremap <F9> z=
			inoremap <F9> <Esc>z=


" BINDS; NORM-INSERTMODE ==================================================
	"Esc
		imap ;Q ;q
		inoremap ;q <Esc>
	"new line
		inoremap ;o <Esc>o
		inoremap ;O <Esc>O
	"EoL
		inoremap ;A <Esc>A
		nnoremap ;A A<Esc>
	"D->EoL
		inoremap ;D <Esc>D


" BINDS; OVERWRITE BEHAVIOUR ==============================================
	"Remap Shift Y to copy to end of line (yy used to copy whole line already)
		nnoremap Y y$

	"map TAB and Shift+TAB [use <C-D> for autocmds]
		vnoremap <S-Tab> <<<Esc>
		nnoremap <S-Tab> <<<Esc>
		vnoremap <Tab> >><Esc>
		nnoremap <Tab> >><Esc>


" BINDS; META =============================================================
	" map fn to show filename
		nnoremap fn <Esc>:echo "working in: ["expand('%:p')"]"<Enter>

	" map fq to !qwe
	" . REQUIRES qwe (custom script that opens new terminal with path of current session)
		nnoremap fq <Esc>:!qwe<Enter><Enter>

	" Reload .vimrc - changed to global on \c0 TODO runtime does not seem to work
		imap \c0 <Esc>\c0
		noremap \c0 <Esc>:source<Space>~/.vimrc<Enter><Esc>:runtime!<Space>/custom/binds/*.vim<Enter>:echo<Space>"sourced .vimrc and .vim/custom/binds/*.vim --NORMAL MODE--"<Enter>
		"au Bufread .vimrc,*.vim noremap \c1 <Esc>:source ~/.vimrc<Enter><Esc>:echo "sourced .vimrc --NORMAL MODE--"<Enter>


" BINDS; custom ===========================================================
	" Swapping characters
	" (left does not work propperly if last char in line)
		inoremap <C-Right> <Esc>lxpi
		inoremap <C-Left> <Esc>lxhPi


" FILETYPES ===============================================================
	" AS FAR AS I UNDERSTAND:
	" 	1) define filetype here (not needed for all)
	" 	2) source specific file
	" 	3) use autocmd FileType <FT> <cmd> (can be handled over groups and ftplugin instead)
	" 	4) source template with <cmd>: 0r ~/.vim/templates/skeleton.<FT>
	" 		/*Use BufNewFile for this, to only do this on new Files*/
	" IF IT DOES NOT WORK FOR SOME REASON TRY ADDING:
 	"	au BufRead,BufNewFile *.<FT> set filetype=<FT>
	"
	" custom
		au Bufread,BufNewFile *.lg setfiletype lg
		au Bufread,BufNewFile *.gid setfiletype gid
		au Bufread,BufNewFile *.lit setfiletype lit
		au Bufread,BufNewFile *.tudu setfiletype tudu
		au Bufread,BufNewFile *.note setfiletype note

	" Python
		au Bufread,BufNewFile *.py setfiletype python

	" Latex
		au Bufread,BufNewFile *.cls set filetype=cls
		au Bufread,BufNewFile *.bib setfiletype bib

	" Markdown
		au Bufread,BufNewFile *.md set filetype=markdown


	" TEMPLATES ===============================================================
	autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
	autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
	autocmd BufNewFile *.cls 0r ~/.vim/templates/skeleton.cls
	autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
	autocmd BufNewFile *.bib 0r ~/.vim/templates/skeleton.bib
	autocmd BufNewFile *.lg 0r ~/.vim/templates/skeleton.lg
	autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
	autocmd BufNewFile *.php 0r ~/.vim/templates/skeleton.php
	autocmd BufNewFile *.lit 0r ~/.vim/templates/skeleton.lit

	" LOAD HTML ===============================================================
	source ~/.vim/custom/binds/html.vim
	source ~/.vim/custom/binds/php.vim


	" LOAD BASH ===============================================================
	source ~/.vim/custom/binds/bash.vim

	" LOAD LaTex ==============================================================
	source ~/.vim/custom/binds/latex.vim
	source ~/.vim/custom/binds/bib.vim
	source ~/.vim/custom/binds/cls.vim

	" LOAD Markdown ==============================================================
	source ~/.vim/custom/binds/md.vim

	" LOAD .lg ================================================================
	source ~/.vim/custom/binds/lg.vim

	" LOAD .py ================================================================
	source ~/.vim/custom/binds/py.vim

	" LOAD .gid ===============================================================
	source ~/.vim/custom/binds/gid.vim

	" LOAD symbols ============================================================
	source ~/.vim/custom/binds/symbols.vim

	" LOAD boxdraw ============================================================
	source ~/.vim/custom/binds/boxdraw.vim

	" TEST FILE ===============================================================
	autocmd BufNewFile TESTSPAM 0r ~/.vim/templates/skeleton.TESTSPAM


" restore last position
" (http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session) [2018-07-01]
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
