# docker-lamp-base
Base docker environment for LAMP projects

## How to use
This docker based environment can be used for local development without installing the needed applications locally. 
Instead only docker and docker-compose and some configuration is required. 

## Structure
Basically there are two main folders: `build` and `www`.
The `build` folder consists of dockerfiles and configurations for every application.
The `www` folder is the folder that should contain your application code. 
Also it serves as a share between all applications.

### How to setup / use
- Install docker and docker-compose
- Copy sample.env to .env and change the settings to your needs
- IMPORTANT: linux users need to set the userid and groupid .env variables to the current user's id.
This is needed to get the www share to work.
- Build everything inside the root folder with `docker-compose build`
- Start it with `docker-compose up`
- Stop with `docker-compose down`
- To check the running docker container use `docker ps`. When there are docker container running, 
you will see a list that shows information about every container. 
You can use the container name to execute commands.
- To install composer packages inside `www` use:
  - `docker exec -it PHP_CLI_CONTAINER_NAME composer install` where PHP_CLI_CONTAINER_NAME refers to your container name.
- To 

### what currently seems to work:
create network: 
- docker network create myweb
create and run web container
- docker build -t web ./web/
- docker run -d --name web -p 80:80 -v {{YOUR_HOST_WEB_FOLDER}}:/var/www/html --net=myweb web
create and run php-fpm with extensions
- docker build -t php-fpm ./php-fpm/
- docker run -d --name php-fpm -p 9000:9000 --volumes-from web --net=myweb php-fpm

### most recent extensions
These extensions can be installed with `docker-php-ext-install` and enabled with `docker-php-ext-enable`.
Possible values for ext-name:

bcmath
bz2
calendar
ctype
curl
dba
dom
enchant
exif
fileinfo
filter
ftp
gd
gettext
gmp
hash
iconv
imap
interbase
intl
json
ldap
mbstring
mcrypt
mysqli
oci8
odbc
opcache
pcntl
pdo
pdo_dblib
pdo_firebird
pdo_mysql
pdo_oci
pdo_odbc
pdo_pgsql
pdo_sqlite
pgsql
phar
posix
pspell
readline
recode
reflection
session
shmop
simplexml
snmp
soap
sockets
spl
standard
sysvmsg
sysvsem
sysvshm
tidy
tokenizer
wddx
xml
xmlreader
xmlrpc
xmlwriter
xsl
zip

### Typical extension configurations
#### gd

    RUN apt-get update \
	    && apt-get install -y \
		    libfreetype6-dev \
		    libpng-dev \
		    libjpeg-dev \
	    && docker-php-ext-configure gd \
		    --with-freetype-dir=/usr/include/ \
		    --with-jpeg-dir=/usr/include/ \
		    --with-png-dir=/usr/include/ \
	    && docker-php-ext-install -j$(nproc) \
		    gd \
	    && apt-get purge -y \
		    libfreetype6-dev \
		    libpng-dev \
		    libjpeg-dev

#### intl

    RUN apt-get update \
	    && apt-get install -y \
		    libicu-dev \
	    && docker-php-ext-install -j$(nproc) \
		    intl \
	    && apt-get purge -y \
		    libicu-dev

#### imap

    RUN apt-get update \
	    && apt-get install -y \
		    libc-client-dev
		    libkrb5-dev
	    && docker-php-ext-configure imap \
		    --with-kerberos \
		    --with-imap-ssl \
	    && docker-php-ext-install -j$(nproc) \
		    imap \
	    && apt-get purge -y \
		    libc-client-dev \
		    libkrb5-dev

#### imagick

    RUN apt-get update \
	    && apt-get install -y \
		    libmagickwand-dev --no-install-recommends \
		    ghostscript --no-install-recommends \
	    && pecl install \
		    imagick \
	    && docker-php-ext-enable \
		    imagick \
	    && apt-get purge -y \
		    libmagickwand-dev

#### xdebug
    RUN pecl install xdebug \
      && docker-php-ext-enable xdebug \
      && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini


