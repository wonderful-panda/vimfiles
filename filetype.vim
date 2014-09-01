augroup myfiletypedetect
    au!
    au BufRead,BufNewFile *.pck    set filetype=plsql
    au BufRead,BufNewFile *.sql    setfiletype plsql
    au BufRead,BufNewFile *.moin   setfiletype moin
    au BufRead,BufNewFile *.wiki   setfiletype moin
    au BufRead,BufNewFile *.trac   setfiletype moin
    au BufRead,BufNewFile *.go     set filetype=go

    au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec   setfiletype ruby
    au BufNewFile,BufRead *.builder,*.rxml,*.rjs       setfiletype ruby
    au BufNewFile,BufRead [rR]akefile,*.rake       setfiletype ruby
    au BufNewFile,BufRead [rR]antfile,*.rant       setfiletype ruby
    au BufNewFile,BufRead *.erb,*.rhtml            setfiletype eruby

    au BufNewFile,BufRead *.pc setfiletype c
augroup END

augroup myfiletypesetting
    au!
    au FileType ruby setl tabstop=4 expandtab shiftwidth=4

    au FileType python setl indentkeys+=0# colorcolumn=80

    au FileType xml setl tabstop=2 expandtab shiftwidth=2

    au FileType plsql setl autoindent
                        \   smartindent cinwords=IF,ELSE,LOOP,BEGIN,EXCEPTION
                        \   tabstop=4 shiftwidth=4 softtabstop=4
                        \   foldmethod=syntax

    au FileType vim setl tabstop=4 shiftwidth=4 softtabstop=4

    au FileType go setl tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab 
                    \    makeprg=go\ build errorformat=%f:%l:\ %m
    au BufWritePre *.go Fmt

    function! s:foldexpr_trac(lnum)
        let l:line = getline(a:lnum)
        let l:matches = matchlist(l:line, '\v^([=]{1,5})\s')
        if empty(l:matches)
            return "="
        else
            return len(l:matches[1]) == 1 ? "0" : ">" . (len(l:matches[1])-1) 
        endif
    endfunction
    au FileType moin setl foldenable foldmethod=expr foldexpr=s:foldexpr_trac(v:lnum)
    au FileType moin setl tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent

    function! s:foldexpr_diff(lnum)
        let l:line = getline(a:lnum)
        if l:line[0:2] == '==='
            return ">1"
        elseif l:line[0:1] == '@@'
            return ">2"
        else
            return "="
        endif
    endfunction

    au FileType diff setl foldenable foldmethod=expr foldexpr=s:foldexpr_diff(v:lnum)

    function! s:agit_settings()
        nmap <silent><buffer>x <Plug>(agit-exit)
        unmap <buffer>q
    endfunction
    au FileType agit call s:agit_settings()
    au FileType agit_stat call s:agit_settings()
    au FileType agit_diff call s:agit_settings()

    au FileType help nnoremap <buffer><Esc> :q<CR> 
augroup END

