au BufRead,BufNewFile *.clj,*.edn,*.cljs,*.cljc,*.cljx,*.bb set filetype=clojure
au BufNewFile *.clj call UpsertCljNs()
au BufNewFile *.cljs call UpsertCljNs()
