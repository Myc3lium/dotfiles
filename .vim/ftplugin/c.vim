set sw=4
set sts=4

if !exists('*PreProcessView')
    function! PreProcessView()
        :%y
        :new
        normal! p
        :%! cpp
        execute "%s/\n\+/\r"
        setlocal filetype=c
    endfunction
endif
command! PreProcessView silent! call PreProcessView()
