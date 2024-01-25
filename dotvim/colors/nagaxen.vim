" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Daniel Lawless
" Last Change:	2003 November 23, 2003

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif

" colorscheme being used
let g:colors_name = "nagaxen"

hi cOperators	  ctermfg=red
hi cExtraOp       ctermfg=red
hi cExpressions	  ctermfg=yellow

hi SpecialKey	  cterm=none		ctermfg=darkred			ctermbg=none
hi NonText		  cterm=none		ctermfg=darkblue		ctermbg=none
hi Directory	  cterm=none		ctermfg=brown			ctermbg=none
hi ErrorMsg		  cterm=none		ctermfg=grey			ctermbg=blue
hi Search		  cterm=none		ctermfg=white			ctermbg=red
hi MoreMsg		  cterm=none		ctermfg=darkgreen		ctermbg=none
hi ModeMsg		  cterm=bold		ctermfg=blue			ctermbg=none
hi LineNr		  cterm=none		ctermfg=darkcyan		ctermbg=none
hi Question		  cterm=none		ctermfg=darkgreen		ctermbg=none
hi StatusLine	  cterm=bold		ctermfg=yellow			ctermbg=none
hi StatusLineNC   cterm=none		ctermfg=darkyellow		ctermbg=none
hi Title		  cterm=none		ctermfg=darkmagenta		ctermbg=none
hi Visual		  cterm=reverse
hi WarningMsg	  cterm=none		ctermfg=darkblue		ctermbg=none
hi Comment		  cterm=none		ctermfg=cyan			ctermbg=none
hi Constant		  cterm=none		ctermfg=darkmagenta		ctermbg=none
hi Delimiter	  cterm=none        ctermfg=yellow			ctermbg=none
hi Special		  cterm=none		ctermfg=red				ctermbg=none
hi Identifier	  cterm=none		ctermfg=red				ctermbg=none
hi Statement	  cterm=none		ctermfg=blue			ctermbg=none
hi PreProc		  cterm=none		ctermfg=darkgreen		ctermbg=none
hi Type			  cterm=none		ctermfg=blue			ctermbg=none
hi Error		  cterm=none		ctermfg=darkcyan		ctermbg=red  
hi Todo			  cterm=none		ctermfg=black			ctermbg=darkcyan  
hi link IncSearch		Visual
hi link String			Constant
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special
