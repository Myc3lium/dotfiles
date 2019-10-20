"
" ＣＡＲＰ．ＶＩＭ
"
" carp.vim is a small, lightweight plugin designed for providing a more
" ergonomic way of entering keystrokes requiring the use of modifier keys,
" such as the control, shift and alt (Meta) keys. Vim's expression mapping 
" feature is used to define mappings for leading key sequences that behave 
" like a sticky version of the equivalent modifier key. These mappings work 
" in normal, visual, operator pending, command (Ex mode) and insert modes.
"
" Configuration options can be specfied using the global variable g:carp.
" Each of the values in g:carp should be a string specifying a sequence
" of keys (using vim's syntax for mappings), to be mapped to each modifier.
" Example:
"
" let g:carp = {
" 			\ 'control' : '<Leader>,',
" 			\ 'shift'   : '<Leader>c',
" 			\ 'meta'    : '<Leader>m',
" 			\}

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

function! ControlKey(key)
	let l:key = ((a:key >= 97 && a:key <= 122) ? a:key - 32 : a:key) - 64
	if l:key < 0 || l:key > 31
		return ''
	endif
	return nr2char(l:key)
endfunction

function! ShiftKey(key)
	let l:key = ((a:key >= 97 && a:key <= 122) ? a:key - 32 : a:key)
	return nr2char(l:key)
endfunction

if has('gui_running')
	function! MetaKey(key)
		let l:key = ((a:key >= 97 && a:key <= 122) ? a:key + 128: a:key)
		return nr2char(l:key) 
	endfunction

	execute "cmap <expr> " . s:carp.meta . " MetaKey(getchar())"
	execute "imap <expr> " . s:carp.meta . " MetaKey(getchar())"
	execute "nmap <expr> " . s:carp.meta . " MetaKey(getchar())"
	execute "xmap <expr> " . s:carp.meta . " MetaKey(getchar())"
	execute "omap <expr> " . s:carp.meta . " MetaKey(getchar())"
endif

execute "cmap <expr> " . s:carp.control . "  ControlKey(getchar())"
execute "imap <expr> " . s:carp.control . "  ControlKey(getchar())"
execute "nmap <expr> " . s:carp.control . "  ControlKey(getchar())"
execute "xmap <expr> " . s:carp.control . "  ControlKey(getchar())"
execute "omap <expr> " . s:carp.control . "  ControlKey(getchar())"

execute "cmap <expr> " . s:carp.shift . " ShiftKey(getchar())"
execute "imap <expr> " . s:carp.shift . " ShiftKey(getchar())"
execute "nmap <expr> " . s:carp.shift . " ShiftKey(getchar())"
execute "xmap <expr> " . s:carp.shift . " ShiftKey(getchar())"
execute "omap <expr> " . s:carp.shift . " ShiftKey(getchar())"
