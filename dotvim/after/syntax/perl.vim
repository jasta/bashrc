"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" $Id: perl.vim,v 1.3 2004/09/06 05:49:09 jasta Exp $
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

"syn match	perlOperator		/[\+\-|\^\%\!\=\<\>\*\/~]/
"syn match	perlDelimiter		/[()\[\]{}\,\.;:\?]/
"
""" this is a copy of the original definition but changed the end to 
"syn region	perlFunction		start="\s*\<sub\>" end="[;{]"me=e-2 contains=perlStatementSub,perlFunctionPrototype,perlFunctionPRef,perlFunctionName,perlComment
"
"syn match	Normal				"\<\I\i*\s*=>"me=e-2

hi link		perlSharpBang		Comment
hi link		perlSpecialMatch	Character
hi link		perlFunctionName	Normal
hi link		perlDelimiter		Delimiter

syn region perlQQ               matchgroup=perlStringStartEnd start=+\<q\^+ end=+\^+ contains=@perlInterpSQ
syn region perlQQ               matchgroup=perlStringStartEnd start=+\<q[qx]\^+ end=+\^+ contains=@perlInterpDQ
