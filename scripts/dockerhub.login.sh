#!/bin/bash

# helper to authenticate against dockerhub using credentials given in DOCKER_ID (username) and MY_DOCKER_PASSWORD (token)

# authenticate docker when docker credentials given
if [[ -z "$DOCKER_ID" || -z "$MY_DOCKER_PASSWORD" ]]
then
    echo "docker authentication incomplete or missing: do not authenticate against docker hub..."
else 
    echo "docker authentication given: authenticate against docker hub..."
    echo $MY_DOCKER_PASSWORD | docker login -u $DOCKER_ID --password-stdin
fi
