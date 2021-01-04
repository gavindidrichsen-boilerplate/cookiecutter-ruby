#!/bin/bash

if [[ -z "${COOKIE}" ]]; then
  echo "Must set the COOKIE environment variable to be the root directory in which cookiecutter-habitat lives"
  exit 1
fi

(
  # ensure the _core project is already present
  cd ..
  cookiecutter ${COOKIE}/cookiecutter-ruby/_core -f --no-input \
    dir_name='{{ cookiecutter.dir_name }}'
)
