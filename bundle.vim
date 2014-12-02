
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Shougoウェア
NeoBundle 'Shougo/vimproc', {
    \   'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin'  : 'make -f make_cygwin.mak',
    \     'mac'     : 'make -f make_mac.mak',
    \     'unix'    : 'make -f make_unix.mak',
    \   }
    \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimfiler.vim'

" syntastic
NeoBundle 'scrooloose/syntastic'

" Python関連
NeoBundle 'vim-scripts/Python-Syntax-Folding'
NeoBundle 'davidhalter/jedi-vim'

" Textobj
"NeoBundle 'kana/vim-textobj-user'
"NeoBundle 'bps/vim-textobj-python'

" その他
NeoBundle 'tyru/restart.vim'
NeoBundle 'cohama/agit.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'osyo-manga/unite-filters-collection'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Blackrush/vim-gocode'
if !has('win32')
	NeoBundle 'vim-scripts/fcitx.vim'
endif

if has('gui')
    " gvim専用
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'w0ng/vim-hybrid'
    NeoBundle 'nanotech/jellybeans.vim'
endif

call neobundle#end()

:NeoBundleCheck

filetype plugin indent on
syntax on

