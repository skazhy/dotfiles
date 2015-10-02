setlocal iskeyword+=?,*,!,+,/,=,<,>,.,:
setlocal colorcolumn=80
setlocal shiftwidth=2
setlocal tabstop=2

function! DeleteSurroundingForm()
 silent normal ?(ds(dex
endfunction

command! Dsf call DeleteSurroundingForm()
