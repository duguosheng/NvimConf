let mapleader=' '

" 保存和退出
map Q :q<CR>
map W :w<CR>

" 快速到行首行尾
noremap H 0
noremap L $

noremap J 5j
noremap K 5k

" 直接打开配置文件
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" 更新配置文件
map SM :source $MYVIMRC<CR>

" 打开导航菜单
noremap <LEADER>st :Startify<CR>

" 复制到系统剪切版，需要安装xclip
" vnoremap <C-c> :w !xclip -i -sel c<CR><CR>
vnoremap <C-c> "+y
" 从系统剪切版粘贴
" inoremap <C-v> <Esc>:call setreg("\"",system("xclip -o -sel c"))<CR>pa
inoremap <C-v> <Esc>"+pA

" 查找
" 取消高亮
noremap <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" 切换缓冲区
noremap <Leader>b1 :b1<CR>
noremap <Leader>b2 :b2<CR>
noremap <Leader>b3 :b3<CR>
noremap <Leader>b4 :b4<CR>
noremap <Leader>b5 :b5<CR>
noremap <Leader>b6 :b6<CR>
noremap <Leader>b7 :b7<CR>
noremap <Leader>b8 :b8<CR>
noremap <Leader>b9 :b9<CR>
noremap <Leader>bp :bp<CR>
noremap <Leader>bn :bn<CR>

" 窗口跳转
func! WinJump(i) abort
  if winnr('$') >= a:i
    exe a:i . 'wincmd w'
  endif
endfunc

noremap <Leader>1 :call WinJump(1)<CR>
noremap <Leader>2 :call WinJump(2)<CR>
noremap <Leader>3 :call WinJump(3)<CR>
noremap <Leader>4 :call WinJump(4)<CR>
noremap <Leader>5 :call WinJump(5)<CR>
noremap <Leader>6 :call WinJump(6)<CR>
noremap <Leader>7 :call WinJump(7)<CR>
noremap <Leader>8 :call WinJump(8)<CR>
noremap <Leader>9 :call WinJump(9)<CR>
" 旋转屏幕
noremap <Leader>wh <C-w>b<C-w>H
noremap <Leader>wj <C-w>b<C-w>J
noremap <Leader>wk <C-w>b<C-w>K
noremap <Leader>wl <C-w>b<C-w>L
" 切换窗口
noremap <Leader>h <C-w>h
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k
noremap <Leader>l <C-w>l
" 更改窗口大小
map <C-up> :res +1<CR>
map <C-down> :res -1<CR>
map <C-left> :vertical resize-1<CR>
map <C-right> :vertical resize+1<CR>

autocmd FileType h,hpp,hh,c,cpp,cc,objc,java nnoremap <C-_> I// <Esc>j
autocmd FileType h,hpp,hh,c,cpp,cc,objc,java inoremap <C-_> <Esc>I// 


" ===
" === markdown快捷键位
" ===
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

" ===
" === Other useful stuff
" ===

" 打开终端
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>i


" 拼写检查
" noremap <LEADER>sc :set spell!<CR>
" noremap <C-x> ea<C-x>s
" inoremap <C-x> <Esc>ea<C-x>s

imap <C-c> <Esc>zza
nmap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" 编辑艺术字
noremap <LEADER>fg :r !figlet

" 编写makefile
noremap <LEADER>m :e makefile<CR>
" <F5>编译执行文件
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!rm ./%<"
    "exec "!clang -g % -o %<"
    exec "!make %<"
    exec "! ./%<"
  elseif &filetype == 'cpp'
    exec "!rm ./%<"
    "exec "!clang++ -g % -o %<"
    exec "!make %<"
    exec "! ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitright
    ":vsp
    ":vertical resize-10
    :sp
    :term python3 %
  elseif &filetype == 'html'
    exec "!google-chrome-stable % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc

" working on it...
map <F8> :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'markdown'
    exec "echo"
  elseif &filetype == 'c'
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
  endif
endfunc

let mapleader='\'
