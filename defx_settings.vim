set encoding=utf8

call defx#custom#option('_', #{
\   winwidth: 50,
\   split: 'vertical',
\   direction: 'topleft',
\   show_ignored_files: 1,
\   columns: 'indent:git:icons:filename:mark'
\ })

call defx#custom#column('git', 'raw_mode', 1)

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort

  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ? defx#do_action('open_tree', 'toggle') : defx#do_action('open', 'choose')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ?  defx#do_action('open_tree') :  defx#do_action('open', 'choose')
  nnoremap <silent><buffer><expr> L
  \ defx#is_directory() ?  defx#do_action('open') :  defx#do_action('open', 'drop')
  nnoremap <silent><buffer><expr> v
  \ defx#do_action('open', 'rightbelow vsplit')
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('open', 'rightbelow split')
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('open', 'tabnew')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ line(".") == 1
  \ ? defx#do_action('cd', ['..'])
  \ : defx#is_opened_tree()
  \   ? defx#do_action('open_tree', 'toggle')
  \   : defx#do_action('search', fnamemodify(defx#get_candidate().action__path, ':h'))
  nnoremap <silent><buffer><expr> H
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> <Esc><Esc>
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> a
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

