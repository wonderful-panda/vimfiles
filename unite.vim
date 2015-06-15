nnoremap <silent> ;b :Unite file_mru<CR>
nnoremap <silent> ;f :UniteWithBufferDir file file/new<CR>
nnoremap <silent> ;gc :<C-u>Unite grep:. -no-quit -keep-focus -buffer-name=search-buffer<CR>
nnoremap <silent> ;gb :<C-u>execute ':Unite grep:' . 
                                  \ escape(unite#util#substitute_path_separator(expand('%:p:h')), ': ') .
                                  \ ' -no-quit -keep-focus -buffer-name=search-buffer'<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <silent><buffer> <C-n> <Plug>(unite_loop_cursor_down)
  nmap <silent><buffer> <C-p> <Plug>(unite_loop_cursor_up)
  nnoremap <silent><buffer><expr> <C-l> unite#do_action('right')
  inoremap <silent><buffer><expr> <C-l> unite#do_action('right')
  nnoremap <silent><buffer><expr> <C-h> unite#do_action('left')
  inoremap <silent><buffer><expr> <C-h> unite#do_action('left')
  nnoremap <silent><buffer><expr> <C-j> unite#do_action('below')
  inoremap <silent><buffer><expr> <C-j> unite#do_action('below')
  nnoremap <silent><buffer><expr> <C-k> unite#do_action('above')
  inoremap <silent><buffer><expr> <C-k> unite#do_action('above')
  nnoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nnoremap <silent><buffer> <Esc> :q<CR>
endfunction

let g:unite_enable_start_insert=1

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf8'
endif

call unite#custom#source('file', 'matchers', ['matcher_file_name'])
call unite#custom#source('file', 'converters', ['converter_file_directory'])
call unite#custom#profile('default', 'context', {'prompt': '> '})

let open_agit = {
      \ 'description' : 'open directory by agit',
      \ 'is_selectable' : 1,
      \ }

function open_agit.func(candidates)
  for candidate in a:candidates
    exec 'Agit --dir=' . candidate.action__path
  endfor
endfunction

call unite#custom_action('directory', 'open-agit', open_agit)
unlet open_agit

" vim: expandtab shiftwidth=2 tabstop=2 softtabstop=2
