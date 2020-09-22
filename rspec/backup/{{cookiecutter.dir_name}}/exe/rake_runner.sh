#!/usr/bin/env bash

__dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

(
    cd ${__dir}/..
    bundle exec rake "${@}"
)
