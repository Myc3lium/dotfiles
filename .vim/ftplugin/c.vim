set sw=4
set sts=4

command!  PreProcessView call PreProcessView()
function! PreProcessView()
	:%y
	normal! np
	:%! cpp
	setlocal filetype=c
endfunction
