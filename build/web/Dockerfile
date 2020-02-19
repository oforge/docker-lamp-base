FROM httpd:alpine
ARG USERID
ARG GROUPID
ENV USERID "$USERID"
ENV GROUPID "$GROUPID"
RUN apk --no-cache add shadow && usermod -u ${USERID} www-data && groupmod -g ${GROUPID} www-data
RUN mkdir -p /var/www/html
RUN chown -R ${USERID} /var/www/html
COPY ./build/web/default.conf /usr/local/apache2/conf/httpd.conf
VOLUME /var/www/html
