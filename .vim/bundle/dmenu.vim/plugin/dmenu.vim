let s:dmenu_defaults = { 
    \ 'path'   : '/bin/dmenu',
    \ 'flags'  : '-l 8 -i -W',
    \ 'embed'  : 1,
    \ 'man'    : 'tabedit!',
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
    if g:dmenu.embed
        let l:command=printf('%s %s %d 2>/dev/null', g:dmenu['path'], g:dmenu['flags'], v:windowid) 
    else
        let l:command=printf('%s %s 2>/dev/null', g:dmenu['path'], g:dmenu['flags']) 
    endif

	return system(l:command, a:input)
endfunction

" Replace the word under the cursor with the correct spelling.
function DmenuCorrect()
	let word=CallDmenu(spellsuggest(expand("<cword>")))
	if len(word) != 0 
		execute printf("normal! ciw%s", word[0:-2])
	endif
endfunction

" Find and go to a buffer.
function! DmenuBufSelect()
    redir => l:ls
        silent! ls
    redir END
    let l:bufnum=CallDmenu(l:ls)
    if len(bufnum)
        let l:bufnum = split(l:bufnum, ' ')[0]
        execute printf('buffer! %s', l:bufnum)
    endif
endfunction

" Search the word under the cursor with man and dmenu.
function! DmenuManSearch()
    let l:word   = expand('<cword>')
    let l:word   = l:word == '' ? '.' : l:word
    let l:result = split(CallDmenu(system('man -k ' . shellescape(l:word) . ' | sort')), '[()]')

    if len(result) != 0
        let l:result = printf('%s %s', result[1], result[0])

        silent! execute g:dmenu.man
        setlocal buftype=nofile
        setlocal filetype=man
        setlocal showbreak=
        setlocal wrap linebreak
        setlocal nonumber norelativenumber

        silent! execute printf("file %s", fnameescape('man: ' . result))
        silent! execute printf("r! man %s", l:result)
        normal! gg
    endif
endfunction
