
let s:dmenu_defaults = { 
    \ 'path'         : '/bin/dmenu',
    \ 'global-opts'  : '-l 8',
    \ 'open-command' : 'zathura',
    \ 'man-flags'    : '',
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
	return system(g:dmenu['path'] . ' ' . g:dmenu['global-opts'] . ' 2>/dev/null', a:input)
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
function DmenuManSearch()
	let result = CallDmenu(system('man -k ' .  expand('<cword>')))
	if len(result) != 0
		let result=substitute(system("awk -F'[()]' '{ print $2,$1 }'", result), '\n', '', '')
		let temp_path=substitute(system("mktemp"), '\n', '', '') 

		" Redictect pdf into temp file and open with 'pdf-command'.
		" Fork to stop blocking.
		call system('man ' . g:dmenu['man-flags'] . ' ' . result . ' > ' . temp_path)     
		call system(g:dmenu['open-command'] . ' ' . temp_path . ' &')
	endif
endfunction
