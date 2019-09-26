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

" Split below and right.
set splitbelow
set splitright 

" Set spell check options. Spell check is disabled within quote marks.
set spelllang=en_gb,en_us
syntax match quoteblock /"[^"]\+"/ contains=@NoSpell

" Set default file encoding.
set encoding=utf-8

" Set line numbering options.
set number relativenumber

" Set tab representation and shift width. 'set expandtab' will set tabs to be
" spaces set tabs to be spaces. However this will not work with auto-indent
" produced tabs from ftplugin.
set tabstop=4
set shiftwidth=4

" Highlight control chars. Toggle show with <s> while in normal mode.
set listchars=tab:⇒\ ,nbsp:␣,trail:·
" ,space:┄,eol:§,
nnoremap <silent>s :set list!<Cr>
inoremap <Tab> <Space><Space><Space><Space>

" Set timeout on Escape. This is vital for not being extra slow on exiting 
" insert mode, but if this is zero it interferes with leader mappings.
set timeout timeoutlen=64 ttimeoutlen=64
let mapleader=";"

" Set colour representation.
colorscheme wal
set term=screen-256color
set background=light

" Backup swap files in a more useful place. Move viminfo file somewhere more 
" appropriate. Set persistent undo/redo. Very useful.
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
	let l:wd = wordcount()
	return printf(" %d,%d,%d", l:wd.words, line('$'), l:wd.bytes)
endfunction

" lightline.vim settings.
let g:lightline = {
      \ 'colorscheme': has('gui_running') ? 'jellybeans' : 'jellybeans',
          \ 'active': {
          \   'left':  [[ 'mode', 'paste' ], [ 'filename', 'readonly' ], [ 'modified', 'wordCount' ]],
	      \   'right': [[ 'lineinfo'      ], [ 'percent' ],
          \             [ 'fileformat', 'fileencoding', 'filetype', 'spell' ]]
          \ },
	      \ 'separator':    { 'left': '', 'right' : '' },
          \ 'subseparator': { 'left': '»',    'right' : '«'   },
	      \ 'tabline_separator':    { 'left': '', 'right' : '' },
          \ 'tabline_subseparator': { 'left': '', 'right' : '' },
	      \ 'mode_map' : {
	      \     'n'      : ' NORMAL ',
	      \     'i'      : ' INSERT ',
	      \     'v'      : ' VISUAL ',
	      \     'V'      : ' V-LINE ',
	      \     '\<C-v>' : ' V-BLOCK ',
	      \ },
          \ 'component_function' : {
          \     'wordCount' : 'WordCount',
          \ },
          \ 'component' : {
		  \     'close'    : '',
		  \     'filetype' : '  %{&filetype}',
		  \     'lineinfo': ' %3l: %-2v',
		  \     'fileformat': '﬌ %{&ff}',
          \ }
      \ }

" Syntastic settings
let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler_options="-Wall -Wextra -pedantic -Wno-comment -Wformat-nonliteral -Wformat-security -Wuninitialized -Winit-self -Warray-bounds=2  -Wenum-compare"

" Borkmark settings
let g:borkmark = { 
    \ 'windowname'    : 'Startup',
    \ 'defaultstatus' : 2,
    \ 'shownum'       : 16,
	\ }

nnoremap <silent>z= :call DmenuCorrect()<Cr>
nnoremap <silent>zm :call DmenuManSearch()<Cr>
let g:dmenu = {
    \ 'path'         : '~/bin/dmenuw',
    \ 'dmenu-flags'  : '-l 8 -i -w 850 -c',
    \ 'vim-open'     : 'vnew',
	\ }
    "\ 'man-flags'    : '-Tpdf',
    "\ 'open-command' : 'tabd -name manpages zathura -e',

let g:carp = {
			\ 'control' : '<Leader>,',
			\ 'shift'   : '<Leader>k',
			\ 'meta'    : '<Leader>m',
			\}

" ~~~~# Key Mappings #~~~~
" Easier command mode. Applies to normal, visual and select.
noremap : <Nop>
noremap , :

" Set auto-increment keys. This means another key combination
" needs to be set in order to access visual-block mode.
nnoremap <C-v> <C-a>

" Find and replace in normal. Assume /g flag. 
" /g now replaces only the first instance in a line.
nnoremap <C-c> :%s/
set gdefault

" \%V searches only in the current selection- this will behave the 
" same as :s/ in visual line mode, but will make sure no unintended
" replacements are made in visual block mode.
vnoremap <C-c> :s/\%V

" Edit new files/buffers without needing to write the current one.
" nnoremap <S-e>   :tabedit!<Space>
nnoremap  <silent><Tab>      :tabnext   <Cr>
nnoremap  <silent><S-Tab>    :tabprev   <Cr>
nnoremap  <silent><C-S-Tab>  :tabmove -1<Cr>
nnoremap  <silent><C-Tab>    :tabmove +1<Cr>
cabbrev  h tab help
cabbrev  t tabedit!

" Remove ex mode entry and remap to visual block mode in visual/normal modes.
noremap Q  <Nop>
noremap Q  <C-v>

" More comfortable start and end of line shortcuts in normal, (operator) 
" pending and visual modes.
noremap <C-a>  ^
noremap <C-e>  $

" Home, end, backspace, delete and forward backward navigation in insert/
" command mode (noremap!)
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

" Autocomplete navigation, similar to command mode / readline. Nicer 
" autocomplete.
set completeopt=longest,menuone,preview
inoremap <C-p>     <Nop>
inoremap <C-n>     <Nop>
inoremap <C-h>     <C-n>
inoremap <C-k>     <C-p>
inoremap <Leader>k <C-x><C-k>
inoremap <Leader>f <C-x><C-f>
inoremap <Leader>d <C-x><C-o>

" Run macro on visual selection
function! MacroRange()
  echo "register» " 
  execute ":'<,'>normal! @" . nr2char(getchar())
  normal! :
endfunction
xnoremap @ :<C-u>call MacroRange()<Cr>

" Run commands on a range of lines. Uses shellescape to allow passing code to 
" other commands (awk/perl etc).
function! DoCommand(range, interpreter)
	let l:string = shellescape(input(split(a:interpreter, ' ')[0] . '» '))
	if strlen(l:string) > 2
		execute printf("normal! :%s!%s %s", a:range, a:interpreter, l:string)
	endif
endfunction
nnoremap <Leader>s :call DoCommand('%', 'sh -c')<Cr>
nnoremap <Leader>a :call DoCommand('%', 'awk')<Cr>
xnoremap <Leader>s :<C-u>call DoCommand("'<,'>", 'sh -c')<Cr>
xnoremap <Leader>a :<C-u>call DoCommand("'<,'>", 'awk')<Cr>

" Source parts of the current file.
nnoremap <leader>v :%y<Cr>:@"<Cr>
xnoremap <leader>v y:@"<CR>

" Highlight lines longer than 81 chars
highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn', '\%81v', 100)

" Delete/Copy/Paste to X clipboard in normal and visual modes. Change so paste
" puts the line after the current one.
nnoremap <C-P>  o<Esc>"+p
nnoremap <C-Y>  "+y
nnoremap <C-D>  "+d
vnoremap <C-Y>  "+y
vnoremap <C-P>  "+p
vnoremap <C-D>  "+d

" Shift-j goes down a page, Shift-k goes up. Nostartofline stops moving to the
" start moving to the start of the start of the line, allowing for keeping the 
" current column position.
set nostartofline
noremap <S-j> <Nop>
noremap <S-j> <C-e>
noremap <S-k> <C-y>
noremap <C-j> <C-f>
noremap <C-k> <C-b>

" ~~~~# AutoCommands/ AuGroups #~~~~
augroup AutoCompile
	au BufwritePost *.ms  silent! exe "!refer -S -P -p references % | groff -ms -Tpdf > %:r.pdf" | redraw!
	au BufwritePost *.mom silent! exe "!pdfmom % > %:r.pdf" | redraw!
    au BufWritePost *.md  silent! exe "!pandoc % --highlight-style tango -f markdown -t html5 --css ~/Templates/markdown.css -o %:r.html" | redraw!
	au BufWritePost config.h,config.def.h silent! exe "!make clean install" | redraw!
augroup END

augroup AutoFormat
	au BufReadPost  *.md,*.MD,*.ms silent! setlocal spell
	au BufWritePre  *.c,*.h,*.py,*.pdb,*.sh,*.hs :%s/\s\+$//e
    au BufWritePre  *.hs,*.pdb,*.c*.sh :%s/\t/    /ge
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

" Open files at the last edited point. silent! suppresses mark errors.
au BufReadPost * silent! normal! g;
colorscheme wal
