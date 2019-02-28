"
"               ███
"              ▒▒▒
"  █████ █████ ████  █████████████   ████████   ██████
" ▒▒███ ▒▒███ ▒▒███ ▒▒███▒▒███▒▒███ ▒▒███▒▒███ ███▒▒███
"  ▒███  ▒███  ▒███  ▒███ ▒███ ▒███  ▒███ ▒▒▒ ▒███ ▒▒▒
"  ▒▒███ ███   ▒███  ▒███ ▒███ ▒███  ▒███     ▒███  ███
"   ▒▒█████    █████ █████▒███ █████ █████    ▒▒██████
"    ▒▒▒▒▒    ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒      ▒▒▒▒▒▒

if has("win32")
	nnoremap <C-x> <Esc>
endif

" *Always* show statusline and tabs.
set laststatus=2
set showtabline=2

" Highlight control chars. Toggle show with
" <s> while in normal mode.
set listchars=tab:╎\ ,eol:§,nbsp:␣,trail:·,extends:⟩,precedes:⟨
nnoremap s :set list!<Cr>

" Highlight search results.
set hlsearch

" Show the current command in the status line.
set showcmd

" Hide file explorer banner.
let g:netrw_banner = 0

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

" Backup swap files in a more useful place.
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" Let vim interpret modelines.
set modeline

" Enable sytax and filetype plugins.
filetype off
syntax   on
filetype plugin indent on

" Easier command mode.
nnoremap , :
nnoremap : <Nop>

" Find and replace in normal.
nnoremap <C-c> :%s/

" Edit without needing to write
nnoremap <S-e>   :tabedit! <Space>
nnoremap <Tab>   :tabnext<Cr>
nnoremap <S-Tab> :tabprev<Cr>
nnoremap <C-w>   :tabclose<Cr>
cabbrev  h       tab h

" Remove ex mode entry and remap to
" visual block mode.
nnoremap Q  <Nop>
nnoremap Q  <C-v>

" Unmap annoying justify text thing.
nnoremap J  <Nop>

" Make r be replace in normal,
" operator and visual modes.
nnoremap r  c
onoremap r  c
vnoremap r  c

" View buffers.
nnoremap <C-b> :buffers<CR>:buffer!<Space>

" More comfortable start and end of line shortcuts
" in normal, (operator) pending and visual modes.
nnoremap <C-a>  ^
nnoremap <C-e>  $
onoremap <C-a>  ^
onoremap <C-e>  $
vnoremap <C-a>  ^
vnoremap <C-e>  $

" Home, end, backspace, delete and forward backward navigation
" in insert/command mode.
inoremap <C-a>  <Home>
inoremap <C-e>  <End>
inoremap <C-o>  <BackSpace>
inoremap <C-d>  <Del>
inoremap <C-b>  <Left>
inoremap <C-f>  <Right>
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>
cnoremap <C-o>  <BackSpace>
cnoremap <C-d>  <Del>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-h>  <Down>
cnoremap <C-k>  <Up>
cnoremap <C-n>  <C-Left>
cnoremap <C-m>  <C-Right>

" Stop arrow key navigation,
" backspace and enter keys in all modes save command.
nnoremap <Up> 		  <Nop>
nnoremap <Down> 	  <Nop>
nnoremap <Left> 	  <Nop>
nnoremap <Right> 	  <Nop>
inoremap <Up> 		  <Nop>
inoremap <Down> 	  <Nop>
inoremap <Left> 	  <Nop>
inoremap <Right> 	  <Nop>
inoremap <Backspace>  <Nop>
inoremap <Return>     <Nop>
vnoremap <Up> 		  <Nop>
vnoremap <Down> 	  <Nop>
vnoremap <Left> 	  <Nop>
vnoremap <Right> 	  <Nop>
vnoremap <Backspace>  <Nop>
vnoremap <Return>     <Nop>
onoremap <Up> 		  <Nop>
onoremap <Down> 	  <Nop>
onoremap <Left> 	  <Nop>
onoremap <Right> 	  <Nop>
onoremap <Backspace>  <Nop>
onoremap <Return>     <Nop>

" Copy/Paste to X clipboard
" in normal and visual modes.
nnoremap <C-P>  o<Esc>"+p
nnoremap <C-Y>  "+y
nnoremap <C-D>  "+d
vnoremap <C-Y>  "+y
vnoremap <C-P>  "+p
vnoremap <C-D>  "+d

" Navigation. Set C-f to work like f, so 
" the behaviour is effectively swapped.
onoremap <C-f>  f
nnoremap <C-f>  f
nnoremap f      <C-f>
nnoremap K      <C-b>
vnoremap f      <C-f>
vnoremap K      <C-b>

" Reload i3 config, header and Xresources on write.
autocmd BufWritePost config                 silent! execute "!i3-msg reload"       | redraw!
autocmd BufWritePost .Xresources            silent! execute "!xrdb ~/.Xresources"  | redraw!
autocmd BufWritePost config.h,config.def.h  silent! execute "!make install"        | redraw!

" Rewrite ms documents on write.
autocmd BufwritePost *.ms silent! execute "!groff -ms -Tpdf % > %:r.pdf" | redraw!

" Strip whitespace on write with Haskell, C, Python, Prolog, Bash.
autocmd BufWritePre *.c,*.h,*.py,*.pl,*.sh,*.hs,*.md :%s/\s\+$//e

" Compile git-markdown to html5 on write. This links the document against the
" style sheet in ~/Templates.
autocmd BufWritePost *.md silent! execute "!pandoc % -f markdown_github -t html5 --css ~/Templates/github.css -o %:r.html" | redraw!

" Start scratchpad buffer if no file args.
function ScratchPad()
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
	file 	 ScratchPad
endfunction

autocmd VimEnter * if eval("@%") == "" | call ScratchPad() | endif

hi ModeMsg ctermfg=2 ctermbg=8
