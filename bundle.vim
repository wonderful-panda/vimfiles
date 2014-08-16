
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

" Python関連
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'davidhalter/jedi-vim'

" カラースキーマなど
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'itchyny/lightline.vim'

" その他
NeoBundle 'tyru/restart.vim'
NeoBundle 'cohama/agit.vim'
NeoBundle 'vim-scripts/fcitx.vim'

call neobundle#end()

filetype plugin indent on
syntax on

