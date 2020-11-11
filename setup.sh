#!/bin/sh

# Clone repositories
git clone --depth 1 https://github.com/hpi-schul-cloud/nuxt-client.git
git clone --depth 1 https://github.com/hpi-schul-cloud/schulcloud-client.git
git clone --depth 1 https://github.com/hpi-schul-cloud/schulcloud-server.git
git clone --depth 1 https://github.com/hpi-schul-cloud/schulcloud-synapse-synchronization.git

# Allow access to synapse folder
chmod 777 synapse

# Start containers
docker-compose up -d

# Reset Databases and default users
sh reset.sh
