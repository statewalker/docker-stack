#!/bin/bash

cd `dirname $0`
dir=`pwd`

"$dir/init.sh"

set -a 
source "$dir/.env"
set +a

docker-compose \
  --project-directory "$dir" \
  -f "$dir/docker/docker-compose-nginx-proxy.yml" \
  -f "$dir/docker/docker-compose-postgres.yml" \
  up
