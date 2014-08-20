set encoding=utf-8
if has('win32')
	au GUIEnter * simalt ~x
	set guifont=Ricty_Diminished_for_Powerline:h11:cSHIFTJIS
else
	set guifont=Ricty\ for\ Powerline\ 11
endif

source ~/.vim/settings/bundle.vim
source ~/.vim/settings/unite.vim
source ~/.vim/settings/filetype.vim
nnoremap J <C-d>
nnoremap K <C-u>

set hlsearch
set number
set shiftwidth=4
set tabstop=4
set fileencodings=utf8,cp932
set laststatus=2
set backspace=start,eol,indent
set guioptions=egrLtTb
set nowrap
set noswapfile
set listchars=tab:\ \ 
set list
set iminsert=0
set imsearch=-1

colorscheme jellybeans
let g:lightline = {
	\ 'colorscheme': 'jellybeans',
	\ 'component': {
	\	'readonly': '%{&readonly? "\u2B64" : "" }',
	\ },
	\ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
	\ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
	\ }

let g:restart_sessionoptions = 'blank,buffers,curdir,folds,localoptions,tabpages'

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = 
	\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

let g:vimfiler_as_default_explorer = 1
