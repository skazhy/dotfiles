setlocal iskeyword+=?,*,!,+,/,=,<,>,.,:
setlocal colorcolumn=80
setlocal shiftwidth=2
setlocal tabstop=2

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

  let nsName = substitute(substitute(l:rawNs, "\/", ".", "g"), "_", "-", "g")

  if match(getline(1), "ns ") > 0
      silent execute '1s/ns\s\%[\w\.]\+/ns ' . nsName . '/e'
  else
    let nsForm = "(ns " . nsName . ")"
    put =nsForm
    silent normal kJ3o
  endif
endfunction

function! OpenCljTestOrSource()
  " Opens tests for a given source or source for given tests
  " Handles two naming schemes for namespace foo: t-foo and foo-test

  let fullPath = expand('%:t')
  if (l:fullPath =~ "test\/")
    let l:newPath = substitute(l:fullPath, "test", "src", "")
  else
    let l:newPath = substitute(l:fullPath, "src", "test", "")
  endif
  execute 'b ' . l:newPath
endfunction

function! DeleteSurroundingForm()
 silent normal ?(ds(dex
endfunction
