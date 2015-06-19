function! InsertCljNs()
  let fullPath = expand('%:r')

  if (l:fullPath =~ "\/test\/")
    let l:rawNs = substitute(l:fullPath, "^.*test[/\\\\]", "", "")
  else
    let l:rawNs = substitute(l:fullPath, "^.*src[/\\\\]", "", "")
  endif
  echo rawNs

  let nsForm = "(ns " . substitute(substitute(l:rawNs, "\/", ".", "g"), "_", "-", "g") . ")"
  put =nsForm
  silent normal kJ3o
endfunction

au BufRead,BufNewFile *.clj,*.edn set filetype=clojure
au BufNewFile *.clj call InsertCljNs()
