#!/bin/bash
set -a
source ./envs/version.env
source ./envs/end-to-end-tests.env
[ -f ./envs/.env ] && source ./envs/.env


docker-compose \
	--env-file ./env/end-to-end-tests.env \
	-f ./compose-files/docker-compose.yml \
	-f ./compose-files/docker-compose.notification.yml \
	-f ./compose-files/docker-compose.end-to-end-tests.yml \
	${@:-up -d}


#	-f ./compose-files/docker-compose.calendar.yml \
# -f ./compose-files/docker-compose.file.yml \