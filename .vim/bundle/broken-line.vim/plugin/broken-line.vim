
setlocal linebreak

function! CheckLineBreak()
    let l:len = length(getline('.'))

    let l:wid = winwidth(0) " Tentative guess at real buffer width
    let l:wid -= (&numberwidth * (&number || &relativenumber))
    let l:wid -= &foldcolumn

endfunction
