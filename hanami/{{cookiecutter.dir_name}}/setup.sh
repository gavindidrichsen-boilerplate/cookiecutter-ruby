#!/usr/bin/env bash

# configure bundle
bundle config set path 'vendor/bundle'
bundle install

if [[ ! -d {{cookiecutter.hanami_application}} ]]; then bundle exec hanami new {{cookiecutter.hanami_application}}; fi
if [[ ! -f {{cookiecutter.hanami_application}}/Guardfile ]]; then cp .Guardfile {{cookiecutter.hanami_application}}/Guardfile; fi

# ensure rspec result file exists to prevent intermittent errors from occurring
mkdir -p {{cookiecutter.hanami_application}}/tmp
touch {{cookiecutter.hanami_application}}/tmp/rspec_guard_result
