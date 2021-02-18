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
- Go into the root folder and run `sh scripts/install/create-env.sh`. This creates your .env file with additional data.
- Optional additional configuration:
  - To rename the containers, change `COMPOSE_PROJECT_NAME`  in `.env`.
  - To persist mysql data, uncomment volumes of mysql in docker-compose.yml. 
- Build everything folder with `docker-compose build`
- Start it with `sh scripts/start.sh`. (Or use command `docker-compose up`, use the parameter ` -d` to run ist in background.)
- Stop with `sh scripts/stop.sh` or use command `docker-compose down`
- (To check the running docker container use `docker ps`. When there are docker container running, 
you will see a list that shows information about every container. You can use the container name to execute commands.
- Connect with `sh scripts/ssh.sh` to your running server container.)
- Copy your app content into the `www` folder. If you use composer, the composer.json file should 
be inside this folder too. The `www` folder is your app root folder.
- If you use composer, and run `composer install` (in ssh connection), otherwise `sh scripts/install/composer-install.sh`.
  This installs your dependencies.
- If you use `oforge` and want to rebuild the templates, run 
`sh scripts/build-templates.sh`
