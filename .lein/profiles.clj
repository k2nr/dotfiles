{:user {:dependencies [[slamhound "1.5.5"]]
        :plugins [[lein-ancient "0.6.7"]
                  [lein-try "0.4.3"]
                  [cider/cider-nrepl "0.9.1"]
                  [refactor-nrepl "1.1.0"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [(require '[clojure.pprint :refer :all])
                     (require '[clojure.repl :refer :all])]}
 }
