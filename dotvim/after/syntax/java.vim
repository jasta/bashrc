"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" $Id: java.vim,v 1.2 2004/09/06 05:49:09 jasta Exp $
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

syn keyword	javaStatement		new instanceof
syn match	javaDelimiter		/[()\[\]{}\,\.;:\?]/
syn match	javaOperator		/[\+\-\&|\^\%\!\=\<\>\*]/
syn match	javaOperator		/\/[\*\/]\@!/

hi link		javaExternal		Statement
hi link		javaType			StorageClass
hi link		javaDelimiter		Delimiter

