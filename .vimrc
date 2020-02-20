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
nnoremap <silent><C-l> :nohlsearch<Cr>

" Incremental search.
set incsearch

" Display the location of matching parens
set showmatch

" Highlight lines longer than 81 chars
highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn', '\%81v', 100)

set breakindent     " Keep indent on broken lines
set showbreak=[﬌]\  " Show before a broken line

" Split below and right.
set splitbelow
set splitright 

" Set spell-file/dict. 
set spelllang=en_gb,en_us
set dictionary=/usr/share/dict/words,~/.vim/spell/en.utf-8.add

" Set default file encoding.
set encoding=utf-8

" Set line numbering options.
set number relativenumber

" Set visibility of folds when open
set foldcolumn=1
set fillchars+=fold:▒

" Set tab and shift width. 'expandtab' will set tabs as spaces.
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight control chars.
set listchars=tab:⇒\ ,trail:␣,extends:г,precedes:г

" Set timeout on Escape. 
set timeout timeoutlen=64 ttimeoutlen=64
let mapleader=";"

" Set colour representation.
colorscheme wal
set term=screen-256color
set background=dark

" Peristant undo and info file location.
set undofile
set undodir=~/.vim/undodir/
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set viminfo+=n~/.vim/viminfo

" Don't let vim interpret mode lines.
set nomodeline

" ~~~~# Plugin Options #~~~~
" Enable plugins and set relevant options.
let g:pathogen_disabled = ['carp.vim']
call pathogen#infect()
filetype  off
syntax    on
filetype  plugin indent on
runtime   macros/matchit.vim
runtime ftplugin/man.vim

" gz.vim mapping
let g:gz = '<C-g>'

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
      \ 'colorscheme': has('gui_running') ? 'jellybeans' : 'jellybeans',
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
	      \     ''     : ';vsl;',
	      \     'R'      : 'rpl',
	      \ },
          \ 'component_function' : { 'wordCount' : 'WordCount', },
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
let g:syntastic_error_symbol   = '✗✗ '
let g:syntastic_warning_symbol = '▷▷ '
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_enable_balloons = 1

" Borkmark settings
let g:borkmark = { 
    \ 'windowname'    : '*Startup*',
    \ 'defaultstatus' : 2,
    \ 'shownum'       : 16,
	\ }

nnoremap <silent>z= :call DmenuCorrect()<Cr>
nnoremap <silent>zm :call DmenuManSearch()<Cr>
" nnoremap <silent>zf :call DmenuOpen()<Cr>
let g:dmenu = {
    \ 'path'         : '~/bin/dmenuw',
    \ 'dmenu-flags'  : '-l 8 -i -w 850 -c',
    \ 'vim-open'     : 'tabedit!',
	\ }

" ~~~~# Key Mappings #~~~~
" Easier command mode. Applies to normal, visual and select.
noremap , :

" Write the buffer to file.
nnoremap ,w :w<Cr>

" Get help on word.
nnoremap <expr> zh (":tab help " . expand('<cword>') . "\n")
xnoremap  zh         y:tab help <C-r>"<Cr>

" Search selection under cursor.
xnoremap * y/\M<C-r>"<Cr>

" Insert lines above the cursor in insert.
inoremap <S-Return> <C-o><S-o>

" Auto-increment keys.
nnoremap + <C-a>
nnoremap - <C-x>
xnoremap + :normal! <Cr>
set nrformats=bin,hex,alpha

" Substitute in normal and visual. 
xnoremap ,c :s/\%V
nnoremap ,c :%s/
xnoremap gc y:%s/\M<C-r>"/
set gdefault

" Edit new files/buffers without needing to write the current one.
nnoremap  <silent><Tab>   :tabnext <Cr>
nnoremap  <silent><S-Tab> :tabprev <Cr>
cabbrev  h tab help
cabbrev  t tabedit!
nnoremap <silent> rf :tabedit! <C-r>=expand('%:h')<Cr>/<cfile><Cr> 
nnoremap <silent> gf :tabedit! <cfile><Cr>
xnoremap <silent> gf "ny:tabedit! <C-r>=fnameescape(@n)<Cr><Cr>

" Prevent ex mode entry by remapping to visual block mode.
noremap Q  <C-v>

" Navigation in insert/command mode.
noremap! <C-a>  <Home>
noremap! <C-e>  <End>
noremap! <C-d>  <Del>
noremap! <C-b>  <Left>
noremap! <C-f>  <Right>
cnoremap <C-h>  <Down>
cnoremap <C-k>  <Up>
cnoremap <C-n>  <C-Left>
cnoremap <C-m>  <C-Right>
inoremap <C-j>  <Return>

" Autocomplete navigation, similar to command mode/readline.
set completeopt=longest,menuone,preview
for key in ['n', 'p', 'h', 'k']
    execute printf("inoremap <C-%s> <Nop>", key)
endfor
inoremap <C-h>    <C-n>
inoremap <C-k>    <C-p>
inoremap <Leader>k <C-x><C-k>
inoremap <Leader>f <C-x><C-f>
inoremap <Leader>d <C-x><C-o>

" Digraph insertion
noremap! ĸ <C-k>

" Shift-j/k move down/up a page. Don't move the cursor to start of line.
set nostartofline
noremap <S-j> <C-e>
noremap <S-k> <C-y>
noremap <C-j> <C-f>
noremap <C-k> <C-b>

" Toggle fold in n/vmode. Visual <Leader>f only works with foldmethod=manual.
noremap <expr> <silent> <Leader>f (foldlevel('.') ? 'za':"\<Space>")
xnoremap <silent> <Leader>f zf

" Digraph from string literal
command! -nargs=+ Digraph call Digraph(<f-args>)
function! Digraph(keys, character)
    execute printf('digraph %s %d', a:keys, char2nr(a:character))
endfunction

Digraph \|- ⊢
Digraph lm λ
Digraph ^\| ⊤
Digraph _\| ⊥

" Run macro on selection.
function! MacroRange()
  echo "(register) " 
  execute ":'<,'>normal! @" . nr2char(getchar())
endfunction
xnoremap <silent> @ :<C-u>call MacroRange()<Cr>

" Run commands on selections. `shellescape` allows pipes and external
" interpreters.
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
	au BufwritePost *.ms                     silent! exe "!refer -S -P -p references % | groff -ms -Tpdf > %:r.pdf" | redraw!
	au BufwritePost *.mom                    silent! exe "!pdfmom % > %:r.pdf" | redraw!
    au BufWritePost *.latex.md               silent! exe "!pandoc \"%\" --bibliography bibliography.bib --filter pandoc-citeproc --listing -f markdown -t latex -o \"%:r:r.pdf\"" | redraw!
    au BufWritePost *[^l][^a][^t][^e][^x].md silent! exe "!pandoc \"%\" --highlight-style tango -f markdown -t html5 --css ~/Templates/markdown.css -o \"%:r.html\"" | redraw!
augroup END
augroup AutoFormat
    au BufReadPost  bash-fc* :set    filetype=sh
    au BufReadPost  *.md,*.MD,*.ms :silent ! setlocal spell
    au BufWritePre  *.c,*.h,*.py,*.pdb,*.sh,*.hs :%s/\s\+$//e
    au BufWritePre  *.hs,*.pdb,*.c*.sh :%s/\t/    /ge
    au BufReadPost  * :silent! normal! g`
augroup END

for type in ['sh', 'c', 'py', 'pdb', 'hs', 'md']
    execute printf("au BufNewFile *.%s     :r ~/Templates/.%s", type, type)
endfor
