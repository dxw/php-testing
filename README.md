# php-testing

Docker's base PHP images plus composer (to make our tests run faster)

## Usage

An example .drone.yml file:

    build:
      image: thedxw/php-testing:$$PHP_VERSION
      commands:
        - cd $$DIR
        - composer install
        - vendor/bin/phpunit
        - test -d src && php-cs-fixer fix --dry-run -v --diff src
    matrix:
      PHP_VERSION:
        - 5.5
        - 5.6
        - 7.0
      DIR:
        - wp-content/themes/abc
        - wp-content/plugins/xyz

Note that we also include php-cs-fixer in the images.
