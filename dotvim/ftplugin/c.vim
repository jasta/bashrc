"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" $Id: c.vim,v 1.2 2004/09/18 07:12:50 jasta Exp $
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

" Wrap the selection in  #if 0 ... #endif.
vnoremap <silent> _0 <Esc>`<O#if 0<Esc>`>o#endif<Esc>
