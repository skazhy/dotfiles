au BufRead,BufNewFile *.clj,*.edn set filetype=clojure
au BufNewFile *.clj call UpsertCljNs()
