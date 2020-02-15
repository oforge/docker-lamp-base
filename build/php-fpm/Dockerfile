FROM php:7.3-fpm-alpine
# TODO: get current user and use it here as env variable
RUN apk --no-cache add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions \
    && sync \
    && install-php-extensions imagick mysqli json curl intl dom xml zip mbstring iconv exif gd pdo pdo_mysql xdebug
COPY ./conf/php.ini /usr/local/etc/php/conf.d/
COPY ./conf/20-pdo_mysql.ini /usr/local/etc/php/conf.d/
