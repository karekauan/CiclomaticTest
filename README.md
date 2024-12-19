docker run -ti --rm -v ${PWD}:/app ruby:3-bookworm /bin/bash

bundle install

ruby -Ilib test/complexity_test.rb