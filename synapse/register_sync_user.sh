 #!/bin/sh

until curl -fail --silent --output /dev/null http://localhost:8008; do
  echo "Synapse is unavailable - sleeping"
  sleep 1
done

echo "Synapse is up - executing command"
register_new_matrix_user -u sync -p secure -c /data/homeserver.yaml --admin http://localhost:8008
