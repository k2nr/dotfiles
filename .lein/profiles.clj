{:user {:plugins [[lein-exec "0.3.4"]
                  [lein-ancient "0.5.5"]
                  [lein-try "0.4.1"]
                  [lein-midje "3.1.3"]
                  [cider/cider-nrepl "0.7.0"]
                  ]
        :injections [(require '[clojure.pprint :refer :all])
                     (require '[clojure.repl :refer :all])]}
 }
