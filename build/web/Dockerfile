FROM httpd:alpine
# TODO: get current user and use it here as env variable
RUN apk --no-cache add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data
RUN mkdir -p /var/www/html
RUN chown -R 1000 /var/www/html
COPY default.conf /usr/local/apache2/conf/httpd.conf
VOLUME /var/www/html
