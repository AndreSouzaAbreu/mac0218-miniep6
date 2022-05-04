#!/bin/sh
source ./.env
docker build -t $IMG_NAME .
docker container run --detach \
  --name $CONTAINER_NAME \
  -p $PORT:80 \
  -v $FILES:/usr/src/pages:ro \
  $IMG_NAME
