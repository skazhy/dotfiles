setlocal iskeyword+=?,*,!,+,/,=,<,>,.,:
setlocal colorcolumn=80

function! UpsertCljNs()
  " Insert a namespace form in the first line of new files,
  " Rename the namespace if it differs from the path.
  "
  " This breaks on custom source paths.

  let fullPath = expand('%:p:r')
  if (l:fullPath =~ "test\/")
    let l:rawNs = substitute(l:fullPath, "^.*test[/\\\\]", "", "")
  else
    if (l:fullPath =~ "src\/")
      let l:rawNs = substitute(l:fullPath, "^.*src[/\\\\]", "", "")
    else
      if (l:fullPath =~ "dev\/")
        let l:rawNs = substitute(l:fullPath, "^.*dev[/\\\\]", "", "")
      else
        let l:rawNs = expand("%:t:r")
      endif
    endif
  endif

  if expand("%:t") == "project.clj"
    if match(getline(1), "defproject ") < 1
      let projectForm = "(defproject " . expand("%:p:h:t") . ")"
      put =projectForm
    endif
  else
    let nsName = substitute(substitute(l:rawNs, "\/", ".", "g"), "_", "-", "g")
    if match(getline(1), "ns ") > 0
      silent execute '1s/ns\s\%[\w\.-]\+/ns ' . nsName . '/e'
    else
      let nsForm = "(ns " . nsName . ")"
      put =nsForm
      silent normal kJ3o
    endif
  endif
endfunction


function! MvCljFile(newPath)
  let curr = expand('%')
  if (curr == a:newPath)
    return 0
  endif

  exe 'sav' fnameescape(a:newPath)
  call delete(curr)
  call UpsertCljNs()
  exe 'write'
endfunction
command! -nargs=1 -complete=file -bar MvCljFile call MvCljFile('<args>')

nnoremap ce :Eval<CR>
