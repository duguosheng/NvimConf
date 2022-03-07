" markdown的快捷键
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,w <Esc>/ <++><CR>:nohlsearch<CR>c5l<CR>
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown inoremap ,i **<++><Esc>F*i
autocmd Filetype markdown inoremap ,d ``<++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,m - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap ,p ![](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap ,, <Esc>o<Esc>d0i<Space><Space>*<Space>
autocmd Filetype markdown inoremap 'p <img src="" width=<++> height=<++> title="<++>" alt="pictures not found"><Enter><++><Esc>k0f"a

" hexo内置标签
autocmd Filetype markdown inoremap 'c {% cq %}  {% endcq %} <++><Esc>F{hi
autocmd Filetype markdown inoremap 'i {% include_raw '_data/' %}<Enter><++><Esc>k0f/a

" 自动生成目录
autocmd Filetype markdown inoremap ,t <Esc>:GenTocGFM
autocmd Filetype markdown inoremap ,T <Esc>:GenTocRedcarpet
