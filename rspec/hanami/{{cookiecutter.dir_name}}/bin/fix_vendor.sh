#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
#set -vx

__dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ -d ${APPLICATION_ROOT}/vendor/bundle/ruby/2.6.0/gems/better_errors-2.8.2 ]]; then
  cp -R ${APPLICATION_ROOT}/bin/vendor ${APPLICATION_ROOT}/.
fi