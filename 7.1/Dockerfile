FROM php:7.1-cli

# Show all errors
RUN echo error_reporting=E_ALL > $PHP_INI_DIR/conf.d/errors.ini

# Install APT dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git zlib1g-dev ca-certificates libpng-dev libzip-dev unzip libonig-dev \
    && rm -r /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install zip mbstring pcntl sysvsem sockets gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER true
