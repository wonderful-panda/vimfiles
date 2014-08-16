set encoding=utf-8
set guifont=Ricty\ 11

source ~/.vim/settings/bundle.vim
source ~/.vim/settings/unite.vim
set backspace indent,eol,start
nnoremap J <C-d>
nnoremap K <C-u>

set hlsearch
set number
set shiftwidth=4
set tabstop=4
set fileencodings=utf8,cp932
colorscheme jellybeans

let g:restart_sessionoptions = 'blank,buffers,curdir,folds,localoptions,tabpages'

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python = 
	\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

