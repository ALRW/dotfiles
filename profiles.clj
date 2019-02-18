{:user {:plugins [[cider/cider-nrepl "0.21.1"]
                  [venantius/yagni "0.1.7"]
                  [lein-cljfmt "0.6.3"]
                  [nrepl "0.5.3"]
                  [lein-auto "0.1.3"]
                  [lein-ancient "0.6.15"]
                  [lein-eftest "0.5.4"]
                  [lein-try "0.4.3"]
                  [lein-kibit "0.1.6"]
                  [ns-graph "0.1.3"]
                  [lein-bikeshed "0.5.1"]]
        :dependencies [[vvvvalvalval/scope-capture "0.3.2"]
                       [com.bhauman/rebel-readline "0.1.4"]
                       [cljfmt "0.5.1"]]
        :injections [(require 'sc.api)]
        :middleware [cider-nrepl.plugin/middleware]
        :ns-graph {:name "project-graph"
                   :source-paths "./src"
                   :exclude ["java.*" "clojure.*"]}
        :aliases {"rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}}}
