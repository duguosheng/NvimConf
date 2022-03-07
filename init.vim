"  ____   ____ ____  _      __     ___
" |  _ \ / ___/ ___|( )___  \ \   / (_)_ __ ___
" | | | | |  _\___ \|// __|  \ \ / /| | '_ ` _ \
" | |_| | |_| |___) | \__ \   \ V / | | | | | | |
" |____/ \____|____/  |___/    \_/  |_|_| |_| |_|
"

if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.config/nvim/config/_machine_specific.vim
source ~/.config/nvim/config/setting.vim
source ~/.config/nvim/config/mapping.vim
source ~/.config/nvim/config/plugins.vim

