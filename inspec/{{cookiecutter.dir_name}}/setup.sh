#!/usr/bin/env bash

# configure bundle
bundle config set path 'vendor/bundle'
bundle install

# create a dummy test profile
(
    mkdir -p profiles
    cd profiles
    bundle exec inspec init profile hello_world
)
bundle exec inspec exec ./profiles/hello_world
