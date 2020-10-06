#!/bin/sh
set -xe

gen() {
  BASE=$1
  NAME=$2

  mkdir -p ${NAME}
  sed -e 's/%%BASE%%/'${BASE}'/g' < Dockerfile.template > ${NAME}/Dockerfile
}

# Regular releases appear like this:
#     gen X X
# Release candidates appear like this:
#     gen X-rc X

gen 7.0 7.0
gen 7.1 7.1
gen 7.2 7.2
gen 7.3 7.3
gen 7.4 7.4
gen 8.0-rc 8.0
