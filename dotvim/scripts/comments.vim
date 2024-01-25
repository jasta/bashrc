"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" $Id: comments.vim,v 1.13 2004/09/08 03:05:18 jasta Exp $
""
"" Copyright (C) 2004 Josh Guilfoyle <jasta@faradic.net>
""
"" This program is free software; you can redistribute it and/or modify it
"" under the terms of the GNU General Public License as published by the
"" Free Software Foundation; either version 2, or (at your option) any
"" later version.
""
"" This program is distributed in the hope that it will be useful, but
"" WITHOUT ANY WARRANTY; without even the implied warranty of
"" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
"" General Public License for more details.
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists ("__comments_vim")
	finish
else
	let __comments_vim = 1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup comments
au!
autocmd FileType *                     call s:set_comment ('# ',    '#', ''    )
autocmd FileType c,css,cpp,java        call s:set_comment ('/* ',   '*', ' */' )
autocmd FileType php                   call s:set_comment ('// ',   '/', ''    )
autocmd FileType vim                   call s:set_comment ('" ',    '"', ''    )
autocmd FileType html,xml              call s:set_comment ('<!-- ', '#', ' -->')
autocmd FileType perl,python,ruby      call s:set_comment ('# ',    '#', ''    )
autocmd FileType sh                    call s:set_comment ('# ',    '#', ''    )
autocmd FileType mason                 call s:set_comment ('# ',    '#', ''    )
autocmd FileType sql                   call s:set_comment ('-- ',   '-', ''    )
autocmd FileType xdefaults             call s:set_comment ('! ',    '!', ''    )
augroup END

function! s:set_comment(start,middle,stop)

	let g:commentStart = a:start
	let g:commentMiddle = a:middle
	let g:commentStop = a:stop

endfunction

call s:set_comment ('', '', '')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:strtrim(str)

	return substitute (substitute (a:str, '^\s*', '', ''), '\s*$', '', '')

endfunction

function! s:has_comment_type()

	if g:commentStart == '' || g:commentMiddle == ''
		echohl WarningMsg
		echo "CommentSeparator() is not implemented for this file type."
		echohl None
		return 0
	endif

	return 1

endfunction

function! CommentSeparator()

	let sep = s:comment_separator (indent (line ('.')))
	call append (line ('.') - 1, sep)

endfunction

function! s:comment_separator(column)

	if s:has_comment_type() == 0
		return
	endif
	
	let cbeg = s:strtrim (g:commentStart)
	let cmid = s:strtrim (g:commentMiddle)
	let cend = s:strtrim (g:commentStop)
	
	let csep = ''

	let ntabs = a:column / &tabstop

	while ntabs > 0
		let csep = csep . "\t"
		let ntabs = ntabs - 1
	endwhile

	let nmids = &columns - a:column - (strlen (cbeg) + strlen (cend)) - 1
	
	let csep = csep . cbeg

	while nmids > 0
		let csep = csep . cmid
		let nmids = nmids - strlen (cmid)
	endwhile
	
	let csep = csep . cend
	
	return csep
	
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:commentify_buffer()

	" Single-line comments use a special double-wide leading comment for
	" each line of the template.
	if strlen (g:commentStop) == 0
		let mblock = s:strtrim (g:commentStart)
		
		if strlen (mblock) < 2
			let mblock = mblock . g:commentMiddle
		endif
	else
		let mblock = ' ' . g:commentMiddle
	endif
	
	" Transform the buffer using `mblock'.
	execute "normal gg\<C-V>GI" . mblock . ' '

	if strlen (g:commentStop) == 0
		" Add extra blank lines before and after the comment separators.
		call append (0, mblock)
		call append (line ('$'), mblock)

		let mbeg = s:comment_separator (0)
		let mend = s:comment_separator (0)
	else
		let mbeg = g:commentStart
		let mend = g:commentStop
	endif

	call append (0, mbeg)
	call append (line ('$'), mend)
	
	" Trim any whitespace pollution that has made its way into the buffer
	" from our munging.
	silent! execute ':%s/\s*$//'
	
endfunction

function! CommentTemplate(template)

	" Open the template in another buffer and mung it according to the current
	" comment settings.
	execute ':sp ' . a:template
	call s:commentify_buffer()

	" Copy the modified buffer and destroy it.
	normal ggVGy
	execute ':q!'

	" Paste the header.
	execute "normal O\<Esc>"
	normal P

endfunction
