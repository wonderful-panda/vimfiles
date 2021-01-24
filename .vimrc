set encoding=utf8

if has('win32') && has('gui')
  au GUIEnter * simalt ~x
endif
let s:config_dir = expand('<sfile>:p:h') 

func! SourceFromConfigDir(relpath) abort
  exe 'source ' . s:config_dir . '/' . a:relpath
endfunc

if filewritable(s:config_dir . '/localenv.vim')
  call SourceFromConfigDir('./localenv.vim')
endif

call SourceFromConfigDir('./dein_settings.vim')

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
set autoindent
set cursorline
set wildmenu
set wildmode=longest:full,full
set undodir=~/.vim/undo
if !isdirectory(&undodir)
  call mkdir(&undodir)
endif
set backupcopy=yes
set listchars=tab:>\ 

hi Comment gui=NONE

if has("nvim")
  set ambiwidth=single
else
  set ambiwidth=double
  " Make powerline symbols single width
  call setcellwidths([[0xe0b0, 0xe0bf, 1]])
  set guifont=HackGenNerd:h12:cSHIFTJIS
  let g:restart_sessionoptions = 'blank,buffers,curdir,folds,localoptions,tabpages'
endif

" MAPPINGS
let mapleader = ";"

nnoremap <silent> <Leader>f :Denite file/rec<CR>
nnoremap <silent> <Leader>F :Denite file/rec/git<CR>
nnoremap <silent> <Leader>m :Denite file/old/proj<CR>
nnoremap <silent> <Leader>M :Denite file/old<CR>
nnoremap <silent> <Leader>gc :Denite grep -buffer-name=grep<CR>
nnoremap <silent> <Leader>gb :DeniteBufferDir grep -buffer-name=grep<CR>
nnoremap <silent> <Leader>gp :DeniteProjectDir grep -buffer-name=grep<CR>

nnoremap <silent> <leader>da :Defx<CR>
nnoremap <silent> <leader>df :exe "Defx " . expand("%:h")<CR>
nnoremap <silent> <leader>dr :call defx#redraw()<CR>

nmap <silent> <F12> <plug>(lsp-definition)
nmap <silent> <C-F12> <plug>(lsp-peek-definition)
nmap <silent> <Space>a <plug>(lsp-code-action)
imap <silent> <C-a> <plug>(lsp-code-action)
nmap <silent> <Space>j <plug>(lsp-next-diagnostic)
nmap <silent> <Space>k <plug>(lsp-previous-diagnostic)
nmap <silent> <Space><Space> <plug>(lsp-hover)

nnoremap J <C-d>
nnoremap K <C-u>

tnoremap <Esc> <C-\><C-n>
