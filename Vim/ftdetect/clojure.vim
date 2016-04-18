au BufRead,BufNewFile *.clj,*.edn,*.cljs,*.cljc,*.cljx set filetype=clojure
au BufNewFile *.clj call UpsertCljNs()
