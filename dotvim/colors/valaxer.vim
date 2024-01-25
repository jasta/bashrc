" $Id: valaxer.vim,v 1.1 2004/08/17 06:20:19 jasta Exp $
"
" borrowed from the default colors and nagaxen's color
"

" reset the old stuff
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

" let vim know what scheme this is
let colors_name = "valaxer"

" go to town on setting colors
hi ErrorMsg		cterm=none		ctermfg=red			ctermbg=none
hi ModeMsg		cterm=bold		ctermfg=white		ctermbg=none
hi Visual		cterm=bold		ctermfg=yellow		ctermbg=darkred
hi StatusLine	cterm=bold		ctermfg=yellow		ctermbg=none
hi StatusLineNC	cterm=none		ctermfg=darkyellow	ctermbg=none

hi link IncSearch	Search

hi link Todo		ErrorMsg
hi link WarningMsg	ErrorMsg
hi link MoreMsg		ModeMsg
hi link Question	Normal

hi Comment		cterm=none		ctermfg=darkcyan	ctermbg=none
hi Constant		cterm=none		ctermfg=red			ctermbg=none
hi Number		cterm=bold		ctermfg=yellow		ctermbg=none	
hi PreProc		cterm=none		ctermfg=magenta		ctermbg=none
hi String		cterm=none		ctermfg=darkcyan	ctermbg=none
hi Statement	cterm=none		ctermfg=blue		ctermbg=none
hi Type			cterm=none		ctermfg=red			ctermbg=none
hi Delimiter	cterm=bold		ctermfg=green		ctermbg=none
hi Operator		cterm=none		ctermfg=red			ctermbg=none
hi Identifier	cterm=none		ctermfg=cyan		ctermbg=none
hi Function		cterm=none		ctermfg=red			ctermbg=none

hi link Character		String
hi link Structure		Statement
hi link StorageClass	Statement
hi link SpecialChar		Character
hi link Typedef			Statement
