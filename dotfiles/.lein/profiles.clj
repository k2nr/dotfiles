{:user {:dependencies [[slamhound "1.5.5"]]
        :plugins [[lein-ancient "0.6.8"]
                  [lein-try "0.4.3"]
                  ]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [(require '[clojure.pprint :refer :all])
                     (require '[clojure.repl :refer :all])]}
 :repl {:plugins [[cider/cider-nrepl "0.10.0"]
                  [refactor-nrepl "1.2.0"]
                  ]}
 }
