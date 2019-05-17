"
"               ███
"              ▒▒▒
"  █████ █████ ████  █████████████   ████████   ██████
" ▒▒███ ▒▒███ ▒▒███ ▒▒███▒▒███▒▒███ ▒▒███▒▒███ ███▒▒███
"  ▒███  ▒███  ▒███  ▒███ ▒███ ▒███  ▒███ ▒▒▒ ▒███ ▒▒▒
"  ▒▒███ ███   ▒███  ▒███ ▒███ ▒███  ▒███     ▒███  ███
"   ▒▒█████    █████ █████▒███ █████ █████    ▒▒██████
"    ▒▒▒▒▒    ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒      ▒▒▒▒▒▒

" ~~~~# Main Options #~~~~
" *Always* show status line, tabs and command.
set laststatus=2
set showtabline=2
set showcmd

" Highlight search results. Use C-l to un-highlight.
set hlsearch
nnoremap <silent><C-l> :noh<Cr>

" Set spell check options. Spell check is disabled within quote marks.
set spelllang=en_gb,en_us
syntax match quoteblock /"[^"]\+"/ contains=@NoSpell

" Set default file encoding.
set encoding=utf-8

" Set line numbering options.
set number relativenumber

" Set tab representation and shift width.
" 'set expandtab' will set tabs to be spaces.
" However this will not work with auto-indent 
" produced tabs.
set tabstop=4
set shiftwidth=4

" Highlight control chars. Toggle show with
" <s> while in normal mode.
set listchars=tab:╎\ ,eol:§,nbsp:␣,trail:·,extends:⟩,precedes:⟨
nnoremap <silent>s :set list!<Cr>
inoremap <Tab> <Space><Space><Space><Space>

" Set timeout on Escape. This is vital for not
" being extra slow on exiting insert mode. 
" If this is zero it interferes with leader mappings.
set timeout timeoutlen=64 ttimeoutlen=64
nnoremap <Space> <Nop>
let mapleader=";"
inoremap jk <Esc>

" Set colour representation.
colorscheme wal
set term=screen-256color
set background=light

" Backup swap files in a more useful place.
" Move viminfo file somewhere more appropriate.
" Set persistent undo/redo. Very useful.
set undofile
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set viminfo+=n~/.vim/viminfo
set undodir=~/.vim/undodir/

" Let vim interpret mode lines.
set modeline

" ~~~~# Plugin Options #~~~~
" Enable plugins and set relevant options.

" Set GUI/terminal specific options.
let g:pathogen_disabled = []
if !has('gui_running')
    call add(g:pathogen_disabled, 'lightline.vim')

	" Vim move settings. You need to set <A-*>
	" for alt to work in the terminal.
	execute "set <A-h>=\eh"
	execute "set <A-j>=\ej"
	execute "set <A-k>=\ek"
	execute "set <A-l>=\el"
endif
call pathogen#infect()

" Haskell-vim settings
filetype  off
syntax    on
filetype  plugin indent on
set omnifunc=syntaxcomplete#Complete
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" lightline.vim settings.
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
	  \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component': {
      \ },
      \ 'component_function': {
      \ },
	  \ 'separator': { 'left': '|', 'right': '|' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" Hide file explorer banner.
let g:netrw_banner = 0

" ~~~~# Key Mappings #~~~~
" Easier command mode.
nnoremap , :
nnoremap : <Nop>
vnoremap , :
vnoremap : <Nop>

" Set auto-increment options
nnoremap <C-v> <C-a>

" Find and replace in normal.
nnoremap <C-c> :%s/

" \%V searches only in the current selection- This will behave the 
" same as :s/ in visual line mode, but will make sure no unintended
" replacements are made in visual block mode.
vnoremap <C-c> :s/\%V
vnoremap <S-w> :s/\%V./ /g<Cr>

" View buffers.
nnoremap <C-b> :buffers<CR>:buffer!<Space>

" Edit new files/buffers without needing to write the current one.
nnoremap <S-e>   :tabedit!<Space>
nnoremap <Tab>   :tabnext<Cr>
nnoremap <S-Tab> :tabprev<Cr>
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
set completeopt=longest,menuone
inoremap <Leader>k <C-x><C-k>
inoremap <Leader>f <C-x><C-f>
inoremap <Leader>o <C-x><C-o>

" Dmenu integration for searching spelling correction. Replaces `z=`.
function DmenuCorrect()
	let word=system("$HOME/.bin/dmenuw -i -l 8 2>/dev/null", spellsuggest(expand("<cword>")))
	if len(word) != 0 
		exe "normal ciw". word[0:-2]
	endif
endfunction
nnoremap <silent>z= :call DmenuCorrect()<Cr>

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

" ~~~~# AutoCommands/ AuGroups #~~~~
" Reload i3 config, header and Xresources on write.
autocmd BufWritePost config                  silent! execute "!i3-msg reload"                           | redraw!
autocmd BufWritePost .Xresources             silent! execute "!xrdb ~/.Xresources"                      | redraw!
autocmd BufWritePost config.h,config.def.h   silent! execute "!make install"                            | redraw!
autocmd BufWritePost i3blocks.conf           silent! execute "!pkill i3bar && i3bar --bar_id bar-0 &" | redraw!
autocmd BufWritePost dunstrc                 silent! execute "!killall dunst; dunst &"                  | redraw!

" Set spelling on plain-language files.
" Compile ms documents on write.
" Strip whitespace on write with Haskell, C, Python, Prolog, Bash.
autocmd BufReadPost  *.md,*.MD,*.ms                silent! setlocal spell
autocmd BufwritePost *.ms silent! execute "!refer -S -P -p references % | groff -ms -Tpdf > %:r.pdf" | redraw!
autocmd BufWritePre  *.c,*.h,*.py,*.pl,*.sh,*.hs,*.md :%s/\s\+$//e

" Change tabs to spaces for Haskell files. This fixes a lot 
" of issues with parse errors due to vim's handling of indent
" detection.
autocmd BufWritePre *.hs :%s/\t/    /ge

" Compile git-markdown to html5 on write. This links the document against the
" style sheet in ~/Templates.
autocmd BufWritePost *.md silent! execute "!pandoc % -f markdown_github -t html5 --css ~/Templates/github.css -o %:r.html" | redraw!

" Start scratchpad buffer if no file arguments.
autocmd VimEnter * call ScratchPad() | hi ModeMsg ctermfg=2 ctermbg=8
function ScratchPad()
	if argc() == 0
		setlocal buftype=nofile
		setlocal bufhidden=hide
		setlocal noswapfile
		file      Scratchpad\ 
	endif
endfunction
