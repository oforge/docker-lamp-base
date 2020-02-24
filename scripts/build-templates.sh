#!/bin/bash
cd .. && docker exec -it web php bin/console oforge:service:run template.management:buildAll
