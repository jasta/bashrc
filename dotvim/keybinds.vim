"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" $Id: keybinds.vim,v 1.19 2004/09/18 07:13:13 jasta Exp $
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

map      <Esc><Up>     <M-Up>
map      <Esc><Down>   <M-Down>
map      <Esc><Right>  <M-Right>
map      <Esc><Left>   <M-Left>

map      <Esc>Oa       <C-Up>
map      <Esc>Ob       <C-Down>
map      <Esc>Oc       <C-Right>
map      <Esc>Od       <C-Left>

map      <Esc>;        <M-;>
map      <Esc>'        <M-'>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <C-A>         <Esc>^i
inoremap <C-E>         <End>

map      <M-Left>      b
map      <M-Right>     w
map      <M-Up>        {
map      <M-Down>      }

map      <C-Left>      <C-W>h
map      <C-Right>     <C-W>l
map      <C-Up>        <C-W>k
map      <C-Down>      <C-W>j

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Determine the highlight group of the character under the cursor.
map      <F2>     :echo synIDattr(synIDtrans(synID('.',col('.'),1)),'name')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mimic Emacs' <M-;> bind.
nmap     <M-;>    :call CommentColumn()<CR>
imap     <M-;>    <Esc>:call CommentColumn()<CR>i

" Add a horizontal rule separator using comments appropriate for the current
" syntax mode.
nmap     <M-'>    :call CommentSeparator()<CR>
imap     <M-'>    <Esc>:call CommentSeparator()<CR>i

" Add GPL source headers to source scripts.
nmap     ,Hg      :call CommentTemplate("$HOME/.vim/templates/gpl-gift")<CR>
nmap     ,Hh      :call CommentTemplate("$HOME/.vim/templates/gpl-hivetools")<CR>
nmap     ,Hj      :call CommentTemplate("$HOME/.vim/templates/gpl-jasta")<CR>
nmap     ,He      :call CommentTemplate("$HOME/.vim/templates/com-evolution")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Split, then gf.
nmap     gw       :sp<CR>gf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Format all TAB characters in the current selection to whitespace.
vmap <silent> _t  <Esc>:set expandtab<CR>`<v`>:retab<CR>:set noexpandtab<CR>`>
