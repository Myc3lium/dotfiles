let s:dmenu_defaults = { 
    \ 'path'         : '/bin/dmenu',
    \ 'dmenu-flags'  : '-l 8',
    \ 'open-command' : 'zathura',
    \ 'man-flags'    : '',
    \ 'vim-open'     : '',
	\ }

" Load default values for unset options.
for [configkey, configval] in items(s:dmenu_defaults)
	if !has_key(g:dmenu, configkey)
		let g:dmenu[configkey] = configval
	endif
endfor 

" Use sh instead of bash.
setlocal shell=/bin/sh

" Helper for invoking dmenu.
function! CallDmenu(input)
	return system(g:dmenu['path'] . ' ' . g:dmenu['dmenu-flags'] . ' 2>/dev/null', a:input)
endfunction

" Replace the word under the cursor with the correct spelling.
function DmenuCorrect()
	let word=CallDmenu(spellsuggest(expand("<cword>")))
	if len(word) != 0 
		exe "normal ciw". word[0:-2]
	endif
endfunction

" Search the word under the cursor with man and dmenu.
" Redirect man output to a tempfile and open with 'open-command'.
" If vim-open is specified, use 'vim-open' as an internal vim
" command to open a buffer/split/tab.
if g:dmenu['vim-open'] == ''
	function! DmenuManSearch()
		let result = split(CallDmenu(system('man -k ' .  expand('<cword>'))), '[()]')
		if len(result) != 0
		    let result = join([result[1], result[0]], ' ')
			let temp_path=substitute(system("mktemp"), '\n', '', '') 

			" Redictect pdf into temp file and open with 'pdf-command'.
			" Fork to stop blocking.
			call system('man ' . g:dmenu['man-flags'] . ' ' . result . ' > ' . temp_path)     
			call system(g:dmenu['open-command'] . ' ' . temp_path . ' &')
		endif
	endfunction
else
	function! DmenuManSearch()
		let result = CallDmenu(system('man -k ' .  expand('<cword>')))
		let result = split(result, '[()]')
		if len(result) != 0
			let result = join([result[1], result[0]], ' ')

			silent! execute g:dmenu['vim-open']
			setlocal buftype=nofile
			silent! execute "file " . fnameescape('man: ' . result)

			silent! execute "r! man " . g:dmenu['man-flags'] . ' ' . result
			normal! gg
		endif
	endfunction
endif
