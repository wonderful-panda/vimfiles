if has('gui')
    set encoding=utf-8
endif
if has('win32')
    au GUIEnter * simalt ~x
    set guifont=Ricty_Diminished_for_Powerline:h11:cSHIFTJIS
else
    set guifont=Ricty\ for\ Powerline\ 11
endif

if filereadable(fnamemodify('~/.vim/settings/localenv.vim', ':p'))
    source ~/.vim/settings/localenv.vim
endif
if executable('go') && $GOROOT != ''
    if !executable('gocode')
        call system('go get github.com/nsf/gocode')
        call system($GOPATH . '/src/github.com/nsf/gocode/vim/update.sh')
    endif
    if !executable('golint')
        call system('go get github.com/golang/lint/golint')
    endif
    set rtp+=$GOROOT/misc/vim
    exe 'set rtp+=' . $GOPATH . '/src/github.com/golang/lint/misc/vim'
endif
source ~/.vim/settings/bundle.vim
source ~/.vim/settings/unite.vim
source ~/.vim/settings/filetype.vim
nnoremap J <C-d>
nnoremap K <C-u>

nnoremap  <C-x> :QuickRun<CR>

set hlsearch
set number
set shiftwidth=4
set tabstop=4
set expandtab
set fileencodings=utf8,cp932
set laststatus=2
set backspace=start,eol,indent
set guioptions=egrLtb
set nowrap
set noswapfile
set iminsert=0
set imsearch=-1
set ambiwidth=auto
set shellslash

if has('gui')
    " gvim専用の設定
    set listchars=tab:»\ 
    set list

    let g:jellybeans_overrides = {
        \ 'Comment' : {'gui': 'none'},
        \ }
    colorscheme jellybeans

    let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'component': {
        \   'readonly': '%{&readonly? "\u2B64" : "" }',
        \ },
        \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
        \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
        \ }
else
    colorscheme industry
endif

let g:restart_sessionoptions = 'blank,buffers,curdir,folds,localoptions,tabpages'

let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_auto_loc_list = 1

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = 
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

let g:vimfiler_as_default_explorer = 1

command! MessCopy call s:messcopy()
function! s:messcopy()
    redir @+>
    silent messages
    redir END
endfunction

