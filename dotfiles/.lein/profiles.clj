{:user {:plugins [[lein-ancient "0.6.10"]
                  [lein-try "0.4.3"]
                  ]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [(require '[clojure.pprint :refer :all])
                     (require '[clojure.repl :refer :all])]}
 }
