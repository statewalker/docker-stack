#!/bin/bash

cd `dirname $0`
dir=`pwd`

"$dir/init.sh"

set -a 
source "$dir/.env"
set +a

docker-compose \
  --project-directory "$dir" \
  -f "$dir/docker/docker-compose-traefik.yml" \
  -f "$dir/docker/docker-compose-postgres.yml" \
  -f "$dir/docker/docker-compose-verdaccio.yml" \
  -f "$dir/docker/docker-compose-gitea.yml" \
  -f "$dir/docker/docker-compose-CI.yml" \
  up
