
### most recent extensions
These extensions can be installed with `docker-php-ext-install` and enabled with `docker-php-ext-enable`.
Possible values for ext-name:

- bcmath
- bz2
- calendar
- ctype
- curl
- dba
- dom
- enchant
- exif
- fileinfo
- filter
- ftp
- gd
- gettext
- gmp
- hash
- iconv
- imap
- interbase
- intl
- json
- ldap
- mbstring
- mcrypt
- mysqli
- oci8
- odbc
- opcache
- pcntl
- pdo
- pdo_dblib
- pdo_firebird
- pdo_mysql
- pdo_oci
- pdo_odbc
- pdo_pgsql
- pdo_sqlite
- pgsql
- phar
- posix
- pspell
- readline
- recode
- reflection
- session
- shmop
- simplexml
- snmp
- soap
- sockets
- spl
- standard
- sysvmsg
- sysvsem
- sysvshm
- tidy
- tokenizer
- wddx
- xml
- xmlreader
- xmlrpc
- xmlwriter
- xsl
- zip

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
