
"                            ███                                    
"                           ▒▒▒                                     
"         ███████ █████ █████ ████  █████████████   ████████   ██████ 
"        ███▒▒███▒▒███ ▒▒███ ▒▒███ ▒▒███▒▒███▒▒███ ▒▒███▒▒███ ███▒▒███
"       ▒███ ▒███ ▒███  ▒███  ▒███  ▒███ ▒███ ▒███  ▒███ ▒▒▒ ▒███ ▒▒▒ 
"       ▒███ ▒███ ▒▒███ ███   ▒███  ▒███ ▒███ ▒███  ▒███     ▒███  ███
"   ██  ▒▒███████  ▒▒█████    █████ █████▒███ █████ █████    ▒▒██████ 
"  ▒▒    ▒▒▒▒▒███   ▒▒▒▒▒    ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒      ▒▒▒▒▒▒  
"        ███ ▒███                                                     
"       ▒▒██████                                                      
"        ▒▒▒▒▒▒                                                       

" set background=light
" colorscheme gruvbox
set background=dark
colo sierra

set guifont=Terminus\ 11
" set guifont=Ubuntu\ Mono\ Nerd\ Font\ 11
" set guifont=Ubuntu\ Mono\ Nerd\ Font\ 11
" set guifont=GohuFont\ Nerd\ Font\ 10.5

" Disable Toolbar
" set guioptions -=T
" 
" " Disable Menubar
" set guioptions -=m
" 
" " right and left scrollbar
" set guioptions -=r
" set guioptions -=L
" 
" " disable tabs as well !
" set guioptions=

set guioptions=cmTF
set guipty

" Linespace
set lsp=2

" Mouse compat.
set mouse=a

" hide mouse when typing
set mh


function! ToggleProse()
	if &laststatus == 2
		setlocal laststatus=0
	endif
	if &showtabline == 2
		setlocal showtabline =0
	endif

	setlocal number! relativenumber!
endfunction
command! ToggleProse call ToggleProse()


