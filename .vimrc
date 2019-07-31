" ┓ ┳  o  ┏┏┓  ┳━┓  ┏━┓   
" ┃┏┛  ┃  ┃┃┃  ┃┳┛  ┃     
" ┗┛   ┇  ┛ ┇  ┇┗┛  ┗━┛   

" ~~~~# Main Options #~~~~
" *Always* show status line, tabs and command. Disable showing mode.
set noshowmode
set laststatus=2
set showtabline=2
set showcmd

" Highlight search results. Use C-l to un-highlight.
set hlsearch
nnoremap <silent><C-l> :nohlsearch<Cr>

" Incremental search.
set incsearch

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
" being extra slow on exiting insert mode, but
" if this is zero it interferes with leader mappings.
set timeout timeoutlen=64 ttimeoutlen=64
let mapleader=";"

" Set colour representation.
colorscheme wal
set term=screen-256color
set background=light
let g:gruvbox_background = 'light'

" Backup swap files in a more useful place.
" Move viminfo file somewhere more appropriate.
" Set persistent undo/redo. Very useful.
set undofile
set undodir=~/.vim/undodir/
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set viminfo+=n~/.vim/viminfo

" Don't let vim interpret mode lines.
set nomodeline

" ~~~~# Plugin Options #~~~~
" Enable plugins and set relevant options.
call pathogen#infect()
filetype  off
syntax    on
filetype  plugin indent on

" Haskell-vim settings
set omnifunc=syntaxcomplete#Complete
let g:haskell_enable_quantification     = 1  " to enable highlighting of `forall`
let g:haskell_enable_recursivedo        = 1  " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax        = 1  " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms   = 1  " to enable highlighting of `pattern`
let g:haskell_enable_typeroles          = 1  " to enable highlighting of type roles
let g:haskell_enable_static_pointers    = 1  " to enable highlighting of `static`
let g:haskell_backpack                  = 1  " to enable highlighting of backpack keywords

function! WordCount()
	return wordcount()['words'] . ' words'
endfunction

function! ToggleProse()
	setlocal formatoptions=ant
	setlocal textwidth=80
	setlocal wrapmargin=0
	setlocal foldcolumn=10
	setlocal columns=100
    setlocal nonumber norelativenumber

    :set wm=2
    :set wrap linebreak nolist
endfunction

" lightline.vim settings.
let g:lightline = {
      \ 'colorscheme': has('gui_running') ? 'gruvbox' : 'wal',
      \ 'active': {
      \   'left':  [[ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ]],
	  \   'right': [[ 'lineinfo'      ], [ 'percent' ],
      \             [ 'fileformat', 'fileencoding', 'filetype', 'spell', 'wordCount']]
      \ },
	  \ 'separator':    { 'left': '▓▒░',  'right' : '░▒▓' },
      \ 'subseparator': { 'left': '|',    'right' : '|'   },
	  \ 'tabline_separator':    { 'left': '|', 'right' : '|' },
      \ 'tabline_subseparator': { 'left': '|', 'right' : '|' },
	  \ 'mode_map' : {
	  \     'no'     : '[?]',
	  \     'n'      : 'NORMAL',
	  \     'i'      : 'INSERT',
	  \     'v'      : 'VISUAL',
	  \     'V'      : 'V-LINE',
	  \     "\<C-v>" : 'V-BLOCK',
	  \     'R'      : 'REPLACE',
	  \     'r'      : 'REPLACE',
	  \     'c'      : 'COMMAND',
	  \     's'      : 'SELECT',
	  \     'S'      : 'S-LINE',
	  \     "\<C-s>" : 'S-BLOCK',
	  \ },
      \ 'component_function' : {
      \     'wordCount' : 'WordCount',
      \ }
      \ }

" Syntastic settings
let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler_options = "-Wall -Wextra -pedantic -Wno-comment"

" Borkmark settings
let g:borkmark = { 
    \ 'windowname' : '\ Startup\ ',
    \ 'defaultstatus' : 2,
    \ 'shownum' : 7,
	\ }

" ~~~~# Key Mappings #~~~~
" Easier command mode. Applies to normal, visual and select.
noremap : <Nop>
noremap , :

" Set auto-increment keys. This means another key combination
" needs to be set in order to access visual-block mode.
nnoremap <C-v> <C-a>

" Find and replace in normal.
nnoremap <C-c> :%s/

" \%V searches only in the current selection- this will behave the 
" same as :s/ in visual line mode, but will make sure no unintended
" replacements are made in visual block mode.
vnoremap <C-c> :s/\%V

" Edit new files/buffers without needing to write the current one.
" nnoremap <S-e>   :tabedit!<Space>
nnoremap <Tab>   :silent tabnext<Cr>
nnoremap <S-Tab> :silent tabprev<Cr>
nnoremap <C-S-Tab> :silent tabmove -1<Cr>
nnoremap <C-Tab>   :silent tabmove +1<Cr>
cabbrev  h       tab help
cabbrev t tabedit!

" Remove ex mode entry and remap to
" visual block mode in visual/normal modes.
noremap Q  <Nop>
noremap Q  <C-v>

" More comfortable start and end of line shortcuts
" in normal, (operator) pending and visual modes.
noremap <C-a>  ^
noremap <C-e>  $

" Home, end, backspace, delete and forward backward navigation
" in insert/command mode.
noremap! <C-a>  <Home>
noremap! <C-e>  <End>
noremap! <C-o>  <BackSpace>
noremap! <C-d>  <Del>
noremap! <C-b>  <Left>
noremap! <C-f>  <Right>
cnoremap <C-h>  <Down>
cnoremap <C-k>  <Up>
cnoremap <C-n>  <C-Left>
cnoremap <C-m>  <C-Right>

" Make backspace and return delete text in visual mode.
vnoremap <Backspace>  d
vnoremap <Return>     c<Return>

" Autocomplete navigation, similar to command mode / readline.
set completeopt=longest,menuone
inoremap <C-p>     <Nop>
inoremap <C-n>     <Nop>
inoremap <C-h>     <C-n>
inoremap <C-k>     <C-p>
inoremap <Leader>k <C-x><C-k>
inoremap <Leader>f <C-x><C-f>
inoremap <Leader>d <C-x><C-o>

" Shadow <C-o>/<C-i> in normal mode.
noremap <Leader>o <C-o>
noremap <Leader>i <C-i>

" Dmenu integration for searching spelling correction. Replaces `z=`.
function DmenuCorrect()
	let word=system("dmenuw -i -l 8 2>/dev/null", spellsuggest(expand("<cword>")))
	if len(word) != 0 
		exe "normal ciw". word[0:-2]
	endif
endfunction

" Apropos the word under the cursor with man.
function DmenuManSearch()
	let result=system("eval \"$(printf 'man -k %s' \"$(cat)\")\" | dmenuw -i -l 8 2>/dev/null", expand("<cword>"))
	if len(result) != 0
		let result=system("awk '{ print substr($2,2,length($2)-2),$1 }'", result)
		let temp_path=system("mktemp")
		call system("eval \"$(printf 'man -Tpdf %s %s' \"$(cat)\")\" > " . temp_path, result)
		call system("tabd -name manpages zathura -e " . temp_path)
	endif
endfunction

nnoremap <silent>z= :call DmenuCorrect()<Cr>
nnoremap <silent>zm :call DmenuManSearch()<Cr>

" Run macro on visual selection
function! MacroRange()
  echo "@" 
  execute ":'<,'>normal! @" . nr2char(getchar())
  normal! :
endfunction
xnoremap @ :<C-u>call MacroRange()<Cr>

" Delete/Copy/Paste to X clipboard
" in normal and visual modes.
nnoremap <C-P>  o<Esc>"+p
nnoremap <C-Y>  "+y
nnoremap <C-D>  "+d
vnoremap <C-Y>  "+y
vnoremap <C-P>  "+p
vnoremap <C-D>  "+d

" Unmap annoying justify text feature mode.
" Navigation. Shift-j goes down a page, Shift-k goes up.
" nostartofline stops moving to the start of the line,
" allowing for keeping the current column position.
set nostartofline
noremap <S-j>   <Nop>
noremap <S-j>   <C-e>
noremap <S-k>   <C-y>
noremap <C-S-j> <C-f>
noremap <C-S-k> <C-b>

" ~~~~# AutoCommands/ AuGroups #~~~~
augroup AutoCompile
	au BufwritePost *.ms silent! exe "!refer -S -P -p references % | groff -ms -Tpdf > %:r.pdf" | redraw!
    au BufWritePost *.md silent! exe "!pandoc % --highlight-style tango -f markdown -t html5 --css ~/Templates/killercup.css -o %:r.html" | redraw!
	au BufWritePost ~/i3/config               silent! exe "!i3-msg reload 2>/dev/null" | redraw!
	au BufWritePost ~/.Xresources             silent! exe "!xrdb ~/.Xresources"        | redraw!
	au BufWritePost config.h,config.def.h     silent! exe "!make install"              | redraw!
	au BufWritePost ~/i3/i3blocks.conf        silent! exe "!pkill i3bar && i3bar --bar_id bar-0 2>/dev/null &" | redraw!
	au BufWritePost ~/.config/dunst/dunstrc   silent! exe "!killall dunst; dunst &"    | redraw!
	au BufWritePost ~/.config/i3status/config silent! exe "!killall bar; bar 2>/dev/null &" | redraw!
augroup END

augroup AutoFormat
	au BufReadPost  *.md,*.MD,*.ms silent! setlocal spell
	au BufWritePre  *.c,*.h,*.py,*.pl,*.sh,*.hs :%s/\s\+$//e
    au BufWritePre  *.hs :%s/\t/    /ge
augroup END

augroup FileTemplateSetup
    au BufNewFile *.sh  :r ~/Templates/.sh
    au BufNewFile *.c   :r ~/Templates/.c
    au BufNewFile *.py  :r ~/Templates/.py
    au BufNewFile *.pdb :r ~/Templates/.pl
    au BufNewFile *.hs  :r ~/Templates/.hs
    au BufNewFile *.md  :r ~/Templates/.md
    au BufNewFile *.ms  :r ~/Templates/.ms
augroup END

augroup Privacy
    au BufReadPre *.private.* setlocal noswapfile | setlocal noundofile
augroup END

augroup RestorePosition
	" Open files at the last edited point. silent! suppresses mark errors.
	au BufReadPost * silent! normal g;
augroup END
colorscheme wal
