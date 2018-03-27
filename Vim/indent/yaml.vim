" A simplified version of the Vim ansible plugin indentation script:
" https://github.com/chase/vim-ansible-yaml

if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab
setlocal indentexpr=YamlIndent(v:lnum)
setlocal indentkeys=!^Fo,O,0#,<:>,-
setlocal nosmartindent

if exists('*YamlIndent')
  finish
endif

function YamlIndent(lnum)
  let prevlnum = a:lnum - 1
  if prevlnum == 0
    return 0
  endif

  let prevline = getline(prevlnum)
  let indent = indent(prevlnum)
  let increase = indent + &sw

  " Do not adjust indentation for comments
  if prevline =~ '\%(^\|\s\)#'
    return indent
  elseif prevline =~ ':\s*[>|]$'
    return increase
  elseif prevline =~ ':$'
    return increase
  elseif prevline =~ '^\s*-\s*$'
    return increase
  elseif prevline =~ '^\s*-\s\+[^:]\+:\s*\S'
    return increase
  else
    return indent
  endif
endfunction
