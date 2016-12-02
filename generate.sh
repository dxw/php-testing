#!/bin/sh
set -xe

for I in 5.5 5.6 7.0 7.1; do
  mkdir -p $I
  echo "FROM php:$I-cli" > $I/Dockerfile
  echo '' >> $I/Dockerfile
  echo '# Install composer and dependencies' >> $I/Dockerfile
  echo 'RUN apt-get update && apt-get install -y --no-install-recommends git zlib1g-dev ca-certificates' >> $I/Dockerfile
  echo 'RUN docker-php-ext-install zip' >> $I/Dockerfile
  echo 'RUN docker-php-ext-install mbstring' >> $I/Dockerfile
  echo 'RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer' >> $I/Dockerfile
  echo '' >> $I/Dockerfile
done
