#!/bin/bash

/home/ubuntu/.rvm/wrappers/ruby-3.3.1/bundle
/home/ubuntu/.rvm/wrappers/ruby-3.3.1/bundle install
/home/ubuntu/.rvm/wrappers/ruby-3.3.1/bundle exec rake assets:precompile --trace
/home/ubuntu/.rvm/wrappers/ruby-3.3.1/bundle exec rake assets:clean --trace
