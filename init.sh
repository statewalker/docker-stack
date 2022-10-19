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
if [ ! -d "${CONTEXT_DIR}" ]; then
  mkdir -p ${CONTEXT_DIR}
fi
echo "Done."


echo "-------------------"
echo "PGAdmin: prepare data folder and change the owner..."
if [ ! -d "${CONTEXT_DIR}/data-pgadmin" ]; then
  mkdir -p "${CONTEXT_DIR}/data-pgadmin"
  sudo chown -R 5050:5050 "${CONTEXT_DIR}/data-pgadmin"
fi
echo "Done."

