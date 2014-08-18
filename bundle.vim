
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

" Python関連
NeoBundle 'vim-scripts/Python-Syntax-Folding'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'davidhalter/jedi-vim'

" カラースキーマなど
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'https://github.com/altercation/vim-colors-solarized'
NeoBundle 'https://github.com/w0ng/vim-hybrid'
NeoBundle 'itchyny/lightline.vim'

" Textobj
NeoBundle 'https://github.com/kana/vim-textobj-user'
NeoBundle 'https://github.com/bps/vim-textobj-python'

" その他
NeoBundle 'tyru/restart.vim'
NeoBundle 'cohama/agit.vim'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'osyo-manga/unite-filters-collection'
if !has('win32')
	NeoBundle 'vim-scripts/fcitx.vim'
endif

call neobundle#end()

filetype plugin indent on
syntax on

