let mapleader = "<Space>"
set showcmd
syntax on
set encoding=utf-8
set number relativenumber
filetype plugin indent on
nnoremap <F12> :buffers<CR>:buffer<Space>
set timeoutlen=0 ttimeoutlen=0

:command Ecpt w !tee | gpg -ac --cipher-algo TWOFISH | clip
