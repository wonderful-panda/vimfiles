function! myconfig#source(relpath) abort
  exe 'source ' . g:config_dir . '/' . a:relpath
endfunction

