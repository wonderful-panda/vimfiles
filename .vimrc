set encoding=utf8

if has('win32') && has('gui')
  au GUIEnter * simalt ~x
  func! s:on_gui_enter()
    set cmdheight=1
    colorscheme ayu
    call lightline#enable()
  endfunc
  au VimEnter * call s:on_gui_enter()
endif
let s:config_dir = expand('<sfile>:p:h') 

func! SourceFromConfigDir(relpath) abort
  exe 'source ' . s:config_dir . '/' . a:relpath
endfunc

let mapleader = ";"

set guifont=HackGenNerd:h12:cSHIFTJIS

if filewritable(s:config_dir . '/localenv.vim')
  call SourceFromConfigDir('./localenv.vim')
endif

call SourceFromConfigDir('./dein_settings.vim')

nnoremap J <C-d>
nnoremap K <C-u>

set shellslash
set hlsearch
set number
set shiftwidth=2
set tabstop=2
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
set wildmenu
set wildmode=longest:full,full
set undodir=~/.vim/undo
if !isdirectory(&undodir)
  call mkdir(&undodir)
endif
set backupcopy=yes
set ambiwidth=double
" Make powerline symbols single width
call setcellwidths([[0xe0b0, 0xe0bf, 1]])
set listchars=tab:>\ 

hi Comment gui=NONE

let g:restart_sessionoptions = 'blank,buffers,curdir,folds,localoptions,tabpages'


