#!/bin/sh

# Reset Synapse State
docker-compose stop sync
docker-compose stop synapse
echo "Delete synapse data"
rm -r synapse/media_store
rm synapse/homeserver.db
docker-compose start synapse
docker-compose exec synapse sh /data/register_sync_user.sh
docker-compose start sync

# Reset MongoDB
until curl -fail --silent --output /dev/null http://localhost:3030; do
  echo "Server is unavailable - sleeping"
  sleep 1
done

echo "Server is up - setup database"
docker-compose exec server npm run setup
