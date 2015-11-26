FROM php:5.5-cli

# Install composer and dependencies
RUN apt-get update && apt-get install -y --no-install-recommends git zlib1g-dev ca-certificates
RUN docker-php-ext-install zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install php-cs-fixer
RUN composer global require fabpot/php-cs-fixer && ln -s ~/.composer/vendor/bin/php-cs-fixer /usr/local/bin/
