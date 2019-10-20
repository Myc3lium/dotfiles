" ┓ ┳  o  ┏┏┓  ┳━┓  ┏━┓   
" ┃┏┛  ┃  ┃┃┃  ┃┳┛  ┃     
" ┗┛   ┇  ┛ ┇  ┇┗┛  ┗━┛   

" ~~~~# Main Options #~~~~
" *Always* show status line, tabs and command. Disable showing mode.
set noshowmode
set laststatus=2
set showtabline=2
set showcmd

" Highlight search results. Use gl to un-highlight.
set hlsearch
nnoremap <silent>gl :nohlsearch<Cr>

" Incremental search.
set incsearch

" Set showmatch! Useful for displaying the location of 
" matching parens. This works for (),[],{} and <>.
set showmatch
set matchpairs+=<:>

" Highlight lines longer than 81 chars
highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn', '\%81v', 100)

" Split below and right.
set splitbelow
set splitright 

" Set spell-file/dict. Spell check is disabled within quote marks.
set spelllang=en_gb,en_us
set dictionary=/usr/share/dict/words,~/.vim/spell/en.utf-8.add
syntax match quoteblock /"[^"]\+"/ contains=@NoSpell
syntax match quoteblock /'[^']\+'/ contains=@NoSpell
syntax match quoteblock /`[^`]\+`/ contains=@NoSpell

" Set default file encoding.
set encoding=utf-8

" Set line numbering options.
set number relativenumber

" Set visibility of folds when open
set foldcolumn=1

" Set tab and shift width. 'set expandtab' will set tabs to be
" spaces. This will not work with auto-indent produced tabs from ftplugin.
set tabstop=4
set shiftwidth=4
inoremap <Tab> <Space><Space><Space><Space>

" Highlight control chars. Toggle show with <s> while in normal mode.
set listchars=tab:⇒\ ,trail:␣
nnoremap <silent>s :set list!<Cr>

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
runtime   macros/matchit.vim

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
	return printf("≡ %d,%d,%d", l:wd.words, line('$'), l:wd.bytes)
endfunction

" lightline.vim settings.
let g:gruvbox_background = 'dark'
let g:lightline = {
      \ 'colorscheme': has('gui_running') ? 'gruvbox' : 'jellybeans',
          \ 'active': {
          \   'left':  [[ 'mode', 'paste' ], [ 'filename', 'readonly' ], [ 'modified', 'wordCount', 'lastcmd' ]],
	      \   'right': [[ 'lineinfo'      ], [ 'percent' ],
          \             [ 'fileformat', 'fileencoding', 'filetype', 'spell' ]]
          \ },
	      \ 'separator':    { 'left': '', 'right' : '' },
          \ 'subseparator': { 'left': '|',    'right' : '|'   },
	      \ 'tabline_separator':    { 'left': '', 'right' : '' },
          \ 'tabline_subseparator': { 'left': '', 'right' : '' },
	      \ 'mode_map' : {
	      \     'n'      : 'nrm',
	      \     'ni'     : '*nrm',
          \     'c'      : '/src',
	      \     'i'      : 'ins',
	      \     'v'      : 'vsl',
	      \     'V'      : '-vsl-',
	      \     ''     : '^vsl^',
	      \     'R'      : 'rpl',
	      \ },
          \ 'component_function' : {
          \     'wordCount' : 'WordCount',
          \ },
          \ 'component' : {
		  \     'close'      : '',
		  \     'filetype'   : '  %{&filetype}',
		  \     'lineinfo'   : ' %3l: %-2v',
		  \     'fileformat' : '﬌ %{&ff}',
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
nnoremap <silent>zf :call DmenuOpen()<Cr>
nnoremap <silent>zc :call DmenuVimConf()<Cr>
let g:dmenu = {
    \ 'path'         : '~/bin/dmenuw',
    \ 'dmenu-flags'  : '-l 8 -i -w 850 -c',
    \ 'vim-open'     : 'tabedit!',
	\ }

let g:carp = {
			\ 'control' : '\x',
			\}

" ~~~~# Key Mappings #~~~~
" Easier command mode. Applies to normal, visual and select.
noremap : @:
noremap , :

" Write the buffer file.
nnoremap ,w :w<Cr>

" Redo and insert-register mappings.
nnoremap GR <C-r>
noremap! GR <C-r>

" Get help on word.
nnoremap <expr> zh (":tab help " . expand('<cword>') . "\n")

" Search selection under cursor.
xnoremap * y/<C-r>"<Cr>

" Window changes
nnoremap gw <C-w>

" Start insert-visual mode.
inoremap gv <C-o>v

" Go to insert-normal
inoremap go <C-o>

" Insert lines above the cursor in insert.
inoremap <S-Return> <C-o><S-o>

" Auto-increment keys.
nnoremap + <C-a>
nnoremap - <C-x>
set nrformats=bin,hex,alpha

" substitute in normal and visual. 
" \%V means only in the current selection.
" /g now replaces only the first instance in a line.
xnoremap ,c :s/\%V
nnoremap ,c :%s/
set gdefault

" Edit new files/buffers without needing to write the current one.
nnoremap  <silent><Tab>      :tabnext   <Cr>
nnoremap  <silent><S-Tab>    :tabprev   <Cr>
cabbrev  h tab help
cabbrev  t tabedit!
nnoremap <silent> gf :tabedit! <cfile><Cr>
nnoremap <expr> GF (":tabedit! " . expand('<cfile>'))

" Prevent ex mode entry by remapping to visual block mode.
noremap Q  <C-v>

" Home, end, backspace, delete and forward backward navigation in insert/
" command mode.
noremap! <C-u>  <Backspace>
noremap! <C-a>  <Home>
noremap! <C-e>  <End>
noremap! <C-d>  <Del>
noremap! <C-b>  <Left>
noremap! <C-f>  <Right>
cnoremap <C-h>  <Down>
cnoremap <C-k>  <Up>
cnoremap <C-n>  <C-Left>
cnoremap <C-m>  <C-Right>

" Autocomplete navigation, similar to command mode/readline.
set completeopt=longest,menuone,preview
inoremap <C-h>    <Nop>
inoremap <C-k>    <Nop>
inoremap <C-h>    <C-n>
inoremap <C-k>    <C-p>
inoremap <Leader>k <C-x><C-k>
inoremap <Leader>f <C-x><C-f>
inoremap <Leader>d <C-x><C-o>

" Shift-j goes down a page, Shift-k goes up. Nostartofline stops the cursor 
" moving to the start of the line.
set nostartofline
noremap <S-j> <C-e>
noremap <S-k> <C-y>
noremap <C-j> <C-f>
noremap <C-k> <C-b>

" Let the cursor move past the last character in the line. Useful for using
" <S-x> to backspace chars.
set virtualedit=onemore

" Toggle fold in normal mode. visual <Leader>f will only work with
" foldmethod=manual.
noremap <silent> <Leader>f @=(foldlevel('.')?'za':"\<Space>")<CR>
xnoremap <silent> <Leader>f zf

" Run macro on visual selection.
function! MacroRange()
  echo "(register) " 
  execute ":'<,'>normal! @" . nr2char(getchar())
endfunction
xnoremap <silent> @ :<C-u>call MacroRange()<Cr>

" Run commands lines or selections. `shellescape` allows using pipes
" and passing the command to an interpreter (awk, python, etc).
function! DoCommand(motion, interpreter)
	let l:string = shellescape(input('(' . split(a:interpreter, ' ')[0] . ') '))
	if strlen(l:string) > 2
		execute printf("normal! :%s!%s %s", a:motion, a:interpreter, l:string)
	endif
endfunction
nnoremap <Leader>s :call DoCommand('%', 'sh -c')<Cr>
nnoremap <Leader>a :call DoCommand('%', 'awk')<Cr>
xnoremap <Leader>s :<C-u>call DoCommand("'<,'>", 'sh -c')<Cr>
xnoremap <Leader>a :<C-u>call DoCommand("'<,'>", 'awk')<Cr>

" Source parts of the current file.
nnoremap <Leader>v :%y<Cr>:@"<Cr>
xnoremap <Leader>v y:@"<CR>

" External (e) yanking, deleting and pasting.
noremap ep  o<C-r>+<Esc>
noremap ey  "+y
noremap ed  "+d

" ~~~~# AutoCommands/ AuGroups #~~~~
augroup AutoCompile
	au BufwritePost *.ms  silent! exe "!refer -S -P -p references % | groff -ms -Tpdf > %:r.pdf" | redraw!
	au BufwritePost *.mom silent! exe "!pdfmom % > %:r.pdf" | redraw!
    au BufWritePost *.md  silent! exe "!pandoc % --highlight-style tango -f markdown -t html5 --css ~/Templates/markdown.css -o %:r.html" | redraw!
	au BufWritePost config.h,config.def.h silent! exe "!make clean install" | redraw!
augroup END

augroup AutoFormat
    au BufReadPost bash-fc*  set filetype=sh
	au BufReadPost  *.md,*.MD,*.ms silent! setlocal spell
	au BufWritePre  *.c,*.h,*.py,*.pdb,*.sh,*.hs :%s/\s\+$//e
    au BufWritePre  *.hs,*.pdb,*.c*.sh :%s/\t/    /ge
    au BufReadPost * silent! normal! g;
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

colorscheme wal
