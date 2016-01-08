{:user {:plugins [[cider/cider-nrepl "0.10.1"]
                  [lein-bikeshed "0.2.0"]
                  [lein-cloverage "1.0.7-SNAPSHOT"]
                  [lein-cljfmt "0.3.0"]
                  [lein-kibit "0.0.8"]
                  [codox "0.6.4"]
                  [jonase/eastwood "0.2.3"]]}
 :auth {:repository-auth {#"https://clojars.org/repo"
                         {:username "karlis"
                          :password :env/clojars_password}}}}
