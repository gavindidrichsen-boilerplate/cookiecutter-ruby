#!/bin/bash

if [[ -z "${COOKIE}" ]]; then
  echo "Must set the COOKIE environment variable to be the root directory in which cookiecutter-habitat lives"
  exit 1
fi

# replace to use local library
# mv profiles/* .
# mv habitat/hooks .
# rm -rf profiles
# rm -rf habitat
# sed -i.bak "{s|\/profiles\/|\/|g; s|\/profiles|\/.|g; s|exec profiles|exec .|g; s|\/habitat|\/.|g;}" test.sh
# rm -f test.sh.bak