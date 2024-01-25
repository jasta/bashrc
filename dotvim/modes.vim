"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" $Id: modes.vim,v 1.10 2004/09/18 07:15:30 jasta Exp $
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

autocmd BufNewFile *.h                 call InsertIncludeGuard()

function! InsertIncludeGuard()

	" Access the current buffer's filename, then apply the appropriate
	" transformations to reach something like "__FOO_H".
	let guard = substitute (@%, '[a-z]', '\u\0', 'g')
	let guard = substitute (guard, '[^a-z]', '_', 'g')
	let guard = '__' . guard

	" Insert the include guard.
	execute "normal i#ifndef " . guard . "\<CR>"
	execute "normal i#define " . guard . "\<CR>\<CR>"
	call CommentSeparator()
	execute "normal o\<CR>\<CR>"
	call CommentSeparator()
	execute "normal o#endif /* " . guard . " */"

	" Position cursor in between the comment separators.  Cryptic, I know.
	6

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType html,xml,mason        set ts=4 sw=4 list et
" autocmd BufWritePre *.c,*.java         ks | %s/\s\+$// | 's

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let is_bash = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let c_space_errors = 1
"let java_space_errors = 1
"let java_ignore_javadoc = 1
