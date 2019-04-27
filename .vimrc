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
    inoremap <C-x> <Esc>
endif

" *Always* show status line, tabs and command.
set laststatus=2
set showtabline=2
set showcmd

" Highlight control chars. Toggle show with
" <s> while in normal mode.
set listchars=tab:╎\ ,eol:§,nbsp:␣,trail:·,extends:⟩,precedes:⟨
nnoremap <silent>s :set list!<Cr>
inoremap <Tab> <Space><Space><Space><Space>

" Enable mouse toggling on/off.
set mouse=
nnoremap <silent>m :exec &mouse != "" ? "set mouse=" : "set mouse=a"<Cr>

" Highlight search results. Use C-l to un-highlight.
set hlsearch
nnoremap <silent><C-l> :noh<Cr>

" Set spell check options.
set spelllang=en_gb
nnoremap <silent><C-s> :setlocal spell!<Cr>

" Set auto-increment options
nnoremap <C-v> <C-a>

" Hide file explorer banner.
let g:netrw_banner = 0

" Set file encoding.
set encoding=utf-8

" Set line numbering options.
set number relativenumber

" Set tab representation and shift width.
" set expandtab " will set tabs to be spaces.
set tabstop=4
set shiftwidth=4

" Set timeout on Escape. This is vital for not
" being extra fucking slow on exiting insert mode.
set timeoutlen=0 ttimeoutlen=0

" Set colour representation.
colorscheme wal
set term=screen-256color
set background=light

" Backup swap files in a more useful place.
" Move viminfo file somewhere more appropriate.
" Set persistent undo/redo. Very useful.
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set viminfo+=n~/.vim/viminfo
set undofile
set undodir=~/.vim/undodir/

" Let vim interpret mode lines.
set modeline

" Enable syntax and file-type plugins.
execute pathogen#infect()
filetype  off
syntax    on
filetype  plugin indent on
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


" Easier command mode.
nnoremap , :
nnoremap : <Nop>
vnoremap , :
vnoremap : <Nop>

" Find and replace in normal.
nnoremap <C-c> :%s/

" \%V searches only in the current selection- This will behave the 
" same as :s/ in visual line mode, but will make sure no unintended
" replacements are made in visual block mode.
vnoremap <C-c> :s/\%V

" View buffers.
nnoremap <C-b> :buffers<CR>:buffer!<Space>

" Edit new files/buffers without needing to write the current one.
nnoremap <S-e>   :tabedit!<Space>
nnoremap <Tab>   :tabnext<Cr>
nnoremap <S-Tab> :tabprev<Cr>
nnoremap <C-w>   :tabclose<Cr>
cabbrev  h       tab help

" Remove ex mode entry and remap to
" visual block mode.
nnoremap Q  <Nop>
nnoremap Q  <C-v>

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
nnoremap <Up>         <Nop>
nnoremap <Down>       <Nop>
nnoremap <Left>       <Nop>
nnoremap <Right>      <Nop>
inoremap <Up>         <Nop>
inoremap <Down>       <Nop>
inoremap <Left>       <Nop>
inoremap <Right>      <Nop>
inoremap <Backspace>  <Nop>
inoremap <Return>     <Nop>
vnoremap <Up>         <Nop>
vnoremap <Down>       <Nop>
vnoremap <Left>       <Nop>
vnoremap <Right>      <Nop>
vnoremap <Backspace>  d
vnoremap <Return>     di<Return>
onoremap <Up>         <Nop>
onoremap <Down>       <Nop>
onoremap <Left>       <Nop>
onoremap <Right>      <Nop>
onoremap <Backspace>  <Nop>
onoremap <Return>     <Nop>

" Autocomplete navigation, similar to command mode / readline.
inoremap <C-p> <Nop>
inoremap <C-n> <Nop>
inoremap <C-h> <C-n>
inoremap <C-k> <C-p>

" Delete/Copy/Paste to X clipboard
" in normal and visual modes.
nnoremap <C-P>  o<Esc>"+p
nnoremap <C-Y>  "+y
nnoremap <C-D>  "+d
vnoremap <C-Y>  "+y
vnoremap <C-P>  "+p
vnoremap <C-D>  "+d

" Navigation. Shift-j goes down a page, Shift-k goes up.
" nostartofline stops moving to the start of the line,
" allowing for keeping the current column position.
set nostartofline
" set scrolloff=9999

" Unmap annoying justify text feature in insert mode.
" Change to autocomplete toggle instead.
nnoremap <S-j>   <Nop>
nnoremap <S-j>   <C-e>
nnoremap <S-k>   <C-y>
nnoremap <C-S-j> <C-f>
nnoremap <C-S-k> <C-b>

vnoremap <S-j> <C-e>
vnoremap <S-k> <C-y>
vnoremap <C-S-j> <C-f>
vnoremap <C-S-k> <C-b>

" Reload i3 config, header and Xresources on write.
autocmd BufWritePost config                  silent! execute "!i3-msg reload"                           | redraw!
autocmd BufWritePost .Xresources             silent! execute "!xrdb ~/.Xresources"                      | redraw!
autocmd BufWritePost config.h,config.def.h   silent! execute "!make install"                            | redraw!
autocmd BufWritePost i3blocks.conf           silent! execute "!pkill i3bar && i3bar --bar_id bar-0 &" | redraw!
autocmd BufWritePost dunstrc                 silent! execute "!killall dunst; dunst &"                  | redraw!

" Set spelling on plain-language files.
autocmd BufReadPost  *.md,*.MD                silent! setlocal spell

" Compile ms documents on write.
autocmd BufwritePost *.ms silent! execute "!groff -e -ms -Tpdf % > %:r.pdf" | redraw!

" Strip whitespace on write with Haskell, C, Python, Prolog, Bash.
autocmd BufWritePre *.c,*.h,*.py,*.pl,*.sh,*.hs,*.md :%s/\s\+$//e

" Change tabs to spaces for Haskell files. This fixes a lot 
" of issues with parse errors due to vim's handling of indent
" detection.
autocmd BufWritePre *.hs :%s/\t/    /ge

" Compile git-markdown to html5 on write. This links the document against the
" style sheet in ~/Templates.
autocmd BufWritePost *.md silent! execute "!pandoc % -f markdown_github -t html5 --css ~/Templates/github.css -o %:r.html" | redraw!

" Start scratchpad buffer if no file arguments.
function ScratchPad()
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    file      Scratchpad\ 
endfunction
autocmd VimEnter * if eval("@%") == "" | call ScratchPad() | endif

hi ModeMsg ctermfg=2 ctermbg=8
