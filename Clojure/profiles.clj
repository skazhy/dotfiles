{:user {:plugins [[cider/cider-nrepl "0.10.1"]
                  [lein-bikeshed "0.2.0"]
                  [com.jakemccrary/lein-test-refresh "0.17.0"]
                  [lein-kibit "0.0.8"]
                  [lein-try "0.4.3"]
                  [codox "0.6.4"]
                  [venantius/yagni "0.1.4"]
                  [jonase/eastwood "0.2.3"]]
          :aliases {"lint" ["do" "eastwood," "bikeshed"]}}
 :auth {:repository-auth {#"https://clojars.org/repo"
                         {:username "karlis"
                          :password :env/clojars_password}}}}
