FROM php:7.3-fpm-alpine
ARG USERID
ARG GROUPID
ENV USERID "$USERID"
ENV GROUPID "$GROUPID"
RUN apk --no-cache add shadow && usermod -u ${USERID} www-data && groupmod -g ${GROUPID} www-data
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions \
    && sync \
    && install-php-extensions imagick mysqli json curl intl dom xml zip mbstring iconv exif gd pdo pdo_mysql xdebug
COPY ./build/php-fpm/conf/20-xdebug.ini /usr/local/etc/php/conf.d/
COPY ./build/php-fpm/conf/php.ini /usr/local/etc/php/conf.d/
WORKDIR /var/www/html
USER www-data
#COPY ./conf/20-pdo_mysql.ini /usr/local/etc/php/conf.d/
