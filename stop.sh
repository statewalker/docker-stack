#!/bin/bash

cd `dirname $0`
dir=`pwd`

export $(cat "$dir/.env" | xargs)

## In swarm mode:
# docker service rm $(docker service ls -q)
## or (?):
# docker stack rm $CONTEXT_NAME
# docker swarm leave --force


## Force to remove all running containers:
# docker rm -f $(docker ps -q)

docker rm -f $(docker ps -q)

# docker-compose \
#   --project-directory "$dir" \
#   -f "$dir/docker/docker-compose-nginx-proxy.yml" \
#   -f "$dir/docker/docker-compose-postgres.yml" \
#   -f "$dir/docker/docker-compose-rest.yml" \
#   -f "$dir/docker/docker-compose-meta.yml" \
#   -f "$dir/docker/docker-compose-mail.yml" \
#   -f "$dir/docker/docker-compose-auth.yml" \
#   -f "$dir/docker/docker-compose-storage.yml" \
#   -f "$dir/docker/docker-compose-kong.yml" \
#   -f "$dir/docker/docker-compose-realtime.yml" \
#   -f "$dir/docker/docker-compose-studio.yml" \
#   down

