" ┓ ┳  o  ┏┏┓  ┳━┓  ┏━┓   
" ┃┏┛  ┃  ┃┃┃  ┃┳┛  ┃     
" ┗┛   ┇  ┛ ┇  ┇┗┛  ┗━┛   

" ~~~~# Main Options #~~~~
set noshowmode       " Don't show mode indicator.
set laststatus=2     " Show statusline.
set showtabline=2    " Show tabline.
set showcmd          " Show last command.

" Allow backspace over start of insert, auto-indents and the end of a line.
set backspace=indent,eol,start
    
set hlsearch    " Highlight search results. Use <C-l> to un-highlight.
nnoremap <silent><C-l> :nohlsearch<Cr>
xnoremap <silent><C-l> :<C-u>nohlsearch<Cr>

" Incremental search.
set incsearch

" Lazy redraw for macro replay.
set lazyredraw

" Display the location of matching parens.
set showmatch

" Highlight lines longer than 81 chars.
highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn', '\%81v', 100)

set breakindent      " Keep indent on broken lines.
set showbreak=→\     " Show before a broken line.

set splitbelow splitright   " Open splits below the current window.
                            " Open splits right of the current window.

set spelllang=en_gb,en_us                                         " Set English-American hybrid spelling.
set dictionary=/usr/share/dict/words,~/.vim/spell/en.utf-8.add    " Set file for dictionary-completion.

" Set default file encoding.
set encoding=utf-8

" Set line numbering options.
set number relativenumber

set foldcolumn=1         " Make closed folds visible.
set fillchars+=fold:▒    " Use <char> for fold indicator.

set tabstop=4             " Number of spaces shown for a tab.
let &shiftwidth=&tabstop  " Number of auto-indent spaces.
set expandtab             " 'expandtab' will insert tabs as spaces.

" Highlight control chars.
set listchars=tab:⇒\ ,trail:␣,extends:г,precedes:г,eol:⮠

set timeout timeoutlen=64 ttimeoutlen=64    " Set timeout for mappings.
let mapleader=";"                           " Set mapleader key to semi-colon

colorscheme wal             " Use automatic coloring.
set term=screen-256color    " Set 256 colors profile.
set background=dark         " Make the background dark.

set undofile                    " Use an 'undofile'.
set undodir=~/.vim/undodir/     " Keep undo-files in ~/.vim
set backupdir=~/.vim/backups    " Keep backups, etc. in ~/.vim
set directory=~/.vim/swaps
set viminfo+=n~/.vim/viminfo

" Don't let vim interpret mode lines.
" set nomodeline
set modeline

" ~~~~# Plugin Options #~~~~
" Enable plugins and set relevant options.
let g:pathogen_disabled = ['carp.vim', 'gz.vim', 'prolog.vim', 'haskell.vim']
call pathogen#infect("$HOME/.vim/bundle/{}")
filetype  off
syntax    on
filetype  plugin indent on
runtime   ftplugin/man.vim
 
" " gz.vim mapping.
" let g:gz = '<C-g>'
" 
" let g:haskell_enable_quantification   = 1 " Enable highlighting of `forall`.
" let g:haskell_enable_pattern_synonyms = 1 " Enable highlighting of `pattern`.
 
" lightline.vim settings.
let g:gruvbox_background = 'dark'
let g:lightline = {
      \ 'colorscheme': has('gui_running') ? 'jellybeans' : 'wal',
      \ 'active': {
      \   'left':  [[ 'mode', 'paste' ], [ 'filename', 'readonly' ], [ 'modified' ]],
      \   'right': [[], ['lineinfo'],    [ 'fileformat', 'encoding', 'filetype', 'buftype', 
      \                                    'spell' ]]
      \ },
      \ 'separator'            : { 'left' : '',  'right' : ''  },
      \ 'subseparator'         : { 'left' : '│', 'right' : '│' },
      \ 'tabline_separator'    : { 'left' : '',  'right' : ''  },
      \ 'tabline_subseparator' : { 'left' : '',  'right' : ''  },
      \ 'mode_map' : { 'n' : 'n', 'i' : 'i', 'v' : 'v', 'V'  : '=v', '' : '#v', 'R' : 'r', 'c': '/s' },
      \ 'component_visible_condition' : { 'filetype'   : 'len(&filetype)', 'buftype'  : 'len(&buftype)',  
      \                                   'fileformat' : '&fileformat!="unix"' },
      \ 'component' : { 'close'    : '',               'spell'      : '§ %{&spell?&spelllang:""}', 
      \                 'buftype'  : 'ß %{&buftype}',  'filetype'   : ':: %{&filetype}', 
      \                 'lineinfo' : '%P %3l,%-2v',    'fileformat' : '﬌ %{&fileformat=="unix"?"":&fileformat}', 
      \                 'encoding' : 'ε %{len(&fileencoding) ? &fileencoding : &encoding }', 
      \ }
\ }

" Syntastic settings.
let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler_options="-Wall -Wextra -pedantic -Wno-comment -Wformat-nonliteral -Wformat-security -Wuninitialized -Winit-self -Warray-bounds=2  -Wenum-compare"
let g:syntastic_error_symbol   = '✗✗ '
let g:syntastic_warning_symbol = '▷▷ '
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_enable_balloons = 1

" Borkmark settings.
let g:borkmark = {
    \ 'windowname'    : '*Startup*',
    \ 'defaultstatus' : 2,
    \ 'shownum'       : 16,
    \ }

let g:dmenu = { 'path' : 'dmenu', 'flags' : '-b -n -l 8 -i -w' }
nnoremap <silent>z= :call DmenuCorrect()<Cr>
nnoremap <silent>zm :call DmenuManSearch()<Cr>
nnoremap <silent>zb :call DmenuBufSelect()<Cr>
nnoremap <silent>z/ :call DmenuSearch()<Cr>

" ~~~~# Key Mappings #~~~~
" Easier command mode. Applies to normal, visual and operator.
noremap , :

" Write the buffer to file.
nnoremap ,w :w<Cr>

" Get help on word.
nnoremap <expr> zh (":tab help " . expand('<cword>') . "\n")
xnoremap  zh         y:tab help <C-r>"<Cr>

" Search selection under cursor.
xnoremap * y/\M<C-r>"<Cr>

" Make H and L behave like bol/eol for ergonomics.
noremap H ^
noremap L $

" mode() == 'c' is only triggered once keypresses are entered once in search
" mode.
nnoremap <expr> / "/ \<Backspace>"

" Go one (screen) line down unless range is given.
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" If spelling, find errors, else linter error.
nnoremap <expr> [s (&spell ? "[s" : ":lprev\<Cr>")
nnoremap <expr> ]s (&spell ? "]s" : ":lnext\<Cr>")

" Insert lines above the cursor in insert.
inoremap <S-Return> <C-o><S-o>

" Auto-increment keys.
nnoremap + <C-a>
nnoremap - <C-x>
xnoremap + <C-g><C-a>
xnoremap - <C-x>
set nrformats=bin,hex,alpha

" Substitute in normal and visual. Assume `/g`.
set gdefault    
xnoremap ,c :s/\%V
nnoremap ,c :%s/
xnoremap gc y:%s/\M<C-r>"/
nnoremap gc yiw:%s/<C-r>"/

" Edit new files/buffers without needing to write the current one.
nnoremap  <silent><Tab>   :tabnext <Cr>
nnoremap  <silent><S-Tab> :tabprev <Cr>
cabbrev  h tab help
cabbrev  t tabedit!
cabbrev  e edit!
nnoremap <silent> rf :tabedit! <C-r>=expand('%:h')<Cr>/<cfile><Cr> 
nnoremap <silent> gf :tabedit! <cfile><Cr>
xnoremap <silent> gf y:tabedit! <C-r>=fnameescape(@")<Cr><Cr>

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
inoremap <C-h>     <C-n>
inoremap <C-k>     <C-p>
inoremap <Leader>k <C-x><C-k>
inoremap <Leader>f <C-x><C-f>

" Use ĸ for inserting digraphs.
noremap! ĸ <C-k>

" Page/line based movement using hjkl. Don't move the cursor to start of line.
set nostartofline
noremap <S-j> <C-e>
noremap <S-k> <C-y>
noremap <C-j> <C-f>
noremap <C-k> <C-b>

" Toggle fold in n/vmode. Visual <Leader>f only works when foldmethod=manual.
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

" Set filetype
command! -nargs=1 Sft set filetype=<args>
cabbrev sft Sft

" Run a macro on a visual selection.
function! MacroRange()
  echo "(register) " 
  execute ":'<,'>normal! @" . nr2char(getchar())
endfunction
xnoremap <silent> @ :<C-u>call MacroRange()<Cr>

" Run commands on selections. `shellescape` allows using pipes and external
" interpreters.
function! DoCommand(motion, interpreter)
    let l:string = shellescape(input('(' . split(a:interpreter, ' ')[0] . ') '))
    if strlen(l:string) > 2
        return printf(":%s!%s %s\<Cr>", a:motion, a:interpreter, l:string)
    endif
    return "\<Esc>"
endfunction
nnoremap <expr> <Leader>s DoCommand('%', 'sh -c')
nnoremap <expr> <Leader>a DoCommand('%', 'awk')
xnoremap <expr> <Leader>s DoCommand("'<,'>", 'sh -c')
xnoremap <expr> <Leader>a DoCommand("'<,'>", 'awk')

" Source parts of the current file.
nnoremap <silent> <Leader>v :%y<Cr>:execute @"<Cr>
xnoremap <silent> <Leader>v y:execute @"<CR>

" External (e) yanking, deleting and pasting.
noremap ep  o<C-r>+<Esc>
noremap ey  "+y
noremap ed  "+d

" ~~~~# AutoCommands/ AuGroups #~~~~
augroup AutoCompile
    au BufWritePost *.latex.md               silent! exe "!pandoc \"%\" --filter pandoc-citeproc --listing -f markdown -t latex -o \"%:r:r.pdf\"" | redraw!
    au BufWritePost *[^l][^a][^t][^e][^x].md silent! exe "!pandoc \"%\" --highlight-style tango -f markdown -t html5 --css ~/Templates/markdown.css -o \"%:r.html\"" | redraw!
augroup END
augroup AutoFormat
    au BufReadPost  bash-fc*                     :set filetype=sh | :execute "normal! i#!/bin/bash\<Esc>o\<Cr>"
    au BufReadPost  *.md,*.MD,                   :silent! setlocal spell
    au BufWritePre  *.c,*.h,*.py,*.pdb,*.sh,*.hs :%s/\s\+$//e
    au BufReadPost  *                            :silent! normal! g`"
augroup END
