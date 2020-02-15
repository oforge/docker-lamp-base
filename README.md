# docker-lamp-base
Base docker environment for LAMP projects
TODO: docker run -it -v "$PWD":/var/www/html -w /var/www/html docker-lamp-base_php-cli composer install

### what currently seems to work:
create network: 
- docker network create myweb
create and run web container
- docker build -t web ./web/
- docker run -d --name web -p 80:80 -v {{YOUR_HOST_WEB_FOLDER}}:/var/www/html --net=myweb web
create and run php-fpm with extensions
- docker build -t php-fpm ./php-fpm/
- docker run -d --name php-fpm -p 9000:9000 --volumes-from web --net=myweb php-fpm
