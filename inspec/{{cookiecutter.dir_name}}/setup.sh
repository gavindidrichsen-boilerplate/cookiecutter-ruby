#!/usr/bin/env bash

# configure bundle
bundle config set path 'vendor/bundle'
bundle install

# create a dummy test profile
(
    cd test/inspec
    bundle exec inspec init profile hello_world
)
bundle exec inspec exec ./test/inspec/hello_world
