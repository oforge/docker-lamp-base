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
