#!/bin/bash

cd `dirname $0`
dir=`pwd`

echo "-------------------"
echo "Check file with environment variables..."
if [ ! -f "$dir/.env" ]; then
  cp "$dir/.env-template" "$dir/.env"
fi;
echo "Done."

echo "-------------------"
echo "Export variables..."
source "$dir/.env"
echo "Done."

echo "-------------------"
echo "Check context directory..."
mkdir -p ${CONTEXT_DIR}
echo "Done."


echo "-------------------"
echo "PGAdmin: prepare data folder and change the owner..."
#if [ ! -f "${CONTEXT_DIR}/data-pgadmin/.initialized" ]; then
 # mkdir -p ${CONTEXT_DIR}/data-pgadmin/sessions
 # mkdir -p ${CONTEXT_DIR}/data-pgadmin/storage
#  mkdir -p ${CONTEXT_DIR}/data-pgadmin/azurecredentialcache
#  touch "${CONTEXT_DIR}/data-pgadmin/.initialized"
#  sudo chown -R 5050:5050 ${CONTEXT_DIR}/data-pgadmin
#fi
echo "Done."

