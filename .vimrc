if has('gui')
    set encoding=utf-8
endif
if has('win32') && has('gui')
    au GUIEnter * simalt ~x
    set guifont=Envy_Code_R_for_Powerline:h10:cANSI
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
    if !executable('jvgrep')
        call system('go get github.com/mattn/jvgrep')
    endif
endif
source ~/.vim/settings/bundle.vim
source ~/.vim/settings/unite.vim
source ~/.vim/settings/filetype.vim
nnoremap J <C-d>
nnoremap K <C-u>

nnoremap  <C-x> :QuickRun<CR>

inoremap <C-Space> <C-x><C-o>

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
set nobackup
set iminsert=0
set imsearch=-1
set shellslash
set cursorline
set cmdheight=1
set wildmenu
set wildmode=longest:full,full
set undodir=~/.vim/undo
if !isdirectory(&undodir)
  call mkdir(&undodir)
endif
set backupcopy=yes

if has('gui')
    " gvim専用の設定
    set ambiwidth=auto
    set listchars=tab:»\ 
    set list

    colorscheme jellybeans
    hi Comment gui=NONE
    hi CursorLine gui=underline guifg=NONE guibg=NONE

    let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'active': {
        \   'left': [['mode', 'paste'], ['readonly', 'filename', 'modified', 'fugitive']]
        \ },
        \ 'component': {
        \   'readonly': '%{&readonly ? "\u2B64" : ""}',
        \   'fugitive': '%{exists("*fugitive#head") && fugitive#head() != "" ? "\u2B60 " . fugitive#head() : ""}',
        \ },
        \ 'component_visible_condition': {
        \   'readonly': '(&readonly)',
        \   'fugitive': '(exists("*fugitive#head") && fugitive#head() != "")',
        \ },
        \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
        \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
        \ }
else
    colorscheme industry
    hi CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
endif

let g:restart_sessionoptions = 'blank,buffers,curdir,folds,localoptions,tabpages'

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = 
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\w*'
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
 
let g:vimfiler_as_default_explorer = 1

command! MessCopy call s:messcopy()
function! s:messcopy()
    redir @+>
    silent messages
    redir END
endfunction

if executable('jq')
    command! -nargs=? Jq call s:Jq(<f-args>)
    function! s:Jq(...)
        if 0 == a:0
            let l:arg = "."
        else
            let l:arg = a:1
        endif
        execute '%! jq "' . l:arg . '"'
    endfunction
endif

let g:lexima_enable_basic_rules = 1

