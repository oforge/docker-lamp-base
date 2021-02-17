FROM alpine:3.12

ARG USERID
ARG GROUPID
ARG HOSTNAME
ENV USERID "$USERID"
ENV GROUPID "$GROUPID"
ENV HOSTNAME "$HOSTNAME"
ENV ENVIRONMENT local

RUN apk add --no-cache bash git \
  php7 php7-mysqli php7-pdo_mysql php7-ctype php7-json php7-gd php7-curl php7-pgsql php7-sqlite3 php7-bcmath php7-mbstring php7-mcrypt php7-zip  \
  php7-dba php7-session php7-zlib php7-xml php7-xmlreader php7-openssl php7-dom php7-phar php7-intl php7-fileinfo  php7-xmlwriter php7-simplexml \
  php7-tokenizer php7-pecl-imagick php7-pecl-xdebug apache2 apache2-utils php7-apache2 curl shadow                                               \
  && ln -sf /dev/stderr /var/log/apache2/error.log                                                                                               \
  && curl -sS https://getcomposer.org/installer | php -- --version=1.10.19 --install-dir=/usr/bin --filename=composer                                              \
  && chmod +x /usr/bin/composer                                                                                                                  \
  && addgroup -g ${GROUPID} appuser                                                                                                              \
  && adduser -h /app/ -H -D -G appuser -u ${USERID} appuser                                                                                      \
  && mkdir -p /app/www                                                                                                                           \
  && mkdir -p /app/.composer                                                                                                                     \
  && chown -R appuser:appuser /app/                                                                                                              \
  && chown -R appuser:appuser /var/www/logs                                                                                                      \
  && touch /var/www/logs/error.log && chown -R appuser:appuser /var/www/logs/error.log                                                           \
  && touch /var/www/logs/access.log && chown -R appuser:appuser /var/www/logs/access.log                                                         \
  && chown -R appuser:appuser /var/log/apache2                                                                                                   \
  && chown -R appuser:appuser /run/apache2                                                                                                       \
  && echo '[Xdebug]' >> /etc/php7/php.ini                                                                                                        \
  && echo 'xdebug.remote_enable=0' >> /etc/php7/php.ini                                                                                          \
  && echo 'xdebug.remote_host=${HOSTNAME}' >> /etc/php7/php.ini                                                                                      \
  && echo 'zend_extension=xdebug.so' >> /etc/php7/conf.d/xdebug.ini                                                                              \
  && sed -i -e 's/memory_limit.*/memory_limit = 512M/g' /etc/php7/php.ini                                                                        \
  && sed -i -e 's/max_execution_time.*/max_execution_time = 300/g' /etc/php7/php.ini                                                             \
  && sed -i -e 's/upload_max_filesize.*/upload_max_filesize = 300M/g' /etc/php7/php.ini                                                           \
  && sed -i -e 's/post_max_size.*/post_max_size = 300M/g' /etc/php7/php.ini                                                                       \
  && sed -i -e 's/\/var\/www\/localhost\/htdocs/\/app\/www/g' /etc/apache2/httpd.conf                                                            \
  && sed -i -e 's/Listen 80/Listen 9999\nServerName localhost/g' /etc/apache2/httpd.conf                                                         \
  && sed -i -e 's/AllowOverride\s*None/AllowOverride All/ig' /etc/apache2/httpd.conf                                                             \
  && sed -i -e 's/#LoadModule\s*rewrite_module/LoadModule rewrite_module/gi' /etc/apache2/httpd.conf

VOLUME ["/app/www"]
VOLUME ["/app/.composer"]

WORKDIR /app/www
EXPOSE 9999

USER appuser

CMD ["httpd", "-DFOREGROUND"]
