#!/bin/bash
source .env
docker exec -it ${COMPOSE_PROJECT_NAME}_server composer install --no-dev
