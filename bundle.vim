
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Shougoウェア
NeoBundle 'Shougo/vimproc', {
    \   'build' : {
    \     'windows' : 'nmake -f make_msvc.mak nodebug=1',
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
NeoBundleLazy 'scrooloose/syntastic', {
\   'autoload' : { 'filetypes' : [ 'python', 'ruby', 'vim', 'go' ] }
\ }
let s:bundle = neobundle#get('syntastic')
function! s:bundle.hooks.on_source(bundle)
  let g:syntastic_python_checkers = ['pyflakes']
  let g:syntastic_auto_loc_list = 1
endfunction

" Python関連
NeoBundleLazy 'vim-scripts/Python-Syntax-Folding', {
\   'autoload' : { 'filetypes' : [ 'python' ] }
\ }

NeoBundleLazy 'davidhalter/jedi-vim', {
\   'autoload' : { 'filetypes' : [ 'python' ] }
\ }
let s:bundle = neobundle#get('jedi-vim')
function! s:bundle.hooks.on_source(bundle)
  let g:jedi#force_py_version = 3
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
endfunction

" Textobj
"NeoBundle 'kana/vim-textobj-user'
"NeoBundle 'bps/vim-textobj-python'

" その他
NeoBundle 'tyru/restart.vim'
NeoBundleLazy 'cohama/agit.vim', {
\   'autoload' : { 'commands' : [ 'Agit', 'AgitFile' ] }
\ }
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'osyo-manga/unite-filters-collection'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundleLazy 'majutsushi/tagbar', {
\   'autoload' : { 'commands' : [ 'Tagbar', 'TagbarOpen', 'TagbarToggle' ] }
\ }

NeoBundleLazy 'Blackrush/vim-gocode', {
\   'autoload' : { 'filetypes' : [ 'go' ] }
\ }

if !has('win32')
	NeoBundle 'vim-scripts/fcitx.vim'
endif

if has('gui')
    " gvim専用
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'nanotech/jellybeans.vim'
endif

call neobundle#end()

:NeoBundleCheck

filetype plugin indent on
syntax on

