"autocmd FileType gid inoremap ;' <Esc>:s/"/'/g<Enter>A
autocmd FileType gid inoremap ;! <Enter>""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""<Enter><Tab>
autocmd FileType gid,lg,lit inoremap ;1 <Esc>yyp<c-v>$r"o<Tab>
autocmd FileType gid,lg,lit inoremap ;2 <Esc>yyp<c-v>$r'o<Tab>
autocmd FileType gid,lg,lit inoremap ;3 <Esc>yyp<c-v>$r°o<Tab>
autocmd FileType gid,lg,lit inoremap ;4 <Esc>yyp<c-v>$r*o<Tab>
autocmd FileType gid,lg,lit inoremap ;5 <Esc>yyp<c-v>$r^o<Tab>

autocmd FileType gid,lg,lit inoremap ;_ <Esc>bi_<Esc>ea_

".lg==============================
autocmd FileType gid inoremap ,, [ ]<Tab>
autocmd FileType gid inoremap ,p [p]<Tab>
autocmd FileType gid inoremap ,x [x]<Tab>
autocmd FileType gid inoremap ,+ [*]<Tab>
autocmd FileType gid inoremap ,ß [?]<Tab>
autocmd FileType gid inoremap ;X <Esc>:s/\[\s\]/\[p\]/<Enter>a
autocmd FileType gid inoremap ;X <Esc>:s/\[\s\]/\[x\]/<Enter>a
autocmd FileType gid inoremap ;* <Esc>:s/\[\s\]/\[*\]/<Enter>a
autocmd FileType gid inoremap ;? <Esc>:s/\[\s\]/\[?\]/<Enter>a
