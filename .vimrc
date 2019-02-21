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

" Hide file explorer banner.
let g:netrw_banner = 0

" Split in sensible directions.
set splitbelow
set splitright

" Set file encoding.
set encoding=utf-8

" Set line numbering options.
set number relativenumber

" Set tab representation.
set tabstop=4

" Set shift width.
set shiftwidth=4

" Set timeout on <esc>. This is vital for not 
" being extra fucking slow on exiting insert mode.
set timeoutlen=0 ttimeoutlen=0

" Set color representation.
set term=screen-256color
colorscheme wal 

" Persistent undo/redo. Very useful.
set undofile
set undodir=~/.vim/undodir/

" Let vim interpret modelines.
set modeline

" Enable sytax and filetype plugins.
filetype off
syntax 	 on
filetype plugin indent on

" Easier command mode.
nnoremap , :
nnoremap : <Nop>

" Find and replace in normal.
nnoremap <C-c> :%s/

" Edit without needing to write
nnoremap <S-e> :edit! <Space>

" Remove ex mode entry and remap to 
" visual block mode.
nnoremap Q <Nop>
nnoremap Q <C-v>

" Unmap annoying justify text thing.
nnoremap J <Nop>

" Make r be replace in normal, 
" operator and visual modes.
nnoremap r c
onoremap r c
vnoremap r c

" View buffers.
nnoremap <C-b> :buffers<CR>:buffer!<Space>

" More comfortable start and end of line shortcuts
" in normal, (operator) pending and visual modes.
nnoremap <C-a> ^
nnoremap <C-e> $
onoremap <C-a> ^
onoremap <C-e> $
vnoremap <C-a> ^ 
vnoremap <C-e> $

" Home, end, backspace, delete and forward backward navigation 
" in insert/command mode.
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-o> <BackSpace>
inoremap <C-d> <Del>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
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

" Stop arrow key navigation, 
" backspace and enter keys in insert
" and normal.
nnoremap <Up> 		 <Nop>
nnoremap <Down> 	 <Nop>
nnoremap <Left> 	 <Nop>
nnoremap <Right> 	 <Nop>
inoremap <Up> 		 <Nop>
inoremap <Down> 	 <Nop>
inoremap <Left> 	 <Nop>
inoremap <Right> 	 <Nop>
inoremap <Backspace> <Nop>
inoremap <Return>    <Nop>

" Copy/Paste to X clipboard
" in normal and visual modes.
nnoremap <C-P> o<Esc>"+p
nnoremap <C-Y> "+y
nnoremap <C-D> "+d
vnoremap <C-Y> "+y
vnoremap <C-P> "+p
vnoremap <C-D> "+d

" Navigation.
nnoremap f     <C-f>
nnoremap K     <C-b>
nnoremap <C-f> f
vnoremap f     <C-f>
vnoremap K     <C-b>

" Reload i3 config, .vimrc and Xresources on write.
autocmd BufWritePost config silent! execute "!i3-msg reload" | redraw!
autocmd BufWritePost .Xresources silent! execute "!xrdb ~/.Xresources" | redraw!
autocmd BufWritePost config.h,config.def.h silent! execute "!make install" | redraw!

" Rewrite ms documents on write.
autocmd BufwritePost *.ms silent! execute "!groff -ms -Tpdf % > %:r.pdf" | redraw!

" Strip whitespace on write with
" - Haskell
" - C
" - Python
" - Prolog
" - Bash
autocmd BufWritePre *.c,*.py,*.pl,*.sh,*.hs,*.md :%s/\s\+$//e

" Compile git-markdown to html5 on write. This links the document against the
" style sheet in ~/Templates.
autocmd BufWritePost *.md silent! execute "!pandoc % -f markdown_github -t html5 --css ~/Templates/github.css -o %:r.html" | redraw!
