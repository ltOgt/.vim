".py==============================

autocmd FileType python inoremap ;# #===============================================<Space>
autocmd FileType python inoremap ;/ <Esc>vbd<Esc>a#<Space>/`````````````````````````````````````````<Space><Esc>pa<Enter><§§><Enter>#<Space>\,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,<Space><Esc>pa<Esc>?<§§><Enter>"_c4l

"templates----------------------------------
autocmd FileType python inoremap ;d def<Space><§§>(<§§>):<Enter><Tab>"""<Enter><Tab><§§><Enter>-------------------------------------------------------<Enter>@param<Space>i_<§§><Enter>-------------------------------------------------------<Enter>Assertions:<Enter><§§><Enter>-------------------------------------------------------<Enter>Returns<Space><§§><Enter><C-D>"""<Enter><§§><Esc>7?<§§><Enter>i

autocmd FileType python inoremap ;t def<Space>t_<§§>():<Enter><Tab>"""<Enter><Tab>Testing<Space><§§><Enter>-------------------------------------------------------<Enter>@param<Space>-<Enter>-------------------------------------------------------<Enter>Returns<Space>nothing<Enter><C-D>"""<Enter>printer.seperator()<Enter>print("Started testing of <§§>")<Enter>printer.action("importing")<Enter>import <§§> as <§§><Esc>5?<§§><Enter>i
