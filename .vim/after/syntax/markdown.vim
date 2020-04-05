" Auto lists: Automatically continue/end lists by adding markers if the
" previous line is a list item, or removing them when they are empty
function! s:auto_list()
  let l:preceding_line = getline(line(".") - 1)
  if l:preceding_line =~ '\v^\d+\.\s.'
    " The previous line matches any number of digits followed by a full-stop
    " followed by one character of whitespace followed by one more character
    " i.e. it is an ordered list item

    " Continue the list
    let l:list_index = matchstr(l:preceding_line, '\v^\d*')
    call setline(".", l:list_index + 1. ". ")
  elseif l:preceding_line =~ '\v^\d+\.\s$'
    " The previous line matches any number of digits followed by a full-stop
    " followed by one character of whitespace followed by nothing
    " i.e. it is an empty ordered list item

    " End the list and clear the empty item
    call setline(line(".") - 1, "")
  elseif index(["-", "*"], l:preceding_line[0]) >= 0 && l:preceding_line[1] == " "
    " The previous line is an unordered list item
    if strlen(l:preceding_line) == 2
      " ...which is empty: end the list and clear the empty item
      call setline(line(".") - 1, "")
    else
      " ...which is not empty: continue the list
      call setline(".", l:preceding_line[0] . " ")
    endif
  endif
endfunction

" N.B. Currently only enabled for return key in insert mode, not for normal
" mode 'o' or 'O'
inoremap <buffer> <silent><buffer> <CR>  <CR><Esc>:call <SID>auto_list()<CR>A
inoremap <buffer> <silent><buffer> <C-j> <CR><Esc>:call <SID>auto_list()<CR>A
nnoremap <buffer> <silent><buffer> o     o<Esc>:call <SID>auto_list()<CR>A
inoremap <buffer> <S-Return> <C-o>O

function! s:SelectParaColumn(action)
    execute printf("normal! \<C-v>ip%d|\<C-v>o%s", getcurpos()[2], a:action)
endfunction

function! s:NewTableRow()
    let l:line=getline('.')
    put =substitute(line, '[^\|]', ' ', 'g')
    normal! ^ll
endfunction

function! s:NewTableColumn()
    let l:y = @y
    call s:SelectParaColumn('F|ot|"yyt|"ypt|')
    call s:SelectParaColumn("T|:s/\\%V./ /\<Cr>\<C-o>jlvt|hr-k")
    let @y=l:y
endfunction

nnoremap to :call <SID>NewTableRow()<Cr>
nnoremap ti :call <SID>NewTableColumn()<Cr>
nnoremap td :call <SID>SelectParaColumn('f\|d')<Cr>

" Format tables from columised data
xnoremap <buffer> <Leader>t :! ~/.vim/format-scripts/cols2markdown<Cr>
setlocal spell

" Use dictionary for auto-complete.
setlocal complete+=k

" Don't do spell checking in quoted text or inline 
" LaTex math equations. Don't check spelling in
" Pandoc citeproc citation anchors.
syntax match Quoteblock   /"[^"]\+"/         contains=@NoSpell 
syntax match Quoteblock   /'[^']\+'/         contains=@NoSpell 
syntax match Quoteblock   /`[^`]\+`/         contains=@NoSpell 
syntax match Mathblock    /\$[^\$]\+\$/      contains=@NoSpell 
syntax match Pandoccite   /\[@\w\+[,\]]/     contains=@NoSpell 
syntax match Pandocmeta   /---\n\_.*\n---/   contains=@NoSpell 
syntax match LaTexCommand /\\\w\+/           contains=@NoSpell


" Wrapping options for text.
if expand('%:t') =~ "latex\.md"
    " Hard wrap if we are using pandoc.
    setlocal textwidth=80
    setlocal autoindent
    setlocal nolinebreak
else
    " Soft wrap if we might need to copy into other
    " documents.
    setlocal textwidth=0
    setlocal linebreak
endif
