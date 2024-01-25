"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" $Id: c.vim,v 1.6 2004/09/06 05:49:09 jasta Exp $
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

syn match	cDelimiter		/[()\[\]{}\,\.;:\?]/
syn match	cDelimiter		/:/ contained

syn match	cOperator		/[\+\-\&|\^\%\!\=\<\>\*~]/
syn match	cOperator		/\/[\*\/]\@!/

syn keyword cAnsiFunction   assert abort malloc free
syn keyword cAnsiFunction   memset memcpy
syn keyword cAnsiFunction   strcpy strncpy strcmp 
syn keyword cAnsiFunction   strchr strstr strsep strspn strcspn strpbrk
syn keyword cAnsiFunction   strtol strtoll strtoul strtoull atoi atol
syn keyword cAnsiFunction   printf sprintf vsprintf snprintf vsnprintf fprintf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi link		cDelimiter		Delimiter
hi link     cAnsiFunction   Operator
