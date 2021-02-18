#!/bin/bash
. .env
docker exec -it ${COMPOSE_PROJECT_NAME}_server php bin/console oforge:service:run template.management:buildAll
