{:user {:plugins [[lein-ancient "0.6.15"]
                  [lein-try "0.4.3"]
                  [jonase/eastwood "0.2.5"]
                  [lein-kibit "0.1.6"]
                  ]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [(require '[clojure.pprint :refer :all])
                     (require '[clojure.repl :refer :all])]}
 }
