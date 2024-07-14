#!/bin/bash

/home/jrporto/.rbenv/versions/3.3.1/bin/bundle
/home/jrporto/.rbenv/versions/3.3.1/bin/bundle install
/home/jrporto/.rbenv/versions/3.3.1/bin/bundle exec rake assets:precompile --trace
/home/jrporto/.rbenv/versions/3.3.1/bin/bundle exec rake assets:clean --trace
