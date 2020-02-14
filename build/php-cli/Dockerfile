FROM php:cli-alpine
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions \
    && sync \
    && install-php-extensions imagick mysqli json curl intl dom xml zip mbstring iconv exif gd xdebug
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
