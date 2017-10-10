# maexchen.simplebot

A simple bot to play Mia. Please see https://github.com/janernsting/maexchen
for details.

# Dependencies

* [Leiningen]: http://leiningen.org/
* [udp-helper/udp-helper 1.+]: https://github.com/janernsting/maexchen/tree/master/client/java-udp-helper (gradle install)
* [org.clojure/tools.namespace "0.2.4"]: optional, remove profile :dev if not required

## Usage

Non interactive:

$ lein run localhost 9000 cljbot

Interactive:

$ lein repl
repl: (user/go)

Preferably in an interactive programming environment, using vim / emacs.

## Copyright and License

Copyright © 2013 Benjamin Peter <benjaminpeter@arcor.de>

Do whatever you like but don't blame me license.

## Thanks

Thanks for the maexchen project.

conradmueller, janernsting, ggramlich, franziskas
