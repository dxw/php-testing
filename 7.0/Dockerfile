FROM php:7.0-cli

# Install composer and dependencies
RUN apt-get update && apt-get install -y --no-install-recommends git zlib1g-dev ca-certificates libpng-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install sysvsem
RUN docker-php-ext-install sockets
RUN docker-php-ext-install gd
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

