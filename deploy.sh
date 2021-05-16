#!/bin/bash

git pull

docker-compose -f production.yml run --rm challenge rails db:migrate
docker-compose -f production.yml stop challenge && docker-compose -f production.yml up -d challenge