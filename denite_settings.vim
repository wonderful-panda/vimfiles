call denite#custom#option('_', #{
  \   prompt: '>',
  \   split: 'horizontal',
  \ })

call denite#custom#option('grep', #{
  \   split: 'horizontal',
  \   post_action: "open"
  \ })

autocmd FileType denite call s:denite_my_settings()

nmap <silent> <Leader>f :Denite file/rec<CR>
nmap <silent> <Leader>F :Denite file/rec/git<CR>
nmap <silent> <Leader>m :Denite file/old/proj<CR>
nmap <silent> <Leader>M :Denite file/old<CR>
nmap <silent> <Leader>gc :Denite grep -buffer-name=grep<CR>
nmap <silent> <Leader>gb :DeniteBufferDir grep -buffer-name=grep<CR>
nmap <silent> <Leader>gp :DeniteProjectDir grep -buffer-name=grep<CR>

function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> <Esc><Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--hidden', '--glob', '!.git', '--color', 'never'])

" Change default action.
call denite#custom#kind('file', 'default_action', 'split')
call denite#custom#source('grep', 'default_action', 'drop')

call denite#custom#var('grep', {
  \ 'command': ['rg'],
  \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
  \ 'recursive_opts': [],
  \ 'pattern_opt': ['--regexp'],
  \ 'separator': ['--'],
  \ 'final_opts': [],
  \ })

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
  \ ['git', 'ls-files', '-co', '--exclude-standard'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
  \ [ '.git/', 'node_modules/'])

call denite#custom#alias('source', 'file/old/proj', 'file/old')
call denite#custom#source(
  \ 'file/old/proj', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
