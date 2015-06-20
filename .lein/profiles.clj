{:user {:dependencies [[slamhound "1.5.5"]]
        :plugins [[lein-exec "0.3.5"]
                  [lein-ancient "0.6.7"]
                  [lein-try "0.4.3"]
                  [lein-midje "3.1.3"]
                  [cider/cider-nrepl "0.9.0-SNAPSHOT"]
                  [refactor-nrepl "1.0.5"]
                  ]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [(require '[clojure.pprint :refer :all])
                     (require '[clojure.repl :refer :all])]}
 }
