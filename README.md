Mäxchen
=======

This aims to become an environment for running [Mia](http://en.wikipedia.org/wiki/Mia_%28game%29) games, where the players are bots programmed by participants in an exercise session.

The game is run by a server (provided here). The players communicate with that server using a simple text-based protocol over UDP.

The idea for this was shamelessly copied from Nicolas Botzet and Steven Collins, who used a similar setup (albeit simulating Poker) for their [Craftsmen Coding Contest session at SoCraTes 2011](http://socrates2011.pbworks.com/w/page/44002190/Sessions).


Set Up
======

- Install a JVM (>= 1.7), Gradle (>= 2.8), Node (>=6.2.1) and NPM
- Run `./install` to build and install `server`, `java-udp-helper`, `swing-spectator` and `java-simple-bot`
- Run `./start` to start server and spectator. Ctrl-C to stop both.
      - Use `./start 60000` to start server with initial delay of 1 minute (60000 msecs).
- cd to `./client/java-simple-bot` running one of the two Java bots:
      - `./start-simple-bot`
      - `./start-random-bot`

