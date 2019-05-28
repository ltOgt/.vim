 nnoremap ;;box :call ToggleBoxDraw()<cr>
 nnoremap ;;BOX :call ToggleBOXDRAW()<cr>

 let g:is_box_off = 1
 let g:is_BOX_off = 1
 function! ToggleBoxDraw()
	 if g:is_box_off
		 inoremap <Bar> │
		 inoremap -<Bar> ┤
		 inoremap -'- ┴
		 inoremap -,- ┬
		 inoremap <Bar>- ├
		 inoremap - ─
		 inoremap + ┼
		 inoremap -' ┘
		 inoremap ,- ┌
		 inoremap -, ┐
		 inoremap '- └
		 let g:is_box_off = 0
		 let g:is_BOX_off = 1
		 echo "Box-Draw ON"
		 echo "BOX-DRAW OFF"
	 else
		 iunmap <Bar>
		 iunmap -<Bar>
		 iunmap -'-
		 iunmap -,-
		 iunmap <Bar>-
		 iunmap --
		 iunmap +
		 iunmap -'
		 iunmap ,-
		 iunmap -,
		 iunmap '-
		 let g:is_box_off = 1
		 echo "Box-Draw OFF"
	 endif
 endfunction
 function! ToggleBOXDRAW()
	 if g:is_BOX_off
		 inoremap <Bar> ║
		 inoremap -<Bar> ╣
		 inoremap -'- ╩
		 inoremap -,- ╦
		 inoremap <Bar>- ╠
		 inoremap -- ═
		 inoremap + ╬
		 inoremap -' ╝
		 inoremap ,- ╔
		 inoremap -, ╗
		 inoremap '- ╚
		 let g:is_box_off = 1
		 let g:is_BOX_off = 0
		 echo "BOX-DRAW ON"
		 echo "Box-Draw OFF"
	 else
		 iunmap <Bar>
		 iunmap -<Bar>
		 iunmap -'-
		 iunmap -,-
		 iunmap <Bar>-
		 iunmap -
		 iunmap +
		 iunmap -'
		 iunmap ,-
		 iunmap -,
		 iunmap '-
		 let g:is_box_off = 1
		 echo "BOX-DRAW OFF"
	 endif
 endfunction

