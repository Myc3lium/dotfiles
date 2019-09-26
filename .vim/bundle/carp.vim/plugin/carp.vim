"
" ＣＡＲＰ．ＶＩＭ
"
" carp.vim is a small, lightweight plugin designed for providing a more
" ergonomic way of entering keystrokes requiring the use of modifier keys,
" such as the control key, shift key and alt key. To do this we define
" mappings that prompt for another keypress, then modify it and
" invoke feedkeys to create the same effect as pressing the corresponding
" normal keyboard sequence.
"
" ControlKey when invoked will take a key, turn it into the control-key 
" masked equivalent, then invoke feedkeys. The function returns 
" an empty string to allow the use of the function in the expression
" register. This means we can invoke the function safely from insert and
" command mode, without touching the contents of the Ex prompt, or the 
" current buffer we are inserting text into.
"
" ShiftKey does the same thing, but applies a shift-key mask to the char
" we got from the user instead.
" 
" If the user is running a gui (has('gui_running')), the function MetaKey()
" will be defined that takes care of conversion from key -> m-key.

let s:carp = {
			\ 'control' : '<Leader>,',
			\ 'shift'   : '<Leader>c',
			\ 'meta'    : '<Leader>m',
			\}

" Load default values for unset options.
for [configkey, configval] in items(s:carp)
	if has_key(g:carp, configkey)
		let s:carp[configkey] = g:carp[configkey]
	endif
endfor 

function! ControlKey()
	echo "Key → <C-Key> » "
	let l:key = getchar()
	let l:key = ((l:key >= 97 && l:key <= 122) ? l:key - 32 : l:key) - 64
	if l:key < 0 || l:key > 31
		echoerr "Invalid Key Conbination! "
	endif
	call feedkeys(nr2char(l:key), 't') | return ''
endfunction

function! ShiftKey()
	echo "Key → <S-Key> » "
	let l:key = getchar()
	let l:key = ((l:key >= 97 && l:key <= 122) ? l:key - 32 : l:key)
	call feedkeys(nr2char(l:key), 't') | return ''
endfunction

if has('gui_running')
	function! MetaKey()
		echo "Key → <M-Key> » "
		let l:key = getchar()
		let l:key = ((l:key >= 97 && l:key <= 122) ? l:key + 128: l:key)
		call feedkeys(nr2char(l:key), 't') | return ''
	endfunction

	execute "cnoremap " . s:carp.meta .  " <C-r>=MetaKey()<Cr>"
	execute "inoremap " . s:carp.meta .  " <C-r>=MetaKey()<Cr>"
	execute "nnoremap " . s:carp.meta .  " :call MetaKey()<Cr>"
	execute "xnoremap " . s:carp.meta .  " :<C-u>call MetaKey()<Cr>"
endif

execute "cnoremap " . s:carp.control . " <C-r>=ControlKey()<Cr>"
execute "inoremap " . s:carp.control . " <C-r>=ControlKey()<Cr>"
execute "nnoremap " . s:carp.control . " :call ControlKey()<Cr>"
execute "xnoremap " . s:carp.control . " :<C-u>call ControlKey()<Cr>"

execute "cnoremap " . s:carp.shift . " <C-r>=ShiftKey()<Cr>"
execute "inoremap " . s:carp.shift . " <C-r>=ShiftKey()<Cr>"
execute "nnoremap " . s:carp.shift . " :call ShiftKey()<Cr>"
execute "xnoremap " . s:carp.shift . " :<C-u>call ShiftKey()<Cr>"
