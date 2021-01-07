#!/bin/bash

# helper to authenticate against dockerhub using credentials given in DOCKER_USERNAME (username) and DOCKER_PASSWORD (token)

# authenticate docker when DOCKER_PASSWORD is given
if [[ -z "$DOCKER_USERNAME" || -z "$DOCKER_PASSWORD" ]]
then
    echo "docker authentication incomplete or missing: do not authenticate against docker hub..."
else 
    echo "docker authentication given: authenticate against docker hub..."
    echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
fi
