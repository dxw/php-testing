#!/bin/sh
set -xe

gen() {
  BASE=$1
  NAME=$2

  mkdir -p ${NAME}
  echo "FROM php:${BASE}-cli" > ${NAME}/Dockerfile
  echo '' >> ${NAME}/Dockerfile
  echo '# Show all errors' >> ${NAME}/Dockerfile
  echo 'RUN echo error_reporting=E_ALL > $PHP_INI_DIR/conf.d/errors.ini' >> ${NAME}/Dockerfile
  echo '' >> ${NAME}/Dockerfile
  echo '# Install APT dependencies' >> ${NAME}/Dockerfile
  echo 'RUN apt-get update && apt-get install -y --no-install-recommends git zlib1g-dev ca-certificates libpng-dev libzip-dev unzip' >> ${NAME}/Dockerfile
  echo '' >> ${NAME}/Dockerfile
  echo '# Install PHP extensions' >> ${NAME}/Dockerfile
  echo 'RUN docker-php-ext-install zip mbstring pcntl sysvsem sockets gd' >> ${NAME}/Dockerfile
  echo '' >> ${NAME}/Dockerfile
  echo '# Install composer' >> ${NAME}/Dockerfile
  echo 'RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer' >> ${NAME}/Dockerfile
}

gen 7.0 7.0
gen 7.1 7.1
gen 7.2 7.2
gen 7.3 7.3
