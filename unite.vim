nnoremap <silent> ;b :Unite file_mru<CR>
nnoremap <silent> ;f :UniteWithBufferDir file<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
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

let s:converter = {
      \ 'name' : '_converter_full_path_addr',
      \ 'description' : 'converts word and addr to full path of filename',
      \}

function! s:converter.filter(candidates, context)
  for candidate in a:candidates
    let path = get(candidate, 'action__path', candidate.word)
    let candidate.word = unite#util#substitute_path_separator(
          \ fnamemodify(path, ':p'))
    let candidate.abbr = candidate.word
  endfor

  return a:candidates
endfunction

call unite#define_filter(s:converter)
call unite#custom#source('file', 'converters', ['_converter_full_path_addr'])

" vim: expandtab shiftwidth=2 tabstop=2 softtabstop=2
