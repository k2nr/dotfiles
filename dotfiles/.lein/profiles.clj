{:user {:dependencies [[slamhound "1.5.5"]]
        :plugins [[lein-ancient "0.6.10"]
                  [lein-try "0.4.3"]
                  ]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [(require '[clojure.pprint :refer :all])
                     (require '[clojure.repl :refer :all])]}
 :repl {:plugins [[cider/cider-nrepl "0.14.0"]
                  #_[refactor-nrepl "2.2.0"]
                  ]}
 }
