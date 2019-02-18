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

" set timeout on <esc>. This is vital for not 
" being extra fucking slow on exiting insert mode.
set timeoutlen=0 ttimeoutlen=0

" set color representation.
set term=screen-256color

" Persistant undo/redo
set undofile
set undodir=~/.vim/undodir

colorscheme wal 

" enable sytax and filetype plugins.
filetype off
syntax on
filetype plugin indent on

" Easier command mode.
nnoremap , :

"Easier search mode
nnoremap \ /

" Find and replace in normal.
nnoremap <C-c> :%s/

" Edit without needing to write
nnoremap <S-e> :edit! <Space>

" Stop arrow key navigation. 
nnoremap <Up> 		<Nop>
nnoremap <Down> 	<Nop>
nnoremap <Left> 	<Nop>
nnoremap <Right> 	<Nop>
inoremap <Up> 		<Nop>
inoremap <Down> 	<Nop>
inoremap <Left> 	<Nop>
inoremap <Right> 	<Nop>

" Stop backspace and enter keys in insert.
inoremap <Backspace> <Nop>
inoremap <Return>    <Nop>

" Remove ex mode entry. 
nnoremap Q <Nop>

" More comfortable quit!.
" nnoremap <C-q> :q! <Cr>

" Write in insert and normal mode.
" inoremap <C-s> :w <Cr>
" nnoremap <C-s> :w <Cr>

" More comfortable visual block mode.
nnoremap <C-n> <C-v>

" Unmap annoying justify text thing.
nnoremap J <Nop>

" View buffers.
nnoremap <C-b> :buffers<CR>:buffer!<Space>

" More comfortable start and end of line shortcuts
" in normal, pending and visual modes.
nnoremap <C-a> ^
nnoremap <C-e> $
onoremap <C-a> ^
onoremap <C-e> $

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
cnoremap <C-n> <C-Left>
cnoremap <C-m> <C-Right>


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

" Navigation.
nnoremap <L>   l
nnoremap <H>   h
nnoremap f   <C-f>
nnoremap K   <C-b>
vnoremap f   <C-f>
vnoremap K   <C-b>

" Misc commands.
command D  read !date
command W w
command Q q
command WQ wq


" Reload i3 config and Xresources on write.
autocmd BufWritePost config silent! execute "!i3-msg reload" | redraw!
autocmd BufWritePost .Xresources silent! execute "!xrdb ~/.Xresources" | redraw!
autocmd BufWritePost config.h,config.def.h silent! execute "!make install" | redraw!


" Rewrite ms documents on write
autocmd BufwritePost *.ms silent! execute "!groff -ms -Tpdf % > %.pdf" | redraw!

" Strip whitespace on write with
" - Haskell
" - C
" - Python
" - Prolog
" - Bash
autocmd BufWritePre *.c,*.py,*.pl,*.sh,*.hs,*.md :%s/\s\+$//e

" Compile g-markdown to html5 on write.
autocmd BufWritePost *.md silent! execute "!pandoc % -f markdown_github -t html5 --css ~/Templates/github.css -o %.html" | redraw!
