" Used recommendations from Google JSON style guide 
" http://google-styleguide.googlecode.com/svn/trunk/jsoncstyleguide.xml

setlocal tabstop=2
setlocal shiftwidth=2

autocmd BufWritePre *.json :%s/'/"/e
autocmd BufWritePre *.json :%s/\s\+$//e
