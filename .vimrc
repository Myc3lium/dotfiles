"
"         ██╷    ██╷   ████████╷   ████▖▗████╷   ████████     ████████╷
"         ██│    ██│      ██┌──┘   ██┌ ██┌ ██│   ██┌─── ██╷   ██┌─────┘
"         ██└┐   ██│      ██│      ██│ ██│ ██│   ██│    ██│   ██│
"         ███│  ███│      ██│      ██│ ██│ ██│   ██╵    ██│   ██│
"          ██│  ██┌┘      ██│      ██│ ██│ ██│   ███████ ─┘   ██│
"          ██╵  ██│       ██│      ██│ ██│ ██│   ██┌─── ██╷   ██│
"   ███╷    █████┌┘       ██╵      ██│ ██│ ██│   ██│    ██│   ██╵
"   ███│     ███┌┘     ████████╷   ██│ ██│ ██│   ██│    ██│   ████████╷
"   ╶──┘     ╶──┘      ╶───────┘   ╶─┘ ╶─┘ ╶─┘   ╶─┘    ╶─┘   ╶───────┘

" Show the current command in the status line.
set showcmd

" set hidden

" Hide file explorer banner
let g:netrw_banner = 0

" Edit without needing to write
nnoremap <S-e> :edit! <Space>

" split in sensible directions.
set splitbelow
set splitright

" set file encoding.
set encoding=utf-8

" set line numbering options.
set number relativenumber

" set tab representation.
set tabstop=4

" set .
set shiftwidth=4

" set timeout on <esc> ! vital for not being extra fucking slow on exiting
" insert mode ffs.
set timeoutlen=0 ttimeoutlen=0

" set color representation.
set term=screen-256color

colorscheme wal 

" enable sytax and filetype plugins.
syntax on
filetype plugin indent on

" Easier command mode.
nnoremap , :

" Stop arrow key navigation in normal mode.
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Remove ex mode entry. 
nnoremap Q <Nop>

" Unmap annoying justify text thing.
nnoremap J <Nop>

" view buffers.
nnoremap <C-b> :buffers<CR>:buffer!<Space>

" More comfortable start and end of line shortcuts
" in normal and visual modes.
nnoremap <C-a> ^
nnoremap <C-e> $

vnoremap <C-a> ^
vnoremap <C-e> $

" Home, end, backspace, delete and forward backward navigation 
" in insert.
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-o> <BackSpace>
inoremap <C-d> <Del>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" Home, end, backspace, delete and forward backward navigation 
" in command.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-o> <BackSpace>
cnoremap <C-d> <Del>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-h> <Down>
cnoremap <C-k> <Up>

" Copy/Paste to X clipboard
" in normal and visual modes.
nnoremap <C-P> o<Esc>"+p
nnoremap <C-Y> "+y
nnoremap <C-X> "+d

vnoremap <C-Y> "+y
vnoremap <C-P> "+p
vnoremap <C-X> "+d

" replace in visual and normal mode.
vnoremap r c
nnoremap r c

" Cycle buffers in normal mode.
" nnoremap <C-k> :bnext 	  <CR>
" nnoremap <C-j> :bprevious <CR>

" Navigation.
nnoremap <L>   l
nnoremap <H>   h
nnoremap f   <C-f>
nnoremap K   <C-b>
vnoremap f   <C-f>
vnoremap K   <C-b>

" Misc commands.
command Gr w !tee | groff -ms -Tpdf > %.pdf; pkill zathura; zathura %.pdf &
command D  read ! date
command Ge !groff -ms -e % -Tpdf > %.pdf; pkill zathura; zathura %.pdf &
command Ecpt w !tee | gpg -ac --cipher-algo TWOFISH | clip
command Dcpt w !tee | gpg -d
command Cc !gcc %:t -o %:t.out ; rm %:t.out
command W w
command Q q
command WQ wq
