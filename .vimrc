set showcmd
set encoding=utf-8
set number relativenumber
set tabstop=4
set shiftwidth=4
set timeoutlen=0 ttimeoutlen=0
set term=screen-256color

colorscheme delek

let mapleader = "<Space>"
syntax on
filetype plugin indent on
nnoremap <F12> :buffers<CR>:buffer<Space>
nnoremap <C-P> "+p
nnoremap <C-Y> "+y

:command Ecpt w !tee | gpg -ac --cipher-algo TWOFISH | clip
:command Dcpt w !tee | gpg -d
:command Cc !gcc %:t -o %:t.out ; rm %:t.out
:command W w
:command Q q
:command WQ wq
