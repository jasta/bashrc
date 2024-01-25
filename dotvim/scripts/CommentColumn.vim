"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" $Id: CommentColumn.vim,v 1.5 2004/09/06 05:49:10 jasta Exp $
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

" For compatibility with AppendComment.vim by Johannes Tanzler
if ! exists ("g:Comment_column")
	let g:Comment_column = 40
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CommentColumn()

	if g:commentStart != ''
		call s:HangComment (g:commentStart, g:commentStop)	
	endif

endfunction	

function! s:HangComment(cBegin,cEnd)

	"
	" TODO: This check needs to be fixed so that it would not match the
	" following line as having a hanging comment in place already:
	"
	"   syscall (1 /* fork() */);
	"
	let lineStr = getline (line ('.'))
	let cpos = strridx (lineStr, a:cBegin)

	if cpos == -1
		call s:MakeComment (a:cBegin, a:cEnd)
	else
		call s:MoveComment (a:cBegin, cpos + 1)
	endif

	" Always end up in insert mode.
	startinsert

endfunction

"
" Move an existing hanging comment to the correct comment column (if
" necessary) and ready the cursor for editing the comment.
"
function! s:MoveComment(cBegin,cpos)

	" Collapse whitespace immediately preceeding the comment's position.
	call cursor (line ('.'), a:cpos)
	execute "normal i \<ESC>l"
	execute "normal d?\\s*\<CR>"
	
	" Push the comment away from the expression we collapsed it into, and
	" then position the cursor for editing.
	call s:InsertSpaces ('i', s:HangingDistance())
	call cursor (line ('.'), col ('.') + strlen (a:cBegin) + 1)
	
endfunction 

"
" Add a comment to a line when there is not one to move.
"
function! s:MakeComment(cBegin,cEnd)

	" Move to the end of the line and determine the number of spaces we need
	" to insert from this position in order to reach our target column.
	execute ':s/\s*$//'
	normal $
	call s:InsertSpaces ('a', s:HangingDistance() - 1)

	" Insert the comment and position the cursor in a useful location
	" inside the comment.
	execute 'normal a' . a:cBegin
	execute 'normal a' . a:cEnd
	call cursor (line ('.'), col ('.') - (strlen (a:cEnd) - 1))

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:HangingDistance()

	let curr = virtcol ('.')
	let pref = g:Comment_column
	
	let dist = pref - curr	
	
	" If the current line exceeds the preferred comment column, align the
	" indent exactly as you would by using an actual TAB character.
	if dist <= 0
		let dist = &ts - (curr % &ts)
	endif

	return dist

endfunction

function! s:InsertSpaces(m,n)

	let i = 0
	let spaces = ''

	" Something tells me there is definitely a better way to insert <n>
	" number of spaces in vim.  Anyone?
	while i < a:n
		let spaces = spaces . ' '
		let i = i + 1
	endwhile

	execute 'normal ' . a:m . spaces . "\<Esc>"

endfunction
