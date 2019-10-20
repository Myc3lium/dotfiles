
" TODO: add optional numbering/format strings for bookmarks
" and history entries.

let s:stickypath = expand('~/.vim/bundle/borkmark.vim/plugin/sticky.txt')

function! s:GetStickyFiles()
    return readfile(s:stickypath)
endfunction

" Default config values.
let s:borkdefaults = { 
    \ 'recenttext'     : '# Recent Files:',
    \ 'windowname'     : 'Startup',
    \ 'defaultstatus'  : 2,
    \ 'shownum'        : 7,
    \ 'bookmarkpath'   : '$HOME/.vim/bundle/borkmark.vim/plugin/bookmarks.txt',
    \ 'bookmarktext'   : '# Bookmarks:',
    \ 'fileopenmethod' : 'tabedit!',
    \ 'bookmarkprefix' : '()',
    \ 'historyprefix'  : '[]',
    \ 'stickyfiles'    : s:GetStickyFiles(),
	\ }


" Load default values for unset options.
for [configkey, configval] in items(s:borkdefaults)
	if !has_key(g:borkmark, configkey)
		let g:borkmark[configkey] = configval
	endif
endfor 

" Setup trigger for main function on entry.
augroup BorkTriggers
	au StdinReadPre * let s:is_stdin = 1
    au VimEnter     * call BorkMarkSetup()
augroup END


function! GetBookMarks()
	" Read into buffer from bookmarks file.
	" execute 'tabedit! ' . g:borkmark.bookmarkpath
	"     :%s/^.\d\+. //eg
    "     execute '%s/^/\=printf("' . g:borkmark.bookmarkprefix[0] . '%d' . g:borkmark.bookmarkprefix[1] . ' ", line("."))/g'
    " :wq
	execute 'read ' . g:borkmark.bookmarkpath
endfunction

function! AddBookMarks()
	" Append current filepath to bookmarks file.
	let pathvar = expand('%:p')
    call writefile([g:borkmark.bookmarkprefix . pathvar], g:borkmark.bookmarkpath, 'a')
	unlet pathvar
endfunction

function! AddSticky()
	" Append current filepath to sticky file.
	let pathvar = expand('%:p')
    call writefile([pathvar], s:stickypath, 'a')
	unlet pathvar
endfunction

function! RemoveSticky()
	" Remove current filepath to sticky file.
	let pathvar = expand('%:p')
	echo pathvar
	execute "tabedit! ~/.vim/bundle/borkmark.vim/plugin/sticky.txt"
		set nomagic
		execute "%s@" . pathvar . "@@eg"
		set magic
	:wq
	" unlet pathvar
endfunction

function! OpenRecordLine(record)
	" Open a line record.
	if index([g:borkmark.recenttext, g:borkmark.bookmarktext], a:record) != -1 || a:record == ''
		return
	endif

	let a:path = split(a:record, " ")[1]
	execute g:borkmark.fileopenmethod . ' ' . a:path
endfunction

function BorkMarkSetup()
    " Start with scratchpad buffer if no file arguments.
	if argc() == 0 && ! exists('s:is_stdin')
		setlocal buftype=nofile
		setlocal bufhidden=hide
		setlocal filetype=markdown
		setlocal noswapfile

		setlocal cursorline
		setlocal nonumber norelativenumber
		if has('gui_running')
			setlocal mousehide
        endif 
		execute 'file ' . g:borkmark.windowname

		" Get and prune history entries. 
		" Remove Duplicates.
		" Insert history entries. 
        let l:filter_ = printf('(v:val !~ %s && v:val !~ "/usr/share/vim/vim74/doc/")', string(g:borkmark.windowname))
		let l:recentfiles = filter(copy(v:oldfiles), l:filter_)[0:g:borkmark.shownum]
		let l:recentfiles = map(l:recentfiles, 'printf("%s%d%s %s",g:borkmark.historyprefix[0], v:key, g:borkmark.historyprefix[1], v:val)')
		let l:recentfiles = join(recentfiles, "\n")
		silent put =l:recentfiles
		normal! gg"_dd

		" Insert prefix text at beginning of file.
		silent 0put =g:borkmark.recenttext
		normal! <S-o><Esc><S-o><Esc>

		" Insert text from bookmark file.
		silent 0put =g:borkmark.bookmarktext
		call GetBookMarks()
		silent :%s/^#/\r#/g
		normal! gg"_dd

		setlocal nomodifiable
		setlocal readonly

		" Remap <C-j> to select and open the filename under the cursor's line.
		" nnoremap <buffer><C-j> ^f<Space>l"nyg_ :tabedit! <C-r>n<Return>
		"nnoremap <silent><buffer><C-j> ^"nyg_:call OpenRecordLine('<C-r>n')<Return>
		nnoremap <silent><buffer><C-j> :call OpenRecordLine(getline(line('.')))<Cr>

		" Grab a thing and put it into an Ex prompt.
		"nnoremap <buffer><C-k> ^f<Space>"nyg_:tabedit!<Space><C-r>n
		nnoremap <buffer><C-k> :tabedit!<Space><C-r>=split(getline(line('.')))[1]<Cr>

		" Open sticky'd files.
		if !empty(g:borkmark.stickyfiles)
			for filepath in g:borkmark.stickyfiles
				execute g:borkmark.fileopenmethod . ' ' . filepath
			endfor
			:tabfirst
		endif
	endif
endfunction
