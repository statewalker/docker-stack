#!/bin/bash

cd `dirname $0`
dir=`pwd`

echo "-------------------"
echo "Export variables..."
source "$dir/.env"
echo "Done."

echo "-------------------"
echo "PGAdmin: prepare data folder and change the owner..."
sudo sh -c "cat > ${CONTEXT_DIR}/data-pgadmin/config.json" <<EOT
{
  "Servers": {
    "1": {
        "Name": "${CONTEXT_NAME}_postgres server",
        "Group": "Server Group 1",
        "Port": 5432,
        "Username": "${POSTGRES_USER}",
        "Host": "postgres",
        "SSLMode": "prefer",
        "MaintenanceDB": "postgres"
    }
  }
}
EOT
docker exec -it "${CONTEXT_NAME}-pgadmin" sh -c "chown -R pgadmin:pgadmin /var/lib/pgadmin"
docker exec -it "${CONTEXT_NAME}-pgadmin" sh -c "ls -la /var/lib/pgadmin"
docker exec -it "${CONTEXT_NAME}-pgadmin" sh -c "python3 ./setup.py --user '${PGADMIN_USER}' --load-servers /var/lib/pgadmin/config.json"

echo "Done."

