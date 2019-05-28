
"BASH=============================
"autocmd FileType sh inoremap ;init <Esc>i#!/bin/bash<Enter><Enter>

autocmd FileType sh inoremap ;I <Esc>iif<Space>[<Space><§§><Space>]<Enter>then<Enter><Tab><§§><Enter><C-D>fi<Enter><§§><Esc>3?<§§><Enter>"_c4l

autocmd FileType sh inoremap ;EI <Esc>ielif<Space>[<Space><§§><Space>]<Enter>then<Enter><Tab><§§><Enter><Esc>2?<§§><Enter>"_c4l

"<Bar><Bar> INSTEAD OF || 	YES - NO BASH
autocmd FileType sh inoremap ;YN <Esc>iread<Space>answer<Enter>if [ $answer = "y" ] <Bar><Bar><Space>[<Space>$answer<Space>=<Space>'Y'<Space>]<Enter>then<Enter><Tab><§§><Enter><C-D>else<Enter><Tab><§§><Enter><C-D>fi<Enter><§§><Esc>3?<§§><Enter>"_c4l

