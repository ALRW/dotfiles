{:user {:plugins [[cider/cider-nrepl "0.18.0"]
                  [venantius/yagni "0.1.4"]
                  [mvxcvi/whidbey "2.0.0"]
                  [lein-auto "0.1.3"]
                  [lein-ancient "0.6.15"]
                  [lein-try "0.4.3"]
                  [lein-kibit "0.1.6"]
                  [lein-bikeshed "0.5.1"]]
        :dependencies [[vvvvalvalval/scope-capture "0.2.0"]
                       [com.bhauman/rebel-readline "0.1.4"]
                       [cljfmt "0.5.1"]]
        :middleware [whidbey.plugin/repl-pprint cider-nrepl.plugin/middleware]
        :aliases {"rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}}}
