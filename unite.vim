nnoremap <silent> ;b :Unite file_mru<CR>
nnoremap <silent> ;f :UniteWithBufferDir file file/new directory/new<CR>
nnoremap <silent> ;c :UniteWithCurrentDir file file/new directory/new<CR>
nnoremap <expr> ;gc BuildGrepCommandLine('.')
nnoremap <expr> ;gb BuildGrepCommandLine('%:h')

function! BuildGrepCommandLine(dir) abort
  call neobundle#source(['unite.vim'])
  let dir = expand(a:dir)
  let target = input('Target: ', dir . '/**/*.')
  if empty(target)
    return ''
  endif
  let keyword = input('Keyword: ')
  if empty(keyword)
    return ''
  endif
  let cmdline = ':Unite grep:' . target . '::' . keyword . ' -no-quit -buffer-name=search-buffer' . "\n"
  return cmdline
endfunction

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

function! s:buffer_window(bufname) abort
  let bufnr = bufnr(a:bufname)
  if bufnr < 0
    return -1
  endif
  for w in range(1, winnr('$'))
    if winbufnr(w) == bufnr
      return w
    endif
  endfor
  return -1
endfunction

function! UniteGrepMove(direction) abort
  let winnr = s:buffer_window('search-buffer')
  if winnr < 0
    return
  endif
  exec winnr . 'wincmd w'
  if a:direction == 1
    exec "normal \<Plug>(unite_loop_cursor_down)"
  else
    exec "normal \<Plug>(unite_loop_cursor_up)"
  endif
  exec "normal \<Plug>(unite_do_default_action)"
endfunction

nnoremap ;n :call UniteGrepMove(1)<CR>
nnoremap ;p :call UniteGrepMove(2)<CR>

let g:unite_enable_start_insert=1

if executable('jvgrep')
  let g:unite_source_grep_command = 'jvgrep'
  let s:exclude_exts = [
        \ 'exe', 'dll', 'lib', 'ocx', 'pdb', 'pch', 'ilk', 'obj',
        \ 'ncb', 'bak', 'swp', 'jar', 'tlb', 'pyo', 'pyc', 'pyd',
        \ 'xls', 'doc', 'ppt', 'pdf', 'bmp', 'png', 'jpg', 'zip',
        \ 'cache', 'resources', 'class', 'nupkg',
        \ ]
  let g:unite_source_grep_default_opts = '-r8 ' . 
        \ '--exclude "(?i:/(\.git|\.hg|\.svn|\.bzr|bin|obj)$|(Debug|Release)$|\.(' . join(s:exclude_exts, '|') . ')$|/~)"'
  unlet s:exclude_exts
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
