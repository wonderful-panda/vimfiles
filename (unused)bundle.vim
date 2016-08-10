"
" neobundle.vimからdein.vimに移行したためもう必要ない
" そのうち消す
" 
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Shougoウェア
NeoBundle 'Shougo/vimproc', {
    \   'build' : {
    \     'windows' : 'tools\\update-dll-mingw.bat',
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
\   'autoload' : { 'filetypes' : [ 'python', 'ruby', 'vim', 'go', 'javascript', 'typescript', 'html' ] }
\ }
let s:bundle = neobundle#get('syntastic')
function! s:bundle.hooks.on_source(bundle)
  let g:syntastic_python_checkers = ['pyflakes']
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0
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

" html/javascript関連
NeoBundle 'othree/html5.vim'
NeoBundleLazy 'mattn/emmet-vim', {
\   'autoload' : { 'filetypes' : [ 'html' ] }
\}

NeoBundleLazy 'marijnh/tern_for_vim', {
\ 'autoload' : { 'filetypes' : ['javascript'] },
\ 'build': { 'others': 'npm install' }
\}
NeoBundleLazy 'othree/yajs.vim', {
\   'autoload' : { 'filetypes' : [ 'javascript' ] }
\}

let g:js_indent_typescript = 1

NeoBundleLazy 'leafgarland/typescript-vim', {
\ 'autoload' : {
\   'filetypes' : ['typescript'] }
\}
NeoBundleLazy 'Quramy/tsuquyomi', {
\ 'autoload' : { 'filetypes' : ['typescript'] }
\}

" その他
NeoBundle 'tyru/restart.vim'
NeoBundleLazy 'cohama/agit.vim', {
\   'autoload' : { 'commands' : [ 'Agit', 'AgitFile' ] }
\ }
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'osyo-manga/unite-filters-collection'

NeoBundle 'Blackrush/vim-gocode'

NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'cohama/lexima.vim'

if !has('win32')
	NeoBundle 'vim-scripts/fcitx.vim'
endif

if has('gui')
    " gvim専用
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'nanotech/jellybeans.vim'
endif

NeoBundle 'vim-jp/vital.vim'
NeoBundle 'wonderful-panda/desertfox.vim'

call neobundle#end()

filetype plugin indent on
syntax on

:NeoBundleCheck
