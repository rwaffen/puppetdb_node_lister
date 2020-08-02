# Dev Installation

Install dependencies

```
bundle install --path vendor/bundle --local
```

Run server on localhost

```
bundle exec ruby puppetdb_node_lister.rb
```

```
[2016-05-20 19:31:13] INFO  WEBrick 1.3.1
[2016-05-20 19:31:13] INFO  ruby 2.0.0 (2014-11-13) [x86_64-darwin14.1.0]
== Sinatra (v1.4.7) has taken the stage on 4567 for development with backup from WEBrick
[2016-05-20 19:31:13] INFO  WEBrick::HTTPServer#start: pid=21467 port=4567
WARN: tilt autoloading 'tilt/erb' in a non thread-safe way; explicit require 'tilt/erb' suggested.
::1 - - [20/May/2016:19:31:20 +0200] "GET / HTTP/1.1" 200 374996 0.3680
localhost - - [20/May/2016:19:31:19 CEST] "GET / HTTP/1.1" 200 374996
- -> /
::1 - - [20/May/2016:19:31:20 +0200] "GET /css/bootstrap.min.css HTTP/1.1" 304 - 0.0006
::1 - - [20/May/2016:19:31:20 +0200] "GET /js/bootstrap.min.js HTTP/1.1" 304 - 0.0004
localhost - - [20/May/2016:19:31:20 CEST] "GET /css/bootstrap.min.css HTTP/1.1" 304 0
::1 - - [20/May/2016:19:31:20 +0200] "GET /js/jquery-2.2.3.min.js HTTP/1.1" 304 - 0.0005
http://localhost:4567/ -> /css/bootstrap.min.css
localhost - - [20/May/2016:19:31:20 CEST] "GET /js/bootstrap.min.js HTTP/1.1" 304 0
http://localhost:4567/ -> /js/bootstrap.min.js
localhost - - [20/May/2016:19:31:20 CEST] "GET /js/jquery-2.2.3.min.js HTTP/1.1" 304 0
http://localhost:4567/ -> /js/jquery-2.2.3.min.js
```

# Prod Installation

( This will be done with Puppet and the RPM on production systems. )

Install dependencies

```
bundle install --deployment --local
```

Run the server in non deamon mode:

```
RACK_ENV="production" bundle exec ruby puppetdb_node_lister.rb
```


```
ssh -L 8080:localhost:8080  puppetdb.example.com
```
