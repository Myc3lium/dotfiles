let mapleader = "<Space>"
set showcmd
syntax on
set encoding=utf-8
set number relativenumber
filetype plugin indent on
nnoremap <F12> :buffers<CR>:buffer<Space>
set timeoutlen=0 ttimeoutlen=0
set term=screen-256color

:command Ecpt w !tee | gpg -ac --cipher-algo TWOFISH | clip
:command Cc !gcc %:t -o %:t.out ; rm %:t.out
:command W w
:command Q q
:command WQ wq
