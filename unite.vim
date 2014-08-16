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
	nnoremap <silent><buffer><expr> <C-k> unite#do_action('avobe')
	inoremap <silent><buffer><expr> <C-k> unite#do_action('avobe')
endfunction

let g:unite_enable_start_insert=1
