tag-flag
========

The HTML Selector Site Searcher

Try it at http://tagflag.org

Getting Started
===============

$ git clone https://github.com/ericrvass/tag-flag.git
$ cd tag-flag

Sign up for a free account with Iron Worker at iron.io
Use the credentials to fill in: config/ironworker.yml & phantomjs/.iron.json

Install the ruby ironworker tools:

$ sudo gem install iron_worker_ng

Upload the worker to iron.io:

$ iron_worker upload phantom

$ bundle
$ rails s

License
=======

tag-flag is available under the GPLv2 license. See the LICENSE file for more info.
