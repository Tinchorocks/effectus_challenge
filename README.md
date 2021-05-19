# README

Effectus job challenge. 

Basic Architecture [here](https://docs.google.com/document/d/1QzLm_zp9dTbId4I9fWJu6i162-ehMPVgepQwwpa2GZE/).

## Installation

This project uses Docker to run. You should install Docker & Docker-compose. 

[How to install Docker](https://docs.docker.com/engine/install/ubuntu/).

[How to install Docker-compose](https://docs.docker.com/compose/install/).

1. Start project (if you installed Docker correctly this command will do everything for you)
  ```ruby
  docker-compose -f development.yml up
  ```

You can acccess to your started project in localhost:3000. 
## Usage

Once you started the project you will find some forms in the home (localhost:3000) where you could test all the endpoints without need of using postman or something like that :)

## Available endpoints

GET /transactions, POST /transfer, POST /sign_in, DELETE /sign_out.