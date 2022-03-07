" ===
" === Vim-plug管理插件
" ===
call plug#begin('$HOME/.config/nvim/plugged')

" 美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-dark'
Plug 'pboettch/vim-cmake-syntax'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'rbgrouleff/bclose.vim'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Other visual enhancement
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'

Plug 'ryanoasis/vim-devicons'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

" 代码排版
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'

" 模糊查找
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" 彩虹括号
Plug 'luochen1990/rainbow'

" 更改括号
Plug 'tpope/vim-surround'

" Markdown
Plug 'iamcco/markdown-preview.nvim'

" shell
Plug 'Shougo/deol.nvim'
Plug 'Shougo/vimproc.vim'

call plug#end()

" ===
" === AirLine
" ===
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_c_only_filename = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_section_c = '%-0.10{getcwd()}/%t'
let g:airline_mode_map = {
    \ 'ic'     : 'INSERT',
    \ }

" 显示窗口号
function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction
call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

" ===
" === Dress up my vim
" ===
" Range:   233 (darkest) ~ 238 (lightest)
" Default: 235
let g:space_vim_dark_background = 235
set termguicolors
colorscheme space-vim-dark
hi Comment cterm=italic
" 以下三行使背景透明
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE

" ===
" === NERDTree
" ===
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" ===
" === coc
" ===
source ~/.config/nvim/config/coc_config.vim

" ===
" === indentLine
" ===
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#333333'
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === FZF
" ===
map <C-p> :FZF<CR>


" Startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

"clang-format
"\ "AllowShortIfStatementsOnASingleLine" : "true",
"\ "AlwaysBreakTemplateDeclarations" : "true",
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "Standard" : "C++11"}
"autocmd FileType c,cpp,h ClangFormatAutoEnable
"let g:clang_format#auto_format_on_insert_leave=1
let g:clang_format#auto_format=1

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
"LLVM, Google, Chromium, Mozilla ,WebKit, Microsoft, GNU is supported
let g:clang_format#code_style='Chromium'

" 彩虹括号
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" vim-surround
" cs'" 将'改为"
" ds' 删除'
" ysiw( 将一个单词括起来
" yss( 将一行括起来


" deol
noremap <Leader>' :Deol -split=horizontal<CR>
let g:deol#extra_options = {'term_finish': 'close'}

" coc-clangd
" 快速切换源文件和头文件
autocmd FileType c,cc,cpp,h,hh,hpp nnoremap <M-o> :CocCommand clangd.switchSourceHeader<CR>
autocmd FileType c,cc,cpp,h,hh,hpp nnoremap <M-z> :CocCommand clangd.switchSourceHeader vsplit<CR>
autocmd FileType c,cc,cpp,h,hh,hpp nnoremap <M-m> :CocCommand clangd.memoryUsage<CR>
