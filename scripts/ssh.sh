#!/bin/bash
. .env
docker exec -it ${COMPOSE_PROJECT_NAME}_server bash
