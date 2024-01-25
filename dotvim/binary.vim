" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.lnk let &bin=1
  au BufReadPost *.lnk if &bin | %!xxd
  au BufReadPost *.lnk set ft=xxd | endif
  au BufWritePre *.lnk if &bin | %!xxd -r
  au BufWritePre *.lnk endif
  au BufWritePost *.lnk if &bin | %!xxd
  au BufWritePost *.lnk set nomod | endif
augroup END
