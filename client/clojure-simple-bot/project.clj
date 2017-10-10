(defproject maexchen/simplebot "0.1.0-SNAPSHOT"
  :description "A bot that plays Mia"
  :url "https://github.com/janernsting/maexchen"
  :license {:name "Do what you like"}
  :dependencies [[org.clojure/clojure "1.5.1"]
                 ; If missing, install https://github.com/janernsting/maexchen/tree/master/client/java-udp-helper
                 ; using gradle install
                 [udp-helper/udp-helper "[1.0,)"]]
  :main maexchen.simplebot
  ; Only used in the repl, comment out if dependencies are not available
  :profiles {:dev {:dependencies [[org.clojure/tools.namespace "0.2.4"]]
                   :source-paths ["dev"]}}
)
