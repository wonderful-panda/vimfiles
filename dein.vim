let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir)
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

let s:toml = '~/.vim/settings/dein.toml'
let s:toml_lazy = '~/.vim/settings/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [s:toml, s:toml_lazy])

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on

