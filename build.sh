#!/bin/sh
set -xe

for I in 5.5 5.6 7.0; do
  docker build -t thedxw/php-testing:$I $I/
done
