let s:dmenu_defaults = { 
    \ 'path'   : '/bin/dmenu',
    \ 'flags'  : '-l 8 -i -w',
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
function! CallDmenu(prompt, input)
    if g:dmenu.embed
        let l:command=printf('%s %s %s %d 2>/dev/null', g:dmenu['path'], ' '. a:prompt, g:dmenu['flags'] , v:windowid) 
    else
        let l:command=printf('%s %s 2>/dev/null', g:dmenu['path'], g:dmenu['flags'] .' '. a:prompt) 
    endif

	return system(l:command, a:input)
endfunction

" Replace the word under the cursor with the correct spelling.
function DmenuCorrect()
	let word=CallDmenu('-p "(correct-spelling)"', spellsuggest(expand("<cword>")))
	if len(word) != 0 
		execute printf("normal! ciw%s", word[0:-2])
	endif
endfunction

" Use dmenu to search through the current buffer
function DmenuSearch()
    silent! %yank n
    let line = CallDmenu("-p '(search)' ", split(@n, "\n"))
    if len(line) != 0
         silent! execute 'normal! /\V' . escape(line, '\')
    endif
endfunction

" Find and go to a buffer.
function! DmenuBufSelect()
    redir => l:ls
        silent! ls
    redir END
    let l:bufnum=CallDmenu('-p "(buffer-select)"', l:ls)
    if len(bufnum)
        let l:bufnum = split(l:bufnum, ' ')[0]
        execute printf('buffer! %s', l:bufnum)
    endif
endfunction

" Search the word under the cursor with man and dmenu.
function! DmenuManSearch()
    let l:word   = expand('<cword>')
    let l:word   = l:word == '' ? '.' : l:word
    let l:result = split(CallDmenu('-p "(man-page-select)"', system('man -k ' . shellescape(l:word) . ' | sort')), '[()]')

    if len(result) != 0
        let l:result = printf('%s %s', result[1], result[0])

        silent! execute g:dmenu.man
        setlocal buftype=nofile
        setlocal filetype=man
        setlocal showbreak=
        setlocal wrap linebreak
        setlocal nonumber norelativenumber
        nnoremap <buffer> q q

        silent! execute printf("file %s", fnameescape('man: ' . result))
        silent! execute printf("r! man %s", l:result)
        normal! gg
    endif
endfunction
