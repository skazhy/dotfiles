{:user {:plugins [[cider/cider-nrepl "0.8.2"]
                  [lein-bikeshed "0.2.0"]
                  [lein-kibit "0.0.8"]
                  [jonase/eastwood "0.2.1"]]}
 :auth {:repository-auth {#"https://clojars.org/repo"
                         {:username "karlis"
                          :password :env/clojars_password}}}}
