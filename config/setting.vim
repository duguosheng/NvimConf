" 去除vi一致性
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" 普通和可视模式允许使用鼠标
set mouse=nv
" 编码设置
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,latin1
set fileencoding=utf-8
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
"set shell=bash
set number
"set relativenumber
set cursorline
set expandtab
" 自动写入
" set autowrite
set updatetime=2000
" tab键指定4个空格
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
" 在光标到达屏幕顶部和底部总留有5行
set scrolloff=5
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
" set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
exec "nohlsearch"
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
" 再次进入文件仍然可以记住上次的修改
"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
"  set undofile
"  set undodir=~/.config/nvim/tmp/undo,.
"endif

" 不同模式下光标不同
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set rtp+=/home/dgs/.opam/default/share/merlin/vim
