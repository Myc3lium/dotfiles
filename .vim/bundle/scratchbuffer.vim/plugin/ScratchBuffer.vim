
let g:scratchbufferno = bufnr('~( ^·ω·^)', 1)
call setbufvar(g:scratchbufferno, "&buftype",        "nofile")
call setbufvar(g:scratchbufferno, "&filetype",       "vim")
call setbufvar(g:scratchbufferno, "&hidden",         1)
call setbufvar(g:scratchbufferno, "&number",         0)
call setbufvar(g:scratchbufferno, "&relativenumber", 0)

let g:scratchbufferopen = 0
function! ToggleScratchBuffer()
    if !g:scratchbufferopen
        let g:scratchbufferopen = 1
        execute printf('sbuffer %d', g:scratchbufferno)
    else
        let g:scratchbufferopen = 0
        call win_gotoid(g:scratchbufferno)
        execute printf('close %d',  g:scratchbufferno)
    endif
endfunction

function! CloseIfLeavingWin()
    if bufnr('%') == g:scratchbufferno
        let g:scratchbufferopen = 0
        execute printf('close %d',  g:scratchbufferno)
    endif
endfunction

command! ToggleScratchBuffer call ToggleScratchBuffer()

nnoremap <silent> s<Esc> :ToggleScratchBuffer<Cr>
vnoremap <silent> sy y:ToggleScratchBuffer<Cr>o<Esc>p
vnoremap <silent> sd d:ToggleScratchBuffer<Cr>o<Esc>p
vnoremap <silent> sa y:ToggleScratchBuffer<Cr>Go<Cr><Esc>p

autocmd WinLeave * :call CloseIfLeavingWin()
