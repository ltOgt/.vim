".lg==============================
autocmd FileType lg,gid inoremap ,, [ ]<Tab>
autocmd FileType lg,gid inoremap ,p <Esc>:s/\[\s\]/\[p\]/<Enter>a
autocmd FileType lg,gid inoremap ,x <Esc>:s/\[\s\]/\[x\]/<Enter>a
autocmd FileType lg,gid inoremap ,+ <Esc>:s/\[\s\]/\[*\]/<Enter>a
autocmd FileType lg vnoremap ,, c{::}<Esc>2hp2la
autocmd FileType lg vnoremap ,. c{::::}<Esc>3hp3la

"mapped first letter upper case to same function --> oftne pressed ;R instead of ;r
autocmd FileType lg inoremap ;RR {:<§§>:}<§§><Esc>2?<§§><Enter>"_c4l
autocmd FileType lg inoremap ;RN {&}
autocmd FileType lg inoremap ;RF {::<§§>::}<§§><Esc>2?<§§><Enter>"_c4l
autocmd FileType lg inoremap ;RM {::::}{>}{{<§§>}}<Esc>13h<Esc>i
autocmd FileType rf inoremap ;RM {::::}{>}{{<§§>}}<Esc>13h<Esc>i
autocmd FileType lg inoremap ;M {{<§§>}}<§§><Esc>2?<§§><Enter>"_c4l
autocmd FileType lg inoremap ;H :<§§>:<Esc>1?<§§><Enter>"_c4l

"auto-add new line with point specified
autocmd FileType lg inoremap ;+ <Esc>o<Esc>I<Tab>+<Space>
	autocmd FileType lg nnoremap ;+ <Esc>o<Esc>I<Tab>+<Space>
	autocmd FileType lg inoremap ;a <Esc>o<Esc>I<Tab>+<Space>
		autocmd FileType lg nnoremap ;a <Esc>o<Esc>I<Tab>+<Space>
autocmd FileType lg inoremap ;- <Esc>o<Esc>I<Tab>-<Space>
	autocmd FileType lg inoremap ;r <Esc>o<Esc>I<Tab>-<Space>
autocmd FileType lg inoremap ;c <Esc>o<Esc>I<Tab>c<Space>
autocmd FileType lg inoremap ;~ <Esc>o<Esc>I<Tab>~<Space>
autocmd FileType lg inoremap ;i <Esc>o<Esc>I<Tab>i<Space>
autocmd FileType lg inoremap ;° <Esc>o<Esc>I<Tab>°<Space>

autocmd FileType lg inoremap ;t <Esc>o<Esc>I<Tab>[<Space>]<Tab>
autocmd FileType lg inoremap ;x <Esc>o<Esc>I<Tab>x<Space>
autocmd FileType lg inoremap ;* <Esc>o<Esc>I<Tab>*<Space>
autocmd FileType lg inoremap ;p <Esc>o<Esc>I<Tab>p<Space>
autocmd FileType lg inoremap ;? <Esc>o<Esc>I<Tab>?<Space>

autocmd FileType lg inoremap ;> <Esc>o<Esc>I<Tab>><Space>

"autocmd FileType lg noremap <F1> <Esc>:w<Enter><Esc>:!(cd ~/grive && grive ; cd $HTML/.. && grive) > ~/note/logs/20--_[].log
"does not work with grive --> reacivate when completley switched to git

"autocomplete for Mappings
"search global mappings file and search local
"TODO use grep and :help complete(
"
